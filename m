Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 566A8910DBC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982AB10EB66;
	Thu, 20 Jun 2024 16:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bm9r+DOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A85210EB66
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:55:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F2CCACE2426;
 Thu, 20 Jun 2024 16:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2819EC2BD10;
 Thu, 20 Jun 2024 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718902550;
 bh=A1JugA1kRbqTImg1GS9MvseGGROAflYsVVNFO9Eymkg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Bm9r+DOm3vNepyZmG6ENkJXODJ4erYYCurb/sueiOicXug5YBaF/ZvsWc1kuf2Bcx
 84y2DMPf20XLlr9NkTnq01iTYH1oalYb+0VTdEwIUt594ddvmUTF/fxe5JoXObxsVJ
 d7cMvBf8j/iSaw3cX0DcJ0fNU2V1UZpXbRisL6NxpjIwFUcebeVUmn49MjtOvoU1Sw
 uZjN7cj1B6rpKCAajFXds+/ZDgPokPiCJfAnV2BD57EBsEdORYnqCwmtfJ3f+TPNr/
 z0vae4nXfKteATQ3j7XBGOFASQy28ozvvsOGctSX3IJ0p5avNpqkSYg0K3y2JRkDFJ
 uRs1NWFNQVb7A==
Date: Thu, 20 Jun 2024 17:55:43 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: lkp@intel.com, Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, oe-kbuild-all@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Julia Lawall <julia.lawall@inria.fr>,
 Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v12 3/7] iio: core: Add new DMABUF interface infrastructure
Message-ID: <20240620165543.GR3029315@google.com>
References: <20240620122726.41232-4-paul@crapouillou.net>
 <ca3efef9-9720-46be-a59d-a9a4c5873ea2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca3efef9-9720-46be-a59d-a9a4c5873ea2@web.de>
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

On Thu, 20 Jun 2024, Markus Elfring wrote:

> …
> > v11:
> …
> >     - Use guard(mutex)
> >
> > v12:
> >     - Revert to mutex_lock/mutex_unlock in iio_buffer_attach_dmabuf(),
> >       as it uses cleanup GOTOs
> …
> 
> I would find it nice if better design options could gain acceptance.
> Will the chances grow to adjust scopes another bit for involved variables
> in such function implementations?
> 
> A) Enclosing a source code part with extra curly brackets?
> 
> B) scoped_guard()?
>    https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup.h#L137
> 
> C) Moving a locked source code part into a separate function implementation?

I think it would help your cause if you quoted the exact piece of code
you're referring to.  Then tone down the language a bit - keep it as
simple and natural as you can.

Ex 1: Please place curly brackets around this section to aid with <reason>

Ex 2: To save N lines of clean-up, please use scoped_guard()

Ex 3: Moving out this chunk to another function would help with <reason>

Etc.

-- 
Lee Jones [李琼斯]
