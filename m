Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184F56CEE2
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 13:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC31F113712;
	Sun, 10 Jul 2022 11:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F961135DA
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sl6VoKbkWuLeqSDckxMqFupQqky69Mgc4GHkmn0W8Uc=;
 b=ayg7WXbuOLxfFcUQGgCyIwaqq9oBroKQCQKAWYCECnfqOaDyaX764YkO0Q0TU4tGEPe0CxpdgnHGh
 E0IjiTUbyrgXHQ9lZU8poic9ghmEYFR0ACDWRYaQhUvWrx8DasP/pAMYs947Onun1XrnCYcZWl9f+Z
 xZmsDMnaFASPjxEy2kFsRV6ZfcU10q1BvGhmrKJHT6gOg/LQCHqMd0dkBw2hdSF2pxuX5AVGxi7HVL
 0Ik0aV1SmYDfKC/s1sdqBKb39wZRfPK3ChIbCkiQtQwUb+PSFoCeSlr6PQbTyv8GRhxqOFpbrHTahu
 RoxAVaLn3nmOS7rsd219iM/TVJetWSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=sl6VoKbkWuLeqSDckxMqFupQqky69Mgc4GHkmn0W8Uc=;
 b=Fr+VKWXXhJiZu5zYOcXUJNbsrScvyKVf+nOb0ZmDVbpAoQHkhTAoYX+cpAxE8B5GZ8bemePTxcK7J
 3eYQlOxBA==
X-HalOne-Cookie: ae0e36a951df1365868c870872e99beb831bb273
X-HalOne-ID: 3e797074-0047-11ed-823d-d0431ea8bb10
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3e797074-0047-11ed-823d-d0431ea8bb10;
 Sun, 10 Jul 2022 11:55:51 +0000 (UTC)
Date: Sun, 10 Jul 2022 13:55:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH libdrm v2 01/10] util: Improve SMPTE color LUT accuracy
Message-ID: <Ysq+RUzLURDxmQqZ@ravnborg.org>
References: <cover.1657302034.git.geert@linux-m68k.org>
 <a35154278816426fee7045795aa4894ff615efdf.1657302034.git.geert@linux-m68k.org>
 <YsqqiMAikaBP/3vt@ravnborg.org>
 <CAMuHMdWJf6HR-jf+UijFgfpXpG2UFj+Z-9ef2y5u6CTrZBsS+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWJf6HR-jf+UijFgfpXpG2UFj+Z-9ef2y5u6CTrZBsS+g@mail.gmail.com>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Sun, Jul 10, 2022 at 01:04:23PM +0200, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> On Sun, Jul 10, 2022 at 12:31 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Fri, Jul 08, 2022 at 08:21:31PM +0200, Geert Uytterhoeven wrote:
> > > Fill in the LSB when converting color components from 8-bit to 16-bit.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > v2:
> > >   - New.
> > > ---
> > >  tests/util/pattern.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/tests/util/pattern.c b/tests/util/pattern.c
> > > index 178aee8341a38920..3753ebc1eeae6c9a 100644
> > > --- a/tests/util/pattern.c
> > > +++ b/tests/util/pattern.c
> > > @@ -646,9 +646,9 @@ void util_smpte_c8_gamma(unsigned size, struct drm_color_lut *lut)
> > >       memset(lut, 0, size * sizeof(struct drm_color_lut));
> > >
> > >  #define FILL_COLOR(idx, r, g, b) \
> > > -     lut[idx].red = (r) << 8; \
> > > -     lut[idx].green = (g) << 8; \
> > > -     lut[idx].blue = (b) << 8
> > > +     lut[idx].red = (r) * 0x101; \
> >
> >         (lut[idx].red = (r) << 8) | 1;
> >
> > had IMO been easier to read.
> 
> I guess you mean "| (r)" instead of "| 1"?
Well, I meant what I wrote but it is obviously wrong.

So yes
	lut[idx].red = (r) << 8 | (r);

is the equivalent of multiplying with 0x101.

Whatever works, but if you update this patch, then please update the
later patch where the multiply with 0x101 is also used.

	Sam
