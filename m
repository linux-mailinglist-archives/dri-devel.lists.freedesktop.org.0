Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A25E820C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 20:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3585A10E011;
	Fri, 23 Sep 2022 18:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7582610E011
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 18:50:39 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id a29so971984pfk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 11:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=soz+B5vr0YawBrGLCJUIfst1rVPegj/kO945i6tNuu4=;
 b=OTfy5Nwpn08IcUaVlU1KJ27X+N3yWZ/VpCrAZjSpjUbsjTe/slddbrLCSNWyrUEUf+
 hKFo3f2nFf90BAG6jEHb+7lo8EJfEwNPirhgwBNLji96jC6KqEyl6t0+uMZVhfPqRt/6
 nRku1i36Slqm6llnH2++9t4exlSoETdRFUkh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=soz+B5vr0YawBrGLCJUIfst1rVPegj/kO945i6tNuu4=;
 b=x9EktM9CsYWNQj9fy7od+KUsbTVtO2/nLBD4ofXkmE5K2qrMbGZeIMJfKh7uf1V4hc
 lPj5aQln4joDEX1XbE2D9+Ojf4CveGbSt9HOC1EtpBoipNnf7MUSsgmD120CZmJrVzeh
 hD5bEhN9xYhr5uU5BO/SZ6qQq0R+VK2v4LzO7ptJRsK9Xx0njXzlVD1o6IaX9FVJXQMQ
 cmz9CVp781bNv4CnkgDjgMqMuoavXDL7WSUr4mi9OTxNwutICc5wrbTx0YXq28/mq1Gt
 ElGqpOkdq9wDW4M4XYxiYoFbDcutSsdT8Ly6j6fQ3eIGo0QBkILJ2eLZP5SdsAJUsrJ3
 sfgg==
X-Gm-Message-State: ACrzQf21myaIm+hF8iM/f7CZieEPNuHXZCQSDGQUp/ls4X87ijDP9QM2
 ia+Ywx77Va5fjthVV8yyE/oRXw==
X-Google-Smtp-Source: AMsMyM5BOkxT7dmLhP+9f8RXqZTh1AjF61zhu3wqGKFHMmPuMGgEdboAX7cqSq5H5AVVbN7wJUrI2g==
X-Received: by 2002:a63:6a47:0:b0:439:be00:7607 with SMTP id
 f68-20020a636a47000000b00439be007607mr8719395pgc.301.1663959039042; 
 Fri, 23 Sep 2022 11:50:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170902ce8d00b0016dc6279ab7sm6423837plg.149.2022.09.23.11.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 11:50:38 -0700 (PDT)
Date: Fri, 23 Sep 2022 11:50:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Feng Tang <feng.tang@intel.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 01/12] slab: Introduce kmalloc_size_roundup()
Message-ID: <202209231145.7654767ED5@keescook>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-2-keescook@chromium.org>
 <YyxDFfKmSNNkHBFi@hyeyoo> <Yy0JJV4c3DffCF+4@feng-clx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yy0JJV4c3DffCF+4@feng-clx>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Eric Dumazet <edumazet@google.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "dev@openvswitch.org" <dev@openvswitch.org>, "x86@kernel.org" <x86@kernel.org>,
 "Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 David Rientjes <rientjes@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Yonghong Song <yhs@fb.com>, Paolo Abeni <pabeni@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Christian K??nig <christian.koenig@amd.com>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 09:17:25AM +0800, Feng Tang wrote:
> On Thu, Sep 22, 2022 at 07:12:21PM +0800, Hyeonggon Yoo wrote:
> > On Wed, Sep 21, 2022 at 08:10:02PM -0700, Kees Cook wrote:
> > > [...]
> > > Introduce kmalloc_size_roundup(), to serve this function so we can start
> > > replacing the "anticipatory resizing" uses of ksize().
> > [...]
> >
> > This looks okay.
> > [...]
> > Cc-ing Feng Tang who may welcome this series ;)
>  
> Indeed! This will help our work of extending slub redzone check,
> as we also ran into some trouble with ksize() users when extending
> the redzone support to this extra allocated space than requested
> size [1], and have to disable the redzone sanity for all ksize()
> users [2].
> 
> [1]. https://lore.kernel.org/lkml/20220719134503.GA56558@shbuild999.sh.intel.com/
> [2]. https://lore.kernel.org/lkml/20220913065423.520159-5-feng.tang@intel.com/

Thanks for the feedback! I'll send my v2 series -- I'm hoping at least
this patch can land in v6.1 so the various other patches would be clear
to land via their separate trees, etc.

-- 
Kees Cook
