Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71025343F26
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76736E1D2;
	Mon, 22 Mar 2021 11:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 658EC89F35;
 Mon, 22 Mar 2021 11:07:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qs2vOBobAE9wcvsfzAEBuTxKUgJTY4Bsap0CBxFLPP53gg1aour4h7ki42M6kMpdvLis55LgiJVV4hc9ffInSpZVb7d9Wfe61Xm5lhTzkVD3qFOErW/jkauri6fltoBykO0GBp3SgTok6kBzeQCoLJN7lsynoJ32uxYtEbE/4hitbJdbrlnViEl2sezIIyRyjcYW6cWkfBrhpMK7fBx4fej3s4GtnmeQdoF7xU12a/cO53JQhDT+/QZv2Hf/qw9HQdBAf6KxFXJo+/h1m3Nv3G2OQvdyL4MyhyRwY6AjUKLMhV8TDZhsvjel8YHO41PDsg3uhOHefJHRtHyDNF2mxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAEHUI5OL68JjCeuRyb1wAw5q/46pYRqvaZUcxEN10I=;
 b=fbN64gyJkIEl1M5OdQ4tuqTMhMTgpaA9Q4AaTOKHim8Y6ioZlOPvccvVo36aG/oXAhnTW5/SLR5UR0iCc/WEHtQ98sBG3bh6wK10G//bvAGNF6CrAtVS1yHfAu4AmRVhwEHu7TC7PYypcpsLnSty5Gf9E0d+476QV7Z97Yhi4dcRTqn155RAaRsPkjf/u6iJHwlWEgmACAr4T+5PLTX+bZOYj4qtvGQ/8Wvwr+LiPvtv4+dy3GaZvj4dCXRq87SFX+tcbliwJpeZX5jzZQ2ZRL9HIzW1oFnPB+sEZXxZbhos9uGY1pD9WpjXEv8nWevSQ4F7GQ2cPq3M2OmJAAHqjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAEHUI5OL68JjCeuRyb1wAw5q/46pYRqvaZUcxEN10I=;
 b=dwlVVJuzaCD8SPpljIiGiCyNv2YoF83vyWuVzL/zkigCMokQinxF5Pkt6Rg7uhvu8eKDZw2h87GqAe7qcro4BFLTasD63DKDRJXoeaaTQ3Rsas+UfQIyyNk1KXUcisJY3QXV7joOxckS70Woven0i6plpHUsPu2WxzPWMYRlPXg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:45 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:45 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 28/44] drm/amdgpu: add svm_bo eviction to enable_signal cb
