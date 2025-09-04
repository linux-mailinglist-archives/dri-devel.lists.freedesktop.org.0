Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D602B44A27
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC64510E35B;
	Thu,  4 Sep 2025 23:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AUN7lJ0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823E210E35B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:06:39 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-71d603cebd9so19807807b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757027198; x=1757631998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zz0GiMYb44SvgwnTpnJ1WiT4G0dl9xf04AReEOrfC2g=;
 b=AUN7lJ0Hw2WG/WgMCfmqUmF9f9iwRh/5WWz1dTTHu9qGSN5yJXT2fD3o4t8ItzRZxa
 P1sSiMmnpqgFLsTQ+Bt0VPSsF6ArgF05aJRB8/wLZVQTWuQnV/acZAoouaf45pd2GXhm
 F/T6tWhsK8/OxQe2OY+dEphPmQgBdD7fSsd714O7I2pEdfPQbO/pB2Dk0MlaqwM6imq6
 e5Fxoa7BcvE0Sfp2YQ8aEG7EpNmQt4ZeQlv2G3vZ7ODrsC6hwukJdUp8y2Ss1q0RvUyt
 4r6ccIxQb6JIsoLfD7mPlbX1Xtc6JdTpCqs15G4y7mI9j/6X/z9S7Ib1b3I62eXUXb2E
 zYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027198; x=1757631998;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz0GiMYb44SvgwnTpnJ1WiT4G0dl9xf04AReEOrfC2g=;
 b=jazQICxD81oNGIOHkvXqKmDjLQHJo9wmwLhW/r2tTJz+Mgm3iAe9HCJR8sOASwA9qr
 8WjRfCgGZOXcmOu/9sANo6J1/kPbZQpUFCYJsZbm4JEn9wKGKAtJUhciWFztzvlNAj4V
 6SnsC1i1hYi6GO+Nwztu2kY2xrTqvynEsqzglSQwOXiAlv2QsZa5U1R42ptOz1KNMtE6
 Ivf7hsUCzKnSGLV1+LEdQPYlbyZegL39cJKw5wyNlAIC08M+1nQHKylfDz1K48MjdLeO
 cHQs8360KWQBFLpuPRUITnW7yuDCjuCateHyoc1yMCXKZZNLvwAGLyddCQ+SKwIQmFxa
 Mnmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3ffA5tbTs9Ip3x+/5/fJQSvU5kkdKH0HtDp6olwL3c1WArsSLuoQkt1H01DqZTabBC5/f3aNWpcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxorQ4+qAuheYbgqAsQ+alemk6suojkDdAe4rNrQGy0cOkBFb9P
 v/nyKnTeI9VhDjjaDQMORYKDY1gnWoq6ho9istSCE0ybD78JSwjpAnaDkxX9AJGXdj2hocTK7y4
 70FppcF+aJaQwmG8vAy9Zezyz0dxBeCE=
X-Gm-Gg: ASbGncvopJAzEx+CQ/g7XMW0mK12GmkUvzE6esNkDBoX7LAsseiPsO2c+gz4Gm+uwx/
 1ZXiC3G4TMvbuiPQndjgqYYsHv6NMWYc3sBH827DgXar1x4PewbwVTgcJNGDgzzWHGwWGsY7U/M
 XjT2N8tjWB0+fk0Oq6jjRs0oHXrohjd4uTRoe1bDldpAnnKmKD5Ox8Oi1b9tVsLeUVLOSHGWQF2
 PMCrTHUD/4ns1ZN+Z6P0eHXdXyMp8kbpr7ZeVpQ/Kgdh4L+ckJyBzEXYLTVHpJ5wggETbbFdEd9
 0F3ngRTPc8/QOASitA==
X-Google-Smtp-Source: AGHT+IH/UOPapUe67ml8mQg2G5ZORmPRUqKua+tHRBkgLjhGsyEaV9W6C1STKBiXSzNdaKZDJ9D9LdHr4bJeBLGW/a0=
X-Received: by 2002:a05:690c:dcd:b0:721:5b31:54ce with SMTP id
 00721157ae682-722764fe1e2mr215403527b3.31.1757027198220; Thu, 04 Sep 2025
 16:06:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-3-olvaffe@gmail.com>
 <20250904080239.779b5e24@fedora>
In-Reply-To: <20250904080239.779b5e24@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Sep 2025 16:06:26 -0700
X-Gm-Features: Ac12FXzcL3-czZFvhjU2Mujq6i9ZrXWDYBfA8bIrDPlQ3iKdmOHkCSCvjxw7aN8
Message-ID: <CAPaKu7RdpEtwqDHrjt4HJOJVYeRjUa38Sk70=6dD9WmXYtf_jw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] drm/panthor: add initial mt8196 support
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

On Wed, Sep 3, 2025 at 11:02=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed,  3 Sep 2025 15:55:04 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor=
/Makefile
> > index 02db21748c125..75e92c461304b 100644
> > --- a/drivers/gpu/drm/panthor/Makefile
> > +++ b/drivers/gpu/drm/panthor/Makefile
> > @@ -12,4 +12,6 @@ panthor-y :=3D \
> >       panthor_mmu.o \
> >       panthor_sched.o
> >
> > +panthor-$(CONFIG_DRM_PANTHOR_SOC_MT8196) +=3D panthor_soc_mt8196.o
>
> Based on the stuff you describe (ASN hash, core mask read from an nvmem
> cell, extra clks/regulators?), I don't think we need per-soc source
> files and per-soc config options. If it becomes too HW specific (no
> abstraction to make it SoC-agnostic), we can reconsider the per-SoC
> file approach, but I believe it can all live in panthor_drv.c for now.
That's about right except no extra clk/regulator is needed.

gpueb on mt8196 is yet another mcu running on its own fw.  It can
provide clk/regulator to panthor and no change is needed from panthor.
But it can also do dvfs autonomously, in which case panthor needs to
be modified to make clk/regulator/devfreq optional.  I think the
latter is where Nicolas Frattaroli is going and requires more invasive
integration.
