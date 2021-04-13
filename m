Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA1235D94D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:50:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150F76E213;
	Tue, 13 Apr 2021 07:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA366E213;
 Tue, 13 Apr 2021 07:50:21 +0000 (UTC)
IronPort-SDR: Aq4V4eyOdeM5gbgbGMzhd51qTLDALSkZpcaIPEQBZYuEVx7hDMhbW7OVWGhKbXSPaRP376u+/e
 9G0L53Gs4mig==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="192230978"
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="192230978"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 00:50:20 -0700
IronPort-SDR: JJ4o7hXjsOjKgdOlGzSEWmuuEKzO5JijVvUewT8/TuOCnVF7OdJ9B+zp1nbu+oK4WRM8c7jqPJ
 Ltac61jQq9eQ==
X-IronPort-AV: E=Sophos;i="5.82,218,1613462400"; d="scan'208";a="460491215"
Received: from aericson-mobl1.ger.corp.intel.com ([10.249.254.233])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2021 00:50:18 -0700
Message-ID: <62e5b25ce7e22633c09fb0242a69d268b3b45595.camel@linux.intel.com>
Subject: [RFC] Cross-driver ww transaction lock lists
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 13 Apr 2021 09:50:15 +0200
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthew Auld <matthew.auld@intel.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

During the dma_resv conversion of the i915 driver, we've been using ww
transaction lock lists to keep track of ww_mutexes that are locked
during the transaction so that they can be batch unlocked at suitable
locations. Including also the LMEM/VRAM eviction we've ended up with
two static lists per transaction context; one typically unlocked at the
end of transaction and one initialized before and unlocked after each
buffer object validate. This enables us to do sleeping locking at
eviction and keep objects locked on the eviction list until we
eventually succeed allocating memory (modulo minor flaws of course).

It would be beneficial with the i915 TTM conversion to be able to
introduce a similar functionality that would work in ttm but also
cross-driver in, for example move_notify. It would also be beneficial
to be able to put any dma_resv ww mutex on the lists, and not require
it to be embedded in a particular object type.

I started scetching on some utilities for this. For TTM, for example,
the idea would be to pass a list head for the ww transaction lock list
in the ttm_operation_ctx. A function taking a ww_mutex could then
either attach a grabbed lock to the list for batch unlocking, or be
responsible for unlocking when the lock's scope is exited. It's also
possible to create sublists if so desired. I believe the below would be
sufficient to cover the i915 functionality.

Any comments and suggestions appreciated!

8<------------------------------------------------------

#ifndef _TRANSACTION_LOCKLIST_H_
#define _TRANSACTION_LOCKLIST_H_

struct trans_lockitem;

/**
 * struct trans_locklist_ops - Ops structure for the ww locklist
functionality.
 *
 * Typically a const struct trans_locklist_ops is defined for each type
that
 * embeds a struct trans_lockitem, or hav a struct trans_lockitem
pointing
 * at it using the private pointer. It can be a buffer object,
reservation
 * object, a single ww_mutex or even a sublist of trans_lockitems. 
 */
struct trans_locklist_ops {
	/**
	 * slow_lock: Slow lock to relax the transaction. Only used by
	 * a contending lock item.
	 * @item: The struct trans_lockitem to lock
	 * @intr: Whether to lock interruptible
	 *
	 * Return: -ERESTARTSYS: Hit a signal when relaxing,
	 * -EAGAIN, relaxing succesful, but the contending lock
	 * remains unlocked.
	 */
	int (*slow_lock) (struct trans_lockitem *item, bool intr);

	/**
	 * unlock: Unlock.
	 * @item: The struct trans_lockitem to unlock.
	 */
	void (*unlock) (struct trans_lockitem *item);

	/**
	 * unlock: Unlock.
	 * @item: The struct trans_lockitem to put. This function may
be NULL.
	 */
	void (*put) (struct trans_lockitem *item);
};

/**
 * struct trans_lockitem
 * @ops: Pointer to an Ops structure for this lockitem.
 * @link: List link for the transaction locklist.
 * @private: Private info.
 * @relax_unlock: Unlock contending lock after relaxation since it is
 * likely not needed after a transaction restart.
 *
 * A struct trans_lockitem typically represents a single lock, but is
 * generic enough to represent a sublist of locks. It can either be
 * embedded, or allocated on demand. A kmem_cache might be beneficial.
 */
struct trans_lockitem {
	const struct trans_locklist_ops *ops;
	struct list_head link;
	u32 relax_unlock:1;
	void *private;
};

/* unlock example */
static inline void trans_unlock_put_all(struct list_head *list)
{
	struct trans_lockitem *lock, *next;

	list_for_each_entry_safe(lock, next, typeof(*lock), link) {
		lock->ops->unlock(lock);
		list_del_init(&lock->link);
		if (lock->ops_put)
			lock->ops->put(lock);
	}
}

/* Backoff example */
static inline int __must_check trans_backoff(struct list_head *list,
bool intr,
					     struct trans_lockitem
*contending)
{
	int ret = 0;

	trans_unlock_put_all(list);
	if (contending) {
		ret = contending->ops->slow_lock(contending, intr);
		if (!ret && contending->relax_unlock)
			contending->unlock(contending);
		if (ret == -EAGAIN)
			ret = 0;
		contending->ops->put(contending);
	}

	return ret;
}
		
		
#endif _TRANSACTION_LOCKLIST_


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