Date: Mon, 22 Mar 2021 06:58:44 -0400
Message-Id: <20210322105900.14068-29-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 063cb8b6-dcf4-4632-e684-08d8ed22b821
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB489918D4F3EAB6296709431492659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ks2v4JIGAIMJav2HQjMBEtIDnJT3ADbXZeRYLQVQtZMPY1VHJrIs/GyfmDbImIaWHb+nvSpRIJMllRsuZG41fKqdOpfR+48CtXF3tlXFnudMyExHRZPfPkUcA6q+to9fxqdk4Z0YFt1ofUNngVwEsQkflKOz4cvr04afEwVGq38wW4fsCJI74LGc6wzscx4099sD4/gfl591NUo313Ox0uF/CsP+K2JrHGlpZgZPkibuL5ml1xxlQRoPnVHe6IeRy3FfgsVmAXfjBQdx66MqxHF2GLLBZUzpfs/NEawNTIYpiXP55XsEw6t9RwKFz+S7gAIIyW0v5YPf9AnRJSpr2ICK29AevhRbGy58XBoLBMFewYQVrSorH7cm4ig9Nvfhn+26m7giEkhc3GcoyK1HNU5psJ9u0kOviaSnnBheZGaPzWdYg+17d664AcVgRUCz4G+Zs2dIdC5NJmYLF3VzFHAdN8lxGcVi7UHi1/SXhq13GSuy6nU6/h21AIr83hKLPgvHIcYqKc/aHXRta1D7GY7nUHcxTu0KfFhc0DQGEmnMwM9kJitVO8LMyPRn8GwfPedG3Q2V2Wisng18gTBhoMctaultBIQrntdYhOVJcO6YZAbXTF2/unzk9F4T6teV/mVc71DnEElF/XD7tvNMEC8aX+2neLDpScgLgWJKsgo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(83380400001)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(316002)(2906002)(7696005)(1076003)(52116002)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fmMOyC3XWtAcv3dnyvEv1fW87R1winQOJXIvKIrwlMzNuXy2uUT10e6EGAHB?=
 =?us-ascii?Q?O4HbZo6+2pNb4gJ6EAcXgBj+hc/0NqfJ2F/tuB+mG33ReKgFwN5jHhzvd/xz?=
 =?us-ascii?Q?A6TMBbFJbNxetXtKchbN+uUEtRXM0TKtuHv/id5Zq2vQMEkXO5hcrsYoyHnp?=
 =?us-ascii?Q?SVco59yoakaMKpcsU8EvKfD/i9Ij9R6DBYUhs1iTyrw4YShlxJO0vOtzlat3?=
 =?us-ascii?Q?I+7KW0I/zEk4K/nQKBwyLN9JHqy+X4WSNBEXEYsgCI/Q8t/0LUjqpQYZXuEC?=
 =?us-ascii?Q?WwU649n1arqyzdoxn/dMRoFlaPEWa7xTk8ViaFV7gI7kgdmC88ln2+ogKHH0?=
 =?us-ascii?Q?a4T2p87yuYaQWvGpMMfynvPNIVwYck0nVp1EmfeZtOmi58RhOEEf+5Nfl0TK?=
 =?us-ascii?Q?26e5k87YwSkddxRDd6TL4XrEyx5gSZmzJtZgW73/B6+N8zjSmKIVl+9LWPHS?=
 =?us-ascii?Q?f/xM8tnqDRMfWBC3IsICSJ49ZewRtut82Va5CchIMVeWxHf1246peFIqoChK?=
 =?us-ascii?Q?eoOr5vWRWKsFxJ3nxc7rpFCWqhhPQ5knd0+HiDkFcKGCOnT7ch+KnMrdg24S?=
 =?us-ascii?Q?9o36eG86AKZ6YfU5gHMYWdClrvtbOj/9lLNmAN5lY9MevvC60C6iSJuX/zls?=
 =?us-ascii?Q?7LGzxC4f5pd8y+E2/3YcNq2BpJDKriS2oELQWt8HDfidmf2kUpTHiDaMPP4f?=
 =?us-ascii?Q?gZm69DNYILdWz1G6nexHvqHYxoe1wISczotlmfNPDvci05C+AxuW653bPtXg?=
 =?us-ascii?Q?RtdBm6/naA1Ja9Ajwgp8DTv2Xd6ZsrYgbdQWWoEZAzp4Yo8qAyqniwzUkoZ+?=
 =?us-ascii?Q?tMRv3wcg5z0OGYSBdAN9voxHmI1Tx2AeVpxQZwkam52RgNlealoow7+aozOr?=
 =?us-ascii?Q?zVkH0faHSbsMqd4LL2/+X817rPKQgpc0NOQhrdS54ZGqkdMrD6pM1wu/2e5b?=
 =?us-ascii?Q?H1Qin21Qh7hWE7j6M6DX2GjNlzThYc1yNbxPMOG648FxLn/2E8hH8TQrdBJz?=
 =?us-ascii?Q?wail+bNE1I/q39e1pvMB/JQm0kvX8lZCrv7ysuPxa06CGBjKrDNeMdIAagHO?=
 =?us-ascii?Q?W/baPxet/pdlpBRFo8qlu1bByoekgeXPoeXgT3K7vMAwwND6/lMMi9iNFSpV?=
 =?us-ascii?Q?aMJHi74eWwGKjmOwCG/4IqOF7Gmo677uXMt25yEoJNm27iDocOQtCs9psXjY?=
 =?us-ascii?Q?ix6inWtYzVWxZeQt+t6ZZuXFGhLlhij6OQhk/VbhynF1Hp1qF0djfJYfTGOs?=
 =?us-ascii?Q?d+DB3UO16bfNLuKe2Qz+i7A6Rb+S+9e7gcIvqiQH5qiPKAGoP8vZxxAlavTl?=
 =?us-ascii?Q?oQ+IdXrKyJ8Rr54ikUBBKwCE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063cb8b6-dcf4-4632-e684-08d8ed22b821
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:44.8677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpQvr4so2M+iDg+VozzUcLHPeTpGY539ymDe3j9GzQamC5O4hVO552tZU9JBzFeXmqOq5iLDcG3+kDLC8g3nAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

Add to amdgpu_amdkfd_fence.enable_signal callback, support
for svm_bo fence eviction.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 53559643c712..1fe233cddb20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -28,6 +28,7 @@
 #include <linux/slab.h>
 #include <linux/sched/mm.h>
 #include "amdgpu_amdkfd.h"
+#include "kfd_svm.h"
 
 static const struct dma_fence_ops amdkfd_fence_ops;
 static atomic_t fence_seq = ATOMIC_INIT(0);
@@ -123,9 +124,13 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 	if (dma_fence_is_signaled(f))
 		return true;
 
-	if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
-		return true;
-
+	if (!fence->svm_bo) {
+		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
+			return true;
+	} else {
+		if (!svm_range_schedule_evict_svm_bo(fence))
+			return true;
+	}
 	return false;
 }
 
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
