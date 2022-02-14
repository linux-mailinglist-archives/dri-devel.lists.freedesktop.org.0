Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C774B5834
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 18:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6978410E1E1;
	Mon, 14 Feb 2022 17:11:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E85A10E1E1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 17:11:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id A71461F43C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644858698;
 bh=mOIHVEM5C9UVp2XYO3woFmVBYR18WhpWMPWVU08zD+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K3IOpYEe0YGYAf+dyULWzd3ZXAi1L3HBxJZlcPiPifwWo4sk2lSGfYihXbfCPcT1f
 jIpvYD7tqp9e6rtkDsOL0LDWTqmI6Fs7+8CXq0H3tJw9j87hkUiKQcpmEiGeB70UGS
 lxLxnPL3HtTrkrjOTHSXMIy45CtEJwLKMANyXN8Jc3YuoH4rjjciGurmOd1DYRe3EX
 BZ20Kr8zDKFjUdFUUCRjBj3LoR2Ycjx9MSWsnZcgkC6XTQQtc8LSjzuVVhD5tqnSgo
 ZvuJIPFGVv2O7LuKUQR0i7I8RhgTiVju1aTXyNDQ8mawLtJmLSq9YuPwb8kYbo4pCp
 R3dhBxBzHogeQ==
Date: Mon, 14 Feb 2022 12:11:30 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 5/9] drm/panfrost: Add HW_ISSUE_TTRX_3485 quirk
Message-ID: <YgqNQpjwkBtPOgls@maud>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-6-alyssa.rosenzweig@collabora.com>
 <265e99b9-fbde-bdcf-d8e9-e5deba1d9564@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <265e99b9-fbde-bdcf-d8e9-e5deba1d9564@arm.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > TTRX_3485 requires the infamous "dummy job" workaround. I have this
> > workaround implemented in a local branch, but I have not yet hit a case
> > that requires it so I cannot test whether the implementation is correct.
> > In the mean time, add the quirk bit so we can document which platforms
> > may need it in the future.
> 
> This one is hideous ;) Although to me this isn't the 'infamous' one as
> it's not the earliest example of a dummy job.

Terrifying. I guess we narrowly avoided the 'replay' workaround which
was far worse than this one...

> However... I believe as Panfrost currently stands this is probably not
> very possible to hit. It requires a job to be stopped (soft or hard) at
> a critical point during submission - which at the moment Panfrost
> basically never does (the exception is if you close the fd immediately
> while a job is in progress). And of course the timing has to be 'just
> right' to hit the bug.

OK, that's good to know. Still "should" be fixed but that definitely
lowers the priority of it. Frankly the multithreading bugs we have on
the CPU side would hang the machine sooner...
