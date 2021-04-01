Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DEA350DC1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5876EC47;
	Thu,  1 Apr 2021 04:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF4589AC3;
 Thu,  1 Apr 2021 04:23:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y6HbdGqUMBUGhtoj4F2dQgfpyk/wkKLgDSID/z7UJWfhziTrsbTVfg1LVgJ7bUytTDf+kf0ZMEK3jvvQytvo1VKiqS9cQgggzcWk+RTZQ4xcG9AeTQ7l8INTNLx0DGoe5ws7af9KL4nv94gRc8a64uzoKGozkFrgbfOIx6SnE/12lW/XGfcUNOq7SOKwFMpBxvEHc05VGYLxiL+q55HDht87UiJP+fhlTHX055XwOAcPkSYoOOd0ayUIy1+Eav62cqK5CI+WDE8anmtwwxoFWD9G+5IjkKCJIze/3/LAaFHEFu6DX8ZaqwGwcpDlSfQ78NRRoVBZAoxCDHcg2xu3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRynwike0Eoer7463RqDsyyxqq8K0fg2EBhin9ntt+c=;
 b=KqupkclUxCcjF9CpHlvqxit1oBu3e2Ns2KI5UbvOdhbQr64XTiZIZApF+dnNQOgOKuGTigVXjgPKIEOMmUkRw63/YTXsQoUIvhPx+qc2imCaNmL4FcW78cYyZ68MSyDbXc6Shx94HH39R7R5qPv5kjLULeF8Cal30AwO5oVtkH5FVPK1NEudCGyLvrSIcj6KlzDlMLC7IJAj9tbengm0A/HVy1xcnWW7gSFPhXSNFPR0Is1iHlg25MJ1eZLQ5xa1SQAm1AHsHV5JWwAs4yzTroVQLJsYFwlcFWYqIXw3dvm+bK70mGEsYmlBc4XpqNI8fsdbsQ0TYxM3Tv4FNMc7ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRynwike0Eoer7463RqDsyyxqq8K0fg2EBhin9ntt+c=;
 b=eEQR2R5+DMaIOkhi+MDt3tIRm8JVJx+lHHjrIdyTAP7k2i+p3899hwnkxA0bL/uL/oCkw1xhGMe5OK2U5WrDHs87lSSfNVEvJvQ3JbarnGD2igr/9yojyRTWS8Puj8Oq/1Vr4/Vfd5Qq3XPlkK0qe/eR81XjM96VAL8A2w7MKQM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4222.namprd12.prod.outlook.com (2603:10b6:208:19a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 1 Apr
 2021 04:23:03 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:23:03 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 21/34] drm/amdgpu: enable 48-bit IH timestamp counter
