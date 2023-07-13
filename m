Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623607527DC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 17:59:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCCC10E6FC;
	Thu, 13 Jul 2023 15:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C2010E718
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689263947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CtNkNXIdq1ov1ujNMB8OMN04SxvPNAp8B5XJrSOU3Y=;
 b=glSje4l9mxbdeMrMLnEfgkS2QDQTHaJwhZpIyQ8twTRR7B9w50HOT7vtWHJbLT0wLj1LJn
 881W0KTry3LPnuaAAFq+MTdmXTv7Jp9NLzHYvuSp4kV+GIjJsuHVBIJXIAU3y5Ed0mye5v
 7so95xlloSspyPsNftEYRV35zgO1ca0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-wbGewaKBNi-fSI1zoWQr1w-1; Thu, 13 Jul 2023 11:59:05 -0400
X-MC-Unique: wbGewaKBNi-fSI1zoWQr1w-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fbe4cecd66so4805625e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689263945; x=1691855945;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CtNkNXIdq1ov1ujNMB8OMN04SxvPNAp8B5XJrSOU3Y=;
 b=RT7MU92ioR4BahN0/9AXtcwhbpifdpfFyYZiPHX+w45rsMT1kQl3BLZY2QJBYUxLqY
 Mgpk03TujmEjCXAB2+UldDSrK7j+sjfEZ7p+qXQGofUXOyc3+S35NxTjmmXF2gugpPCZ
 48w9m7iulmU8eLn2/s8NjUSgNKP/HypoM+eT8jjUCFNYi0Yg+1TUU06CS9Q0o0B23BXv
 KfmhTBw24bEK9g6lG4pao7HUZpaEx+FtEKRiLcIi97fyFe7ghekV46FKiYJ2cywDO78/
 ZhG5N1Yu+HDvW4/ch4huBWtNu+l9RPKGq2oZAHXGmfzbjOC4f251TYSwebn+XjSb8+Ki
 5E8g==
X-Gm-Message-State: ABy/qLam1ekyb592kI/IVocYtT0Uz+2UGPAqrDpRnIB2ePrXkFDJNLPW
 KQnjZd4lGCqm6VRYT278jPS3gsqJ0Fa+BYFP+O1qoWquK0xuuSC31Qk2pCtSmt6fUHN/Wm9M8Sw
 tIuu0btG229aHN7oM09MhymE0yTkc
X-Received: by 2002:a05:600c:2993:b0:3fa:9823:407 with SMTP id
 r19-20020a05600c299300b003fa98230407mr1722670wmd.18.1689263944942; 
 Thu, 13 Jul 2023 08:59:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFN3uGErnfEwUP1xov45Iy4OzerQmuMuizHwArVOwybhZDakOTa0aoQUu5dZusUsMxn+TkTwg==
X-Received: by 2002:a05:600c:2993:b0:3fa:9823:407 with SMTP id
 r19-20020a05600c299300b003fa98230407mr1722648wmd.18.1689263944698; 
 Thu, 13 Jul 2023 08:59:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m20-20020a7bcb94000000b003fbfea1afffsm8220826wmi.27.2023.07.13.08.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 08:59:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/17] drm: rename various struct members "dev" -> "drm"
In-Reply-To: <vnn7b2vk76j4ooccelibkbkblduz5uvjryzfi5vmseljxl3dhq@5ckosntec72j>
References: <20230713082408.2266984-1-u.kleine-koenig@pengutronix.de>
 <874jm8go61.fsf@intel.com>
 <20230713103940.aeqgcbmcoqepvbax@pengutronix.de>
 <2ypl3btshoovedyyq7jaohjgmwr7egnhazuxuffbxudlljktml@syv5u27skpqr>
 <20230713141023.52dkz5ezicwev74w@pengutronix.de>
 <vnn7b2vk76j4ooccelibkbkblduz5uvjryzfi5vmseljxl3dhq@5ckosntec72j>
Date: Thu, 13 Jul 2023 17:59:03 +0200
Message-ID: <87a5vzhkfs.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, kernel@pengutronix.de,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Julia Lawall <julia.lawall@inria.fr>, Luben Tuikov <luben.tuikov@amd.com>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> On Thu, Jul 13, 2023 at 04:10:23PM +0200, Uwe Kleine-K=C3=B6nig wrote:

[...]

>>  - Javier Martinez Canillas
>>    Generally in favour (also via irc)
>>    Wants a single patch
>>    naming: drm > drm_dev > dev
>
> drm-misc driver maintainer
>

Just to clarify my position on this. I did agree that "dev" was confusing
for me when I started hacking on DRM/KMS and I believe that "drm" is more
readable. I.e: in my drivers I use "struct drm_device *drm =3D plane->dev".

But I think that all the discussion and energy *already spent* on this
series makes it a net negative, regardless of the code's end result.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

