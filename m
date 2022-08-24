Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AD759FCCC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 16:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 317A2B5CB3;
	Wed, 24 Aug 2022 14:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB81B5BFF;
 Wed, 24 Aug 2022 14:08:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fr6wqRZPFvvfpKK/on4/fe5QEg2W20Mx2FG3+O+D0uib63Qltj4gMaSconJerQdTrRgBWA0HcOaJCBajC51Xs/YzrMpD6JYSvWme89eJdqJJuMKd9S4ddZAjNXBldYVowJJf1NoB+kEUhPnlQAsJEgE5Z0KH2yG1Nw/bfit+AivC1S+avlvG+sZ+I/HV4S/R9gW4iKWj9p3H2wqmTFubLX3XiWSNOtPufxYqwW4TDYUjorcQ2lJbyQYnkIHdkx5LtLcBPF0clAlOjuLBP9ZpwcKwnp6TW2gbGHV1mswS8lGM3paGVFg6fyDrnpjFrJa1PHm4Dyn+xZSapBYVxnulfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phzpG12Z3oZ319FnzKouPb/vKlNilFR4dmoaRxtNRjM=;
 b=abd+IN6mRCC7oJT9Wy/aOr0wA9tJiEN1WHQH7BPHb82ftJ1N0paGG6Xjzs6AV+uJPgZw1M6lMpMVLHit33PUrQHRU/CdGMclYzRjIGdl+rKyMES3I23bt2XWqNhibGsgokN0hMtRhHPbLEq0H20CfJTSt61yPzuhmCg9VsPZ39AZkHTKjcknIwxnCN7uHiGANvP7esLhQE2lkIymxAMDqXUgaI6lg2cOTYIr84sufZ+sKcfnnZDFtlRx51U/8JitGNmAEWtKNHZ5w/tgRZ1rRrUJRh5JRRbnA+swyucWCtsSaZ64qIKJ6d8NDix5IxIPunxKP2Eiq/bUhGc3vKta9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phzpG12Z3oZ319FnzKouPb/vKlNilFR4dmoaRxtNRjM=;
 b=MqSUKBjGSjq4KI9q9WJbUsgtzH4mrxmD4rRh6MnTzFs/DZ0JH7w+j8j0dPc7hFMPUlDnAq4pwbSL+aaP9R4j4CsuKlGeZHy32REMmMjVw33GUAJytKCkEbxbk1xwxRwOaKOSn5hx6b8nKNPdOA2gOhqGOSuvSttLHl2aWOrCG+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2581.namprd12.prod.outlook.com (2603:10b6:4:b2::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Wed, 24 Aug
 2022 14:08:45 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 14:08:45 +0000
Message-ID: <17181951-1b40-cd39-48df-58b43cad117d@amd.com>
Date: Wed, 24 Aug 2022 16:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 6/9] dma-buf: Move dma-buf attachment to dynamic
 locking specification
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
 Qiang Yu <yuq825@gmail.com>
