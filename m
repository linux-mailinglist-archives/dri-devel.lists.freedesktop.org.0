Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C948B48EBE5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 15:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3F910EBC1;
	Fri, 14 Jan 2022 14:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76FD10EBB4;
 Fri, 14 Jan 2022 14:43:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZQX//hrUPDMhkobJXnyVNLCcd2FGoTRat6ZZfKK+f/OIJzVMOyS7irzk2W3eR4Lv4Rbfc6rTkEmPQ+H5UQLXinm5yPvJDgxfZUwfuPK/mNrvx25xacsSeA5nSEW6pQhTv/XzEo6Q36l9k04Z6uvgCfYm1EAuhYNFsbiEHbphPUeOKzc1l06/NavugwgO3NpxuqBPbPm+xmKaVGvudUqLLQspL7MkMppIVD3R60AzrEDG84iGyBJBz/oG3lJsw2iGCM5rH29Q5z/AQADYmlSYVQ9pXFDN7xZUnZm1ui6Rc19DUUwac/gB6kZBDYrxa05T0pGIrwaK7Q3Ok4lJJQrVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y78nyKAEcgWmKrse36BMBjD83CLacLsIRO4Be4cpgo=;
 b=TtevnK09uStuZgf95wdauZn5/nY6Rxfnx/OkFxZpO6lYkvC8EhBCwBXnRhOOkYzu0+iGpiWTsZAF8hfIhvnLHFWnfTyHbZuDSRhkGC3i2ZyPR60bGnfIAohpTR8wkKjaiq7GvrvSVnfweu+JXfRCFhHzW0AAYo7J7FZGOarFOXyaNfkbSKP7TpP4DuNmTmeFYOkGozeULLAAjgt7Nmbu3GsdIO0x7IPcaBeB7v0WKuj9c+Lhzsc05FJmX+sxE9kojgTKMFThe4S6Xz3rzdztCJPsdK7unTmWtSkneHDRATpw4U8Fvnr7Qmm6GDDVYVpX3i2Sn1mVGLs99ag1t+ZBSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y78nyKAEcgWmKrse36BMBjD83CLacLsIRO4Be4cpgo=;
 b=X+2DKhUibAwtTrtgXEVu9iJucwco0ZtfU6226VP5gATo1dPfwH3Aoo7CQuQSytiDGzea3F9N1F/53eyPrVcnDwzyMY5ABe1xmp4rGpLDiR2mMCWM/BPeIV0BrEMZU3Q9zauMkqyQUh2eo0rW5Kx/wE1LsaO9Sy/ncFzH+hoE/1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN8PR12MB3281.namprd12.prod.outlook.com (2603:10b6:408:6e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 14:43:16 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::dd4b:b67b:1688:b52%9]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 14:43:16 +0000
Message-ID: <b58b4288-8220-8ab8-3972-6371cdc4e34a@amd.com>
Date: Fri, 14 Jan 2022 09:43:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH v3 1/3] drm: introduce fb_modifiers_not_supported flag
 in mode_config
Content-Language: en-US
To: Tomohito Esaki <etom@igel.co.jp>, dri-devel@lists.freedesktop.org
References: <20220114101753.24996-1-etom@igel.co.jp>
 <20220114101753.24996-2-etom@igel.co.jp>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220114101753.24996-2-etom@igel.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0127.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::30) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c2e6d0f-b334-4e7b-f515-08d9d76c3274
