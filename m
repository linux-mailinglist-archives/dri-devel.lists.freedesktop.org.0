Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E082BCB6564
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1372810E243;
	Thu, 11 Dec 2025 15:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="bg0zT0Ua";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD3E10E243;
 Thu, 11 Dec 2025 15:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765466807; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kt8RAUXl6EsgK3svGmhwmWJ2cJkUzwFy6dmbRVhfVL4hqDXpHFow9h+zQWMBwQBULJa1nHffvhQ+e1FFdApYgAuMHEF3v/wF0tRNeqqKnbqFnaCmgrGnL3e5W+Q9T1XqTENVVyGJIpSgKpyqdtLrbyYmiSbVUsi7I9EBEkOCeXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765466807;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4ZHMXmZoGS0oHVtxSzZ73o9TI8MzTUT0pCAzHo+sGRw=; 
 b=HY4No0/BZK0dH9PWhB3VwyyJTlsi8zLFS6NUnmViuZL1vIMxSOp55dPmbdZpjsJZpHjCoxcqF1n9BuzOd/7K+X6RpeCytw4UE96fhbCWGnFYNqPNP8ELJG8ojFxQVh52Pf4/GN0d4w1PAX1Ankm+MJJs7LSpP8sHg3pLWdmirMo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765466807; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=4ZHMXmZoGS0oHVtxSzZ73o9TI8MzTUT0pCAzHo+sGRw=;
 b=bg0zT0UaF0hge3fyWxIOXk89PyOm5aJ7wAnO2MsJX8wySYlsUSuAG9qOo31S9vw1
 LI7cRdoi0AVFkVjyHTcAPBGalljEjXS1umMJoNUz79IofOMWjfv1aacuh6PsUvMJdvA
 Eu0Q1tkOyMJ8PUv3Vv+tnpqGSyadc0APMWQrqZuk=
Received: by mx.zohomail.com with SMTPS id 1765466805197602.9836966431901;
 Thu, 11 Dec 2025 07:26:45 -0800 (PST)
Message-ID: <c81767da-baf5-4531-abb2-c23f8005ea12@collabora.com>
Date: Thu, 11 Dec 2025 12:26:29 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 06/20] drm: Introduce
 DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
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
 <20250917-mtk-post-blend-color-pipeline-v2-6-ac4471b44758@collabora.com>
 <5e5017ae-b71a-4933-b248-e68d52fab7ff@amd.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <5e5017ae-b71a-4933-b248-e68d52fab7ff@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <c81767da-baf5-4531-abb2-c23f8005ea12@collabora.com>+zmo_0_ariel.dalessandro@collabora.com
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

