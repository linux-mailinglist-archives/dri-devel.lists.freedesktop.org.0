Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB3BCEBC3
	for <lists+dri-devel@lfdr.de>; Sat, 11 Oct 2025 00:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AD510E2B5;
	Fri, 10 Oct 2025 22:57:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="owy6loEA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5E810E2B5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Oct 2025 22:57:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C5CA541A71;
 Fri, 10 Oct 2025 22:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEB0C4CEF1;
 Fri, 10 Oct 2025 22:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760137046;
 bh=NPCnJm+glac6qNv/XVTi3HpMJ283abXEd2rPLQG0eqQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=owy6loEAjrNGDq93yL+08XL4RfvnUQNFlJqCljte3VLEzpuDUJFJc8tzQgMHnKfvk
 8ZXazvKs4NabIA5ZZTF+5MI0aDcE79iPOhEeRkwMt/G237jj7OHI/3IqsB1rp6WlnP
 jBr5sqWuKBw4cIxfAN6Qz4rN4BCRAU+KR50VYi4nn7p++SuZqStPI8YWeeu4Xlw2Ui
 pgTH4vhAlDlu1sws4muw36iMJbmjSVFv4TR72LrM96bvMFinHlf65hC8VLm/7x41AP
 bwKFmm59akzs5PrGkcd3ooo5uFOxSTo1oLreU0SvYWFYyRNvxvTzQ7cepdgUMKcmf9
 9MB+vx6CvrNAA==
Date: Fri, 10 Oct 2025 15:57:26 -0700
From: Kees Cook <kees@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Christian Brauner <brauner@kernel.org>,
 syzbot+a9391462075ffb9f77c6@syzkaller.appspotmail.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] dma-buf: use SB_I_NOEXEC and SB_I_NODEV
Message-ID: <202510101556.5C71F86@keescook>
References: <20251008061027.work.515-kees@kernel.org>
 <aOYBpY7jPx622xcz@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOYBpY7jPx622xcz@infradead.org>
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

On Tue, Oct 07, 2025 at 11:16:05PM -0700, Christoph Hellwig wrote:
> On Tue, Oct 07, 2025 at 11:10:32PM -0700, Kees Cook wrote:
> > The dma-buf pseudo-filesystem should never have executable mappings nor
> > device nodes. Set SB_I_NOEXEC and SB_I_NODEV on the superblock to enforce
> > this at the filesystem level, similar to secretmem, commit 98f99394a104
> > ("secretmem: use SB_I_NOEXEC").
> > 
> > Fix the syzbot-reported warning from the exec code to enforce this
> > requirement:
> 
> Can you please just enforce this in init_pseudo?  If a file system
> really wants to support devices or executable it can clear them,
> but a quick grep suggests that none of them should.

I that that's a fine idea, but I defer to Christian -- I think the WARN
was put in place to avoid doing that...

-- 
Kees Cook
