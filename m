Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB3EAE6598
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 14:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5000610E592;
	Tue, 24 Jun 2025 12:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="TOXe86FT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7111B88784;
 Tue, 24 Jun 2025 12:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=FvVXFAHgqlVXaYjZe73wCkbdcF0aH935v03BBBUDZRY=; b=TOXe86FTv0MPRze00++nXzCcJA
 +5PyOKUZ7cpy6JL2U5kGvgMu8ORyFaZziNTER/jEp4X62HR4Ibj3jFCUUFP9BzEHGo/EOKRRtkMUG
 QFladtV50stPYTTm/+Ui8/nB+VdNdi6nXE6cBhsrXkN5TrMABlbLnzZvhIqJHBshB9CSF5hJ7Tfrx
 yup8lhHQJR9weUS7kmICBfirR7/u4A5u61/IZxu+gVxvfyRocRkN1DePS0jMuM+GMRCaOagHMGIH6
 aBO2xir65idRZ2xulTdiQBi0jWpVLfs6t7VVEY5jijZ4TUG6QZVY03q+aL71XwHitc7/vBvc5gawa
 KxFqJ/sw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uU3AA-00000006cFM-28B1;
 Tue, 24 Jun 2025 12:54:10 +0000
Date: Tue, 24 Jun 2025 13:54:10 +0100
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
 "chentao325@qq.com" <chentao325@qq.com>
Subject: Re: [PATCH v2 0/5] fs: refactor write_begin/write_end and add ext4
 IOCB_DONTCACHE support
Message-ID: <aFqf8sbGsQ0kEme3@casper.infradead.org>
References: <20250624121149.2927-1-chentaotao@didiglobal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624121149.2927-1-chentaotao@didiglobal.com>
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

On Tue, Jun 24, 2025 at 12:11:59PM +0000, 陈涛涛 Taotao Chen wrote:
> From: Taotao Chen <chentaotao@didiglobal.com>
> 
> This patch series refactors the address_space_operations write_begin()
> and write_end() callbacks to take struct kiocb * as their first argument,
> allowing IOCB flags such as IOCB_DONTCACHE to propagate to filesystem’s
> buffered write path.
> 
> Ext4 is updated to implement handling of the IOCB_DONTCACHE flag in its
> buffered write path and to advertise support via the FOP_DONTCACHE file
> operation flag.
> 
> Additionally, the i915 driver’s shmem write paths are updated to bypass
> the legacy write_begin/write_end interface in favor of directly calling
> write_iter(), using a constructed synchronous kiocb. Another i915 patch
> replaces a manual write loop with kernel_write() in shmem object creation.

Thanks, this is a really good cleanup.
