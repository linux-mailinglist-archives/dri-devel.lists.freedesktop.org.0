Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B0550BAAE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E59410E1B5;
	Fri, 22 Apr 2022 14:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C7B10E252
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:53:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6C6460FF8;
 Fri, 22 Apr 2022 14:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92041C385A4;
 Fri, 22 Apr 2022 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650639183;
 bh=T9UBwXuqufvpPkwkvMfLrSuvMpCvswDkzG2OAhXGXms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gtR6ueBjj90k6uXG+sGb62mjEPhUyWqCc4g/LYsDAGDC86QvoXlQYy95NhT2btdF8
 P0xl3sQ3qmwmyqmSN38lcytsJbQgKvLmqdrL0dhCwz49yEBz1tKjoPpydxABJtmKdz
 GxSusnTu+4goI0K1PWwTnb2+/G0VhcVxFy2lzYdc=
Date: Fri, 22 Apr 2022 16:53:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [RFC v5 0/6] Proposal for a GPU cgroup controller
Message-ID: <YmLBTBd+5RHzr9MK@kroah.com>
References: <20220420235228.2767816-1-tjmercier@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420235228.2767816-1-tjmercier@google.com>
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
Cc: linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, jstultz@google.com,
 Zefan Li <lizefan.x@bytedance.com>, kaleshsingh@google.com,
 Joel Fernandes <joel@joelfernandes.org>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, Martijn Coenen <maco@android.com>,
 Laura Abbott <labbott@redhat.com>, kernel-team@android.com,
 linux-media@vger.kernel.org, Todd Kjos <tkjos@android.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, skhan@linuxfoundation.org,
 cgroups@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, Kenny.Ho@amd.com,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>, mkoutny@suse.com,
 Johannes Weiner <hannes@cmpxchg.org>, tj@kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 11:52:18PM +0000, T.J. Mercier wrote:
> This patch series revisits the proposal for a GPU cgroup controller to
> track and limit memory allocations by various device/allocator
> subsystems. The patch series also contains a simple prototype to
> illustrate how Android intends to implement DMA-BUF allocator
> attribution using the GPU cgroup controller. The prototype does not
> include resource limit enforcements.
> 
> Changelog:
> v5:
> Rebase on top of v5.18-rc3

Why is a "RFC" series on v5?  I treat "RFC" as "not ready to be merged,
if people are interested, please look at it".  But v5 seems like you
think this is real.

confused,

greg k-h
