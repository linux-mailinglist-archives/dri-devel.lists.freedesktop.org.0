Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5217797D19B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 09:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9163D10E7B8;
	Fri, 20 Sep 2024 07:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="yMC1I47k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Thu, 19 Sep 2024 18:41:36 UTC
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7312F10E761
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 18:41:36 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by linux1587.grserver.gr (Postfix) with ESMTPSA id 890B92E09D41
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 21:36:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1726770972;
 bh=s+yF+li2j831a0ZBLYu9KANv2eyqLt5OF+PS5kwZbeo=;
 h=Received:From:Subject:To;
 b=yMC1I47kmzqoZdL1g/5XBccq6b1RElIDUOyk5E8fcrfUx4MgD+K7GfD9qc89Mc5/a
 R4xZzVZ5ITTX64m76Exi3JziGqLUo9L4o4QxZpMIIFdB0nCzyBal6/mhhKvQ68SsKL
 xNnWneZuQoHCsqa89ydBhCEIIwZ3Bnb4ON0QGDZ4=
Authentication-Results: linux1587.grserver.gr;
 spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f7502f09fdso9581151fa.1
 for <dri-devel@lists.freedesktop.org>;
 Thu, 19 Sep 2024 11:36:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV8WSx4OxWXEarKoFQPptCQ3bcDKn2EPHA31sVWufmq5SZNaWZkffQxjt/5tc5mOgvIkEqVjFn5uG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5zJOYTSFuvNajggO6NikdnhLlZDYdKfOjrlSVjwnCYNCNzsuD
 WUzFSXET3hDjb8zSdMzhRLYU6yA/o30K3/1zv9VJ/LthiwARLTg9Ru1Hou/F6xI/BhaWXCF63cY
 G1uD1rTGnfMsE1kuL3wJwx09qyPk=
X-Google-Smtp-Source: AGHT+IHmNya4OPcOSlW1TjozX0vzXq3jKpe0VXQKwfXwNhht30gBxB456OdVxlYcQYq7rFNsvLLSWCiZGYtUBsg+xMM=
X-Received: by 2002:a05:651c:221e:b0:2f7:5ca2:6d10 with SMTP id
 38308e7fff4ca-2f7cb364489mr1808451fa.15.1726770970830; Thu, 19 Sep 2024
 11:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240919171952.403745-1-lkml@antheas.dev>
 <20240919171952.403745-3-lkml@antheas.dev>
 <1cbc0cda-549a-4333-9045-470c51981af5@amd.com>
 <CADnq5_N63ncHDdr+=xB5RqYZXnMjjrVCgqTDz0zmPdSP98ip-A@mail.gmail.com>
 <248d6066-bf38-43a5-bfb1-91ce855ea03b@amd.com>
In-Reply-To: <248d6066-bf38-43a5-bfb1-91ce855ea03b@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 19 Sep 2024 20:35:59 +0200
X-Gmail-Original-Message-ID: <CAGwozwHy28hrZ1WxVEtd2cAB9YjrZZSoeA3QYity+Jks4Xr6Ug@mail.gmail.com>
Message-ID: <CAGwozwHy28hrZ1WxVEtd2cAB9YjrZZSoeA3QYity+Jks4Xr6Ug@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] acpi/x86: s2idle: handle screen off/on calls
 outside of suspend sequence
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Luke D. Jones" <luke@ljones.dev>,
 linux-pm@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, me@kylegospodneti.ch
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <172677097190.13681.4123086449836388250@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean
X-Mailman-Approved-At: Fri, 20 Sep 2024 07:22:50 +0000
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
as noted in the cover letter, I think the connection to DRM is a red herring.

The Display off callback in Windows is always called 5 seconds after
the screen turns off due to inactivity or instantly if the user
presses the power button. Likewise, Display on is called when the
display is about to turn on.

In fact, pressing the powerbutton in Windows no longer suspends the
device. It just locks the session and turns off the screen. Then
Windows can do whatever it wants for however long it wants before
suspending the device. It took me 2 days to realise this, as my dev
unit was updating and it stayed happily on for 10-20 minutes after
pressing the power button when connected to a charger.

I think "Screen Off" is what Microsoft decided to call their
background wakelock state (as it is called in Android). That means
that if there is ever a laptop with an Always On display, it will be
on the "Screen Off" state while the screen is on.

Antheas
