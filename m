Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C61B1A4EB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 16:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742CE10E570;
	Mon,  4 Aug 2025 14:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QFnqqyiT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B5110E570
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 14:29:07 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so2910660f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754317746; x=1754922546; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JPF/i+xbptOIIwWgG11W+yuVUiTktvmLOJmJ6wof0uQ=;
 b=QFnqqyiTHjkmqxzGD9M/pAWgZAa6SpEldtmkiEUnnJyLnVQ1WOPIiSBEIfeqccQlmd
 Q/McdESvkZXoPaLITXtGn9v8f08hdgPeaLzx4Qf1Wbq4cqkTDCxpqCgxBMuL4vw7UXxf
 0+pTKJBenvWYM3FaJ/vr0EWqRqzzsKNzyqIOJByaxnmzKdB8Q7XnwppBAodaw0Fp9ZWX
 CJHdgSEQJi3+t8euU33H+7waYAIDzrnBKHV9n6LAntH6M1mQhSodnE5F9U5ySy9XS/m8
 56caGB6UeW/WZusUuCc7cJ/EecXBXwC+Pqzg1jDQfRzuSr5HlGHRhIfCuibJk9lX+ppC
 epSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754317746; x=1754922546;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JPF/i+xbptOIIwWgG11W+yuVUiTktvmLOJmJ6wof0uQ=;
 b=I8UUFr5kv1exEl4+8pbSQ039ch86nmEYj4esM25Yeji90xYGHvHnK/3lhHic5lGoaI
 yfTU6318lQDxh8waMUcTHEEFdUrJzQPuoem9gzXMRdOHkU3+nsO1VTlwHDS5DFcg07E5
 uxQ0L+jwsTlkfmhD9ENgOmp4+gLWajny+WpcNNKpMqbwes63hmpU6lz0vufOdVhtc/SM
 kXVcM2xBRNKyxb9W7Id7v89DOmikyWzlmlQ0K0QjOdEOdrVyQaW+qi1NyQZdnv4Pvqp2
 GW2EhqDGCJsrIEKWTM7SORWs+udy6L9svhSo5De0Okn2wdzJeyj4scz5HomsfxEQ52HJ
 X2EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC3K5mAwCerRLj+MNtj1cQgfOqYxIkAOU04DhktRpfPZmtcY2+mKIYTOBws6U9dk6bPWO1IaC5bTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfNDk/TymCwOF1zldazxIVZqt6FHp99i1913V6mZcUgZjcIrMT
 fhzf7fe5MTS9+dDRrx3gx6nZABkHTAMaKtfYuKhqkbhc5UYH5dE6480O
X-Gm-Gg: ASbGncutpMlNXRjwVoZWeMlrMaSR3RCYYXTQjfBi8A8Qoy0ARexvjKVDme7foM37MnD
 Ho/ExKIjkbRWStvn6Jki50vJLF4VzzQQ+C4fJmj+J6qVGAyhRyuVVYru1QrQHQXbtynO5faqQ/s
 Gb58mC1gWB1ViaxYFE6R0tSoIXusNttdSWSvaNi/6kPDfzp5b4Zmt/gUEoXnheWB4kYhcktLDSE
 +AnsXEzm2fTsS+oZUqbxpYC4nrlpHZksQQNnJk+DISdA2VjAfoWxWKMWPPEaT0mKcvuWosJM+Uz
 T7kUQt3Q1hTELlaMfbdYAdFu1S/vo111ZL/O/knsLicTfMDMsSBukY6/8/s4AJl5noEiewXNZyQ
 ly0ilmfgGp9QwdVRZeZCNgNLqUxTr4bJt7GNsG3jC
X-Google-Smtp-Source: AGHT+IH5DR/XkcYK8i7eOXl8YoocrMKrkJ2SKSzTr/D7Mi0OK0Z3i7X9QEdPl7OGeni3azzowMlXPQ==
X-Received: by 2002:a05:6000:26ca:b0:3b7:dd87:d73f with SMTP id
 ffacd0b85a97d-3b8d94c6708mr7162075f8f.43.1754317745609; 
 Mon, 04 Aug 2025 07:29:05 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac51asm16102950f8f.1.2025.08.04.07.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 07:29:05 -0700 (PDT)
Date: Mon, 4 Aug 2025 16:29:03 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, tzimmermann@suse.de,
 mripard@kernel.org, simona@ffwll.ch, sebastian.wick@redhat.com,
 victoria@system76.com, Mark Yacoub <markyacoub@google.com>,
 xaver.hugl@kde.org, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 00/16] drm/vkms: Add configfs support
