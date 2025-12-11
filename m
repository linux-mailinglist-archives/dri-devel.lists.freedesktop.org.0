Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2090FCB649A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858210E04C;
	Thu, 11 Dec 2025 15:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="L/jXXvCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A034710E04C;
 Thu, 11 Dec 2025 15:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765466188; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=L9VYmwF1ZV8mBvucp3svl+n1MZEnWQ04BL2BhNVuEMK6dCSfOeQuAT97cDSJwI2UtS5eS+maNpMT36+E1J9CzLenf0SwAHPud6VltN4mVmuujvF+jwhF8COSljdNWrlZT/Y/wOvAOC01CvvYY5bjjmtQaHkZdf/a+uLsc16RwWE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765466188;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=N/SEPPS3LkYORhwqK+Trj2yot7q9tIQx0jdFwhoKT5g=; 
 b=Yv5af2b0YtOIVbVBwQckS9812m+mnbuhUpQ4QpChqPvKJwPrZkAnyBH0ciyo6jBkiGQTMPUGEoez+4bySY1CUTrunn3Earx6ny21zE6HODfZe6SesicfMLmZQu8RGOHO0UvdGh0TcLON91nyH2W4xLfWl4K95ch6Wn3HUu69A6U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765466188; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=N/SEPPS3LkYORhwqK+Trj2yot7q9tIQx0jdFwhoKT5g=;
 b=L/jXXvCBWUVNoYDSVpKQzIj0UZfcnyE8Lh8Z2YHt8KxEHygIUMmoLAroU/yz9igs
 IHcH9pFbI6OQw8HIoZSj+W+05VcMrgEAQmqiNCbwAlVPkFT3iJ1IBBc9QiyKK5pMI0M
 h8uNTJ5v12VQvdswTB6xWbFG8lMowpjEs86OuFbU=
Received: by mx.zohomail.com with SMTPS id 1765466186652613.9579128013164;
 Thu, 11 Dec 2025 07:16:26 -0800 (PST)
Message-ID: <68c83842-16e9-429b-96c8-50c8a15c659c@collabora.com>
Date: Thu, 11 Dec 2025 12:16:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 07/20] drm/atomic: Pass post_blend_color_pipeline
 client cap to atomic check
To: Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-7-ac4471b44758@collabora.com>
 <93edf489-c4f6-4f0d-a0d5-673da051983d@amd.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <93edf489-c4f6-4f0d-a0d5-673da051983d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <68c83842-16e9-429b-96c8-50c8a15c659c@collabora.com>+zmo_0_ariel.dalessandro@collabora.com
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

Harry,

On 9/29/25 6:50 AM, Harry Wentland wrote:
> 
> 
> On 2025-09-17 20:43, Nícolas F. R. A. Prado wrote:
>> Pass the state of the post-blend color pipeline client cap to the atomic
>> state so that drivers can rely on it to enable color pipeline
>> functionality and ignore the deprecated color management CRTC
>> properties.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c |  1 +
>>   include/drm/drm_atomic.h          | 20 ++++++++++++++++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/ 
>> drm_atomic_uapi.c
>> index 
>> f5125fa3fa28ff2a6ff07fd7cf07d4bdf77ab738..56a440a9390c7730c4c41b491f29b933a2bbb889 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1660,6 +1660,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>       state->acquire_ctx = &ctx;
>>       state->allow_modeset = !!(arg->flags & 
>> DRM_MODE_ATOMIC_ALLOW_MODESET);
>>       state->plane_color_pipeline = file_priv->plane_color_pipeline;
>> +    state->post_blend_color_pipeline = file_priv- 
>> >post_blend_color_pipeline;
>>   retry:
>>       copied_objs = 0;
>> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
>> index 
>> 678708df9cdb90b4266127193a92183069f18688..8c42c584aefbf0034b2163d90538e80099b0dadb 100644
>> --- a/include/drm/drm_atomic.h
>> +++ b/include/drm/drm_atomic.h
>> @@ -482,6 +482,26 @@ struct drm_atomic_state {
>>        */
>>       bool plane_color_pipeline : 1;
>> +    /**
>> +     * @post_blend_color_pipeline:
>> +     *
>> +     * Indicates whether this atomic state originated with a client that
>> +     * set the DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE.
>> +     *
>> +     * Drivers and helper functions should use this to ignore legacy
>> +     * properties that are incompatible with the drm_crtc COLOR_PIPELINE
>> +     * behavior, such as:
>> +     *
>> +     *  - GAMMA_LUT
>> +     *  - DEGAMMA_LUT
>> +     *  - GAMMA_LUT_SIZE
>> +     *  - CTM
>> +     *
>> +     * or any other driver-specific properties that might affect pixel
>> +     * values.
>> +     */
>> +    bool post_blend_color_pipeline : 1;
> 
> As with the client cap name, I recommend calling this
> crtc_color_pipeline.

Agreed. As per the rest of the comments, I think it's worth moving all 
naming in this series from post_blend to crtc, matching the criteria 
used in plane (a.k.a. pre-blend) color pipelines.

Will submit the related changes in v3.

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

