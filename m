Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45C4AF72C1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 13:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C093010E18C;
	Thu,  3 Jul 2025 11:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="SdzgeONL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D703F10E806;
 Thu,  3 Jul 2025 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=LVjnHK2a2/GS8JYOQqAkvsSJ569rLPDcokWUDEILfso=; b=SdzgeONLE0Cs/spa7Ech+FjeJR
 uUtVmD7cSnZ+6KeETxIeGJ0LCoLK580X2oh6bF3SdRoFLS9qASFrCRLqkuU8kF6S2ACiwM7IiOmiu
 oBoszR+/N1SUVPi7YNRMxU4uJtkfnXpcrxOPlR13goCBbbNOenZLqK62kfj9sGUBHTcbF5g3FTVxw
 n11VCCHII9HBNq41D32dMXZ9Fb7qBP0hL4b6s7oAcTeL2Bu0h4/MjCioH7Ztg72L0Euz6vKk6S1fn
 IsDFZLUIoXwX4dv7bzSbFJsPiqNInlB60/tAjzguvvt+6wWAoyIzSL874/4HpJNxsguwpae0OdnVS
 XWKn310Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uXIO1-0000000CwiZ-3tcP;
 Thu, 03 Jul 2025 11:45:53 +0000
Date: Thu, 3 Jul 2025 12:45:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "hch@infradead.org" <hch@infradead.org>
Cc: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>,
 "tytso@mit.edu" <tytso@mit.edu>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "brauner@kernel.org" <brauner@kernel.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "tursulin@ursulin.net" <tursulin@ursulin.net>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chentao325@qq.com" <chentao325@qq.com>,
 "frank.li@vivo.com" <frank.li@vivo.com>
Subject: Re: [PATCH v3 4/4] ext4: support uncached buffered I/O
Message-ID: <aGZtcSIryAj4zJtF@casper.infradead.org>
References: <20250627110257.1870826-1-chentaotao@didiglobal.com>
 <20250627110257.1870826-5-chentaotao@didiglobal.com>
 <aF7OzbVwXqbJaLQA@casper.infradead.org>
 <aGIxiOeJ_-lmRmiT@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGIxiOeJ_-lmRmiT@infradead.org>
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

On Sun, Jun 29, 2025 at 11:41:12PM -0700, hch@infradead.org wrote:
> On Fri, Jun 27, 2025 at 06:03:09PM +0100, Matthew Wilcox wrote:
> > On Fri, Jun 27, 2025 at 11:03:13AM +0000, 陈涛涛 Taotao Chen wrote:
> > I think this needs to be:
> > 
> > 	if (iocb && iocb->ki_flags & IOCB_DONTCACHE)
> > 
> > because it's legit to call write_begin with a NULL argument.  The
> > 'file' was always an optional argument, and we should preserve that
> > optionality with this transformation.
> 
> write_begin and write_end are only callbacks through helpers called
> by the file system.  So if the file system never passes a NULL
> file/kiocb it doesn't need to check for it.

Sure, but some of those helpers are non-obvious, like page_symlink().

