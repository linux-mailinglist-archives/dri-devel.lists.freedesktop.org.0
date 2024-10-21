Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE1C9A6DC4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 17:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F143910E02D;
	Mon, 21 Oct 2024 15:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=criticallink.com header.i=@criticallink.com header.b="pnOWBDBn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EDD10E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 15:13:43 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539f4d8ef66so6189210e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 08:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1729523622; x=1730128422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwppW5KGzHko9Zrh6awJ4uJN4mUN1akho9LTmYz6AB0=;
 b=pnOWBDBnsX04+DIXRLTWybDqaLCNUg/E6pjK7ubt/dmQsMsymRNgQRWPRIlsLlieoe
 3MPgQY9+4AEK4HrS+WnqntED08fhqLaUZJePIN62/8gkVHzMOrTXVjvu+JoXBkYSSl5d
 p7uZ5ksLy5V1E/fXPnRBW/C2tDvMuNOzY9Xn5dKidvWV7LCLax51uOUqZtA7+QKLv8Qu
 ju2rpZYfpY/hyazallmDVP+PGm9DabN6Tn++t5MxcNspHR5fp/H+iJUxUwfX4W26S20B
 PZIbwiboTaY2ChRVcBgsh/99com1bzD7qe+2pKpVL7wku9ilnZxlBBYzaz2QNmtMGcWS
 aNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729523622; x=1730128422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwppW5KGzHko9Zrh6awJ4uJN4mUN1akho9LTmYz6AB0=;
 b=iFOgHw4dYEGvaFnETpX8v2T13VPtg8ZGBSGWFa2jIxcJ5TgcfzuEN0+grYIziUif1R
 KCzsmJoyX3aUpMTQx2TtxWdbvmtXf5g2hNeVrQ/KgDq+fzGIgR4smtVUgnCjaZCE8huB
 kEYw6shM1wLqZpzaLjSRHMimYWNBKxlhn3YurMZ+1JAURP9VYRJcyx0pxrR6x0lZIDge
 hn5YJD89fmrFFe35lqlBie0NkgkkCQT28UPwZht5FpeSKohfjUb8kAu3PEaeGZQXfBVN
 Hw5idVd8Ze/yS47hZr2d7epTcQBwTrAJFcSltHGc4JEhsCW/01gt6B9Sps/grTyoL+RP
 c4sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHCp9efNYYfv6rGAKD3lbcb5chaJITbvl9HQXdSUicKgGNz5uYInVmbYq3HRxnWtWenImvfr1p/aQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvsL3Vq8PPMuVz04UZOSAxuDZX0GnlbwVCg2YtrYug4JnT2KZs
 UISA0wJi6nPR/ZIkxaw4nTkUfUqvF4KbGLtC+Om2wHBpKcTynUAAN+bUaj5dgLJKJ5qZDGzLWTa
 4HGfhmAc/EocLntpabdzSAmhzCXVj+NylPe+s
X-Google-Smtp-Source: AGHT+IFg6sLaPCI4+zu29tq4MBdGk5PGlOsywwq2DfZr8M/tfhZqy+/Jp4NatrckxdCornEORL50z19tm6KxCScHtbQ=
X-Received: by 2002:a05:6512:31ca:b0:52f:2ea:499f with SMTP id
 2adb3069b0e04-53a152199e7mr5802225e87.24.1729523620475; Mon, 21 Oct 2024
 08:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-5-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-5-82ddaec94e4a@ideasonboard.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 21 Oct 2024 11:13:29 -0400
Message-ID: <CADL8D3Z=4dx5B4YdA_TD-900tnTm+Ev_ar+6CbaQ7iV04p9B0Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] drm/tidss: Clear the interrupt status for interrupts
 being disabled
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Mon, Oct 21, 2024 at 10:08=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Devarsh Thakkar <devarsht@ti.com>
>
> The driver does not touch the irqstatus register when it is disabling
> interrupts.  This might cause an interrupt to trigger for an interrupt
> that was just disabled.
>
> To fix the issue, clear the irqstatus registers right after disabling
> the interrupts.
>
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Disp=
lay SubSystem")
> Cc: stable@vger.kernel.org
> Reported-by: Jonathan Cormier <jcormier@criticallink.com>
> Closes: https://e2e.ti.com/support/processors-group/processors/f/processo=
rs-forum/1394222/am625-issue-about-tidss-rcu_preempt-self-detected-stall-on=
-cpu/5424479#5424479
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> [Tomi: mostly rewrote the patch]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks for the updates. They look pretty similar to the changes I
proposed and thus look good to me.
Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
Tested an equivalent patch for several weeks.
Tested-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/=
tidss_dispc.c
> index 99a1138f3e69..515f82e8a0a5 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c



--=20
Jonathan Cormier
Software Engineer

Voice:  315.425.4045 x222



http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211
