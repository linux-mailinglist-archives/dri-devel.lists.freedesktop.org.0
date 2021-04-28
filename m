Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B221D36DB19
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84AB6EB9E;
	Wed, 28 Apr 2021 15:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 912636EB7A;
 Wed, 28 Apr 2021 15:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaHOJckFRjLU6pUB94C+ynE+/Io+pSimJXv25+ZvA0xiI3R+s56u5y6z4I5lqCucBwlPIpXkIvW2NI71fO9kEdFIQTkkUQksI2WI5reoAq9YsBiwPyDOHRhD/D27kzX9jeT7sBCdU9v+owbJfrQjaQHnsWbrBO3Q9XNbkUixAMEfs8oXGg+C59UTodUL2ciKm/DcwM21c5Y54ZAwgldDgYrXMe6G2JW+KNwt1ckHyw/xhPDB3JOWT9kLopOJch4bZzG3e3sNy0CHrAxzqfJnKo1Ozip0PMJOhhO5iWzFTSPPd4yZx/hWtygrlwOGQvHbha+zJEsTDqEe2oYTkAo8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FEL0be6dJV8J4R16Kq8tDPjvIpvPEZ1uLevXHJGFeI=;
 b=XP4amdCIZX1c5LY8ey2tpCX3GCCrjigCWxYuUIianBr+QAHTrCSJ9kqag5ROzI5IinV9p5I5/MG8SY+ycrEoCyx3df+q5B+qFSSNQ/ScnD20TkBQafjFXuTuiwUmaExvmQ4U0PVCXyedf/Dgpemz7SnRqOJcbPF7c4PB83Pb0EW5OszQIsplPUEvtYXXPecWhAMPGXipFFiQGSOTO22NBLiDPMkWx5Gf7gAqT6NFRH/TW+AdRq5hN7zEoW9IywrNxTPQtPU0HjgSk6TKsWzpW8RQMckwOVaWGxIw+oqdYq7UJ+iwPiH0WPCg4diI1vMu6liJpXtuoo7nfZIzv1BKMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FEL0be6dJV8J4R16Kq8tDPjvIpvPEZ1uLevXHJGFeI=;
 b=rUQ9I5La8HDRikIZ64dEAX7TBB8BX2uH8RtX1mq4dtfwFWNQWLBJBwPZwBvz2CpOaVKR33BypbkXXSUxDZiBJczzmP3mQdtvymc/88eoNCFlhssgMYKZMnXPBzqLMfjZKMufCgISgF/LWiLHPiuJQcx98LoaDDoyZeIhqLruczw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:20 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:20 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 27/27] drm/amdgpu: Verify DMA opearations from device are
 done
