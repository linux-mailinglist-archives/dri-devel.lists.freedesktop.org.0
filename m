Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23AE904273
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 19:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4107D10E233;
	Tue, 11 Jun 2024 17:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="BzKXJGvI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8440510E233
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 17:33:53 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6b0745efaeeso13352706d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718127231; x=1718732031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FbtkdbgCU8Tr9b8WsS7VgfWbCUiNhQDh9AT/ShV3toc=;
 b=BzKXJGvINWDPsB9RN1szBelC9aaSRuSmgpCrhVmn1bU79hPHX2UFc2VjSICwvdH4oc
 obJg/IM4srwkCs9fRUhqPWlDgNkMERaZcej2uTiqcEIUiUFPOG6J9qDjaYDpM7h5AofT
 VmtZrXdCLyiAfWcUkrC2jg97Q54YVtcdY+plE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718127231; x=1718732031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FbtkdbgCU8Tr9b8WsS7VgfWbCUiNhQDh9AT/ShV3toc=;
 b=ttjOVpk/3X6SAfmNybpRNZbmCAA2itMroPVS4TNSDiWKAJ+lPtJyXqYCFYPJakqSDy
 dHn7nZ5LI4QZa/Py1xnygs6YVuj27wzOpv68WEMQ1FDC/Pbf+fUkIyV1UQQCxucYN3TQ
 j76kgpiXKJlRbaIK4XnAEyTJhPY5QTxCj1lKISVcqgkWcG576aYhqBzbja6v+5+qhph+
 0AT6EgdCrY6Kbnqf+SFr305gmBHt8vzqxO7wqPflVumipQ4M+rAytXVPXqn9ABiRhpdU
 E7Jjw2NQTT8eJX8mhMRYlF9dStpnfU1KCv8m9YXalF8qRYCSREW8sFonfgzomtEXqd4u
 9lXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTarR4N26h8ORqQJVIOqnmPMdvlz/S+CHoVnq26lKJgkAdyO7mbv+o95wZFSXfkLPOZxAUsITZ5ChOHj2WkjfnhRvH80kx/n2Z6+LYUIIY
X-Gm-Message-State: AOJu0YzjLVp+l5pyHqpKp87BlDp3P5J/5lQ77ExxPO+WpCHyU/s2F+oF
 kwuEPcGXDwFCwJgG1GMu3aC1+UVxm+OdHXofTGL0UbBFwNng2RAHqpa+ahN/rw0jR7dqnSCAQtU
 =
X-Google-Smtp-Source: AGHT+IGCaWpRYmNJCsjeYeyL7Z7uFwCRUKwJx8Bn/z1yGXXX+8PA0U0RGHFuyDcCq+oFTFaGGD2j5g==
X-Received: by 2002:a05:6214:3bc3:b0:6b0:803b:7fe with SMTP id
 6a1803df08f44-6b0803b08eamr68533896d6.25.1718127231659; 
 Tue, 11 Jun 2024 10:33:51 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b08d7f6bf5sm8112676d6.66.2024.06.11.10.33.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 10:33:50 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4405cf01a7fso12051cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 10:33:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXDT1X8cKEkhpATb4wbx4P9GLUzJdlezPDonnHk6CU8AugFHgNO4BTh6QxuCvZMeif881i+borvvzyYi0sBk6zi2yEqPAL2sg/DRfBve8md
X-Received: by 2002:a05:622a:191c:b0:441:5400:9ec5 with SMTP id
 d75a77b69052e-44154009ffbmr2778961cf.1.1718127230079; Tue, 11 Jun 2024
 10:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
In-Reply-To: <6ae804c7163b4d933dbcf940b8dbd5f4c961f037.1716984934.git.geert+renesas@glider.be>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Jun 2024 10:33:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
Message-ID: <CAD=FV=VCwKaN8gmJ=CTx561t_OpAZUEgDQV-95RmKPL-M8+4=Q@mail.gmail.com>
Subject: Re: [PATCH resend v2] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, May 29, 2024 at 5:16=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> From: Douglas Anderson <dianders@chromium.org>
>
> Based on grepping through the source code, this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> This is important because drm_helper_force_disable_all() will cause
> panels to get disabled cleanly which may be important for their power
> sequencing.  Future changes will remove any custom powering off in
> individual panel drivers so the DRM drivers need to start getting this
> right.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case of
> OS shutdown comes straight out of the kernel doc "driver instance
> overview" in drm_drv.c.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a=
6192efabb4cbb06b195f15@changeid
> [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> v2:
>   - Add Reviewed-by.
>
> Tested on Atmark Techno Armadillo-800-EVA.
> ---
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

FWIW: I've created a patch to list DRM modeset drivers that handle
shutdown properly [1]. For now "shmob-drm" is not part of that
patchset. Assuming my patch lands we'll have to later add it to the
list.

[1] https://lore.kernel.org/r/20240611074846.1.Ieb287c2c3ee3f6d3b0d5f49b29f=
746b93621749c@changeid

I will also note that the subject/description of this patch could be
adjusted. They still reference "drm_helper_force_disable_all" which
should have been changed to "drm_atomic_helper_shutdown".

-Doug
