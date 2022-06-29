Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4415606D4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3AC10E8AA;
	Wed, 29 Jun 2022 16:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8652110E957
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:59:39 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id a13so29114010lfr.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=534o96K+HtJxuaFavGV3IgmBObFgbJ+GOTeCO07YsEs=;
 b=ktQ2IPhMiOrRUfEfnOZFDO2UHiqD5R9off5vo2NolrYg0wVVahY4fUkgFzgjYHE1nU
 9OU0kHyuEFneCut9p/1MC4eZjZpdFHk86Kyh5M19BB4VdUwn8LhwNGOe0IygkjlSjp+o
 UXfgvOHBDmo1HxChZjcABi/oGm8aMQreiW21Yvj0V4Oeby3hpvXiqZX8skzW6hGKLb+D
 wD/HROhCVqP3dF5N7bX6OACJKM6Syhh7Cq2Hak7kGnabBgbXZGpg0joVnmWWAtHDZH7S
 Jf9MeqjfjH6Kiq4j6Kak9SZWF0BSOqw3vz3Ooh53b8XOug/MLFJFo0p1Hu6TSWcm1Fhz
 IBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=534o96K+HtJxuaFavGV3IgmBObFgbJ+GOTeCO07YsEs=;
 b=PkhtI7tBekHFJ7YEa9OqydF8sVNf7lMcQHhb9MBWXR9YNjHkcO+5rxhYPtVTCZBFKh
 6tat2eCk/gQE4xYMRLkErFOYcEH6ja02MsM0GWVyurQcz3PBxYi1Upmfk3ICnd9ghW+r
 2P5KcdF20BNQjK4ssy5b1J2B5NdEkqSNIOWyWViQsYSZRC8voSzXEE6scnqHrkvqWhFD
 gYowzHUxERS05jrplOiMR/yJ5VG874fPFjpODZ4a1B2k/3yYOkRzU/yag6u6u8mHj/BG
 Yuz0IVqZW89eDvOcrqmU/T5tyCRl1A4BPTisEERdcfFwliKk+vGjR4OYT0yNBMjrHf8M
 B/kw==
X-Gm-Message-State: AJIora9g5We/AWo3XTBNZQq2m70ZqtfF2bX6Vryg6zorTofA/M5NotO1
 9DrdL/RoSLyxpvgArwiNLmDmY6CUOHqdUqU0LHvXyg==
X-Google-Smtp-Source: AGRyM1tEwXYmLhImHx4/hcXAfpxfegIwVjIMDc2lDGMK5VwpNQjWFlGcJaVWV3chEbEeKSZvcET9jArZasXRPasprsw=
X-Received: by 2002:ac2:4d22:0:b0:47f:65b5:35ec with SMTP id
 h2-20020ac24d22000000b0047f65b535ecmr2861553lfk.432.1656521977609; Wed, 29
 Jun 2022 09:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220627111927.641837068@linuxfoundation.org>
 <20220627111929.368555413@linuxfoundation.org>
 <6cd16364-f0cd-b3f3-248f-4b6d585d05ef@gmail.com>
 <CAKwvOdm8UiY8CsqNgyoq4MdC2TbBj-1+cRE+fWZ9+vVBxNZz_Q@mail.gmail.com>
 <20220629053854.GA16297@lst.de>
In-Reply-To: <20220629053854.GA16297@lst.de>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 29 Jun 2022 09:59:25 -0700
Message-ID: <CAKwvOd=S05LN=bDXcWpkpz1NG+C=M4Hd0HW0xcP_hrSsf8Mb9Q@mail.gmail.com>
Subject: Re: [PATCH 5.4 57/60] modpost: fix section mismatch check for
 exported init/exit sections
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 10:38 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Jun 28, 2022 at 12:11:50PM -0700, Nick Desaulniers wrote:
> > Maybe let's check with Christoph if it's ok to backport bf22c9ec39da
> > to stable 5.10 and 5.4?
>
> I'd be fine with that, but in the end it is something for the relevant
> maintainers to decide.

$ ./scripts/get_maintainer.pl -f drivers/gpu/drm/drm_crtc_helper_internal.h
Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM
DRIVERS AND MISC GPU PATCHES)
Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND
MISC GPU PATCHES)
David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
linux-kernel@vger.kernel.org (open list)

Maarten, Maxime, Thomas, David, or Daniel,
Is it ok to backport
commit bf22c9ec39da ("drm: remove drm_fb_helper_modinit")
to 5.10.y and 5.4.y to fix the modpost warning reported by Florian in
https://lore.kernel.org/stable/6cd16364-f0cd-b3f3-248f-4b6d585d05ef@gmail.com/ ?
-- 
Thanks,
~Nick Desaulniers
