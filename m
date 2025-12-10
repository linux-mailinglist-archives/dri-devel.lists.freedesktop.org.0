Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEABCB4056
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 22:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2315A10E079;
	Wed, 10 Dec 2025 21:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Gf3OfXi8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037F310E079;
 Wed, 10 Dec 2025 21:00:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765400429; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Rotfge2TsMe02GB+EgEM2M+I5hZ2rpa16JI382w8qS8XRrsMXQirVUBcL9KXpQu/RlYJlOhd8SDgJyZKoJQ1UXqFLFllB4b0C436rcGLVqLM1N4fqD/KVNhVPMVKCjC2iLVBFOU680Rfd+oMFJ2OuHB+uBDMwI22WRot7hgvO9s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765400429;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2yqsrRa6qgW4Cllv3pVozc+YmnclQj30ZO3ZAu3Wr9w=; 
 b=S+NY749U4ej60VwghUVgl9gBBfzU4GEWDvNrMy9cLZRpJNitTYUf7lre/NSyVuI2T4ANqYEpwh09PW9xzjLU4A4ek+NYLzm33Hm2vaEmUTXN9tJ24Ia8t/gOHUzvWWz2YOjwzgAVw8psWGc0cqR9eXEMc/qn6nr3t6N52RS54VM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765400429; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2yqsrRa6qgW4Cllv3pVozc+YmnclQj30ZO3ZAu3Wr9w=;
 b=Gf3OfXi8wz1INDcmfHO0wB3nrskfeMYYmXHRgN1ab7E0OAqkm3Sj2ixXoujJXlxO
 lOXq6mzawLH2VkpLBhWI7PvlJU4AeZX+RHYe2FsNkQv84HK6LmCnEOzSYe8RSwXf26i
 i7XT6E+8YxoBjwRGe90RIcQiX/3HQoREQ3Rn68oQ=
Received: by mx.zohomail.com with SMTPS id 1765400426236427.4770478258175;
 Wed, 10 Dec 2025 13:00:26 -0800 (PST)
Message-ID: <acd144d5-9bf7-4661-9f3a-5b55a8132b10@collabora.com>
Date: Wed, 10 Dec 2025 18:00:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/20] drm/crtc: Add COLOR_PIPELINE property
To: Louis Chauvet <louis.chauvet@bootlin.com>,
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
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, kernel@collabora.com,
 daniels@collabora.com, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-4-ac4471b44758@collabora.com>
 <5aaecb8b-08c6-4982-86c8-18ebb4544f4c@bootlin.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <5aaecb8b-08c6-4982-86c8-18ebb4544f4c@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <acd144d5-9bf7-4661-9f3a-5b55a8132b10@collabora.com>+zmo_0_ariel.dalessandro@collabora.com
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

Louis,

On 9/19/25 9:43 AM, Louis Chauvet wrote:
> 
> 
> Le 18/09/2025 à 02:43, Nícolas F. R. A. Prado a écrit :
>> Add a COLOR_PIPELINE property to the CRTC to allow userspace to set a
>> post-blend color pipeline analogously to how pre-blend color pipelines
>> are set on planes.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c | 49 +++++++++++++++++++++++++++++ 
>> ++++++----
>>   drivers/gpu/drm/drm_crtc.c        | 33 ++++++++++++++++++++++++++
>>   include/drm/drm_atomic_uapi.h     |  2 ++
>>   include/drm/drm_crtc.h            | 11 +++++++++
>>   4 files changed, 91 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/ 
>> drm_atomic_uapi.c
>> index 
>> b7cc6945864274bedd21dd5b73494f9aae216888..063c142fd9b656e228cfc660d005a3fbb4640d32 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -287,6 +287,33 @@ drm_atomic_set_colorop_for_plane(struct 
>> drm_plane_state *plane_state,
>>   }
>>   EXPORT_SYMBOL(drm_atomic_set_colorop_for_plane);
>> +/**
>> + * drm_atomic_set_colorop_for_crtc - set colorop for crtc
>> + * @crtc_state: atomic state object for the crtc
>> + * @colorop: colorop to use for the crtc
>> + *
>> + * Helper function to select the color pipeline on a crtc by setting
>> + * it to the first drm_colorop element of the pipeline.
>> + */
>> +void
>> +drm_atomic_set_colorop_for_crtc(struct drm_crtc_state *crtc_state,
>> +                 struct drm_colorop *colorop)
>> +{
>> +    struct drm_crtc *crtc = crtc_state->crtc;
>> +
>> +    if (colorop)
>> +        drm_dbg_atomic(crtc->dev,
>> +                   "Set [COLOROP:%d] for [CRTC:%d:%s] state %p\n",
>> +                   colorop->base.id, crtc->base.id, crtc->name,
>> +                   crtc_state);
>> +    else
>> +        drm_dbg_atomic(crtc->dev,
>> +                   "Set [NOCOLOROP] for [CRTC:%d:%s] state %p\n",
>> +                   crtc->base.id, crtc->name, crtc_state);
>> +
>> +    crtc_state->color_pipeline = colorop;
>> +}
>> +EXPORT_SYMBOL(drm_atomic_set_colorop_for_crtc);
>>   /**
>>    * drm_atomic_set_crtc_for_connector - set CRTC for connector
>> @@ -396,8 +423,8 @@ static s32 __user 
>> *get_out_fence_for_connector(struct drm_atomic_state *state,
>>   }
>>   static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>> -        struct drm_crtc_state *state, struct drm_property *property,
>> -        uint64_t val)
>> +        struct drm_crtc_state *state, struct drm_file *file_priv,
>> +        struct drm_property *property, uint64_t val)
>>   {
>>       struct drm_device *dev = crtc->dev;
>>       struct drm_mode_config *config = &dev->mode_config;
>> @@ -406,7 +433,17 @@ static int drm_atomic_crtc_set_property(struct 
>> drm_crtc *crtc,
>>       if (property == config->prop_active)
>>           state->active = val;
>> -    else if (property == config->prop_mode_id) {
>> +    else if (property == crtc->color_pipeline_property) {
>> +        /* find DRM colorop object */
>> +        struct drm_colorop *colorop = NULL;
>> +
>> +        colorop = drm_colorop_find(dev, file_priv, val);
>> +
>> +        if (val && !colorop)
>> +            return -EACCES;
>> +
>> +        drm_atomic_set_colorop_for_crtc(state, colorop);
> 
> I don't know if this is needed, but you added a warning/early return for 
> ctm/degamma_lut if file_priv->post_blend_color_pipeline is true.
> 
> Does it make sense to add this?
> 
>      if (!file_priv->post_blend_color_pipeline) {
>              drm_dbg_atomic(dev,
>                  "Setting COLOR_PIPELINE property not permitted without 
> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
>              return -EINVAL;
>          }

Indeed that makes sense. Will add in v3.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

