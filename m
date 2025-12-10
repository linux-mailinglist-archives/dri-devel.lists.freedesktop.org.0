Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A17BCB40B6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 22:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A5B10E082;
	Wed, 10 Dec 2025 21:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="kgC54ml0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6027610E082;
 Wed, 10 Dec 2025 21:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765401339; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MQU6KWe4NSE6DWLLEr2xEP7RPMSuj09+BrpSEQc+m8stv4G5crnD5OB3nJzoJ2tLCTWYT37xt3OUntnTCoIgS8QYuwINgBWGwN/PNXc8Icggb04jT2bbuDmxMmVsYKRIcM5sZYb7g5yzr2i8hHRF7msFOXUjC56sS5eB0smdBeY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765401339;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IRKnvkvBvcdU44ovJMbkUCqCeq+xkG059w91E2TXUZI=; 
 b=aMhRQK5kasQr2cgEs5KtFrI0/6SL2UEaUZD+CKJdLcXtb08eb+Z2re8IS/blG6tBD9EgG0QgsIIuWQC3fzlRB3ny0h5l7w4nGhOqHT/osBlBfOTACIS/0IQoacbOeoAej3z9SDNm28wIdzfxB1DR+HHtptNmrU4AfAuRH27k51Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765401339; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IRKnvkvBvcdU44ovJMbkUCqCeq+xkG059w91E2TXUZI=;
 b=kgC54ml0Zk9SSQ2THssIN0qentB1rMOMtI8kus2axbv2BSJ13O/4Iglv+oawxEma
 uqZ1MhwBp2v1wLAXCHhUvlo9jrZZu7UV+kTQbPFpidGY5bLfv9ebPYqieIeA4fL5S1J
 fMmsv0HbDlGwIMylKzfIF8LluRqqaChkLo7pLO7o=
Received: by mx.zohomail.com with SMTPS id 176540133700515.946463429704863;
 Wed, 10 Dec 2025 13:15:37 -0800 (PST)
Message-ID: <4c393a1a-3ded-490c-a6f8-c120dfcf1188@collabora.com>
Date: Wed, 10 Dec 2025 18:15:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 19/20] drm/vkms: Introduce support for post-blend
 color pipeline
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
 <20250917-mtk-post-blend-color-pipeline-v2-19-ac4471b44758@collabora.com>
 <951318ca-f43a-48d7-a419-3bd89d135248@bootlin.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <951318ca-f43a-48d7-a419-3bd89d135248@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <4c393a1a-3ded-490c-a6f8-c120dfcf1188@collabora.com>+zmo_0_ariel.dalessandro@collabora.com
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

On 9/19/25 9:50 AM, Louis Chauvet wrote:
> 
> 
> Le 18/09/2025 à 02:43, Nícolas F. R. A. Prado a écrit :
>> Introduce a post-blend color pipeline with the same colorop blocks as
>> the pre-blend color pipeline.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_colorop.c  | 98 ++++++++++++++++++++++++++ 
>> ++++++++++
>>   drivers/gpu/drm/vkms/vkms_composer.c |  5 +-
>>   drivers/gpu/drm/vkms/vkms_crtc.c     |  1 +
>>   drivers/gpu/drm/vkms/vkms_drv.h      |  1 +
>>   4 files changed, 104 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/ 
>> vkms/vkms_colorop.c
>> index 
>> 5924ae2bd40fc904048f99bc9b96308140709e25..54c512db68eef16435d5f79453784f7784d540fb 100644
>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>> @@ -98,6 +98,86 @@ vkms_initialize_pre_blend_color_pipeline(struct 
>> drm_plane *plane,
>>       return ret;
>>   }
>> +static int
>> +vkms_initialize_post_blend_color_pipeline(struct drm_crtc *crtc,
>> +                      struct drm_prop_enum_list *list)
>> +{
>> +    struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>> +    struct drm_device *dev = crtc->dev;
>> +    int ret;
>> +    int i = 0;
>> +
>> +    memset(ops, 0, sizeof(ops));
>> +
>> +    /* 1st op: 1d curve */
>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_crtc_colorop_curve_1d_init(dev, ops[i], crtc, 
>> supported_tfs,
>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    list->type = ops[i]->base.id;
>> +    list->name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]- 
>> >base.id);
>> +
>> +    i++;
>> +
>> +    /* 2nd op: 3x4 matrix */
>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_crtc_colorop_ctm_3x4_init(dev, ops[i], crtc, 
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i - 1], ops[i]);
>> +
>> +    i++;
>> +
>> +    /* 3rd op: 3x4 matrix */
>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_crtc_colorop_ctm_3x4_init(dev, ops[i], crtc, 
>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i - 1], ops[i]);
>> +
>> +    i++;
>> +
>> +    /* 4th op: 1d curve */
>> +    ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
>> +    if (!ops[i]) {
>> +        ret = -ENOMEM;
>> +        goto cleanup;
>> +    }
>> +
>> +    ret = drm_crtc_colorop_curve_1d_init(dev, ops[i], crtc, 
>> supported_tfs,
>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>> +    if (ret)
>> +        goto cleanup;
>> +
>> +    drm_colorop_set_next_property(ops[i - 1], ops[i]);
>> +
>> +    return 0;
>> +
>> +cleanup:
>> +    drm_colorop_pipeline_destroy(dev);
> 
> Same comment as for pre_blend colorops, it feel strange to destroy all 
> the pipelines here.
> 
> The suggestion in [1] is better (don't forget to add the kfree).
> 
> [1]: https://lore.kernel.org/all/73f01810-df2d-4e39-a20b- 
> fc1cec2c5e12@amd.com/
Ack, will be addressed in v3.

Regards,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

