Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D8E860B21
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 08:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E217B10EB0A;
	Fri, 23 Feb 2024 07:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QimDIGqU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82710E06D;
 Fri, 23 Feb 2024 07:07:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNstM9jemaRi2BWL1r8J+2oZwRvKDv2oGnNxq36bJPsA45JAVQXcSZo8qm1enIa2HXAZua2SS3v6xk0UaYZUEyLO/oUQ3STK3KKbFFhXykTXdAqrvpSHWLN39jLpeFcYWfjEkUOlDgWtx26ovsqxSdpKuVCKbT9nHLgJO8cEQUZQEExnJTUgOEzSs1yrAproXJTJd9OeUcKVQCjChuosB6ClpcZ2BhCnEoWFNpcuYb6iDSPu7snPwXhIUkcVcnS2oHVCnHcUr7+lSXgf5t5ajuau+LygreK3K6H6oQki+j7BfwcM7nLwyn17wGDJPJvxhVDPUPjj4K0KdICdKGczmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+04iG0nesz6P8PYF6ASw33pJaxRXCyGLyAZKvUO1ak=;
 b=VHmOXz4Ubkvsl2q1G6ErPZnCM6fvDunoDRwrAwO/daiAR9fpSN++odqBAew6/5ZkL8iA47iESh1YV9ibJoiNLH6UjT7oqhwY4hzHr6A2zHlNjw4zOrU+hRaFpcF1WMaLtMdr/8a6YWW2dw//F+7yyBD9KwEbegXUvOASlZKLw5FCePKObKetmZLHe9BjneCaSPdOe5Y7FY3DaR2ep4aLUJOB28a7xziT00IIdj17EknTGDRxrDYJl8mOsX3S9asCbgWCuBbvpahwQMMEPr2g0f3Dw8sxo44OHIIp2zo9Nu8hGy0ghGEBGoBcem4W5YnKFw0jJlcpT9NCAI4OkVPHQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+04iG0nesz6P8PYF6ASw33pJaxRXCyGLyAZKvUO1ak=;
 b=QimDIGqUOtSR+1Lto1THRGLITitXE32joZtUVHnZeA9XYy5WLeIbYZdJbst2eDGqbCkcvXhqIG6M4EhRrAGW4nDiakoBeLr/CLxulg5lRqlHJM1e1WmJd6I7AmXFxOJ+8V5X8TxhTWir8k+VEzpOXLYmuMGmTJfidwEM8NuqpEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM6PR12MB4169.namprd12.prod.outlook.com (2603:10b6:5:215::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Fri, 23 Feb
 2024 07:07:03 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::e12:e3bc:a965:72ee]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::e12:e3bc:a965:72ee%7]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 07:07:03 +0000
