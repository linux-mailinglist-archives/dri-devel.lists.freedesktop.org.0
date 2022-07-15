Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10915575BCF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 08:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628511311F;
	Fri, 15 Jul 2022 06:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2B1113158;
 Fri, 15 Jul 2022 06:50:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mc2N6O/h2GNuyLihXJMsb7LYCdhcW/jK636zVxThgPrygQi433HUrcR/5LE016H7d3vBJHhFYRWj54I/SikDWKAx/hiQGLgfSqtQcp9bKVDlg113Hl6dp+Nuz0y1bDSVi+4jm6rOWMY+l3sZ9E3mRXYN0y5D1XML7Krd+Zzo3owZrfoNd/zoD5VsPb5lyHYQX16Zvqt32p/riAb5yxM8bDs2iWH62TDMCDuauudz/3BGIIPbSgYNumVd8Hlt3d4OzeJOKzmAEkZ+XxcdoIrQVLXGZ1TDDQ15KZn3Rr/8RgNXqaxvI8yzCozmUvU3oGoA3INp9rxVuh2hyvzk0MJ04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XPrBxsurKG5tgo/vF50aNek4fwAmMATZcqgXlWNTDw=;
 b=k62JMdB93eaRrRvC7ODr4539SDn8QJmJxOCo53P3663rBvIJ12tYIaN4C1yjeTM28piV31aNE/SkTVwDfVn0UMLhhszDT1XKl9h7tvBs1jXq8UavZmcdaYvwBndcCaZiBpyXD7GF8UZU8G+9PnarxB/Z5pTQOBN6mNXoaROgA5GafCIAlj/JwVAuQXBVMsFoFTzmyrNQLXYNiNP8axusc1232WlDaI50HOYOLIlq4IROhzJY/+DzStK3Yc122CswIt0VTfJKiNGWI/2XQS58xSn95K73S5KmefWcadEQlHCXcdrhITc1vZtc7Vdvfm8Bn4KyAcFwtuSo0gh8pn8OEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7XPrBxsurKG5tgo/vF50aNek4fwAmMATZcqgXlWNTDw=;
 b=PssuYSDXjrEr2cjFnxkhr87Z1jxFiVvQ/+Y1sGcFDKsRJhq9COk2QEirN5MDfhVKS02YV4g+ax8bxKg5PELuVst8x7IeX8nWRpGlLr0jAgNufr96dPtyG8ZjodKs+n0SqvoQr0UqPnKrpnUrIwkZ2T7w/UA1NLHcDP32eIfaW9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2536.namprd12.prod.outlook.com (2603:10b6:4:b3::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 15 Jul
 2022 06:50:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5438.013; Fri, 15 Jul 2022
 06:50:31 +0000
Message-ID: <5ec9313e-8498-2838-0320-331c347ce905@amd.com>
Date: Fri, 15 Jul 2022 08:50:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 4/6] dma-buf: Acquire wait-wound context on attachment
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
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
 <20220715005244.42198-5-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220715005244.42198-5-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3195ab3a-2346-4469-0838-08da662e4f23
