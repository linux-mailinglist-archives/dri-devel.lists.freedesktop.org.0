Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FCA8D28E4
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39100112A97;
	Tue, 28 May 2024 23:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E2+++Etm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2065.outbound.protection.outlook.com [40.107.243.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E766C10E2AB;
 Tue, 28 May 2024 23:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwnFafqyw3gxnSCg5UpDKgImL6gxvM4HwuGdsHfDhNN81TOej78Pvke1i1ob5RdKPTzGs5EQde4RsM0DRv6B57x15t/QaV/jDTHDFbAFdfqIq+IuHYPmucyNxeaPjNJirs+SJ5PKGAEENL+U5OuTJFskS5B3/LXz/8t48HJS7DsidC4Bos0a+Pc+KZ9hPW0oPQvr4CDJPIjKug2ok4XCm80s2jfvwQGFWQOwNHVQNZicNiqJP1n2x74zGhJsAfYP+L/lhGXzuvnu7Jjim3JJlC1XMjGsvgiIPu1/JxmWE4FCA49bHL5SIRb3qOX5Cjjwt7TKWIdT0ZVvR0eh30h/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EC0vxUr3l+PnY1y4m40ECHM9QhqDjXBBnNgPKb0qxZc=;
 b=UixXT3qa89YkTO0jos1PkBXYP9v/4MYsunUcLFfhgzNoMPkACNjmv39DAlPjE7k4vLCut+LUGS6ewFmFA55A/eGmKI34B8lomd8Md0hP9pLs+y1WdOg/9XtdYXR/j0ReJVpzslPRKc3skyRA6gzg2ABoC2E9ZEEfydDTkQw17J+e6Z773uGPn9mrbwLA1hEh5GlAI0Q4MyGr2agZDymuNKss0eHSXx2uITYEJUbNY9E36oZBeaXQicSKZDCDudomlPzqiuAgrzz9BgDFfpcWwTNAEnVJnyAAv1csxxjV9JAswjWv4JG32vEYI5U9XQHZY6XVhpBNdwCQXvbX8twszQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EC0vxUr3l+PnY1y4m40ECHM9QhqDjXBBnNgPKb0qxZc=;
 b=E2+++EtmnGcnyROgzL8GX8kWWGUoAdurhWeD/e8qXCfEze3Dw6u53an6aLJsoZqeHtEquLEPxgN2lpB1LJLSZ+wmqZT1If8SYpyC/fWd21j1bAyXAvXNg2cK4Wa/mXMDpOuDpBdm7Cc4Ews3PdtuMq/oY3Cx6+gQBTpfc/bXN5577vKqjdk6b+rwuvw6mPFSc7TpmxLb4XGwmp/qnHHzHWA6EhwMD9Rk0b2ZEJcTMVn/ZMo20iVWZrSHGmeOgAJSCF+t/wCjPRf687ZCEQolXpzkyrcDQ4jFaDJg63arpj2RLNZmyQrcYM8CNfd18hPXOmGWW9XqYfuV6inDozMOog==
Received: from CY5P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::37) by
 SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 23:51:21 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:b:cafe::d5) by CY5P221CA0027.outlook.office365.com
 (2603:10b6:930:b::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 23:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 23:51:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 28 May
 2024 16:51:08 -0700
Received: from [172.31.198.109] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 28 May
 2024 16:51:07 -0700
Message-ID: <d388ebb2-fdef-400f-a62e-67352385effd@nvidia.com>
Date: Tue, 28 May 2024 22:15:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: don't attempt to schedule hpd_work on
 headless cards
To: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
References: <20240528215344.2442-1-anarsoul@gmail.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20240528215344.2442-1-anarsoul@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb8919b-65e0-44bc-91ca-08dc7f711368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmN2SzlLeERUb1g0MEdqRW8zRms0NW9tV0w2UHltRkVpRzZ0NlFXd3RsOW8w?=
 =?utf-8?B?Vmdpb0V6ZW4xMFU5UjRNZm1QbVluQTV5Ym1wL3BuK3gybkxoUWNXR0JMeW9I?=
 =?utf-8?B?Wm5NRnNacmRiZjBHS0g5dVorMXJVcnFqNUxtcFVEYmZ6WGZHSVhrWkNGVzdu?=
 =?utf-8?B?emFQcHp4MklSa1FlUnUzbjRCS0dhbGxHeDFGeFUyRFdTSUhJM3AvQTM0QzRr?=
 =?utf-8?B?NkdDcmhTQVUrRnp2OWJZVkFQeGRVR2pTeE8zQnRFVDcyN1VOemNsM1dBMUlY?=
 =?utf-8?B?dWJTcDVmZ3Vsdm80cDh4K3hyMHhPTUFibVg1cy91M0FTQjhEcVNFczB5T2l1?=
 =?utf-8?B?SjN0UGVUMkpBTDZQQmJJQWtTZ2VhcHByUkR0ODdKTDhwd1o5TnVIUDExZFlB?=
 =?utf-8?B?TXVRVVBmanFLWjBUVTF3ZWZ1N1pWVGF3Qm4rQzFKV1lmY2VNaU8rSktHb3J1?=
 =?utf-8?B?MlZKMEozZ0I5MzJqWjEya20ya3lHcGYwKzZoWHRZQWtlbzQrZDArVWVWL25x?=
 =?utf-8?B?VWRsMjg4a0JKWWh2QWlvMGpCeDBNTUJaSEw0YmVlNmtDK2N1cDhLMlJYb2l0?=
 =?utf-8?B?TGY0NWRCRmZkd0tCeTBQMHNmeFFTYnlucVJ0VjJPWndxbDA1a0dzMW11Nmkv?=
 =?utf-8?B?dG83N3ZIV1R5c0NjRVd6RWZ2WE5FcjYyb3doT0lIMXllVVpLbHRNLzc3S3J1?=
 =?utf-8?B?SnRtZW1Pb3IzZlR2ejhpWHpMRW44UVp2QkNkc3JwYWNDVFZXMUtQcDdzc0dv?=
 =?utf-8?B?bllQNHRxMkoySUxMS255WUFkSW9CMlQxZTdwQ0tkaEpnTENIS0FGVXlhdVUr?=
 =?utf-8?B?Y1kwOU90cDk5MXljM2tSTWJQd00vcGNLc1diOEFQcXBWTFFzTzdHY09uTGRJ?=
 =?utf-8?B?Y3dzZ2ZKL1dQNi9QeU5qVlIvSUhyWGM0c1pmQ1lPWjZKVGMzNWdOdmxHNzlM?=
 =?utf-8?B?VndwM0g4bDdHSGREcWxId0lvMEh0MFl2YUwwZ1VaOHV0QTBUbGN2OS9JRU0z?=
 =?utf-8?B?NHRlUUc3alpBMUFZRStGOU1PTEE5TlFqajRmeTR0cC95OUdxRTZld3NsM0xH?=
 =?utf-8?B?cGFKdm5zdEJDQzJxc1EzTHM4OVhzUmJLZWpOZVBTQmxnKzBOVy9veGJsV3A5?=
 =?utf-8?B?VFRnMVY1REhpellDOUNwdmdWSGZLL2dGa0lvOXlWbDJ4RDJSZDYwU1VoS3c5?=
 =?utf-8?B?clBRMUZXT2gvUlRWdkowVEZIcFRva2I2WE94LzNFRUN6eUd1aHdFcWcvSXRz?=
 =?utf-8?B?VCtRUTFJV1RmQ3ZpN2sreVlpanlmbHl0Z2ZGS1ZHcGRXeGV5QnhzNVFnRXhW?=
 =?utf-8?B?QUhhcXJUeTE3WC94SUQ1Slh1TTI1akpqNDFmdzFuVmF5aWQ1WW5TLytqc29X?=
 =?utf-8?B?RUhXOHFnWHZEd1VxK1gxNHVoQnBOOXZJZDZQWUtTZGtydWJ1YXRuSzIvcmhi?=
 =?utf-8?B?TFVnRmdxb25HajdoR2V6YmFJdUdSMEhvckpIRjMwTllUODFmUkx4UHhFN3py?=
 =?utf-8?B?cExDejViYS9Tc1Z1TUd4c0MyOWwyKytqNzFGbVVXU3FHNmgzTHZjS1Nhbmtk?=
 =?utf-8?B?ajcrMzJqdjZhVDJab2JPY1FqUEI4dUdnMlNLVU9VUlZmZ1BvUkNRa2R5YWhq?=
 =?utf-8?B?Ni9acUMvZWNVQklaaGd1cVF6a25iTllEQWEvVEhMamVVOVZzL0tUWUVNdERQ?=
 =?utf-8?B?b0VsNU80TExlbk1xbGNkb0FqUVJua01yVUxSTEFVWGF5VURPT29nL2Y5UmlP?=
 =?utf-8?B?WkNLcG1hME54dmwvaTNqMjZKY1dsbEJTTmdCS2V2dmo2RGc1U1prOUE3L0JO?=
 =?utf-8?B?YTlIU3lUUEwwbVVaWFkreTVLUEVINi8wSHhqUlkxTDkwV082OGJQMlJibGlm?=
 =?utf-8?Q?BWTxm6PSzTnL9?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:51:21.2326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb8919b-65e0-44bc-91ca-08dc7f711368
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798
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

On 29/5/24 07:52, Vasily Khoruzhick wrote:

> If the card doesn't have display hardware, hpd_work and hpd_lock are
> left uninitialized which causes BUG when attempting to schedule hpd_work
> on runtime PM resume.

Hi,

Good catch, thank you for looking at this.  A couple of initial comments 
below:

Ben.

>
> Fix it by adding headless flag to DRM and skip any hpd if it's set.
>
> Fixes: ae1aadb1eb8d ("nouveau: don't fail driver load if no display hw present.")
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/337
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>   drivers/gpu/drm/nouveau/dispnv04/disp.c     |  2 +-
>   drivers/gpu/drm/nouveau/dispnv50/disp.c     |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_connector.c |  3 +++
>   drivers/gpu/drm/nouveau/nouveau_display.c   | 11 ++++++++++-
>   drivers/gpu/drm/nouveau/nouveau_drv.h       |  1 +
>   5 files changed, 16 insertions(+), 3 deletions(-)
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
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
> index 856b3ef5edb8..b315a2ef5b28 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1190,6 +1190,9 @@ nouveau_connector_hpd(struct nouveau_connector *nv_connector, u64 bits)
>   	u32 mask = drm_connector_mask(&nv_connector->base);
>   	unsigned long flags;
>   
> +	if (drm->headless)
> +		return;
> +

You shouldn't need this change, the function can't be called if there's 
no display.


>   	spin_lock_irqsave(&drm->hpd_lock, flags);
>   	if (!(drm->hpd_pending & mask)) {
>   		nv_connector->hpd_pending |= bits;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index aed5d5b51b43..1961ef665e97 100644
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
> @@ -468,6 +471,11 @@ nouveau_display_hpd_work(struct work_struct *work)
>   	int changed = 0;
>   	struct drm_connector *first_changed_connector = NULL;
>   
> +	WARN_ON_ONCE(drm->headless);
> +
> +	if (drm->headless)
> +		return;
> +

Same here.


>   	pm_runtime_get_sync(dev->dev);
>   
>   	spin_lock_irq(&drm->hpd_lock);
> @@ -635,7 +643,7 @@ nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime)
>   	}
>   	drm_connector_list_iter_end(&conn_iter);
>   
> -	if (!runtime)
> +	if (!runtime && !drm->headless)
>   		cancel_work_sync(&drm->hpd_work);
>   
>   	drm_kms_helper_poll_disable(dev);
> @@ -729,6 +737,7 @@ nouveau_display_create(struct drm_device *dev)
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
