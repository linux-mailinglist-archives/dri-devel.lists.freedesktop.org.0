Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E951343F0A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4686989FF7;
	Mon, 22 Mar 2021 11:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0227D89F35;
 Mon, 22 Mar 2021 11:07:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFRFZvhTrMfFypg/KkND19823e464aBJNwSKgYSJ3EiPH29LDPhOXygCu04738rFFVBOsjuX8mdwj/9kwhA6y0ZwUMemL2c2V3Xi7ZnfqjOg6TKiNu/1XIIPwJnLK/aOC27X60qE4dLn6xnJm7DrHrnP689gfI2ls5CoZJig1ziYT06/DICdcW3g+UC7WQW2vh9wZPbSciVeMIg76+1PpX4314O9eB6tL5ULbnoBPlLZY1WLK/b3ZokBcvSRFLMAJTABSFFbzkkeubLc4w/nB36hVitHNgPcDZun0bPZel6Dk/OwbPf/T7lLo4+qtXPhMp10BMiE8aUPdLRWuRP2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSOF46vcEJCtp9l6h2ymvJ/xiyqpslj9emq/Uy9HCMI=;
 b=oeKipmyRWLgRUYTeybjF7JM9QN0fdCV62ORgLnWdJSHlZQBQlmEoyJ06Bit73+8Fy/9mGKurhgnI+UkuNtmPeBupfAXD5a7KyrUeQ3qMF39X7tTQtpSZrABQp1KUMP3dOeofS7gbGPTE8Drv1y534ilJrf45ecA4bkg2XmMQc+K4MxoDgMoM9se/UxnDQ1v0L3NLNv+LjJk0vmSdmPetZN9FNFD3icBQkXkL7o6ztPL+pjaJmp0MSxdSpsdUN5eB1ls81z7YuFNxXms/upLw/fdG0SWVZFODF0Y9o9UP6OgRa+C70yE56e/ifZMB39oX9ZeK9HdWpH8a1RSgWMh3zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSOF46vcEJCtp9l6h2ymvJ/xiyqpslj9emq/Uy9HCMI=;
 b=cLaHC3xXYVcErrml6sndYVvU3prvvr9YBJ3GI/msnidT0NCEIEgEycuiC4cyrht+8Vnj4tY/1MrOKGsxLNKytvKKenVMJYe159lZI0I5gz+MAweYl1Gd1dCxo7dhd4XS354e3hF/ONJKtoH4e9Ugap7laRDoqIEDVY307cmezGU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:41 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:41 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 21/44] drm/amdgpu: enable 48-bit IH timestamp counter
