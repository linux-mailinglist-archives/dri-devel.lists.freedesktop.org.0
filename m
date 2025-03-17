Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A626A65A11
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9144D10E437;
	Mon, 17 Mar 2025 17:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qqkn9E3r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3510110E437
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:14:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so17968745e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1742231657; x=1742836457;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gd/helYOE9uVmXuMlkncjSq63BGQQdsjbLjgrGPTsCU=;
 b=qqkn9E3rLzwDsRSYbV3qDlSMe6QCME/pEk9FQvYWspkzcqj1ijoJfZKST/g75POoqZ
 rzr2oX2jAOCBr1jdTmaru7yyHNiZnoy0Zgzj7WxtBGvfhLcAZRwFxBuIwU4pgtJHbmsM
 ylhTAvotccOwbuZHliOwChugIhCELe/yQW5QSVHiytMqR3W1LIZ7/ufmWqMbs0Cwguy2
 ZB2GQgto4syIPjsaNdFgQhMOmC+3Zs1/FX6bQ7mJzXFJ/UOf1915goAn0L7kkAlD5Nv7
 DMNA6fPsYx8QJBWr6Uc6d1CraC2tgzJuieCh8Y8QkbOLvQAWRsMTciX5zlg5eryrrKw8
 UmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231657; x=1742836457;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gd/helYOE9uVmXuMlkncjSq63BGQQdsjbLjgrGPTsCU=;
 b=iLt7jAogyZvAKsZK4mG5rZx9Z9JUnp31IecOVs+KhWifgoGqhz6EOy8vUub23/ELCD
 yft7CmLJq0Q4kDhCJHsEEgcTTcUlKXm1TOTqQ4xJQ6N2y25p39uQdqV521BAmYTleC/R
 00UgOmxABjpenS5VENwf8d9Nqj/XULVeuVqTsq0Uy5IMVpKau3+4dm/jWYDYy7IRf6ir
 R5asD1l7nzYaVUDjSozcC5o7nykAqesT0EHTKb2e22vD4KvzowXAJrBkGimSEF30bqOk
 C5A++f87Kov+7fK0Gc1LEQlcHlNgU0hvA7nTxwg2R6HFLDYp9d3Bb5pBVSwa58yLSKFz
 NRnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvtqzTR6pXLfDL/ypCaLl5DLJCd+GmhVi7EEphInq1PeVdWb1arRg6XpGdK9cDAMAewc2jyakmSCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA9ExiaiWiKHABQ7rqMr6FCuqKOnOc6CBVFQAQ0L15nhX8Aygl
 fpBWSECSd7DaO+/fN3YzynnTOlKEkQHVQoAoRyUR5KwDczEHaoUEVS1mSka2mZE=
X-Gm-Gg: ASbGnctPKoOHVdn7ofPxdWYPhFSicrJT/8t8QIThUZ/CiWE9gIj7UyfCON7HK7MQwgD
 CXcm07OwGDXBQgEHuVjzSiatup88WZO3h2vNkdotQv8KM5uDXOnFfnouLMI3szK2rdVHwJaIwmi
 lYS9fO50LvLAMfbsOcyx7l51JMGIPxPAdoY+OnZt1os7b4HdNnQBzBbQuBsCiCKDh17cMbxeFcP
 LqOtE+vyYdAvPywm4sXmrZUMNwAWGM8iDzZOpmfcPNK7LVlG8T3htc6TYBrBxYI0tR36OiqvJ2W
 ust3oLKAbK1sr5kujRFKaCgQ3BG2yO1FGFcMvsZwBWdwEx1wENHRq+y8xRIIhpmnWdPYUAsQHgG
 BM//kJ08EsPC9+j6j9WjuQCrrgEk=
X-Google-Smtp-Source: AGHT+IEvhbfXifzPVNQRpvuqSbPm83CJxXhCqmpCNZkF+yY+5ZvGojK1oVkGDDRJOqUBKsdKLDhpeQ==
X-Received: by 2002:a05:6000:2a8:b0:391:10c5:d1c6 with SMTP id
 ffacd0b85a97d-3996b43e7ffmr584748f8f.2.1742231656991; 
 Mon, 17 Mar 2025 10:14:16 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc49adsm110267575e9.24.2025.03.17.10.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:14:16 -0700 (PDT)
