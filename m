Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4249E393
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 14:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B773910E472;
	Thu, 27 Jan 2022 13:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAB610E472
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:34:03 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id i10so8674957ybt.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 05:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JwIU7q542/Majhq966D+41zjzGbPYbtJbtOu0ZRQ3As=;
 b=mS8nAcB5fCqfFlN/B1t3N3eoM+Tg7RDHBuJNJbtUIU2DtNV88/5EMvdPJ03jOL0WE3
 asS/pRL5ZYnmXcfpAWpjnQM+1q4WoWbau53N0zilsWmHfeMMdnff5fQ4KnWuanC2dAvL
 Jg7ndbozQ+NmDhTr+AZx2t45vEylFUQL2At3nJCQ7SXJsJHh/lSi4sbrXmtTivI6rMMO
 liGQtwBxTOxYm8JCtmAuePPeBwj7glwcP71VoSySBU6183G82IZosrZe0aCP/DsAEqaW
 C4zZ1o6Dstym3mO0KCNb/viWCLAIuJESCZGn7MVbSuC6yzNizhqMmHgbJH9Ydxm64Ovi
 HWQQ==
X-Gm-Message-State: AOAM533KoNJNxnJi5Hdx4/bGy8PGW+f4l0xVK0gxKGInXJJ49OvpkiyI
 PCf4X9XooLfe8ITUOUswpjyS2s/2EQZ7vuW+Iug=
X-Google-Smtp-Source: ABdhPJx5o6SjJD6Sr3giZs1kpJ/iEQnMh6yOLpDp+jztp116PA4onXa6gPegmQzAF6j36v7rIaCFiiI6WAkjpYmMEs4=
X-Received: by 2002:a25:4ac4:: with SMTP id x187mr5580851yba.466.1643290443015; 
 Thu, 27 Jan 2022 05:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20220123091004.763775-1-ztong0001@gmail.com>
 <6a0233cd-d931-8a36-3b9e-08b774cec7b0@redhat.com>
 <CAJZ5v0h51v9fFrJRuaFpSn7J2UEHndEj0f3zpmw=RvgsvAhtvw@mail.gmail.com>
 <049ccc3a-8628-3e90-a4f4-137a286b6dce@redhat.com>
 <CAJZ5v0hJWW_vZ3wwajE7xT38aWjY7cZyvqMJpXHzUL98-SiCVQ@mail.gmail.com>
 <994f94b2-61d3-1754-d733-732a0fb47d50@redhat.com>
In-Reply-To: <994f94b2-61d3-1754-d733-732a0fb47d50@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Jan 2022 14:33:52 +0100
Message-ID: <CAJZ5v0hXKJhCSKki8JHs+Q=3BWYygDNz9LLAaiVKpDvLPr6-ZA@mail.gmail.com>
Subject: Re: acpi_get_devices() crash when acpi_disabled==true (was [PATCH v2]
 drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen)
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Tong Zhang <ztong0001@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-acpi <linux-acpi@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 27, 2022 at 2:05 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/26/22 18:11, Rafael J. Wysocki wrote:
> > On Wed, Jan 26, 2022 at 5:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 1/26/22 16:54, Rafael J. Wysocki wrote:
> >>> On Wed, Jan 26, 2022 at 2:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>> On 1/23/22 10:10, Tong Zhang wrote:
> >>>>> when acpi=off is provided in bootarg, kernel crash with
> >>>>>
> >>>>> [    1.252739] BUG: kernel NULL pointer dereference, address: 0000000000000018
> >>>>> [    1.258308] Call Trace:
> >>>>> [    1.258490]  ? acpi_walk_namespace+0x147/0x147
> >>>>> [    1.258770]  acpi_get_devices+0xe4/0x137
> >>>>> [    1.258921]  ? drm_core_init+0xc0/0xc0 [drm]
> >>>>> [    1.259108]  detect_thinkpad_privacy_screen+0x5e/0xa8 [drm]
> >>>>> [    1.259337]  drm_privacy_screen_lookup_init+0xe/0xe85 [drm]
> >>>>>
> >>>>> The reason is that acpi_walk_namespace expects acpi related stuff
> >>>>> initialized but in fact it wouldn't when acpi is set to off. In this case
> >>>>> we should honor acpi=off in detect_thinkpad_privacy_screen().
> >>>>>
> >>>>> Signed-off-by: Tong Zhang <ztong0001@gmail.com>
> >>>>
> >>>> Thank you for catching this and thank you for your patch. I was about to merge
> >>>> this, but then I realized that this might not be the best way to fix this.
> >>>>
> >>>> A quick grep shows 10 acpi_get_devices() calls outside of drivers/acpi,
> >>>> and at a first glance about half of those are missing an acpi_disabled
> >>>> check. IMHO it would be better to simply add an acpi_disabled check to
> >>>> acpi_get_devices() itself.
> >>>>
> >>>> Rafael, do you agree ?
> >>>
> >>> Yes, I do.
> >>
> >> Did you see my follow-up that that is not going to work because
> >> acpi_get_devices() is an acpica function ?
> >
> > No, I didn't, but it is possible to add a wrapper doing the check
> > around it and convert all of the users.
>
> Yes I did think about that. Note that I've gone ahead and pushed
> the fix which started this to drm-misc-fixes, to resolve the crash
> for now.

OK

> If we add such a wrapper we can remove a bunch of acpi_disabled checks
> from various callers.
>
> > Alternatively, the ACPICA function can check acpi_gbl_root_node
> > against NULL, like in the attached (untested) patch.
>
> That is probably an even better idea, as that avoids the need
> for a wrapper altogether. So I believe that that is the best
> solution.

Allright, let me cut an analogous patch for the upstream ACPICA, then.
