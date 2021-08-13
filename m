Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786C3EB22B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 10:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939236E550;
	Fri, 13 Aug 2021 08:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1437 seconds by postgrey-1.36 at gabe;
 Fri, 13 Aug 2021 08:04:15 UTC
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0696E550
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=9+EPWKLBRJolwP8aFlJWDp26AmwHK39v/QqkRv5Vil8=; 
 t=1628841855; x=1630051455; b=tgFbD+/vajI0aJNefR2w77D2eLoeqahVwHhY8hEADtT39jc
 4/XzN/x9ZEUylIQrtHDqyh7QzggoBvQ5Fa/BElsMBvrE9GlEFjDetyNu8vQJ8U5+n2dN4w6MV/YR0
 ++YVI9saK3JRazHKXVEG5EzPtlNxtPO2dJNUcpxClXTUpCNN7XH1qzHkhJ/LoOnHhWO/Cyj3a7CDS
 JM69yTqZpLnbUf1ASIMDSeLVAV5/C9laKTypfd4IRe/U+YnakE0O4WL3UtBO5SSfJ1kS/81MMRAXh
 AqOBL6iOESwSNZuZxHwk3gjvIuYD8zT3nMKlo/BEwUjP7fo89ikhX3Hu/FPRoKWw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mESAk-00A9Tn-Sj; Fri, 13 Aug 2021 10:04:11 +0200
Message-ID: <a9c8ae9e05cfe2679cd8a7ef0ab20b66cf38b930.camel@sipsolutions.net>
Subject: Re: [PATCH 10/64] lib80211: Use struct_group() for memcpy() region
From: Johannes Berg <johannes@sipsolutions.net>
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Keith Packard
 <keithpac@amazon.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org,  linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com
Date: Fri, 13 Aug 2021 10:04:09 +0200
In-Reply-To: <20210727205855.411487-11-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-11-keescook@chromium.org>
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

On Tue, 2021-07-27 at 13:58 -0700, Kees Cook wrote:
> 
> +++ b/include/linux/ieee80211.h
> @@ -297,9 +297,11 @@ static inline u16 ieee80211_sn_sub(u16 sn1, u16 sn2)
>  struct ieee80211_hdr {
>  	__le16 frame_control;
>  	__le16 duration_id;
> -	u8 addr1[ETH_ALEN];
> -	u8 addr2[ETH_ALEN];
> -	u8 addr3[ETH_ALEN];
> +	struct_group(addrs,
> +		u8 addr1[ETH_ALEN];
> +		u8 addr2[ETH_ALEN];
> +		u8 addr3[ETH_ALEN];
> +	);
>  	__le16 seq_ctrl;
>  	u8 addr4[ETH_ALEN];
>  } __packed __aligned(2);

This file isn't really just lib80211, it's also used by everyone else
for 802.11, but I guess that's OK - after all, this doesn't really
result in any changes here.

> +++ b/net/wireless/lib80211_crypt_ccmp.c
> @@ -136,7 +136,8 @@ static int ccmp_init_iv_and_aad(const struct ieee80211_hdr *hdr,
>  	pos = (u8 *) hdr;
>  	aad[0] = pos[0] & 0x8f;
>  	aad[1] = pos[1] & 0xc7;
> -	memcpy(aad + 2, hdr->addr1, 3 * ETH_ALEN);
> +	BUILD_BUG_ON(sizeof(hdr->addrs) != 3 * ETH_ALEN);
> +	memcpy(aad + 2, &hdr->addrs, ETH_ALEN);


However, how is it you don't need the same change in net/mac80211/wpa.c?

We have three similar instances:

        /* AAD (extra authenticate-only data) / masked 802.11 header
         * FC | A1 | A2 | A3 | SC | [A4] | [QC] */
        put_unaligned_be16(len_a, &aad[0]);
        put_unaligned(mask_fc, (__le16 *)&aad[2]);
        memcpy(&aad[4], &hdr->addr1, 3 * ETH_ALEN);


and

        memcpy(&aad[4], &hdr->addr1, 3 * ETH_ALEN);

and

        memcpy(aad + 2, &hdr->addr1, 3 * ETH_ALEN);

so those should also be changed, it seems?

In which case I'd probably prefer to do this separately from the staging
drivers ...

johannes

