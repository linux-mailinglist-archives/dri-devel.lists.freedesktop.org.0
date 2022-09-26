Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B627C5E978A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 02:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3D210E4B0;
	Mon, 26 Sep 2022 00:41:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23310E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 00:41:26 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso5210724pjm.5
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 17:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=Ee6jY7viFUfMjAsx1AOZFi9ykD0TZlKjDDVt7+BAWpA=;
 b=Tymc3mQ6yYtKo/fUwb0pntTGEsuDmA3KGe5ZainSrzJcqfvTUXGD6g4AS/QDrdEz1m
 IPp9Tld0kqL2gFrY1NTkahNxDsLTe8rCfVZ7Sf6Yy58l+LrHh3LtaZFzBUsKT5oECTI8
 ASxk03BGu9JGtTcAH5Y41r1unU3COw5iwE/sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ee6jY7viFUfMjAsx1AOZFi9ykD0TZlKjDDVt7+BAWpA=;
 b=qv59oF9BHtuZJkqxCHAnuNb+NT95EmIDHwBgiera9TgXIgamR8snY9s3TF2gy9L3fj
 BZHaVhHwfGPX+UPFnezaFMN9IH7oNj4PoaC35LOuP7YG0KHdvhg6Yvqg8jZjVKArnawP
 JsqysTqskguytLkXcBusNHrUn07ecu3qFecLbuIHZN6HZgAIZ7LkgB2lSmbVQozo7mC8
 Zwm2s8gye8J1Z06fnEMwvLvZetMukRAQrQ9v5pG41UjxOVk3ZEe8Uv+8yCgWwCRgV5va
 yDRiUmlXiW+7dM+1Yrh++8GmObMWquNwj9jpFtbnbxhyR2E2MzBzT+dMMCnIFRjHx1C8
 9qTg==
X-Gm-Message-State: ACrzQf0aGdVXMAJ2RPmB2jZ2I/TyyB+CUr4/DHGekfqLNQJktUvNv8jj
 Lo3cnIualY80WL4ad5jJgKIrDA==
X-Google-Smtp-Source: AMsMyM5VpMx54A01n2IxbeNYegjZcGYyyX6uNC/69UJfyYAh5+QLjokwGVSlu1kDsKsMHY6BwDZQuA==
X-Received: by 2002:a17:902:ea0e:b0:178:3d49:45ad with SMTP id
 s14-20020a170902ea0e00b001783d4945admr19810833plg.103.1664152885590; 
 Sun, 25 Sep 2022 17:41:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a622507000000b0053ebafa7c42sm10576331pfl.79.2022.09.25.17.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 17:41:24 -0700 (PDT)
Date: Sun, 25 Sep 2022 17:41:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v2 04/16] skbuff: Phase out ksize() fallback for frag_size
Message-ID: <202209251738.2E6B9C29D@keescook>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-5-keescook@chromium.org>
 <e340d993bce8e1b2742fba52ac6383771cfaddae.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e340d993bce8e1b2742fba52ac6383771cfaddae.camel@redhat.com>
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
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 25, 2022 at 09:17:40AM +0200, Paolo Abeni wrote:
> On Fri, 2022-09-23 at 13:28 -0700, Kees Cook wrote:
> > All callers of APIs that allowed a 0-sized frag_size appear to be
> > passing actual size information already
> 
> AFAICS, not yet:
> 
> drivers/net/ethernet/qlogic/qed/qed_ll2.c:
> 	skb = build_skb(buffer->data, 0); // -> __build_skb(..., 0) 
> 		// ->  __build_skb_around()
> 
> drivers/net/ethernet/broadcom/bnx2.c:
> 	skb = build_skb(data, 0);
> 
> I guess some more drivers have calls leading to 
> 
> 	__build_skb_around(...,  0)
> 
> there are several call path to checks...

Ah-ha! Thank you. I will try to hunt these down -- I think we can't
remove the "secret resizing" effect of ksize() without fixing these.

> > [...]
> > diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> > index 0b30fbdbd0d0..84ca89c781cd 100644
> > --- a/net/core/skbuff.c
> > +++ b/net/core/skbuff.c
> > @@ -195,7 +195,11 @@ static void __build_skb_around(struct sk_buff *skb, void *data,
> >  			       unsigned int frag_size)
> >  {
> >  	struct skb_shared_info *shinfo;
> > -	unsigned int size = frag_size ? : ksize(data);
> > +	unsigned int size = frag_size;
> > +
> > +	/* All callers should be setting frag size now? */
> > +	if (WARN_ON_ONCE(size == 0))
> > +		size = ksize(data);
> 
> At some point in the future, I guess we could even drop this check,
> right?

Alternatively, we might be able to ask the slab if "data" came from
kmalloc or a kmem_cache, and if the former, do:

	data = krealloc(kmalloc_size_roundup(ksize(data), ...)

But that seems ugly...

-- 
Kees Cook
