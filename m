Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9VeGOdPycmmPrQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 05:02:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3748A703AF
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 05:02:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE310E00A;
	Fri, 23 Jan 2026 04:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A8fAVajn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7216810E00A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 04:02:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DBCA4416A6;
 Fri, 23 Jan 2026 04:02:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8987AC4CEF1;
 Fri, 23 Jan 2026 04:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769140942;
 bh=TMYM5m6tGo28iUrjDUIioNIuoRZ0IBLsfkBfGo+hI/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8fAVajn8xx+yw78n5luW+wQ0gVPWi09I8gQJoeotJwUNgQ3ivif3/raj6NXL1t4n
 5wgqMnhkNW9+uMmkdKvLjRFMzR3CLb+JDDSSqD5zTNkjHD0GmUUuKihAHpBekKP6io
 /2BRorhb8YKSZjnrZddEbmiz+WtglKND4CP5Z7XxjwzD0NyqWBkjxXC+2QSoCjrA2R
 X+FXWlI1PVNAL4nxnhI05CxgXymDXCRRSzqeV0Al+wikKNozfIeJDibRGqIoqSpJrw
 C20pe/ez7ip+F1Fxdq/6LnxNHGUETc5e7Ccgp6c0Ctrg7SynNcmw0ueFf81/TcV2sz
 Nt68QZIQ1o7Rg==
Date: Thu, 22 Jan 2026 23:02:21 -0500
From: Sasha Levin <sashal@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>,
 Karunika Choo <karunika.choo@arm.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 3/4] drm/panthor: Add tracepoint for hardware
 utilisation changes
Message-ID: <aXLyzd6pMmexwWlY@laps>
References: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
 <20260116-panthor-tracepoints-v10-3-d925986e3d1b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260116-panthor-tracepoints-v10-3-d925986e3d1b@collabora.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:olvaffe@gmail.com,m:karunika.choo@arm.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.212];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3748A703AF
X-Rspamd-Action: no action

Hi Nicolas,

On Fri, Jan 16, 2026 at 01:57:32PM +0100, Nicolas Frattaroli wrote:
>Mali GPUs have three registers that indicate which parts of the hardware
>are powered at any moment. These take the form of bitmaps. In the case
>of SHADER_READY for example, a high bit indicates that the shader core
>corresponding to that bit index is powered on. These bitmaps aren't
>solely contiguous bits, as it's common to have holes in the sequence of
>shader core indices, and the actual set of which cores are present is
>defined by the "shader present" register.
>
>When the GPU finishes a power state transition, it fires a
>GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
>received, the _READY registers will contain new interesting data. During
>power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
>the registers will likewise contain potentially changed data.
>
>This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
>which is something related to Mali v14+'s power control logic. The
>_READY registers and corresponding interrupts are already available in
>v9 and onwards.
>
>Expose the data as a tracepoint to userspace. This allows users to debug
>various scenarios and gather interesting information, such as: knowing
>how much hardware is lit up at any given time, correlating graphics
>corruption with a specific powered shader core, measuring when hardware
>is allowed to go to a powered off state again, and so on.
>
>The registration/unregistration functions for the tracepoint go through
>a wrapper in panthor_hw.c, so that v14+ can implement the same
>tracepoint by adding its hardware specific IRQ on/off callbacks to the
>panthor_hw.ops member.
>
>Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>---
> drivers/gpu/drm/panthor/panthor_gpu.c   | 28 +++++++++++++++
> drivers/gpu/drm/panthor/panthor_gpu.h   |  2 ++
> drivers/gpu/drm/panthor/panthor_hw.c    | 62 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/panthor/panthor_hw.h    |  8 +++++
> drivers/gpu/drm/panthor/panthor_trace.h | 58 ++++++++++++++++++++++++++++++
> 5 files changed, 158 insertions(+)
>
>diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
>index 9304469a711a..2ab444ee8c71 100644
>--- a/drivers/gpu/drm/panthor/panthor_gpu.c
>+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
>@@ -22,6 +22,9 @@
> #include "panthor_hw.h"
> #include "panthor_regs.h"
>
>+#define CREATE_TRACE_POINTS
>+#include "panthor_trace.h"

With this commit, I'm seeing:

In file included from drivers/gpu/drm/panthor/panthor_trace.h:86,
                  from drivers/gpu/drm/panthor/panthor_gpu.c:26:
./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory
   118 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)

I think we need to add in 'CFLAGS_panthor_gpu.o := -I$(src)' to the Makefile
too, but I haven't tested that yet.

-- 
Thanks,
Sasha