References: <20220824102248.91964-1-dmitry.osipenko@collabora.com>
 <20220824102248.91964-7-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220824102248.91964-7-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0190.eurprd06.prod.outlook.com
 (2603:10a6:20b:45d::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8427d9f3-4d66-48ad-eb2a-08da85da280c
X-MS-TrafficTypeDiagnostic: DM5PR12MB2581:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EMjQqXnzT2Z+ZIMI7MebPC83MBblQy6ZWX4E4qrgB8IWWSU08m1JTfBwpvJ8BkSy/roXli3cpMrYyN+ICNOeI2sFq3pszVLh/sAGUjDWMjPCOsDv8KaryEynbgLWhoK15GJ3Ry/9IcF3cqfPDyUfFQZNbn+bgUzzXFlfAqbNQmSCorpIhUPq1ertgXzEj/8l2yDweDqzkQlOZDOAg7UZykv/ZvyAFoqBnWQXOARFKyAd/4RD2l2cvo/e47wM9HpkBw7VqYTLZPMKo3ebOi63Dakq5ntj5/ml+6MvBMHIrEBftD3Xun1lseKPfZOTUmEU/Tg042DZMN9AYAQ9bHpcHYWcDpMV9+QdIvYTiwAyUKowBGfcPZ+s1d6os6VtwIqM0WqiX/efEkcOVSFpleHdeMGRLBzVRqAYV9im8fo3ZSBsnBjdcJFtk3PXdv56SPJYgCuDIhphGxNmRQc6vTApQ07KTjSzMCY1YTD5Liapbvy4FwHS6dUILV7DLAyiUbaRT/oQgXlddUQbqyOylD2/jENUH/dPokc+LPTTA9SSSGIhlAFxvE727rmVK2iA5O6LKCeSCww1sq+N1YGXBlZ0fKqljS3woJVgDQNSNIf5UH4IA0TEGD7oQh59Jga7fISwz6GdBr9U8B0nnebjHKyB0i5xYn8yC9YCHBhXg9xIT+UEykh7NXco8rtEq5u0yX/daGLAMKwu4173NIGqd5f4NNkLHuiBKCu6FMq+e6UwNPoY+v+48ysyEqEI88/8wqmCf8pgMqBptz0XQ9NFDQgbVpFDZwVmaqToTAbPOZxpxSqb8ZzNRs7K9s7lfQ5cQiVW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(316002)(66556008)(4326008)(110136005)(8676002)(5660300002)(38100700002)(7416002)(8936002)(7406005)(2906002)(66476007)(30864003)(66946007)(186003)(86362001)(6506007)(31696002)(36756003)(41300700001)(6666004)(921005)(478600001)(6486002)(2616005)(83380400001)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1ZETEc5OTBZSVBiNktQNTlTajhOOCtUSXJSRWxIbm5vbCtYeW8wK0JnUEQz?=
 =?utf-8?B?emFjMlNVbGVJTStaQzZsQ1JPVTVKNlhlNmtVMkFmVDBUa082d2IvNFRBRDA3?=
 =?utf-8?B?NVF2MW0vSUJDYXVkVXBsWjlaSDg5Q2NEeXgrVWx3L1o5QzhobVZRaU80V0Rk?=
 =?utf-8?B?OG1RbVFUc3pwTmdZNUl6Nm5ieHA3cUxMZ2JvU2grVXBtNEs0UkR4ak14ZWNk?=
 =?utf-8?B?ZWw5Z29CMWliSXlZNXcwYVkrSkFRR1FTeTV1NDZjSEZnK0x5V001Y0Z6RnZR?=
 =?utf-8?B?MjRmQ2pSNVNLSktOVnR1enFVY2l3VzZUUGtvZVVSMkMxNUlHNFd4bGE4K2FO?=
 =?utf-8?B?ZFBzcUovQ1FXSUpSM09BSS9WTUxRTnpVM2RObmUyMysrbHVEa3c0d3Jwa3Vx?=
 =?utf-8?B?MDNGVkc0NVdUTmNiZTF5eVRyZHlUWm40c3lQeDlXTng3MTh0dXc4NE84dmUx?=
 =?utf-8?B?U3BINllJVVo4Ynp2T2hNVXV3aUJrampvZzdqNS9PVlI2dFdadlpnejFZbENZ?=
 =?utf-8?B?SlIvUnI3eWVMbHBzcDd5NS9zZDEzcnljUlJWQXBONlJWVTNuSzFQeFk3QnBX?=
 =?utf-8?B?VGhMRW83WVpIMnZ2em55VnNYQlE0czhya1F1M3RRc3Y3THJXOHladmgwZGZJ?=
 =?utf-8?B?UE91VWtQSGhjTzc3azlhYWVmWHZxMGhjZW0vVkF1dys0QkhNVStVRGRTcjR0?=
 =?utf-8?B?bEZ5TkZmc3lRbVlOWER2a20xRXVSRmFvUFUyUERKN0l5M0hZaWlZSzRPaFVt?=
 =?utf-8?B?U21TNWxuK0JRR3JncjBuWXBsamJhdXdvY29pa3B2VWJFYTN5MElHdnFGeWs0?=
 =?utf-8?B?RGFWcEQrVGVlSXg4OW5pZE03cDlZSFdObzJERGkwVCtiU3ZhUFNVMmh4M2RY?=
 =?utf-8?B?RmdTSTZKamJNZzlFYzNMNnhGMnhXNk9DRUZ6M0hHS3hTejdkek5ya2ZHRjVv?=
 =?utf-8?B?Q3M0ZjBaQ1A3eFZkRWl0dERaN00zTUszckowNVlzaDI4citPdDR3SWsrTlRi?=
 =?utf-8?B?YUlZbFZFZzljODQzcHlTV0pSWVIxR2x0cGsvQ3VuYzVIa2s0WWJNdmRKdHVQ?=
 =?utf-8?B?TUI1TC9jN014YUxGc3BuTWxpSWVFek8ySkJ2bS9scUZYcVVRSWVUNCtXV2J0?=
 =?utf-8?B?Z3JrMUtpSWsyTEZ5RFAzaHhPa2gxcDZmUXdwWWlTd0Y3ZWNScDFrK0czUk5y?=
 =?utf-8?B?eDY3WktiOW82Z2JUeEl0cTZ3VXluL01aeG0wUFl4QVN2NmtLY05ydEpJazIy?=
 =?utf-8?B?aEJHdDVLODhFaE9oa09HMEN3TGFCZVBOT3ZjQ3h4Z2plSFRqa3JWZTBRcWpE?=
 =?utf-8?B?eFVzeWtJWFVhMVAyeWxPWjgyN29EcTEzS0plQjd6alRoRWdMYUp6UkJLVnB1?=
 =?utf-8?B?dXk4Q2NNaUEwcVcxV0Y0dU8yQjduY1pPSlRPdU5iZERidi8va3VrWkY3RVRP?=
 =?utf-8?B?U3Fid3JHSGRlVHZnMm9RKzdQTFhZZ2g4V0pkY2EvNFJIdWM2emplbjFmNkV3?=
 =?utf-8?B?SDhGSDlINmxnSXdCYW5yQlJIRkdxWjJ4SEtyeWI5djNvMFFuc3dYcUR6dHU2?=
 =?utf-8?B?djF6L1MzZFFUSlZoSDFRN1lodlJUU3Nudm0vUk53b2VGcVFQTzZXdVFPWnNH?=
 =?utf-8?B?ZlREQldEaFlCNk5NREhIYjBVMCtNY2pKTnVBbmdIbmN4UGJ2OGxzOUl3ZWVP?=
 =?utf-8?B?bjliVUxNakg4dDhlbDN1UlFaOTFYQzQ2WERnU0EyOFdnNDgvV2IwUTZiSGJQ?=
 =?utf-8?B?ZmFXYmpoY21qWVFYOTk3cnlLYTlLY016WnVkdWkyVUF3b3V4S0N3ZnBkcGRN?=
 =?utf-8?B?VTFOSmJMMngwdy9OcW95YkFXOFBQdm5DQVY5ZHRLY3VGM3FUNDhwWDFXcFFM?=
 =?utf-8?B?OURGK1VZcEZ5QzZKTndOaE9xMWh3YmpyYVBDclYvWUJMWEJmSTdNeHZZNFJI?=
 =?utf-8?B?YzA3VUxLTXZLZjdsVEtCb0s0cHBsK0lBeHY3MkxkRjRVT0tLaXlFZ1pSdTBM?=
 =?utf-8?B?Tk1LZVdza2trbmhPOTFTcWJySzJoTFVheGxreW5tK2dlcktDNGo3a1NoRFFi?=
 =?utf-8?B?U2hqZzJFc3hIdjczTWt0MndYN3hzYzVEL3o4MWdlT2c0MTd1SXJ3ekRCQWt3?=
 =?utf-8?B?a0N4L1VsczYrY2s5L085WHpTY0xaMU5PanlhL2VuQXM1dEZ1eEIxOFJFa0VS?=
 =?utf-8?Q?rXS1Q0dJ7tk3AUj8D6i0NKVTCxQ2L6h7MV7ToIZ9YA1M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8427d9f3-4d66-48ad-eb2a-08da85da280c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 14:08:45.0302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsP3zX64g/5iSvCa+FVu1ZdH/F0z31J/eos5CXGks54cqZePkr1JqWSRjl8V2Koh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2581
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
Cc: lima@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.08.22 um 12:22 schrieb Dmitry Osipenko:
> Move dma-buf attachment API functions to the dynamic locking specification.
> The strict locking convention prevents deadlock situations for dma-buf
> importers and exporters.
>
> Previously, the "unlocked" versions of the attachment API functions
> weren't taking the reservation lock and this patch makes them to take
> the lock.

Didn't we concluded that we need to keep the attach and detach callbacks 
without the lock and only move the map/unmap callbacks over?

Otherwise it won't be possible for drivers to lock multiple buffers if 
they have to shuffle things around for a specific attachment.

Regards,
Christian.

>
> Intel and AMD GPU drivers already were mapping the attached dma-bufs under
> the held lock during attachment, hence these drivers are updated to use
> the locked functions.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/dma-buf/dma-buf.c                  | 115 ++++++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |   4 +-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |   8 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.c |  12 +++
>   include/linux/dma-buf.h                    |  20 ++--
>   5 files changed, 110 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 4556a12bd741..f2a5a122da4a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -559,7 +559,7 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>    * 2. Userspace passes this file-descriptors to all drivers it wants this buffer
>    *    to share with: First the file descriptor is converted to a &dma_buf using
>    *    dma_buf_get(). Then the buffer is attached to the device using
> - *    dma_buf_attach().
> + *    dma_buf_attach_unlocked().
>    *
>    *    Up to this stage the exporter is still free to migrate or reallocate the
>    *    backing storage.
> @@ -569,8 +569,8 @@ static struct file *dma_buf_getfile(struct dma_buf *dmabuf, int flags)
>    *    dma_buf_map_attachment() and dma_buf_unmap_attachment().
>    *
>    * 4. Once a driver is done with a shared buffer it needs to call
> - *    dma_buf_detach() (after cleaning up any mappings) and then release the
> - *    reference acquired with dma_buf_get() by calling dma_buf_put().
> + *    dma_buf_detach_unlocked() (after cleaning up any mappings) and then
> + *    release the reference acquired with dma_buf_get() by calling dma_buf_put().
>    *
>    * For the detailed semantics exporters are expected to implement see
>    * &dma_buf_ops.
> @@ -802,7 +802,7 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>    * @importer_priv:	[in]	importer private pointer for the attachment
>    *
>    * Returns struct dma_buf_attachment pointer for this attachment. Attachments
> - * must be cleaned up by calling dma_buf_detach().
> + * must be cleaned up by calling dma_buf_detach_unlocked().
>    *
>    * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
>    * functionality.
> @@ -858,8 +858,8 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   	    dma_buf_is_dynamic(dmabuf)) {
>   		struct sg_table *sgt;
>   
> +		dma_resv_lock(attach->dmabuf->resv, NULL);
>   		if (dma_buf_is_dynamic(attach->dmabuf)) {
> -			dma_resv_lock(attach->dmabuf->resv, NULL);
>   			ret = dmabuf->ops->pin(attach);
>   			if (ret)
>   				goto err_unlock;
> @@ -872,8 +872,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   			ret = PTR_ERR(sgt);
>   			goto err_unpin;
>   		}
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dma_resv_unlock(attach->dmabuf->resv);
> +		dma_resv_unlock(attach->dmabuf->resv);
>   		attach->sgt = sgt;
>   		attach->dir = DMA_BIDIRECTIONAL;
>   	}
> @@ -889,8 +888,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   		dmabuf->ops->unpin(attach);
>   
>   err_unlock:
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dma_resv_unlock(attach->dmabuf->resv);
> +	dma_resv_unlock(attach->dmabuf->resv);
>   
>   	dma_buf_detach_unlocked(dmabuf, attach);
>   	return ERR_PTR(ret);
> @@ -927,7 +925,7 @@ static void __unmap_dma_buf(struct dma_buf_attachment *attach,
>    * @dmabuf:	[in]	buffer to detach from.
>    * @attach:	[in]	attachment to be detached; is free'd after this call.
>    *
> - * Clean up a device attachment obtained by calling dma_buf_attach().
> + * Clean up a device attachment obtained by calling dma_buf_attach_unlocked().
>    *
>    * Optionally this calls &dma_buf_ops.detach for device-specific detach.
>    */
> @@ -937,21 +935,19 @@ void dma_buf_detach_unlocked(struct dma_buf *dmabuf,
>   	if (WARN_ON(!dmabuf || !attach))
>   		return;
>   
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +
>   	if (attach->sgt) {
> -		if (dma_buf_is_dynamic(attach->dmabuf))
> -			dma_resv_lock(attach->dmabuf->resv, NULL);
>   
>   		__unmap_dma_buf(attach, attach->sgt, attach->dir);
>   
> -		if (dma_buf_is_dynamic(attach->dmabuf)) {
> +		if (dma_buf_is_dynamic(attach->dmabuf))
>   			dmabuf->ops->unpin(attach);
> -			dma_resv_unlock(attach->dmabuf->resv);
> -		}
>   	}
> -
> -	dma_resv_lock(dmabuf->resv, NULL);
>   	list_del(&attach->node);
> +
>   	dma_resv_unlock(dmabuf->resv);
> +
>   	if (dmabuf->ops->detach)
>   		dmabuf->ops->detach(dmabuf, attach);
>   
> @@ -1011,7 +1007,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
>   EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>   
>   /**
> - * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
> + * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
>    * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
>    * dma_buf_ops.
>    * @attach:	[in]	attachment whose scatterlist is to be returned
> @@ -1030,10 +1026,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
>    *
>    * Important: Dynamic importers must wait for the exclusive fence of the struct
>    * dma_resv attached to the DMA-BUF first.
> + *
> + * Importer is responsible for holding dmabuf's reservation lock.
>    */
> -struct sg_table *
> -dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
> -				enum dma_data_direction direction)
> +struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
> +					enum dma_data_direction direction)
>   {
>   	struct sg_table *sg_table;
>   	int r;
> @@ -1043,8 +1040,7 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   	if (WARN_ON(!attach || !attach->dmabuf))
>   		return ERR_PTR(-EINVAL);
>   
> -	if (dma_buf_attachment_is_dynamic(attach))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> +	dma_resv_assert_held(attach->dmabuf->resv);
>   
>   	if (attach->sgt) {
>   		/*
> @@ -1059,7 +1055,6 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   	}
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf)) {
> -		dma_resv_assert_held(attach->dmabuf->resv);
>   		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
>   			r = attach->dmabuf->ops->pin(attach);
>   			if (r)
> @@ -1099,10 +1094,38 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
>   #endif /* CONFIG_DMA_API_DEBUG */
>   	return sg_table;
>   }
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
> +
> +/**
> + * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
> + * mapped into _device_ address space. Is a wrapper for map_dma_buf() of the
> + * dma_buf_ops.
> + * @attach:	[in]	attachment whose scatterlist is to be returned
> + * @direction:	[in]	direction of DMA transfer
> + *
> + * Unlocked variant of dma_buf_map_attachment().
> + */
> +struct sg_table *
> +dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
> +				enum dma_data_direction direction)
> +{
> +	struct sg_table *sg_table;
> +
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	sg_table = dma_buf_map_attachment(attach, direction);
> +	dma_resv_unlock(attach->dmabuf->resv);
> +
> +	return sg_table;
> +}
>   EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
>   
>   /**
> - * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
> + * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
>    * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
>    * dma_buf_ops.
>    * @attach:	[in]	attachment to unmap buffer from
> @@ -1110,31 +1133,51 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
>    * @direction:  [in]    direction of DMA transfer
>    *
>    * This unmaps a DMA mapping for @attached obtained by dma_buf_map_attachment().
> + *
> + * Importer is responsible for holding dmabuf's reservation lock.
>    */
> -void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
> -				       struct sg_table *sg_table,
> -				       enum dma_data_direction direction)
> +void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
> +			      struct sg_table *sg_table,
> +			      enum dma_data_direction direction)
>   {
>   	might_sleep();
>   
> -	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> -		return;
> -
> -	if (dma_buf_attachment_is_dynamic(attach))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> +	dma_resv_assert_held(attach->dmabuf->resv);
>   
>   	if (attach->sgt == sg_table)
>   		return;
>   
> -	if (dma_buf_is_dynamic(attach->dmabuf))
> -		dma_resv_assert_held(attach->dmabuf->resv);
> -
>   	__unmap_dma_buf(attach, sg_table, direction);
>   
>   	if (dma_buf_is_dynamic(attach->dmabuf) &&
>   	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
>   		dma_buf_unpin(attach);
>   }
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
> +
> +/**
> + * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
> + * deallocate the scatterlist associated. Is a wrapper for unmap_dma_buf() of
> + * dma_buf_ops.
> + * @attach:	[in]	attachment to unmap buffer from
> + * @sg_table:	[in]	scatterlist info of the buffer to unmap
> + * @direction:	[in]	direction of DMA transfer
> + *
> + * Unlocked variant of dma_buf_unmap_attachment().
> + */
> +void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
> +				       struct sg_table *sg_table,
> +				       enum dma_data_direction direction)
> +{
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
> +		return;
> +
> +	dma_resv_lock(attach->dmabuf->resv, NULL);
> +	dma_buf_unmap_attachment(attach, sg_table, direction);
> +	dma_resv_unlock(attach->dmabuf->resv);
> +}
>   EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, DMA_BUF);
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index ac1e2911b727..b1c455329023 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -885,7 +885,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   			struct sg_table *sgt;
>   
>   			attach = gtt->gobj->import_attach;
> -			sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
> +			sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
>   			if (IS_ERR(sgt))
>   				return PTR_ERR(sgt);
>   
> @@ -1010,7 +1010,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>   		struct dma_buf_attachment *attach;
>   
>   		attach = gtt->gobj->import_attach;
> -		dma_buf_unmap_attachment_unlocked(attach, ttm->sg, DMA_BIDIRECTIONAL);
> +		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
>   		ttm->sg = NULL;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index cc54a5b1d6ae..276a74bc7fd1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -241,8 +241,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   
>   	assert_object_held(obj);
>   
> -	pages = dma_buf_map_attachment_unlocked(obj->base.import_attach,
> -						DMA_BIDIRECTIONAL);
> +	pages = dma_buf_map_attachment(obj->base.import_attach,
> +				       DMA_BIDIRECTIONAL);
>   	if (IS_ERR(pages))
>   		return PTR_ERR(pages);
>   
> @@ -270,8 +270,8 @@ static int i915_gem_object_get_pages_dmabuf(struct drm_i915_gem_object *obj)
>   static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object *obj,
>   					     struct sg_table *pages)
>   {
> -	dma_buf_unmap_attachment_unlocked(obj->base.import_attach, pages,
> -					  DMA_BIDIRECTIONAL);
> +	dma_buf_unmap_attachment(obj->base.import_attach, pages,
> +				 DMA_BIDIRECTIONAL);
>   }
>   
>   static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops = {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 389e9f157ca5..9fbef3aea7b1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -331,7 +331,19 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
>   			continue;
>   		}
>   
> +		/*
> +		 * dma_buf_unmap_attachment() requires reservation to be
> +		 * locked. The imported GEM should share reservation lock,
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
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index da2057569101..d48d534dc55c 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -46,7 +46,7 @@ struct dma_buf_ops {
>   	/**
>   	 * @attach:
>   	 *
> -	 * This is called from dma_buf_attach() to make sure that a given
> +	 * This is called from dma_buf_attach_unlocked() to make sure that a given
>   	 * &dma_buf_attachment.dev can access the provided &dma_buf. Exporters
>   	 * which support buffer objects in special locations like VRAM or
>   	 * device-specific carveout areas should check whether the buffer could
> @@ -74,7 +74,7 @@ struct dma_buf_ops {
>   	/**
>   	 * @detach:
>   	 *
> -	 * This is called by dma_buf_detach() to release a &dma_buf_attachment.
> +	 * This is called by dma_buf_detach_unlocked() to release a &dma_buf_attachment.
>   	 * Provided so that exporters can clean up any housekeeping for an
>   	 * &dma_buf_attachment.
>   	 *
> @@ -94,7 +94,7 @@ struct dma_buf_ops {
>   	 * exclusive with @cache_sgt_mapping.
>   	 *
>   	 * This is called automatically for non-dynamic importers from
> -	 * dma_buf_attach().
> +	 * dma_buf_attach_unlocked().
>   	 *
>   	 * Note that similar to non-dynamic exporters in their @map_dma_buf
>   	 * callback the driver must guarantee that the memory is available for
> @@ -509,10 +509,10 @@ struct dma_buf_attach_ops {
>    * and its user device(s). The list contains one attachment struct per device
>    * attached to the buffer.
>    *
> - * An attachment is created by calling dma_buf_attach(), and released again by
> - * calling dma_buf_detach(). The DMA mapping itself needed to initiate a
> - * transfer is created by dma_buf_map_attachment() and freed again by calling
> - * dma_buf_unmap_attachment().
> + * An attachment is created by calling dma_buf_attach_unlocked(), and released
> + * again by calling dma_buf_detach_unlocked(). The DMA mapping itself needed to
> + * initiate a transfer is created by dma_buf_map_attachment() and freed
> + * again by calling dma_buf_unmap_attachment().
>    */
>   struct dma_buf_attachment {
>   	struct dma_buf *dmabuf;
> @@ -626,6 +626,12 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *,
>   				       struct sg_table *,
>   				       enum dma_data_direction);
>   
> +struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
> +					enum dma_data_direction);
> +void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
> +			      struct sg_table *sg_table,
> +			      enum dma_data_direction direction);
> +
>   void dma_buf_move_notify(struct dma_buf *dma_buf);
>   int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>   			     enum dma_data_direction dir);

