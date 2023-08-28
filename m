Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF0A78B3E2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB75410E2F6;
	Mon, 28 Aug 2023 15:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1121 seconds by postgrey-1.36 at gabe;
 Mon, 28 Aug 2023 15:01:54 UTC
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk
 [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3F110E2F6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fitMFjTe7UlzOJPHkx2hghZeQ5bjBzNc1l5zMQdyLCI=; b=gUZNSERn182ydlMmD/JGiKZEsk
 OgLplGeOv9vuS9OA35h0aZ/IJvVVfJYA16NlznwAcJA1w9FpMTvQS7V139nKFCrrrZQVPptZW1Qnh
 NlrtaWY/AJACSI4Kt7OkQtm136BUQbytcXlI1DESQcEcKTQOF5yaAh/drfTjfw19mNNEA5xwfSgHe
 0BK4iM+Zmjh56/cqY3a2K7nBtryKUbD911r9z6wCXSRIUyA/UBBwxH86i7PeNcYMilqluP9xV6Zfc
 W/F3EDXvuA+TnyWLXwrAAsHLhDWLLd7vBqiildb/I0VtP2zlFjxC3ArtVa0CxBf7pI91HwBNsB6yE
 2vzIhf5A==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qadRy-001a4j-36; Mon, 28 Aug 2023 14:42:43 +0000
Date: Mon, 28 Aug 2023 15:42:42 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Xueshi Hu <xueshi.hu@smartx.com>
Subject: Re: [PATCH v2] fs: clean up usage of noop_dirty_folio
Message-ID: <20230828144242.GZ3390869@ZenIV>
References: <20230828075449.262510-1-xueshi.hu@smartx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828075449.262510-1-xueshi.hu@smartx.com>
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
Cc: nvdimm@lists.linux.dev, linux-fbdev@vger.kernel.org, linux-aio@kvack.org,
 djwong@kernel.org, linux-cxl@vger.kernel.org, linux-mm@kvack.org,
 adilger.kernel@dilger.ca, dave.jiang@intel.com, miklos@szeredi.hu,
 vishal.l.verma@intel.com, deller@gmx.de, hughd@google.com, willy@infradead.org,
 hch@infradead.org, linux-ext4@vger.kernel.org, jayalk@intworks.biz,
 dri-devel@lists.freedesktop.org, dan.j.williams@intel.com, brauner@kernel.org,
 tytso@mit.edu, muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, bcrl@kvack.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 mike.kravetz@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 28, 2023 at 03:54:49PM +0800, Xueshi Hu wrote:
> In folio_mark_dirty(), it can automatically fallback to
> noop_dirty_folio() if a_ops->dirty_folio is not registered.
> 
> As anon_aops, dev_dax_aops and fb_deferred_io_aops becames empty, remove
> them too.

I'd put the last sentence as 'In dev_dax_aops and fb_deferred_io_aops replacing
.dirty_folio with NULL makes them identical to default (empty_aops) and since
we never compare ->a_ops pointer with either of those, we can remove them
completely'.

There could've been places like
#define is_fb_deferred(mapping) (mapping)->a_ops == fb_deferred_io_aops
and those would've been broken by that.  The fact that there's nothing
of that sort in the tree ought to be mentioned in commit message.

Note that we *do* have places where method table comparisons are used
in predicates like that, so it's not a pure theory; sure, missing that
would've probably ended up with broken build, but that can easily be
dependent upon the config (and that, alas, is also not a pure theory -
BTDT).  In this case the change is correct, fortunately...

Other than that part of commit message -

Acked-by: Al Viro <viro@zeniv.linux.org.uk>
