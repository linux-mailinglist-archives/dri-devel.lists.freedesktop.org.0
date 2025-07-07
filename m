Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F9AFB333
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 14:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7710E1B5;
	Mon,  7 Jul 2025 12:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="LShA2euv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB47410E1B5;
 Mon,  7 Jul 2025 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vdT3AgUINABtwE8EihkZZFkgFWExnIToCc9PtsmmP28=; b=LShA2euvaWLp3TUtJvlXH4Hwc3
 ki8zSGrrYpbbC33U7vTxcSB2v4aYx9fsLxdfv0hO1B/XtIeVg/vZEKImqbzEgMt8xEpVIYBNxRJch
 JcPrfBezDUk+O3KyHrljn3gnhWcsZyP7o2vOY2+gzdmVd64pIIaGYt9cCBeE0o9Vr9yylRt4UdzkS
 7e54tjm/iMe2THJjQbAQWGnkaO2H+fTFod3+fh0cLaTV6A5NyQFJncPgujvjc3rN9/Q7g49jjNjSM
 1PnZ8enN3cylXat4ZIEkue08LwLKX4Y0udQqwhETMjTHK5aPm0sPrQxpQw31X9ZP/V5oUovGjOway
 6Bd4M5Fw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uYkvv-0000000CzOX-09LD;
 Mon, 07 Jul 2025 12:26:55 +0000
Date: Mon, 7 Jul 2025 13:26:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: hanqi <hanqi@vivo.com>
Cc: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>,
 "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>,
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
Subject: Re: [PATCH v4 4/5] mm/filemap: add write_begin_get_folio() helper
 function
Message-ID: <aGu9DiKbxpkq2xlx@casper.infradead.org>
References: <20250707070023.206725-5-chentaotao@didiglobal.com>
 <a4cc7c59-2dfd-497e-9f20-b12ea86a1baa@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4cc7c59-2dfd-497e-9f20-b12ea86a1baa@vivo.com>
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

On Mon, Jul 07, 2025 at 07:48:34PM +0800, hanqi wrote:
> I think it might be worth considering adding an fgf_t parameter to the
> write_begin_get_folio() helper, since in some filesystems the fgp_flags
> passed to __filemap_get_folio() in write_begin are not limited to just
> FGP_WRITEBEGIN. Something like:
> struct folio *write_begin_get_folio(const struct kiocb *iocb,
> 				    struct address_space *mapping,
> 				    pgoff_t index, size_t len,
>                                     fgf_t fgp_flags)

The point is to make the simple cases simple.  Filesystems which need
something more complicated can do it all themselves.  NAK your idea.