On 9/29/25 6:48 AM, Harry Wentland wrote:
> 
> 
> On 2025-09-17 20:43, Nícolas F. R. A. Prado wrote:
>> Introduce DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE which a DRM client
>> can set to enable the usage of post-blend color pipelines instead of the
>> now deprecated CRTC color management properties: "GAMMA_LUT",
>> "DEGAMMA_LUT" and "CTM".
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c   | 15 +++++++++++++++
>>   drivers/gpu/drm/drm_connector.c     |  1 +
>>   drivers/gpu/drm/drm_crtc_internal.h |  1 +
>>   drivers/gpu/drm/drm_ioctl.c         |  9 +++++++++
>>   drivers/gpu/drm/drm_mode_object.c   |  9 +++++++++
>>   include/drm/drm_file.h              |  7 +++++++
>>   include/uapi/drm/drm.h              | 19 +++++++++++++++++++
>>   7 files changed, 61 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/ 
>> drm_atomic_uapi.c
>> index 
>> 063c142fd9b656e228cfc660d005a3fbb4640d32..f5125fa3fa28ff2a6ff07fd7cf07d4bdf77ab738 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -452,6 +452,11 @@ static int drm_atomic_crtc_set_property(struct 
>> drm_crtc *crtc,
>>       } else if (property == config->prop_vrr_enabled) {
>>           state->vrr_enabled = val;
>>       } else if (property == config->degamma_lut_property) {
>> +        if (file_priv->post_blend_color_pipeline) {
>> +            drm_dbg_atomic(dev,
>> +                "Setting DEGAMMA_LUT CRTC property not permitted with 
>> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
>> +            return -EINVAL;
>> +        }
>>           ret = drm_property_replace_blob_from_id(dev,
>>                       &state->degamma_lut,
>>                       val,
>> @@ -460,6 +465,11 @@ static int drm_atomic_crtc_set_property(struct 
>> drm_crtc *crtc,
>>           state->color_mgmt_changed |= replaced;
>>           return ret;
>>       } else if (property == config->ctm_property) {
>> +        if (file_priv->post_blend_color_pipeline) {
>> +            drm_dbg_atomic(dev,
>> +                "Setting CTM CRTC property not permitted with 
>> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
>> +            return -EINVAL;
>> +        }
>>           ret = drm_property_replace_blob_from_id(dev,
>>                       &state->ctm,
>>                       val,
>> @@ -468,6 +478,11 @@ static int drm_atomic_crtc_set_property(struct 
>> drm_crtc *crtc,
>>           state->color_mgmt_changed |= replaced;
>>           return ret;
>>       } else if (property == config->gamma_lut_property) {
>> +        if (file_priv->post_blend_color_pipeline) {
>> +            drm_dbg_atomic(dev,
>> +                "Setting GAMMA_LUT CRTC property not permitted with 
>> DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
>> +            return -EINVAL;
>> +        }
>>           ret = drm_property_replace_blob_from_id(dev,
>>                       &state->gamma_lut,
>>                       val,
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/ 
>> drm_connector.c
>> index 
>> 4d6dc9ebfdb5bc730b1aff7a184448af7b93f078..f58cfd2131139ff3e613adc4dbb9ddbedf724dc7 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -3440,6 +3440,7 @@ int drm_mode_getconnector(struct drm_device 
>> *dev, void *data,
>>        */
>>       ret = drm_mode_object_get_properties(&connector->base, 
>> file_priv->atomic,
>>               file_priv->plane_color_pipeline,
>> +            file_priv->post_blend_color_pipeline,
>>               (uint32_t __user *)(unsigned long)(out_resp->props_ptr),
>>               (uint64_t __user *)(unsigned long)(out_resp- 
>> >prop_values_ptr),
>>               &out_resp->count_props);
>> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/ 
>> drm_crtc_internal.h
>> index 
>> e3dbdcbfa385b940ec0b5476adde6146fe4afde1..c53f154e5392a10c326c844b7321666275f9ac02 100644
>> --- a/drivers/gpu/drm/drm_crtc_internal.h
>> +++ b/drivers/gpu/drm/drm_crtc_internal.h
>> @@ -169,6 +169,7 @@ void drm_mode_object_unregister(struct drm_device 
>> *dev,
>>                   struct drm_mode_object *object);
>>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool 
>> atomic,
>>                      bool plane_color_pipeline,
>> +                   bool post_blend_color_pipeline,
>>                      uint32_t __user *prop_ptr,
>>                      uint64_t __user *prop_values,
>>                      uint32_t *arg_count_props);
>> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
>> index 
>> 01592d10e3465ddceddef94bc417f98d3ec12087..ea9600f5392f520a2b42ba7ef363d2f08ce19812 100644
>> --- a/drivers/gpu/drm/drm_ioctl.c
>> +++ b/drivers/gpu/drm/drm_ioctl.c
>> @@ -383,6 +383,15 @@ drm_setclientcap(struct drm_device *dev, void 
>> *data, struct drm_file *file_priv)
>>               return -EINVAL;
>>           file_priv->plane_color_pipeline = req->value;
>>           break;
>> +    case DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE:
>> +        if (!file_priv->atomic)
>> +            return -EINVAL;
>> +        if (req->value > 1)
>> +            return -EINVAL;
>> +        if (!drm_core_check_feature(dev, 
>> DRIVER_POST_BLEND_COLOR_PIPELINE))
>> +            return -EINVAL;
>> +        file_priv->post_blend_color_pipeline = req->value;
>> +        break;
>>       default:
>>           return -EINVAL;
>>       }
>> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/ 
>> drm_mode_object.c
>> index 
>> b45d501b10c868c6d9b7a5a8760eadbd7b372a6a..5e6c3de9456b997985142a68b9cef57771a58bdc 100644
>> --- a/drivers/gpu/drm/drm_mode_object.c
>> +++ b/drivers/gpu/drm/drm_mode_object.c
>> @@ -388,6 +388,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
>>   /* helper for getconnector and getproperties ioctls */
>>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool 
>> atomic,
>>                      bool plane_color_pipeline,
>> +                   bool post_blend_color_pipeline,
>>                      uint32_t __user *prop_ptr,
>>                      uint64_t __user *prop_values,
>>                      uint32_t *arg_count_props)
>> @@ -416,6 +417,13 @@ int drm_mode_object_get_properties(struct 
>> drm_mode_object *obj, bool atomic,
>>                   continue;
>>           }
>> +        if (!post_blend_color_pipeline && obj->type == 
>> DRM_MODE_OBJECT_CRTC) {
>> +            struct drm_crtc *crtc = obj_to_crtc(obj);
>> +
>> +            if (prop == crtc->color_pipeline_property)
>> +                continue;
>> +        }
>> +
>>           if (*arg_count_props > count) {
>>               ret = __drm_object_property_get_value(obj, prop, &val);
>>               if (ret)
>> @@ -475,6 +483,7 @@ int drm_mode_obj_get_properties_ioctl(struct 
>> drm_device *dev, void *data,
>>       ret = drm_mode_object_get_properties(obj, file_priv->atomic,
>>               file_priv->plane_color_pipeline,
>> +            file_priv->post_blend_color_pipeline,
>>               (uint32_t __user *)(unsigned long)(arg->props_ptr),
>>               (uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
>>               &arg->count_props);
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 
>> 1a3018e4a537b3341acb50187d47371f6b781b9d..42b9a43baa18079af8ec2ea5b1484b23c497beb0 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -213,6 +213,13 @@ struct drm_file {
>>        */
>>       bool plane_color_pipeline;
>> +    /**
>> +     * @post_blend_color_pipeline:
>> +     *
>> +     * True if client understands post-blend color pipelines
>> +     */
>> +    bool post_blend_color_pipeline;
>> +
>>       /**
>>        * @was_master:
>>        *
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 
>> c6c53e57958e951204154ce41a69696a6876f0e8..f9ac10b3e4876f71005a87dedefa4aed320566f0 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -927,6 +927,25 @@ struct drm_get_cap {
>>    */
>>   #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE    7
>> +/**
>> + * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
> 
> DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE might be better to align
> terminology between pre- and post-blend pipelines. It would
> also make it clear that this is about the color pipeline on
> a drm_crtc (which pretty much by definition means post-
> blending).
Same answer here. Will be replacing s/post_blend/crtc in v3.

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

