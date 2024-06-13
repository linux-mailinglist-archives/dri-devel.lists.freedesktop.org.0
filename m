Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49F7907305
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 14:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0934710EA6A;
	Thu, 13 Jun 2024 12:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="mNMOpdhj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xalxTLhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8EA10EA6A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 12:58:36 +0000 (UTC)
Date: Thu, 13 Jun 2024 14:58:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1718283514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61aokImnxydUwTrY9lMtXPKXULnR19UKtBIo+1nsOds=;
 b=mNMOpdhjW009QDK9snXSVIML21D8/TNU+tGNL/2b2oFU+D0KgtFLly9YuK9SpVshWZfXEq
 Kc37DEMIYyDhbouo4pDa/i36TZ0fSTTCFpIm46c20Wqad5Pci56mGKzm1mu8ax9jCml1fi
 iqY3WPqVGs/cJwlzyXkJmCzaw3VkGTztCE+ORsgqylDQLJqNZbRjtxOruZaRZbZnF0Xyuc
 PXJ1z50ZjwnlcaoOwG2R/KrXhJ2dlExNuo5d8CGhTk6RVfnEksHbpcnZEUigOtwUnqFkHu
 MmWiIPRL+3aHrGjyGedo6EYgM0neKCHYOSuLwesHw0HRMIgxyK6VXK/hPzwW0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1718283514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=61aokImnxydUwTrY9lMtXPKXULnR19UKtBIo+1nsOds=;
 b=xalxTLhHJrCnh3X69fNSBYyM5dYsQrbeJCWI9leqO4wAOClKHtbH2qrGoeP/X8FXmfdwUU
 yqjvlPstYFzpbbBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH REPOST] drm/ttm/tests: Let ttm_bo_test consider different
 ww_mutex implementation.
Message-ID: <20240613125832.hT_gxpBl@linutronix.de>
References: <20240613064716.WxAIvb9K@linutronix.de>
 <8ca924c6-cea2-4bf0-9b4c-b216d11683fc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8ca924c6-cea2-4bf0-9b4c-b216d11683fc@amd.com>
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

On 2024-06-13 14:33:51 [+0200], Christian K=C3=B6nig wrote:
> > Provide ww_mutex_base_lock() which points to the correct function for
> > PREEMPT_RT and non-PREEMPT_RT builds.
>=20
> In general good that somebody is looking into this, but I can't even judge
> why ww_mutex would use rt_mutex in the first place.

as noted in commit message, this is already done in
lib/locking-selftest.c
The base mutex of struct ww_mutex is WW_MUTEX_BASE which is defined as

| #ifndef CONFIG_PREEMPT_RT
| #define WW_MUTEX_BASE                   mutex
=E2=80=A6
| #else
| #define WW_MUTEX_BASE                   rt_mutex
=E2=80=A6
| #endif

this is all in-tree.

> So I don't feel well reviewing this.
>=20
> Regards,
> Christian.

Sebastian
