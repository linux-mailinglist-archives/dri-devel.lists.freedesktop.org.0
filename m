Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACppFx7HrmlwIwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:11:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D536123981A
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 14:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C203210E176;
	Mon,  9 Mar 2026 13:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="YbmFiMsk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9239910E176
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 13:11:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1773061907; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BTAS0T8WOaAjbenEO4YwqcIAjp3QR9VZH2gK8T3Q3j8CEW0VRllresGdjSeC24RTz0j+yqV69WAWYTfg9k1ZCu8VxWxLwXK5Czb53xErRD7DApTsJ5XfjBn6SBwy5EJWlt91JqMlBbGWertbImulm7CMHW2fwGnEn8w2w4qIW9g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1773061907;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AC7ButPM+guw7lngcONzyGQ4o7Uk9Xd5AfSadoPFgCA=; 
 b=XX+GhkAjEMt+9C1iu2PzY8PhkNC+p9SuN2emPekA7XSZRoLJn0b1M4sgP6IgdwR/9e/zb5Mog6HGGv63jkh4b06zRzdT07Zop/yKMK6v/koWLfEsEojtl66ooFaNfC7wbZmrk9dt8H1qyfdXTv5LtHJeASx88KbZfhfjTK8MUP8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773061907; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=AC7ButPM+guw7lngcONzyGQ4o7Uk9Xd5AfSadoPFgCA=;
 b=YbmFiMskhqEekVpeLBOecj6PNE2MUi22ldsgCnEyGfcz3gVzz3GeZvClcaaLx6IZ
 UfjJlGVIgjY43WjdrB4eR4FLG+INfRLmTm3foe7R/d0swB+P5c/2mDAaSF0uTqwVFuJ
 XjpEiEq0XqHuoS87T79U8ejWHMkbpXKJf8+9JgSs=
Received: by mx.zohomail.com with SMTPS id 1773061904272858.0115043452556;
 Mon, 9 Mar 2026 06:11:44 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/panthor: Fix the "done_fence is initialized"
 detection logic
Date: Mon, 09 Mar 2026 14:11:39 +0100
Message-ID: <2403388.ElGaqSPkdT@workhorse>
In-Reply-To: <20260309124318.222902-1-boris.brezillon@collabora.com>
References: <20260309124318.222902-1-boris.brezillon@collabora.com>
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
X-Rspamd-Queue-Id: D536123981A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:kernel@collabora.com,m:tvrtko.ursulin@igalia.com,m:phasta@kernel.org,m:christian.koenig@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:email,collabora.com:dkim,collabora.com:email]
X-Rspamd-Action: no action

On Monday, 9 March 2026 13:43:18 Central European Standard Time Boris Brezi=
llon wrote:
> After commit 541c8f2468b9 ("dma-buf: detach fence ops on signal v3"),
> dma_fence::ops =3D=3D NULL can't be used to check if the fence is initial=
ized.
> Use dma_fence_was_initialized() instead.
>=20
> v2:
> - Use dma_fence_was_initialized() instead of open-coding it
>=20
> Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reported-by: Steven Price <steven.price@arm.com>
> Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Fixes: 541c8f2468b9 ("dma-buf: detach fence ops on signal v3")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index bd703a2904a1..c15941ebe07a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3915,7 +3915,7 @@ static void job_release(struct kref *ref)
>  	if (job->base.s_fence)
>  		drm_sched_job_cleanup(&job->base);
> =20
> -	if (job->done_fence && job->done_fence->ops)
> +	if (dma_fence_was_initialized(job->done_fence))
>  		dma_fence_put(job->done_fence);
>  	else
>  		dma_fence_free(job->done_fence);
>=20

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This also fixes the refcount underflow for me. Thanks!



