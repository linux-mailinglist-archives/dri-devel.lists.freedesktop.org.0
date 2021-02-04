Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111730FDBE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 21:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2ACE6EE14;
	Thu,  4 Feb 2021 20:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB446EE14
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 20:09:20 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id x81so4683775qkb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 12:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n3MAu1N2zejjEBwZWxASgX9jIdMC53t0pYKMsc1ppNk=;
 b=Lg069JztDhvoWiICQQWunlnXLy7IuMkcj0uAldVVNCHq/8JwhHufaEx0MekHJ/5JTl
 xviz7aNSvlZ1ljSeXW4L8FIeNGmTX4WbO9/i3MvjTqi6148SYSIstVBy+pIFAPN83e2E
 4qPWwueh6YN8rrUqE7CC7onk3NZRzHANXwl8AJpioEK7cH634mO/Agog/HJNefVFJU/n
 O54J5S6NPKcSrC02TZ3k/Dj1jxPue0lPwEjRfaoGZmo4lLqwI8vi+AWR4nFYqqYykoiP
 /BTBvvnfPceEloO2z6hrtPxG7Y8VMU921ANPWLs8+8t86Wt618I+a1pI4cLfUMIckMyi
 OkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n3MAu1N2zejjEBwZWxASgX9jIdMC53t0pYKMsc1ppNk=;
 b=rLp6HM0ZTu7hkpwMTfAOqmrGOzgFPTLpRfUl7eNJz4wYARjoL9qGGgX2jzbfYzXlMJ
 wfTOU7uGMDrU3ukA01F+ctPEuxt5TkAEyPZZMioF6moCBo+iN25AQSskmiPRGMIe9yVc
 WpsqzbsmT/PyMZ5Y1UAXkmq3GhQz/2l7xiZpz6wKu1peF9n2UsaTVzws6h1KIHJh6P1Q
 mHsr/pi6ahf7WU9NbPiuckucr2sCyLREKovCu4ta4h5lDqaKossmt9T7NKaiTSDG5IwU
 81jzzkO/KCCTBzB3DrCNDxMbf3Z+kxYqTTe0FpwdKDYrbHy4+u7OG5aU1dJIrxfApSU9
 i3DA==
X-Gm-Message-State: AOAM533O/g8NPUmyqARyY9pLrmDN31l4Yp5N0bV3/vKmsXdtVoZESCl1
 bH0oWnGHHrb3H6IbEQHFRG77lw==
X-Google-Smtp-Source: ABdhPJwxkPhU5yCUGh2nhqN1PfCoHbyAYILljpnCVhMrLSVlD/QpbVxxtrM7Ce+Cd6yNcY/Mawl7Pw==
X-Received: by 2002:a37:6f06:: with SMTP id k6mr924841qkc.458.1612469359555;
 Thu, 04 Feb 2021 12:09:19 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id s129sm5985441qkh.37.2021.02.04.12.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 12:09:19 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l7kwI-003b1z-H9; Thu, 04 Feb 2021 16:09:18 -0400
Date: Thu, 4 Feb 2021 16:09:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] RFC: dma-buf: Require VM_SPECIAL vma for mmap
Message-ID: <20210204200918.GA4718@ziepe.ca>
References: <20210203211948.2529297-1-daniel.vetter@ffwll.ch>
 <20210204161339.GX4718@ziepe.ca>
 <CAKMK7uEZvEEQXQeM=t-7uZEvga2GMhctp=WQgeSetG0GKTRsHA@mail.gmail.com>
 <20210204183808.GY4718@ziepe.ca>
 <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFBzF00zTzAE5b7PJFUfmxp5ExbSQxfcOfd_P6dPm7k9A@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 08:59:59PM +0100, Daniel Vetter wrote:

> So I think just checking for VM_PFNMAP after the vma is set up should
> be enough to guarantee we'll only have pte_special ptes in there,
> ever. But I'm not sure, this stuff all isn't really documented much
> and the code is sometimes a maze (to me at least).

Yes, that makes sense. VM_PFNMAP and !VM_MIXEDMAP seems like the right
check after the VMA is populated

But how do you stuff special pfns into a VMA outside the fault
handler?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
