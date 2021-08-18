Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B23EFFEC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 11:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7F96E4CB;
	Wed, 18 Aug 2021 09:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CFD6E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:05:47 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso1914658pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NwlqG+rGO9KvfhCSwLDgRYsI8h6dWdnqYqbHJGPEme0=;
 b=R5Ryqi+3ufOXj4PruwnTvqtfAJxKzmWANSkCph9vX3JAIUwLfa/ogsf0XiAzmuAaIb
 VPDfjaA6JoKlT4Kx+R9SxDMV4d2OeUToJNM29cVAvSSW7Gq1sgBqjsTAvV4VPEc/f7nR
 v/9FoiPkSVtpFKIvuRP2dgdjigBNevI1IirKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=NwlqG+rGO9KvfhCSwLDgRYsI8h6dWdnqYqbHJGPEme0=;
 b=mMKyIT7VcaKpJVMpr2L1h+qr/KH4SNWoSozGxlsXNaintD3irgPueBAnAkJlcIOsbW
 D8Huojbwz/dCuViRWpyy/8hkhADQ7cC8uiKsbyrZW0Fi7/k1/ow5vXW0QgjJzLNpJQXe
 54cG0RNzZRoif0R+fEYhqKIJX1r3UzmpXECgXXqLPkXSBTdY3YNzgIc59HCuFUgwjtUU
 J7rHPSIWKa8uWTxROhrCwqLTi/9cD/vOoegvR75zD24bXlg7i6sqa/0KCdPL+nE4qmEg
 Dji+GbpkdIOg0bSgSy0CXum3XJ70WBYmXXVZxpBRavweue5YZ8Nh/Eu4aFX2cILdBDMK
 FM0w==
X-Gm-Message-State: AOAM531AfY9+mOXH0lX75fp1HGmvcbKHDmycMdBWzyIe4rg3Fsbh7Ose
 D+RUaSQGpSlRFU8MA0NLAqQykA==
X-Google-Smtp-Source: ABdhPJy5VoNYR8gwCuIaLE1kUReGMfgEfhj9n5qCxc6K8dzpoM8CUxBKq9FzEjdxDuCc9RNmRV3rMg==
X-Received: by 2002:a17:90a:6c97:: with SMTP id
 y23mr8162537pjj.117.1629277547417; 
 Wed, 18 Aug 2021 02:05:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y19sm5468368pfe.71.2021.08.18.02.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 02:05:46 -0700 (PDT)
Date: Wed, 18 Aug 2021 02:05:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 44/63] mac80211: Use memset_after() to clear tx status
Message-ID: <202108180203.592E3F01@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-45-keescook@chromium.org>
 <11db2cdc5316b51f3fa2f34e813a458e455c763d.camel@sipsolutions.net>
 <8b48dac4c40127366e91855306d24e07eb0b81d9.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b48dac4c40127366e91855306d24e07eb0b81d9.camel@sipsolutions.net>
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

On Wed, Aug 18, 2021 at 10:06:51AM +0200, Johannes Berg wrote:
> On Wed, 2021-08-18 at 09:08 +0200, Johannes Berg wrote:
> > On Tue, 2021-08-17 at 23:05 -0700, Kees Cook wrote:
> > > 
> > > @@ -275,12 +275,11 @@ static void carl9170_tx_release(struct kref *ref)
> > >  	if (WARN_ON_ONCE(!ar))
> > >  		return;
> > >  
> > > 
> > > 
> > > 
> > > -	BUILD_BUG_ON(
> > > -	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
> > > -
> > > -	memset(&txinfo->status.ack_signal, 0,
> > > -	       sizeof(struct ieee80211_tx_info) -
> > > -	       offsetof(struct ieee80211_tx_info, status.ack_signal));
> > > +	/*
> > > +	 * Should this call ieee80211_tx_info_clear_status() instead of clearing
> > > +	 * manually? txinfo->status.rates do not seem to be used here.
> > > +	 */
> > 
> > Since you insist, I went digging :)
> > 
> > It should not, carl9170_tx_fill_rateinfo() has filled the rate
> > information before we get to this point.

Ah-ha! Thanks for checking. I'll update the comment to explain the
rationale here.

> Otherwise, looks fine, FWIW.

Thanks!

> Are you going to apply all of these together somewhere? I (we) can't,
> since memset_after() doesn't exist yet.

Right, given the dependencies, I am expecting to just carry the whole
series, since the vast majority of it has no binary changes, etc. I'm
hoping to get it into -next soon, but we're uncomfortably close to the
merge window. :P

-- 
Kees Cook
