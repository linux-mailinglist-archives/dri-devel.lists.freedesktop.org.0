Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724988B5F3
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 01:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391CE10EBB7;
	Tue, 26 Mar 2024 00:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XSmHb7cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E352410EBB7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 00:21:40 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-78a16114b69so437715985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711412498; x=1712017298;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hJErg4VRvYhsmdtGKXiUunocztQDn+7oNfRma22BjII=;
 b=XSmHb7cTesEh2lIY6/zYezWqiSpvYHq5uvagi3UavVn+pFrCiuOo6dE56kqCW+2o2Z
 AvvM0eFdg8ouPrucUWxrkXEyegcf1h3ayZ5Na5MOkBqBR1sJ5u7u9LNqmZrmGDJQMuIg
 2c44NVogcQaWYOF6iEY8OVSFOVAR7st5tuKe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711412498; x=1712017298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hJErg4VRvYhsmdtGKXiUunocztQDn+7oNfRma22BjII=;
 b=edx5TsGy1n8r47L+zpgHeHYMjwWovolJo6GA0nmRiE7lFDhfbPAUJVIce64AVHfS/7
 1WlgsfjCzhcnCf0CZbB4vXGiKp3iCse2Oxr5E1+6pHRacFDHJ9AyEThl2aMzXGyqOwYg
 QLkga32yCzZkg6gpOn2uqyqlfCV85aCFB/9fByl1F0lEwjxF/1Uktg6Nx+tjlhWfcXhX
 zr0zlxEJOJB+/M8udjQSrv2mEEfDstpOVa6ZG1mwLJgsLbQHOROEsAYP0FRqaD0VMCFS
 GIGcTAVlH//yv0UhezI1M/lUfkn3gtMD48LaGWK6NwwXqvz635gw7CA2i41tY6EpAFBx
 oU3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZjLIdFAvYC616axJOsW9RMV/Eid86DVmNt1gfzVr3BXZ2SCWEgxHDrTJh5/iAJOoVBniOqPRBvHuTodUlpgbPJW2kbob+V7v6UMg+cqI6
X-Gm-Message-State: AOJu0YyMzEZnX021VVl+p85a9EajDYrZhAQqQAt6cyaKnr+L7wdThO6j
 G+QyBobN+0vHcXLC6uVGdPkRcxwjuNXAqnCw5DJAJGnDcH6jMtTde0mKX+dXkiicvrjyMCQ6WU8
 =
X-Google-Smtp-Source: AGHT+IGfXuswJj6KiigIOdDccjlmftTiaTCeeu2PquBCCRv8tDvJKI01/JUy8x5QLlBtthpLhIxUiw==
X-Received: by 2002:a05:620a:2691:b0:78a:2e68:7737 with SMTP id
 c17-20020a05620a269100b0078a2e687737mr11769551qkp.18.1711412498512; 
 Mon, 25 Mar 2024 17:21:38 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 wj2-20020a05620a574200b00789f34f225dsm2555640qkn.71.2024.03.25.17.21.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 17:21:37 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-428405a0205so81151cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 17:21:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUWobdNgrx8+33nTvKCe9mjNdOfjunh7hZ3/mIsyakMV+wNgWFX5XrP8lUImSwna4aqNjyofuRtsGY4YbH9AWB5Vys3aPbJ/YaVRej/ld/s
X-Received: by 2002:a05:622a:4c89:b0:431:6352:80fb with SMTP id
 ez9-20020a05622a4c8900b00431635280fbmr74987qtb.16.1711412497043; Mon, 25 Mar
 2024 17:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <12472820.O9o76ZdvQC@mephi-laptop>
In-Reply-To: <12472820.O9o76ZdvQC@mephi-laptop>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 17:21:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8N0g0P1d85P0nJHHSkb9xZ-hxJATYD2+b_nNrwqfsUg@mail.gmail.com>
Message-ID: <CAD=FV=X8N0g0P1d85P0nJHHSkb9xZ-hxJATYD2+b_nNrwqfsUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Remove redundant checks in multiple panels
To: Emilio Mendoza Reyes <emendoz@g.clemson.edu>
Cc: neil.armstrong@linaro.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

Hi,

