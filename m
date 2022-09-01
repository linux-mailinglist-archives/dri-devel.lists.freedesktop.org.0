Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E24E5A8E84
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 08:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D94910E624;
	Thu,  1 Sep 2022 06:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C9810E5FF;
 Thu,  1 Sep 2022 06:45:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahTYEC9QIsWQA3pCRmrDzL7V1OOzCuaXptvg2vcr1uBoWIAFAAgtX+QbbkVI2NFPfZUYBJWK+KJO9zV3UVZaaD4Ro/Eqc7g9+OdsaYBYlgpyAgwkyxhWUSxmo8YskqSNV64ZnPSAeGNWPq1KYlYBEEJocnN6w9l8djP+rWX8kscNuLbeBplro3YlWUYGlumtbpxPD1swatRLkJDKaJ3+VzVxFg/k8U611W4xpKzGTfdGbPI6taigcai9fIFnAFfj5hxUJV23p4Ub+cPqzcfjEfJrpIlDsrqBD+c+iVPfsD2T9o8H1tFoZSaDidRDhfzVwagYiuHaGiVs95DEuZaACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO9nrEklpYX7tnEq4edqxYFL4EsrLF2kpEA6u4/TGdM=;
 b=ZZIonSv9iByR9iS9HB5OlHzmBf6GTTCivAvlxcjDXBq4pgJ+4NWapX9gySWRjBR2MNQtiWxBRpzVEihEz9/cWmqGyR6n11OOuNhVqyo2+jdi2W4cfqBGNaJwiAvCOdMcj6c2YYws2Y1GvhDfw/ets5zvwdzbEdvR7+prG594Sg3eQRql1RI8+YtQxqb1o1x56+dqRlt+47I4qmAC64iREOxmCWxq7ldb1mSKCd1ay1/Yb6N/7T5Ckf0XGe+JRJab7hxK/YHYM0OkMiGzccXQ+d+HBuqNAEDizw2LhqKxML8JogQgU4y61SkU33Bct1HtN8QcB4mEoXQ65VfmbmN4gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO9nrEklpYX7tnEq4edqxYFL4EsrLF2kpEA6u4/TGdM=;
 b=4nypQjFJBVh+sM+sOEWfC427n+XX8zUjZTaoB5cGzpcUUP1dRjktgLRW+4aowALo+SWkiNDqxwWw6Cc3ctr0Lhf0evKSvGKfTV2SB/ZOi/ydYMJ9u4aFrFopI4iQ+zsxFQ02s3DhCn8CzVo26sYpNKkY4hi1EO9fnaNxvMLompw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5228.namprd12.prod.outlook.com (2603:10b6:408:101::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 06:45:15 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.011; Thu, 1 Sep 2022
 06:45:15 +0000
Message-ID: <2463ccb0-6620-8760-fc06-532847835207@amd.com>
Date: Thu, 1 Sep 2022 08:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
References: <20220831153757.97381-1-dmitry.osipenko@collabora.com>
 <20220831153757.97381-7-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220831153757.97381-7-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0008.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a74a4ab-696e-4f28-3427-08da8be58665
X-MS-TrafficTypeDiagnostic: BN9PR12MB5228:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2T40/60DPhA+Jlw3HehoxUCX9U9KfdkJaTxhATgiaohs/vuipqQ4DlcD4ySaEFw7ZvmwOiOXxs1g76NONWvWt88M8trdKGRuRW1dzMTOE70HLSH3CutJ4N+UMdOMr1SWxRyLcVKzohJt9TP8TQdJFowdBLXtkRxe4IHx/EuCtQ6sX8C1D0dkvxS5yTf68hnBp1uC6FUIIZ9+SRsXeQDO1tKFF5gWlIms12mKNdGgRsZ/szyH3D6aWfZEEQtEEdxwJFfMKnuFfowHImYKwIDV9wdmT5uP2n9xwusvM7ucDpwoK83C5c1vcd8E7+vcRhlUCAJIZCsly5JBUybFFvLIbBjmu3qCMX6E2/vSpKRKSLnMmQIF3mQP2IA/TsBA5fZ//5v0ZHCNvZLiRSMhdhrdb3zL3W4AWBaSPOofEYv8vbcBh91seC14bLszZKadyWJSlh9x3Gw601jZwZ5fnJfrz8kCWke/Pst6dj3n677iOQOpkvM4IHFB+HkpxlTloWSxAQsXavg6eq28MUARpjB72idYgvmtijtJVrGbPtJlSqkid4zGJh45w23+hkZfIdoSo8G3qyUARh+Rw1OM19dGnClo718I2iOpmFEev8Skxk8UTFok6pAaZ70uTL7Fj7Bff6mZLnOpWLxOBKAhZdZRm3Y6GTIn2ij0JfJy6AFVOQ1roD+VnP/foaGWCHHdtME6C3Vsi0rxjDSDTSPcE1m7a17NWXQCgePLkwCv3hUe9Sw4uOza5DtqFKsP/0b0VZynOf+0j2kCMQAsWKG3KxOe7JD/IE5ZiioM6XFB0OGqC44v2um5rj77JktTbwxQYUZk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(8936002)(7406005)(6486002)(38100700002)(478600001)(7416002)(110136005)(31686004)(6506007)(316002)(41300700001)(6666004)(5660300002)(6512007)(26005)(86362001)(2616005)(83380400001)(2906002)(66946007)(66476007)(36756003)(31696002)(186003)(8676002)(66556008)(4326008)(66574015)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUdVWTBFbFJJUDZMMEdjZnlmcElNWXJrZkhKSThKWmlHUnB0cTc1R0VMc2xl?=
 =?utf-8?B?dXBGQUZ5YXJKeno1YXAwTFRoQldpVExYc2R2Y0RDWUI2cU4vMUhsdUZIOUI1?=
 =?utf-8?B?RFB1b3lZZE1EWVlzcDhJY0FWNXRIaXpmbk9xSDMrbm5VbEx4ajZaOGlHb1pX?=
 =?utf-8?B?bWVFOHg5SitlMkJKTmxQdXR0QVV1NW5GMW5XS2QzVzR5b2RqZ1BYUmw3WXN3?=
 =?utf-8?B?VnhHcjN3OUxGUTRpSTZvcW9oSVAzRDFUaDU5ZUZLY0NMNFpvZFE1VmJCSzBq?=
 =?utf-8?B?cHVYR2tKYVZNeFoyQzlYYm8veTNXaTFiUG8vVisxTGhtTzM1ZGd1NGE1ZDJY?=
 =?utf-8?B?eHdJV2NRbE1jUjNhT3NyNUdTdnM0dHVaK2trQldOdWlFYU9kUlBGa29kSzVL?=
 =?utf-8?B?amhtNXRwWjM1aGxJb0UrZktyaFBRMGhmbnl6NHJ3Nm0yYVVCM3pORCtIZVpV?=
 =?utf-8?B?MEJobVU2TWg3WEE4RGZxRzJlaFh2VHVNT2pWN0FWNDBOWGVEQ3FuVGQrVS82?=
 =?utf-8?B?N1hGNGYwdXRVeVY0MkRBUmJZamh3TGs4NUgwcmJqWEdTTFFTMmpBcm40Z28v?=
 =?utf-8?B?SnBWVG9ybkoyakIyaUFFbWp5ZC9mOXZaRDIvR1VxVVZkRXlwc004RndMWXda?=
 =?utf-8?B?bUNTb2o2SmVjNzNmODNiMDdjRVN2dTQvRnhRd1QyOGVkY0FCaytSTHdGSG5a?=
 =?utf-8?B?eEJoR3MzcXVYb2NIdU80Nmd2aXg4ZFkvVmNGcVVOOElTNDlvbkpaYkZIcmR0?=
 =?utf-8?B?aEpqVkNKR092ZGpPcmo2ckxuaFMrQzRqYlZ1bDV4Q0NqRGpnNmlYMVZRS2g3?=
 =?utf-8?B?ekt0MHZueTA0RGpSak1TYU1Oa0dYZFZBQ0h4WThwYjRlQ3BuMlRSVjBhSGI3?=
 =?utf-8?B?QjNhb09jRE94VUFHczUxYUtQRC9pRVkwNytueWhhUlJLdDZiOGNwU1hmQ3Fx?=
 =?utf-8?B?clVCWi9wNjJHYm5KV0VtdFBtaXJaVTR2dWdoS2o5ZWRHZUdBMzFUV0htQ280?=
 =?utf-8?B?N3VlSzJHQi8zUFo2VTdpM1pPdHNVeEUyRmtLRXByT2k0akVuTXUzTWwrN0JJ?=
 =?utf-8?B?VVNCQWdIVW5wcVhaMTVNbVFqVWZpZytZcmt4VXJmbWhGSWs2eGdVYWVMOEc4?=
 =?utf-8?B?UDVzeVZxdXVOaldCZU9xSDZoRW9IcGZiVmRrcDdoeUQ0andqeTY3N3E2WE1t?=
 =?utf-8?B?Z1J0WWx4anFrS0xUWG53UURRQVhkZEFXUzIxYzA0T0FFTXY5UlNKYXhQVlFK?=
 =?utf-8?B?akJMWEpEbGUzeXhlODR6RTZjb2N5UWxhSWNVS1NmK3BBTjdzd2pJWm8ya1VG?=
 =?utf-8?B?bW5vWEJuQ1Y3a2FUTitFLzNjdW1mS1RsQkQzOGdmRHR4WU1VeWt3RUNiVzcv?=
 =?utf-8?B?Ylc4bVZzNTdZVDY1aDNYNWJBb1czMWxwS2JhSGlENXpUS1dMSGhqRVloZlpE?=
 =?utf-8?B?ZjhFem1nd3MrY1ZnNUx4SVM5eFk4SE93UnpRRmRzU2VlbVNSd3JKbGNLZE0x?=
 =?utf-8?B?T3hzZkdVYXRwVWkwTDlWSWdidHYwdXlMSnVqNnl3QWcybWcyMjVEYVRkdVNQ?=
 =?utf-8?B?NDhSQ3A2bm5TRm1YTEMxYTRkZzJsLzEvSTJua1lkMnJnRVN5MUpVejRpaUtR?=
 =?utf-8?B?dU5UVFU1L3VyMW5TdjFTMk84NEE4aVo5V0U5UXUyRlR4NWVWdkFCZTJyc3NZ?=
 =?utf-8?B?Ym5nbmlrQ1grY2dIVmdXdHd4RGxVMGVodUc5T2JHUFdKUHRVaTNpeDZsZGJC?=
 =?utf-8?B?eEM0bkNDRUtjalZVdTROSklOZkUxRVFQTDdpeWZ1a1pNbHBhTmtBaGF1OG1Q?=
 =?utf-8?B?K09RaGdUL1hTSTB4SU5MMnRIeGw5VWM1WHRUSzR3NFdMVkdpNVhwNTVqSXMz?=
 =?utf-8?B?TUpybUY1aTZKWFRHU0p6UWZZak9MRzBXSDRZZm5KM1FaRlVkZmFYVUhlL3RB?=
 =?utf-8?B?RUExUnFDcUdib2JaQ1ZmYjV1NncycEFDWVlKRVRhL0Q0dDdDdW1XdktuL0Fa?=
 =?utf-8?B?SnZFSmlqWjZTZGkya2IrWDVGM0gzcWJjck9RMy8ybUdTbjNQV3FIRWNvZC9n?=
 =?utf-8?B?YnZkUGRKdkVFaktmR2hLZEZzVDg0dTdPanlKbGk4YURLaHllMjNJZ3lESlFz?=
 =?utf-8?Q?uR5oex08w5wYUxOtfuFIiXDAF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a74a4ab-696e-4f28-3427-08da8be58665
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 06:45:14.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/9qNzgInkJX/XdKXehavtVkTevzayvvOgGwZJJ8NCfq3V7yS6nfj34Jq2ZmNdLj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5228
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.22 um 17:37 schrieb Dmitry Osipenko:
> Prepare i915 driver to the common dynamic dma-buf locking convention
> by starting to use the unlocked versions of dma-buf API functions
> and handling cases where importer now holds the reservation lock.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Acked-by: Christian König <christian.koenig@amd.com>, but it's probably 
best if somebody from the Intel guys take a look as well.

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c       | 12 ++++++++++++
>   .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 16 ++++++++--------
>   3 files changed, 21 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index f5062d0c6333..07eee1c09aaf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
>   	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
>   	void *vaddr;
>   
> -	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
> +	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
>   	if (IS_ERR(vaddr))
>   		return PTR_ERR(vaddr);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 389e9f157ca5..7e2a9b02526c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
>   			continue;
>   		}
>   
> +		/*
> +		 * dma_buf_unmap_attachment() requires reservation to be
> +		 * locked. The imported GEM shouldn't share reservation lock,
> +		 * so it's safe to take the lock.
> +		 */
> +		if (obj->base.import_attach)
> +			i915_gem_object_lock(obj, NULL);
> +
>   		__i915_gem_object_pages_fini(obj);
> +
> +		if (obj->base.import_attach)
> +			i915_gem_object_unlock(obj);
> +
>   		__i915_gem_free_object(obj);
>   
>   		/* But keep the pointer alive for RCU-protected lookups */
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 62c61af77a42..9e3ed634aa0e 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -213,7 +213,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
>   		goto out_import;
>   	}
>   
> -	st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
> +	st = dma_buf_map_attachment_unlocked(import_attach, DMA_BIDIRECTIONAL);
>   	if (IS_ERR(st)) {
>   		err = PTR_ERR(st);
>   		goto out_detach;
> @@ -226,7 +226,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
>   		timeout = -ETIME;
>   	}
>   	err = timeout > 0 ? 0 : timeout;
> -	dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment_unlocked(import_attach, st, DMA_BIDIRECTIONAL);
>   out_detach:
>   	dma_buf_detach(dmabuf, import_attach);
>   out_import:
> @@ -296,7 +296,7 @@ static int igt_dmabuf_import(void *arg)
>   		goto out_obj;
>   	}
>   
> -	err = dma_buf_vmap(dmabuf, &map);
> +	err = dma_buf_vmap_unlocked(dmabuf, &map);
>   	dma_map = err ? NULL : map.vaddr;
>   	if (!dma_map) {
>   		pr_err("dma_buf_vmap failed\n");
> @@ -337,7 +337,7 @@ static int igt_dmabuf_import(void *arg)
>   
>   	err = 0;
>   out_dma_map:
> -	dma_buf_vunmap(dmabuf, &map);
> +	dma_buf_vunmap_unlocked(dmabuf, &map);
>   out_obj:
>   	i915_gem_object_put(obj);
>   out_dmabuf:
> @@ -358,7 +358,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>   	if (IS_ERR(dmabuf))
>   		return PTR_ERR(dmabuf);
>   
> -	err = dma_buf_vmap(dmabuf, &map);
> +	err = dma_buf_vmap_unlocked(dmabuf, &map);
>   	ptr = err ? NULL : map.vaddr;
>   	if (!ptr) {
>   		pr_err("dma_buf_vmap failed\n");
> @@ -367,7 +367,7 @@ static int igt_dmabuf_import_ownership(void *arg)
>   	}
>   
>   	memset(ptr, 0xc5, PAGE_SIZE);
> -	dma_buf_vunmap(dmabuf, &map);
> +	dma_buf_vunmap_unlocked(dmabuf, &map);
>   
>   	obj = to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
>   	if (IS_ERR(obj)) {
> @@ -418,7 +418,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>   	}
>   	i915_gem_object_put(obj);
>   
> -	err = dma_buf_vmap(dmabuf, &map);
> +	err = dma_buf_vmap_unlocked(dmabuf, &map);
>   	ptr = err ? NULL : map.vaddr;
>   	if (!ptr) {
>   		pr_err("dma_buf_vmap failed\n");
> @@ -435,7 +435,7 @@ static int igt_dmabuf_export_vmap(void *arg)
>   	memset(ptr, 0xc5, dmabuf->size);
>   
>   	err = 0;
> -	dma_buf_vunmap(dmabuf, &map);
> +	dma_buf_vunmap_unlocked(dmabuf, &map);
>   out:
>   	dma_buf_put(dmabuf);
>   	return err;

