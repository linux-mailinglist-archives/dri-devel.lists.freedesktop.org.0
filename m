Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4475BF034
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 00:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96C010E2C0;
	Tue, 20 Sep 2022 22:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B6F10E2C0;
 Tue, 20 Sep 2022 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663713218; x=1695249218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xa1YRFX7IkEWb8tsFy8J/Th4HwkwJ9ZEtd4DG1r3us0=;
 b=Y+qPWuxFwb+LoqC8l6mfykcezHG2KwVDrBkfemmFsgiOy11N5fwVlzDa
 LDe/me/bbaef9lHZoQjBpWdpxE8oYXuiPD1jntrPyjkGEFTsOYZ5vqf3T
 8Acf/NSvUclbwqqsGJBkvR3zS7RxG02Nq8OG6JbNG1ZGmtve8VyT4thwy
 NOFhU/Ck9AW9USjIqbFggM/i8eB7J99/uV41oxJYWYuvsDYqBF02bva+U
 6is+xijfBkM2lrDci2TSVIecJIs/9bfHAFGEqFjuW/9Zamat9IRNQm+st
 O6kxrMs/yTOzBYASTUDE8Dycdarj6dHK9CVr0sxXYGmMFlUS7Fh2MEuI8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="298555757"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="298555757"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 15:33:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="687606535"
Received: from ahajda-mobl.ger.corp.intel.com (HELO intel.com) ([10.213.28.54])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 15:33:36 -0700
Date: Wed, 21 Sep 2022 00:33:34 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: enable local stolen memory
Message-ID: <Yyo/vqFb2bH116i/@ashyti-mobl2.lan>
References: <20220920071940.3775059-1-aravind.iddamsetty@intel.com>
 <YynxCp0OGTJ/hu3J@ashyti-mobl2.lan>
 <YyolVATWuGbXE/HT@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyolVATWuGbXE/HT@mdroper-desk1.amr.corp.intel.com>
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt, Lucas,

thanks for your feedback,

> > > +	switch (gms) {
> > > +	case 0x0 ... 0x10:
> > > +		return gms * 32;
> > > +	case 0x20:
> > > +		return 1024;
> > > +	case 0x30:
> > > +		return 1536;
> > > +	case 0x40:
> > > +		return 2048;
> > > +	case 0xf0 ... 0xfe:
> > 
> > just a bit puzzled by the fact that case ranges are not standard
> > and are supported only by GCC, unless, of course, I miss
> > something. Do we still want to use them as they are widely used
> > around the kernel?
> 
> i915 already has 17 other uses of this notation and the DRM subsystem in
> general has about 50 today.  So it's not super common, but I think it
> should be okay to use.  I believe clang supports this language extension
> as well and the coding style doc doesn't say anything one way or the
> other.

I thought clang supports it for C++ rather than C, but I'm not a
clang expert, so that I might be wrong.

The fact that it is widely used is never a convincing argument
and if gcc supports it, then it does it against the standard,
both C11 and C17 (this is what puzzles me everytime I see these C
tricks offered by gcc).

Anyway, I'm not against it (nor in favour) as the ellipsis is
becoming very commonly used. My comment, by the way, did not mean
to block the patch, I just wanted to check what other people
think about.

Thanks,
Andi
