Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5D43FEB17
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 11:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 956066E49B;
	Thu,  2 Sep 2021 09:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772276E49A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 09:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3VsTxR5qY4jT9+RNbU9qNcK5+KbX3/3v3Epxi7QmA1tON3aE79CWI6GtN395re0Qye55e1CUhoa2eiqIMvnwlzCRv7CULVCjsKM8AkqO+oVBUddR1xtVr/Rl2esO0OGTAJtcPRA9Gui9OhZQ3nScuaSixslNqzpR4mNtd1JxsP3bBpkotExzTmXU9fUFcc5TNpbE0a/gUp4s/SSf2vEZ85VxPcVs02oRbZY7iKOOQ3rOMDxAGEH4OHp/ar/+SSD9KwZlUND921JSP0WNCb6pIXpwUFt8J1ucEO9hfCBGfFm2uwbD0JpNbqLQ4FQnkBFKr3PJ+/P5gYL+epuzAxG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=msUdJV0VyuIbQTq9soaOsA9oyMZ5p8SgsmKpqV7c+h4=;
 b=mP4CPFzZ5NS3wWddtzNE/g2nH157rnhm2zFofeT7M0VM/xQpoAElpVku9dHGrpB83UidRvFiKI4DYCGHm6UWx+oguzWQjY26rBy6AsQLydAcxTYWL0QVHok5mb7NrHU+P+vKRJcXoHZhvEwsIj5DM7uX/NRClxqrOrgxXu2p0DXHgzqyCgLaNueWB801jL69YvWYp64Z2T+QGrhWfX5+EFx8wAzjXNN4qIor/pm4Qt/oEtPPhaZC/DX+uWiSx4NxltDPwI8voNhXBCfzQiGFNSH10jG0sgGYG28nbjnI+ttsmwjhryLPHFKaig7LeYqkSU/xDzEJgHPW7n0rqyAeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msUdJV0VyuIbQTq9soaOsA9oyMZ5p8SgsmKpqV7c+h4=;
 b=0KnJae22Vir65BHU5G2lUeZS7d365yJcD3Kw59ilwUZj8ZerTFMrpJJ7CNOCqcfh50PlTiRySqOgMG/SGBQdluizcTbCpCyf2+m6+1YWK8AS1OoSvM3L1q3EI00BaqQ2SaQQCjMcSa4SA267qPkQMc0Ck7SXSAbO7Wuj/NWK7Lg=
Received: from MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::18)
 by MN2PR12MB4605.namprd12.prod.outlook.com (2603:10b6:208:3d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 2 Sep
 2021 09:19:49 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::c0) by MW4P221CA0013.outlook.office365.com
 (2603:10b6:303:8b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20 via Frontend
 Transport; Thu, 2 Sep 2021 09:19:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 09:19:48 +0000
Received: from hr-amd (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 2 Sep
 2021 04:19:46 -0500
Date: Thu, 2 Sep 2021 17:19:58 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/5] drm/ttm: add busy and idle placement flags
Message-ID: <20210902091958.GA3903864@hr-amd>
References: <20210831112110.113196-1-christian.koenig@amd.com>
 <20210831112110.113196-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210831112110.113196-2-christian.koenig@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5b6d864-9a7e-481d-194a-08d96df2d002
X-MS-TrafficTypeDiagnostic: MN2PR12MB4605:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4605F91AD1F7B1599020830AECCE9@MN2PR12MB4605.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1107;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yuwm7GwTaxuppCd5c52fToNww6bID2Le75ijwxnX7YZoCL9ldnt24REaV9jfeuMwHWP9iwKliqLQY9sWqH7KmJ7kTXR5weLYRseLZ2whD0/bGzCRaN+Cg6ipWHbLG4HJN+M9HexsLW7/PiLf3lGCf/D60aygpH/fKIv17n4wYYG+tRo4ZA2Ceoq548FPwWP+uGSc+0++6wUZW7YxtyVYhiQX/9ddYfatcjQRvnsWwXiaL7qtq1w+H9hQrCu85u3i9WlCEeQYKWyIrQU4VIMveY1i6XUtD43mH3xEymR208KpX25G5Pi6jR+z0KYCM0hTB8nT/b1Hkw3yXcD+B8IcxG4k3mdKTeh7dG2wevtQAdaWUIxsSANiJq1a1FdPdgZFqLrGJA71K3b752TqTFno5CPVacpxKozHl6ZLkY95xPDw6SCAZjEzObQHPLbo2nOaesve9mb0NyCtI/3vqFrBt3ku662HSgSdhw4TIsUQvHRRhz7T5fzE72S4i+vZMAq2jv4/x60fNcsSoPKYBA8AB6vF69XmXdqaGfQg7LYLRBNyV5WodyoMZupGJOv/1qElV9/wezxXYRPTwSit63G6iDQMXkrTqG0aXT7FYpJOAByuCPBuNwI3+BpgQkIoNKyGuY6EvWrDNHhlqDO6cTc/AQnC1Cazc+xoPES8YoFpNGBUAxwtnQDBjIHQk0+mB1oWT06rvZoMCX5j66Q93ZBatkqs+oTS9iAiotxL9PpA9mk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(36840700001)(46966006)(47076005)(26005)(16526019)(186003)(1076003)(426003)(336012)(6666004)(86362001)(4326008)(54906003)(33716001)(55016002)(70586007)(8676002)(81166007)(478600001)(66574015)(36860700001)(9686003)(356005)(82740400003)(2906002)(5660300002)(83380400001)(316002)(82310400003)(70206006)(33656002)(6916009)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 09:19:48.7388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b6d864-9a7e-481d-194a-08d96df2d002
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4605
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

On Tue, Aug 31, 2021 at 07:21:07PM +0800, Christian König wrote:
> More flexible than the busy placements.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Patch 2 -> 5 are Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c    | 8 +++++++-
>  include/drm/ttm/ttm_placement.h | 6 ++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 0a3127436f61..c7034040c67f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -834,6 +834,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  		const struct ttm_place *place = &placement->placement[i];
>  		struct ttm_resource_manager *man;
>  
> +		if (place->flags & TTM_PL_FLAG_BUSY)
> +			continue;
> +
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
>  			continue;
> @@ -860,6 +863,9 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  		const struct ttm_place *place = &placement->busy_placement[i];
>  		struct ttm_resource_manager *man;
>  
> +		if (place->flags & TTM_PL_FLAG_IDLE)
> +			continue;
> +
>  		man = ttm_manager_type(bdev, place->mem_type);
>  		if (!man || !ttm_resource_manager_used(man))
>  			continue;
> @@ -869,7 +875,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  		if (likely(!ret))
>  			return 0;
>  
> -		if (ret && ret != -EBUSY)
> +		if (ret != -EBUSY)
>  			goto error;
>  	}
>  
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index 8995c9e4ec1b..63f7217354c0 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -53,6 +53,12 @@
>  /* For multihop handling */
>  #define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>  
> +/* Placement is only used when we are evicting */
> +#define TTM_PL_FLAG_BUSY	(1 << 3)
> +
> +/* Placement is only used when we are not evicting */
> +#define TTM_PL_FLAG_IDLE	(1 << 4)
> +
>  /**
>   * struct ttm_place
>   *
> -- 
> 2.25.1
> 
