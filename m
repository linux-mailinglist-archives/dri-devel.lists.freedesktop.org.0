Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE30318F3E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Feb 2021 16:58:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A86D6E118;
	Thu, 11 Feb 2021 15:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5FF36E118
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 15:58:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id u16so2364163wmq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Feb 2021 07:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Al2j0xSH0O3Xmzn+j8kKCY+R21O1q39JrxG10gH5Ya8=;
 b=B9MSDQ6EWqQxooEbR5wAjSu4UjEYif7LUGmWTYveGt7v0Nq27JcbmY2Bmn9P4uOSfp
 08eEd9H8gKyMtuQoYPEroz/QMdq9YFDTwsBv31dDEU94EojDhPGX6xXqaSWkBTG+8HHH
 U6MPL/+JFWIfbPANhZGVPeIDsi9nsp1r+Rjk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Al2j0xSH0O3Xmzn+j8kKCY+R21O1q39JrxG10gH5Ya8=;
 b=B6PPBACRVoyuyXUni/fMMWBI9/EKCKRdZPoA6DcTgy6I6E/nI1U71pVv/o5/rhF6om
 bH1o4pnJS0kNB9yusUNtWZbu2wGKc54R7EF4tT5yHOeLQqZztytAPQ7UZC9z6ZaL9bWU
 7cXnzhR3tsa+gzZ2KiSnXZfNbeneNkTz/I2slZIkD38ffm+VfeccFJbMqDBLLmuiy4Oe
 HAmk9DGAT0P+My//PQPWZIMdzmWi7oMHqo3ZIKROXZV0FZ1YaO33fIYx8xPlyFrRlYzH
 BdgU947bKOIh0KaUJotQmVfhaefl9/JPPLGpAD5RW6Ti/sGQkrAwW+LqP+i5BE5CUU2a
 +wlA==
X-Gm-Message-State: AOAM530kc0wDA/XPcQHL5mn24MKRLKcCFvStF0dBZdjaOzR2C+n4E0dh
 eD3zDLwHlRiAcO2977IS6j+2Lw==
X-Google-Smtp-Source: ABdhPJyjATkBBKXqgaBwGWMX9r8CJShj5MC3gzR/LBqX0+iIxLumZxlCG1Ekv4gtWK0kkrktq0uFcQ==
X-Received: by 2002:a1c:ed1a:: with SMTP id l26mr6001949wmh.114.1613059088641; 
 Thu, 11 Feb 2021 07:58:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 16sm10140554wmi.43.2021.02.11.07.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 07:58:07 -0800 (PST)
Date: Thu, 11 Feb 2021 16:58:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: make sure pool pages are cleared
Message-ID: <YCVUDYYQJ4PtwzVI@phenom.ffwll.local>
References: <20210210160549.1462-1-christian.koenig@amd.com>
 <CAKMK7uHYoxc81QW+gDTVVaXdKizSLogr_TfzWyL_8caOx+0JgA@mail.gmail.com>
 <6ea6a18b-e7df-ce8c-903d-a5edd6ef85b6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ea6a18b-e7df-ce8c-903d-a5edd6ef85b6@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Huang Rui <ray.huang@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 efault@gmx.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 10, 2021 at 09:23:52PM +0100, Christian K=F6nig wrote:
> =

> =

> Am 10.02.21 um 19:15 schrieb Daniel Vetter:
> > On Wed, Feb 10, 2021 at 5:05 PM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > The old implementation wasn't consistend on this.
> > > =

> > > But it looks like we depend on this so better bring it back.
> > > =

> > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > Reported-and-tested-by: Mike Galbraith <efault@gmx.de>
> > > Fixes: d099fc8f540a ("drm/ttm: new TT backend allocation pool v3")
> > Well I think in general there's a bit an issue in ttm with not
> > clearing stuff everywhere. So definitely in favour of clearing stuff.
> > Looking at the code this only fixes the clearing, at alloc time we're
> > still very optional with clearing. I think we should just set
> > __GFP_ZERO unconditionally there too.
> =

> No, the alloc handling is actually correct.
> =

> We are clearing only when we allocate pages for userspace. Not for the
> kernel nor for eviction when pages are overwritten anyway.
> =

> The key point is that the old page pool was ignoring the flag for this in
> some code paths and I wasn't sure if that's still necessary or not.
> =

> Turned out it was necessary after all.

Somehow my git grep went wrong and I didn't find the users. You're right,
and I learned a few things more :-)

I'm kinda wondering, should we perhaps move the clearing to the use side,
and then only do when required? Might allow us to save it quite a few
times when we're thrashing around buffers in/out of vram, at the cost of
moving it to the alloc side for other cases.

Just an idea.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
