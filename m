Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3336DD1AC04
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3441810E36A;
	Tue, 13 Jan 2026 17:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="te/C0d+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBE010E36A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=N+rDfW9wwKb/n3da7GixyOkPRd4YZkwdcbQcqnUfsmo=; b=te/C0d+egA2gtgGbiHaaotEcQr
 dxHIcF8WhPTxhGpmHjMgqByrRC6l/C1CxNuvILXO20t36GPbzEtSdHwF9cCX20tb5O2Goicx5yW8C
 5D0pxSTpu0mRpSlf+jpGk1j+nMkzeCP/sxF0Qd2i+r8EB0jY60KUvcGDVbp90JIRsAZLKKCjZEtUW
 tDBkC/CVXMVpOJ/aeQ8LDtWf1WpGTpx2gL+bLKZBWQQ/6zhhjHeWlzQpZnBBrtcBHnJpsYmotxQb7
 k1Mi4zPKBx5PlpDpjv1tleDpBXrLN1PuKGSpojQU6qE0k3YIaW5pw6I2GAZfTnImuXm13LgNVy2Ip
 KPrIgQuA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vfiaW-000000053AQ-3VRD;
 Tue, 13 Jan 2026 17:53:52 +0000
Date: Tue, 13 Jan 2026 17:53:52 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Change udelay() to usleep_range()
Message-ID: <aWaGsGhS-nNrDjDA@casper.infradead.org>
References: <20260113172756.14744-1-gideonadjei.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113172756.14744-1-gideonadjei.dev@gmail.com>
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

On Tue, Jan 13, 2026 at 09:27:56AM -0800, Gideon Adjei wrote:
> Replace udelay() calls >= 100us with usleep_range() to avoid busy-waiting.
> This allows the scheduler to run other tasks while waiting.

Your commit message omits how you know it's safe to sleep in these
situations.  Are we holding a spinlock or being called in interrupt
context, for example?
