Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6763DA17D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 12:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F5A6ED14;
	Thu, 29 Jul 2021 10:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B98C6ED14
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:48:35 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 6BCE0201ED;
 Thu, 29 Jul 2021 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627555713;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ao638iMTTjsA+VNcKLaQE/T5PYOWw6rLSmI4SdHNaOg=;
 b=abeCZgaOXkwOt0BkzLlF/+2YTZf7UkZxXuKxwx+rarlLl6+++jGA/oSR1zP1tBBkMVXgvm
 GT4hGzwrHWO646FIwY3QI2qOTTdotUXq3PJvQire1Y3xdHm1pRg9mNfEdMqC4y4P0XvCJK
 f4ThlbSAIc4M6bC7S1y1F/1mrMoaviA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627555713;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ao638iMTTjsA+VNcKLaQE/T5PYOWw6rLSmI4SdHNaOg=;
 b=3jaJHiWtLRI5qqhbTkmtMyPrqt0TMeDMpnw71ZVL0gyLLlXhjwjFNZFKJAOOOEzthRehoc
 I6ScSOeN75vLU8Cg==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 53E3BA3B81;
 Thu, 29 Jul 2021 10:48:33 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id E0A69DA7AF; Thu, 29 Jul 2021 12:45:47 +0200 (CEST)
Date: Thu, 29 Jul 2021 12:45:47 +0200
From: David Sterba <dsterba@suse.cz>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 02/64] mac80211: Use flex-array for radiotap header bitmap
Message-ID: <20210729104547.GT5047@suse.cz>
Mail-Followup-To: dsterba@suse.cz, Kees Cook <keescook@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-3-keescook@chromium.org>
 <20210728073556.GP1931@kadam> <20210728092323.GW5047@twin.jikos.cz>
 <202107281454.F96505E15@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202107281454.F96505E15@keescook>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
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
Reply-To: dsterba@suse.cz
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 02:54:52PM -0700, Kees Cook wrote:
> On Wed, Jul 28, 2021 at 11:23:23AM +0200, David Sterba wrote:
> > On Wed, Jul 28, 2021 at 10:35:56AM +0300, Dan Carpenter wrote:
> > > @@ -372,7 +372,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
> > >  			ieee80211_calculate_rx_timestamp(local, status,
> > >  							 mpdulen, 0),
> > >  			pos);
> > > -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
> > > +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
> > 
> > A drive-by comment, not related to the patchset, but rather the
> > ieee80211 driver itself.
> > 
> > Shift expressions with (1 << NUMBER) can be subtly broken once the
> > NUMBER is 31 and the value gets silently cast to a 64bit type. It will
> > become 0xfffffffff80000000.
> > 
> > I've checked the IEEE80211_RADIOTAP_* defintions if this is even remotely
> > possible and yes, IEEE80211_RADIOTAP_EXT == 31. Fortunatelly it seems to
> > be used with used with a 32bit types (eg. _bitmap_shifter) so there are
> > no surprises.
> > 
> > The recommended practice is to always use unsigned types for shifts, so
> > "1U << ..." at least.
> 
> Ah, good catch! I think just using BIT() is the right replacement here,
> yes? I suppose that should be a separate patch.

I found definition of BIT in vdso/bits.h, that does not sound like a
standard header, besides that it shifts 1UL, that may not be necessary
everywhere. IIRC there were objections against using the macro at all.

Looking for all the definitions, there are a few that are wrong in the
sense they're using the singed type, eg.

https://elixir.bootlin.com/linux/v5.14-rc3/source/arch/arm/mach-davinci/sleep.S#L7

#define BIT(nr)			(1 << (nr))
...
#define DEEPSLEEP_SLEEPENABLE_BIT	BIT(31)

but that's an assembly file so the C integer promotions don't apply.

https://elixir.bootlin.com/linux/v5.14-rc3/source/drivers/staging/rtl8723bs/include/osdep_service.h#L18
https://elixir.bootlin.com/linux/v5.14-rc3/source/drivers/staging/rtl8723bs/include/wifi.h#L15
https://elixir.bootlin.com/linux/v5.14-rc3/source/tools/perf/util/intel-pt-decoder/intel-pt-pkt-decoder.c#L15

#define BIT(x)	(1 << (x))

Auditing and cleaning that up is for another series, yeah, I'm just
pointing it here if somebody feels like doing the work. It's IMO low
hanging fruit but can reveal real bugs.
