Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBC3EFD66
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 09:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB0689291;
	Wed, 18 Aug 2021 07:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B9D89291
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=ym1uD8O5zOub+cpikC9nk8w/uDg8kA95v0fuB8biuWo=; 
 t=1629270540; x=1630480140; b=Xc17GxGWL/N4YTMJfXQoPCHoV2A7l75yvnrvAiutK5rzKRF
 xNQNM6B6qyF4ECpch54FdByrJiDSjit4lz04lMQKiXBpZKRAvOvzpa9HjUoFuf+cde5wrmN4plNq1
 ROmtJCJS4LPkaG3MFVgVJifOQhdnStwTSq8SbWrHdg6fpLW+ZdcEHW43NYrsVJDibRzke5sNt3Wx5
 1aG+uwDu7nasUtAI229tRju3JJgh9WTI81prar1GvOR3xhI5c1J4ZUT7Zyw1raAIUl7MyIRE6kkan
 5V74REFlmYAGEZQYhKzKqM2RcRmmTaMx61iQeL5pcLv1qW+Npnw7NdmFExs1dC3g==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mGFgz-00CbW0-CL; Wed, 18 Aug 2021 09:08:53 +0200
Message-ID: <11db2cdc5316b51f3fa2f34e813a458e455c763d.camel@sipsolutions.net>
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
Date: Wed, 18 Aug 2021 09:08:52 +0200
In-Reply-To: <20210818060533.3569517-45-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-45-keescook@chromium.org>
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

On Tue, 2021-08-17 at 23:05 -0700, Kees Cook wrote:
> 
> @@ -275,12 +275,11 @@ static void carl9170_tx_release(struct kref *ref)
>  	if (WARN_ON_ONCE(!ar))
>  		return;
>  
> 
> 
> 
> -	BUILD_BUG_ON(
> -	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
> -
> -	memset(&txinfo->status.ack_signal, 0,
> -	       sizeof(struct ieee80211_tx_info) -
> -	       offsetof(struct ieee80211_tx_info, status.ack_signal));
> +	/*
> +	 * Should this call ieee80211_tx_info_clear_status() instead of clearing
> +	 * manually? txinfo->status.rates do not seem to be used here.
> +	 */

Since you insist, I went digging :)

It should not, carl9170_tx_fill_rateinfo() has filled the rate
information before we get to this point.

johannes

