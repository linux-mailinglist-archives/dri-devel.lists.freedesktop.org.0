Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E9357852
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 01:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96786E9AE;
	Wed,  7 Apr 2021 23:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74A96E9AE;
 Wed,  7 Apr 2021 23:13:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9mBl8CyElNHZ89wNqYE79lZcbgt45MHXOKB7e3SkwHes3MumA/JMjQWD/Ngz6cj8bCug7Vg2hwgeNEE5IJOktxl0FK0U7OuaLlsTrdHYFxvLMZeQ4VNuP6c9ErwXlc+Jtes5aybeGxf30QoP0hRHCVwXNWRRnJ37eJVUQfxZ6xHSuDgbkgUl97dRq0Uu5JpT8Egy8y4wIApxCqjkC4ljn9Za77uXgO7H7DS8zguhIO7fPL1ESyYAqONhQHYix+6afF78hvtjfD4/wdnJvdry3cWKe1WsFOvswXLy1xZjCfU4Tx46aGR/miVgDFDIquz5pBXhF7HkQ6Pv4lC+oRkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwDOAVRuEegC3nUAD3TkeI+jLF1nUslZK+5ORu+Z3TI=;
 b=CpgJspO7RrMs0QPNiH0bYB26XqKvT0XpQ3vonUO36uFqwXD3T8JsluOnaUGgXLiyxnejQmLT1v/zDGlqHR1xphRQaOleyhG99FQ43Ac9SXDkzzKrK/PHU9591Bf1yTu4p2jRoZ6SG1Y+adxEhRRDp6fIDn+06b5cNU4rcnm6uTWWkUvNKtfvcECZ8lel6MSRLzFdxkScdbRtgQEylXHKcDdoGYi1JBUJ0HI5uyAvqARD7ZbQKuzG1XURqbxR7/YXd0ZqZeff8chZtGvLCTNXlP8LjBqEOr4thsutGiE+bskk1aey6bnmcUOK1wSNK+iepyoDFHT1QV8t3EEkIY1PKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwDOAVRuEegC3nUAD3TkeI+jLF1nUslZK+5ORu+Z3TI=;
 b=lRouyhA5ouburb22o7vMnOx0Tvpj5GDL4ABbcVOSkj5EUOk4IIlqB0znlYHON5jM98mcO4Dd7e6e5AwtTAjGt+K7Ec3m40h44SvE2ey4uiUJ2pRRWaLXYukiuyDaXdiaoYxpbiZ9QzovMMlM2pPpd9lalPF49Ao5XAg6cIy6ZAk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3887.namprd12.prod.outlook.com (2603:10b6:208:168::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 23:13:39 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Wed, 7 Apr 2021
 23:13:39 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/amdgpu: Remove verify_access shortcut for KFD BOs
Date: Wed,  7 Apr 2021 19:12:59 -0400
Message-Id: <20210407231259.1787-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407231259.1787-1-Felix.Kuehling@amd.com>
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 23:13:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e07c39b1-4761-4137-32e6-08d8fa1ac701
X-MS-TrafficTypeDiagnostic: MN2PR12MB3887:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB38879ECC6A23B0DF66FD353F92759@MN2PR12MB3887.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGPnsET3UHero7EfKOGtX+BBISy82kPkDkHok8q/vOsKCZVDgRzg6+78l+Cpi9ICNN/cArifZN43pjQtpe9CQ29g/KOHPHlJ6gFWsW1Kt6IC+Oc96n+GdiCSrbxy/91w9gg84BiqUhHONW4CtRbGAeUOJ/smWA+TRPyNWDJ0FAp1aGkkGPkuqSe2xo/SPOz4Kg1Xz+2gUgUfIQgNYn1fYJElP0z2zhK/Zr2Cos+vCOeAWkiS5n/JdSP4o+cAtg7o9vxWX7gmLC3a5d1j9v5Wzrzul3PenuhBmt4Zp4RULsfYIVC6CA0ZeIivr20/MoHFqxeAuI1Iu00QldFlXhsXd1FNTZEl4D3tWXZ3gp5irgo8o5Cak52TX1k5Wxvk3GSXXRIzpjCI2UvWDsNBQKoaMpB3m5N13B9b+CO8hWhv7FwDmPE0Ymd78ZttSwXLUfCyV54I4m5GlN7D5y7OMtmPaq5fBFKzjnJV9yn+wBr41iYws9D/JE5FMfsFw7z9txbQNYt3Zp4T4Th0JRVDrlnl0cb68yUEDSxTRbZg6omWYAFC6T+8NO4iN4wJy6gtj9dfeQiWCYbiz09T4fwAYPSN02biqaIzzxcD5VY75PvEKhvo3U7Vq4QVUczh8ymOogUmbSYHoPPuBWiPfFppIeWkSKlOJe2NInFdS1kUg/gjp7/O9gBOq4mQhz7NLm6xXsfy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(316002)(66476007)(8936002)(8676002)(52116002)(2906002)(7696005)(38350700001)(16526019)(36756003)(6666004)(38100700001)(26005)(66556008)(1076003)(5660300002)(4326008)(4744005)(6486002)(956004)(186003)(15650500001)(86362001)(2616005)(478600001)(66946007)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bEdhsApIgsYxADKCQyjsph6l7rPFuBTwq3AaKCGsl9IiOMv4zhbXFmc6+uzy?=
 =?us-ascii?Q?xCiF+cSIXAD3MaQujYiJoNYkVzPT4NqaU4fL1UAG0KlPBUBHyzmzKxiglS/N?=
 =?us-ascii?Q?jtpO3YmIj+FRKw92wRlFEPTfhTMO304dBcD2ODPMstv4M7YRTmWvDtS5f/yG?=
 =?us-ascii?Q?nrFOC7kw5fNpPUbsB4IYXFXM7ByttvZY2SWSlMyuoF3/lfO3UiejHdDpruPU?=
 =?us-ascii?Q?8298A5im/gGVuFYH9b0JdCwq36a7soIIP+tw4Q57A6PYAce4hkIWvuwrY5Xu?=
 =?us-ascii?Q?32zbuSVDGvMPQy1Y75EgLS4WMvif2N+fKDtU9CJHz8svwhB/KGrDggao1pZs?=
 =?us-ascii?Q?cxh9KNoojpdbYZtLX0f3Lrm8KG6SlrFdgNE3Tv1A0z0ugFJcHvZxKjZ4E+KF?=
 =?us-ascii?Q?9PFcLZPkJ3LDUc/d5zshfjg1yJBbNuhEOTTHunKTqrXQ/9QdELG2VN9FaHWH?=
 =?us-ascii?Q?vvnBqmsI+XDy+iO5JImWb3h6t1eFZiG9uBkouecSZHfJ8lC5XO8awGW4NBXB?=
 =?us-ascii?Q?SccEP7FJAtr8RI+2Xmbnh7L3YgJ0Rt2U+jLViKyxsJ3ThZgQBuE91CWUuHq+?=
 =?us-ascii?Q?WGNvc1PZC4dNmXoRGbDWa/iiWFp5DhWkHWTAuwreKBzP1xrhjFL16oetUE38?=
 =?us-ascii?Q?wlp8x6I6rChvTmJoYI8H0Q8jPtuEHf+SlvRKxfMSweXsHbSKpWN/6X5fseM9?=
 =?us-ascii?Q?lWxp916MDGB2dH7kab0SLEBi4N288FWjX3WQsQH15Ld0408cafsyhIqV9bqU?=
 =?us-ascii?Q?Ms6qQJJ5xV2JRIeX0r2tnMpmC1DPS2L9bEASbGj+lDOPRcEKq+zRAP/GpJi6?=
 =?us-ascii?Q?VHkkVs48UccAhaAXpXBVg+v6lmo/YouQPxvqglmFKWQ5D6Cb9wDE812ctZgu?=
 =?us-ascii?Q?OpI1E7Aufd39gP4lR8z7zEwODQIJK+ZShIyVR77+PcjKDqnQNLlIeDnXnb2t?=
 =?us-ascii?Q?W1NqHhXuPknIg6kPB9QT5r6Pzn1Shg4wBGeGwsv4bIr2zUGvrf8J5r0UbDyT?=
 =?us-ascii?Q?nSDC/mKLIgOS+BwOMQkQD0LksHfRDNdvLplrtlVz0HVDcJ0IZ8wZ7zhV/B8L?=
 =?us-ascii?Q?13uQmrK6K0lqWTsEbuII9RuleuOmKU64QdCTGNvnnCj7IT6ybCOg8gkNCW46?=
 =?us-ascii?Q?Xl/fmfUEfifxa+56FPvaKTba879JN3cPYSPxzq7YHi+A+KNtfZFJKb7+1oet?=
 =?us-ascii?Q?sw+7sdeK6TWp/WSaKMzVmYMMAK2itUPReth4CeA5Wv9uiJ3ADofrhgZGPzgF?=
 =?us-ascii?Q?6OYv6ZL9CB0fMh97gdTpLgw3s/p0l2wa07dIN4N8+JOv/lZ818LX0erAeJnH?=
 =?us-ascii?Q?UNV1IFxne6EvnkV2y+THmZVD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e07c39b1-4761-4137-32e6-08d8fa1ac701
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 23:13:39.0939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wizIBumFUp/lJrVFYSjGO0CNmrjY3aOrSJwsKcmsqpIFn8L+VvJ5qLkiOBxVLwbv+PDUnu/cQy8uAUSnDvFLVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This shortcut is no longer needed with access managed progerly by KFD.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 936b3cfdde55..4947dfe9aa70 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -165,13 +165,6 @@ static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
 {
 	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
 
-	/*
-	 * Don't verify access for KFD BOs. They don't have a GEM
-	 * object associated with them.
-	 */
-	if (abo->kfd_bo)
-		return 0;
-
 	if (amdgpu_ttm_tt_get_usermm(bo->ttm))
 		return -EPERM;
 	return drm_vma_node_verify_access(&abo->tbo.base.vma_node,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
