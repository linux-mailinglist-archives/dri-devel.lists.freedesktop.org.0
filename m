Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB602C5045
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F786E861;
	Thu, 26 Nov 2020 08:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598596E8B5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:14:59 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id y11so779930qvu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 04:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CG7i2FL/JDKvGKli5PDTjo0AEWVIwdY2iKG2Q3RxuRM=;
 b=ETII1p/RdAj0VyiwyK44BH9uTwjmDBmPMLX0aSN4t9vfJOJwqoZYsTp/+mr9qqMsnl
 tefp1YHvaNliUHg6FO4mtMaNb7+rVR8tI9Fda1Ty86PlRtS+sbtO4/uRPErUr1ND3qNg
 M8EIYjEy9eGlA1V+YStLJTaPQPX12lp2qdpwqDoIw/uUU2I4Nw272p8Qo+1pP2PrNcyY
 29bSyIuF0G9VBCxqWK2CkYZbA3Zg4s0IO+rtZc13Ghs+SLYX/13FrEnYAcfUabvPIvob
 irXBXHKkue0EZdXhzrYiuljYiYhKOKIAnyfLF6JPwdO+keLIBwdu31+nJMfUcuh8WZ2e
 QSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CG7i2FL/JDKvGKli5PDTjo0AEWVIwdY2iKG2Q3RxuRM=;
 b=U5VLgBwvxbjPne7UKvyq2CT1Vr994vYS1DKbERaZtjtfiPENALRKa+cqLHcHBRRrFq
 UYdFQaocm2Fp0fUtS0n5uFvf62W0UFd2UpuuuUtp8hfny7tXprbgU56pfOTtprbqS5z1
 e4wygNLUnqZ7ZgIrEMdPl88jBSZZrS6AlT+uZ2kD0XkTeVG2CfpDyDIGPvHTinIxaE9S
 7hRpWUN8sDCHNqfOStZ2axzb7PaozeHYB4Sz2TapErzeduElf7ZO3zQ8U4QE5krImtTp
 6KSVEEQIzInKJXJ4xfFFkeSH2TdqA9vwVF2JxTdYr/+zGBmwFRFRJYjZNnS/O5jciZyx
 D84g==
X-Gm-Message-State: AOAM531efgbWRUEiW5ZMbPVoswRy02yYFqRtACGN/VtITMG8PEEEFjjd
 7qCybR9KwvvsMjgKsz378LFw0Q==
X-Google-Smtp-Source: ABdhPJz+V2B/4ZjPlvtT2/VsFQQCQw/uDjbCQHi3A4PQRm9rQgFxnWXXRw/gA+G5uIasYJaPtZeSRA==
X-Received: by 2002:a0c:fc52:: with SMTP id w18mr3279519qvp.48.1606306498378; 
 Wed, 25 Nov 2020 04:14:58 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id w54sm2330367qtb.0.2020.11.25.04.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:14:57 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khthI-001AJR-U2; Wed, 25 Nov 2020 08:14:56 -0400
Date: Wed, 25 Nov 2020 08:14:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Message-ID: <20201125121456.GM5487@ziepe.ca>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
 <20201124151658.GT401619@phenom.ffwll.local>
 <MW3PR11MB45554AAEB1C370A78EB87816E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201125105041.GX401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125105041.GX401619@phenom.ffwll.local>
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 25, 2020 at 11:50:41AM +0100, Daniel Vetter wrote:

> Yeah imo makes sense. It's a bunch more code for you to make it work on
> i915 and amd, but it's not terrible. And avoids the dependencies, and also
> avoids the abuse of card* and dumb buffers. Plus not really more complex,
> you just need a table or something to match from the drm driver name to
> the driver-specific buffer create function. Everything else stays the
> same.

If it is going to get more complicated please write it in C then. We
haven't done it yet, but you can link a C function through cython to
the python test script

If you struggle here I can probably work out the build system bits,
but it should not be too terrible

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
