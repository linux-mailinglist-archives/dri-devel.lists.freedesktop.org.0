Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F85354A75
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCA06E2DC;
	Tue,  6 Apr 2021 01:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4675C6E25A;
 Tue,  6 Apr 2021 01:47:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEvOHSlSM4EB+tWv8r+tSO3YQ0o9Ijl3F0LObFxZgLBZvfBKKcgYPPbnJcZTcuuvs8zseKOgfCz4oc2NOdv36jVsx1NPH5VFh14i9FPekFiX2NSpe10CSdgECp+Gn8c/y0Eg4lbvihcwrniSLccQMIFdWTNCeS7Dwrxi4scUu5hGuBJ0EubS1bJPUp7b6izjwxaKPtVe1YPCKaCwCle71CtLldbgFyhy7+g6egp5RekS2Bcahp+OFkxCyLPeEuZ9B7o3r07O5KCy1Xh51y1Mn53EVgEKO+s6WlvKJ5Zd2eOh2TDDoHnbZm2eYmz+qnrK2i16BG+LtSEjfrNI6SwNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdF+YgynDmnl5JLNG+qcY1rVFQrSkEpQxLZbdb9v2Hs=;
 b=JN+RSbG8n0d+81TwgpVlOpkyOzLbAwL/H7bZi50TharrUgFdJiYENcGqHYI/xG7uquWGdnGd2okRIFq+oHs3AhS3BUT9uVzVUwRWvi/YlD7kM5ALMPjDp9uhe7BwMOyTLfQ7zFWWWDb9zoeLuN6237xmEi9tuLFnQW6VNEOUzib8lOaZVoBTNj1vZ70Usevw72JnjwG/ZAQe7aMoBdmzNTb3/QW/u+zn9keZthOrb/+Axa03YCLJcPwFdfoTnV0oGC43g5xbYvkEpWOPR8lNjdulaGM6QRPWnsR156vS/3Zm08+F/P1ft8iV7+7XYPZ/DwMiSm25ogm1pGTuIYcAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdF+YgynDmnl5JLNG+qcY1rVFQrSkEpQxLZbdb9v2Hs=;
 b=C/IAvuY5O3pN/FwctWxTEA2JyNfSOKwDAPltcxAfEa0Sp2Xyp+fU//9A3ZqEgGY3HGGhPNy8yZ6aKlxkpBw9a3+yPxfQPMtNN6Nm1e/hc8xHjBtlrhtx5+5xe1Q43ZIIoEAQPiSMxfbZeClEY12VciOitsykyKnBEtxHKgvqKiA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3792.namprd12.prod.outlook.com (2603:10b6:208:16e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 01:47:06 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:06 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 22/34] drm/amdgpu: enable 48-bit IH timestamp counter
