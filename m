Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBysB/DPc2kCywAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:45:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6107A445
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 20:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CEB10EBD1;
	Fri, 23 Jan 2026 19:45:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LIIi02yM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E110EBD1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 19:45:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 04F03600CB;
 Fri, 23 Jan 2026 19:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5DFC4AF09;
 Fri, 23 Jan 2026 19:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769197547;
 bh=Nk5uzwoANqoRcY0cyp5LaiHtC5a0UyLUtk/IP3OWMKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIIi02yMrQuLR+TVEFHs16e/I1F4H7xVXaJChuCbpQfnDLX4uyiUQvg9zPm6crSOM
 ihrR+MUO5UpOfgirGWahj2tellfWWVxKxWlsQ9isznVPcUsOjWuEZxBGTwEZaySc+Q
 d+cO12Wwz/aRnQYcsmdpo8M3qxfO2g5kl0GQ+3k4DCWWY5tfXxNLTcxn6SP1EKgV+j
 ZqXV9pCuw3euXYs8Ycpqx46o/065Pmp+/OMZ41423AocyKevMpox5R17H9vYR3QQrO
 K9kXYe/Wh9Jrj06MHvbnHYqwform/dWZM6Qc+PJZEk/Ccfzclr7GrMqEfE6VRwitw8
 KqHen0oAbEyuQ==
Date: Fri, 23 Jan 2026 12:45:42 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sasha Levin <sashal@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
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
Message-ID: <20260123194542.GA75720@ax162>
References: <20260116-panthor-tracepoints-v10-0-d925986e3d1b@collabora.com>
 <20260116-panthor-tracepoints-v10-3-d925986e3d1b@collabora.com>
 <aXLyzd6pMmexwWlY@laps> <3154579.irdbgypaU6@workhorse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3154579.irdbgypaU6@workhorse>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:sashal@kernel.org,m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:olvaffe@gmail.com,m:karunika.choo@arm.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,collabora.com,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.232];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CC6107A445
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 01:52:19PM +0100, Nicolas Frattaroli wrote:
> On Friday, 23 January 2026 05:02:21 Central European Standard Time Sasha Levin wrote:
> > With this commit, I'm seeing:
> > 
> > In file included from drivers/gpu/drm/panthor/panthor_trace.h:86,
> >                   from drivers/gpu/drm/panthor/panthor_gpu.c:26:
> > ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory
> >    118 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
> > 
> > I think we need to add in 'CFLAGS_panthor_gpu.o := -I$(src)' to the Makefile
> > too, but I haven't tested that yet.
> > 
> > 
> 
> Huh, puzzling that I never ran into this build failure.
> 
> Doing another build right now, I still can't reproduce it even on a clean
> build without ccache. Your fix looks appropriate though judging by the LWM[1]
> series on event tracepoints.
> 
> I'll submit a fix for this.

You will only see this when building in-tree (i.e., no O= or
KBUILD_OUTPUT) because $(src) and $(obj) are only added to the include
path automatically when building out of tree (see scripts/Makefile.lib,
search for 'ifdef building_out_of_srctree'), which could explain why you
(and presumably Mark doing -next) have not seen this error yet.

  $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- O=build defconfig drivers/gpu/drm/panthor/panthor_gpu.o

  $ make -skj"$(nproc)" ARCH=arm64 CROSS_COMPILE=aarch64-linux- defconfig drivers/gpu/drm/panthor/panthor_gpu.o
  In file included from drivers/gpu/drm/panthor/panthor_trace.h:86,
                   from drivers/gpu/drm/panthor/panthor_gpu.c:26:
  ./include/trace/define_trace.h:118:42: fatal error: ./panthor_trace.h: No such file or directory
    118 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
        |                                          ^
  compilation terminated.

Cheers,
Nathan