Date: Mon, 17 Mar 2025 17:14:14 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lee Jones <lee@kernel.org>, pavel@ucw.cz, danielt@kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, simona@ffwll.ch,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 00/11] backlight, lcd, led: Remove fbdev dependencies
Message-ID: <Z9hYZnbxvJSi29d1@aspen.lan>
References: <20250306140947.580324-1-tzimmermann@suse.de>
 <20250313165151.GE3645863@google.com>
 <f3c245a4-d932-417e-a0e8-f0453c9bc2ef@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3c245a4-d932-417e-a0e8-f0453c9bc2ef@suse.de>
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

On Mon, Mar 17, 2025 at 09:42:11AM +0100, Thomas Zimmermann wrote:
> Hi
>
> Am 13.03.25 um 17:51 schrieb Lee Jones:
> > On Thu, 06 Mar 2025, Thomas Zimmermann wrote:
> >
> > > This series removes the remaining dependencies on fbdev from the
> > > backlight, lcd and led subsystems. Each depends on fbdev events to
> > > track display state. Make fbdev inform each subsystem via a dedicated
> > > interface instead.
> > >
> > > Patches 1 to 3 make fbdev track blank state for each display, so that
> > > backlight code doesn't have to.
> > >
> > > Patches 4 to 6 remove fbdev event handling from backlight code. Patches
> > > 7 and 8 remove fbdev event handling from lcd code and patches 9 and 10
> > > do the same for led's backlight trigger.
> > >
> > > The final patch removes the event constants from fbdev.
> > >
> > > With the series applied, the three subsystems do no longer depend on
> > > fbdev. It's also a clean up for fbdev. Fbdev used to send out a large
> > > number of events. That mechanism has been deprecated for some time and
> > > converted call to dedicated functions instead.
> > >
> > > Testing is very welcome, as I don't have the hardware to test this
> > > series.
> > >
> > > v3:
> > > - export several symbols
> > > - static-inline declare empty placeholders
> > > v2:
> > > - avoid IS_REACHABLE() in source file (Lee)
> > > - simplify several interfaces and helpers
> > > - use lock guards
> > > - initialize global lists and mutices
> > >
> > > Thomas Zimmermann (11):
> > >    fbdev: Rework fb_blank()
> > >    fbdev: Track display blanking state
> > >    fbdev: Send old blank state in FB_EVENT_BLANK
> > >    backlight: Implement fbdev tracking with blank state from event
> > >    backlight: Move blank-state handling into helper
> > >    backlight: Replace fb events with a dedicated function call
> > >    backlight: lcd: Move event handling into helpers
> > >    backlight: lcd: Replace fb events with a dedicated function call
> > >    leds: backlight trigger: Move blank-state handling into helper
> > >    leds: backlight trigger: Replace fb events with a dedicated function
> > >      call
> > >    fbdev: Remove constants of unused events
> > >
> > >   drivers/leds/trigger/ledtrig-backlight.c |  48 +++++-----
> > >   drivers/video/backlight/backlight.c      |  93 +++++--------------
> > >   drivers/video/backlight/lcd.c            | 108 +++++++++--------------
> > >   drivers/video/fbdev/core/fb_backlight.c  |  12 +++
> > >   drivers/video/fbdev/core/fb_info.c       |   1 +
> > >   drivers/video/fbdev/core/fbmem.c         |  82 ++++++++++++++---
> > >   drivers/video/fbdev/core/fbsysfs.c       |   8 +-
> > >   include/linux/backlight.h                |  22 ++---
> > >   include/linux/fb.h                       |  12 +--
> > >   include/linux/lcd.h                      |  21 ++++-
> > >   include/linux/leds.h                     |   6 ++
> > >   11 files changed, 205 insertions(+), 208 deletions(-)
> > No immediately obvious issues from the LEDs side.
> >
> > Still needs reviews from Backlight and fbdev.
>
> I'm confused. Are you not the backlight maintainer?

Lee is, yes, but this kind of comment is usually a hint that I've
been delinquent in my backlight reviews and records that he hasn't
looked at the backlight code yet ;-).

I'll get on it tomorrow!


Daniel.