Date: Mon,  5 Apr 2021 21:46:17 -0400
Message-Id: <20210406014629.25141-23-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b699ee-8bcc-4073-b507-08d8f89de205
X-MS-TrafficTypeDiagnostic: MN2PR12MB3792:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB37921A67F4B5380F57578EE592769@MN2PR12MB3792.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erWk3LHyNV/8bkieu4aC7wizWYnkHLBjkI71Re0oGK+5UsMvFyRbotSmHi8WfNmK9vPdCwh6L2lGKmv6pn/TeLDyjeY/0x4ic2bC9KQPAgafqcAH90y5T2nQ0HZpI+WqezD/QrdXLjEgzRXodQ+iiox3lnrw/4+djT65fn+SctLU/3XjS4lpTH3ASKI2zHeuaJ+9hj08pdmL4q4e9PuWiq74vWBimvmShq73FMOzFvBN4ce9sxJ58qVHd1CVvjLmCMnv6Ku1QCAzVQgmU2TiO8MTd5j4IhgJMhT0dVy0aeAGtezqHDqRxCUfzxuw01iy+b0bIIobvUP7tEUOLtavR2lJhpxa7ryH327MqzQoy5qm6VNbRYiBS2KxKcryr6RdLNG7VnyPWhaZQ3B85RWnDIJSTwCsMbAY4xao/M7YFyIDEHqk6/EqzAJH3innn73xRCKP+5epnov0wRGxBEybw81GUcWWkSPk4EVuwoKHwX5vdLyHYbHWA5YNjgKrfhHrBSGVXYMqa4ca+uLlmMvsQxKdq9lfrgtDHK9fCGWqa1mQ2zlAWGEHM2FAKx00xBKdulXiD/WM+n8XAiq43kjbMBZWH0iKmV5bY54yguPNo/SA1kG0uHC2RD0BfjqqfXacuE0HQYQCfS2tJIZQSU9nQljYn+bK9eLpf4BRWM4P28EikzWWt2ELuy5uoTJcL2is
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(6486002)(316002)(66476007)(26005)(8676002)(16526019)(186003)(1076003)(4326008)(8936002)(38100700001)(4744005)(2906002)(450100002)(956004)(2616005)(36756003)(6666004)(478600001)(7696005)(52116002)(66946007)(86362001)(54906003)(66556008)(38350700001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ctp3pRTPmTJhV3ZtGzNk4qOp7+UsD4KmkSVTuxSvY2wv9pib7PIbHeymvl7c?=
 =?us-ascii?Q?/fRdhJChFEmmSwC8RtoveKUzLIMWH2BDnOHi6h/pIPt69qfMBu9E1avFFDRV?=
 =?us-ascii?Q?98FLs4v+v3NnL6p9pBDsO7RyqTZHx/airRsBbwvyqunUWtJUHV8a4Coa2PKm?=
 =?us-ascii?Q?rtA5poB1JCHw0e7C7noZJVM4O1Q+38U3Lx86IpXeMDEIUHDbwgKP2wDPmM0w?=
 =?us-ascii?Q?D2tf42+j2ISOaUhMV+DRv0u+IG4kLyHHQnu54DU8WObPXnY5bxD/HpGspJsx?=
 =?us-ascii?Q?Xa8r8hXWQqJTPbMLZdj0++PmUZUEZiReHI9mcEL8mOKsLrfyokIEDmn7USQu?=
 =?us-ascii?Q?b8/vYHhS7xOpLzaFTijmqZ9cEBeIdvPveDLt2lptJa/vPOc2R9HDNQeQBpzr?=
 =?us-ascii?Q?oJ2ULcUiyQGE26eHhZb9CdwY8BY80klq1JMBCbPMe5RLOT9dLDzCLABnjTFN?=
 =?us-ascii?Q?bWRn8Sq+q5kRLqEhyTonbql0cDadtXt59Ovj8l46O0Vu7p7pIzJTq4ELaOTj?=
 =?us-ascii?Q?t+obDIn8H7emJDP9pMb8Q+U5Dkb5tK4j1X/x+DGz1zUmCU1rLm5aMX7bQ+rz?=
 =?us-ascii?Q?BnPNo1Wl9aXY+1n29VPc35owZu4z4vlTjLO/n9nF4dmbrYMoT7kaVuW+3GUo?=
 =?us-ascii?Q?u1r2VesOAnn0KfULk3t6wkeE1HqE/xMA93LKR/yONfdL4tf5YK/mP8qS1X5M?=
 =?us-ascii?Q?owRvaAAysoLOtcC1ou4GzNDIsTJMgjVhBQR7046cjUUfrexBssKSmSrYeuox?=
 =?us-ascii?Q?PyW0ox1u3mKu4sYQePB/fN/U3+VprryEzzGsDQII6ERVB7tgVbKoOP6dL8V3?=
 =?us-ascii?Q?J8QaaPFD/u0SiIM+yz2OMIGxA1RH6PG0TU7gAVX/2NBbqspXSN3q1UvKMbX+?=
 =?us-ascii?Q?QFLilbnvGymvdK4voPK7xgfsguYHoCMAoIz7m0w2tO8EYZfkIY+qvvwSdiqY?=
 =?us-ascii?Q?K2pGURr8k01t80QaMCE47QnpBxITieOSTheyNenp9q/9oZqfoYqpDlyc+Hsh?=
 =?us-ascii?Q?S2mP272WOr+d2vASAdz3vavhvMeUm39skV3+Ad1GYZcy/wTPuHE0ISD0pLJG?=
 =?us-ascii?Q?P9FwlkE/oOZuZ18YauhHCgx5M10j9z4pbR63CEUiU5FLLqM9Yg356RkwP9Cp?=
 =?us-ascii?Q?Imt3z0N/XZlmwcHHIQmF50plPaGzgiVVhQD6EIJWf5wQfpLPHmpxRBLz3LMD?=
 =?us-ascii?Q?M88XqM7BHJQgE8O+3aBU57a4T864h1MJHrOGemzPbMjkYAmkGzcrKdBO4KEI?=
 =?us-ascii?Q?PWvBBnqOhY7gh2g8dcKw3tPjqBM4AXmG6NKhvS27httN/CYjwaV0kVs51fLJ?=
 =?us-ascii?Q?tmOmX2nzhr2Z4Wf4v25Qu/Ol?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b699ee-8bcc-4073-b507-08d8f89de205
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:06.0077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjjG98E4xZYGJeFMnfO8sVYJkxDn/0XJxfcy7O3nuFL4+NBDw1w6y/XBCKhIL3oR8TunE1yjHbU50nnTruAwMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3792
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

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
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
