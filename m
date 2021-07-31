Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302473DC68B
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 17:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316F6E15D;
	Sat, 31 Jul 2021 15:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B506E15D
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 15:10:22 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id t21so14562214plr.13
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 08:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lfME4cjM5NCmgici7VQUeLVxABhRdomGydOStVoPzx4=;
 b=L1DNvP8P4y6KQNKh86u6z0gd+tOQyO7mJoJt8B2bk6sGD8lMj6Noy13eCNQYPK3Dgy
 aDVIvQEK9ubu5kah/3TCTRHCNGkVaZuPiLrC8xqR8E3ktJaFvicJZgoCG3Pk4ob+PTGz
 EpAjtcymW/wEeRKic3KicM0N2mM2qfw23QKRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lfME4cjM5NCmgici7VQUeLVxABhRdomGydOStVoPzx4=;
 b=Y1U+KBsX7VxX/wn6VbS54fwMzFdW0G9G1LSWqaa24mQOzCTy0QmHScB8EsCPx4XQq5
 FHeQa2KdEH1+u72Zu4fAoU2UY6n3Xsv4TMbHR9SuD5pbqyLZZzCAmWEE9U68nYl0Y0ex
 O/cCS0wHm5o8OUSDAH9b4QFTZhKApJeekAN1x3FBendC+PyEbTFfoSHtHxEGwGTO5cWS
 a+OkWJZw9yo4iw8okP6VHFCwveex4bGA/IPIMmA2EX73zYwQLKJoSer0TpVmxjMzhTEA
 pfE/jKYBeabhkXoFwNIFXXAcXFbzTHIZ/lr/ZXSj6K7i8tP97JPuSozkJ1Khqt+NKBWt
 IovA==
X-Gm-Message-State: AOAM530NpInXEbkMAaYmQjM9A192ycvxo4PLIDqYMUy8FQBHRuiTyg4z
 lB75cp4Z4PQli7Q8dhD6p8iTnw==
X-Google-Smtp-Source: ABdhPJyHVa4d8FlEw//xZVgbZjv62jZZqTBJVRdefEHg8GdXxlxk+maNXdDjshUpKLrxricctBpEKw==
X-Received: by 2002:a05:6a00:1488:b029:332:5e67:1198 with SMTP id
 v8-20020a056a001488b02903325e671198mr8347873pfu.9.1627744222329; 
 Sat, 31 Jul 2021 08:10:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n1sm891630pgt.63.2021.07.31.08.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 08:10:21 -0700 (PDT)
Date: Sat, 31 Jul 2021 08:10:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: "Williams, Dan J" <dan.j.williams@intel.com>, keithpac@amazon.com,
 clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-hardening@vger.kernel.org,
 gustavoars@kernel.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org
Subject: Re: [PATCH 04/64] stddef: Introduce struct_group() helper macro
Message-ID: <202107310806.CD5D546DB7@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-5-keescook@chromium.org>
 <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
 <202107281456.1A3A5C18@keescook>
 <1d9a2e6df2a9a35b2cdd50a9a68cac5991e7e5f0.camel@intel.com>
 <202107301952.B484563@keescook>
 <CAKwiHFheDv2pwsm6Fa+-KnOFyvk7bfZQjb2BQ-CSwH61gxgVYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwiHFheDv2pwsm6Fa+-KnOFyvk7bfZQjb2BQ-CSwH61gxgVYg@mail.gmail.com>
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

On Sat, Jul 31, 2021 at 07:24:44AM +0200, Rasmus Villemoes wrote:
> On Sat, Jul 31, 2021, 04:59 Kees Cook <keescook@chromium.org> wrote:
> 
> > On Fri, Jul 30, 2021 at 10:19:20PM +0000, Williams, Dan J wrote:
> > > On Wed, 2021-07-28 at 14:59 -0700, Kees Cook wrote:
> >
> > >  /**
> > >   * struct_group(NAME, MEMBERS)
> > >   *
> > > @@ -67,7 +73,10 @@ enum {
> > >   * @NAME: The name of the mirrored sub-struct
> > >   * @MEMBERS: The member declarations for the mirrored structs
> > >   */
> > > -#define struct_group(NAME, MEMBERS)    \
> > > +#define struct_group(NAME, MEMBERS...) \
> > >         struct_group_attr(NAME, /* no attrs */, MEMBERS)
> > >
> > > +#define struct_group_typed(TYPE, NAME, MEMBERS...) \
> > > +       struct_group_attr_typed(TYPE, NAME, /* no attrs */, MEMBERS)
> > > +
> > >  #endif
> >
> > Awesome! My instinct is to expose the resulting API as:
> >
> > __struct_group(type, name, attrs, members...)
> >
> > struct_group(name, members...)
> > struct_group_attr(name, attrs, members...)
> > struct_group_typed(type, name, members...)
> 
> Bikeshed: can we use proper nomenclature please. s/type/tag/,
> s/typed/tagged.

Ah! Thank you. I went looking for the spec on what these are called and
couldn't find it. "struct $tag" is the type, then, yes? So IIUC now:

       |    type   | members  | name
       |       tag
	struct foo { int bar; } baz;

-- 
Kees Cook
