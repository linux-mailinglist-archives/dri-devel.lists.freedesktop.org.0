Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A4542BEDC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 13:24:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1CB6EA1F;
	Wed, 13 Oct 2021 11:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8176E0AF;
 Wed, 13 Oct 2021 11:24:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="214347489"
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="214347489"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 04:24:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="491417739"
Received: from araghuw-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.208.234])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 04:24:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Len Baker <len.baker@gmx.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Prefer struct_size over open coded arithmetic
In-Reply-To: <20211011092304.GA5790@titan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211003104258.18550-1-len.baker@gmx.com>
 <20211011092304.GA5790@titan>
Date: Wed, 13 Oct 2021 14:24:05 +0300
Message-ID: <87k0ihxj56.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 11 Oct 2021, Len Baker <len.baker@gmx.com> wrote:
> Hi,
>
> On Sun, Oct 03, 2021 at 12:42:58PM +0200, Len Baker wrote:
>> As noted in the "Deprecated Interfaces, Language Features, Attributes,
>> and Conventions" documentation [1], size calculations (especially
>> multiplication) should not be performed in memory allocator (or similar)
>> function arguments due to the risk of them overflowing. This could lead
>> to values wrapping around and a smaller allocation being made than the
>> caller was expecting. Using those allocations could lead to linear
>> overflows of heap memory and other misbehaviors.
>>
>> In this case these are not actually dynamic sizes: all the operands
>> involved in the calculation are constant values. However it is better to
>> refactor them anyway, just to keep the open-coded math idiom out of
>> code.
>>
>> So, add at the end of the struct i915_syncmap a union with two flexible
>> array members (these arrays share the same memory layout). This is
>> possible using the new DECLARE_FLEX_ARRAY macro. And then, use the
>> struct_size() helper to do the arithmetic instead of the argument
>> "size + count * size" in the kmalloc and kzalloc() functions.
>>
>> Also, take the opportunity to refactor the __sync_seqno and __sync_child
>> making them more readable.
>>
>> This code was detected with the help of Coccinelle and audited and fixed
>> manually.
>>
>> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
>>
>> Signed-off-by: Len Baker <len.baker@gmx.com>
>> ---
>>  drivers/gpu/drm/i915/i915_syncmap.c | 12 ++++++++----
>>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> I received a mail telling that this patch doesn't build:
>
> == Series Details ==
>
> Series: drm/i915: Prefer struct_size over open coded arithmetic
> URL   : https://patchwork.freedesktop.org/series/95408/
> State : failure
>
> But it builds without error against linux-next (tag next-20211001). Against
> which tree and branch do I need to build?

drm-tip [1]. It's a sort of linux-next for graphics. I think there are
still some branches that don't feed to linux-next.

BR,
Jani.


[1] https://cgit.freedesktop.org/drm/drm-tip


>
> Regards,
> Len

-- 
Jani Nikula, Intel Open Source Graphics Center
