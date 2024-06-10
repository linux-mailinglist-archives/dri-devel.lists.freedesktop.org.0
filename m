Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB82902A7C
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 23:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D17489F41;
	Mon, 10 Jun 2024 21:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rZd0IemW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC99410E4FD;
 Mon, 10 Jun 2024 21:16:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kn2LAs0OQ9OyeEOlCcZViX+vimdYJTYKX24sxwkhepQzlBDDDPoomzHrh8RR8J3F04v1S7JhzQxk/PPLnfYVWwxQmmqi2h43i6ciG4g6p1wKZrs0ZY2rqTxog3DzwOlq+Qrt0LlBTBHIVwCyf4ev1SXbezJ/JVLD290X+sd4nn4MO6F2xDz4hSAG9TUJNUc/rTOySJ5qKxM2P6czTrJs9FOmWqeG69EMBZGzG53H/Ax6q1pGz2bMBNsSYsHRRWZFqbhLzoqHhAAw/loolCgNzh58/IslzrgyiFCZ7ZaPfgKILFaZnyHtVQ10eP1yzSsQlxtbdEevYCKQRvhGAhKKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIdD0verI51peCSSSR41NFySCSjyDJHGMVk8xPInoVw=;
 b=eWb7gXTd/zXeuM54/xkQnFUNimjl1Wvl5yBc0V4CemeYG6bABrpYvZfdB+xB6lWyyC9lI6t0fe6fsKts7yQPb2RGsNzrNOPSdST3onPVB46CZiGF9eUsroyYHh8GnJK0LFR3NYZnxcMqXbbNCEC3pYzLisW/Fd9R2ONpKWqUyBihUBQMNvr7iHOsUwkbCE3eU56BQYkTpKHYf/jm4wQ/s9Wt+1/GpQo3ZzrC0EWG0tI9wB654vEU1y6tRKbbm64zZ5Rj+zPb7rNjfdxYSDM7d3JNeg+EDF9PTbinOtqFy383TMydlh5i4cCylrdvZWvY+BxFgdTi0CrxZrjHh4Visw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIdD0verI51peCSSSR41NFySCSjyDJHGMVk8xPInoVw=;
 b=rZd0IemWSLpxih/UHe1MGb/QNSZoLvEc62i2oZmtP8RYenBwJPnF5d1x1TIe34UgQaYwNe+02a5xCdR/N1TyV699DrgwkD+/7eYbQDKGvCuPkNVhaK5EOGPSVPLUS1nFfI1Ai9Oewrkz/mAYKg43CTduhSjdo4DuWwVgIPg11TYUtPO2yXMo2xex0wY6Xao27eU9Mmp1VdCzdsgX/bCbc0bVoPrfS1mesatHDhe7mFqKz0mxOj46fgndxOZ1RDHeIFnSWdTy2DfiE/FXcZxmat6c9lXvxhBGN40GIQCE44f3KQzUkClMggphi23NAvBYWfNEm39M5La5v/3cH4qjQQ==
