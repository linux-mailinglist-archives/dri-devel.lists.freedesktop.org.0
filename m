Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4935E9165
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 09:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0953210E034;
	Sun, 25 Sep 2022 07:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FA410E034
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664090271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FnuW0+nquE7jeCs1wGd25t/HgD5sAtMc07QK9kih2sQ=;
 b=eL8jdSv/xP8oQepr+ntx2m95s3kpRqYEG83jh0sUhsB8ISjPX3cuUhXz5KU2U5SiWu/1lt
 5EfU7CMW4DX1uNXw2GdpY42DTZk6rGlJhM99J+wCGjV9F7JY5Zzu+e1ax4sfHE2vAKSqp3
 U8AnrRIOHIz2hv2hhrx5t56Po0ftAbk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-124-ba8vyfjxO3-gpv5wBoy4xQ-1; Sun, 25 Sep 2022 03:17:48 -0400
X-MC-Unique: ba8vyfjxO3-gpv5wBoy4xQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 g21-20020ac87d15000000b0035bb6f08778so2701731qtb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 00:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=FnuW0+nquE7jeCs1wGd25t/HgD5sAtMc07QK9kih2sQ=;
 b=zp9e+c1I+ebpQgBkZALeK73OguFFUD1AB4CzEgefPXpDqRSpTsPyDxpqxnYw3WIz57
 QaAYH+Xgtdn4setOamOTI/9ysgZCHEEnS2mzCm3DsQwvh+SAQR9cNfeQ+i+YRJj6o7aW
 ciSBgGS7EEYEbuFO/OEbt0J7ErCyrkK+HHPIkbYuCzdNq0ClQBchgNmrzw2kDSRmzfO7
 ID1/V1cqoq5HeWZYL+gKkloP5IbZYqU8vpr09yYjtI95wujocEYyrwFRwYbMemQpcXLY
 kKPAJSwNxpuJBI1196y7WGuoAyTEyq0V31KEWRQEvom5fSHHlMAW+7HT92/nLf97Hhz1
 HHdw==
X-Gm-Message-State: ACrzQf25bON+Uv+9uP+sOVqtsJsJqKX7OqtTRtyS08Z0RYRDghDS0+a3
 lwDZaIktmA1KhVR9G4RtG9Sdn0pwBkSPizHtqPQEnOBfyyAJUyikye6ov+xneljbfZvmtHAmdel
 WrMLKCAy4SS7b197oaAkaaSchEhmi
X-Received: by 2002:a05:620a:c8f:b0:6cb:e329:b5b9 with SMTP id
 q15-20020a05620a0c8f00b006cbe329b5b9mr10667199qki.95.1664090268102; 
 Sun, 25 Sep 2022 00:17:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4u6YF4dJIrwAN1QRZGgvTOpwH6qKYsc23O//LxYiiudu83+P6fv+LpA21i63RBBqqlayo//g==
X-Received: by 2002:a05:620a:c8f:b0:6cb:e329:b5b9 with SMTP id
 q15-20020a05620a0c8f00b006cbe329b5b9mr10667159qki.95.1664090267816; 
 Sun, 25 Sep 2022 00:17:47 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-97-96.dyn.eolo.it. [146.241.97.96])
 by smtp.gmail.com with ESMTPSA id
 bp30-20020a05620a459e00b006c479acd82fsm10375465qkb.7.2022.09.25.00.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 00:17:47 -0700 (PDT)
Message-ID: <e340d993bce8e1b2742fba52ac6383771cfaddae.camel@redhat.com>
Subject: Re: [PATCH v2 04/16] skbuff: Phase out ksize() fallback for frag_size
From: Paolo Abeni <pabeni@redhat.com>
To: Kees Cook <keescook@chromium.org>, Vlastimil Babka <vbabka@suse.cz>
Date: Sun, 25 Sep 2022 09:17:40 +0200
In-Reply-To: <20220923202822.2667581-5-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-5-keescook@chromium.org>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 linux-media@vger.kernel.org, Marco Elver <elver@google.com>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-09-23 at 13:28 -0700, Kees Cook wrote:
> All callers of APIs that allowed a 0-sized frag_size appear to be
> passing actual size information already

AFAICS, not yet:

drivers/net/ethernet/qlogic/qed/qed_ll2.c:
	skb = build_skb(buffer->data, 0); // -> __build_skb(..., 0) 
		// ->  __build_skb_around()

drivers/net/ethernet/broadcom/bnx2.c:
	skb = build_skb(data, 0);

I guess some more drivers have calls leading to 

	__build_skb_around(...,  0)

there are several call path to checks...


> , so this use of ksize() can
> be removed. However, just in case there is something still depending
> on this behavior, issue a WARN and fall back to as before to ksize()
> which means we'll also potentially get KASAN warnings.
> 
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  net/core/skbuff.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 0b30fbdbd0d0..84ca89c781cd 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -195,7 +195,11 @@ static void __build_skb_around(struct sk_buff *skb, void *data,
>  			       unsigned int frag_size)
>  {
>  	struct skb_shared_info *shinfo;
> -	unsigned int size = frag_size ? : ksize(data);
> +	unsigned int size = frag_size;
> +
> +	/* All callers should be setting frag size now? */
> +	if (WARN_ON_ONCE(size == 0))
> +		size = ksize(data);

At some point in the future, I guess we could even drop this check,
right?

Thanks!

Paolo

