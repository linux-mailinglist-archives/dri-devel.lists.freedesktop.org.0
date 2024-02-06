Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B03AE84BE3B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 20:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AA1112DA9;
	Tue,  6 Feb 2024 19:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6544C10E367;
 Tue,  6 Feb 2024 19:43:48 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 006d021491bc7-59584f41f1eso1982210eaf.1; 
 Tue, 06 Feb 2024 11:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707248627; x=1707853427;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Lb5wcqeRy+vlaNArKIwVtaEfEgOoKp4cUFbNlHx3fM8=;
 b=bFoLgxG/wIJTZSsx975+Q1eVjavGyVe3UsHdg6LZELk66/lxc2Wm+PYIS/uk9SOESY
 31e/eoFr4LSAGRYZ2fEwTT/7XzuQgP29PnfqX/zta5vlqLZFQb6QFl1vkyVIe/ScOYyr
 yxFXmqtQARSrN5G6wPkykaS0GIA8+b7Loo8ZHgOqBS/x2vL3a8QbHjrgvnXY4wTSIpBs
 JcRGVyQX6PEMwfWeBFge3S2+Tttk8Gaa3wOMn394Dj2R1yRPKHsFzpAyx/2ZP5Dp7/NI
 gj8wQCW1TQVzHkl39Ufz50ROkg4lUAAwD3CDLgfFC9G9OUJdyv/M68rlUz6fidrEYfx4
 o/sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbt/DHnMji5tQDyc7tdcdb58QJLTWyDsnUyVwTjFzbpAsC3rjfqi2ygiB5+Scp7520hJtRiS28WjOt/7c3d5Resl90mnPs37NF6iEx+FamemOGhk9/sNPJlpmoPwVvluzpFrSudDTauVSWXcclmQ==
X-Gm-Message-State: AOJu0YzTtKztQYKEdHIjG/OdJpnlCfFhRmn4ho5jNb3g4v0kfXNNqMv8
 3prPIa0qUEpR1CCS+j3T2P9gxvNg1Icobp44loaGAf6np4mWPLuxC08haeR1AnTG46JlXU8V7S1
 HS6t8RqDC5EMUEoQ25kkFLObUEov4t0Sj
X-Google-Smtp-Source: AGHT+IFYpomoi6DqiLfOdnXUy18la5AUhPIE1vXch0R4vJYU9EvwTF3nTdcympXAvGk/V9053cees/3tktHeg9wZtyk=
X-Received: by 2002:a05:6820:82b:b0:59c:eb7b:c04e with SMTP id
 bg43-20020a056820082b00b0059ceb7bc04emr2573848oob.1.1707248627613; Tue, 06
 Feb 2024 11:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20240201221119.42564-1-mario.limonciello@amd.com>
 <20240201221119.42564-2-mario.limonciello@amd.com>
 <CAJZ5v0iw3PLB4W0QNmRCgK2AWxe5A7wxnWSz-Jm--Mb=fnugEw@mail.gmail.com>
 <c96de797-39c4-4c83-96e2-d4579504e88e@amd.com>
In-Reply-To: <c96de797-39c4-4c83-96e2-d4579504e88e@amd.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 6 Feb 2024 20:43:36 +0100
Message-ID: <CAJZ5v0iZTJtMwZLGFovoLbFTP=OG=L6ZLgBbLU2ob5_X6OLB0A@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ACPI: video: Handle fetching EDID that is longer
 than 256 bytes
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, amd-gfx@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, 
 Hans de Goede <hdegoede@redhat.com>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
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

On Fri, Feb 2, 2024 at 5:09=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> On 2/2/2024 10:07, Rafael J. Wysocki wrote:
> > On Thu, Feb 1, 2024 at 11:11=E2=80=AFPM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> The ACPI specification allows for an EDID to be up to 512 bytes but
> >> the _DDC EDID fetching code will only try up to 256 bytes.
> >>
> >> Modify the code to instead start at 512 bytes and work it's way
> >> down instead.
> >>
> >> As _DDC is now called up to 4 times on a machine debugging messages
> >> are noisier than necessary.  Decrease from info to debug.
> >>
> >> Link: https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/Apx_B_Video_Extens=
ions/output-device-specific-methods.html#ddc-return-the-edid-for-this-devic=
e
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> > or I can apply it if that's preferred.
>
> Thanks!
>
> I think go ahead and apply this one to your -next tree.

Applied now.

Barring any issues with it, It will get into linux-next in a couple of days=
.

Thanks!