Message-ID: <aJDDr_9soeNRAmm0@fedora>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
 <57e425ff-2731-47d7-b5ce-c34f5baf71b4@bootlin.com>
 <aHpGGxZyimpJ8Ehz@xpredator>
 <bc0d775e-21dc-4cb7-a905-06b81028267b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc0d775e-21dc-4cb7-a905-06b81028267b@bootlin.com>
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

Hi everyone,

On Fri, Jul 18, 2025 at 05:51:40PM +0200, Louis Chauvet wrote:
> 
> 
> Le 18/07/2025 à 15:03, Marius Vlad a écrit :
> > Hi,
> > 
> > FWIW, we (Weston) also use vkms in CI and we have in plan to make use of
> > these changes to exercise some internal code paths and enhance our tests.
> > Look forward to getting these into the tree and have it a in release. We
> > tend to follow with a branch/stable release so I suppose that's going be
> > a while. Just wanted to also say thanks a lot for driving this.
> 
> Hi,
> 
> Thanks a lot for this positive feedback!
> 
> > Just curios, in the current form would it be possible to configure the
> > plane's zpos position? Apart from testing underlay/overlay in the same
> > time, some drivers today allows the primary to be independently
> > positioned. Simulating these type of configurations would allow see what
> > architectural changes we might need to do to transition towards a place
> > where we can use any other plane as a (fallback) compositing one like we
> > do today with the primary one.
> 
> Currently nothing is done to do a proper z-pos managment, and even worse:
> the z-order is not really predictable (order of creation in configfs, so if
> userspace creates cursor-primary, the cursor will be behind the primary
> plane).

Back from holiday and catching up on email.

First, thanks for presenting this in the Display Next Hackfest :D
I couldn't attend, is there a link to the presentation?

Back to zpos, as far as I can tell, we do not expose this property
at the moment for any plane type.

3 years ago I sent a patch adding the property and blending following
the zpos order, but it wasn't merged:
https://github.com/JoseExposito/linux/commit/befc79a1341b27eb328b582c3841097d17ccce71

Code has changed since then, but we might be able to reuse some bits.
CC me if you send a patch and I'll review it :)

> We need to change this before merging ConfigFS. Fir the first iteration, we
> can simply: make primary plane always at the back (zpos=0), overlay with
> undefined ordering (zpos=1), cursor on top (zpos=2) directly in
> vkms_plane_init. I need to check if this will be a uAPI break if we add
> later some configfs attributes like default_zpos / zpos_min / zpos_max.

If we don't set the zpos at the moment, I don't think we need to
add it before configfs. I'd prefer to merge configfs as it is and
then support zpos both in the default VKMS device and in the custom
ones. In this way, we might avoid unexpected user-space changes.

Anyway, this is something we can discuss in the series adding zpos
rather than here.

> Even with this, we need to fix [1] to compose planes in the correct order (I
> don't think this is broken right now because we create primary then overlays
> then cursor, so the composition order will be correct).
> 
> [1]:https://elixir.bootlin.com/linux/v6.15.6/source/drivers/gpu/drm/vkms/vkms_composer.c#L392-L394
> 
> @José, I will fix the vkms_composer to use plane->state->zpos or
> normalized_zpos.

Check my patch, it is already done. But for the configs code we might
need a different solution.

Thanks to everyone for your interest in this series,
José Expósito