Message-ID: <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
Date: Fri, 23 Feb 2024 08:06:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222172821.16901-1-michel@daenzer.net>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240222172821.16901-1-michel@daenzer.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0414.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM6PR12MB4169:EE_
X-MS-Office365-Filtering-Correlation-Id: aacf5747-77d0-41ea-79ec-08dc343e094a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fTJPt4B2xv+Ay1SrGIDOyp2SVtQxxPL13OMoJO3+FrgLZRDBJ5TGnCIpanTLMSuvPmtjvSb3w/hS+ON0tnFHb9oJNgAbPS/MDb9waXTrLyzTcSBcnnfZmE9BmXroSgFQnnOY7wlRVRijhLd+iWMpClS4SsKhDaGLzBj6SYxZiby5rCiawsIMbpgtSJClkPvaXHjMIAiwumT253mPn70hwNtkSWVPD77b8oayIV8VwEXF0ITiLmGqcKOqnimzEAF4Ql/o/Ef5Mu7VuliO6kiYhNaQXM8jk5mW14B3a1peOBh+GciliAWi8q3ONF0ZgNsRFk4n7CUZv330I5L/PeqSxi2cJPtI54+XlrPq+Bt1gF3dMkXGMbrJsqk2tsm+8gGCO5XHbMYM5+oPIbjwKACa2oaU8xn/5/iGmEfFO3LRX2x/o/XfTg1KmP1oyVcOoh4pXSpDfS7xSVBgDSYrX2JjpOBGW+8HT7otJ5Y3EyZvpBzNu6MoWan6Rep5KcG90VcWgtQSbD/vzDj9kmYDJiKSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlFteGEyWDVaUUdZaS9vR0I0YXBiYnlvZWg5M2hVUjNuRnkvdXlablg1LzBG?=
 =?utf-8?B?NXg0bWFIK0twanBpV0dLa0svUjBwRTF1eVJlelR6Zk82K1pkd2NMTzErb2Fo?=
 =?utf-8?B?TUlQN3ZkWG1zS2dHd1d3T0VXM1lHRm9yUm5KSlQ5dTl4bFNpVVhTbTk5enV2?=
 =?utf-8?B?Mk1wZWF4eUhvTG90Y1Ribm83eld1Zk1yRyttTnJUcHlzRlAzYXNJYjdMNzJI?=
 =?utf-8?B?NzJJMlh0SUlaWTQrK1F3WU05ZTBhbkozRUp0bGdVMC9GUnVFYSs4SksrOStq?=
 =?utf-8?B?UmlhbVo5clFIOGhwUnFQODR1WHM2WHhPNnptYmlSMG5IV2xUcHlLZU1IS29m?=
 =?utf-8?B?eVV3SDhDQzVHenZGcVloU3Y0OWZscXJiU3NwdkNZWGhDWG1LU094b04wVStY?=
 =?utf-8?B?YUx3dXdKdE9LYnRsaXo0b1RQMEVET2I3cUpFR3dhS1BpVVMyMWpoMGpHUG1C?=
 =?utf-8?B?Zkh2S3RYQldBYnptTkg5WTVtZXJ4cDFWaUYyYkxwejVzcEtVUmdsZ1RuQXRw?=
 =?utf-8?B?ODk5WFkwRXh3Z2Q2UWxWNEdsVGptVzA1VlN6NmRWQjJSSnA2T1NaZGlXNDlI?=
 =?utf-8?B?RC9ma0FtcHNTcjhUcDBGUG9TdGdoRGN4dHlwR0NtZU9Cd2FBK2tCem1GSHN5?=
 =?utf-8?B?N3ErR2hrUEJjbzVDY2xETG5oVVlHM1F4ZzlZY2k1Um4zUE16OVZWQjFDL3hM?=
 =?utf-8?B?ZnJKNjdaOHhJK1ZiWDJ5WXZoeUIvWlpzTSt5UmFzUjJNVVdBWmhwZ2c2Sisr?=
 =?utf-8?B?OEdVWVV1SHh4NElaWG4rSmZXN216ZEE2dzNRa1VPUHpBbDEyeEV2U296UjQw?=
 =?utf-8?B?WVoyOUNsZlZEODgrV09XUTVORSthU242Z00zMXJYcEdQZElZTGtqVWtHa05O?=
 =?utf-8?B?NW0vMTBnNllON3p0Tkd2ZksyMFlSR2VNMGh5V1dmZXJEM0Jtd1VDelFURUVK?=
 =?utf-8?B?Y3BCbEFmbU52ZE1na0pHRTRwekpSUmUyeW1wVk8rMTJoZmxhaExHM2sraTkz?=
 =?utf-8?B?bURrSGtSM2p3QkFOMEoyU1BRa3VncGU4VkVjVWN3cWVOcXE1b2NYcCthdFVi?=
 =?utf-8?B?ZjkwYTdwaHMxd1dqYTNBUXpNV3JKclVHeCtxUlg1ZWNNU3dybWNxMUJpUkVO?=
 =?utf-8?B?RDFXYWRrY1Y5VThmcW1NQUoxVTVabE1SM2QxTno3OHRuQlMrcDQ0MCtzT1Bk?=
 =?utf-8?B?QVMvbVNueDBVRDQyaE9vVTRHdE4zT1RLUHVhZUVtbTMxYzdkMElnRnNOMmV4?=
 =?utf-8?B?NWZmOGwwaUFzcHJZK040RGJVRU1lanZSb3J3NmlURjM3NjlOUkFTNTJPZTJO?=
 =?utf-8?B?NHNiRTVKQkVveCtlTTlvdko1aW9JTW84OEhBL05ZajJTM2JDUGRJOGF3OGha?=
 =?utf-8?B?VSs4UjRPZFpOaFIvV01Kd0VlZTZxZ3VxUW5WRDJQQm11eWp2a05PZzh5SVF1?=
 =?utf-8?B?NTdnTE5ud2x5NFg4Q0xjMnlYQlNuSCt0VW1jNzZYSm5tMzYvNDY2UHpvNnQ4?=
 =?utf-8?B?dU1GcUQ3eVFyV0VWOFpBVmV1ZkFHeXQxb2w0NHRuaThMMzBmQ1l6LzlKYTln?=
 =?utf-8?B?WDN5OE1KenFBN2dsSmczbzk3b1FnQTkvRGlHRVhzYkhHNkh5OE8wREtTSlBT?=
 =?utf-8?B?Q2gxTHFlUzJweG55R1BQSzhPV0tHRnhybUJTc0hSYVZQNFJIV3dlb3lYeUNR?=
 =?utf-8?B?ZFhrUXRuWmR4MGVKeEN1US93UksxNkRMdHMvd2xQeCsybzMyNm5yVEFsZ3Yv?=
 =?utf-8?B?b2dnRlJNUkp0eTRvKzNZa3Zxc25selk3SWgveXBMOHhweENQYnlqY2xYb25n?=
 =?utf-8?B?ZlBMWDZuK2taZEMwUHduYXBpSVN4K1hobURsVWxuVjdMcnNYVjFsMC9PV28r?=
 =?utf-8?B?b0ZuZzBjYUJGNE1yU3NqYUIyc3g3eE9qdW5HZExXdDMyWklSL3pXWEM2dnhy?=
 =?utf-8?B?ejhUUktHVGhBQnhkRk0xTm9SM2ZaeGdTazgzS01QQzFqL3hoQ1U5eTBjSHJV?=
 =?utf-8?B?V3RTWmpKTjVZOXJaT0ZQUVVtRVNFMDJhcEJzMS9MSEcyTnUwakg0YzRnenNC?=
 =?utf-8?B?bWp0SUJmU0VRZHhkWmt1Vmo5dTZXK3cwMzhJUVZiS3VzRFBCTEVITXozYUN0?=
 =?utf-8?Q?55MsU9HGHBw/eIL3fIIbFwtlM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aacf5747-77d0-41ea-79ec-08dc343e094a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 07:07:03.5618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yes+/bu4Bt43YWK8Ufb3TN99b/CpA3RZB6OaV9QQ7/NcSfwpm19QXphZfEHQLo1F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4169
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

