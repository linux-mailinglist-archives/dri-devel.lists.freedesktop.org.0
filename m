Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C6A79AA8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 05:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0BD10E1E5;
	Thu,  3 Apr 2025 03:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ZXf9CJuv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D414210E113;
 Thu,  3 Apr 2025 03:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=j98rwQL7G8di/BtMjoHWfEqONBrRzM9ADm8HabBJsPs=; b=ZXf9CJuvoUH/YE50tXTG4O7y7B
 rgnnIdzHH4ih+uy9q+Zxo+7Bycoq/fP9k7VVNa89ePhRcOL6u3/fY/0qMnMssb+xaTLwHZgMR7e6h
 tEzEDVFicwQVGYeucAIE2BgpVdl/BcTayDpYZYejpY4HgBrrT/PLkoS3ED4PbzhupuG8PrkfYXJxG
 7IH30YgiWnEqITe6xTrx6b6fNflMNeHp3uBRsfLxd/7u+hcQ/gFnxD/lZp8k53eAf42bm51EDsrgf
 Cj88ngx2F139E/LMxJ4YlS1/vMQZ8WWC9AE52UurF+GhIU1CZvYHdkahDQNrcfyee89PBN7aPll4k
 qY+38SkQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1u0Be4-0000000Aw2v-1G9j;
 Thu, 03 Apr 2025 03:53:36 +0000
Date: Thu, 3 Apr 2025 04:53:36 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: linux-fsdevel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, David Howells <dhowells@redhat.com>,
 v9fs@lists.linux.dev
Subject: Re: [PATCH v2 1/9] 9p: Add a migrate_folio method
Message-ID: <Z-4GQO_HcmcRqWnD@casper.infradead.org>
References: <20250402150005.2309458-1-willy@infradead.org>
 <20250402150005.2309458-2-willy@infradead.org>
 <Z-4EiVQ6klHkkMoy@codewreck.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-4EiVQ6klHkkMoy@codewreck.org>
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

On Thu, Apr 03, 2025 at 12:46:17PM +0900, Dominique Martinet wrote:
> Matthew Wilcox (Oracle) wrote on Wed, Apr 02, 2025 at 03:59:55PM +0100:
> > The migration code used to be able to migrate dirty 9p folios by writing
> > them back using writepage.  When the writepage method was removed,
> > we neglected to add a migrate_folio method, which means that dirty 9p
> > folios have been unmovable ever since.  This reduced our success at
> > defragmenting memory on machines which use 9p heavily.
> 
> Given I'm not in Cc of the whole series I'm lacking context but I assume
> that means I'm not supposed to take this in.

Right; I'm routing this whole series via Christian.  There's various
bits of the VFS that need to be touched as part of this series, and
it'd take forever to get it all merged by going through individual
maintainer trees.

> I won't pretend I understand folios anyway, but commit messages makes
> sense to me:
> Acked-by: Dominique Martinet <asmadeus@codewreck.org>

Thanks!  Folios aren't really that hard a concept for a filesystem
developer to understand, but dhowells has done a great job of insulating
you from even having to understand them with netfs.  All they are is
a container of one-or-more pages which maintain all the filesystem
state which used to be managed per-page.  eg dirty, writeback, locked,
offset-in-file, number-of-mappings.

There's more to it from a MM point of view, but as a filesystem
developer, that's all you really need to understand.
