Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBABA79AAA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 05:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071EE10E904;
	Thu,  3 Apr 2025 03:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=codewreck.org header.i=@codewreck.org header.b="0HBoscdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 514 seconds by postgrey-1.36 at gabe;
 Thu, 03 Apr 2025 03:55:18 UTC
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
 by gabe.freedesktop.org (Postfix) with ESMTP id F241210E8F8;
 Thu,  3 Apr 2025 03:55:18 +0000 (UTC)
Received: from gaia.codewreck.org (localhost [127.0.0.1])
 by submarine.notk.org (Postfix) with ESMTPS id 67B0E14C2DB;
 Thu,  3 Apr 2025 05:46:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
 s=2; t=1743651996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ITcMLIFP5tKAjz41ehoKWCF5eQQiDYMOb1fN5yVdzj8=;
 b=0HBoscdFpgxuQgZl92opSENbMA9Pk+zXKbOYbpRJnb2fOIuhEQ1bwZ5rGPvmlYb+8wVHw8
 wHc2273ChihnbkPMTZ1/DAooFHD2hJ+0yffsGhHC9Cy9veCKiE8j7cW1KdfmCPrBKGxCoy
 Qn3m8QJ0MYx70hWGhV57dz2ZTADFzPnA6CZqQO0W6iJCwIBiDSjDSOwrvW/d4+WTVhVAcH
 g6HcnkJSY+HEZzS8B0uR8bH0QBVA+A0ZU2VyhxlEvsqXe3FXAMaHh6g4yHfkceyrco8IVL
 7ipXZTHnksTxDqR7U3ceJDpBoPzzk84gVw3dN7X3aD3CMOZtc1b/HQqenuVM/Q==
Received: from localhost (gaia.codewreck.org [local])
 by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 72519fa4;
 Thu, 3 Apr 2025 03:46:32 +0000 (UTC)
Date: Thu, 3 Apr 2025 12:46:17 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, David Howells <dhowells@redhat.com>,
 v9fs@lists.linux.dev
Subject: Re: [PATCH v2 1/9] 9p: Add a migrate_folio method
Message-ID: <Z-4EiVQ6klHkkMoy@codewreck.org>
References: <20250402150005.2309458-1-willy@infradead.org>
 <20250402150005.2309458-2-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402150005.2309458-2-willy@infradead.org>
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

Matthew Wilcox (Oracle) wrote on Wed, Apr 02, 2025 at 03:59:55PM +0100:
> The migration code used to be able to migrate dirty 9p folios by writing
> them back using writepage.  When the writepage method was removed,
> we neglected to add a migrate_folio method, which means that dirty 9p
> folios have been unmovable ever since.  This reduced our success at
> defragmenting memory on machines which use 9p heavily.
> 
> Fixes: 80105ed2fd27 (9p: Use netfslib read/write_iter)
> Cc: stable@vger.kernel.org
> Cc: David Howells <dhowells@redhat.com>
> Cc: v9fs@lists.linux.dev
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Given I'm not in Cc of the whole series I'm lacking context but I assume
that means I'm not supposed to take this in.

I won't pretend I understand folios anyway, but commit messages makes
sense to me:
Acked-by: Dominique Martinet <asmadeus@codewreck.org>

Thanks,
-- 
Dominique Martinet | Asmadeus
