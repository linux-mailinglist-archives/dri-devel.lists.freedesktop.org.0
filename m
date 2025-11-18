Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DFDC69FBE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 15:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6B210E4CC;
	Tue, 18 Nov 2025 14:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LHw/U20X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25310E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 14:31:28 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5945510fd7aso4712158e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 06:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763476287; x=1764081087; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pzn8yIvLjuehOupJrqj+a1is6EVXqmg+sDYqw/i0sQM=;
 b=LHw/U20XyCeS6WdUhZ/o6dW1UwXgM/5R4YMTf8OhUxv+PUFduhCLEduIhpPUYO4HE7
 gcJ5F7q+fGm0oKETWxnvoX14utBP+g5XgTJuw+DooKySM10YSwlUWHWG856Fw16ArBXe
 PDixk9pb+bG1RArAircswbvyiKxuosJNF8I4zwf5jgOD8mBSsDf9SuKMGwWVwDeykeKa
 aw2Of+UbkJe4PDZCkXAKDOh1ipi1poZj5kodys5nLrw0yRpE3gI9fPE4vPY/0uMOfwU8
 EWP85EJBPCQDogwFZ4BecXBXYV2aPbG3qAJS/aK5u1Ynjd9QcjQcR67zj31+kbJOO9r4
 vqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476287; x=1764081087;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pzn8yIvLjuehOupJrqj+a1is6EVXqmg+sDYqw/i0sQM=;
 b=xM4KPOZn80N4npkFQrFelCiZ/rbK4FZfP9a6Nqonik764MuhUqPImAIi/qmrigJrTx
 Jc/fF0NuJPPI04ZHMfSxwxg4ez8fnzNBAnsFPfbOBfRno9n6FxfNBBCRoJqI38gw/nqu
 N6C4odpP61i5VaYe2fbp/uhjMWklgR4pgqOufieVj8P5bwhlC5a2KKGzD47xbUpB3mMM
 NV01eHeRlVWyB4kZORpyfywq7TP2qzNZjaNGOf0VwKqKKA9vELT5xhgUsmRRcHt3Mzgl
 4IGJ6fXfJSQEhRadhjoh/652LYucMWhBVFaunf0oxPJfPiKnevj36nXToSMMlh1TvU9S
 FWUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUycie+2vSUI7Tp1MOKxWV6kqT/m4yndrDUjZVVZW/1VA8vpAWl1o8GKVOdF4lbi4GTVgpN72feOkE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ/wTaZf2DpVtgrkCSec2ODtVTfFAu5fSoTscVQ+IcIKfgJcnX
 g8p5wMF6bg7V9B4nRSLif5lke9i43pyuxWjGUhVKA/o67cDEZicI3xSku6FlpMkctIiJ7wzQOMW
 k1HslodwHHwhCUjW75GsagSW9eFJe84/FIhqb/JDJDA==
X-Gm-Gg: ASbGncscGtLFiXafZNCXJdYdG6sqQv1556PtJN5sJW6QU9FajWIdLtqhjFntDHJUScd
 Koh2J0T1APaDjZK4NLQi2jMRd6mReBjSdmzTvdG0/1pY2kleN9VLZp+S43k/T1V9d0F3E75FI2y
 HPGEBPOxS3BRN9v9dDArT4Wumn2u34qgvqDkTWyl5lRX4XV8xWElJWAYMze3YDi8vaa7fUCpRqH
 ts65r+0b4ZRHZeTIl9gWSg7NdigtQ5qV+GVQeuczpqTdCA+7l88iA6Fo1Va1QKigmS8028DvhtL
 EceGQg==
X-Google-Smtp-Source: AGHT+IELPOimbuR5IVJYEAi39LigFe4j5fGznZqvtxOlXWKI4S8JEw68FVhobMoUKEXE+5lyBHcIW1qlMS5OK+ENxfU=
X-Received: by 2002:a05:6512:1593:b0:594:4ebf:e6eb with SMTP id
 2adb3069b0e04-595841aad25mr6221576e87.14.1763476287161; Tue, 18 Nov 2025
 06:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org>
 <067817a3-dee3-4ffb-a56f-8b46949cb494@ideasonboard.com>
 <CACRpkdYth1-QMDRW17bERXdzYvxvkfLq0o5QVTiis+o6NqubBA@mail.gmail.com>
 <22eb27cd-5ce9-4189-803a-14295b6650c4@ideasonboard.com>
 <CACRpkdazwqEUi7HR6ygUYE8Jr4zfMvJR+r9UL1+S0jduPqAyrw@mail.gmail.com>
 <17cedb40-d64a-4824-a1a9-c82d21f4606a@ideasonboard.com>
 <CACRpkdbtySSfCiV-6Dqy--D+J0vcnyvcFiASLYGauNHSK9TCjw@mail.gmail.com>
 <8256d054-a946-4aff-9953-03b29a4d01c5@ideasonboard.com>
In-Reply-To: <8256d054-a946-4aff-9953-03b29a4d01c5@ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Nov 2025 15:31:13 +0100
X-Gm-Features: AWmQ_bk3jql32FyP8CTXFqS4Cjt2MhJ2ckVz46d3Fw757lVzktRdfGEt52Jvb_g
Message-ID: <CACRpkdaCyqESKyhfmBpnnto8MTFLVLfZxv496Kgy7KpW_rRXLA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] drm: panel: Fix atomic helper-induced regressions
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org
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

On Tue, Nov 18, 2025 at 2:54=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> The questions I have:
>
> - Should we 1) keep the current upstream sequence as default, and
> specific drivers can opt to use new helpers that make sure the crtc is
> enabled early (like your patch), or 2) revert the sequence changes from
> Aradhya, restoring the crtc-enabled-first style, and add new helpers
> that handle the sequence in the new way, as it is currently in upstream.

I'm opting toward (1) given that:

- The new sequence order is natural, a sensible default

- Only mine and Mareks systems appear to be affected despite the
  patch has been upstream for a while.

> - These patches only deal with the enable side. Disable side was also
> changed in Aradhya's patch. I guess that has not been a problem, but it
> worries me a bit if the enable and disable sequences are not mirroring
> each other.

I imagine we can do the same for the reverse side, by splitting
.disable_outputs() in disable_outputs() and disable_outputs_late()
that will disable the CRTC last like before the regressing patch.

I'm cooking a new patch series, just a sec.

Yours,
Linus Walleij
