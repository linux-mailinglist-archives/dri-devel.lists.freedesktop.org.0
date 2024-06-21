Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4777F911D51
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 09:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC57A10EE14;
	Fri, 21 Jun 2024 07:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c1hdrIkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA3E10EE14
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 07:51:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C2BFB6248D;
 Fri, 21 Jun 2024 07:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC14C2BBFC;
 Fri, 21 Jun 2024 07:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718956289;
 bh=1HCwf6TJ72c4wbSMsx0ToW1GLnhJDNJ8Afp1KOu+icw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1hdrIkFymyDz2jm9julINVwJdVh0apoGK/wOJgAfzgQciUyMpXO11gJeobnhyj/O
 HN7aNcc5+7PxztjUyqA062UCdYMiPoQvViog8Xrv0y9bIxvqxsagAzJMmuVrgQIUup
 I/cVid0PV0daHpnlqjFuqXeIQ2YCGm/gHAcyVU/o1rfRtE7Ii0RAwhucR+x/mYN8TM
 XMF4h1coHHcuTt0dpExaF0Yl8kWq7sY0nbsfmm++caCX3/fl21wh20/1GCKj4vllQa
 xuvf8a9Q3PYkXssVcn5yqcT7rOChpgLgCUWb09KCofzKUmVkGhexjOXcqgDrZIGyxv
 1zwNw8HQda1fg==
Date: Fri, 21 Jun 2024 08:51:23 +0100
From: Lee Jones <lee@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Vinod Koul <vkoul@kernel.org>, lkp@intel.com, linux-iio@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Paul Cercueil <paul@crapouillou.net>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Julia Lawall <julia.lawall@inria.fr>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [v11 3/7] iio: core: Add new DMABUF interface infrastructure
Message-ID: <20240621075123.GG1318296@google.com>
References: <202406191014.9JAzwRV6-lkp@intel.com>
 <c25aab0d-48f6-4754-b514-d6caf8d51fd1@web.de>
 <ZnRUSaHJhz7XLcKa@matsya> <20240620170522.GU3029315@google.com>
 <ZnUnFeum1Z2ahm9M@matsya>
 <ebddd644-b9b1-4a87-a2e7-dcf255f4184d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebddd644-b9b1-4a87-a2e7-dcf255f4184d@web.de>
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

On Fri, 21 Jun 2024, Markus Elfring wrote:

> > Sadly, I am yet to see a constructive approach or even better a helpful
> > patch which improve something, rather than vague suggestions on the list
> 
> Can you get any more constructive impressions from another data representation?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=author&q=Elfring
> 
> Are you aware how many change suggestions (also from my selection) are still
> in various waiting queues?

No one is doubting your overall contributions Markus.

The issue is one of communication and the way reviews are conducted.

Reviewing other people's work is challenging and requires a certain
skill-set, of which _excellent_ communication skills are non-negotiable.

Why not concentrate on more complex submissions for a while and grow
your repertoire of common review points, rather than repeating the same
few over and over?  Reading other, more experienced maintainer's reviews
would also be a good use of your time.

-- 
Lee Jones [李琼斯]
