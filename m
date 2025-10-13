Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E6EBD5B7E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 20:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E8E10E4BC;
	Mon, 13 Oct 2025 18:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s/ZEizNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF9B10E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:30:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 43FBA61CFF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0712C4CEF8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760380207;
 bh=UweM+L90OGCDu2JgL8AKhNEC7OIFbFzIiTiZKCcYqIE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=s/ZEizNNbuDx1BBFAviRt2HlNTH0iTLfKhLjQPu0oxSY2SrRz2sXzSt8T3A1PEaeH
 EtP0uGgIsrIqNSWanFiqkDVj8zWVhaOoibU52FFzAX0ZJwjitvceEcSxMP3fIBneX3
 MADwP4sn6B7YrNUPkEVDKExb2rRC7Rr9KBugn9degCOzUzs0dGo2ZF24tLH4TaxTi6
 ySfyAZ8i/HiX/srP2aoNTd10HYx4VOfSmJdSbjZl5+mHRMHnJTqclApMqBQjYGkdkJ
 Ep4Z7QqC0iqZ7Hf8eyOzw3g6p+PDniYOjsDHyLqFoefEiCJp7qm8cLtbYlhHOjqFO6
 kUcLVSAO6D5Ng==
Received: by mail-oi1-f179.google.com with SMTP id
 5614622812f47-441de7ba142so385170b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 11:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWU12ldw4S157cm5pXNMRzJCaPrJgB5+BmmhBGaBLCYwC0dgPlBko/GvM6Mz7j1taCU/Ic0vKwDLZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+szHyyTmN+zRKEKfY5h3HcNkGKrRy0qPOj9zB4/e60w66BuBt
 ZyUuGiA9qohakbYSn2Vje12DP8/jM8WoPDJM50ynAjpsuolh5QZDKEcAYTGNqiiYnvMhYCS2Te9
 eZ3YXbmQtFxRQI1m/ubldPi9tYKfNLDI=
X-Google-Smtp-Source: AGHT+IEidsorgj7WZjmq240EhlEZc8BnvKKAzSXOoGbRoYt0lU05odHT7I8aBQr229CSF34G8HWT9HQudIxjW0ChoE8=
X-Received: by 2002:a05:6808:1203:b0:43f:29ec:a210 with SMTP id
 5614622812f47-4417b3e9520mr10710947b6e.47.1760380207222; Mon, 13 Oct 2025
 11:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251013174729.1101186-1-superm1@kernel.org>
 <20251013174729.1101186-2-superm1@kernel.org>
 <CAJZ5v0jC9BBniDkODH-RnfvPNP8yYZd2QyYSAOiANfO-jCeyPw@mail.gmail.com>
 <92a24599-efc7-4684-abc0-bcf3fb203744@kernel.org>
In-Reply-To: <92a24599-efc7-4684-abc0-bcf3fb203744@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 13 Oct 2025 20:29:54 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gNzfpW=ot9JSYoAbOdpWEzkoxxYx+zKkofCni3EeA-jw@mail.gmail.com>
X-Gm-Features: AS18NWA4p6B2QnnjTVdeSaW5EUz4KzwEi_ifHtYzW-l80mppmBMWYn7Koe0-WnI
Message-ID: <CAJZ5v0gNzfpW=ot9JSYoAbOdpWEzkoxxYx+zKkofCni3EeA-jw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] PM: hibernate: Nominally skip thaw sequence for
 all devices
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, mario.limonciello@amd.com,
 airlied@gmail.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, dakr@kernel.org, 
 gregkh@linuxfoundation.org, lenb@kernel.org, pavel@kernel.org, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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

On Mon, Oct 13, 2025 at 8:27=E2=80=AFPM Mario Limonciello <superm1@kernel.o=
rg> wrote:
>
> On 10/13/25 12:58 PM, Rafael J. Wysocki wrote:
> > On Mon, Oct 13, 2025 at 7:48=E2=80=AFPM Mario Limonciello (AMD)
> > <superm1@kernel.org> wrote:
> >>
> >> From: Mario Limonciello <mario.limonciello@amd.com>
> >>
> >> After the hibernation snapshot is created all devices will have
> >> their thaw() callback called before the next stage.  For the most
> >> common scenarios of hibernation this is not necessary because the
> >> device will be powered off anyway.
> >
> > And how exactly is the image going to be saved?
> >
> > It is only in memory when the "thaw" callbacks are invoked.
>
> Ah; right.
>
> I suppose one option would be to thaw "just" the backing device, but
> this could turn into a relatively complex mess because it would have
> relationships (parent/child or device link) to other devices that need
> to thaw too then.

Right and that's exactly why everything is thawed.
