Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C2575C5A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 09:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282911AE69;
	Fri, 15 Jul 2022 07:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD12311AE74;
 Fri, 15 Jul 2022 07:31:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRqZAAfux1nyiMlhkGz1oQeyvfRyYYjd33GPEv9FF+ULuaViZwz30JNm7RWjAP9RlX7TCWvsFiThN2MCAOJY6QnLLEUGWWt77pOfXG8xugPhSlxUpzyIrnbvjcIaLSyK0LVS6Z62rmRJcMN6HMgmYTltwt73NJfHDkmM4tajewuIqDpJCo8kyf+OGT8XXTeInJDdg+OAr9iSfdT4K3ozOWKcZIB8PWuNf4tv6PwNv5GC8bfXED8r4P9TQicw2j1xKj9Kk5uzk4WrpN23V7nXbLzgk6eHOup7Jr7yBYcae7ueslmqLiblmhy6UTimH4kC7789gpU9nqXemjB+Qlaffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7bwDf0qM/tQuy+789QAkidbPdSab2SEqKFy5qDE2ow=;
 b=oOm3FKNsRcTWb+lYjZJqDvOEdz8OCUqlWKvHgYJbjF3yItja9u1XnxDY+PaF8pDT9D+jqPUf6aHQqGsunKQ7jYDvSvjoIjp2htDMzbyMppU86loepYIxXBEox22y3IzXglq4SZ8r9XbqzYXLv7qdeh7WS6up1ZPb92xXVFlq5om1F8WX/xhqjkc3fGV067KAas4HeEqj5DhXylGREr0kBd+j150E+ca0jJYdJqlUTp3KNGqMecYm2dVUCU8UzKcIDsTtfxKVQIKUOr1GMO3lus9/AVRLUMZEe62/vz5/4MasZZMdykSq9gNYtD+9MK4eCY3RhaE+x38JMoBzkNyynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7bwDf0qM/tQuy+789QAkidbPdSab2SEqKFy5qDE2ow=;
 b=AzygjbT2i+TV3XGyRZYsuV1GO/G63GmnWwAibfhtq3f0MLOXA1XRYc+eUyw04L9G37waAxBNMjAQ9t7zZxHF2vPKVfmPfYS/8ymWBREtiYqat/TIBXGQKNDUy74hCQXwvGEXxvhBPR2tPUB9pO8+BJ9aRkowQUHIPcgpPZDH2y0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 07:31:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Fri, 15 Jul 2022
 07:31:21 +0000
