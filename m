Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF387AE56
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:55:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689A910F35A;
	Wed, 13 Mar 2024 17:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="wJQ0A8Lb";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="UqBQ9eLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod3-cph3.one.com
 (mailrelay1-1.pub.mailoutpod3-cph3.one.com [46.30.211.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB69D10F35A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=772gv0JFjk24UCM4cXblvdaXj1GC71JgGxfdqwm4GgA=;
 b=wJQ0A8Lbb1Xga0BFZIWaKqg16NJx7gVz/Wsn0pF+4poPI04akZHGDpSFAL1/8bmZymQcpMtG8jPYH
 lf00fW1KOruhECI8D7QRJnifmgiO6V7RoH4o3wDxKASON30Z1zsgXvhVfKblLJUeCag1BgsIDYhRuY
 pEPLEOh8YGNeJNJWMvAH1J5vOfEVq000HckKdtbA2CHHCsmIiBoZBDo887af40vwGpvycWvMr2mwL5
 2B4O393PIY4AQ0xVcFnvD8pqILa3nuVXhXpffS15JuGXTNs10EDWRc1pyQv+PwfNqG+mca0GdZkiB8
 f2TdKKUMSKIbkytdvCERBl8Q9t/RSRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=772gv0JFjk24UCM4cXblvdaXj1GC71JgGxfdqwm4GgA=;
 b=UqBQ9eLRkbthSkCT9NUcgsB2UZ89uLjCiqtU80xsUK47Vb7s9qpcv98ZurrTTlHtOyJwZw131xfEI
 C2Vh64HDw==
X-HalOne-ID: c011b02b-e162-11ee-b64b-1ff1563c5748
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id c011b02b-e162-11ee-b64b-1ff1563c5748;
 Wed, 13 Mar 2024 17:54:36 +0000 (UTC)
Date: Wed, 13 Mar 2024 18:54:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Andy Shevchenko <andy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, lee@kernel.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 1/6] auxdisplay/ht16k33: Replace use of fb_blank with
 backlight helper
Message-ID: <20240313175434.GA96726@ravnborg.org>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-2-tzimmermann@suse.de>
 <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=5V_XChzDhaaWNC+B4LP7gqivPZj5Y10qqS4SkQTGB_A@mail.gmail.com>
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

Hi Miguel.

On Wed, Mar 13, 2024 at 05:08:08PM +0100, Miguel Ojeda wrote:
> Hi Thomas,
> 
> Thanks for this!
> 
> Cc'ing Andy and Geert -- the new maintainer and reviewer.
> 
> Also, a couple quick notes below since I am here...
> 
> On Wed, Mar 13, 2024 at 4:49 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > Replace the use of struct backlight_properties.fb_blank with a
> > call to backlight_get_brightness(). The helper implement the same
> > logic as the driver's function.
> 
> It is not exactly the same logic since `backlight_is_blank` accounts
> for `BL_CORE_SUSPENDED`.

The driver does not set BL_CORE_SUSPENDRESUME so that part is a nop.

	Sam