X-MS-TrafficTypeDiagnostic: DM5PR12MB2536:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DMqdyag8qXDArG67fDoC+eKnqU31MX5K4Lnz51InU7X6OJ5+vrBxYZq/hZ9jFyVhlRizKP96qbD9imP9frt1i+h34cRRf27AS+fWija7atOHeUFEti2AoHH5LulmBqRGHTnU3k80XYT/JTzr7qZXZwNVzdD/rSxL703o/ggM/KM6I+Er5VUWpyD4D/Qewk1z1n4cu425tHz1Ly/FW8vtcJ345ESJL98qXcr9d+3wUC5mmUCX8JQSyTKaI7uzr0YsONHLy31RlprdoyGrp4JjzzpngGBgYSgs3W3WROUYsqQADYc2FawG1enRKux4jyU/td+vC1zlUsPrU7FxI4KpJ0Am2kijeZZmv1uyy0GJRfMnb0IYYdwbczvNIATN+DUjMwlqkpvRuPudV1lm7vH6uFauOUd3o+xdZvKP7qsslFzv29doEpANIxzT2CRowbbVKf6EyDakOi4t6+FOqO4ZO2eUSWGEays2hkz0AxuW8I5URbumF9xkRY47XfBj8mN81/SiIyzT63m2wE6t0hhGqTT78Y3G7wziEHCOkpqGv3Db1k4kW1qtZTI/EdTyDQJ90f2rgirEoHBb4EBh3YwhtX6MhhLO1QA5lFPcrUcKVKDnhuIdU53HoT46u9IyhjRAMFNFezDachnmJSZYUnyNrtXGZAIFf2bPKP1bJqKs4nQXHdH04GErk/un3jIurDbOdsnkAkNWdsNu6UlgcKio/TWKNqFmSSHYagTKBpU02/AP9DBnyhZk91xAvZ31CLuVYC0EyZ5PT46bi6ML+xAXJWDTOSy8+9jRoTiWylF9+OI5qydZoEMebDxTPFBvUWyaSR/q+0f/Voh3o4xheTSKjuX9jroOQ6rLLY06B6/ZrsZLNInbzjqk9kyqBWeM5wF7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(5660300002)(36756003)(83380400001)(86362001)(7416002)(186003)(2616005)(921005)(2906002)(7406005)(8676002)(66946007)(66476007)(478600001)(6506007)(6666004)(31686004)(66556008)(41300700001)(316002)(31696002)(6486002)(110136005)(6512007)(38100700002)(4326008)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Snk5UnMzVXhrd2NSaW1qN0MvVVFNRjRneEljb0cvNHRvRjIyNUtKNmQwUVF5?=
 =?utf-8?B?eHdCSUVHWS81ZWMvSlQ0V1BwN24vb01GZjdGZGF5SkNlSXlZdlpJbmhHOExS?=
 =?utf-8?B?a2JadTF6N2h5UFRXWU12RkVHQkhLYkQrWGhiT29ZNnc4dW00eVc0cWNZa3Ar?=
 =?utf-8?B?TGVPbW9jd0plUlhZa0QyRHBHMVNCcnJtaVZrREdUeUh2S1JBQncwaWZBWE95?=
 =?utf-8?B?WGlpQkFhTkZWWGVGTVdYQVRNN1RQUEk1Z241YlYwclR1WVNEZGFKeHZNYS92?=
 =?utf-8?B?dHF0ZnU4MlFTamg4YStDY3gvWVZQS1l0Zk1rNVpKOWZCeU5GUE9tSHg5SWk1?=
 =?utf-8?B?QjBldlJzcm9qU0x6cGVObEN6eUd3dnBMUnJMeXVHZ0U1OUJNV09jWnNxNjVB?=
 =?utf-8?B?Tjlab0lha2h6cm5pZkpXZ1ZJZU91eGlXNTRtQnhJSEtXM2NEaWQxNlpJeDI3?=
 =?utf-8?B?UWVFY3ZGRGd5R1JkQ3BVT3liTDl4eXhRcU0vY04zTkdhNFJWbmkyYW9KdkpZ?=
 =?utf-8?B?R3g2bzZxTnA2dWEwMXBPWXlvd3FlQjZtN1lQdDRoUWVBNWFCYXplY2h6c3R3?=
 =?utf-8?B?NEh3T1N5N08rUXBsZlB5Z3VsNHNUUmsyNmFFUUROZTVCaFZLWEV3dldVeC8v?=
 =?utf-8?B?S09xVnFMMmJ1cm1rS0hzM1hjZUZNUkJUOVFRZ2NmSTU5cGV4c1VVMUxZckNU?=
 =?utf-8?B?L0c0YUVlTkVseUl2eS9KNTRhMWJncVRCeThnNmZDV0pQUkVhOWhkTzZ6TnUz?=
 =?utf-8?B?RHBQdHJkcmhadlpha1RnOWxsNjZCWGNVNUx3MnZjclBtMi9WWWZwVERrN2dT?=
 =?utf-8?B?cWgySzJwak9COVE0bXN2M0k0TWxERzlxSi90OHMzYnVQeXFQdnNUZ0thbDI5?=
 =?utf-8?B?UGlRZEx6YXd1UTFmNk9OWHlzZzZqdVl4Ym1XZkw2bVFrUERENThGaGZ6c25V?=
 =?utf-8?B?a1NQUTBQRWNvZHk3ZkJCT1BBaFNrQnR0ZkYwaVRIam1JUXhPMWxVZzA5RVdB?=
 =?utf-8?B?TWxuWitxU0cxOVV3OExQYlRMWTBEZnBMTzZpOTRCNXFPaHc5MnFYZjNkNW9T?=
 =?utf-8?B?M0NrbEgxblhkMFJZSHlDeC9jbUw1VzRHTFB4N2U1czdybDhPVnUwTytQK203?=
 =?utf-8?B?dU9uZjVoamFlbkN0T00wSXFyQWdsTVYxcGJDdUlEMTVJY1ZBZmJyT0xadncx?=
 =?utf-8?B?ak5ySnpWdFN2aURYdEhTYU1NNk8zK1V6TzdaczJGMkZ5ckFwV2tIVTluOEI1?=
 =?utf-8?B?ckNja1BIaEw5S3AyaFdiVytxQ3RKQTBFUldZWTdjSFgvV1Q2bmF5a2xzTFZ0?=
 =?utf-8?B?QlFBejJhLzNObFdjd2I4MGhNVVgwVkw1eDhMZ2NkaE5xS1I1ZVg2dWFsTXk1?=
 =?utf-8?B?TTFvQUZzNmEzMUsxU1I0blBvSzVSc29hTGFCRFRIbitlVG5acWxPZWdETkxE?=
 =?utf-8?B?Q2FLZW1xWlRHZjdlY3VyaUh3U2dlWW5yaGVQRlQ0UUJkR0VOSm1TVFVrTVZO?=
 =?utf-8?B?VHB3S1F2aXRPMFYzeEZTVE41WUdPQlB5WW52b1VOdmUxb1dtZEFXQjdsMkNI?=
 =?utf-8?B?cmZyamhRL045ZjFDcTV0T1BZTmcrV3p2eVJzS3RwbzUwVFFtc2hIaGM0Uk9v?=
 =?utf-8?B?OVJ2dkZISUpSQXJLR2l6dWxIaFlJUnFxTDY4YUt4dXV0bjEwOU16Ymx6SVdw?=
 =?utf-8?B?RmJ1S2VQQjAyU1NMbE05S2FjcVUrWTNCQi85aENrVzhyaU9uczZaTlpKU1pw?=
 =?utf-8?B?Q21KVENDWTVkcTBJYTlsaGxNZXh1cEZnRFpGWTJSL1REcEY1ZFBoZjVGazlF?=
 =?utf-8?B?ZHV5ZjNrQkFPd1g1ZzV6cjNjYTBnZXpQL0dCZDlNYXlJOHY1RnE1czFTVTZN?=
 =?utf-8?B?YTloUHZidnh3d09uVjlRQWJmVytjV2xRNGVyUEFKUlJhRnFrK2JtSmFrbHBP?=
 =?utf-8?B?elhXTVRtMXNHV3ZHNXAvUVFzQW8vK2trWm9PeisydWtVM3plTEhjaW96dXhS?=
 =?utf-8?B?QXBFczRPSTdLcnJiRlgyOGRWb2NYejJCRjJEd3ExZmV6L3EvanArK1hHUUxo?=
 =?utf-8?B?M2IzWmtnTmZjN0FNSEtWOUlvWStoaURNa1JWSm1YNHhwa1ZiTTZyZWpsQ2Uv?=
 =?utf-8?B?R094SDNqbnA3K0xVbkFWb2s0aUxXcEl3YTlUTEgvMDBlNllEY2d1T2pzTUty?=
 =?utf-8?Q?0sAOVuNwtfcWUHY6xwZF+B4EpO8ETZrB+F7ctNBUzRup?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3195ab3a-2346-4469-0838-08da662e4f23
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 06:50:31.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: codVnnDgFj6BXc8Xs1L3879sQsy3ytojKhu0s5Wola4wS1flh3IXl3yC88odEgrJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2536
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
> Intel i915 GPU driver uses wait-wound mutex to lock multiple GEMs on the
> attachment to the i915 dma-buf. In order to let all drivers utilize shared
> wait-wound context during attachment in a general way, make dma-buf core to
> acquire the ww context internally for the attachment operation and update
> i915 driver to use the importer's ww context instead of the internal one.
>
>  From now on all dma-buf exporters shall use the importer's ww context for
> the attachment operation.
>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>   drivers/dma-buf/dma-buf.c                     |  8 +++++-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  2 +-
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  6 ++---
>   drivers/gpu/drm/i915/i915_gem_evict.c         |  2 +-
>   drivers/gpu/drm/i915/i915_gem_ww.c            | 26 +++++++++++++++----
>   drivers/gpu/drm/i915/i915_gem_ww.h            | 15 +++++++++--
>   7 files changed, 47 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 0ee588276534..37545ecb845a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -807,6 +807,8 @@ static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
>    * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
>    * functionality.
>    *
> + * Exporters shall use ww_ctx acquired by this function.
> + *
>    * Returns:
>    *
>    * A pointer to newly created &dma_buf_attachment on success, or a negative
> @@ -822,6 +824,7 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   				void *importer_priv)
>   {
>   	struct dma_buf_attachment *attach;
> +	struct ww_acquire_ctx ww_ctx;
>   	int ret;
>   
>   	if (WARN_ON(!dmabuf || !dev))
> @@ -841,7 +844,8 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   	attach->importer_ops = importer_ops;
>   	attach->importer_priv = importer_priv;
>   
> -	dma_resv_lock(dmabuf->resv, NULL);
> +	ww_acquire_init(&ww_ctx, &reservation_ww_class);
> +	dma_resv_lock(dmabuf->resv, &ww_ctx);

That won't work like this. The core property of a WW context is that you 
need to unwind all the locks and re-quire them with the contended one first.

When you statically lock the imported one here you can't do that any more.

Regards,
Christian.

>   
>   	if (dmabuf->ops->attach) {
>   		ret = dmabuf->ops->attach(dmabuf, attach);
> @@ -876,11 +880,13 @@ dma_buf_dynamic_attach_unlocked(struct dma_buf *dmabuf, struct device *dev,
>   	}
>   
>   	dma_resv_unlock(dmabuf->resv);
> +	ww_acquire_fini(&ww_ctx);
>   
>   	return attach;
>   
>   err_attach:
>   	dma_resv_unlock(attach->dmabuf->resv);
> +	ww_acquire_fini(&ww_ctx);
>   	kfree(attach);
>   	return ERR_PTR(ret);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index c199bf71c373..9173f0232b16 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -173,7 +173,7 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
>   	if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
>   		return -EOPNOTSUPP;
>   
> -	for_i915_gem_ww(&ww, err, true) {
> +	for_i915_dmabuf_ww(&ww, dmabuf, err, true) {
>   		err = i915_gem_object_migrate(obj, &ww, INTEL_REGION_SMEM);
>   		if (err)
>   			continue;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 30fe847c6664..ad7d602fc43a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -3409,7 +3409,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>   		goto err_vma;
>   	}
>   
> -	ww_acquire_done(&eb.ww.ctx);
> +	ww_acquire_done(eb.ww.ctx);
>   	eb_capture_stage(&eb);
>   
>   	out_fence = eb_requests_create(&eb, in_fence, out_fence_fd);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index e11d82a9f7c3..5ae38f94a5c7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -178,9 +178,9 @@ static inline int __i915_gem_object_lock(struct drm_i915_gem_object *obj,
>   	int ret;
>   
>   	if (intr)
> -		ret = dma_resv_lock_interruptible(obj->base.resv, ww ? &ww->ctx : NULL);
> +		ret = dma_resv_lock_interruptible(obj->base.resv, ww ? ww->ctx : NULL);
>   	else
> -		ret = dma_resv_lock(obj->base.resv, ww ? &ww->ctx : NULL);
> +		ret = dma_resv_lock(obj->base.resv, ww ? ww->ctx : NULL);
>   
>   	if (!ret && ww) {
>   		i915_gem_object_get(obj);
> @@ -216,7 +216,7 @@ static inline bool i915_gem_object_trylock(struct drm_i915_gem_object *obj,
>   	if (!ww)
>   		return dma_resv_trylock(obj->base.resv);
>   	else
> -		return ww_mutex_trylock(&obj->base.resv->lock, &ww->ctx);
> +		return ww_mutex_trylock(&obj->base.resv->lock, ww->ctx);
>   }
>   
>   static inline void i915_gem_object_unlock(struct drm_i915_gem_object *obj)
> diff --git a/drivers/gpu/drm/i915/i915_gem_evict.c b/drivers/gpu/drm/i915/i915_gem_evict.c
> index f025ee4fa526..047f72e32d47 100644
> --- a/drivers/gpu/drm/i915/i915_gem_evict.c
> +++ b/drivers/gpu/drm/i915/i915_gem_evict.c
> @@ -458,7 +458,7 @@ int i915_gem_evict_vm(struct i915_address_space *vm, struct i915_gem_ww_ctx *ww)
>   			 * need the object ref.
>   			 */
>   			if (dying_vma(vma) ||
> -			    (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == &ww->ctx))) {
> +			    (ww && (dma_resv_locking_ctx(vma->obj->base.resv) == ww->ctx))) {
>   				__i915_vma_pin(vma);
>   				list_add(&vma->evict_link, &locked_eviction_list);
>   				continue;
> diff --git a/drivers/gpu/drm/i915/i915_gem_ww.c b/drivers/gpu/drm/i915/i915_gem_ww.c
> index 3f6ff139478e..c47898993c7d 100644
> --- a/drivers/gpu/drm/i915/i915_gem_ww.c
> +++ b/drivers/gpu/drm/i915/i915_gem_ww.c
> @@ -6,12 +6,20 @@
>   #include "i915_gem_ww.h"
>   #include "gem/i915_gem_object.h"
>   
> -void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr)
> +void i915_gem_ww_ctx_prep(struct i915_gem_ww_ctx *ww,
> +			  struct ww_acquire_ctx *ww_ctx,
> +			  bool intr)
>   {
> -	ww_acquire_init(&ww->ctx, &reservation_ww_class);
>   	INIT_LIST_HEAD(&ww->obj_list);
>   	ww->intr = intr;
>   	ww->contended = NULL;
> +	ww->ctx = ww_ctx;
> +}
> +
> +void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr)
> +{
> +	ww_acquire_init(&ww->ww_ctx, &reservation_ww_class);
> +	i915_gem_ww_ctx_prep(ww, &ww->ww_ctx, intr);
>   }
>   
>   static void i915_gem_ww_ctx_unlock_all(struct i915_gem_ww_ctx *ww)
> @@ -36,7 +44,15 @@ void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ww)
>   {
>   	i915_gem_ww_ctx_unlock_all(ww);
>   	WARN_ON(ww->contended);
> -	ww_acquire_fini(&ww->ctx);
> +
> +	if (ww->ctx == &ww->ww_ctx)
> +		ww_acquire_fini(ww->ctx);
> +}
> +
> +void i915_gem_ww_ctx_fini2(struct i915_gem_ww_ctx *ww)
> +{
> +	i915_gem_ww_ctx_unlock_all(ww);
> +	WARN_ON(ww->contended);
>   }
>   
>   int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
> @@ -48,9 +64,9 @@ int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ww)
>   
>   	i915_gem_ww_ctx_unlock_all(ww);
>   	if (ww->intr)
> -		ret = dma_resv_lock_slow_interruptible(ww->contended->base.resv, &ww->ctx);
> +		ret = dma_resv_lock_slow_interruptible(ww->contended->base.resv, ww->ctx);
>   	else
> -		dma_resv_lock_slow(ww->contended->base.resv, &ww->ctx);
> +		dma_resv_lock_slow(ww->contended->base.resv, ww->ctx);
>   
>   	if (!ret)
>   		list_add_tail(&ww->contended->obj_link, &ww->obj_list);
> diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i915_gem_ww.h
> index 86f0fe343de6..e9b0fd4debbf 100644
> --- a/drivers/gpu/drm/i915/i915_gem_ww.h
> +++ b/drivers/gpu/drm/i915/i915_gem_ww.h
> @@ -8,13 +8,17 @@
>   #include <drm/drm_drv.h>
>   
>   struct i915_gem_ww_ctx {
> -	struct ww_acquire_ctx ctx;
> +	struct ww_acquire_ctx *ctx;
> +	struct ww_acquire_ctx ww_ctx;
>   	struct list_head obj_list;
>   	struct drm_i915_gem_object *contended;
>   	bool intr;
>   };
>   
> -void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
> +void i915_gem_ww_ctx_prep(struct i915_gem_ww_ctx *ww,
> +			  struct ww_acquire_ctx *ww_ctx,
> +			  bool intr);
> +void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ww, bool intr);
>   void i915_gem_ww_ctx_fini(struct i915_gem_ww_ctx *ctx);
>   int __must_check i915_gem_ww_ctx_backoff(struct i915_gem_ww_ctx *ctx);
>   void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
> @@ -38,4 +42,11 @@ static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww, int err)
>   	for (i915_gem_ww_ctx_init(_ww, _intr), (_err) = -EDEADLK; \
>   	     (_err) == -EDEADLK;				  \
>   	     (_err) = __i915_gem_ww_fini(_ww, _err))
> +
> +#define for_i915_dmabuf_ww(_ww, _dmabuf, _err, _intr)		  \
> +	for (i915_gem_ww_ctx_prep(_ww, dma_resv_locking_ctx((_dmabuf)->resv), _intr), \
> +	     (_err) = -EDEADLK; 				  \
> +	     (_err) == -EDEADLK;				  \
> +	     (_err) = __i915_gem_ww_fini(_ww, _err))
> +
>   #endif

