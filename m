Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17655B2AC0B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7DF10E1EA;
	Mon, 18 Aug 2025 15:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="j+SNySwr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770C810E1EA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 15:03:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755529416; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=H7hOGpUv/BSfc1nv/PWbQwTzQ+Aoo90LPBWrXKg1TO3hIHGXAeUHNLYEgcUgVMTiWY/04kmpO72VDk0OB/fsdr8qScRgsLDcsbQj2aJQ0+PKBqitndmJ1qi6JuueEVVDr2HzVliw5zOmrl3B+YR+RymY461jaZGdFWdHDWEcHC8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755529416;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6d5RVIS/akZ/+ESm87iVeDRIgN/ONFtQoy8a/oEPQ1s=; 
 b=ZqkFs/LApXd10fU0XJsL9KDq1b42LORnWc8O8/tTUDxTkFuUEMPN2odRV8OQU72WDpDudYUXuxmY0GOShqPHzI05bHxSgMbRRAD/4fz2T4cB10ooKRBJ4dgfWpYtx7zXGcbya/hv2Die14vTXuhHKrvcjDNm4AbrLpxM4bcdeOI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755529416; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=6d5RVIS/akZ/+ESm87iVeDRIgN/ONFtQoy8a/oEPQ1s=;
 b=j+SNySwrXH5pDitpadWfK85MXluxhxtr7zE88OOoREEd7+8zTUuoaTBBx86IkUjo
 gMR8nawO8MLLKeAs+KaCETW/B4nv45dvfHcPAZDtEFQjOBASAENa2S4SCvFw+BMWfwK
 y3Tm5EhPOqN4MgQElzKdFrJbEcr/tpKpSuuOFdw8=
Received: by mx.zohomail.com with SMTPS id 1755529415282174.82542434337824;
 Mon, 18 Aug 2025 08:03:35 -0700 (PDT)
Message-ID: <5ef83037-ac37-4a3d-b6ef-fb26ea015290@collabora.com>
Date: Mon, 18 Aug 2025 17:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] drm/vkms: Add RGB to YUV conversion matrices
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, Louis Chauvet
 <louis.chauvet@bootlin.com>, Daniel Stone <daniels@collabora.com>,
 Melissa Wen <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250813170542.331206-1-robert.mader@collabora.com>
 <20250813170542.331206-3-robert.mader@collabora.com>
 <CAPj87rP4_0Py3Ko1=MtwXm7o3T1Javj-h8Qv9Bov_9er3URgBg@mail.gmail.com>
Content-Language: en-US, de-DE
From: Robert Mader <robert.mader@collabora.com>
In-Reply-To: <CAPj87rP4_0Py3Ko1=MtwXm7o3T1Javj-h8Qv9Bov_9er3URgBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hey, thanks for the feedback.

On 14.08.25 11:57, Daniel Stone wrote:
> Hi Rob,
>
> On Wed, 13 Aug 2025 at 18:06, Robert Mader <robert.mader@collabora.com> wrote:
>> +       switch (format) {
>> +       case DRM_FORMAT_YVU420:
>> +       case DRM_FORMAT_YVU422:
>> +       case DRM_FORMAT_YVU444:
>> +       case DRM_FORMAT_NV21:
>> +       case DRM_FORMAT_NV61:
>> +       case DRM_FORMAT_NV42:
> I wonder if this could use a drm_format_info field for chroma order,
> instead of open-coding a list here?

Generally agree, however note that this is directly copied from 
`get_conversion_matrix_to_argb_u16()`. So this is not a new pattern in 
this file - and there are several other drivers with comparable ones, 
see e.g. `has_uv_swapped()` in rockchip_drm_vop.c. So while a new field 
drm_format_info would make for a nice cleanup, I'd argue that would be 
better suited in a dedicated series.

What IMO would make sense here is introduce a `has_uv_swapped()` helper, 
so we at least don't repeat ourselves. Will do that in v2 - does that 
work for you?

>
> Cheers,
> Daniel

-- 
Robert Mader
Consultant Software Developer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