> Thanks a lot for this suggestion which showed a flaw in the current
> implementation!
> 
> Louis Chauvet
> 
> > On Thu, Jul 17, 2025 at 06:37:17PM +0200, Louis Chauvet wrote:
> > > +CC: Mark (Google), Sebastian (Mutter), Xaver (KWin), Victoria (Cosmic)
> > > 
> > > Hi everyone,
> > > 
> > > Last week, I presented this work at the Display Next Hackfest, and the
> > > feedback from compositors was very positive. At least KWin, Mutter, and
> > > Cosmic are interested in integrating it into their tests, so it would be
> > > great if someone could review it.
> > > 
> > > Sebastian quickly tested this work (using [2] for full features) with their
> > > existing VKMS tests [1], and it worked. From what I understand, the tests
> > > are quite basic —just sanity checks— but we were able to reproduce the
> > > default vkms device using ConfigFS.
> > > 
> > > If another compositor wants to test the ConfigFS interface (I will try to
> > > keep [2] updated), that would be amazing. Feel free to send feedback!
> > > 
> > > A small note: This series has a minor conflict since the conversion to the
> > > faux device, but it can be applied using `b4 am -3 ... && git am -3 ...`.
> > > @josé, if you send a new iteration, can you add markyacoub@google.com in
> > > copy, and maybe Sebastian, Xaver, Victoria if they want to follow the
> > > upstreaming?
> > > 
> > > Thank you,
> > > Louis Chauvet
> > > 
> > > [1]:https://gitlab.gnome.org/swick/mutter/-/commit/88a7354942d9728dae06fb83cc4f2d2c7b08b694
> > > [2]:https://github.com/Fomys/linux/tree/configfs-everything
> > > 
> > > 
> > > 
> > > Le 07/05/2025 à 15:54, José Expósito a écrit :
> > > > Hi everyone,
> > > > 
> > > > This series allow to configure one or more VKMS instances without having
> > > > to reload the driver using configfs.
> > > > 
> > > > The series is structured in 3 blocks:
> > > > 
> > > >     - Patches 1..11: Basic device configuration. For simplicity, I kept the
> > > >       available options as minimal as possible.
> > > > 
> > > >     - Patches 12 and 13: New option to skip the default device creation and to-do
> > > >       cleanup.
> > > > 
> > > >     - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
> > > >       part of the minimal set of options, but I included in this series so it can
> > > >       be used as a template/example of how new configurations can be added.
> > > > 
> > > > The process of configuring a VKMS device is documented in "vkms.rst".
> > > > 
> > > > Finally, the code is thoroughly tested by a collection of IGT tests [1].
> > > > 
> > > > Best wishes,
> > > > José Expósito
> > > > 
> > > > [1] https://lists.freedesktop.org/archives/igt-dev/2025-February/086071.html
> > > > 
> > > > Changes in v5:
> > > > 
> > > >     - Added Reviewed-by tags, thanks Louis!
> > > >     - Rebased on top of drm-misc-next
> > > >     - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@gmail.com/
> > > > 
> > > > Changes in v4:
> > > > 
> > > >     - Since Louis and I worked on this together, set him as the author of some of
> > > >       the patches and me as co-developed-by to reflect this joint effort.
> > > >     - Rebased on top of drm-misc-next
> > > >     - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@gmail.com/
> > > > 
> > > > Changes in v3:
> > > > 
> > > >     - Applied review comments by Louis Chauvet: (thanks!!)
> > > >       - Use scoped_guard() instead of guard(mutex)(...)
> > > >       - Fix a use-after-free error in the connector hot-plug code
> > > >     - Rebased on top of drm-misc-next
> > > >     - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@gmail.com/
> > > > 
> > > > Changes in v2:
> > > > 
> > > >     - Applied review comments by Louis Chauvet:
> > > >       - Use guard(mutex)(...) instead of lock/unlock
> > > >       - Return -EBUSY when trying to modify a enabled device
> > > >       - Move the connector hot-plug related patches to the end
> > > >     - Rebased on top of drm-misc-next
> > > >     - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-1-jose.exposito89@gmail.com/T/
> > > > 
> > > > José Expósito (6):
> > > >     drm/vkms: Expose device creation and destruction
> > > >     drm/vkms: Allow to configure the default device creation
> > > >     drm/vkms: Remove completed task from the TODO list
> > > >     drm/vkms: Allow to configure connector status
> > > >     drm/vkms: Allow to update the connector status
> > > >     drm/vkms: Allow to configure connector status via configfs
> > > > 
> > > > Louis Chauvet (10):
> > > >     drm/vkms: Add and remove VKMS instances via configfs
> > > >     drm/vkms: Allow to configure multiple planes via configfs
> > > >     drm/vkms: Allow to configure the plane type via configfs
> > > >     drm/vkms: Allow to configure multiple CRTCs via configfs
> > > >     drm/vkms: Allow to configure CRTC writeback support via configfs
> > > >     drm/vkms: Allow to attach planes and CRTCs via configfs
> > > >     drm/vkms: Allow to configure multiple encoders via configfs
> > > >     drm/vkms: Allow to attach encoders and CRTCs via configfs
> > > >     drm/vkms: Allow to configure multiple connectors via configfs
> > > >     drm/vkms: Allow to attach connectors and encoders via configfs
> > > > 
> > > >    Documentation/gpu/vkms.rst                    | 100 ++-
> > > >    drivers/gpu/drm/vkms/Kconfig                  |   1 +
> > > >    drivers/gpu/drm/vkms/Makefile                 |   3 +-
> > > >    drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
> > > >    drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
> > > >    drivers/gpu/drm/vkms/vkms_config.h            |  26 +
> > > >    drivers/gpu/drm/vkms/vkms_configfs.c          | 833 ++++++++++++++++++
> > > >    drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
> > > >    drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
> > > >    drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
> > > >    drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
> > > >    drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
> > > >    12 files changed, 1072 insertions(+), 13 deletions(-)
> > > >    create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
> > > >    create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> > > > 
> > > > 
> > > > base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315
> > > 
> > > -- 
> > > Louis Chauvet, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > > 
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
