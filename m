Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02A41791D7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 15:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B6B89F71;
	Wed,  4 Mar 2020 14:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB5D89F71
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 14:01:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u26so2128273ljd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2020 06:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GNeKC6MusMqKfuf28ds5x+mPTx64kf5JJ4+evgJaymk=;
 b=fFZcE7NgmAHr8Wb6FuscsVq92KPUCCoJZOnhygbqD2fB+Pj7Y1SFEg6gFsxKhrVTSU
 bVqUO2vvAi/OuLhCp78ZwRKDhwhWsXv2dMv8MO0zu/bjGudolZBi13UG+NuCIhw844vZ
 3rHn4dSd6CdFKgDc8DzpC+NsUzyTYyFgxbDOiytKKgMe0kj7OIFI2RYxX3iJx3xbKYBW
 GQHMmGZEbfGLSDtpNK54Odg+0EDT9GP4aURHBWbmgy04esNK13bSmStp0lclUDt+0xhN
 26+kGFe4tf/pi3484lUUT5SUfLCCi+hXlhAj/ffVEoEbCdb+sCmIHHxQ+8PXmvaIcO8V
 vr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GNeKC6MusMqKfuf28ds5x+mPTx64kf5JJ4+evgJaymk=;
 b=Z3uO2zdoklV2QQvWDSQznWLyyvrrxgxAMkeY74MCtdIZ7CLVPnPGCtf3Vm1aVdKg1F
 yCoEfhGJOYLa6hLf8UoEniDhdgMx/rZ18ECW1Gwt6OQu+ghwscyU4DGh23oXTQZwYN5+
 cGYRGUmafCIvPgSXeJhlDlfoDsBgYIGbJeK+PH5XF8WdmPTUkEfTjckXIqGx63ZcXG6R
 KZ0eSC2WzFw6CFHvVjpDXt2t5cHjigBQ/wwoDCcVXpFDre+K2c/6B89+q33WGbbF1thB
 N2zdbFkxVLBNoET+hdMwNmMdcaWSJ7lOFIUVxFMZY+5VRvKO5PlH/T+o3OvzCsCFvR8j
 wftw==
X-Gm-Message-State: ANhLgQ2+auLzBLNuRqkVYu4uu0EDEjf9CswkDWkGajVdCxe66x9cZaDO
 rY3uoHbbT/EnlS/XQRrZY57c4FZOaJ9og30nuHZuug==
X-Google-Smtp-Source: ADFU+vteBJ/sXT2MspwGyZlMPI7U0HD2WjxGSK7LJEN8aJDfs1TgvMZ/HJ7vXCwAASAk7rsAtmIEbVd7WJFkdTocF0E=
X-Received: by 2002:a05:651c:44b:: with SMTP id
 g11mr2049399ljg.168.1583330471526; 
 Wed, 04 Mar 2020 06:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
 <CACRpkdapumGw5Fp+YaiWkB8uh6me9s2s-Bx_-RqmoqBADJFvEg@mail.gmail.com>
 <c86a5447-999b-9814-0cb3-9c4f65abbf25@marek.ca>
In-Reply-To: <c86a5447-999b-9814-0cb3-9c4f65abbf25@marek.ca>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Mar 2020 15:00:56 +0100
Message-ID: <CACRpkdYq-PkYZ=opkhx0qRVi78osm-m+nPq4EbfdqJi9uLKpYQ@mail.gmail.com>
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
To: Jonathan Marek <jonathan@marek.ca>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 4, 2020 at 2:17 PM Jonathan Marek <jonathan@marek.ca> wrote:

[hs_rate / lp_rate]

> The msm DSI driver does predate the addition of those fields and doesn't
> use them at all.

I think it would be benficient to switch to these fields, because then
the .clock field (dot/pixelclock) is not abused to contain what I guess
is the desires hs_rate.

> Seems like it would be a bit of a hack too, since the frequency we want
> to use is not the "real limits of the hardware"..

That just means "clock it as high as the panel can take".

Normally that would come from the vendor datasheet of
the panel.

If you don't have the datasheet, whatever you use in the vendor
tree is fine, I suppose what is currently in .clock is fine.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
