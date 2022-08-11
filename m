Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B25906F6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 21:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62B3318A9C3;
	Thu, 11 Aug 2022 19:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F7911B095
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PiIxReYkxtBzv66jtBR4FROfX82syegstNTwPa+ySR0=;
 b=J4WnXA650B9xrqJFOUNC99f85fvYDJAQp733iypsjAv6EqqJCkAK7OOrj2HmV44IcKdnV3v+7OM2Q
 VBI5UDXOx9WDYcqqlqUYamwCxt9veZ0xDP0M1tZNhzKtiTJk3LKqmoJvowc6jzgVcl1XbWbLHnWGaj
 prL9zk8v75TMw3wvqpIdOSgv8OKdHSseFmbRB9/hcaUaQsxV1ggShec0sc4PVydd3U/hZl73hVvHxr
 y/LkQkCaLbhyFGuCCwyE98HrhJ5vXM2lzB//fk+kRnBtI4dkJsF4/Qd47/hCwSJohfSbz0YxDuEoJO
 R1XE1Hodc/OUYnY5cMcYNsOsE7lki1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=PiIxReYkxtBzv66jtBR4FROfX82syegstNTwPa+ySR0=;
 b=lud6DSUj9xxo1AbujB4/Ho0gbti2rokDDTZkDXnKk5P5Gu4jnxPiTtmV5CE+z6T/r+e1iMKDNB/Wp
 EGowbZsDQ==
X-HalOne-Cookie: 52a4d43754f5de879c648bea03fabce90926a481
X-HalOne-ID: 07f25d33-19ac-11ed-8245-d0431ea8bb10
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 07f25d33-19ac-11ed-8245-d0431ea8bb10;
 Thu, 11 Aug 2022 19:30:17 +0000 (UTC)
Date: Thu, 11 Aug 2022 21:30:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 01/10] drm/fourcc: Add drm_format_info_bpp() helper
Message-ID: <YvVYyKZNDGfhGjb5@ravnborg.org>
References: <cover.1657294931.git.geert@linux-m68k.org>
 <1cae5ebc28513ec1c91c66b00647ce3ca23bfba7.1657294931.git.geert@linux-m68k.org>
 <YvPVxy4kYKdzWgT8@phenom.ffwll.local>
 <CAMuHMdVMuuXgYW-AkyB+G77Wsjkm715u1ifDvaY=5DufXjryRA@mail.gmail.com>
 <YvUqPL5l8/+XbvaQ@phenom.ffwll.local>
 <YvVKe72jYBjucmkz@ravnborg.org>
 <CAMuHMdVD37MCXau4w87=x_jk9j-NMJCmu0d9qPuMqmHA_vPQRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVD37MCXau4w87=x_jk9j-NMJCmu0d9qPuMqmHA_vPQRQ@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

> > >
> > > Yeah I don't think we should describe these with bpp or cpp or anything
> > > like that. bpp < 8 makes sense since that's how this has been done since
> > > decades, but trying to extend these to funny new formats is a bad idea.
> > > This is also why cpp and depth refuse to compute these (or at least
> > > should).
> >
> > Daniel and I discussed this on irc. Let me try to recap here.
> > Using the bits per pixel info from drm_format_info is something we shall
> > try to avoid as this is often a sign of the wrong abstraction/design (my
> > words based on the irc talk).
> > So we shall limit the use of drm_format_info_bpp() to what we need now,
> > thus blocky formats should not be supported - to try to avoid seeing
> > this used more than necessary.
> >
> > Daniel suggested a rename to drm_format_info_legacy_bpp() to make it
> > obvious that this is often/always the wrong solution. I did not jump on
> > doing the rename as I do not know stuff good enough to tell people what
> > to use when this is not the right solution. The rename is simple, it is
> > the follow-up that keep me away.
> >
> > On top of this there is a few formats in drm_drourcc that has a depth
> > field set which should be dropped. .depth is only for the few legacy
> > formats where it is used today.
> >
> > We would also like to convert the fbdev helpers to drm_format_info,
> > and doing so will likely teach us a bit more what we need and what we
> > can drop.
> >
> > Geert - can you give drm_format_info_bpp() a spin so it is limited to
> > the formats used now (not the blocky ones).
> 
> You mean return 0 if char_per_block[] > 1?
if char_per_block[] > 1 AND block_w[] > 0 AND block_h[] > 0 should be
enough.

> I'm not sure it's actually safe to do so (and make this change this late
> in the development cycle), as this is used in drm_client_buffer_create(),
> drm_client_buffer_addfb(), and drm_mode_getfb().

drm_client_buffer_create() and drm_client_buffer_addfb() both get their
format from  drm_mode_legacy_fb_format() which do not produce any blocky
formats - so they are good.

drm_mode_getfb() looks up a framebuffer originally created using one of
the above (I think), so here it should also be fine.
I do not see the need to push this to fixes, so it has a full cycle to
mature if it causes issues.

	Sam
