Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3185E67CB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 17:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BDA10E0C9;
	Thu, 22 Sep 2022 15:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DB810E0C9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 15:57:48 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 q35-20020a17090a752600b002038d8a68fbso2888850pjk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 08:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=DFca6W2geua6z8QZaei3L7obYL69ycUV+0eXMSxJFmM=;
 b=jvl2IXIRx3EhOhhqaTOf5Lt+fk9xx9Irq6xcu/7k7oCaAudZivnlCg4zfyCIBsgQa9
 qBtVWGjfuRNfAqWNaj6IsSNxrO0lvCUNMMis5T9m3env78npe1AQYwW4n7mGlSRQHwQP
 cG9vbxRd7c25yIHtYw1xafxyLneU1vdiRP2x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=DFca6W2geua6z8QZaei3L7obYL69ycUV+0eXMSxJFmM=;
 b=DhDJjcZR48N7TH444idhHe3rVymfFytV1IQtf2pXAa39Cy4MZ44+z3Quztdbk4CwuP
 q++k53bw/zEqe9CVwb0PiJ0u4kbu/g2YnXE+6v/4uwrSk3QVS4zrZCKHL4NTGKnDXpMv
 xV/wYCg8Sph6Ofs4waV4EeqVVauYUaVVUahOi1iHd1HzrPjYppG1P+0Z82f1YtMZacF0
 4e2njXZgAfL2C7b9jCYz2fOxG1CI07iEcdx16kV/S/OiIGp5d+srfUtv+ON7vzn2fCi8
 RddxZC3qJQdMzNec9+cXA69TEbf2N4p9A0yZMMkFfNg4LAiIdbzlSQ2jILboAhO+Ttsy
 jg7g==
X-Gm-Message-State: ACrzQf08Q0+u7qn2BzdHISQNh3vyau2M5EwX+IvDNXyIf1Z9lvjgip0S
 TPaINnJmgFSJE26DI49BpVMOnA==
X-Google-Smtp-Source: AMsMyM4DbOcH8T52s44Y0t4Ur0sebk5QTw9RJNQKJ+FFAkxJV0gLFIOVmBX/n1oFJJpAp4+llFExqQ==
X-Received: by 2002:a17:902:e848:b0:176:c746:1f69 with SMTP id
 t8-20020a170902e84800b00176c7461f69mr3892270plg.125.1663862268452; 
 Thu, 22 Sep 2022 08:57:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 p63-20020a625b42000000b005367c28fd32sm4575617pfb.185.2022.09.22.08.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 08:57:47 -0700 (PDT)
Date: Thu, 22 Sep 2022 08:57:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Alex Elder <elder@ieee.org>
Subject: Re: [PATCH 03/12] net: ipa: Proactively round up to kmalloc bucket
 size
Message-ID: <202209220857.A6EBCF031E@keescook>
References: <20220922031013.2150682-1-keescook@chromium.org>
 <20220922031013.2150682-4-keescook@chromium.org>
 <4d75a9fd-1b94-7208-9de8-5a0102223e68@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d75a9fd-1b94-7208-9de8-5a0102223e68@ieee.org>
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
Cc: linux-wireless@vger.kernel.org, Jacob Shin <jacob.shin@amd.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, Jakub Kicinski <kuba@kernel.org>,
 David Sterba <dsterba@suse.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Vlastimil Babka <vbabka@suse.cz>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 08:45:19AM -0500, Alex Elder wrote:
> On 9/21/22 10:10 PM, Kees Cook wrote:
> > Instead of discovering the kmalloc bucket size _after_ allocation, round
> > up proactively so the allocation is explicitly made for the full size,
> > allowing the compiler to correctly reason about the resulting size of
> > the buffer through the existing __alloc_size() hint.
> > 
> > Cc: Alex Elder <elder@kernel.org>
> > Cc: "David S. Miller" <davem@davemloft.net>
> > Cc: Eric Dumazet <edumazet@google.com>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Paolo Abeni <pabeni@redhat.com>
> > Cc: netdev@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >   drivers/net/ipa/gsi_trans.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/net/ipa/gsi_trans.c b/drivers/net/ipa/gsi_trans.c
> > index 18e7e8c405be..cec968854dcf 100644
> > --- a/drivers/net/ipa/gsi_trans.c
> > +++ b/drivers/net/ipa/gsi_trans.c
> > @@ -89,6 +89,7 @@ int gsi_trans_pool_init(struct gsi_trans_pool *pool, size_t size, u32 count,
> >   			u32 max_alloc)
> >   {
> >   	void *virt;
> > +	size_t allocate;
> 
> I don't care about this but the reverse Christmas tree
> convention would put the "allocate" variable definition
> above "virt".

Oops, yes; thank you!

-Kees

-- 
Kees Cook
