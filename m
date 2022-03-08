Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF3D4D2057
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 19:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9181F10E36A;
	Tue,  8 Mar 2022 18:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC9910E36A;
 Tue,  8 Mar 2022 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646764799; x=1678300799;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oD1keZ4HS35nU2CHh4FjVL4E7BBttStbuF53PMNs8HY=;
 b=T+tbAGLJFKgvCefPXu1251ys3P6VWQXzxdj9yo7C/juAb0CyWlZD0E49
 MVu+Gyvad1chdh9uVuFRKaqF63kBrQo1hlo71FIg7zkyZD/FRcLJbqsJg
 XtUsDACZcbPIOzETwTdgLzit2RLWpZrKr2Shn7D2U4q7GrXTd+r+oGH8Y
 aaJ9xEXwvuzp4JJxF8A5u4MVJfQuIncSn3TtVxEOmoSP+xegpBWAhn1vE
 tu32Rxsbtnn2JMhNq7J2XTIaw9/z8UYnxRH8KuyaraYK2+jD0LTnXAtK3
 U+w0CQnu8pcC2auwtEl2/LZoB/59QdevXjNy+3jG3oRWCqYjLdM0DP+Qw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="242221783"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="242221783"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 10:39:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="513221884"
Received: from abagarwa-mobl1.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.156.1])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 10:39:37 -0800
Date: Tue, 8 Mar 2022 10:39:37 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/xehp: Drop aux table invalidation
 on FlatCCS platforms
Message-ID: <20220308183937.x3xbwyeg4iwt3do3@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220301052952.1706597-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220301052952.1706597-1-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 09:29:52PM -0800, Matt Roper wrote:
>Platforms with FlatCCS do not use auxiliary planes for compression
>control data and thus do not need traditional aux table invalidation
>(and the registers no longer even exist).
>
>Original-author: CQ Tang
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 28 ++++++++++++++++--------
> 1 file changed, 19 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>index 1f8cf4f790b2..13bbbf5d9737 100644
>--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
>@@ -231,7 +231,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>
> 	if (mode & EMIT_INVALIDATE) {
> 		u32 flags = 0;
>-		u32 *cs;
>+		u32 *cs, count;
>
> 		flags |= PIPE_CONTROL_COMMAND_CACHE_INVALIDATE;
> 		flags |= PIPE_CONTROL_TLB_INVALIDATE;
>@@ -246,7 +246,12 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>
> 		flags |= PIPE_CONTROL_CS_STALL;
>
>-		cs = intel_ring_begin(rq, 8 + 4);
>+		if (!HAS_FLAT_CCS(rq->engine->i915))
>+			count = 8 + 4;
>+		else
>+			count = 8;

u32 count = 8;

...

if (!HAS_FLAT_CCS(rq->engine->i915))
	count += 4;

would probably be shorter, or even

cs = intel_ring_begin(rq, HAS_FLAT_CCS(...) ? 12 : 8)


but doesn't really matter

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
