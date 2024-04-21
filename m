Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CED8AC11E
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 21:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C123410E28A;
	Sun, 21 Apr 2024 19:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b6wjIFRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273FE10E473
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 19:53:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso2838854f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Apr 2024 12:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713729180; x=1714333980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IMaenB/28UTgVBO1bvU65I16JiSLNMn+INLi6fNav7Q=;
 b=b6wjIFRp4/O9TIWZGW2MmeuNXvqScaKZY4LtFNNbnVx9xmA6aISvswoQM9Kxu0uXdC
 cEo8PFC1kVvhDUIEeuIGkLVSeJ3tIOuR457X+T/tXJbUMe54iv7q8BF8cN1NOSIoqu42
 tc5CYVSrWYJrDSb0JD9Q+JwVh7NH04hCycpBUIsNoAXtEGp4/mSOktDfRcgCOOhd9kFc
 FEk9FUFpbUAyX61MSm5gk8A84MvU8+1aaVQgNNNJfHNJq6hfq7YYH23RqeLySiKrlBxX
 rK5+SysHBt9IlFpJBiDX04IWHcsoPC2G+LBH3a0iydXbkAcWutNjPC/Yi7cVnoAj49lH
 HhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713729180; x=1714333980;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IMaenB/28UTgVBO1bvU65I16JiSLNMn+INLi6fNav7Q=;
 b=jtHW+WrnE8XlSYHBJz2/DZRTRrKg2lmVW/hIVYyKSCB6Kfgl68QRSC/BhgLFK9LG3R
 0ZJPkfR7DjQCQ6rcdVo04OOBZRUfrlGG5HU2L90/0qSDZSGR7Xlm6GGOwHFx7VMxuyue
 5LiRF5UewOBe/sOw9zcoTj/QnI2JtNj9LhWuRgWrFblJilBGZsGPDriMU8gfT33JbvQe
 BN8+mfiRmhXZ9NzckLaTxD9V1rdp6aFNkKq2QNSXySuG0/k9I6Av2//fLS+9pdoZ7C4M
 whfQEwvWfB+3qOeb6rHhhV+zKfjoEeDZFGgEh8fuEmgp+vGleH9+mc8yg5/eYKBzz63u
 BVwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTOZIjd9YC6R1vJbvrhKXCwDTaiDc7uLfcLHEM6hvZt+dKxnud8wrv/Dv15VGdA7tJHCU6jK7ktlNpbW0dEgu3D8znah/K9eYX0TADB2mX
X-Gm-Message-State: AOJu0YyQr3VAHQKxwL/qUwaH8kKJOfWSLmxPiQoDTakIStHBHqqtHTee
 rHdNa4yZbhElyVHe6Y/92RONp3kpmDrJTaDdyfIphB9KglcjSjQo
X-Google-Smtp-Source: AGHT+IH+FOSeFQjKP56pJvGYgnwg2xOA1gAlCxEdbMe/MGWtoLYfC/TIEOFAPaMrgTx6JTqFla3PYQ==
X-Received: by 2002:a5d:6083:0:b0:347:f94b:94df with SMTP id
 w3-20020a5d6083000000b00347f94b94dfmr5847674wrt.2.1713729179923; 
 Sun, 21 Apr 2024 12:52:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 x5-20020a5d6b45000000b003472489d26fsm10129829wrw.19.2024.04.21.12.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Apr 2024 12:52:59 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: =?utf-8?B?T25kxZllag==?= Jirman <megi@xff.cz>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/3] Move blender setup from individual planes to crtc
 commit in sun4i-drm
Date: Sun, 21 Apr 2024 21:52:58 +0200
Message-ID: <2725781.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <wynuwtyn2skchb7gc5qixql2pxnb2nqvbmrda6s53u7nt5ki7n@hqb46kttkhee>
References: <20240224150604.3855534-1-megi@xff.cz>
 <wynuwtyn2skchb7gc5qixql2pxnb2nqvbmrda6s53u7nt5ki7n@hqb46kttkhee>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Dne petek, 19. april 2024 ob 15:36:17 GMT +2 je Ond=C5=99ej Jirman napisal(=
a):
> Hi,
>=20
> On Sat, Feb 24, 2024 at 04:05:57PM GMT, megi xff wrote:
> > From: Ondrej Jirman <megi@xff.cz>
> >=20
> > This series refactors blender setup from individual planes to a common
> > place where it can be performed at once and is easier to reason about.
> >=20
> > In the process this fixes a few bugs that allowed blender pipes to be
> > disabled while corresponding DRM planes were requested to be enabled.
> >=20
> > Please take a look. :)
> >=20
> > v2:
> > - use regmap_write where possible
> > - add review tags
>=20
> It would be nice to have this applied.

Maxime,

do you mind applying?

Best regards,
Jernej

>=20
> Kind regards,
> 	o.
>=20
> > Thank you very much,
> > 	Ond=C5=99ej Jirman
> >=20
> > Ondrej Jirman (3):
> >   drm/sun4i: Unify sun8i_*_layer structs
> >   drm/sun4i: Add more parameters to sunxi_engine commit callback
> >   drm/sun4i: Fix layer zpos change/atomic modesetting
> >=20
> >  drivers/gpu/drm/sun4i/sun4i_backend.c  |  4 +-
> >  drivers/gpu/drm/sun4i/sun4i_crtc.c     |  2 +-
> >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 70 ++++++++++++++++++++-
> >  drivers/gpu/drm/sun4i/sun8i_mixer.h    | 20 ++++++
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 85 +++----------------------
> >  drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++----
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 86 +++-----------------------
> >  drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++----
> >  drivers/gpu/drm/sun4i/sunxi_engine.h   | 13 +++-
> >  9 files changed, 125 insertions(+), 195 deletions(-)
> >=20
>=20




