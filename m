Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD833CB3F0E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 21:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E543D10E728;
	Wed, 10 Dec 2025 20:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="KEf5nztR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84BF10E728;
 Wed, 10 Dec 2025 20:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765397999; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cGQnLhHtWcqAD3Ly0pdRRQ1P6JyECzdp7zt5iroT3q1cb3/6TatBLSYLpXNJEh7P/vncD90aPjmUsMXUaPUAGPXROgrvexLEOi5Ahz+iR6RhygWdLof7oynUkerbCZryZTVtVd8IzDarEvm6n1ygHfXtn7sg4MunIVzQyGbdtN8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765397999;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=zBOjLIA9JKddmG2WZSljIIQm1ZcLIzyp4u5OMsT9CE4=; 
 b=kM3yi/xi3BsmH9V1WO0fA1mHqIr3wcYvHqr2V5Xk9Z+NKD4kxWlDv4AWloA/yvUF6+E3NpkheoGKd+nz8W2dXd5e/wIrLjkNX319/JE+LVcSnfLLrlAceQ6I+8Ct3Wzxq7qVHykS5fgTKmBNQ8HcUcK6jN81QCbcgX5rE+Fp8AQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765397999; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=zBOjLIA9JKddmG2WZSljIIQm1ZcLIzyp4u5OMsT9CE4=;
 b=KEf5nztRa5LmdXyPCtkQ4jqRPK48Qn+XNLZOyqYUW+VGm5MjsbKZ2BH/WVAthm5z
 0i/czpxqcB9WH9OOsV1KCeDd6OatULjgBeYXUDxPaODoLoIyZObTsk1BdZKj50F80Ss
 3jKJqStI16meRUOksOUghlsbV9WPruXsbo3j+G4M=
Received: by mx.zohomail.com with SMTPS id 1765397996737389.80822384937903;
 Wed, 10 Dec 2025 12:19:56 -0800 (PST)
Message-ID: <052890e9-4e51-4181-9b88-ab1d4f407fb7@collabora.com>
Date: Wed, 10 Dec 2025 17:19:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 03/20] drm: Factor out common color_pipeline
 property initialization code
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
 <20250917-mtk-post-blend-color-pipeline-v2-3-ac4471b44758@collabora.com>
 <3c24d55c-76d1-4ba4-9942-fd5d85f9daca@amd.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <3c24d55c-76d1-4ba4-9942-fd5d85f9daca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <052890e9-4e51-4181-9b88-ab1d4f407fb7@collabora.com>+zmo_0_ariel.dalessandro@collabora.com
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

Following up on Nicolas' series.

On 9/29/25 5:53 AM, Harry Wentland wrote:
> 
> 
> On 2025-09-17 20:43, Nícolas F. R. A. Prado wrote:
>> In preparation for sharing the initialization code for the color
>> pipeline property between pre- and post-blend color pipelines, factor
>> out the common initialization to a separate function.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   drivers/gpu/drm/drm_crtc.c          | 44 +++++++++++++++++++++++++++ 
>> ++++++++++
>>   drivers/gpu/drm/drm_crtc_internal.h |  5 +++++
>>   drivers/gpu/drm/drm_plane.c         | 36 +++++-------------------------
>>   3 files changed, 54 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
>> index 
>> 46655339003db2a1b43441434839e26f61d79b4e..94e60cffd29972aa979ac2f1932be7a6a97f3ada 100644
>> --- a/drivers/gpu/drm/drm_crtc.c
>> +++ b/drivers/gpu/drm/drm_crtc.c
>> @@ -959,3 +959,47 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state 
>> *crtc_state)
>>       return hweight32(crtc_state->encoder_mask) > 1;
>>   }
>>   EXPORT_SYMBOL(drm_crtc_in_clone_mode);
>> +
>> +struct drm_property *
>> +drm_common_create_color_pipeline_property(struct drm_device *dev, 
>> struct drm_mode_object *obj,
>> +                      const struct drm_prop_enum_list *pipelines,
>> +                      int num_pipelines)
> 
> All other functions I see in drm_crtc seem to be quite crtc
> specific. Would there be a better place to put this? Possibly
> a new file if nothing else seems to fit?
> 
> Not a blocker in any way, though.
Agreed. I think drivers/gpu/drm/drm_property.c would be a better place, 
as it contains functions to create the different types of drm_property 
already.

Will submit a proposal in v3.

Thanks,
Ariel

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

