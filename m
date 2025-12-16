Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D6CC51B8
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 21:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FCA10E2AD;
	Tue, 16 Dec 2025 20:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="l9KoJa0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124FF10E069;
 Tue, 16 Dec 2025 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3gpc6Uoat12G6CeOjQa+hU2d/ZT3lQcHMBgRvZ7BzJY=; b=l9KoJa0yZy7ZasWi/OXNxWNXmz
 df36BRAvU962fvAs34ZHEFjTntyDM7m7voN2aAj0LO5dBvPv44w53WyFp0N8LAccZiC5lTTLHuplK
 RXi2ixtnB3X6q5FdVn2Xzczd9jlWEIVflA6PDoOKIVISn1lXooltJBhimj9Dq+oD78icqfmy/M77N
 FpqvLzbypeJYm8ziVZPdhQPfM09/KrqCRTADwKHtoBwTwQYULSxAK6htT7yc5fQwiFM0/62iebTuV
 1trGiS2SxOo0+vC0oOop2HSoXYXjsrh7Ztyzw9ANI20Bf1rDSSJUhObZI+zNJhHLl/UffTGYzzxE7
 boZ+O3Og==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vVbks-00000003lA3-2Gl7;
 Tue, 16 Dec 2025 20:34:46 +0000
Date: Tue, 16 Dec 2025 20:34:46 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Subject: Re: [PATCH 1/4] mm/migrate: Add migrate_device_split_page
Message-ID: <aUHCZpnTNqv8wfdc@casper.infradead.org>
References: <20251216201206.1660899-1-francois.dugast@intel.com>
 <20251216201206.1660899-2-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216201206.1660899-2-francois.dugast@intel.com>
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

On Tue, Dec 16, 2025 at 09:10:11PM +0100, Francois Dugast wrote:
> +	ret = __split_unmapped_folio(folio, 0, page, NULL, NULL, SPLIT_TYPE_UNIFORM);

We're trying to get rid of uniform splits.  Why do you need this to be
uniform?
