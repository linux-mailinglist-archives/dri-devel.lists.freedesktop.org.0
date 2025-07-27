Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A93B1323C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 00:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61F010E1A3;
	Sun, 27 Jul 2025 22:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CZhu1meJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796CA10E1A3;
 Sun, 27 Jul 2025 22:28:55 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-31c4a546cc2so3065443a91.2; 
 Sun, 27 Jul 2025 15:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753655335; x=1754260135; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aE55925tcWmGaX7tTb9viX7+snG3Kn2dzQ5QJ3oigY=;
 b=CZhu1meJ6/nrxGyV44rNpw+112P/T2Clm+NzvTjGGSs/m0saWhoLIDn5Var4g3Uonz
 akOJ1tKxvz7wwGI8Tn9QWB9Dwx8B+VfIOrRTzV27oREC1KCzP7E//6XQc/SNC3K6S6FB
 cnIUTwK0ZXHQ7UL80MGgqGmb9JlTVu3XAuBlyRgd/1k9cFnGSgEEPORywtuVh9oyjNY3
 dhZLfYYe79r0JIBaxLFKIIAFHXEqk04SC+lyA4pNc3r0zUuPm2/PEgPmoyp2sr3ZkrUG
 p9J+j9D2anYUjGOhXNLvQVslMnNhbMwAEBScUK2YRunlHWmeEQ0lUwkBkr1LWm1Bqqqm
 +Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753655335; x=1754260135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7aE55925tcWmGaX7tTb9viX7+snG3Kn2dzQ5QJ3oigY=;
 b=c9MFxXBbbkVAx/fi24X8woKQLIZm4+poX1BHhYD6qi/vNwtH7JM7jIvVy5nYDSo6ft
 08Xj714Ic/gkfUPhYLcW/h8tJH+xtNj+y3B7RuCOpDj86D0RtsbNUppvvwTUdMqKJ4eN
 aVUKT2cXJlRoYCRMXC7d6zMd3O6T2l5uB4/0r96Or2iVF9h7wjBO0+W/fYUIM2OpuDyr
 Xq9UW0O3gEY8sft1vkbB+arVramJbg6HjfCe0jNOMImorUH1ev8apLa3/QKv/CAZaOBR
 HGdudSsHFVcsEaoC2WKGI1PQTLrHkoXGyiuqHNtdPCLg5H9v6J0xJlUtHD/rTzV8ugXS
 eOkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRjOJUBf8l9n/sXHI+HWwyMJ52OX2OJRxLrk2iZGwsRWAc1cBL+9FSVb77+V89o0vZgMCdwGeKSg==@lists.freedesktop.org,
 AJvYcCXNxy2pGuRVOG2qt9bQ+ZuCIijv9samoVQPHp0X2XJPCPkPOoSipiwYJX0+Eqv4yAY/0iJlJlTuT+A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4tmUdJY0GXuva5NKgvg9JkiLJDlE3Cmc42TPi5ILNfqL04U4a
 DF0/ze7Zf0sANxco5y4SmAHIzDx+lqK0iCxGAYfgDrnJ0XxnI3A0nheokmEDlEx9pD3T1NBuZY0
 IC8fx7Mj+CJyWwLJwnzVuDNiWGkEwxhY=
X-Gm-Gg: ASbGncul6VH7EHDt0N2kDr6uTQVL9XPvJInd+E1LGhKdjudLmsA1afCsKpZ9FVh3ai4
 0LTtXV5/lNF1YHRHP1dAzq0RcrNpjwaQaPwZjtObQnZiifpW4DeIrEEBomtY5L5tqNDl9jkNon7
 wzDQh8xjDcy3pRupRbTpF/Qb/TPfVjZt9039kb5O6YjGYeb+donvHWuOWxxw1kB4SvivDMAglNG
 BC1vw==
X-Google-Smtp-Source: AGHT+IFB+UC79G6GOvpYCOqLMKe5c6XQOXyyyhKfZRzw/xMYi0ZwUgQjJFrdTLPc9goYRCJRriQdvkUAynVP85BQUE0=
X-Received: by 2002:a17:90b:584b:b0:311:e305:4e97 with SMTP id
 98e67ed59e1d1-31e77a01261mr14286891a91.19.1753655334777; Sun, 27 Jul 2025
 15:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250507112131.3686966-1-tomeu@tomeuvizoso.net>
 <20250508145624.4154317-1-tomeu@tomeuvizoso.net>
 <a18f214ab0487a1c562f9e2f7f66ab1345925177.camel@pengutronix.de>
 <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
In-Reply-To: <CAAObsKDwVB7w0mK3qkJJ-x3sOVxbcM5pbjxJk-106baaiwM=dg@mail.gmail.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 28 Jul 2025 00:28:42 +0200
X-Gm-Features: Ac12FXxXmcLRHhwJZhvSwh_E4TOWBWwI2_AjoaRN2XLAJ0SAZOxjnsj19GW09HQ
Message-ID: <CAH9NwWfMCYKFF6Z+XiV9=4BANeyPk6bgNV_8FYM0cGwXuyDSxw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/etnaviv: Fix flush sequence logic
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Lucas Stach <l.stach@pengutronix.de>, linux-kernel@vger.kernel.org, 
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, 
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

Hi Lucas,

> > > We should be comparing the last submitted sequence number with that o=
f
> > > the address space we may be switching to.
> > >
> > This isn't the relevant change here though: if we switch the address
> > space, the comparison is moot, as we do a full flush on AS switch
> > anyway. The relevant change is that with the old code we would record
> > the flush sequence of the AS we switch away from as the current flush
> > sequence, so we might miss a necessary flush on the next submission if
> > that one doesn't require a AS switch, but would only flush based on
> > sequence mismatch.
>
> Ah, you are right.
>
> > Mind if I rewrite the commit message along those lines while applying?
>

Now that v6.16 has been tagged, I was wondering why this patch didn=E2=80=
=99t make
it into this release. From the timeline, it seemed like there was
enough time for it
to be included, so I=E2=80=99m just trying to understand if it was overlook=
ed
or deferred
for a reason.

I also haven=E2=80=99t seen any recent activity at
https://git.pengutronix.de/cgit/lst/linux/, which
made me unsure about the current status of patch queue handling.

--=20
Thanks
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