Message-ID: <138407a9-e97f-001e-6e87-e5d92a55c8e8@amd.com>
Date: Fri, 15 Jul 2022 09:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 2/6] drm/gem: Take reservation lock for vmap/vunmap
 operations
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
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
 <20220715005244.42198-3-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220715005244.42198-3-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4804b5a-7352-469f-3eaa-08da663403b0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4338:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y9BIhgcKhrwO2Wi+KpxBTiMCjT2gE7YIfKVQu71l+MYSa2zWeH+fEYE+jchr5RyzUK8DdPAH6exQ9SGMh60dOTIuByPUoJW3Hkq5ckMHswmw5QWYJcSXZhbA8BOKnECX+fHvxG9vrPtVRk4d20L4y2m71iDSHdvarvaGxlCZShGF2z/YrXDa1Rt7R+ld0/vRwFt6TFczwZgfHwYsHZRLeSCsBT2zAbGFC5d5RLh/pCQ/BSp4DJ9IbaAK/sG1mc0j7njP+Mg2ubudzGN57JsJ2/cnKgowhbT7VOvj+lG1kAQCbFePIaVFPJIwCSBOJCfiNkMwhEKcFG9vIYI4LqXLRaLzI5CCiDg4nB/ZofO7AlqeucoRu/TKA34JH6Dfc+tj+/MR9yDbI/RqJrFLeOui3Azivm2yPwQ5STE0n0n3wIEhLAjurvL4XT6eJRbaLjWbovPsWux1RAmKGSMNDLn3ws8foThus52yetfrp/rVCyYk20x/5RHAR3Phr5OF1DzGiTyPj6qUJEJTsCP7nxvxUfoar5mLdV6BV516F7MZmrCJ79kOYrDW3wJ2nsaLJHCnglcQnlCGZJUzn5xxZrMnnqxdFNfVF2RqmNZLEUi96PDJcLvndhFPKvriSkyenQpizDImPWgfVGYoQt2rCXT7YxEkuYZOAJoVsWGSfeBAySrbWJcmV88ooq04wC+XIvYkUf1E3Zj+JEW42PwF61jIntAj1/fMOE+t0gKRnd2vigC5AG/M+IW+lHiJM52RiHu+xZvndxieb7gWjs+ZR1G2HuhJnn+zzD7H235PsconYTmbyVrkWUyE3qj0s6tb9PO23TrmOg0wpm2SXOvGskqMZqUXcAnar1Cf3Ib2PmSW7q8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(316002)(41300700001)(83380400001)(6666004)(2906002)(31696002)(86362001)(478600001)(110136005)(2616005)(6506007)(6486002)(186003)(6512007)(36756003)(7416002)(5660300002)(38100700002)(7406005)(66476007)(4326008)(8936002)(8676002)(66556008)(31686004)(66946007)(921005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU9tVHpqUFZMQ2h6Z2NEQlFCcExOdFR6aFVCOHBhU3p1MVZ2NzQyMURUZGw1?=
 =?utf-8?B?MFZhZm45WW1UVEkyZTY4MWhPSFFaYk0yaE9hOGZXSWM0elJCaWQ2cjFBdFNj?=
 =?utf-8?B?c1IwbVBnalNET0NUbzdhM1pxOTFFdVl1T1k5L0xZd2NMclVyM1NXUGFmWmhG?=
 =?utf-8?B?dkhWbWVQZGlJdHpTaWRaZ3QyLy8vallXeHhmL2pvRFllV1VNbWZGeEpvZnYx?=
 =?utf-8?B?OUYvNHd3cXJyVm5wL3Roajh2NTFuVm1BYncwRmpGbERjWFk1UFpWbHZEd1ZH?=
 =?utf-8?B?eDg2VTcxQlFuaEhmU1dQV0d3U2JMQjJkOU1OaGVqM1FaRUpZZVV0YlBWbktr?=
 =?utf-8?B?MDBlTXUwVWRTY25Hc254OGZzR0dZd2VwSkdkVElUR2hRWDJRSko3VFErSDJh?=
 =?utf-8?B?UUxtL0hlTERmSlRqNDdMTFdzN0RkWTUwbFVWOXpJalhCNWlxSUQwemN6Vits?=
 =?utf-8?B?R0pQMjJOVlYzM24vUHVBMzkwbEliaThMYzdXVXp4c0FqaWx6RW5IZmJhdDRX?=
 =?utf-8?B?Y1ZtQ0M0ait0S25MVkczUTVHQlUySmlhQWxQY3JvMXVjR0JObHdoN1h4MzVR?=
 =?utf-8?B?N2tPZlJpbTUxc3lzTWloQUxqcWxMK2tjU0gzL2hIdVRkWVhtR05hWmlrZDFZ?=
 =?utf-8?B?M25WbEhJNjJDQ0VTanJyblBLUHp1RTUrYlJuczJUMWRRSHBQK3FGRU40Q09L?=
 =?utf-8?B?Wk1Ga2NraVZtYWVNU0xYU2hWMTBsb2dIaG5oV1FCdXVEZGlad2pxOGx5cUtt?=
 =?utf-8?B?Z1NveS9ycXpKaTBsdHpDSzhPWUJTcUhBbUlJa0cwaWIxd21rV0FSeFFQVkhl?=
 =?utf-8?B?eHh0VlpQVWpkb3NnYjUvVW1KZWFkRkVyVG1TdFFHbEpXS3ZnS3FxUitEaWJZ?=
 =?utf-8?B?VmlEaEdaYW8zSUN1cWlPS1pJMVBFREpkemFtTzBmamdyL3hKcXVjNHlzbjhk?=
 =?utf-8?B?d1hjcDg0Q3RDRHV6Vkk1ckJEVWRQNmcwNHdyenN3czJxYzB4NUt4WTFOdWNt?=
 =?utf-8?B?UXRKdWcyMjJNN1NJd3ZSNjlhTWMxaGNDQWJjeE9PcGJrYXAxZ2NkVExLcVNy?=
 =?utf-8?B?Umo5dHc2YkhjSVgvZXpoUnhJdC9TK0RMeU9EYmNVNVA0T1V5MFNwckJIK0xF?=
 =?utf-8?B?czhLdDFwR05yU2x6ZklVblIyWDc3WjlNbzFYek1CN3hYcXorMTdFMFFZL3ZC?=
 =?utf-8?B?SDRjTndnVzFocm1QU1pmZmZtenFSTlhKQ2JOdHp6b3JnUXpQQlJjVHNTNEE0?=
 =?utf-8?B?UTQ2R3o3UUF4NzFRVEFEb3QxUktwZFdNMEcyZXpaenNBUGdNN0JYNHQyc2dT?=
 =?utf-8?B?VWU4L214U1RlQWx1aDN2amxHSENrV0xXYzhSemRISHU5WWRaSFhHcTBkL3NM?=
 =?utf-8?B?aFl4SGhVV0ZuUGZ5bUMyTUV1VkhtWWxPeFhmRFZaZ3d2OWFvTERhL0xyMjNl?=
 =?utf-8?B?bUpTdGpsRE84OGlFTXRhV3BYWUNLeGJBdHB1cU9sT2VISnJ2Q1k0cjRxZ015?=
 =?utf-8?B?SExCUTVyUys3NXBWZGJrMm1OYnBDeklGeENMM28waXNrdFVPMDR6eFp5b1dw?=
 =?utf-8?B?NFArYXdxS3Vqc28zNThtMlBoK2p1eU1rNHV5VUVvWkViUEthUVEvMW5wclg5?=
 =?utf-8?B?NjJxeTdMZDBvc0gyLys5RmM4NDVuSUlVbUtIOUlNNmxDaTVtL0FiOXJFNmJV?=
 =?utf-8?B?RDM5Z05XNlVSMnQ4emovbk5DVXB4V3RBN1hsRlRnZS9ZTTJLRmlvV2x3QW1m?=
 =?utf-8?B?d29PRWxRNXBjTVB2bVByTjE5M0srS2V2dDIvQjdibUQ2VmF3UG03cmRNREFq?=
 =?utf-8?B?d3FhNGE4Y01EUkRzWllxWE8zcFU3dTVzUTFOd2kvd2Z6K0JLWlJzQ2xzVkdt?=
 =?utf-8?B?QjVLK040ZVE4UU5yWFVEVElOOEZTbjhnWHYyV1pTdXRqWUV2WmtPelgzSEQv?=
 =?utf-8?B?cFl1RTEvdUZORzBudU1vUzN0U09SbVFGdkw4b2xLdHl0UVBjanEzb09LWjVI?=
 =?utf-8?B?b3d6bFM1NXF3cS9valNpMHlXdVI3VTF5TXQrQVZmQVZ4clJ2L0N5dDJvb09Z?=
 =?utf-8?B?aW1CQkg1RXYrV09jMHoyK1NJZWdpNzhHekgySlByNjhlREpFM3E5OVNLZ0pE?=
 =?utf-8?B?c3ZGMEJDbHJ4L2ZOVGZQNnJ0a3c1L3VPS3Bkb3o3bm1jU01ZMEU4V3RqSXR2?=
 =?utf-8?Q?bZJsAarfJw11WK3HN8PWk+Vs08qIqcpBc49hznLHfovR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4804b5a-7352-469f-3eaa-08da663403b0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 07:31:21.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sIVSt/Kz3qpSEQ1FdbHocGr+ZKk3MC6frNNvwEg1e45w/VcWB6JgRx5nl94FwCDU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338
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
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.07.22 um 02:52 schrieb Dmitry Osipenko:
> The new common dma-buf locking convention will require buffer importers
> to hold the reservation lock around mapping operations. Make DRM GEM core
> to take the lock around the vmapping operations and update QXL and i915
> drivers to use the locked functions for the case where DRM core now holds
> the lock. This patch prepares DRM core and drivers to transition to the
> common dma-buf locking convention where vmapping of exported GEMs will
> be done under the held reservation lock.

Oh ^^ That looks like a bug fix to me!

At least drm_gem_ttm_vmap() and drm_gem_ttm_vunmap() already expected 
that they are called with the reservation lock held.

Otherwise you could mess up internal structures in the TTM buffer object 
while vmapping it.

I will take a deeper look at this.

Regards,
Christian.

>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/gpu/drm/drm_client.c                 |  4 +--
>   drivers/gpu/drm/drm_gem.c                    | 28 ++++++++++++++++++++
>   drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 ++---
>   drivers/gpu/drm/drm_prime.c                  |  4 +--
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c   |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c             | 17 ++++++------
>   drivers/gpu/drm/qxl/qxl_prime.c              |  4 +--
>   include/drm/drm_gem.h                        |  3 +++
>   8 files changed, 50 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 2b230b4d6942..fbcb1e995384 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -323,7 +323,7 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>   	 * fd_install step out of the driver backend hooks, to make that
>   	 * final step optional for internal users.
>   	 */
> -	ret = drm_gem_vmap(buffer->gem, map);
> +	ret = drm_gem_vmap_unlocked(buffer->gem, map);
>   	if (ret)
>   		return ret;
>   
> @@ -345,7 +345,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>   {
>   	struct iosys_map *map = &buffer->map;
>   
> -	drm_gem_vunmap(buffer->gem, map);
> +	drm_gem_vunmap_unlocked(buffer->gem, map);
>   }
>   EXPORT_SYMBOL(drm_client_buffer_vunmap);
>   
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index eb0c2d041f13..9769c33cad99 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1155,6 +1155,8 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
>   
>   int drm_gem_pin(struct drm_gem_object *obj)
>   {
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (obj->funcs->pin)
>   		return obj->funcs->pin(obj);
>   	else
> @@ -1163,6 +1165,8 @@ int drm_gem_pin(struct drm_gem_object *obj)
>   
>   void drm_gem_unpin(struct drm_gem_object *obj)
>   {
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (obj->funcs->unpin)
>   		obj->funcs->unpin(obj);
>   }
> @@ -1171,6 +1175,8 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
>   	int ret;
>   
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (!obj->funcs->vmap)
>   		return -EOPNOTSUPP;
>   
> @@ -1186,6 +1192,8 @@ EXPORT_SYMBOL(drm_gem_vmap);
>   
>   void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
> +	dma_resv_assert_held(obj->resv);
> +
>   	if (iosys_map_is_null(map))
>   		return;
>   
> @@ -1197,6 +1205,26 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>   }
>   EXPORT_SYMBOL(drm_gem_vunmap);
>   
> +int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +{
> +	int ret;
> +
> +	dma_resv_lock(obj->resv, NULL);
> +	ret = drm_gem_vmap(obj, map);
> +	dma_resv_unlock(obj->resv);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_vmap_unlocked);
> +
> +void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +{
> +	dma_resv_lock(obj->resv, NULL);
> +	drm_gem_vunmap(obj, map);
> +	dma_resv_unlock(obj->resv);
> +}
> +EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
> +
>   /**
>    * drm_gem_lock_reservations - Sets up the ww context and acquires
>    * the lock on an array of GEM objects.
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 880a4975507f..e35e224e6303 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -354,7 +354,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
>   			ret = -EINVAL;
>   			goto err_drm_gem_vunmap;
>   		}
> -		ret = drm_gem_vmap(obj, &map[i]);
> +		ret = drm_gem_vmap_unlocked(obj, &map[i]);
>   		if (ret)
>   			goto err_drm_gem_vunmap;
>   	}
> @@ -376,7 +376,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
>   		obj = drm_gem_fb_get_obj(fb, i);
>   		if (!obj)
>   			continue;
> -		drm_gem_vunmap(obj, &map[i]);
> +		drm_gem_vunmap_unlocked(obj, &map[i]);
>   	}
>   	return ret;
>   }
> @@ -403,7 +403,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map)
>   			continue;
>   		if (iosys_map_is_null(&map[i]))
>   			continue;
> -		drm_gem_vunmap(obj, &map[i]);
> +		drm_gem_vunmap_unlocked(obj, &map[i]);
>   	}
>   }
>   EXPORT_SYMBOL(drm_gem_fb_vunmap);
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index b75ef1756873..1bd234fd21a5 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -678,7 +678,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	return drm_gem_vmap(obj, map);
> +	return drm_gem_vmap_unlocked(obj, map);
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>   
> @@ -694,7 +694,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>   {
>   	struct drm_gem_object *obj = dma_buf->priv;
>   
> -	drm_gem_vunmap(obj, map);
> +	drm_gem_vunmap_unlocked(obj, map);
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index 5ecea7df98b1..cc54a5b1d6ae 100644
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
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index 695d9308d1f0..06a58dad5f5c 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -168,9 +168,16 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
>   		bo->map_count++;
>   		goto out;
>   	}
> -	r = ttm_bo_vmap(&bo->tbo, &bo->map);
> +
> +	r = __qxl_bo_pin(bo);
>   	if (r)
>   		return r;
> +
> +	r = ttm_bo_vmap(&bo->tbo, &bo->map);
> +	if (r) {
> +		__qxl_bo_unpin(bo);
> +		return r;
> +	}
>   	bo->map_count = 1;
>   
>   	/* TODO: Remove kptr in favor of map everywhere. */
> @@ -192,12 +199,6 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
>   	if (r)
>   		return r;
>   
> -	r = __qxl_bo_pin(bo);
> -	if (r) {
> -		qxl_bo_unreserve(bo);
> -		return r;
> -	}
> -
>   	r = qxl_bo_vmap_locked(bo, map);
>   	qxl_bo_unreserve(bo);
>   	return r;
> @@ -247,6 +248,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
>   		return;
>   	bo->kptr = NULL;
>   	ttm_bo_vunmap(&bo->tbo, &bo->map);
> +	__qxl_bo_unpin(bo);
>   }
>   
>   int qxl_bo_vunmap(struct qxl_bo *bo)
> @@ -258,7 +260,6 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
>   		return r;
>   
>   	qxl_bo_vunmap_locked(bo);
> -	__qxl_bo_unpin(bo);
>   	qxl_bo_unreserve(bo);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
> index 142d01415acb..9169c26357d3 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -59,7 +59,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   	int ret;
>   
> -	ret = qxl_bo_vmap(bo, map);
> +	ret = qxl_bo_vmap_locked(bo, map);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -71,5 +71,5 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
>   {
>   	struct qxl_bo *bo = gem_to_qxl_bo(obj);
>   
> -	qxl_bo_vunmap(bo);
> +	qxl_bo_vunmap_locked(bo);
>   }
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 87cffc9efa85..bf3700415229 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -420,4 +420,7 @@ void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
>   int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>   			    u32 handle, u64 *offset);
>   
> +int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> +void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> +
>   #endif /* __DRM_GEM_H__ */

