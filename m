Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE14B3D9052
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 16:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683C56E59F;
	Wed, 28 Jul 2021 14:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4103C6E483
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 09:26:10 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9CE3A222EA;
 Wed, 28 Jul 2021 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627464368;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5viwOi0Ex8EMpcyt5fZAmdaE8zZE3JenBgOEfHjTO8U=;
 b=s2tZ7LKmgkhy+ZcYKXY0OMBdF6rgfEncaTSZK7ZE/m30LIKZxGFisayoitYrPoUKgQFilK
 JvtrvqLBc81t+lTUPqdiALN99CIl4lL5iiGoJzH4SmvIp9lTCLyWsuBMqJ5PpfanZxmV/N
 Ro/wN4dr9AdUz3PKRKyK9FUdOlBL5bs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627464368;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5viwOi0Ex8EMpcyt5fZAmdaE8zZE3JenBgOEfHjTO8U=;
 b=XqnccbRI7Ba90MUmDKttFQTuMWonwuyX1swzv/h7m5E54hesuDgaFK/aI8UPg+OaZi/FOS
 XAEigI499ra4OLDQ==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id 8903AA3B8C;
 Wed, 28 Jul 2021 09:26:08 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id C207DDA8CC; Wed, 28 Jul 2021 11:23:23 +0200 (CEST)
Date: Wed, 28 Jul 2021 11:23:23 +0200
From: David Sterba <dsterba@suse.cz>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 02/64] mac80211: Use flex-array for radiotap header bitmap
Message-ID: <20210728092323.GW5047@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Dan Carpenter <dan.carpenter@oracle.com>,
 Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org,
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
 <20210728073556.GP1931@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728073556.GP1931@kadam>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Mailman-Approved-At: Wed, 28 Jul 2021 14:22:24 +0000
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, linux-hardening@vger.kernel.org,
 netdev@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 10:35:56AM +0300, Dan Carpenter wrote:
> @@ -372,7 +372,7 @@ ieee80211_add_rx_radiotap_header(struct ieee80211_local *local,
>  			ieee80211_calculate_rx_timestamp(local, status,
>  							 mpdulen, 0),
>  			pos);
> -		rthdr->it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);
> +		rthdr->data.it_present |= cpu_to_le32(1 << IEEE80211_RADIOTAP_TSFT);

A drive-by comment, not related to the patchset, but rather the
ieee80211 driver itself.

Shift expressions with (1 << NUMBER) can be subtly broken once the
NUMBER is 31 and the value gets silently cast to a 64bit type. It will
become 0xfffffffff80000000.

I've checked the IEEE80211_RADIOTAP_* defintions if this is even remotely
possible and yes, IEEE80211_RADIOTAP_EXT == 31. Fortunatelly it seems to
be used with used with a 32bit types (eg. _bitmap_shifter) so there are
no surprises.

The recommended practice is to always use unsigned types for shifts, so
"1U << ..." at least.
