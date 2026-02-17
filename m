Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id i+5ZLDgSlGk1/wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:01:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261E9149160
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 08:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD5310E0EB;
	Tue, 17 Feb 2026 07:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="uY3/kyKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA3C10E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 07:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=7whLfHtrwixcpFYAilK93BQ7JEuEzGUjhW1Qjky9ZDI=; b=uY3/kyKFYgVpqLuI1xZzHdJiMN
 tio6JDD4VrwqvbmuVLCB5dge4bc7R58r+7tzG2vodO7t2rPSPeOe+743AyrcBW1lJYHqtaXifZ8ts
 CM7HxDhT0JuotzNf2JsPCUh5nkbxNfzQ/wWURVFrH4cr5SJls5V7C4D28ejjqMIehl51qW93LcGoA
 FVLbbTnyTP02u+9HETXsXc7A21zEgOqeFGPEN2NUAkQB+bke7htZ9SqR7ZQvHXzjPaUmyEwifjoCu
 gUIajRww4N9KCaETy9MvQcSJcLrhN3YbofUAWgcmW5745WXEAsq8tKtG28uQdQnnvtzfcOTkLgfND
 glq/b5SQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Ross Cawston <ross@r-sc.ca>
Cc: linux-kernel@vger.kernel.org, tomeu@tomeuvizoso.net, ogabbay@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jeff.hugo@oss.qualcomm.com,
 jani.nikula@intel.com, me@brighamcampbell.com, Ross Cawston <ross@r-sc.ca>
Subject: Re: [PATCH] accel/rocket: Add per-task flags and interrupt mask for
 flexible job handling
Date: Tue, 17 Feb 2026 08:00:58 +0100
Message-ID: <3327246.2IRrRt1zHL@diego>
In-Reply-To: <20260216183819.99991-1-ross@r-sc.ca>
References: <20260216183819.99991-1-ross@r-sc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,tomeuvizoso.net,kernel.org,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com,intel.com,brighamcampbell.com,r-sc.ca];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sntech.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:dkim]
X-Rspamd-Queue-Id: 261E9149160
X-Rspamd-Action: no action

Am Montag, 16. Februar 2026, 19:38:19 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Ross Cawston:
> The Rocket NPU supports multiple task types:
> - Convolutional workloads that use CNA, Core, and DPU blocks
> - Standalone post-processing (PPU) tasks such as pooling and element-wise=
 operations
> - Pipelined DPU=E2=86=92PPU workloads
>=20
> The current driver has several limitations that prevent correct execution=
 of
> non-convolutional workloads and multi-core operation:
>=20
> - CNA and Core S_POINTER registers are always initialized, re-arming them
>   with stale state from previous jobs and corrupting standalone DPU/PPU t=
asks.
> - Completion is hard-coded to wait only for DPU interrupts, causing PPU-o=
nly
>   or DPU=E2=86=92PPU pipeline jobs to time out.
> - Ping-pong mode is unconditionally enabled, which is unnecessary for
>   single-task jobs.
> - Non-zero cores hang because the vendor-specific "extra bit" (bit 28 =C3=
=97 core
>   index) in S_POINTER is not set; the BSP sets this via MMIO because user=
space
>   cannot know which core the scheduler will select.
> - Timeout and IRQ debugging information is minimal.
>=20
> This patch introduces two new per-task fields to struct rocket_task:
>=20
> - u32 int_mask: specifies which block completion interrupts signal task d=
one
>   (DPU_0|DPU_1 for convolutional/standalone DPU, PPU_0|PPU_1 for PPU task=
s).
>   Zero defaults to DPU_0|DPU_1 for backward compatibility.
> - u32 flags: currently used for ROCKET_TASK_NO_CNA_CORE to indicate stand=
alone
>   DPU/PPU tasks that must not touch CNA/Core state.
>=20
> Additional changes:
> - Only initialize CNA and Core S_POINTER (with the required per-core extr=
a bit)
>   when ROCKET_TASK_NO_CNA_CORE is not set.
> - Set the per-core extra bit via MMIO to fix hangs on non-zero cores.
> - Enable ping-pong mode only when the job contains multiple tasks.
> - Mask and clear interrupts according to the task's int_mask.
> - Accept both DPU and PPU completion interrupts in the IRQ handler.
> - Minor error-path fix in GEM object creation (check error after unlocking
>   mm_lock).
>=20
> These changes, derived from vendor BSP behavior, enable correct execution
> of PPU-only tasks, pipelined workloads, and reliable multi-core operation
> while preserving backward compatibility.

Missing a Signed-off-by line.

Please see
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#deve=
loper-s-certificate-of-origin-1-1


Heiko

> ---
>  drivers/accel/rocket/rocket_gem.c |  2 +
>  drivers/accel/rocket/rocket_job.c | 99 +++++++++++++++++++++++++------
>  drivers/accel/rocket/rocket_job.h |  2 +
>  include/uapi/drm/rocket_accel.h   | 30 ++++++++++
>  4 files changed, 115 insertions(+), 18 deletions(-)



