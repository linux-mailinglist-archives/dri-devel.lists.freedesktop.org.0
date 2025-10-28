Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C92C1C134D8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:32:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C82488EFE;
	Tue, 28 Oct 2025 07:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="muG9Ry0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7815F88EFE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 07:32:08 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-470ffbf2150so38831595e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 00:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761636727; x=1762241527; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Rec9/cQDeU0bv1R0dhkpzftWDI1wklVhjatSRo1mvhc=;
 b=muG9Ry0Gr5p7nsu65RtpTM1lZMuTApj2CTn/gD1dhslfYiXsEI7aFn66mZRnrI/M+m
 ectKXj5qQppwu4sguydpKqUMDPCBFEew4XB6OnjdEpJbGo92p7y/QsGCWpXEmeTZ2tg1
 0hteSHkfkjIwjxHxT1mrtObFcHHPXD3uWLOw+NrUixOExYNMYpYThyryVlJFlkBughLt
 iEeXkrpkmEf8y7VEKlhVBPnmO/Ao2lilhn4aWUJn79UjYL8SqIzC7wEdo0AEvAOF9K7M
 9hZJ44i1ataq8NZFzAOPvoVuRuNzVzE6nbr/AAdITmc+h/6lMMT2N+iv22G4fGN0jfPh
 ZPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761636727; x=1762241527;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rec9/cQDeU0bv1R0dhkpzftWDI1wklVhjatSRo1mvhc=;
 b=HZMoLiX1g2SXtlBhGgusBg7+kTo+T+41mp9oPU2KhjkoXgKGEeQVKze6IWKUaLOPbm
 ZsDJ+s9JoiwBSxxQGI5hbwYlxfjoZ4jKZLsOrwPpyTf8esBe0r2oLOPLSij0aZycOv6j
 qooq9IYcm6cQDnXN6hZaBtkFqqTyIi9iPhticSLKW4INx3S/kSOFdZWWMnjuwBOG59dU
 Vkx+0Px4qWujbya2/PM8xN7RdRlLq9w5kerCwJdcmLXpVktylLBj0+0EWa2+b+XzNF7d
 C66P7KWReMzYiPFymrmeq1VQiBcdJ21qUeQlQIA3hoDB1qjnYOuErcc+iNjXj4uhmAdC
 wF2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa4Cp/BUkE1GN6dAdTpILS2LlQrF99UeLn6xEE96EWHL1GSY49Md0lSNtreY8mAA4OATJmnRYoVEc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBlI8F9lrUGUpuMW1XeeBx0UiyNFMdITU22sZ3GCZMVPrY25TN
 HBu/edVpEu2ohxkbsqo4UrzB+O4POucZULjvo53Lj3szPk7WzCCR+rpI
X-Gm-Gg: ASbGncse49PysPTYON1/trznBr10ALvzAPU632EA2sGqr/GMTc0ArbhVMLDV6ys4wVu
 85T3/8xZUr1toeboon/JZVSQa2MQnch+FWtA2Qxd9vnfGW2skeliYbxTF1FJqRp6oYP83+Wjmx/
 izB8fp8+7VlVw9Txw0q6jKzrwJiDxqJZ5ftAdpBRm+QLU6kSC8qbDc4maYt3UXt8y4x1fqFykjK
 z9EcVj+U7MijGJOEJYwVuv0xOXBF29bA8O763Ws1N2Oi+ji+CZuzcLVi8HdCv+tuSFprvBaa6/l
 63ja1c+PgWAsZlvJsNK/nucT/805cO/aUY7W0iDRHsvNRXqtkAGba8bsDVZUhYw43XqHae7XaoF
 BkOk/O5aEZwXybrbDZf+0iBRsQgtVxnufNuSNZZ5bZdiVXZYCNn+kBsAyvEd0cE4dy4mDmJFz6Q
 ==
X-Google-Smtp-Source: AGHT+IG6/c3drKV+IIodLHpHQ4Y5FD1JlAXAJn9PKk468TlNJ3au9RHLKL3a3nf0xh+QjRg2jA6R7A==
X-Received: by 2002:a05:600c:46d3:b0:45f:29eb:2148 with SMTP id
 5b1f17b1804b1-4771a46941fmr9387545e9.7.1761636726410; 
 Tue, 28 Oct 2025 00:32:06 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd48a07dsm179254745e9.17.2025.10.28.00.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 00:32:06 -0700 (PDT)
Date: Tue, 28 Oct 2025 08:32:04 +0100
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
Message-ID: <aQBxdDzFkR9CYpSN@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <aP-OLNFQA0M16xuy@fedora>
 <0dac7c85-0b44-4a6c-b1e1-5833649e6413@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0dac7c85-0b44-4a6c-b1e1-5833649e6413@bootlin.com>
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

