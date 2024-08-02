Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849F1945EAB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 15:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDF510E045;
	Fri,  2 Aug 2024 13:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NuIAl52t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A164510E045
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 13:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722605351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jby6eZfb7DqV7eZt+nmBEx3PMtN18CphSR8+OwRmzkA=;
 b=NuIAl52timVSXIaOd6djd8Mithq79EWN+OLN/QbFCreSBcC+0YWnQkpmN19pCHKsmXlowO
 MRCgdYn5H2gg91Xrp9CXtbH2fqQV/6d3iwBddYVn8rI4zDXKn29cmUaMORfm+XP8P81tFl
 MLy79sQw3CP/SpF8iOdPl3g9j5nbsys=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-qDc8MOXXMmiNGnilia30yA-1; Fri, 02 Aug 2024 09:29:10 -0400
X-MC-Unique: qDc8MOXXMmiNGnilia30yA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-52fcf7eb289so8993022e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2024 06:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722605348; x=1723210148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jby6eZfb7DqV7eZt+nmBEx3PMtN18CphSR8+OwRmzkA=;
 b=glI6udJ7bGeut/+EQ+etF9tHSZtEKs5DeAvIPSZPNmE718+NsSP2Whl6Cg585oFQsN
 25Mi0F7HQ4hAQDZpR4Gbh0OYCFUV6BNhbfQlzbZ/iH/+IaWigKyY3WnlxqZG/d1rIgY6
 oCe89r+QxVLw4fbp6TIIgYaaqVIq4urY5ALGMXu7wi3JQ0zySTzPidagkOu2A+xo85O0
 6OUc90ZDQJCCHDRGxlHEerC+T+28qk8aJC2ExDiG0lMuLJKtTGPwCNjdEpb00Rl6P+O9
 eML+Ejr3Wfu/d6BlVgDzYEIOp+lXeZGOurbDKAQXZS6zQj3Y8nyDmyDejDyIci2QY1lv
 Z79g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQNQkaGXGD1W/j+0uqMfA3P8au9DhLIaB2gcNBoBZCAuQP9GVIH5nbBp43bRrp6HMlopuel7iugZERvGLQQc3/r1+JVJzurIdGHKMYIESf
X-Gm-Message-State: AOJu0Ywdx9qcF8Gml93D8yD/GT/gf1dyG0Qk7Ii+P5bkF6wfZ79Ngzmx
 cduFGcgU+sTYCvi4zY6SKF+J1M6bLkSfbUkKeBtxhmb4GkKm4Dw8E9AWj95+8wOhJAD7JPdIihA
 lTQWQPqvYc7C4/2hHyfXTrzrTUQAv1wzDD5gfauiylk8c4FQAmNKaaYiAhZsFjhTGxO55R1IKvg
 7Lrp7mUDjQMUBi65LQateLyWeK+Jc1o8Xom/otDuLZ
X-Received: by 2002:a05:6512:32c7:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-530bb3a47f4mr2227540e87.56.1722605348466; 
 Fri, 02 Aug 2024 06:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZcn6uyOfyziM/LIeOVbLKwyZwKWWQaBANaOEnc4dlTveEf6oUTMNMatPqkGNk4rLeiLcW4dTRY9yOGPPlh3s=
X-Received: by 2002:a05:6512:32c7:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-530bb3a47f4mr2227514e87.56.1722605347842; Fri, 02 Aug 2024
 06:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
 <87wml0v2vv.fsf@intel.com>
 <CAFZQkGx=Q0W2r6XWxovt90WkBC5CUg7_X2fM7ZicSOALUg8yJg@mail.gmail.com>
In-Reply-To: <CAFZQkGx=Q0W2r6XWxovt90WkBC5CUg7_X2fM7ZicSOALUg8yJg@mail.gmail.com>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 2 Aug 2024 15:28:56 +0200
Message-ID: <CA+hFU4w8kR1XjAZgXeUd7Z-pWDWn3yAv59HBr8o0iGhYruUssw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, 
 Harry Wentland <Harry.Wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 Sean Paul <seanpaul@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

I'm very unhappy about how this has played out.

We have a new sysfs property that controls a feature of the display
path that has been set to a default(!) which changes the color
behavior! This broke color management for everyone who is on a device
which supports this feature.

What should have been done is the following:

* add the KMS property and have it default to "sysfs cannot override this"
* add the sysfs property after the KMS property has been introduced so
it stays disabled by default
* add support for the new property in compositors and let them enable
this feature only when they allow colors to randomly get broken

Every other path results in broken colors at least temporarily and is
breaking user space! The sysfs property *must* be reverted because it
breaks user space. The KMS property *must* be reverted because it
didn't meet the merging criteria.

Another note: The only way to make sure that this isn't breaking user
space is if user space tells the kernel that this is okay. This means
that the sysfs property can only be used if the compositor grows
support for the new KMS property and at that point, why do we have the
sysfs property?

On Fri, Aug 2, 2024 at 2:49=E2=80=AFPM Xaver Hugl <xaver.hugl@gmail.com> wr=
ote:
>
> Am Do., 1. Aug. 2024 um 14:34 Uhr schrieb Jani Nikula
> <jani.nikula@linux.intel.com>:
> >
> > On Mon, 01 Jul 2024, Xaver Hugl <xaver.hugl@gmail.com> wrote:
> > > Am Do., 20. Juni 2024 um 22:22 Uhr schrieb Xaver Hugl <xaver.hugl@gma=
il.com>:
> > >> Merging can only happen once a real world userspace application has
> > >> implemented support for it. I'll try to do that sometime next week i=
n
> > >> KWin
> > >
> > > Here's the promised implementation:
> > > https://invent.kde.org/plasma/kwin/-/merge_requests/6028
> >
> > The requirement is that the userspace patches must be reviewed and read=
y
> > for merging into a suitable and canonical upstream project.
> >
> > Are they?
>
> I've talked about the property with other KWin developers before, but
> there's indeed no official review for the MR yet.
> As some new discussions about alternative approaches have started as
> well, maybe it should be reverted until we're more certain about how
> to proceed?
>
> > BR,
> > Jani.
> >
> >
> > >
> > > In testing with the patches on top of kernel 6.9.6, setting the
> > > property to `Require color accuracy` makes the sysfs file correctly
> > > report "Device or resource busy" when trying to change the power
> > > saving level, but setting the property to zero doesn't really work.
> > > Once KWin sets the property to zero, changing the power saving level
> > > "works" but the screen blanks for a moment (might just be a single
> > > frame) and reading from the file returns zero again, with the visuals
> > > and backlight level unchanged as well.
> >
> > --
> > Jani Nikula, Intel
>

