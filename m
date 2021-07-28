Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 736273D972A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 23:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7704C6E14B;
	Wed, 28 Jul 2021 21:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15FF6E14B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 21:01:26 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso5984607pjo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=v4TsexyUVtPmnWQp8z0vQybdqGDFJ+IKH3X3D8imsE4=;
 b=hg+gKirQh4CStWcllp3dCMDGaMydMxkrfDz7dI28grfxRHealC37a8xJDfYI0FVrQZ
 2tYUG05gAJbnL7ZSiMGxXN0BbgqYaSHUyURFCYtvwZV0Mx+omFId8CJj1UovnV0ee9cA
 66wsvWC92AbI6ez9cGn13eYUvZ7XhoUJQlPzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=v4TsexyUVtPmnWQp8z0vQybdqGDFJ+IKH3X3D8imsE4=;
 b=cnURQRJzof7QkNrMT6dXY19003owtRGonRuvk6nhzt2eH4PGC2maRRBYd1jnu66OH/
 oexStjUM3MW0ZRlcOcrP2kDad9w5vfPO6AjnlR42HecKMpeZPawsoaa9q7ZMsW5jsnT4
 1Q4TAbqkAQLqefXHHWyfGZDHFBFkQdfwi8znh8c1FzsHsvDDXvkZZJJAvP/4LKuu4gUA
 n46z6gP+EGFqDJZ5Jra4TXRoHTYeEPH9eLRYDlTJi0wrJ8IqI0pYPCozr9ab/SBUsDr+
 ai8oa5PFzMZa5lQqW/FbUhOuMOPRlTQbG5lY6uEzk0T0mIUHyj/vhWs/BMFCNiip98YY
 GcZQ==
X-Gm-Message-State: AOAM5300e08UIgm8QZtRVD+KNb+YKQl3OBfRqIxtIs945V/bFH5SYEoG
 s06pAh2Qt52khW2KWd3VU/6ulg==
X-Google-Smtp-Source: ABdhPJzkF5cilzb73BCpcxICFq3XUeRAJh6fZICuqCaVMVL6bCDUAwLUBtlkfh9/lXbLB+5T11D9+w==
X-Received: by 2002:a17:902:d717:b029:12c:1653:d611 with SMTP id
 w23-20020a170902d717b029012c1653d611mr1508273ply.51.1627506086388; 
 Wed, 28 Jul 2021 14:01:26 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t3sm932392pfd.153.2021.07.28.14.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 14:01:25 -0700 (PDT)
Date: Wed, 28 Jul 2021 14:01:24 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 19/64] ip: Use struct_group() for memcpy() regions
Message-ID: <202107281358.8E12638@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-20-keescook@chromium.org>
 <YQDxaYrHu0PeBIuX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQDxaYrHu0PeBIuX@kroah.com>
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
Cc: linux-kbuild@vger.kernel.org, netdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-block@vger.kernel.org,
 clang-built-linux@googlegroups.com, Keith Packard <keithpac@amazon.com>,
 linux-hardening@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 07:55:53AM +0200, Greg Kroah-Hartman wrote:
> >  struct ethhdr {
> > -	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
> > -	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
> > +	union {
> > +		struct {
> > +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
> > +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
> > +		};
> > +		struct {
> > +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
> > +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
> > +		} addrs;
> 
> A union of the same fields in the same structure in the same way?
> 
> Ah, because struct_group() can not be used here?  Still feels odd to see
> in a userspace-visible header.

Yeah, there is some inconsistency here. I will clean this up for v2.

Is there a place we can put kernel-specific macros for use in UAPI
headers? (I need to figure out where things like __kernel_size_t get
defined...)

-- 
Kees Cook