Date: Thu,  1 Apr 2021 00:22:15 -0400
Message-Id: <20210401042228.1423-22-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:23:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86ad873f-bf41-407b-2623-08d8f4c5d708
X-MS-TrafficTypeDiagnostic: MN2PR12MB4222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42221FFB0EA128E555934512927B9@MN2PR12MB4222.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6nRCEha8LYu57uv4InQUkL2L5TE/oLdLu9WySWoTJZ+SNLSYVFRv/1D4mtlSrtdflnFy3Ddgj1U9Zm9I1EDr02tGQaW9DSZpaJGlcrtDKNqu/26Z5uGrj1K3voplQcOAf6qhLbWmUUX9OYoFjxiY3aEmjdg2/ykH4U3N7ih6H3VKGdHP9hgwDdBqZkokEw3R7165pvPL4JjAoYQ656w6KFZwKFKozpai0Anec1rwlaEB/nSIQjXi5UopESuXIAMgNZZbsOxAuHV5vI7bsj7NNuUSjug+0yWPxfcvx7Pqp+pDcwVHXQzNQK+S6VW0tOgJUNbReeJedaSUIsx+YS4DTit/LjYd7PE1woF0k+FiOaBqa3u5rh96eNuaQTGIdtoYX0G+BuZcfDbAdTcc2OzHxM1U8hfwxyOf0ubWUNirkRcWrCptqajfZxAOdY0gzNg1M2Oyn7/QyV6H5i9Plo7FHpvGbvy4QhbmZo6BcPY6LLWQ9vpsvD2lJdc18LmBWqjTFV/ultBMfpS2cJ9lujP0E7FrZoW7KwibXEmNkOcWl69i7PnsAaP5ni6+gFh/VmZiXXu4DnK7KBN1SGl/Ai97jkfWNmspw+9d6oWj2naiswjyoJv1Wza8mXGX0iD1fLmQv/MJoUj6oswK5WY6Y3bBBa+2B51Nvyg2nGn2GQJuaCU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(1076003)(316002)(52116002)(66476007)(38100700001)(2616005)(956004)(54906003)(5660300002)(2906002)(6666004)(4744005)(186003)(16526019)(4326008)(450100002)(66556008)(8936002)(36756003)(86362001)(8676002)(6486002)(7696005)(478600001)(26005)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CnWNd7bwk2yad9U5sv6zbjYJ3wn9uhIpffpUMmWNXmQSwLGXSUnAIsIBCZri?=
 =?us-ascii?Q?WJj/gQ5VyjNxy4zJ8qE+8yd1NxDzSW51m5Ynok46Wu/Kt63pnHGVTC1wkcLl?=
 =?us-ascii?Q?qclAXE5aS710L4yjxE8PNklvOnIUmpDa2iAzt4xBhQJ0oiPR1n1J//F761DK?=
 =?us-ascii?Q?PkR9lNZp97tsStpgi2y8PW032NlPOQoHB5Tp2of+RHSYRpftav57XdK5PI8A?=
 =?us-ascii?Q?b7rQjFPqZnjuuKR8Zi1kQA2v1d5ULiF5bKkhCEgcb3fnOBGMf7xyScHcDyll?=
 =?us-ascii?Q?38naM2c9kdSxKhzktzAn6nW3k61rY0QZ/KPv8OoZL+LN8W3PIVdO8LsvLfwT?=
 =?us-ascii?Q?nekYX6NZfdH81IGwFPDTfWmNwEBiUeSoM9gIcSNTn5Nijwk1N35mwrrSgWNV?=
 =?us-ascii?Q?Cv5LgrFPLhCIa7IJPX2Svo4h6JC4/gSHSv7nEyH19nH68sVG6QyvXBx/Z3YZ?=
 =?us-ascii?Q?8mpifxTgbrXYLOx6lrY1yOF4eeWMkxh9rJEwwzoNofy9Nl0wGG6SRXRyqaXn?=
 =?us-ascii?Q?jWhEoOj8O4Oa+rWQYgwfLZkSasbcGGlCdAbpGvsjC6nH1S4xuGfWUmoISn6W?=
 =?us-ascii?Q?7BnCXzYK2d4EoCG4VTLMNr9r9vCxzZSkwzIIqVxlARCfsF8apZZAbx1CqnmG?=
 =?us-ascii?Q?sV4FhRJdVLZaWn0Z1jNcvtwRDKDk85Me+IlGTDHrPyjP5jow/N5o8s4pScFN?=
 =?us-ascii?Q?Jn9md+KrKI7BjpKDiBvhWMl5txmQZUcturvKzntGEb9LrRrEYiRzUnF8BDyY?=
 =?us-ascii?Q?7Ox0/o1JoHSfv5q+NBR4z6w3N1uS4AqUo0FPuprTs8gzhKv+dL7e3jfF2SLF?=
 =?us-ascii?Q?y8nPSm1Qnm1un3wDYcytWkz1RX4h7vLp62F0GnhRjIqEVLdYaIvPvsoOP8O+?=
 =?us-ascii?Q?axZ/FCwVf5oYUBWS9qScpzpZEaevajz+roNQa1qvzg/O2VB8RNODzWIwGkFS?=
 =?us-ascii?Q?8+EZM4txHNaC48jwrzlZYTCDuJifLkGBoGEKn1RKPgiFNGWY2qWxeP5fAs5b?=
 =?us-ascii?Q?T7yWf0tUHZpxmOdlMHXc0MAPzUoam2EeytXSeGYhCLwa+ItCe+WZq2ToL9me?=
 =?us-ascii?Q?oGOzis5ZInSKOQMVuC05qpDkP46VyAM3/lTEqvhdSDXVRi9Di3Doh/JYbT5P?=
 =?us-ascii?Q?LMOSoPnfW7VoMSDw7PTyPy3gb7ciM3/+166FZjQl3/OSXM0PjyK7pp5iBhAR?=
 =?us-ascii?Q?M2Ci5JifG/ijW0DWRJbEwgaeEg/LGiigcfgXm6goySnCyVJxp25b38+9l22+?=
 =?us-ascii?Q?X0EOfBmU6Luq5TSv7N+9IPuvbZEr/a334TtecUZQkAKp8FiVLz082FQoxOdk?=
 =?us-ascii?Q?VqaokaLc+X9NIpE9E6G8LVFs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ad873f-bf41-407b-2623-08d8f4c5d708
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:23:03.1811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K52Ozg8dBvMAYF2Ck3JDoQHDQ3y78pAGzZOxmMEt3Q9ExOs3y0pUYdDxSNnlm9TkQCSdYQJJJbeIy/La0BF6fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

By default this timestamp is 32 bit counter. It gets
overflowed in around 10 minutes.

Change-Id: I7c46604b0272dcfd1ce24351437c16fe53dca0ab
Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index ca8efa5c6978..2f17c8a57015 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -104,6 +104,7 @@ static int vega10_ih_toggle_ring_interrupts(struct amdgpu_device *adev,
 
 	tmp = RREG32(ih_regs->ih_rb_cntl);
 	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RB_ENABLE, (enable ? 1 : 0));
+	tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, RB_GPU_TS_ENABLE, 1);
 	/* enable_intr field is only valid in ring0 */
 	if (ih == &adev->irq.ih)
 		tmp = REG_SET_FIELD(tmp, IH_RB_CNTL, ENABLE_INTR, (enable ? 1 : 0));
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