Date: Wed, 28 Apr 2021 11:12:07 -0400
Message-Id: <20210428151207.1212258-28-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9d01b08-cd96-4b03-eeb3-08d90a582881
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27499DE5B06BB3C91F9FEBB3EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G6GAeYG7R8XbIJYNM79bE/7UfV1goPj15EZtgbmcBeHch34F7xsTyeODyCLBBjNw7HIpJa9xQr2dMMQOS8cO3GVqIDLbTOdAP8gVdSwoyrJ1Si2wR+1FoSCTAgJo3XAdTpzkCrMe6LPUlZnUCKgCr47mbiHQ14XJDaVcxFFL2OqnO62ImL04yr2wjlUDC8kUakieE1GBjIvJ1rJC/JheKWE/s4eHuA7vtVxe1cDpK/RCw2uq+yjBv20L3rfL9Jjo6GmEAUclAHcdA0gs74xNe3dpq6e2zUQuFfUuCBb1TUU3kKM5/Jga02IjdMIppmHdqfxlX3a5j2WgDyr1JHCuLHgPN8f0uclx+r+169U26iog+a9VKH7r36GKTbF56tYddii7qC4+WeDVr+Dq6GSs349Ib5zYbEDWAGLu4W/KNi5O3pZhAOSm4OXamHmMtF5EgyQ3GLLC9MS0TyoTzpuMpBAyWzCDAIUcovKLZrensv5VRqifpZ/rAGTDRhildJCxiGL0ckQns/Cz0fOmshWU0pttqLTpGkWzyMtdo3KeV6ytD7gKfMjklubODLBb48Gie0/Eo3gH2fgZVJqcGisfr4hBnA7PBQQzH7WK4i7MDxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(4744005)(6666004)(6512007)(2616005)(1076003)(15650500001)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PrGeHb5s5c+48U0wNqWAwlYImvCey+jXYHPeXzfAlOVEvGVJ2R73e82tsOWb?=
 =?us-ascii?Q?D58KR6qA7+t7J4pA8CTpH+xh/ERoHIAhUANa+fryxw5+FRI19Js5SJkpCWHm?=
 =?us-ascii?Q?tyLpWe3yfvG44I1KWQmAiKIxY0ewZHuvwNlrTw3pZBQEDLnSx9yMc3zaBPwx?=
 =?us-ascii?Q?XwzCWLgKyNGw1WRKIXv6tsEo8LeKIKsspBQseBRNR+wZMQN5zknOTzfmNT0s?=
 =?us-ascii?Q?Ra89IXDlJXSlOGJRaAKC7LyFtQ091PERNo7WSXekh7wugTAaCujJzsenZ2Vo?=
 =?us-ascii?Q?zHQCNx+/IN2iW4f6wAu0G+o/LHf+fcKwYmjpaTkb+FNVa4RCukx4LzaT8TaT?=
 =?us-ascii?Q?runaprSvM893bcIw6opGWCgDdZXO3p3x2D1hSidTHwDoYDxFx2d2xAamwIZc?=
 =?us-ascii?Q?bQHYC2B8zN/yteGbKy0kpKOk6FRAfWd91CM0V1HI3TEbEmWaqw+koW/5uXFK?=
 =?us-ascii?Q?Nk1KcUJyZRg6CkRGCVYQQpJckxYH/qqgCuGVbY/IYTc8769OdWK1t+pM15cQ?=
 =?us-ascii?Q?Ii/aDJNupXGhoOAmfAJeAlaQoyq4KHSuX0Jg3azLETK1QbB23SoCrIcncQBJ?=
 =?us-ascii?Q?Ckj8LJTkyO+rwVYdTh/LcZZF2ph5Ke7/GKHprhc+X5yZIfdJ4QMofsOubjQb?=
 =?us-ascii?Q?qdgfYwkdvpKl5ukMXR69t65ffOBlZe/FGR0h5/aKVjaQ3x37LcGNm30rSiAL?=
 =?us-ascii?Q?buCygEKUQi29NrUDX4MbgVMPiczzHrjEs1D3ArJvyvJLJctrD3hW5uj3YNTO?=
 =?us-ascii?Q?0KvNATkyW5bKLoLFA2ZbZUOar+AJZa5iHldliPFs+KWt0a9Te3VxH7AWYX3p?=
 =?us-ascii?Q?BGRaLERSjy5in9qGB41d2Rb/hLPhxY+nrPTKuTLYuG+eMwjIh/2Bfbxf35oa?=
 =?us-ascii?Q?3qV6tksYKFsQPT40bSMTCqulCHjX8D2RT8PPDAfV186oQbo+9UiFW2/x2TnM?=
 =?us-ascii?Q?jYwytjau/C70EuqLmzWsPcdAicDdemZVJXE5lm5qqbAdtMK2At0/JcwQXXnh?=
 =?us-ascii?Q?gEtHFE65Bem2cPLlnNU3tMYV4o66blO31RHMk0CtgO2fMHxPUDXOxBy7gF+k?=
 =?us-ascii?Q?xr5TwH7a99xgm8cdNsw2Q+rWPix4I3DGBrpfLezBy/QuqhCdwcDzqqeFHh5M?=
 =?us-ascii?Q?K0DpqaD2am2xHzSutSBBWG145AF4MAt2sHR4BbH8RZvwZ6SN+WimXpaRNK4C?=
 =?us-ascii?Q?b7OHMS7fdEWauAK9cD0/fBEoX1IkLBZfWuxcNwHBqBTwCn3HhJ71u6sSS9ID?=
 =?us-ascii?Q?wzrADZ/OZFkNdhg40AkeM8sOKfaVBkHBIMkKavLdsYUnpP0SRhfI7bjE9U6h?=
 =?us-ascii?Q?UCUc7a4ZaWwBH8nsofaIhhfjC4u0MlJ9oETO2w3r4VULqUBvXNy69XEP0jKN?=
 =?us-ascii?Q?eFvMEt/7dK+5ciGcug5/xa9CmcBG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9d01b08-cd96-4b03-eeb3-08d90a582881
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:20.4808 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z70l5v/cgqpWRsTmNRO1i3fEHSy2TBiVb0g3AuHgnPBrwKwDfhXzRJBox8ySQcM4NXg0aY5jibBj9ynxmOR2ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case device remove is just simualted by sysfs then verify
device doesn't keep doing DMA to the released memory after
pci_remove is done.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index d0f34f230ef3..f3e8fbde62a0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1258,7 +1258,13 @@ amdgpu_pci_remove(struct pci_dev *pdev)
 	drm_dev_unplug(dev);
 	amdgpu_driver_unload_kms(dev);
 
+	/*
+	 * Flush any in flight DMA operations from device.
+	 * Clear the Bus Master Enable bit and then wait on the PCIe Device
+	 * StatusTransactions Pending bit.
+	 */
 	pci_disable_device(pdev);
+	pci_wait_for_pending_transaction(pdev);
 }
 
 static void
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
