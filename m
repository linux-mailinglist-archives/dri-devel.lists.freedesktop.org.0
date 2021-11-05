Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334A4461FE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 11:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA606E063;
	Fri,  5 Nov 2021 10:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F756E063
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 10:12:38 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id b12so12888227wrh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Nov 2021 03:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zv9PuIDVswO70lZ0uG6jPpQthQ8kkBcDYBiqD4A4qXw=;
 b=Vt73Fc6Hjml8stv1w0AD1HeGB3txoDNmCQvSvMUTiY3Y63hg7X88/bv1fzFSxLYD2y
 szMp6o8VHHE1dByycn9IEitbSgA+GFjfpKTH26ocfHUaHVkTImVaCUbwTOjMCZyVocwD
 6mhDPlzKhQBthsGw8BA+0zn97Hx1Q2+pdmcaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zv9PuIDVswO70lZ0uG6jPpQthQ8kkBcDYBiqD4A4qXw=;
 b=4Sv6VGKB56ttmarX/ErmVblnUA36mhjmQCri6zongjFtyXCtMs6bkGxaGzfSzgGBY7
 iYmVDKFN+7oX+p0NMeBVFkmcEYgWj1COSCrxhja1KqDwK7OPg66VPsuh4m4dw7lRoJf6
 ONhPPBabNMJiadnHZb4O1D9+ZX+bDWeuLWyUXWgWpADPQl+VUdwHyeloVNwE1S/w+wY2
 KoOAECptcu6BROagSNqLVCe0WVODQjqeRBF/HSuYVtftFbNWF673Xpi9FE4p1tDQ/844
 +ow7yFZ7SPpkOJHL4gdlVtizIkxNwzyLaxAz10djIrFrVd30/CbbwxoxPX5k4DeMDhrP
 WeuA==
X-Gm-Message-State: AOAM530+idXnbm196fN5Oj/HgN7Koi6LPisNjGh3KlnT1IAAUHsDPdfS
 gNUsyTzbNLyqESqVIgQSXh+KZQ==
X-Google-Smtp-Source: ABdhPJw64wzS+0qK3rueFpvfmzmhOKnsqJBo5QUZ5UFM7GL/NkROdjRj0RoGonyoJWfS0iwoVVsaLg==
X-Received: by 2002:a5d:604b:: with SMTP id j11mr49946735wrt.22.1636107157197; 
 Fri, 05 Nov 2021 03:12:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 4sm10462909wrz.90.2021.11.05.03.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 03:12:36 -0700 (PDT)
Date: Fri, 5 Nov 2021 11:12:35 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <YYUDkwHpQ/+yRJsM@phenom.ffwll.local>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
 <20211020193702.GJ2744544@nvidia.com>
 <YXFR85joqUODJyy/@phenom.ffwll.local>
 <20211022185742.GO2744544@nvidia.com>
 <YXq+bELDrDiB2VPm@phenom.ffwll.local>
 <20211028194256.GN2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028194256.GN2744544@nvidia.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 04:42:56PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 28, 2021 at 05:14:52PM +0200, Daniel Vetter wrote:
> > Hm totally lost this, I'm trying to not be too responsible for mm changes
> > since it scares me :-) Plus dropping this very late in the release feels a
> > bit risky.
> > 
> > Ok if I stuff this into drm-next instead?
> 
> Sure

Finally got around to this, should show up in the merge window. Apologies
for being everywhere except on dri-devel.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
