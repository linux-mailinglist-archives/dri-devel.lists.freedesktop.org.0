Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC6F3EFEAF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 10:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0783A6E49C;
	Wed, 18 Aug 2021 08:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425E96E4AB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=6OzbSXXafKMA7YgF8k8Tjy+aXQW8YBJ4OWUwbnu8sQw=; 
 t=1629274018; x=1630483618; b=sEiY4j35a5WOHPGSD7gwyRihxcyUgPt+MxRq81DvfHkxthC
 7RuTDsmOzt5XgQvZaPcjV8eL5XyYN1M0PnAXxJhvGYr4daMw/Ly/omelGE6/KR2tBCfl0bXF3oNQR
 Al1b1Md2KASw4OMyjOM+xixgbxtEqwL+BYOAZJlU/usw7bcqlNbT5sTWqvYrwdO1uLsW4WZS+iEt6
 rTspZH/LyRlBSM+yGO5m1HxNX+ztLO2gEEWHF19bhWB4N2NnhNWrlhRJkYRnnJlgQUBrXMRC9+PEQ
 USGiXOwYegeK5HB5nRylODyHS4qhNiV+nARxUuYPz/CLmuckX/rO/2FICu4m2/kA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mGGb6-00CcdG-FE; Wed, 18 Aug 2021 10:06:52 +0200
Message-ID: <8b48dac4c40127366e91855306d24e07eb0b81d9.camel@sipsolutions.net>
Subject: Re: [PATCH v2 44/63] mac80211: Use memset_after() to clear tx status
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Andrew Morton <akpm@linux-foundation.org>,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev, 
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 clang-built-linux@googlegroups.com, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>,  linux-hardening@vger.kernel.org
Date: Wed, 18 Aug 2021 10:06:51 +0200
In-Reply-To: <11db2cdc5316b51f3fa2f34e813a458e455c763d.camel@sipsolutions.net>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-45-keescook@chromium.org>
 <11db2cdc5316b51f3fa2f34e813a458e455c763d.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned
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

On Wed, 2021-08-18 at 09:08 +0200, Johannes Berg wrote:
> On Tue, 2021-08-17 at 23:05 -0700, Kees Cook wrote:
> > 
> > @@ -275,12 +275,11 @@ static void carl9170_tx_release(struct kref *ref)
> >  	if (WARN_ON_ONCE(!ar))
> >  		return;
> >  
> > 
> > 
> > 
> > -	BUILD_BUG_ON(
> > -	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
> > -
> > -	memset(&txinfo->status.ack_signal, 0,
> > -	       sizeof(struct ieee80211_tx_info) -
> > -	       offsetof(struct ieee80211_tx_info, status.ack_signal));
> > +	/*
> > +	 * Should this call ieee80211_tx_info_clear_status() instead of clearing
> > +	 * manually? txinfo->status.rates do not seem to be used here.
> > +	 */
> 
> Since you insist, I went digging :)
> 
> It should not, carl9170_tx_fill_rateinfo() has filled the rate
> information before we get to this point.

Otherwise, looks fine, FWIW.

Are you going to apply all of these together somewhere? I (we) can't,
since memset_after() doesn't exist yet.

johannes

