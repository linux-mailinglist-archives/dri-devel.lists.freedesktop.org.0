Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0D03EBBF5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 20:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38336E8C1;
	Fri, 13 Aug 2021 18:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F986E8C1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 18:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=rq6VfTjLJfvWeGU0hw3GUv7MRF3dGVPTx8dKGrBFFlo=; 
 t=1628878789; x=1630088389; b=JRnQtgxFlGTbMR5zX8JHDVgC1e4/VVVtObrwsdiEGJHr3gj
 fg6f7H4h4fej2RkzsnqdMZGvE/vYJPnL1VZ8yby4rwWCR+qSKffoUI2tdJC+Yb+l0wstYcHb0Fex6
 N7hmWtF+/sLXIWWCrLk4Fjc/ue3U+zbYwSw/uKyXXYDgJF0QGj9VCTIS8JG2+we5V+Nh/ZFoFbbgf
 cFPZzJ/2AOis1G3WLz74CCNFAeaaJ8aJ935yGQGUiBm3fQL6TNgFaK363Xta3zR94Lp4EMO4QodmD
 4mB/RYtmLIi3Ai2SoJFti5ot+ElHjq6gLx2BfsGOiAcP598P/1gE5JE1S5HHIfwA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mEbmM-00ALlG-5g; Fri, 13 Aug 2021 20:19:38 +0200
Message-ID: <465daabf002e098f0a24cf07f72a69d7e20c7440.camel@sipsolutions.net>
Subject: Re: [PATCH 39/64] mac80211: Use memset_after() to clear tx status
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>,  "Gustavo A. R. Silva" <gustavoars@kernel.org>, Keith
 Packard <keithpac@amazon.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-staging@lists.linux.dev, linux-block@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com, 
 linux-hardening@vger.kernel.org
Date: Fri, 13 Aug 2021 20:19:36 +0200
In-Reply-To: <202108130907.FD09C6B@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-40-keescook@chromium.org>
 <202107310852.551B66EE32@keescook>
 <bb01e784dddf6a297025981a2a000a4d3fdaf2ba.camel@sipsolutions.net>
 <202108130907.FD09C6B@keescook>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2021-08-13 at 09:08 -0700, Kees Cook wrote:
> > 
> > The common helper should also clear ack_signal, but that was broken by
> > commit e3e1a0bcb3f1 ("mac80211: reduce IEEE80211_TX_MAX_RATES"), because
> > that commit changed the order of the fields and updated carl9170 and p54
> > properly but not the common helper...
> 
> It looks like p54 actually uses the rates, which is why it does this
> manually. I can't see why carl9170 does this manually, though.

mac80211 also uses the rates later again on status reporting, it just
expects the # of attempts to be filled etc. I haven't looked at
carl9170, but I would expect it to do something there and do it
correctly, even though old it's a well-written driver and uses mac80211
rate control, so this would need to be correct for decent performance.

But I guess it could be that the helper could be used because the rates
were already handed to the firmware, and the code was just copy/pasted
from p54 (the drivers were, IIRC, developed by the same folks)

johannes