Date: Mon, 22 Mar 2021 06:58:37 -0400
Message-Id: <20210322105900.14068-22-Felix.Kuehling@amd.com>
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
 Transport; Mon, 22 Mar 2021 11:07:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4ce6c393-f90d-4066-3cd8-08d8ed22b5f7
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB48991BD51001FE84E071B75D92659@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eD7YFa9SeOSCcRUq8r8kya8AsauvfNqp1kny40GXw5SV/5vFT0G0thaboo9Ph5uv58LJYnFzyL7rt/1rBZCpqMQ/NXsaSkpeu/IBa3HMNnsSU3IrIkGw/KvPtgiwkWdUOWKYtmH9HMTtVSUXAaVTp0FYsp3V5Oo5/efV7N643Rwz01IX1vqx8vHNlAIXKnRkArS+vpiBFAk4S6tEwJqFt19MnvNsiIHzb3RLRhrVeNLKMh4UWqt9hBptnnXPJn2TIlRap0xnyu1g9RvRHPSbdYikBl50awLIx7M3zPSQhaXxZAxKdtsC5IFoBp5EOdz1EpS3vwpbeog/swTHvxtG5zBL2SnuKwDEdR6eIZrqaFYnZTtEy8s/dRcIzbVotzRL9BOIIjJlmeTBsROVtY0GnAmce2qic8zSL3BANfcnPz1c6CNfSlWXc31QHWmgE2EzOaBz5gYs0YRmcexmr2jliyWGpy4GiwcdbG1FYLr9ItWorVdCCdUkUoAZOlviO29R6fSxl+Z2vs/pDX5CH+iluuBWsAsoWPH9icOgg9kYX+Py14oOo19McAfApUDM23PwuEk4pQVaoyvcOfs2B5+tdoGBZqLT4n/xpt8p6v2kr9hYVzAxcC5rMh5vSv/GOdChnwRHOJrWx5KrFUOThEY6hGnxmQYlq9Ao2Abyc1zCsZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(36756003)(66556008)(66476007)(186003)(66946007)(2616005)(8676002)(956004)(16526019)(86362001)(8936002)(26005)(478600001)(6486002)(5660300002)(4326008)(450100002)(4744005)(316002)(2906002)(54906003)(7696005)(1076003)(52116002)(38100700001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?clSAHTVRQtauXFgtNt6UxD5Pg0v9I6mR4ocI9jSYRcxrbSJpYsaZySxMkeiT?=
 =?us-ascii?Q?D9ZcDaJypVVGQRwXiVkvuJravN/JomPsEHGIyMNU0du8jVPbk44rwNOJrC7w?=
 =?us-ascii?Q?F0h4nAtRCkDjszMngJ3Yn+zAu4syTjL5Vr9EiiodrJeQicmHHPLYamkxDBt4?=
 =?us-ascii?Q?b4g92GDhVwBfyzqOTd1CNYGpTWHnsdoY3uHkRyqFLPWn2sJ1VbBzxoKVNLCV?=
 =?us-ascii?Q?Tlwz7veSqTyHhevFyS/LSNRXdq8hS5ZWV2LlV4V72EP6lns/yLFsHfYnESiP?=
 =?us-ascii?Q?zw3lEWx8Yos315Tew+P0nLebaOZBVNac8x3Wx12jsO/ASGmlZBNjKYo+N7vP?=
 =?us-ascii?Q?mgeGpP/bJ8JK6OTsorigcf/T9QNkUb38MwJ5mCizPYpfmNNZ61Qp6d+YPkOC?=
 =?us-ascii?Q?MxbF2ic7D9BpMylHMsni25hIATZ1CmdqAezWZZ6fa9geYXynrfT3d/r7pl7A?=
 =?us-ascii?Q?F9/akM+Uizrx5fyoHv1yasjbncCqzQyriXW9/dHTmJZjV2zNo0zbuAFI20dZ?=
 =?us-ascii?Q?s5XMYzt7bj2Vp9uZwl5Vp7kBtWjkPW2bktFxsui4NeTM0GYuxofyuM/CaYM/?=
 =?us-ascii?Q?trOoV+3duCZX+r5UTr1coVp0qbvU8FO1nxooZ0GgO2dhzjYcn7V2ZiTNTR+4?=
 =?us-ascii?Q?XxVMEgyLSVXCIMnfHkYeh5tcYvEIL1FPJR0q0xdKqVhn2PUURjw5ZJXct7A8?=
 =?us-ascii?Q?DUZxzGCS/bmvXc4jp0hBU4NzxpRLIN4WUlOWNGPLNXAODJWYv52sIJ+x6H5I?=
 =?us-ascii?Q?r7YNI7I/QONRANmMYFkqPEPN9VK8+KoLpovU83iFVfH6pXQtqXOmle6qBV+T?=
 =?us-ascii?Q?JpbrHgl6vlHuRvEFuIiIRR02+l8O4PFPUK+I+0Pq9ABITcbCFKCKzMIlshwO?=
 =?us-ascii?Q?JGDycE48KkMYXOGEec4g2r2rSkvUfbk8fYT/4UOlKhaKejYAHaPDUr1M75Dr?=
 =?us-ascii?Q?BTCw0N66FqxePqZ4Y74pKtSPUdLcY94Ky6itWN8Vb7FOiC98g6KBYcClEoMn?=
 =?us-ascii?Q?4U7AyGYY88c7pojd6MNg3CQbDFLf0rZPrCEaJeIfbMFgWTleqq5BfGY/AR9u?=
 =?us-ascii?Q?yVTvainu+Wznq8K2skTBky1ahZLpQSaddmDFBuBwYVGaHA3ZAVIxNglD58i0?=
 =?us-ascii?Q?u0LdVFhL7nqwk1QT3gJovx3jox1m6PvuVf7p/HdYq28lzCGqVMuuotigBdQg?=
 =?us-ascii?Q?Fn1HO738Y1qyB3JeDWnjjCN4oxNeJ6WiUKw4SSlRTYQUj8xJIglzcvsMn/tb?=
 =?us-ascii?Q?ccTtmCTefnOOq1yOyCtFuW1i66T8x7hwDFxZe+opjiELwJruJH9ZLkccu260?=
 =?us-ascii?Q?bnjsYoQlq2jEPeNUKX0zFCz0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce6c393-f90d-4066-3cd8-08d8ed22b5f7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:41.2785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bpXhkettOrUwZ4TsMno4fMQpbkAXaZ1/RXmIoQXNCRjhZX+aYmgNGBEuAynWxfFT8Uif5/Yek+dFw7734Kpiyw==
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
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
