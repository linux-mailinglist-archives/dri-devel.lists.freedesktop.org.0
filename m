Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110CCB3FEC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 21:50:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4913F10E799;
	Wed, 10 Dec 2025 20:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="cDVBsSTq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F7D10E7A8;
 Wed, 10 Dec 2025 20:50:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765399807; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VnmgidsXIZDiYQBJMG/THsIlfgtcgK5qtXBxNIty/4D1fOrj4zfan6ZertBCS5UaV2ksStymVCKnB+27v+8YmqOKhnvZhBbBwwt0VgE4FENEheoVQmBHrU5Q3h06B3OIVSWhhgywmTRseAweFW9aEhxNGaAaUNveO02jdjpVYJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765399807;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tZTsttuvHY4KRH8vSPsqNmTyYsf1BvktVK1h+5a+Eaw=; 
 b=ZFGKDhU7HZZO0yULQ977ciWNrXJELFXlonUQ3I9jShWa4/cnR/4apGR9Ma9l5qz4AXz6s9vUC0mXRX393l6V4CWFyOiz+2SwYMvgf9bHY6mZ0vCFTejyNCfDorPb9NGOe0dg4Rxdkorg1xPDO3KkX2ZSYW5a1uHJfVIuMQUI82Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765399807; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=tZTsttuvHY4KRH8vSPsqNmTyYsf1BvktVK1h+5a+Eaw=;
 b=cDVBsSTq11152BDFc/ayvIAgrGqwkm2Pth6czcgjqBVSPvmleFNE02ogg2at1qez
 vovli6pma9M/hUMgLtDZKn15NgJN0t+bdX/fBPwSN30X2NvlpKZ+WCnaKy3c90TH7RU
 hHkmpN24WqZSi8iC//f36DpGv/QMncfbaGzX1e2c=
Received: by mx.zohomail.com with SMTPS id 1765399803936476.9898810900985;
 Wed, 10 Dec 2025 12:50:03 -0800 (PST)
Message-ID: <5aa65d89-9bba-4b2b-8727-7a4e69d74cbb@collabora.com>
Date: Wed, 10 Dec 2025 17:49:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 02/20] drm/colorop: Allow parenting colorop to CRTC
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
 <20250917-mtk-post-blend-color-pipeline-v2-2-ac4471b44758@collabora.com>
 <bc2b7afa-96c0-4b33-a413-3758ab8fd571@bootlin.com>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <bc2b7afa-96c0-4b33-a413-3758ab8fd571@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <5aa65d89-9bba-4b2b-8727-7a4e69d74cbb@collabora.com>+zmo_0_ariel.dalessandro@collabora.com
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

Following up on Nicolas' series.

On 9/19/25 9:44 AM, Louis Chauvet wrote:
> 
> 
> Le 18/09/2025 à 02:43, Nícolas F. R. A. Prado a écrit :
>> In order to allow for post-blend color pipelines, colorops need to be
>> assigned to a crtc rather than a plane. Add a crtc to the colorop
>> struct to enable this. Either the plane or the crtc will be set for any
>> given colorop depending on whether it is part of a pre- or post-blend
>> color pipeline.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> ---
>>   include/drm/drm_colorop.h | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>> index 
>> d61c6c40e47162cb8b1e7db58b6746c43ac5d202..7a4e0d0c4a3d594abecef304b1d5990434cdb231 100644
>> --- a/include/drm/drm_colorop.h
>> +++ b/include/drm/drm_colorop.h
>> @@ -206,10 +206,16 @@ struct drm_colorop {
>>       /**
>>        * @plane:
>>        *
>> -     * The plane on which the colorop sits. A drm_colorop is always 
>> unique
>> -     * to a plane.
>> +     * The plane on which the colorop sits if it is a pre-blend colorop.
>> +     * In this case it is unique to the plane.
>> +     *
>> +     * @crtc:
>> +     *
>> +     * The CRTC on which the colorop sits if it is a post-blend colorop.
>> +     * In this case it is unique to the CRTC.
>>        */
> 
> If there is a v3 of this series, I think it could be nice to have 
> something like "plane and CRTC are mutually exclusive".

Sounds good, will add in v3.

> 
> With or without this:
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