X-MS-TrafficTypeDiagnostic: BN8PR12MB3281:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB3281E8DC2CD2D351C461B1638C549@BN8PR12MB3281.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQzf7CDDBpId2UtjJ5/SkkjwrtMUyR1SRKqysRD+jEI4rVwh93mJPIkwFhUcQ7PM9zu5vnxWIZR15OgkwRTp/GOK6GIeIi+PIoKH6gNR8rYqYH5uv0xuI4FUMmZPr1IHWv/gXezvz0dDOMrZB6wrlA9iVt4WRx7e/7SGcojoYZohDpQKM0wjj+TS+glxSL+p1y1gkMPLeVQPTY8ri4Cp7wDMMgtLu3SfQLAsZpMz1NSkcd3SuR9jsoNNFeEAtCiTb/KJw72cJYqIxaMfMrk/gtsVMoQv6KRxq14XlAzFFtRRoT7WVTS2itimKD0UqHMW/wgnVOZDRZ8f7pz5GZJC0bSXqM1OTiP9HPx93PxoHx1uBtpeEhmGSghw1C8l9WKdBtxcKvL1b1OIvbKz6yQVZi2Mh/OLQzdZsJhuznCsVQAlvNw8Jxj2vAvLLsmpwTUfpDU2mBzpk43kXsbvxfyJYmcxtKfRbYh3gxowiAK6xoQ89sObiaJPcX306MzmVcy0k/jtXTbxd+4P7f2b4x+QNkrc/a2LqXHkAwoqtClMTp1eV8tGUScwJo/wFAt0rvQGl5l0J/3VmohX4prR3xpsjYAc7v8dip0rwKcQVYzYdy79UklDByq+ZWS1/syuxgolxcKoa3rSq+1i7mWun5YGnqKwFnCwVQiiHo611ygxSdYoB7TosAsSAqdyCz37dzmZb5sGHhkcgqLZR+Vx1Xhs3CrFcjmizjy5h5ojBRTFMMrz/UWAjcs3sRcputtWjevX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(86362001)(36756003)(4326008)(31686004)(2906002)(8936002)(83380400001)(31696002)(6486002)(186003)(66946007)(6506007)(66556008)(44832011)(38100700002)(6666004)(508600001)(26005)(5660300002)(54906003)(53546011)(6512007)(2616005)(316002)(8676002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEF6VzI4TlV1ejRCcFJUZ3A5ZmJ2M00wK2RGMnpBSnVxK25hbk45Y1JKZWNr?=
 =?utf-8?B?WmhaSk5DNWFCd05tcmJBMWZEVVZuRWw5bk5nelpnSGJyc3h1Y1dXQm41bXRy?=
 =?utf-8?B?SndvLzcrbVplNjFyZmZ6VHUxS0ZwcmludTdEVGU4djlEUGRtb0E0TW10NWFr?=
 =?utf-8?B?d2VZL0hUZE10cEpOVENJd3BDaXZxb1dtK2dVdWxBaERPU04zbllZV1pMeUo4?=
 =?utf-8?B?R3JJcWtUQlRjTllyUzgwK0psTG1tTHZYdVllaDluQ1A4Ty9ZWGpWZ3VOTUVv?=
 =?utf-8?B?dmJ3Zy9nOURHRjlWemtjdzMxZC95SmJaSEpRZVptVXpYMEUrSmdUTkpvdkpD?=
 =?utf-8?B?UUROeHdOdFpzRnpzK0RvemxHeFZ5TDNrVGoxUTdIMFplRlNoSm5UZnY3ZXYw?=
 =?utf-8?B?amJ0WE55SldtUXVPUE5aKzFKN3hrbjJ3aCtmMnhickRpaDZ5WTdud1hEcGo2?=
 =?utf-8?B?ZklmbVdqSlhvc3VZOUZPTmlJSktOcDUvMkQzUC9HdXRqNWNVRVJIK3h2bUpS?=
 =?utf-8?B?UzBEcDRXUzFlODd6M0psRmdIdjlSMUh3aElPT3lheTFveGxIcEtIaTJjQm1y?=
 =?utf-8?B?QmFZaW54QVBNTDlVZnJYNlpoMFQ2RW5MMXdyalljZzFwZmVvRnQyblZjWUEw?=
 =?utf-8?B?NEVqVDAzYTlEQlB2V2F1R2NiVlZwRUZJOHBJTTdZYVhqTFM2WHVyeTB5ZWJu?=
 =?utf-8?B?NndnZ0RyS3FzZU43L2ZxM01zUVEzOGFkVXNqMnNPT1B0bXVKSzQ3OFVGdWNH?=
 =?utf-8?B?b2MyTDdOQlBwL0FsV3VIWHQ0aU9sd3lRV3NKdzFTVC9OT0Y0anQvam9xTThq?=
 =?utf-8?B?YXlIYW9yZHhtUHdvcCt6cDAzdXlhMm5VVVdPZGFvWHRSWnFHKytwQ0lRMzRL?=
 =?utf-8?B?aHlsM0RNZ0ZERkE4S1RiaVQzMys3UllQQzFSQXpZb0xmQjhQR3hYUnBFNmZr?=
 =?utf-8?B?Z2QyYldLUTh2OW4yakVjUG95Vmc4NFloNk5OZ1VucUlNMXd6N0t3aUlBdkFU?=
 =?utf-8?B?dDRHVEpUdDNaMjlRZmw1MUdKUnpqK0laaExNRFc5WmJXOVpuUEFoSC9EdWlN?=
 =?utf-8?B?NmExS01hVE9YVzd1MW9zOTlUVFVkQmxRbm9SMEEzeUQ4YlU5azlkblJoTUxk?=
 =?utf-8?B?RUNFNEt1VHE1SFBNQndITEZWa2pROU10enp5R21OdVJFdlF5UjUxb1NTcGZa?=
 =?utf-8?B?bWNENWI5M0phYjVqNGEvbWRsbDNrb3QzbGRBaUhJWkptRFdKd011TSs1M2JN?=
 =?utf-8?B?Y1ZNU1JnT1N1anN3S1FpU2REa2JTaDV1Q3FVRkFTRE5Kd2xacmdQcDZqWXJO?=
 =?utf-8?B?dXJDMmtzV0E4a0xncHJndHJpOUlrVzJpTlZza0xhNFdpNjhTcVhjZ0d3QWJt?=
 =?utf-8?B?SlNCRUxQdkYvdFlYWlFkVE9ub2Q4QWZEZTVDZDZJSWxGZmg4L0xFN3pzazVS?=
 =?utf-8?B?ZU9ZcWllb1ovWVBTTDZqQklnV3VrREZFWGVQQlR1WlJPU3FNYmR4Ri9qNmRn?=
 =?utf-8?B?VG56TGZ1RDVRME4yU0ZOLzRJdDMvMk1SOEExTU1YT3R0bUJXU0k1MEtDY0JD?=
 =?utf-8?B?dXRsaEh4MzJzSHJ1Um5UalQ5Z2w0WFEyZHhNNnEwbGRMNDRPMy9RZFBGRVVF?=
 =?utf-8?B?T2xPbVdRRy8ySlBsM3lVYmxGR0JJbUZUa0NERmpubXl3ajUxdThva096cTBz?=
 =?utf-8?B?OFZVOXpQcTNld01CN1ZXa3lqRjQzVXNzYkpoRWhxbTJ3cnFLQUpnQkdlTzRM?=
 =?utf-8?B?aEdBcEtqbXpuM2V1ajQzNGozWU1lTzltaktkUmtPNlVLZktxbHoveDRZcDdk?=
 =?utf-8?B?L0E0MGtDRlQwWk42cmRDU1A3WkkzWCtURUpxdWJaRlhoOGU3TFBxNHBNOVJK?=
 =?utf-8?B?d1Z0Y2hPSEZpYS9wcGh3RERLdS9vdnNyWlZnTTVOd09qK2M4WVZDcy9CUldl?=
 =?utf-8?B?TjFXOHpPZzFVVm5zMWtTMVBuSlRrMGNqOWNiaVhmMUsvTjI1UlVmN1oydWsr?=
 =?utf-8?B?ZmJTeFB6RURtQVJpbVhYemNFWjIxclk1MW1VMmhjVlZ0dGpBK3VDMDZmTThU?=
 =?utf-8?B?WWhzdWQwMy9VR2JSUHFGemxTZkxoTlA2NmM4VTVpVWNjSU54N3VBYVpFbXJ1?=
 =?utf-8?B?QXNHRFd4dWhjY3JDelZsdHdYeUo5c0ZMTU9SbUdqS0lPOEdSeDNVVmFRZ2hH?=
 =?utf-8?Q?Z68eNAp+IuaVWZJI1xdBdyA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c2e6d0f-b334-4e7b-f515-08d9d76c3274
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 14:43:15.8537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBxMW27HoVFvNh18npg6aOmjjlmyPUO8R6lfSC4QCyK84xBi86ITcE11A8VBUeDR9/0ZJ8vbdPo9iDP1ljs5Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3281
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>,
 amd-gfx@lists.freedesktop.org, Lee Jones <lee.jones@linaro.org>,
 Rob Clark <robdclark@chromium.org>, Takanari Hayama <taki@igel.co.jp>,
 Ben Skeggs <bskeggs@redhat.com>, Evan Quan <evan.quan@amd.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Mark Yacoub <markyacoub@chromium.org>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-14 05:17, Tomohito Esaki wrote:
> If only linear modifier is advertised, since there are many drivers that
> only linear supported, the DRM core should handle this rather than
> open-coding in every driver. However, there are legacy drivers such as
> radeon that do not support modifiers but infer the actual layout of the
> underlying buffer. Therefore, a new flag fb_modifiers_not_supported is
> introduced for these legacy drivers, and allow_fb_modifiers is replaced
> with this new flag.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  6 +++---
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  2 ++
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 +++
>  drivers/gpu/drm/drm_framebuffer.c                 |  6 +++---
>  drivers/gpu/drm/drm_ioctl.c                       |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c         |  6 ++++--
>  drivers/gpu/drm/radeon/radeon_display.c           |  2 ++
>  include/drm/drm_mode_config.h                     | 10 ++++++++++
>  11 files changed, 33 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 82011e75ed85..edbb30d47b8c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -954,7 +954,7 @@ static int amdgpu_display_verify_sizes(struct amdgpu_framebuffer *rfb)
>  	int ret;
>  	unsigned int i, block_width, block_height, block_size_log2;
>  
> -	if (!rfb->base.dev->mode_config.allow_fb_modifiers)
> +	if (rfb->base.dev->mode_config.fb_modifiers_not_supported)
>  		return 0;
>  
>  	for (i = 0; i < format_info->num_planes; ++i) {
> @@ -1141,7 +1141,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (!dev->mode_config.allow_fb_modifiers) {
> +	if (dev->mode_config.fb_modifiers_not_supported) {
>  		drm_WARN_ONCE(dev, adev->family >= AMDGPU_FAMILY_AI,
>  			      "GFX9+ requires FB check based on format modifier\n");
>  		ret = check_tiling_flags_gfx6(rfb);
> @@ -1149,7 +1149,7 @@ int amdgpu_display_framebuffer_init(struct drm_device *dev,
>  			return ret;
>  	}
>  
> -	if (dev->mode_config.allow_fb_modifiers &&
> +	if (!dev->mode_config.fb_modifiers_not_supported &&
>  	    !(rfb->base.flags & DRM_MODE_FB_MODIFIERS)) {
>  		ret = convert_tiling_flags_to_modifier(rfb);
>  		if (ret) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> index d1570a462a51..fb61c0814115 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
> @@ -2798,6 +2798,8 @@ static int dce_v10_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> index 18a7b3bd633b..17942a11366d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
> @@ -2916,6 +2916,8 @@ static int dce_v11_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index c7803dc2b2d5..2ec99ec8e1a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -2674,6 +2674,7 @@ static int dce_v6_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.max_height = 16384;
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> index 8318ee8339f1..de11fbe5aba2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
> @@ -2695,6 +2695,8 @@ static int dce_v8_0_sw_init(void *handle)
>  	adev_to_drm(adev)->mode_config.preferred_depth = 24;
>  	adev_to_drm(adev)->mode_config.prefer_shadow = 1;
>  
> +	adev_to_drm(adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>  
>  	r = amdgpu_display_modeset_create_props(adev);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 2f0b14f8f833..61cb41766fae 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7868,6 +7868,9 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
>  	if (res)
>  		return res;
>  
> +	if (modifiers == NULL)
> +		adev_to_drm(dm->adev)->mode_config.fb_modifiers_not_supported = true;
> +
>  	res = drm_universal_plane_init(adev_to_drm(dm->adev), plane, possible_crtcs,
>  				       &dm_plane_funcs, formats, num_formats,
>  				       modifiers, plane->type, NULL);
> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
> index 07f5abc875e9..4562a8b86579 100644
> --- a/drivers/gpu/drm/drm_framebuffer.c
> +++ b/drivers/gpu/drm/drm_framebuffer.c
> @@ -309,7 +309,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
>  	}
>  
>  	if (r->flags & DRM_MODE_FB_MODIFIERS &&
> -	    !dev->mode_config.allow_fb_modifiers) {
> +	    dev->mode_config.fb_modifiers_not_supported) {
>  		DRM_DEBUG_KMS("driver does not support fb modifiers\n");
>  		return ERR_PTR(-EINVAL);
>  	}
> @@ -594,7 +594,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  	r->pixel_format = fb->format->format;
>  
>  	r->flags = 0;
> -	if (dev->mode_config.allow_fb_modifiers)
> +	if (!dev->mode_config.fb_modifiers_not_supported)
>  		r->flags |= DRM_MODE_FB_MODIFIERS;
>  
>  	for (i = 0; i < ARRAY_SIZE(r->handles); i++) {
> @@ -607,7 +607,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
>  	for (i = 0; i < fb->format->num_planes; i++) {
>  		r->pitches[i] = fb->pitches[i];
>  		r->offsets[i] = fb->offsets[i];
> -		if (dev->mode_config.allow_fb_modifiers)
> +		if (!dev->mode_config.fb_modifiers_not_supported)
>  			r->modifier[i] = fb->modifier;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 8b8744dcf691..51fcf1298023 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -297,7 +297,7 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
>  			req->value = 64;
>  		break;
>  	case DRM_CAP_ADDFB2_MODIFIERS:
> -		req->value = dev->mode_config.allow_fb_modifiers;
> +		req->value = !dev->mode_config.fb_modifiers_not_supported;
>  		break;
>  	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
>  		req->value = 1;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 2b460835a438..2cd0932b3d68 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -708,10 +708,12 @@ nouveau_display_create(struct drm_device *dev)
>  				     &disp->disp);
>  		if (ret == 0) {
>  			nouveau_display_create_properties(dev);
> -			if (disp->disp.object.oclass < NV50_DISP)
> +			if (disp->disp.object.oclass < NV50_DISP) {
> +				dev->mode_config.fb_modifiers_not_supported = true;
>  				ret = nv04_display_create(dev);
> -			else
> +			} else {
>  				ret = nv50_display_create(dev);
> +			}
>  		}
>  	} else {
>  		ret = 0;
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index 573154268d43..b9a07677a71e 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -1596,6 +1596,8 @@ int radeon_modeset_init(struct radeon_device *rdev)
>  	rdev->ddev->mode_config.preferred_depth = 24;
>  	rdev->ddev->mode_config.prefer_shadow = 1;
>  
> +	rdev->ddev->mode_config.fb_modifiers_not_supported = true;
> +
>  	rdev->ddev->mode_config.fb_base = rdev->mc.aper_base;
>  
>  	ret = radeon_modeset_create_props(rdev);
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 91ca575a78de..da82f45351c7 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -933,6 +933,16 @@ struct drm_mode_config {
>  	 */
>  	bool allow_fb_modifiers;
>  
> +	/**
> +	 * @fb_modifiers_not_supported:
> +	 *
> +	 * This flag is for legacy drivers such as radeon that do not support
> +	 * modifiers but infer the actual layout of the underlying buffer.
> +	 * Generally, each drivers must support modifiers, this flag should not
> +	 * be set.
> +	 */
> +	bool fb_modifiers_not_supported;
> +
>  	/**
>  	 * @normalize_zpos:
>  	 *