On Sat, Mar 23, 2024 at 7:05=E2=80=AFPM Emilio Mendoza Reyes
<emendoz@g.clemson.edu> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> From: Emilio Mendoza Reyes <emendoz@clemson.edu>
>
> The patch ("drm/panel: Check for already prepared/enabled in drm_panel")
> moved checking for (en/dis)abled and [un]prepared panels before specific
> function calls to drm_panel.c.Those checks that still exist within the
> panels are redundant. This patch removes those redundant checks.
>
> Removing those checks was/is also a todo in the kernel docs
> Link: https://www.kernel.org/doc/html/v6.8/gpu/todo.html#clean-up-checks-=
for-already-prepared-enabled-in-panels
>
> Signed-off-by: Emilio Mendoza Reyes <emendoz@clemson.edu>
> - ---
>  drivers/gpu/drm/panel/panel-boe-himax8279d.c     | 12 ------------
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c   |  6 ------
>  drivers/gpu/drm/panel/panel-edp.c                | 14 --------------
>  drivers/gpu/drm/panel/panel-innolux-p079zca.c    | 12 ------------
>  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c   | 12 ------------
>  drivers/gpu/drm/panel/panel-khadas-ts050.c       |  9 ---------
>  .../gpu/drm/panel/panel-kingdisplay-kd097d04.c   | 12 ------------
>  .../gpu/drm/panel/panel-leadtek-ltk050h3146w.c   |  6 ------
>  .../gpu/drm/panel/panel-leadtek-ltk500hd1829.c   |  6 ------
>  drivers/gpu/drm/panel/panel-novatek-nt36672a.c   |  6 ------
>  .../gpu/drm/panel/panel-olimex-lcd-olinuxino.c   | 12 ------------
>  .../gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 12 ------------
>  .../gpu/drm/panel/panel-panasonic-vvx10f034n00.c | 12 ------------
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c    | 12 ------------
>  drivers/gpu/drm/panel/panel-raydium-rm692e5.c    |  6 ------
>  drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 16 ----------------
>  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c      | 12 ------------
>  drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c  | 12 ------------
>  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c  |  6 ------
>  drivers/gpu/drm/panel/panel-simple.c             | 14 --------------
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c    |  6 ------
>  drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c     |  6 ------
>  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c |  6 ------
>  23 files changed, 227 deletions(-)

Aside from the formatting issues (several lines start with an extra
"-" and there is the PGP stuff), there are a few high-level issues
here:

1. In general, you need to be a little more careful here because not
all these panels are going through the code path that the new code
covers. For instance, look at the first panel here
("panel-boe-himax8279d.c"). The panel_shutdown() function in that
driver _directly_ calls boe_panel_disable() and boe_panel_unprepare()
rather than calling the drm_panel equivalent function. That means that
they _won't_ get the benefit of the checking I added to drm_panel.c.
What that means is that if someone using the "panel-boe-himax8279d.c"
panel shuts down / reboots while their panel is off you'll probably
get a bunch of errors. I _think_ this is as simple as just changing
all those panels to call the drm_panel equivalent function.

2. As much as possible, not only should you be removing the checks,
but you should also be removing all the code that tracks the state of
prepared/enabled in the panel drivers and then removing the "prepared"
/ "enabled" members from the structs. If the panel driver needs to
track prepared/enabled for something else, you might need to keep it
though. One example would be sony-acx565akm, as per my previous
attempt [1].

In general, maybe a good approach would be to actually start with
patches #5 - #9 in my previous series [2] but instead of calling
drm_panel_helper_shutdown() just do:
  drm_panel_disable(...);
  drm_panel_unprepare(...);

Feel free to take my patches, change them, and post them. If you want,
you could add a Co-Developed-by (see submitting-patches.rst).

For some panels the above would be just leaving what's already there.
For some panels that might convert them from their static function to
the drm_panel equivalent.

Leaving the drm_panel_disable() / drm_panel_unprepare() in the panel
driver shutdown/remove code is not an ideal long term solution, but it
at least moves us on the right path and at least lets us get rid of
most of the prepared / enabled tracking. IMO that should be landable,
though perhaps others would have different opinions.

After doing all that, then you could submit patches that simply get
rid of the drm_panel_disable() / drm_panel_unprepare() for any panel
drivers if you know that those panels are only used by DRM drivers
that properly call the DRM shutdown code. See my series that tried to
add that to a bunch of DRM drivers [3]. Not everything landed, but
quite a bit of it did. As Maxime and I talked about [4] that _should_
be as simple as tracking down the panel's compatible string, seeing
which device trees use it, and then seeing if the associated DRM
driver is properly shutting things down.

Finally, after you've removed the calls to drm_panel_disable() /
drm_panel_unprepare() from the majority of the panel drivers then you
could go forward with your patch #2 where you change this to a WARN().
Personally, I'd be a little hesitant to land that change, though,
until at least panel-simple and panel-edp got rid of the calls since
that would add WARN for A LOT of people. Unfortunately, those two
panels drivers are also among the hardest to validate since they're
used with nearly all DRM drivers out there. However, IMO even if we
aren't ready to convert to a full WARN all the rest of the stuff I've
talked about here is worth doing.

Hopefully that's not too overwhelming.


[1] https://lore.kernel.org/lkml/20230804140605.RFC.9.I6a51b36831a5c7b2b82b=
ccf8c550cf0d076aa541@changeid/
[2] https://lore.kernel.org/lkml/20230804210644.1862287-1-dianders@chromium=
.org/
[3] https://lore.kernel.org/lkml/20230921192749.1542462-1-dianders@chromium=
.org/
[4] https://lore.kernel.org/lkml/c6kwqxz2xgl64qb6dzetjjh6j2a6hj7mvbkeg57f5u=
lfs2hrib@ocjjsoxw3ns6/
