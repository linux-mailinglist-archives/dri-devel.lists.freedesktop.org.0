Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3795368D1B
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 08:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684916EB3F;
	Fri, 23 Apr 2021 06:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7309A6EA9D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 13:51:07 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id x11so46238254qkp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cs-cmu-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=sc812S/XH0xi1daedR2N2rrASOXlL4IU8Kqiol/mJyg=;
 b=ilf7MiKPmuLDCJimMx6HY09IjE0RtI8ZvwvdH6B6zfOQjt3XpT5zeEzYvZWEpLAdYN
 HgsytpNQ77VJrUr18k2RiREzJkRdWu0QpLA0tkuRNsG9RJNB3q1uAdrnsyEo+VtE/bkz
 B2jsPuMqREtLJPtddAk+Uo17G2/m8PXB2rUUgxU0rvhBi59tk2mXxC2MGCjH0Pjpp+VT
 mX7+laaPBOMCRKCQqV4hxZwgrlInehA3Gism8b/RZbMqm7co4BAjldanO0P5uXETbut4
 mzMIosKNAMoPho12DmysXBBsk5jjrFMiiqQDcmOd/Ypwjfkh2IjEZ9SeT0+ozvuXOA6A
 QC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=sc812S/XH0xi1daedR2N2rrASOXlL4IU8Kqiol/mJyg=;
 b=enHBxt9CHSV1t5iJCa2ni+yK0Dxkw+z3K/B7jfFY76CA8O05xl+dnAe/ZPX4aw3cYv
 sKkKlbfBBjWfT9s/Rk+DtEaJs0CCcufgf+1ZpCDeQfW2aVJafsIJyn+o+zP3tJl76H0R
 t9KfK0MDuEGEgeUazspYdu6IstWnu9MRaFeKQhoY6+QXbC3pAUlfjJNQ8UwdJ0fp76t0
 eFt3UgAX+hdxObXr1VsBLO13x/vZk+do5jefe1aARWQ8ZhgFQdVJs3m/OnjbiEWcHCgP
 se1Erm01lKFpMZoTQrdBw5bZZMK9nbrAv7NfdkpVlk+O63xJTQA50ktVuCnaCSsjk6mb
 KtGg==
X-Gm-Message-State: AOAM530XHaInseCEJvIjy3PTaRlM1MLO/asAm3POM4LxJgPhosYYFl5J
 GDK0c+e+vYTGBFsEF7Bz4ea4vw==
X-Google-Smtp-Source: ABdhPJzopgVvvshO8HCJDMmm2d3/Wi7iBmogcMm1rcCSeWXZCE8qQJSe7zD8nyMnJxcAF1H8ro/U3g==
X-Received: by 2002:a37:c202:: with SMTP id i2mr3647788qkm.296.1619099466408; 
 Thu, 22 Apr 2021 06:51:06 -0700 (PDT)
Received: from cs.cmu.edu (tunnel29655-pt.tunnel.tserv13.ash1.ipv6.he.net.
 [2001:470:7:582::2])
 by smtp.gmail.com with ESMTPSA id g1sm2207278qth.69.2021.04.22.06.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 06:51:05 -0700 (PDT)
Date: Thu, 22 Apr 2021 09:51:03 -0400
From: Jan Harkes <jaharkes@cs.cmu.edu>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] coda: fix reference counting in coda_file_mmap error
 path
Message-ID: <20210422135103.hif4a5znhzt4pc6f@cs.cmu.edu>
References: <20210421132012.82354-1-christian.koenig@amd.com>
 <91292A4A-5F97-4FF8-ABAD-42392A0756B5@cs.cmu.edu>
 <f603f59b-ec52-7ad7-475a-fcf95902e145@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f603f59b-ec52-7ad7-475a-fcf95902e145@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Fri, 23 Apr 2021 06:24:49 +0000
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
Cc: jgg@ziepe.ca, miklos@szeredi.hu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-unionfs@vger.kernel.org,
 coda@cs.cmu.edu, akpm@linux-foundation.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 02:39:41PM +0200, Christian K=F6nig wrote:
> Am 22.04.21 um 14:27 schrieb Jan Harkes:
> > Looks good to me.
> > =

> > I'm also maintaining an out of tree coda module build that people somet=
imes use, which has workarounds for differences between the various kernel =
versions.
> > =

> > Do you have a reference to the corresponding mmap_region change? If it =
is merged already I'll probably be able to find it. Is this mmap_region cha=
nge expected to be backported to any lts kernels?
> =

> That is the following upstream commit in Linus tree:
> =

> commit 1527f926fd04490f648c42f42b45218a04754f87
> Author: Christian K=F6nig <christian.koenig@amd.com>
> Date:=A0=A0 Fri Oct 9 15:08:55 2020 +0200
> =

> =A0=A0=A0 mm: mmap: fix fput in error path v2
> =

> But I don't think we should backport that.
> =

> And sorry for the noise. We had so many places which expected different
> behavior that I didn't noticed that two occasions in the fs code actually
> rely on the current behavior.
> =

> For your out of tree module you could make the code version independent by
> setting the vma back to the original file in case of an error. That should
> work with both behaviors in mmap_region.

Awesome, I'll give that a try, it may very well be a cleaner solution
either way.

And thank you for following up after your original patch and finding
the filesystems that mess around with those mappings. I'm sure it would
have taken me a while to figure out why file refcounts would go weird
for some people, especially because this only happens in the error path.

Jan

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