On Mon, Oct 27, 2025 at 04:53:03PM +0100, Louis Chauvet wrote:
> 
> 
> Le 27/10/2025 à 16:22, José Expósito a écrit :
> > Hey Louis,
> > 
> > On Sat, Oct 18, 2025 at 04:01:00AM +0200, Louis Chauvet wrote:
> > > VKMS have a wide range of options. The aim of this series is to introduce
> > > many configfs attribute so VKMS can be used to test a wide range of
> > > configurations.
> > > 
> > > This series depends on [1] that should be applied soon.
> > > 
> > > PATCH 1-13 are for configuring planes
> > > - name
> > > - rotation
> > > - color encoding
> > > - color range
> > > - plane formats
> > > - zpos
> > > PATCH 14-19 are for configuring the connector
> > > - type
> > > - supported colorspace
> > > - edid
> > > PATCH 20-22 are to enable dynamic connectors
> > > 
> > > [1]:https://lore.kernel.org/all/20251016175618.10051-1-jose.exposito89@gmail.com
> > > 
> > > PS: Each pair of config/configfs patch are independant. I could
> > > technically create ≈10 different series, but there will be a lot of
> > > (trivial) conflicts between them. I will be happy to reordoer, split and
> > > partially apply this series to help the review process.
> > 
> > I just finished reviewing the series.
> 
> Thanks a lot, I started to apply your suggestions (I agree to most of them).
> 
> > Amazing work, thanks a lot for adding all of these new properties!!
> > 
> > I'd like to see KUnit and IGT coverage to test coner cases and, since this
> > is uAPI, to have a mechanishm to catch regressions without lots of manual
> > testing.
> 
> I started to add some Kunits for vkms_config.c, for the format parsing too.
> 
> > Let's talk so we can start working on them on v2, I'll be able to help in
> > that front if needed.
> 
> I finish to apply your suggestions and I will send the v2 soon, so we can
> discuss on the same ground. I think we can add a little bit of vkms_config.c
> testing, but for vkms_configfs I need to see if we can mock configfs
> interations from kunit tests.

For vkms_configfs I find more convinient IGT than mocking in KUnit.
It saves maintaining a bunch of mocking code and it is a good way to
test end-to-end VKMS.

Jose

> Have a nice week,
> Louis Chauvet
> 
> > Best wishes,
> > Jose
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > > Louis Chauvet (22):
> > >        drm/vkms: Introduce config for plane name
> > >        drm/vkms: Introduce configfs for plane name
> > >        drm/vkms: Introduce config for plane rotation
> > >        drm/vkms: Introduce configfs for plane rotation
> > >        drm/vkms: Introduce config for plane color encoding
> > >        drm/vkms: Introduce configfs for plane color encoding
> > >        drm/vkms: Introduce config for plane color range
> > >        drm/vkms: Introduce configfs for plane color range
> > >        drm/vkms: Introduce config for plane format
> > >        drm/vkms: Introduce configfs for plane format
> > >        drm/vkms: Properly render plane using their zpos
> > >        drm/vkms: Introduce config for plane zpos property
> > >        drm/vkms: Introduce configfs for plane zpos property
> > >        drm/vkms: Introduce config for connector type
> > >        drm/vkms: Introduce configfs for connector type
> > >        drm/vkms: Introduce config for connector supported colorspace
> > >        drm/vkms: Introduce configfs for connector supported colorspace
> > >        drm/vkms: Introduce config for connector EDID
> > >        drm/vkms: Introduce configfs for connector EDID
> > >        drm/vkms: Store the enabled/disabled status for connector
> > >        drm/vkms: Allow to hot-add connectors
> > >        drm/vkms: Allows the creation of connector at runtime
> > > 
> > >   Documentation/gpu/vkms.rst                    |  42 +-
> > >   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  18 +
> > >   drivers/gpu/drm/vkms/vkms_config.c            | 183 ++++++
> > >   drivers/gpu/drm/vkms/vkms_config.h            | 524 +++++++++++++++
> > >   drivers/gpu/drm/vkms/vkms_configfs.c          | 893 +++++++++++++++++++++++++-
> > >   drivers/gpu/drm/vkms/vkms_connector.c         | 137 +++-
> > >   drivers/gpu/drm/vkms/vkms_connector.h         |  36 +-
> > >   drivers/gpu/drm/vkms/vkms_crtc.c              |  11 +-
> > >   drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
> > >   drivers/gpu/drm/vkms/vkms_output.c            |  19 +-
> > >   drivers/gpu/drm/vkms/vkms_plane.c             |  73 +--
> > >   11 files changed, 1865 insertions(+), 77 deletions(-)
> > > ---
> > > base-commit: b291e4f1a4951204ce858cd01801291d34962a33
> > > change-id: 20251017-vkms-all-config-bd0c2a01846f
> > > prerequisite-message-id: 20251016175618.10051-1-jose.exposito89@gmail.com
> > > prerequisite-patch-id: 74083a8806b1f26d9b4cd2a5107c756b971c4d11
> > > prerequisite-patch-id: f982390487699921b625b413e8460d67ca7a74c9
> > > prerequisite-patch-id: 0afca639e43c8fbfea2af1bc395e489efc8e1f10
> > > prerequisite-patch-id: 6285108b2fd90d30d15d4cb4fdddfef953fad51b
> > > prerequisite-patch-id: 2eacf5ad4f25f54a60958aa7a2df633d5642ce2f
> > > prerequisite-patch-id: 81e98ac3aeb3b6128098ab7bab56d3446a3a2705
> > > prerequisite-patch-id: 973f94c4edb4a5822c84a57d4479ca40e9cf25de
> > > prerequisite-patch-id: 0efbaf1b0e962a1c40bf5a744b5089d8be696f62
> > > prerequisite-patch-id: afa0cff94085e6ab216ffd9b99cd3dc882a0a687
> > > prerequisite-patch-id: 3561347f2b586392985a8e3af9ed1c5c7d3eefd5
> > > prerequisite-patch-id: 94030044ae8d404f7cdaed9137bddd59cfb22e79
> > > prerequisite-patch-id: a54b483797d5ffb7ce13b56a8943025181cd0d7a
> > > prerequisite-patch-id: f148fe7f445cb42437e7e2ba8b59e7e0fd40da8b
> > > prerequisite-patch-id: 1ef2045872843670c452816c5d6187b713c9258c
> > > prerequisite-patch-id: 3b9963ea3ae3455ae15ee36b67042c06a2ef6006
> > > prerequisite-patch-id: 519ee42dfabb4de734e41e59bd07d7a723d810bb
> > > 
> > > Best regards,
> > > -- 
> > > Louis Chauvet <louis.chauvet@bootlin.com>
> > > 
> 
> -- 
> --
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
