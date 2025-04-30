Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B76AA52F7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 19:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366EF10E0BC;
	Wed, 30 Apr 2025 17:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="XzNINjeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E186710E0BC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 17:52:11 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-85b3f92c8f8so9362439f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 10:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1746035528; x=1746640328;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tV3++ttVfH4W7FY1HViLXTb1LjmY9pSLMgtourB5A0Y=;
 b=XzNINjeoZGpwXK0yWo4w8bGO6MVgghSeIKgRi+Ixb4dFw53qXYX5/VB+c9Rw8JacqU
 WCh+VqW+gZixxRTRts0i/F0Hrhgct5xAubaWiU3mpFt9EBkThUFv/dRsGDC19530GmLI
 VgPmxhrWrPa1WkGAa/GwBtWEGoKsQdmPJn1IN/EFdd2li0aXC+OgMD1cOOf//FJv63Z6
 7yBQ0W/Wp2F8PBb8nPbCPt2T/Jbl+xhngQ0Awgs/cCM7e/9555Sm/2eb5X3A0CVmTSfC
 CXIx7gmzcp7knNmvCxBLPC2gctXmjgU24Bx8sFoeIaLIO8HsGonCmlWvT+U2X3B6bVF8
 SblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746035528; x=1746640328;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tV3++ttVfH4W7FY1HViLXTb1LjmY9pSLMgtourB5A0Y=;
 b=rYphfeoy3kVBgXrW7uF0IOr/NlmEeZGffL+HXzefHLP/L2lpVHRbFYcN7gpug3uf/S
 cdBLYOd0AUEv72swLEHO8hHgCc/9K6W8JG328pgvzGaTHQCO8USRBFuCIm/I5iTzv/XF
 IvLx3no6Gc61uGqMgTw7bzVaQnxPLf78hU/NCi91XmFZbMwnUOmYXR/e8TRB0znOfSEr
 rjhmZfEGkPrOJ/hoax7woZKFWskVli4ZivDLHKoQ9sNYue51VbN0IU30q0/i9xeIH3j7
 gHhCSKTgk0hEvb19mycvmRrR49DFyTuuYC3B6DOtosDGEzcxjfK/qy22C415tmD5jwDy
 c1JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnhFMHCwecOscN08ln5vzGzmzAhNw5DXlQJcltF0DDLNaxonuyK0iUflf0d7sML+86yDDD1jZfEjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE1em3DxEm/A/zqJ7Ve8LuEQ/sGdl89jDZV8OxNty7HE3vWnO5
 N98W1yBTnCe99nIKjreQHlWZhsR5G1eS3bGoXvDssvdrvFSdRgm51W/Al16lFsc=
X-Gm-Gg: ASbGncufQF2DHNJ1lJnzHTDH9ic++/g28/SFR2YxgNCK2XuVvs9rgCUyuvhbTLP9te5
 wC9W06jHoasb8zFOu9XcJye84GQRzCTEBAouqGBEL7o7o7Y6Q7sVNjDzwreGzRAt665cGyvYT3N
 8EGW+6lnm5fKfxSrQKxawLpYlVbqRs3N7IP8aMIaLoRn5QXYkX34xTND4Llf2g0yL2hi8vvx1HV
 A31dVaTm/HQs8XOMMxmF3mMasbDqvNksBgcPOfADh1iOGK0t9la/tD3HmRMfdwqJ26McwbZvu97
 +IH7269a9lCmzU+KlhHxw3fF2rrY91MHm4ukYSubd6NYn6nbb7IFsUlryZLPbkfqW3zI0w==
X-Google-Smtp-Source: AGHT+IGA8d3eSMeZa990sNEOMPBfFmfFJDgS1Kkfj8JknYIKmKzHhe3V9dFO1McaI8Jc02UYFjzRfQ==
X-Received: by 2002:a05:6602:389a:b0:85a:e279:1ed6 with SMTP id
 ca18e2360f4ac-86495ef01d6mr557928339f.11.1746035527605; 
 Wed, 30 Apr 2025 10:52:07 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
 by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8648bf2f2adsm83135239f.12.2025.04.30.10.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 10:52:07 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:52:05 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
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

On Wed, Apr 30, 2025 at 10:05:44AM -0700, Doug Anderson wrote:
> On Wed, Apr 30, 2025 at 6:28 AM Nick Bowler <nbowler@draconx.ca> wrote:
> > On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
> > > On Sun, Apr 20, 2025 at 9:26 PM Nick Bowler <nbowler@draconx.ca> wrote:
> > > > I recently noticed that on current kernels I lose video output from
> > > > my Blackbird's AST2500 BMC after a reboot
> > [...]
> > > >   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
> > > >   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
> > > >   Author: Douglas Anderson <dianders@chromium.org>
> > > >   Date:   Fri Sep 1 16:39:53 2023 -0700
> > > >
> > > >       drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers
[...]
> Do you happen to have anything that's just a normal HDMI sink, like a
> TV or a standard monitor that takes HDMI?

I can probably find something else to try later.

> > To clarify, there is no boot failure.  There is just no video output
> > after rebooting.  I can then boot Linux again by any method that works
> > without being able to see the screen, and then everything is fine once
> > I do that.
> 
> Super weird. So every other boot works?

On a new/broken kernel, every time I run "reboot" the video turns off
when Linux does whatever it does to make the system restart.

The video comes on again if I manage to boot it up again.

The problem is that I have to do that without using the screen.  So I
can boot Linux via the serial port, or via the BMC web interface, or
by just typing on the keyboard without seeing what is happening.

> I guess I'd be interested in other types of tests to see what's going
> on. Aside from trying some other, more standard HDMI sinks, I'd love
> to see the results of:
> 
> 1. HDMI is supposed to be hotpluggable. If you've got a boot where the
> display isn't working, what if you unplug the HDMI and plug it back
> in. Does it fix it?

Unplugging/replugging the cable when the video is off after rebooting
does not cause it to start working again.

> 2. Does the hotplug experience change if you boot with the revert?
> AKA: boot up with the revert (so everything is working normally),
> unplug HDMI, wait a few seconds, plug HDMI back in? Is this different
> than #1?

I have certainly never noticed any problem related to hot plugging while
the video output is working but this is not something I ever normally
do.  I can try it later.

> 3. What about if you fully power off and then power on? Does the
> display work reliably in this case, or are things different between
> ToT and with the revert?

There is never any problem with the video output if I fully power off/on
the system.  The problem only occurs on a reboot.

> 4. What about if you fully power off, unplug the HDMI, wait a few
> seconds, plug the HDMI, and power on? Does that work? Are things
> different between ToT and with the revert?

Again there is never any problem if I fully power off/on the system.

Thanks,
  Nick
