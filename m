Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3ED7E2C3F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 19:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9C710E3C0;
	Mon,  6 Nov 2023 18:48:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3D710E3C0
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 18:47:58 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-da07b5e6f75so4604473276.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 10:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699296478; x=1699901278;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xfYGvt6skLkznGwiqZd9de4cpoKtWczhZA3SDzBtHOk=;
 b=ral85OuAbsdsuaXeX/egF0l+5J8YwYzoeu/Hb18qzVGOF1xp9a2Cj0hdMW5ElJZF36
 AtB7gDcNtIZbWBeiwpnjFxGLlGBJ6XrUFOsrVVY2gpH779zFxotC5NZWn23H4Q+2/dlc
 CXtL5CO9ayEai3oC6Gw9YodmeSIZNHtuykphKv5ykwEQC/OmAO/JuzyApd71h+2v54tX
 wIrSdYWhfbsc95/0+t+dUiC0tsTX9DGS9rR3pKEkmBQqKEXpE7+Nm/xrYuaf2rs4cBMj
 kxC5bU+Y9UJqDK5ZbsbFziVcJ8v5Kn7pASAZSSSE84XqjpW1bHAsO2ba/5XxAfziogz3
 fOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699296478; x=1699901278;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfYGvt6skLkznGwiqZd9de4cpoKtWczhZA3SDzBtHOk=;
 b=N7eaAqCFW6V5U+o9JaSiAGR9fKdDJzLA1d9i0a+9B1qZvUpBiURdBNz3rkXkJp7Ydj
 CgQJIzitmn4ZUrD5xVzq+uQFQbAUPNJkRBJEZEk7LVjc4xJME6DQv+QUGbumMQuVCP58
 Zvw5tBi34JuoKvKnm86v48w+UdkEyU0lqQlON30aQ1n/RO0Syfto3h88fSp/a4LS49fb
 Ov4U6dP4DfqM79LRTNm1vaZ7pLw7CLVAzE71Ae6KlZpB7zRQr+amSgST2zdtHMQiB12P
 2hlCXJvn/XabOQWBLm78ryKXfVRACmpkbdIORlPkxvz8WCDDZu534M/s7gF+gHinzZdI
 Lx2g==
X-Gm-Message-State: AOJu0YxCdWp/m4AGzdWsPMDmY6KRCx7Cw7W/cMM1TMAvGlH9TP0/XQC3
 u6Z2tCcBOREBQtAcYVINsHyz4S4=
X-Google-Smtp-Source: AGHT+IGUJ2l90Skjb6Eo4Ej5QS91AxRpSBX/C4tSPBp5d8CEeFQv1G9sZ0kIa3LYlCMauqPUFev8brw=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a25:d308:0:b0:da0:c924:4fdc with SMTP id
 e8-20020a25d308000000b00da0c9244fdcmr7631ybf.6.1699296478090; Mon, 06 Nov
 2023 10:47:58 -0800 (PST)
Date: Mon, 6 Nov 2023 10:47:56 -0800
In-Reply-To: <20231106024413.2801438-10-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
Message-ID: <ZUk03DhWxV-bOFJL@google.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
From: Stanislav Fomichev <sdf@google.com>
To: Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/05, Mina Almasry wrote:
> For device memory TCP, we expect the skb headers to be available in host
> memory for access, and we expect the skb frags to be in device memory
> and unaccessible to the host. We expect there to be no mixing and
> matching of device memory frags (unaccessible) with host memory frags
> (accessible) in the same skb.
> 
> Add a skb->devmem flag which indicates whether the frags in this skb
> are device memory frags or not.
> 
> __skb_fill_page_desc() now checks frags added to skbs for page_pool_iovs,
> and marks the skb as skb->devmem accordingly.
> 
> Add checks through the network stack to avoid accessing the frags of
> devmem skbs and avoid coalescing devmem skbs with non devmem skbs.
> 
> Signed-off-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
>  include/linux/skbuff.h | 14 +++++++-
>  include/net/tcp.h      |  5 +--
>  net/core/datagram.c    |  6 ++++
>  net/core/gro.c         |  5 ++-
>  net/core/skbuff.c      | 77 ++++++++++++++++++++++++++++++++++++------
>  net/ipv4/tcp.c         |  6 ++++
>  net/ipv4/tcp_input.c   | 13 +++++--
>  net/ipv4/tcp_output.c  |  5 ++-
>  net/packet/af_packet.c |  4 +--
>  9 files changed, 115 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 1fae276c1353..8fb468ff8115 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -805,6 +805,8 @@ typedef unsigned char *sk_buff_data_t;
>   *	@csum_level: indicates the number of consecutive checksums found in
>   *		the packet minus one that have been verified as
>   *		CHECKSUM_UNNECESSARY (max 3)
> + *	@devmem: indicates that all the fragments in this skb are backed by
> + *		device memory.
>   *	@dst_pending_confirm: need to confirm neighbour
>   *	@decrypted: Decrypted SKB
>   *	@slow_gro: state present at GRO time, slower prepare step required
> @@ -991,7 +993,7 @@ struct sk_buff {
>  #if IS_ENABLED(CONFIG_IP_SCTP)
>  	__u8			csum_not_inet:1;
>  #endif
> -
> +	__u8			devmem:1;
>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
>  	__u16			tc_index;	/* traffic control index */
>  #endif
> @@ -1766,6 +1768,12 @@ static inline void skb_zcopy_downgrade_managed(struct sk_buff *skb)
>  		__skb_zcopy_downgrade_managed(skb);
>  }
>  
> +/* Return true if frags in this skb are not readable by the host. */
> +static inline bool skb_frags_not_readable(const struct sk_buff *skb)
> +{
> +	return skb->devmem;

bikeshedding: should we also rename 'devmem' sk_buff flag to 'not_readable'?
It better communicates the fact that the stack shouldn't dereference the
frags (because it has 'devmem' fragments or for some other potential
future reason).
