Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12BA60AE02
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 16:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349D910E7EC;
	Mon, 24 Oct 2022 14:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AAC310E7EC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 14:45:21 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a18so6222004qko.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/9JNURUXQEdoailh8cSWsW1gqRLK/OiiBgpx3G6yCs4=;
 b=rp+eTqeBFr8zU918T4epiiZjZyw9LxtL2MTRBUZudQ2Ne2cORmJUKHFNDxQBJSydiO
 /TBocjqvdIJVLvbHyAUoMQL6WUHq0DvygpM+wpUt04cr8mvlS0fqB9VtTI9PPzB6CNlY
 6UNxEXwvJ8RG1eANT+HmwGy+Bl/wFLQ/DWNIkJcIsNXM9IRYcleSlxcTiJ1HtLgMyP8l
 KH1ncUpBKvAVMeV/fSM+vGAHMui6fspN6pIouXzQRim8lvQI2aL6aECNIkwl6f1WHsIc
 LcxdYKVdTaW01MSWdJnZUrSBj7aSMvzSon+QPLdSf1uciE2pBfpIQYaA2MzZxzRn5dje
 5X4A==
X-Gm-Message-State: ACrzQf2zngq4RnVyiKWerbtiVQmAxS9TOaKjT5Dvp+1X7HjkoFNSG8Oz
 1YiM8UyqMsG3NX7D36BA6gNEBgHikgW+x+53hyQ=
X-Google-Smtp-Source: AMsMyM5SGXDg7cTE4lSjEiW49oL5yy1bPzXNvArWudgdK+XShf3cJ3UksyBK75y9XAWqp8MXMLDTd7Nhsr5DfB5EEyc=
X-Received: by 2002:a05:620a:d89:b0:6cf:c98b:744c with SMTP id
 q9-20020a05620a0d8900b006cfc98b744cmr23009768qkl.443.1666622720212; Mon, 24
 Oct 2022 07:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221024141210.67784-1-dmitry.osipenko@collabora.com>
 <dda4b024-69d2-1d1d-da23-e922e5b6128a@redhat.com>
In-Reply-To: <dda4b024-69d2-1d1d-da23-e922e5b6128a@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 24 Oct 2022 16:45:09 +0200
Message-ID: <CAJZ5v0irmk3aAK9t3UYcus+SXDL+AaT88LPXfyJU2PrXbkgfMg@mail.gmail.com>
Subject: Re: [PATCH v2] ACPI: video: Fix missing native backlight on
 Chromebooks
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
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 4:32 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 10/24/22 16:12, Dmitry Osipenko wrote:
> > Chromebooks don't have backlight in ACPI table, they suppose to use
> > native backlight in this case. Check presence of the CrOS embedded
> > controller ACPI device and prefer the native backlight if EC found.
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Fixes: 2600bfa3df99 ("ACPI: video: Add acpi_video_backlight_use_native() helper")
> > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > ---
> >
> > Changelog:
> >
> > v2: - Added explanatory comment to the code and added check for the
> >       native backlight presence, like was requested by Hans de Goede.
>
> Thanks this version looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> Rafael, can you pick this up and send it in a fixes pull-req
> for 6.1 to Linus? Or shall I pick this one up and include it
> in my next pull-req?

It would be better if you could pick this up IMV, so please free to add

Acled-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

to it.

Thanks!

> >
> >  drivers/acpi/video_detect.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> > index 0d9064a9804c..9cd8797d12bb 100644
> > --- a/drivers/acpi/video_detect.c
> > +++ b/drivers/acpi/video_detect.c
> > @@ -668,6 +668,11 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
> >       { },
> >  };
> >
> > +static bool google_cros_ec_present(void)
> > +{
> > +     return acpi_dev_found("GOOG0004");
> > +}
> > +
> >  /*
> >   * Determine which type of backlight interface to use on this system,
> >   * First check cmdline, then dmi quirks, then do autodetect.
> > @@ -730,6 +735,13 @@ static enum acpi_backlight_type __acpi_video_get_backlight_type(bool native)
> >                       return acpi_backlight_video;
> >       }
> >
> > +     /*
> > +      * Chromebooks that don't have backlight handle in ACPI table
> > +      * are supposed to use native backlight if it's available.
> > +      */
> > +     if (google_cros_ec_present() && native_available)
> > +             return acpi_backlight_native;
> > +
> >       /* No ACPI video (old hw), use vendor specific fw methods. */
> >       return acpi_backlight_vendor;
> >  }
>
