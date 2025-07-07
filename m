Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A1AFB686
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 16:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2714E10E298;
	Mon,  7 Jul 2025 14:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="dzLlM0hU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD8710E298;
 Mon,  7 Jul 2025 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=o/+i29+EsaHRjTzivT96VVcgGobCX8dLFJXYN29x5S0=; b=dzLlM0hUZ6iClIBOvZOKXBqq2C
 E+u6WgXHMDatqhaFYT9DdBAsUvrJjBRgmCufxUccg7Ddlr8RI5+RqFOfxeQ7SULeoE/ttv6qtPi79
 PMnphhz4vZu/BGyg9DF5KbWGTH5EFGB1GWGJ1qTRCdDkIqXo59u6NRG4KLeO/Mv626pnjHXYNpCuo
 LLPCNwfiLl6JUdeas3gqP5it3rgyFRu2il+fOheOCmaYOeq8YegBZDuKgqUVYw6KyC+VekTOg+AAV
 luqptV/g6COpriR6jZHeFGHPBY7hwh0/fSQBHyR81gGP6XUixw0hd63szAfYMVfU4PY0+xQTTrFeQ
 aBx8DwuQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uYnEu-0000000DVBX-0MLk;
 Mon, 07 Jul 2025 14:54:40 +0000
Date: Mon, 7 Jul 2025 15:54:39 +0100
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?B?6ZmI5rab5rab?= Taotao Chen <chentaotao@didiglobal.com>
Cc: "tytso@mit.edu" <tytso@mit.edu>, "hch@infradead.org" <hch@infradead.org>,
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
Message-ID: <aGvfr_rLUAHaUQkY@casper.infradead.org>
References: <20250707070023.206725-1-chentaotao@didiglobal.com>
 <20250707070023.206725-5-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707070023.206725-5-chentaotao@didiglobal.com>
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

On Mon, Jul 07, 2025 at 07:00:33AM +0000, 陈涛涛 Taotao Chen wrote:
> +++ b/mm/filemap.c

I think this should be a static inline function.  I don't think it's
worth moving out of line.  Of course if you have measurements that show
differently, you can change my mind.

> +/**
> + * write_begin_get_folio - Get folio for write_begin with flags
> + * @iocb: kiocb passed from write_begin (may be NULL)
> + * @mapping: the address space to search in
> + * @index: page cache index
> + * @len: length of data being written
> + *
> + * This is a helper for filesystem write_begin() implementations.
> + * It wraps __filemap_get_folio(), setting appropriate flags in
> + * the write begin context.
> + *
> + * Returns a folio or an ERR_PTR.

We prefer:

 * Return: A folio or an ERR_PTR

as this gets its own section in the kernel-doc output.

