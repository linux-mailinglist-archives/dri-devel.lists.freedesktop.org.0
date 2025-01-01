Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7D9FFF84
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6C610E794;
	Thu,  2 Jan 2025 19:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UjYDdZQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA72F10E2F6;
 Wed,  1 Jan 2025 21:25:30 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso12142239e87.0; 
 Wed, 01 Jan 2025 13:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735766669; x=1736371469; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+7Gumy85u/RRWfyQv4lGazJpNh7Vrewtak4aVfMceos=;
 b=UjYDdZQWcmXbmAoL7dROR0drVDaWruLkFHrvJwfPP8kvlMWm6RrEU23Jza4VFjttAV
 g5E3aTlbkJdALiEjA4WBj2YkCnZ7iytWzxEP26DENzwCqOumUmXCCp7e7TEFWPt8mf4D
 pjUbmCgfXUD6NwCyOr1VAYIfmEKS5lVW9doWpcd7xxghZ9SULDpHtjB2ZflY234oGGwN
 LjFFVb7o7Z7iMOhyLrDkXvImEncCtRoxjctp774DR9jrtt1VVmIOD73gv8KzdCghyVEx
 p9skbV4r7T6jj4TUlO1fxq2bCCNIdCXaPn/7UmfQNGNucdpOBlv1GA6hh4eVyFff3IZw
 jRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735766669; x=1736371469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+7Gumy85u/RRWfyQv4lGazJpNh7Vrewtak4aVfMceos=;
 b=JUQHXM8A5uHKoJibFM+QTaQwuTrbPQJt9sOLerFj0veg83O+7qsy3AdBdZdM86Akrg
 F3Uyhccoi6M1Q+5hNKU/TMljGXlFy5BUZVPUJOuzuhxXsLb87uS7ioS3frMedAqIbwlw
 4qXqkRXVRq8rLjl+rlXGfkylctoiyOCvh97znRuj72EfXqb0xt75Y/b+/qUVhrBljGV5
 s/5/DkxQO4rfC0sQvi6pmu1kUsYtflqE5T81YZm/irN0JEDrovOAJ7tAQcLlw9NKJ1qD
 hSWLWVWscBwxmsBD7SV87bWugHUq+WtnLIUPEFtRJpD2FQ6yXTR6pnkLi3/YV4FM8Slo
 YKZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsywDdSFNNFpMtnH831fm+qiae+HSBENReNjLfmx4l36IVr5vaQ0zk/Flcz38gJE6VpuFIxyMYqCpC@lists.freedesktop.org,
 AJvYcCXXpFo3k9Gi6fFqZVbx6HZZBytLO8R6tqH4Sa4EIx9TrXhnIGK0JJLybbMDUAHuhtLMLE69p4GAGvc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnZ69F3nQhrzm73MGbZeiAXQTvK/zG5Flxgy9+FpjHxRjBBnn3
 6sze44yyIO+P/b4/3cCQJaLX/ydi4g1XEweogsYEFyJhPJBpM8kEuwI/dw==
X-Gm-Gg: ASbGnctcFVjRGX2MfClYi/boXvsDLyMEOb3qTusBjR0pmXg6ZYL0/r/MMo3PYg0M1hl
 nRg4FAQRsMeMFOb2ig80EXxq56l8RPHtk9LJwPpFN/lWwvlTJj4g/mkiobPD+DrxvCmgvjaIfz+
 jhPQXDeAcNug6o7Mn3gbkJCc5RRF5qzbcMu+latuv/gO/dV+aKxIULyeE7ljFRbuxDlvhxP96Eg
 DqYGFReTExOXaXISaJOk1dIfY4HpjDhe17W7p3kTl7WGFIe0UW5uO2ibwM2SSu9Gzp1/w7FcImq
 z8LtbFpJtC++gFte+65JK7w=
X-Google-Smtp-Source: AGHT+IHpviB1MKWJdRoIJLE0uDNAiEn95vSl3N4Qv8YA819soN8pVymV+cXxFS7EpZKTCJgDGapCWQ==
X-Received: by 2002:a5d:64ad:0:b0:385:decf:52bc with SMTP id
 ffacd0b85a97d-38a2220088bmr34387189f8f.32.1735766198509; 
 Wed, 01 Jan 2025 13:16:38 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e2dfsm36764411f8f.74.2025.01.01.13.16.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 01 Jan 2025 13:16:37 -0800 (PST)
Date: Wed, 1 Jan 2025 21:16:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>, Reuven Abliyev
 <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Message-ID: <20250101211637.709b65e1@dsl-u17-10>
In-Reply-To: <20250101164119.000d2bd4@dsl-u17-10>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
 <20250101153925.865703-7-alexander.usyskin@intel.com>
 <20250101164119.000d2bd4@dsl-u17-10>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 02 Jan 2025 19:43:55 +0000
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

On Wed, 1 Jan 2025 16:41:19 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed,  1 Jan 2025 17:39:20 +0200
> Alexander Usyskin <alexander.usyskin@intel.com> wrote:
> 
> > GSC NVM controller HW errors on quad access overlapping 1K border.
> > Align 64bit read and write to avoid readq/writeq over 1K border.
> > 
> > Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > ---
> >  drivers/mtd/devices/mtd-intel-dg.c | 35 ++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> > index 76ef7198fff8..230bf444b7fe 100644
> > --- a/drivers/mtd/devices/mtd-intel-dg.c
> > +++ b/drivers/mtd/devices/mtd-intel-dg.c
> > @@ -238,6 +238,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
> >  		len_s -= to_shift;
> >  	}
> >  
> > +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> > +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {  

That might as well be the easier to understand:
	if ((to & 7) && (to & 1023) + len_s > 1024)

Replacing (add, xor, and) with (and, add, cmp) is much the same
even without the decrement.

	David
