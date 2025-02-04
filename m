Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A89EA27E46
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 23:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2858510E6FE;
	Tue,  4 Feb 2025 22:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9C410E6FE;
 Tue,  4 Feb 2025 22:28:06 +0000 (UTC)
Message-ID: <158e099d-6548-4de8-ba13-7de3277da82e@lankhorst.se>
Date: Tue, 4 Feb 2025 23:28:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-resent-to-correct-ml 3/8] drm/xe: Add scoped guards for
 xe_force_wake
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
References: <20250204132238.162608-1-dev@lankhorst.se>
 <20250204132238.162608-4-dev@lankhorst.se>
 <2ced99ce-fd3e-4966-b093-c193b6c8b400@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <2ced99ce-fd3e-4966-b093-c193b6c8b400@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hey,


On 2025-02-04 17:30, Michal Wajdeczko wrote:
> Hi Maarten,
> 
> On 04.02.2025 14:22, Maarten Lankhorst wrote:
>> Instead of finding bugs where we may or may not release force_wake, I've
>> decided to be inspired by the spinlock guards, and use the same ones to
>> do xe_force_wake handling.
> 
> You may want to take a look at [1], which was based on [2], that
> introduce fw guard class (and it was already acked and reviewed).
> Merging was postponed only due to a request to prepare larger series
> that would convert all existing usages to the new model.
> 
> And similar guard approach for our RPM was proposed in [3]
> 
> Michal
> 
> [1] https://patchwork.freedesktop.org/series/141516/
> [2] https://patchwork.freedesktop.org/series/134958/
> [3] https://patchwork.freedesktop.org/series/134955/

Excellent. I'm glad we're in agreement that doing forcewake handling in 
guard handlers is a good thing. :-)

I have taken a look at the patch series. I think the approach I've taken 
is a refinement of your series. Yours is already nearly there, but it 
still keeps the rough edges of the original API.

To smooth them, I have created 2 constructors, xe_force_wake, and 
xe_force_wake_get. The former is used if you want to run code regardless 
whether it succeeds, the latter is when you do.

This allows code like:
scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, 
XE_FORCE_WAKE_ALL) {}
to work flawlessly as intended, without having to check 
xe_force_wake_ref_has_domain(XE_FORCE_WAKE_ALL);

I think this cleanup removes a nasty source of errors.

When you don't care about failure:
scoped_guard(xe_force_wake, fw, XE_FORCE_WAKE_ALL) {
	if (!xe_force_wake_scope_has_domain(XE_FORCE_WAKE_ALL))
		printk("Oh noez, anyway..\n");

	/* Continue and pretend nothing happened */
}

And for optional code, same as scoped_cond_guard, but as scoped_guard:

scoped_guard(xe_force_wake_get, fw, XE_FORCE_WAKE_ALL) {
	/* Only runs this block if acquire completely succeeded, otherwise use 
xe_force_wake */
}

All in all, I'm open for bikesheds, but I think this has the potential 
to improve xe_force_wake handling even further!

I wasn't aware of your previous attempt when I wrote this and fought 
linux/cleanup.h, otherwise I would have taken that as a base and credit 
your work.

Cheers,
~Maarten