Received: from BL1PR13CA0322.namprd13.prod.outlook.com (2603:10b6:208:2c1::27)
 by SA1PR12MB5613.namprd12.prod.outlook.com (2603:10b6:806:22b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 21:16:33 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::f0) by BL1PR13CA0322.outlook.office365.com
 (2603:10b6:208:2c1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.16 via Frontend
 Transport; Mon, 10 Jun 2024 21:16:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Mon, 10 Jun 2024 21:16:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Jun
 2024 14:16:09 -0700
Received: from [172.27.35.123] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 10 Jun
 2024 14:16:07 -0700
Message-ID: <1804c53f-f30e-4a34-9be2-b4c9f9f681b4@nvidia.com>
Date: Mon, 10 Jun 2024 18:12:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: don't attempt to schedule hpd_work on
 headless cards
To: Vasily Khoruzhick <anarsoul@gmail.com>, Karol Herbst <kherbst@redhat.com>, 
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
References: <20240607221032.25918-1-anarsoul@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240607221032.25918-1-anarsoul@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SA1PR12MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b0f5c0-b650-4c17-3c5f-08dc89929a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|36860700004|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWhsMGEzTUxTVGFqY2dtcGU5V3BucFN6eXlCaTFiczVFYzR4NFRRTEk4amZj?=
 =?utf-8?B?enlPMnFtRUc3OXg1QWRhWkgrVUE4blZsdGxjY1RyVlNUYlZHR0k3K25GajFD?=
 =?utf-8?B?ZktwTnNEUXlOOTNTdW9OdEQxSnp6MVZsZlc0cEJGNzFhM0l3N21nYmZHRGFz?=
 =?utf-8?B?UlRsM1lHL0cvY2pyWDhmK0JpZ1MvQ0ZpTFhqcFd2UnE3MnhURjc4VFowNkd5?=
 =?utf-8?B?Nlg0ei9tSExyMHJheTR0Wk1YVEpnSDdldWpQZXNzTHhLNVdwTCt6SG9WVXRv?=
 =?utf-8?B?UXltV0ROSDE1dk84eGVWTHh0QSs0Z3ZOYXNnVkRYeWhyVm5WVXl6T2lBeVVp?=
 =?utf-8?B?dFpFOEhvdTJYQXBZMHpacHlDQVExd25sZ2pIRlVDT2o0YURHbEYxeUg4bG1S?=
 =?utf-8?B?UnUzWEJxRzduZ0hOYzQ3MmVxb3d6TWdmUTUrRTlFR09ZLzlhWFhYYUlMMUxD?=
 =?utf-8?B?SXhaZTZjVlRWVVBwRjcwQks2WXljNllVQ2lZNzVnRjhHWFdEczV3eXhJTlF3?=
 =?utf-8?B?Q3pjR3VFNE1uUy8rUTU0aElwMEpiTWt4bEhsVlFVSHVpbXVvUnViSlNTWkZu?=
 =?utf-8?B?SHVBQytRWVFFVkt3UHNCTjZBVHBkK1FxZ2JOZVVhV2JuQ1dnc0Y0SWRvcEF1?=
 =?utf-8?B?VEdOaytLQkhzc01hQk5WYU9EMThqakpsV2RkYkpJamJCVjUyQXJrMlQyc25l?=
 =?utf-8?B?MWtqdW1HREpEcEhpL0ltSUd6dEVUYWdMYTYyak1MK0t3N3c3VFR0SFdlOGRM?=
 =?utf-8?B?R1FVWmFyVVFTWEVBbnVldkJOSmMvN3duc0dnMnBEc3kxSW9PL2kvT0V2UVR2?=
 =?utf-8?B?UHpmZGRCblBPbFZPNFlsRDJ1SmNjbVRSaWdjOVYrcWxzRW5oZEc5cVJiY2kw?=
 =?utf-8?B?TW1qRCswNGl6RHk2bmovOFF0NHo5TkRQdTg3QlE5V05qL3dibEFtUEhock1y?=
 =?utf-8?B?WWJPOWg5SmQ4cXNaaEJTNE4wNDNtOXdMUEc2ZmxSd04rblhpQUZ6RU5PSjNv?=
 =?utf-8?B?K1dNcEFZVUtlWW1iR0pLYmdXcTB2cHF4M0FoSTlsYkVNVXVGak1oMlhxanBJ?=
 =?utf-8?B?N1MybDVLWmxVM1c2R2w4OVVmM25GeEtmeUdLU1FwRlBBaGFkRFdmeVN1S0I0?=
 =?utf-8?B?WnMyTHVjOVBCSU1YNUVKVGxxSnlZRjNZeWtLd3lNZGZvRVNRZ3Q2YnAxeGdv?=
 =?utf-8?B?VmVVOVVtZTE4dFNKTTFXa0pSbXNVbGREUHk2MytzZ2YzVzZkcUpJKzZVdVA2?=
 =?utf-8?B?cXFocVBueXI3d2JEMnF5U2RVcG8wR08vdytPR05IdlRUeHZtejFMQjNscjU3?=
 =?utf-8?B?L2VtOHVtcTA1OStSSEtUdFhqbmN3TVB4RUd1QmloVDZYMHo0cE83N0wrSWxE?=
 =?utf-8?B?dDFxNUd4b3o3NVNJYU1zcHY3MncvNXdndTF1NHI1ZzNGMkFnNUxySzNZOTV0?=
 =?utf-8?B?dVhNRXRlallqNnFDczNsK0lDVHVseWJyeXhaYW1UTzNnamJWMUI3NmZDVFcv?=
 =?utf-8?B?MjNORHpJYmtrNW1FQ3Fjc1lPanorMWc2K3o0NHEzamVRcjd4d0puSk5MMTdM?=
 =?utf-8?B?OENadkhxazVXU1RqSGx0eXJiVjdJdnNWRGs2VjJSR0xzd2pWdE9wRG9XWXYw?=
 =?utf-8?B?ak5XZXQ2VDg0RUR4cmlKbU9uNnZVWUI3b3NWT002bVNINzdQSEdjODFOd1hZ?=
 =?utf-8?B?YytITzJ1bitacjQ3cDZGdGhqZXM4ejJGemw4WWdYd0RHOVE2RUk1bkJ5Wmpr?=
 =?utf-8?B?emFzT2FaVUhFSVZjUjFzNmJzN3NGRmtRUTF0VHlpTThMd0V5TWhXbzVjMmtU?=
 =?utf-8?B?c2dVUEo0L2JOMzd3L0ZFUmtWR0svcDJpTmlOZExjVHdBeGVSS0ZHSTM5STBn?=
 =?utf-8?B?eEZ5Y2h4MzNucnR2bWh3R0dCZWhRY0dOTHplM1RGMFZQYVE9PQ==?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 21:16:32.9413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b0f5c0-b650-4c17-3c5f-08dc89929a97
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5613
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

On 8/6/24 08:09, Vasily Khoruzhick wrote:

> If the card doesn't have display hardware, hpd_work and hpd_lock are
> left uninitialized which causes BUG when attempting to schedule hpd_work
> on runtime PM resume.
>
> Fix it by adding headless flag to DRM and skip any hpd if it's set.
>
> Fixes: ae1aadb1eb8d ("nouveau: don't fail driver load if no display hw present.")
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/337
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Reviewed-by: Ben Skeggs <bskeggs@nvidia.com>


> ---
> v2: drop extra checks in nouveau_display_hpd_work() and
> nouveau_connector_hpd()
>
>   drivers/gpu/drm/nouveau/dispnv04/disp.c   | 2 +-
>   drivers/gpu/drm/nouveau/dispnv50/disp.c   | 2 +-
>   drivers/gpu/drm/nouveau/nouveau_display.c | 6 +++++-
>   drivers/gpu/drm/nouveau/nouveau_drv.h     | 1 +
>   4 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> index 13705c5f1497..4b7497a8755c 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
> @@ -68,7 +68,7 @@ nv04_display_fini(struct drm_device *dev, bool runtime, bool suspend)
>   	if (nv_two_heads(dev))
>   		NVWriteCRTC(dev, 1, NV_PCRTC_INTR_EN_0, 0);
>   
> -	if (!runtime)
> +	if (!runtime && !drm->headless)
>   		cancel_work_sync(&drm->hpd_work);
>   
>   	if (!suspend)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 88728a0b2c25..674dc567e179 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2680,7 +2680,7 @@ nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
>   			nv50_mstm_fini(nouveau_encoder(encoder));
>   	}
>   
> -	if (!runtime)
> +	if (!runtime && !drm->headless)
>   		cancel_work_sync(&drm->hpd_work);
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index aed5d5b51b43..d4725a968827 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -450,6 +450,9 @@ nouveau_display_hpd_resume(struct drm_device *dev)
>   {
>   	struct nouveau_drm *drm = nouveau_drm(dev);
>   
> +	if (drm->headless)
> +		return;
> +
>   	spin_lock_irq(&drm->hpd_lock);
>   	drm->hpd_pending = ~0;
>   	spin_unlock_irq(&drm->hpd_lock);
> @@ -635,7 +638,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
>   	}
>   	drm_connector_list_iter_end(&conn_iter);
>   
> -	if (!runtime)
> +	if (!runtime && !drm->headless)
>   		cancel_work_sync(&drm->hpd_work);
>   
>   	drm_kms_helper_poll_disable(dev);
> @@ -729,6 +732,7 @@ nouveau_display_create(struct drm_device *dev)
>   		/* no display hw */
>   		if (ret == -ENODEV) {
>   			ret = 0;
> +			drm->headless = true;
>   			goto disp_create_err;
>   		}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index e239c6bf4afa..25fca98a20bc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -276,6 +276,7 @@ struct nouveau_drm {
>   	/* modesetting */
>   	struct nvbios vbios;
>   	struct nouveau_display *display;
> +	bool headless;
>   	struct work_struct hpd_work;
>   	spinlock_t hpd_lock;
>   	u32 hpd_pending;
