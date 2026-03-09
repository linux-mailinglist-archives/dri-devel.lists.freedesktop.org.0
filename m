Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIp7H9mprmntHQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 12:07:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3446E237904
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 12:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D0910E4D4;
	Mon,  9 Mar 2026 11:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q5SYe+lw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3728710E4D3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1773054420;
 bh=6qSBAgBZLKbkJx6qoZHtP98jrFNMgxjkOVsGUm65f4Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q5SYe+lwO747SpISzNopS8QyceTS1Uvm9HosP5SKaiOHUWi5DMILYfvKM1gxGH4lU
 zABALNpLi9qG1+7Wcx3jnnXxzifIqXqsuFsJfgmh1MQaNUlHRrkVWVhYJuCKtvEk18
 Rc3dT8JC5WtPVRKv4lyqRAbrENgoGHVULdV97rdE3zZRhfkSOY7Pt7prA/6Tlsx8u/
 tqa+smbQEZD0DWvDQyd0yC0ehYjcMfNINgUDGQpDEQA76ljaRQlrhqpBReYNwhv2uA
 S6KYkuBcTvb5LamEIxPmNHWJdsUAQ+i5v3UMbtK7o4yHUlihNqoF5uwuHe6pGOPeog
 2NtGKH4QVvIPw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B82317E0EFE;
 Mon,  9 Mar 2026 12:07:00 +0100 (CET)
Date: Mon, 9 Mar 2026 12:06:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, Nicolas Frattaroli
 <nicolas.frattaroli@collabora.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] drm/panthor: Fix the "done_fence is initialized"
 detection logic
Message-ID: <20260309120656.5821431e@fedora>
In-Reply-To: <bd0bcaeb-0a0f-4415-b964-ea1d5219b671@amd.com>
References: <20260309103053.211415-1-boris.brezillon@collabora.com>
 <bd0bcaeb-0a0f-4415-b964-ea1d5219b671@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Queue-Id: 3446E237904
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
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:nicolas.frattaroli@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, 9 Mar 2026 11:50:16 +0100
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> On 3/9/26 11:30, Boris Brezillon wrote:
> > After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal
> > v3"), dma_fence::ops =3D=3D NULL can't be used to check if the fence is
> > initialized or not. We could turn this into an "is_signaled() ||
> > ops =3D=3D NULL" test, but that's fragile, since it's still subject to
> > dma_fence internal changes. So let's have the "is_initialized"
> > state encoded directly in the pointer through the lowest bit which
> > is guaranteed to be unused because of the dma_fence alignment
> > constraint. =20
>=20
> We added the dma_fence_was_initialized() function exactly for this
> use case and fixed all callers.

Oh, I somehow missed that helper. Will respin. Thanks!
