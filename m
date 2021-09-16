Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C4440DB30
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06186EB85;
	Thu, 16 Sep 2021 13:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8D6EB85;
 Thu, 16 Sep 2021 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ucgB2Hy9Xb9oPb1gxO7iwQPFqY9KF4YtX7AagAiN27A=; b=gQ93PbpOi4o4sJSoMcD83dOk+q
 thS39oOFAyTncpoojn3WN+eJ3ZO7xrws5j4XeaIa+jepwKidpJ3/fu9pGVa3oeoukDYFVuMiEKOiJ
 mmAho9PtRWbbhlwHC40zXObnxN1aTVFITKFm2TUtKgmj85RGe8qIUnoqq+yZfvTAHZQQqEV0n4nyV
 ohACGJbJrHCtjUesy6hxKg9NNcCrjZsJEsamMphJIYzPYb9FhGkbG4cgCJDXxFutpundsmPKpDQbk
 ZNqTblF/g9I6YjcjdWUDVb9FmctfA7qNn15RaLlx3aj1jkQ/R7sT6TFAieINXjhiabXq8Pd1joLjl
 +rX83o0A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQrQz-003eye-5N; Thu, 16 Sep 2021 13:28:13 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 68E48300238;
 Thu, 16 Sep 2021 15:28:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 479A52CE72577; Thu, 16 Sep 2021 15:28:11 +0200 (CEST)
Date: Thu, 16 Sep 2021 15:28:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kernel/locking: Add context to ww_mutex_trylock.
Message-ID: <YUNGaztoBrTzEuEG@hirez.programming.kicks-ass.net>
References: <YTiM/zf8BuNw7wes@hirez.programming.kicks-ass.net>
 <96ab9cf1-250a-8f34-51ec-4a7f66a87b39@linux.intel.com>
 <YTnETRSy9H0CRdpc@hirez.programming.kicks-ass.net>
 <a7e5d99d-39c4-6d27-3029-4689a2a1a17a@linux.intel.com>
 <YTtznr85mg5xXouP@hirez.programming.kicks-ass.net>
 <e8a7754e-23e7-0250-5718-101a56d008f0@linux.intel.com>
 <YUBGPdDDjKlxAuXJ@hirez.programming.kicks-ass.net>
 <205e1591-343b-fb77-cfca-9c16af1484bd@linux.intel.com>
 <YUCpfrbfPSZvD3Xl@phenom.ffwll.local>
 <a374d768-213e-58e7-d281-1c46d1c0c105@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a374d768-213e-58e7-d281-1c46d1c0c105@linux.intel.com>
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

On Thu, Sep 16, 2021 at 03:00:39PM +0200, Maarten Lankhorst wrote:

> > For merge logistics, can we pls have a stable branch? I expect that the
> > i915 patches will be ready for 5.16.
> >
> > Or send it in for -rc2 so that the interface change doesn't cause needless
> > conflicts, whatever you think is best.

> Yeah, some central branch drm could pull from, would make upstreaming patches that depends on it easier. :)

I think I'll make tip/locking/wwmutex and include that in
tip/locking/core, let me have a poke.
