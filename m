Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC27E2E79
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DF610E418;
	Mon,  6 Nov 2023 20:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [IPv6:2607:f8b0:4864:20::64a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275310E418
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:56:41 +0000 (UTC)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-1cc42d3f61eso39658885ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699304201; x=1699909001;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=arPwDeCFdRaC5606yGK22eodQyXfqpKFdElw4+wOp+Y=;
 b=Grk+++4I46ML0xBBXTsHSiJBLgjG3eKC/xM7O+EwqQHeb6UCW5jnxcyJGYKnHzAdwF
 XPxZS1fN3Vc5ckEf7EJwvWWMtC3jjWIqozuYqrPq1s8DWdi61nYzYprz34xkq+g/Y3Ar
 ssJx3+iLkcbJdQPGyoj6pzRhO0P/PMPNPOBgL2lNasR3t1DmkAU7HF7tV8LwivijdbTc
 fRWo983zOoo3fOWUzISoOtTGdSvhH5MD4WV7UrKNDV+NwUHpmkim0XGRHUXddbzLjNKE
 WluXFF+Ct7eZojxzFRuJyuKubWi08Fw7Iz4FhLwNUA6Xl16SdcQfqOqYWxqkxcJXQ03h
 vOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699304201; x=1699909001;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=arPwDeCFdRaC5606yGK22eodQyXfqpKFdElw4+wOp+Y=;
 b=wVYktArsg0bYIQdvRNHDQyAvoZk8kgDFd6cKdd1egydJeuCZKkhxEriDhmXvwAoOvN
 8M9vFretQKFJoYSu6HJqFFsVvGQ1ZphL6nIPSk1Zzqycx+SLPqbZqlhvH9dahnZaTGr2
 x72LlRo7MWkVnV8zJfYD75KD3MaHGxRzvjHLVc8TNgv/T5Zw1arLpHmi60p73Bzn50+X
 g6Kq2xvTBXNW6Wax7WJLKRJ3rcbyohsyxmzItxBnVOukoUgv0D+Ogj2gNSmmSQsKfs79
 iUSBrujlT0z59MqhtXALNUKAiHHZ5XKmg9n25lKrv6TJfFwj5hStnvR80QMt9gvWdh3b
 hTGg==
X-Gm-Message-State: AOJu0YxSS8+jLrJM2KEhxNpag/mUBdWii2bHPYp2Xkue8pAm9A6DthRt
 V9FIv+FcEsXcrc/7OeAjsh9QFFM=
X-Google-Smtp-Source: AGHT+IH5YcYILA3SRp5xgCugD4rJNBs/UUciPiEsDuN9TZoTiWvh1fdpijNAL37ojAOMtIu1NnLdA0s=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a17:902:ed42:b0:1cc:446c:7701 with SMTP id
 y2-20020a170902ed4200b001cc446c7701mr419825plb.12.1699304201375; Mon, 06 Nov
 2023 12:56:41 -0800 (PST)
Date: Mon, 6 Nov 2023 12:56:39 -0800
In-Reply-To: <20231106024413.2801438-10-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
Message-ID: <ZUlTB5diiytEK-Mh@google.com>
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

[..]
 
> -	snaplen = skb->len;
> +	snaplen = skb_frags_not_readable(skb) ? skb_headlen(skb) : skb->len;
>  
>  	res = run_filter(skb, sk, snaplen);
>  	if (!res)
> @@ -2279,7 +2279,7 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
>  		}
>  	}
>  
> -	snaplen = skb->len;
> +	snaplen = skb_frags_not_readable(skb) ? skb_headlen(skb) : skb->len;
>  
>  	res = run_filter(skb, sk, snaplen);
>  	if (!res)

Not sure it covers 100% of bpf. We might need to double-check bpf_xdp_copy_buf
which is having its own, non-skb shinfo and frags. And in general, xdp
can reference those shinfo frags early... (xdp part happens
before we create an skb with all devmem association)
