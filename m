Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3CC36295
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 15:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE6D10E778;
	Wed,  5 Nov 2025 14:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X+8p8Q8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65D610E778
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 14:51:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 74AED4099E
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 14:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552DCC4AF0C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762354301;
 bh=JtKwR334IOcJSfMe+jz0Enq6IP3LE52bXJK9P+kWavM=;
 h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
 b=X+8p8Q8jfvgeoUWRhIia0snZRJ+ZKqqo/hRQ0KgiupludUAqi9vdAWPMg+gaEbl5s
 H5yYahlbc62wjGfemrYJ/Hu6YXxN/OLnggTOwRJLRo9Te/ROWElJTttF8CjHidP12B
 abgK39PuSyhW1c5oWtAzFxjs9JgACIximtyVRrbnb0jxJunaKlmwnSbhORBC6F4l0x
 GH/rcMxpmkougg2mrxUBIaF+u1EQTWK3l+buE8ugoSIle7Ji4qlST1C+CyXZRnfPPN
 S5hpOmbeaT4enhnH7Qb5g+GlJ9wT0YWUS6nLhS+U8v2O36WNdvUduRveR95XAOR9MD
 LLQsCCo4L9FKw==
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-362acd22c78so59542471fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 06:51:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeGHlJX1YR3mNAbpowMagxmc6UL0sutzOXoMCT5Oqz8sTXNLCNDLc0SRF6SiSUufVF7vKWeu6QsU4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjyLDtxPudFAcsc1Re/PKqB4UrGZ7nU9fvDsVz5ynyL2GMsRIi
 J0VdcdBSV2BVX0E9pyMLFo4LUk+aQLh+ifodPCN569oFoTatTXQ5ZV7bZeHcCMfn4sQwEpfsxlC
 gl9iBYCYiTGweTtnAR+jN91ER9xmT2kE=
X-Google-Smtp-Source: AGHT+IGIEAVXYAC5/mxxWbiGcaY0AYo/5s9g7cRbmFp73EoeMVAloAa2YGLv9a0XjgeGIWx0S+GlkPfBvf0ZgrTNKUM=
X-Received: by 2002:a2e:be1b:0:b0:378:e437:9085 with SMTP id
 38308e7fff4ca-37a5148889cmr11360031fa.37.1762354299760; Wed, 05 Nov 2025
 06:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
 <20251104180942.61538-6-jernej.skrabec@gmail.com>
In-Reply-To: <20251104180942.61538-6-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 Nov 2025 22:51:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ETD-x=CW+xUCcz9xPv+MC4wYMu+BRXk1znCCp8cmMnA@mail.gmail.com>
X-Gm-Features: AWmQ_bkW3EOy2EHaeuPwKcFuf5kSmMWMiTBiqTH9At9mwTTrXhAJeB0YdOMrK5g
Message-ID: <CAGb2v64ETD-x=CW+xUCcz9xPv+MC4wYMu+BRXk1znCCp8cmMnA@mail.gmail.com>
Subject: Re: [PATCH v2 05/30] drm/sun4i: vi_layer: Move check from update to
 check callback
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ryan Walklin <ryan@testtoast.com>
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
Reply-To: wens@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 5, 2025 at 2:10=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> DRM requires that all check are done in atomic_check callback. Move
> one check from atomic_commit to atomic_check callback.
>
> Tested-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thanks!
