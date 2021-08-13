Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ADF3EB23A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 10:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16226E55E;
	Fri, 13 Aug 2021 08:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674736E560
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 08:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=v5GvruCHAD5VdGVp7rPAa70pStcYZ0dgf5ANMBb+4wc=; 
 t=1628841992; x=1630051592; b=PIqy+rq4DL+fVp+LmVekQoWYS3WFbfHif3qvv33LUj9uL9L
 fS3bJX4FanNZjOvUnG4L4o9aHyr6g4gkSbIINCsEdnEI2oUBLNknHDg/tv9KKaeXI+VkfWtn6HR16
 Nq8v5ciOCv+QGBBcfK9tYzu8pBKT44eUD8c0EOwGjCdASn8BR9XYajwhl6sHTGgLkdPWvFhK3uwVL
 f9uEYYtKwlxQSVl9fT9/u8pn/ry0QeDZZ5E8abktLodTtqYpeSjtGCEsvmIwPHZHFeoElJnRkzOEp
 QEqU4Sx0GRCw6jKLoKluQYfad0EIzFIQBbUGIUI5x5PfrLzyjaz1K0aprPv/7N8Q==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mERoz-00A937-Sm; Fri, 13 Aug 2021 09:41:42 +0200
Message-ID: <347234b097eb93a0882ad2a3a209c2b7923ff611.camel@sipsolutions.net>
Subject: Re: [PATCH 39/64] mac80211: Use memset_after() to clear tx status
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, "David S. Miller"
 <davem@davemloft.net>,  Jakub Kicinski <kuba@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Keith Packard
 <keithpac@amazon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org,  linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com,  linux-hardening@vger.kernel.org
Date: Fri, 13 Aug 2021 09:41:40 +0200
In-Reply-To: <202107310852.551B66EE32@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-40-keescook@chromium.org>
 <202107310852.551B66EE32@keescook>
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

On Sat, 2021-07-31 at 08:55 -0700, Kees Cook wrote:
> 
> > @@ -278,9 +278,7 @@ static void carl9170_tx_release(struct kref *ref)
> >  	BUILD_BUG_ON(
> >  	    offsetof(struct ieee80211_tx_info, status.ack_signal) != 20);
> >  
> > 
> > -	memset(&txinfo->status.ack_signal, 0,
> > -	       sizeof(struct ieee80211_tx_info) -
> > -	       offsetof(struct ieee80211_tx_info, status.ack_signal));
> > +	memset_after(&txinfo->status, 0, rates);

FWIW, I think we should also remove the BUILD_BUG_ON() now in all the
places - that was meant to give people a hint to update if some field
ordering etc. changed, but now that it's "after rates" this is no longer
necessary.

johannes

