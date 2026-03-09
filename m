Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id d7RAHA7IrmmjIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:15:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E52398B1
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F59C10E507;
	Mon,  9 Mar 2026 13:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CVY6w5gI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C5D10E4B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773062153;
 bh=VBwUP8Am8HbGASinIfeDetEFkcPA+W/3zn8rDATorEE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CVY6w5gI22fYLurB2Bn7ZzSc63ZvFLEzSIn+azvQHaBo5BOS5KgaH1gVBdUAK16Lw
 6fp+egMYZz7LOK237GHI4ukAuVzRukJFCz/fdgExLbOgyt2h4yiYmhmFi9B7wJ2OIU
 QaqkjNvHT3Ns2bQJO2FUOlwP7RgCeSOiXjNYTrP6R4Gd7poFIRBXxVvC/JdQQNWmU3
 oT2Ods+357222yk1zn3q5AOeO5j2Jdqz0Eg01Md923Z6ryRzgGsj/7D3yTsGhnCGxd
 9Dwz9byCpoLMTxgJGvEO7iRJhYS4yp38PH5VJN7JO9Y/iXyREJJeBwOQxmTCzXC0Jj
 0X8bKZXgGgB5g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B41FD17E0D90;
 Mon,  9 Mar 2026 14:15:52 +0100 (CET)
Date: Mon, 9 Mar 2026 14:15:49 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Philipp Stanner <phasta@kernel.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/panthor: Fix the "done_fence is initialized"
 detection logic
Message-ID: <20260309141549.3b254c46@fedora>
In-Reply-To: <aa6pYsoS6Ahdi8nu@e142607>
References: <20260309103053.211415-1-boris.brezillon@collabora.com>
 <aa6pYsoS6Ahdi8nu@e142607>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
X-Rspamd-Queue-Id: EF6E52398B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:liviu.dudau@arm.com,m:steven.price@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:dkim]
X-Rspamd-Action: no action

On Mon, 9 Mar 2026 11:05:06 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> > After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> > dma_fence::ops == NULL can't be used to check if the fence is initialized
> > or not. We could turn this into an "is_signaled() || ops == NULL" test,
> > but that's fragile, since it's still subject to dma_fence internal
> > changes. So let's have the "is_initialized" state encoded directly in
> > the pointer through the lowest bit which is guaranteed to be unused
> > because of the dma_fence alignment constraint.  
> 
> I'm confused! There is only one place where we end up being interested if the
> fence has been initialized or not, and that is in job_release(). I don't
> see why checking for "ops != NULL" before calling dma_fence_put() should not
> be enough,

Because after 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
dma_fence->ops is set back to NULL at signal time[1].

> or even better, why don't we call dma_fence_put() regardless,
> as the core code should take care of an uninitialized dma_fence AFAICT.

When the job is created, we pre-allocate the done_fence, but we leave it
uninitialized until ::run_job() is called. If we call
dma_fence_release() (through dma_fence_put()) on a dma_fence that was
not dma_fence_init()-ialized, we have a NULL deref on the cb_list, and
probably other issues too.

[1]https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/dma-buf/dma-fence.c?ref_type=heads#L373
