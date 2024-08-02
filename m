Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBD1945E1C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 14:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C8D10E09B;
	Fri,  2 Aug 2024 12:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a9k1uB90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E07710E09B;
 Fri,  2 Aug 2024 12:49:21 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a7d89bb07e7so574040866b.3; 
 Fri, 02 Aug 2024 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722602959; x=1723207759; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oDJYdtS3XDN1VMZkCcTjw0Mh9EPPfsgYwBKITCwsvQk=;
 b=a9k1uB901fGMcDLz5jkNraFWnP1yhyLNhQSjZ1BzR6J2pWNLYuvKfbTUiUWTl/aGnc
 lgzlsjGZ3zguDG5V2TiPg7pOHAJPikNCzTheab3ewNjOhcT92ZRPAK8iY1l+EyH+1f7q
 QhNQSBRnt/apWyYJBCLx0mGIJIknAAPEPoVMOs9q82V8ncWtVVfZhjobUj3RPsxKc3rP
 it3SGlZX6hbgvpE7F1LYW4WR8HQp5O0trDxlxPv1+QtFonvZy3C9/ELdSUc2KRzLMWEM
 xdGAilycdM8tAblvwtjWEW4M/11Nbw7lb5lZnaxP75t2GT9CZTdN0fAPNppczrs6C9Cu
 6G3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722602959; x=1723207759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oDJYdtS3XDN1VMZkCcTjw0Mh9EPPfsgYwBKITCwsvQk=;
 b=oWGNkOHjazjzhbdvhWKTcLKCErxltGyg+kpxTQj9TA6KJFDTV7KS6vvQ2zJ3YA4JeW
 U5snJa+Wn5XxlOdp3KUj/gHh+4X6eXlsF1dSj9vxYd84jPXdR19tZzAgaRzE8ziOs7eb
 JHyVFsiZ77A5PGL5RdbSTcj+uJy8irrsEBlE4HDOVkG1QlJC1wafNIrSAN2dr8LKA7Zj
 Op/uUztwBWfoehLWIUjf4WpY+ksPfCuzefcIkhGnYIo0iVI+/xNKVHf1N5Xl4q58AJDB
 Ry/I3js/QjEOJXkv145hcHY+YCpxqMfH7aFT8F+tpvJ0PtmgPdI4v3Yqn3+NXOodVx+H
 mLjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVUfSbZbx7UKShaijXQlH4F7mkUhS3IOkzHlQ9ZwyUJzSY8sTp/kPJk8Vrob49gqKBnn70A2w0AZmeCbONAMLBjF8+pZoUdonjkpYpkhLQ36RDihRHrn1zYDXFljH95Y+u6X2h1AibvRNEfK1L1Q==
X-Gm-Message-State: AOJu0Yyk1ZTMktMyJCAcGlTq4xizgivTV+KRC1Zj90CDChC40hvorT6L
 +joFzCEk+pZ5C6APVu/0GTo/owDbX0YcCof75iuysQJd8hJneO1xC3++gDMr+29J/8Sruv0lLNR
 kaBSOr6kSlXdVYi3t0/+KECGSPRQ=
X-Google-Smtp-Source: AGHT+IFEsnOhqVj4h9nkNRLTmrUgdEBh/QqLkqJVWO8AHVyZsZ9E4l6UJHbSqv4ngWz2kEVGni3D6BufpN3SZuPiLoU=
X-Received: by 2002:a17:907:da3:b0:a7a:a892:8e0b with SMTP id
 a640c23a62f3a-a7dc4e27db7mr220852766b.19.1722602958947; Fri, 02 Aug 2024
 05:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
 <87wml0v2vv.fsf@intel.com>
In-Reply-To: <87wml0v2vv.fsf@intel.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Fri, 2 Aug 2024 14:49:06 +0200
Message-ID: <CAFZQkGx=Q0W2r6XWxovt90WkBC5CUg7_X2fM7ZicSOALUg8yJg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, 
 Harry Wentland <Harry.Wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 Sean Paul <seanpaul@google.com>
Content-Type: text/plain; charset="UTF-8"
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

Am Do., 1. Aug. 2024 um 14:34 Uhr schrieb Jani Nikula
<jani.nikula@linux.intel.com>:
>
> On Mon, 01 Jul 2024, Xaver Hugl <xaver.hugl@gmail.com> wrote:
> > Am Do., 20. Juni 2024 um 22:22 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
> >> Merging can only happen once a real world userspace application has
> >> implemented support for it. I'll try to do that sometime next week in
> >> KWin
> >
> > Here's the promised implementation:
> > https://invent.kde.org/plasma/kwin/-/merge_requests/6028
>
> The requirement is that the userspace patches must be reviewed and ready
> for merging into a suitable and canonical upstream project.
>
> Are they?

I've talked about the property with other KWin developers before, but
there's indeed no official review for the MR yet.
As some new discussions about alternative approaches have started as
well, maybe it should be reverted until we're more certain about how
to proceed?

> BR,
> Jani.
>
>
> >
> > In testing with the patches on top of kernel 6.9.6, setting the
> > property to `Require color accuracy` makes the sysfs file correctly
> > report "Device or resource busy" when trying to change the power
> > saving level, but setting the property to zero doesn't really work.
> > Once KWin sets the property to zero, changing the power saving level
> > "works" but the screen blanks for a moment (might just be a single
> > frame) and reading from the file returns zero again, with the visuals
> > and backlight level unchanged as well.
>
> --
> Jani Nikula, Intel
