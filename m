Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8118FB14442
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 00:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC05B10E04B;
	Mon, 28 Jul 2025 22:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZfSKm3/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449C210E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 22:16:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C37A942BA4;
 Mon, 28 Jul 2025 22:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D4DC4CEE7;
 Mon, 28 Jul 2025 22:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1753740965;
 bh=TzVWYT76rZE3j083ttedwRt/20yfxuDoW0mHV1B5gDs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZfSKm3/E6RiE/tCV6VIRZLG2thsq7KkBEVsP0etcc1LaZDPn8g9dwuta9RB+/3K3f
 zk2BxycXTmSMfN160LDV3jpuZtb3shabZBxoAzOn7CHD25y8iWsbD2/9zDyaTQNUcr
 RQvJuG3x3sqbV5xPJhWh9EHfUZw1Zww9rGuVrDzA=
Date: Mon, 28 Jul 2025 15:16:04 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Patryk Kowalczyk <patryk@kowalczyk.ws>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, hughd@google.com,
 ville.syrjala@linux.intel.com, david@redhat.com, willy@infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, christian.koenig@amd.com, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH] mm: shmem: fix the shmem large folio allocation for the
 i915 driver
Message-Id: <20250728151604.e834daa64e8c816aeffba975@linux-foundation.org>
In-Reply-To: <CAJCW39+AS5poKu3A4Y88pH2y6CWbE0WnGZfe3kL99W3sJZjreA@mail.gmail.com>
References: <0d734549d5ed073c80b11601da3abdd5223e1889.1753689802.git.baolin.wang@linux.alibaba.com>
 <20250728144424.208d58d5a95057ee7081ccd8@linux-foundation.org>
 <CAJCW39+AS5poKu3A4Y88pH2y6CWbE0WnGZfe3kL99W3sJZjreA@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 28 Jul 2025 23:59:22 +0200 Patryk Kowalczyk <patryk@kowalczyk.ws> wrote:

> In my tests, the performance drop ranges from a few percent up to 13% in
> Unigine Superposition
> under heavy memory usage on the CPU Core Ultra 155H with the Xe 128 EU GPU.
> Other users have reported performance impact up to 30% on certain workloads.
> Please find more  in the regressions reports:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14645
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13845
> 
> I believe the change should be backported to all active kernel branches
> after version 6.12.

OK, thanks.  I added this (important!) info to the changelog and I
added a cc:stable, requesting a backport into everything which has
acd7ccb284b8.

I'll place this in mm.git's mm-hotfixes-unstable branch with a plan to
upstream it sometime during the 6.17-rcX cycle.

