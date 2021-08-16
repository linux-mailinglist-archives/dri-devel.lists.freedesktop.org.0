Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2193ECE6A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 08:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50467898CA;
	Mon, 16 Aug 2021 06:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E16898CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 06:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UVfNnRH926BZxVZ1lFEpddhfFDAIIcPA6RpG2oGN5Vzva3apwgCnmnFQ9cY66oFaxPkJHPZ54DItPyjqMq1hPJ8JCan85Sgu+d44hKBRTTQlyDt1XqbgJLitYdjEa11gQQ3QWtVCjpJhm3WnYsy+o7Lsye4zUHl4dkneq2zMoeHn1e7Fbg0IaOl9tQv+deMQI34EVG0wyZo2ePY7wnhLHG+wn/8N25BxTr11oGVQmogKe5DnmWMrXgoR31lh7mixh8pjIqPyF5Z0HnlAf9Ckyc3K/w5x5NuiSsxWpVeSnOXdwdtXR4EYDHwIzFT3zz5NtLHTP94Exw5PHHXRZ79ORg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WovERXocV7G3uILas49Gxf7nKnk8Oq3H42erZia4qpM=;
 b=fJ5aXuuZXq/OgRBfWi1EitVIMDMku9MbwH8K5imLg54dSYuBSFrIUDInsp9bzn4BgftWZhmrjd6kTCur017oZrsS3ddKzvE/51Qm2mWduTp2xBcmwMD0tZ1ocPsnPbx/nroCU3gPat8YoC0wo9RoZAdEXDRUoX83mYsbiAbEqMi3TvEcBp06HwgqM76iqGL4rPc8V1n9cwD8EQ2zKtKabgxHZHxOZzTJ4vXV7E6L0zGprsGiW4ejobRGGrz7IsiSJ8CqUV9mAoxAZ34Cr2ZP4jgpHUeFp4D71kM16FR40hIVDW1ZmLbxkfICDAR10H1d1D/Anuce/zLJTrGNzRiOpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=me.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WovERXocV7G3uILas49Gxf7nKnk8Oq3H42erZia4qpM=;
 b=DhgAI/BKPyNmpILW2Y6/xt27WMruy4TugrYeX1DEk8hQjUr/+ZKYKIDvO4uAKKX/BRzpAEq4PY4B64ByZHcpznX9tyMenat3sLSGg3HQUXM4GtQri0keVx6RoDfUF9fyFh/XK0eqSmwatQQC8ORk7KHZ1sdCAmi8zvxWzv8aF+w=
Received: from MW4P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::27)
 by BN9PR12MB5097.namprd12.prod.outlook.com (2603:10b6:408:136::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Mon, 16 Aug
 2021 06:06:26 +0000
Received: from CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::2c) by MW4P222CA0022.outlook.office365.com
 (2603:10b6:303:114::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Mon, 16 Aug 2021 06:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; me.com; dkim=none (message not signed)
 header.d=none;me.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT031.mail.protection.outlook.com (10.13.174.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 06:06:26 +0000
Received: from hr-amd (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 16 Aug
 2021 01:06:23 -0500
Date: Mon, 16 Aug 2021 14:06:20 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dan Moulding <dmoulding@me.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "jason@jlekstrand.net"
 <jason@jlekstrand.net>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/1] drm: ttm: Don't bail from ttm_global_init if
 debugfs_create_dir fails
Message-ID: <20210816060620.GA1179183@hr-amd>
References: <20210810195906.22220-1-dmoulding@me.com>
 <20210810195906.22220-2-dmoulding@me.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210810195906.22220-2-dmoulding@me.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c78f26ed-8d06-462b-cc13-08d9607bfb66
X-MS-TrafficTypeDiagnostic: BN9PR12MB5097:
X-Microsoft-Antispam-PRVS: <BN9PR12MB5097DD2036007E171BDE1925ECFD9@BN9PR12MB5097.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7YLLUid8KaJ1N/7qR6uj8jojKiF6KsvF9XNQjKsWegvQA/cYtXI3L5wpws7O7G3t3mItmzM8G9HD37g/mhnzENXbd1nqpzjuOnq8Uelqd6/BZDHrnX1zrA7hXgj4lI24cMNQ8bUS0/X1KzzlID9DfIfZ5GwgZsbiCsI5TrlfsLGUNZjU0OTnv8p+yxLHglf3UaAKYKNmd/FkdzwXEKqR8zh8DB8jB9bnniodDJ2k/Z4ueXVQYsI0f6bCO0O87UY/QZsIEYftOWzPoHBEas7yc+8+PFQ/jN6m0NelO2T988SayNMlR+/bD6/RPNQ69Hvgfowa/vWsNei64QqzwtaKmIFRtE/OYeC6XK9eOS8Kjms1AU3bJiWdL0YY/1onGi6OuCUaUi6m5+i7YaEs+zoWrA+d50QrMc1qn6LY90pHgt18lJb/nNqqf4/D/X9MwNn7kJPJ6gamDjDC4XcnXU2pE48GOSeUQh/C/M55ILD6o0TJSDD597rym8lTMK5HJtIM5prr3/A3cGje4UeYhSvynqQk0LS084UC/1PUW6g2jIH47/vH0NkPUaRDwepcdxYqkUX1H5055kfIURUPJjXSn0El1fH5tsMIhT2Qxly9wUuI/tCGCj9s8IWsTTiuLwyRObP5XeTrkx7RpT1nZan9+xN/BKUNVzjH8CyCoUAlT9afCPC32qnhRnJwDihrSXhfFE5lAfnd5naKljpsqhsE6ZuchAfmqmED3O+mJOGtgrVycGuxy72EsgEp/q07L7RagcnVCoupNDfiClvKIDj/ng==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(9686003)(1076003)(83380400001)(316002)(54906003)(5660300002)(36860700001)(508600001)(47076005)(81166007)(26005)(86362001)(356005)(34020700004)(6916009)(70206006)(70586007)(82310400003)(33656002)(8936002)(33716001)(426003)(55016002)(336012)(16526019)(2906002)(4326008)(186003)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 06:06:26.2978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c78f26ed-8d06-462b-cc13-08d9607bfb66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5097
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 11, 2021 at 03:59:06AM +0800, Dan Moulding wrote:
> In 69de4421bb4c ("drm/ttm: Initialize debugfs from
> ttm_global_init()"), ttm_global_init was changed so that if creation
> of the debugfs global root directory fails, ttm_global_init will bail
> out early and return an error, leading to initialization failure of
> DRM drivers. However, not every system will be using debugfs. On such
> a system, debugfs directory creation can be expected to fail, but DRM
> drivers must still be usable. This changes it so that if creation of
> TTM's debugfs root directory fails, then no biggie: keep calm and
> carry on.
> 
> Fixes: 69de4421bb4c ("drm/ttm: Initialize debugfs from ttm_global_init()")
> Signed-off-by: Dan Moulding <dmoulding@me.com>

It looks ok for me.

Reviewed-by: Huang Rui <ray.huang@amd.com>

Thanks,
Ray

> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 74e3b460132b..2df59b3c2ea1 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -78,9 +78,7 @@ static int ttm_global_init(void)
>  
>  	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
>  	if (IS_ERR(ttm_debugfs_root)) {
> -		ret = PTR_ERR(ttm_debugfs_root);
>  		ttm_debugfs_root = NULL;
> -		goto out;
>  	}
>  
>  	/* Limit the number of pages in the pool to about 50% of the total
> -- 
> 2.31.1
> 
