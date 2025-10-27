Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88068C0EEC0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44F710E4CA;
	Mon, 27 Oct 2025 15:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RqBahTUE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D539510E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:22:25 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso50196575e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761578544; x=1762183344; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kibxRwusq2NlpM14UnWSjenfIHlfccoVL0z6GHhRmCs=;
 b=RqBahTUEFJZgZ/ua1K7UXflwGo6ckhBxnKiVAznFGNhl3ZHnr3j2XAu32xhOqe3YRO
 rYQVzT2fy/yS/nGuz3ZZhglnACLiA9EfJp6E/d+o6jXlNnlb0DIuMPfFWdbMYpQGQlAb
 ONsHUbPND5iA0N8Lp9MAmsliB0+34ZL0J+T/jJA5hCFhwzkqzGiIEs3Cdtrh9B0kVZ17
 NRSy96I8+P7Q/Wd80HLk7K8muj4Af2N3tFlZUMTreCwASrrE1K7SQZfMfShMNiXD05kV
 pJCc6jpJ3yoAEQmj0fzdUgtn7FtQvwfGZiZCny12YtLlb+rdLbgrhQq/5WDvyeDGdgCx
 1SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761578544; x=1762183344;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kibxRwusq2NlpM14UnWSjenfIHlfccoVL0z6GHhRmCs=;
 b=f98gESOLLooYMIfA/1MEwj0oq6/AZZBDviRCa8vAvZZeNcB9OlVGerb773zycJylDN
 5M5WyiOm0X/5Wxv4Yr9kQiKBpUOHLOAydQdr3m7huVpQFqOdUSbd7CvnnTKK7Lan8tzg
 AxwF7fOQOnEdE7nTcV/J7wHdhQrIsGKZtjPb/emOnR3+RLzYHid6PJrfWazVIms05+Eo
 +Qk0ytV7qh6rin1zGZLPG/0Q7xPebJBI71CS9GEU1aNBmPZpfvyzZKFfWngbeNJ1j1rT
 dkj9DCCtBO3lKVRFCMrl/456KEN3ljUgHI0SzOlyyo2wILXnEC/+eGL/tvxj/U7y6ZyG
 BFdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6jcXN/YBXb1BeJVX1qui8jkoK5q3MuMyrAbuyFurastTviw/OSQgld7NvR7zTTpGYK6JBZBvA2F8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeRMBOlG2zy83XWzULutuo71x/dJwsLEJf5sfki8xdDUP9py2q
 JpQOiSWtdNb4iN4HVrW34x2+s7cIIHcLbh878ilAyBt1xYU/uqSGJZMd97bze8Ni
X-Gm-Gg: ASbGncseK4eDyJqAwsDRfUNRF+TeDMHHENj0448KQeLPRkYg8knDSgLm8evJ2iObMU/
 HPy4ZOUKLVOsA+7pl7HtzzDwzltcLvZ1t3bZ70Urm88TbLKlZphlLUP0rlwDHQJjouLmr7c146Q
 oniWr5vaFJ4zKxclZaDNcCWZzwScN785TULGEgsAJx7RrUueUBgE1D6pyYjk5voBXlUR+dmiqbS
 sV91DvJOZ1Tze1YtTZVmbF/hchQpfiNwKsuyHOqNlrthT2dGvqm1SnQwzCEonuXrwFW1QP9GWvy
 PcxTZVcdXqT1XWSF79a0nq2gQXTf02w7TIOZF5muJzvgfrIdOGjEsW7LG0M3IAZC4HqaHu1pk4V
 WfMM/D/elJmjwDscB6F7KI67CpbX+YrPrCOwyVcMQzPsoFFT1FApoFOrz1x2TR8KVyhZpxMF9e8
 ZMPCTGRavK
X-Google-Smtp-Source: AGHT+IHJyShjEeha+8pyivXmguKhbTNjXnS9Dy1xlYP2LhyX/WDenAnEnT9Uhw9/OaRXhnUly/OvlQ==
X-Received: by 2002:a05:600c:1e0f:b0:471:5bf:cd02 with SMTP id
 5b1f17b1804b1-47717e03739mr322125e9.11.1761578542153; 
 Mon, 27 Oct 2025 08:22:22 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd374e41sm143262205e9.12.2025.10.27.08.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:22:21 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:22:20 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/22] VKMS: Introduce multiple configFS attributes
Message-ID: <aP-OLNFQA0M16xuy@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
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

Hey Louis,

