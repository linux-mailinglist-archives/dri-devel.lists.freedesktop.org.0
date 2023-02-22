Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7438169F908
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 17:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16910EA42;
	Wed, 22 Feb 2023 16:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BCC10EA41;
 Wed, 22 Feb 2023 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SOMAXJwuOYnxZLUdHf/OeEwA8P1Ab3R3hBjhrroB6DQ=; b=F/djVcahuqYy22dKlFrvTVKlMT
 YBgXYrjK9IRvmtgHlYcfU8nb/7D9DzLNFitR4kb1YsO/992uxqNJwuzL0k1b4jmwsQD9qO6yxaiNq
 BUcdHA2F9xzUNy/c/OElaUZqAvZED6crTgUYHVD6ZiJl/qJKbrZa7UOShP3sbfE398i94OXmlz1qP
 RznFhC8FBMCGxluiy0udPkFnkZbCzfKOJZ0zDJewsOpK/SrX4/3WjfXNY7CAU8bRNbv5rnEZ2u023
 CIe4y2z4r209xoFymPFblyHfBM+H8JvjLfWf+MA/VtKYVI2oaHZCETsJm6s+v5ukIe+SCjdbPDIhj
 lMy+t7kw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pUs2O-00Daaj-Np; Wed, 22 Feb 2023 16:32:12 +0000
Date: Wed, 22 Feb 2023 16:32:12 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
Message-ID: <Y/ZDjJmc4aGRGyVn@casper.infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
 <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
 <Y/ONYhyDCPEYH1ml@casper.infradead.org>
 <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
 <Y/PZH/q2Xsr3od9m@casper.infradead.org> <Y/TXPasvkhtGiR+w@pollux>
 <Y/UN50hCaRe+8ZCg@casper.infradead.org>
 <91d34e47-10f6-8278-ef4c-72cdfa24e038@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91d34e47-10f6-8278-ef4c-72cdfa24e038@redhat.com>
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
Cc: matthew.brost@intel.com, bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 22, 2023 at 05:11:34PM +0100, Danilo Krummrich wrote:
> On 2/21/23 19:31, Matthew Wilcox wrote:
> > on tue, feb 21, 2023 at 03:37:49pm +0100, danilo krummrich wrote:
> > > It feels a bit weird that I, as a user of the API, would need to lock certain
> > > (or all?) mas_*() functions with the internal spinlock in order to protect
> > > (future) internal features of the tree, such as the slab cache defragmentation
> > > you mentioned. Because from my perspective, as the generic component that tells
> > > it's users (the drivers) to take care of locking VA space operations (and hence
> > > tree operations) I don't have an own purpose of this internal spinlock, right?
> > 
> > You don't ... but we can't know that.
> 
> Thanks for the clarification. I think I should now know what to for the
> GPUVA manager in terms of locking the maple tree in general.
> 
> Though I still have very limited insights on the maple tree I want to share
> some further thoughts.
> 
> From what I got so far it really seems to me that it would be better to just
> take the internal spinlock for both APIs (normal and advanced) whenever you
> need to internally.

No.  Really, no.  The point of the advanced API is that it's a toolbox
for doing the operation you want, but isn't a generic enough operation
to be part of the normal API.  To take an example from the radix
tree days, in the page cache, we need to walk a range of the tree,
looking for any entries that are marked as DIRTY, clear the DIRTY
mark and set the TOWRITE mark.  There was a horrendous function called
radix_tree_range_tag_if_tagged() which did exactly this.  Now look at
the implementation of tag_pages_for_writeback(); it's a simple loop over
a range with an occasional pause to check whether we need to reschedule.

But that means you need to know how to use the toolbox.  Some of the
tools are dangerous and you can cut yourself on them.

> Another plus would probably be maintainability. Once you got quite a few
> maple tree users using external locks (either in the sense of calling

I don't want maple tree users using external locks.  That exists
because it was the only reasonable way of converting the VMA tree
from the rbtree to the maple tree.  I intend to get rid of
mt_set_external_lock().  The VMAs are eventually going to be protected
by the internal spinlock.

