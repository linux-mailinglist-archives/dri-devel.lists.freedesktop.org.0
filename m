Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133148C228F
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 12:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773010E59C;
	Fri, 10 May 2024 10:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IZ16glye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBF910E59C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 10:55:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DB47CE1D50;
 Fri, 10 May 2024 10:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6CBC113CC;
 Fri, 10 May 2024 10:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715338514;
 bh=Yg72rzmx+bcTPUq2wGuL/cZ1uSAABSmBZuLsh72n3GA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IZ16glyeUoEcw9bvLXvZyE6xpgHtADMx321GfnN0BHALFchlZSBq/fK4KF9b5Vq7h
 MN1lPeoAgCcojfCacXEZ3oUgkHjP6AqL7aJIiKfq7nArCv1Sqzay+3peXRW7zvHLED
 uBTZDCEcefInuP73Npox6kTo4di4WbMnD/NRY9011QMdLz34aE3feX0I2oQs+3g0h+
 m5kSagyGxw5VAGQdLCVlWKPi99HWJrGP46LMxQdj2jdhdDOctRZFpDeEzSulU05vzm
 V5x9L3RjmbW0zGRujXz0ojFm3N/C5Yh7q5TejagGWpEkhrrJhRtOpwxw/cmKQW7iqG
 9vrh1c5+2TFVw==
Date: Fri, 10 May 2024 12:55:07 +0200
From: Christian Brauner <brauner@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, keescook@chromium.org, 
 axboe@kernel.dk, christian.koenig@amd.com, dri-devel@lists.freedesktop.org, 
 io-uring@vger.kernel.org, jack@suse.cz, laura@labbott.name,
 linaro-mm-sig@lists.linaro.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 minhquangbui99@gmail.com, sumit.semwal@linaro.org, 
 syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com
Subject: Re: [Linaro-mm-sig] Re: [PATCH] epoll: try to be a _bit_ better
 about file lifetimes
Message-ID: <20240510-duzen-uhrmacher-141c9331f1bf@brauner>
References: <202405031110.6F47982593@keescook>
 <20240503211129.679762-2-torvalds@linux-foundation.org>
 <20240503212428.GY2118490@ZenIV>
 <CAHk-=wjpsTEkHgo1uev3xGJ2bQXYShaRf3GPEqDWNgUuKx0JFw@mail.gmail.com>
 <20240504-wohngebiet-restwert-6c3c94fddbdd@brauner>
 <CAHk-=wj_Fu1FkMFrjivQ=MGkwkKXZBuh0f4BEhcZHD5WCvHesw@mail.gmail.com>
 <CAHk-=wj6XL9MGCd_nUzRj6SaKeN0TsyTTZDFpGdW34R+zMZaSg@mail.gmail.com>
 <b1728d20-047c-4e28-8458-bf3206a1c97c@gmail.com>
 <20240508-risse-fehlpass-895202f594fd@brauner>
 <ZjueITUy0K8TP1WO@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZjueITUy0K8TP1WO@phenom.ffwll.local>
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

> For the uapi issue you describe below my take would be that we should just
> try, and hope that everyone's been dutifully using O_CLOEXEC. But maybe
> I'm biased from the gpu world, where we've been hammering it in that
> "O_CLOEXEC or bust" mantra since well over a decade. Really the only valid

Oh, we're very much on the same page. All new file descriptor types that
I've added over the years are O_CLOEXEC by default. IOW, you need to
remove O_CLOEXEC explicitly (see pidfd as an example). And imho, any new
fd type that's added should just be O_CLOEXEC by default.