On Sat, Oct 18, 2025 at 04:01:00AM +0200, Louis Chauvet wrote:
> VKMS have a wide range of options. The aim of this series is to introduce
> many configfs attribute so VKMS can be used to test a wide range of
> configurations.
> 
> This series depends on [1] that should be applied soon.
> 
> PATCH 1-13 are for configuring planes
> - name
> - rotation
> - color encoding
> - color range
> - plane formats
> - zpos
> PATCH 14-19 are for configuring the connector
> - type
> - supported colorspace
> - edid
> PATCH 20-22 are to enable dynamic connectors
> 
> [1]:https://lore.kernel.org/all/20251016175618.10051-1-jose.exposito89@gmail.com
> 
> PS: Each pair of config/configfs patch are independant. I could
> technically create ≈10 different series, but there will be a lot of
> (trivial) conflicts between them. I will be happy to reordoer, split and
> partially apply this series to help the review process.

I just finished reviewing the series.

Amazing work, thanks a lot for adding all of these new properties!!

I'd like to see KUnit and IGT coverage to test coner cases and, since this
is uAPI, to have a mechanishm to catch regressions without lots of manual
testing.

Let's talk so we can start working on them on v2, I'll be able to help in
that front if needed.

Best wishes,
Jose
 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
> Louis Chauvet (22):
>       drm/vkms: Introduce config for plane name
>       drm/vkms: Introduce configfs for plane name
>       drm/vkms: Introduce config for plane rotation
>       drm/vkms: Introduce configfs for plane rotation
>       drm/vkms: Introduce config for plane color encoding
>       drm/vkms: Introduce configfs for plane color encoding
>       drm/vkms: Introduce config for plane color range
>       drm/vkms: Introduce configfs for plane color range
>       drm/vkms: Introduce config for plane format
>       drm/vkms: Introduce configfs for plane format
>       drm/vkms: Properly render plane using their zpos
>       drm/vkms: Introduce config for plane zpos property
>       drm/vkms: Introduce configfs for plane zpos property
>       drm/vkms: Introduce config for connector type
>       drm/vkms: Introduce configfs for connector type
>       drm/vkms: Introduce config for connector supported colorspace
>       drm/vkms: Introduce configfs for connector supported colorspace
>       drm/vkms: Introduce config for connector EDID
>       drm/vkms: Introduce configfs for connector EDID
>       drm/vkms: Store the enabled/disabled status for connector
>       drm/vkms: Allow to hot-add connectors
>       drm/vkms: Allows the creation of connector at runtime
> 
>  Documentation/gpu/vkms.rst                    |  42 +-
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  18 +
>  drivers/gpu/drm/vkms/vkms_config.c            | 183 ++++++
>  drivers/gpu/drm/vkms/vkms_config.h            | 524 +++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.c          | 893 +++++++++++++++++++++++++-
>  drivers/gpu/drm/vkms/vkms_connector.c         | 137 +++-
>  drivers/gpu/drm/vkms/vkms_connector.h         |  36 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c              |  11 +-
>  drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
>  drivers/gpu/drm/vkms/vkms_output.c            |  19 +-
>  drivers/gpu/drm/vkms/vkms_plane.c             |  73 +--
>  11 files changed, 1865 insertions(+), 77 deletions(-)
> ---
> base-commit: b291e4f1a4951204ce858cd01801291d34962a33
> change-id: 20251017-vkms-all-config-bd0c2a01846f
> prerequisite-message-id: 20251016175618.10051-1-jose.exposito89@gmail.com
> prerequisite-patch-id: 74083a8806b1f26d9b4cd2a5107c756b971c4d11
> prerequisite-patch-id: f982390487699921b625b413e8460d67ca7a74c9
> prerequisite-patch-id: 0afca639e43c8fbfea2af1bc395e489efc8e1f10
> prerequisite-patch-id: 6285108b2fd90d30d15d4cb4fdddfef953fad51b
> prerequisite-patch-id: 2eacf5ad4f25f54a60958aa7a2df633d5642ce2f
> prerequisite-patch-id: 81e98ac3aeb3b6128098ab7bab56d3446a3a2705
> prerequisite-patch-id: 973f94c4edb4a5822c84a57d4479ca40e9cf25de
> prerequisite-patch-id: 0efbaf1b0e962a1c40bf5a744b5089d8be696f62
> prerequisite-patch-id: afa0cff94085e6ab216ffd9b99cd3dc882a0a687
> prerequisite-patch-id: 3561347f2b586392985a8e3af9ed1c5c7d3eefd5
> prerequisite-patch-id: 94030044ae8d404f7cdaed9137bddd59cfb22e79
> prerequisite-patch-id: a54b483797d5ffb7ce13b56a8943025181cd0d7a
> prerequisite-patch-id: f148fe7f445cb42437e7e2ba8b59e7e0fd40da8b
> prerequisite-patch-id: 1ef2045872843670c452816c5d6187b713c9258c
> prerequisite-patch-id: 3b9963ea3ae3455ae15ee36b67042c06a2ef6006
> prerequisite-patch-id: 519ee42dfabb4de734e41e59bd07d7a723d810bb
> 
> Best regards,
> -- 
> Louis Chauvet <louis.chauvet@bootlin.com>
> 