Am 22.02.24 um 18:28 schrieb Michel Dänzer:
> From: Michel Dänzer <mdaenzer@redhat.com>
>
> Pinning the BO storage to VRAM for scanout would make it inaccessible
> to non-P2P dma-buf importers.

Thinking more about it I don't think we can do this.

Using the BO in a ping/pong fashion for scanout and DMA-buf is actually 
valid, you just can't do both at the same time.

And if I'm not completely mistaken we actually have use cases for this 
at the moment, only as fallback but it would still break existing 
userspace and that is a no-go.

So rejecting things during CS and atomic commit is the best thing we can do.

Regards,
Christian.

>
> Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10635
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 38 ++++++++++++++++++---
>   1 file changed, 33 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index b8fbe97efe1d3..514a5b2159815 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1255,13 +1255,41 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>   		return ERR_PTR(-ENOENT);
>   	}
>   
> -	/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
>   	bo = gem_to_amdgpu_bo(obj);
>   	domains = amdgpu_display_supported_domains(drm_to_adev(dev), bo->flags);
> -	if (obj->import_attach && !(domains & AMDGPU_GEM_DOMAIN_GTT)) {
> -		drm_dbg_kms(dev, "Cannot create framebuffer from imported dma_buf\n");
> -		drm_gem_object_put(obj);
> -		return ERR_PTR(-EINVAL);
> +	if (!(domains & AMDGPU_GEM_DOMAIN_GTT)) {
> +		bool can_pin = true;
> +
> +		mutex_lock(&file_priv->prime.lock);
> +
> +		/* Handle is imported dma-buf, so cannot be migrated to VRAM for scanout */
> +		if (obj->import_attach) {
> +			drm_dbg_kms(dev, "Cannot create framebuffer from imported dma_buf\n");
> +			can_pin = false;
> +		} else if (obj->dma_buf) {
> +			struct dma_buf *dmabuf = obj->dma_buf;
> +			struct dma_buf_attachment *attachment;
> +
> +			dma_resv_lock(dmabuf->resv, NULL);
> +
> +			list_for_each_entry(attachment, &dmabuf->attachments, node) {
> +				if (IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && attachment->peer2peer)
> +					continue;
> +
> +				drm_dbg_kms(dev, "Cannot create framebuffer from non-P2P exported dma_buf\n");
> +				can_pin = false;
> +				break;
> +			}
> +
> +			dma_resv_unlock(dmabuf->resv);
> +		}
> +
> +		mutex_unlock(&file_priv->prime.lock);
> +
> +		if (!can_pin) {
> +			drm_gem_object_put(obj);
> +			return ERR_PTR(-EINVAL);
> +		}
>   	}
>   
>   	amdgpu_fb = kzalloc(sizeof(*amdgpu_fb), GFP_KERNEL);

