Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FA6C0DBD6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 14:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4233810E482;
	Mon, 27 Oct 2025 13:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jBA31kvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066C010E482
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 13:00:28 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cwDBc5hb1z9str;
 Mon, 27 Oct 2025 14:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761570024; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5788PWM/VBgk1tGTTY2kWxTv5vFa3dzGCv9B4Lw0uE0=;
 b=jBA31kvc5mDtFmdGEQ/0gMKqXWZI5B3jOZpTnCIzzdlnOK2i9w4bYVF4vCiCdoP/FLcmzA
 kLdB03QzkgKDb2rJt+PeEoiffmkTcsbXaMz7Y1pAwiDW+pHzO9A3g1hUrGva46WUhn7yzK
 lZFdfqpLxTyD4XcJ+hqCNkpN8DkmNwdjaBoy/Pzu1ks94NZJKPkkuhltGUdYAsNwDbuL0t
 M4ZxgcqMme5UasmeV1iF0784ST9VdAiMAhEfyHR1uS31C2/Gvx0HrNteRUpqdaQ4f5kOC4
 hiUgqT8oJeuFzT5HnGwo4b5QQVeHJmj6LRx9CZBByYdcVSeqG4iH558CPdOxRw==
Message-ID: <5b22257b90d5df1c4a6b02f9472f11588208c4b5.camel@mailbox.org>
Subject: Re: [PATCH] drm/nouveau: Fix race in nouveau_sched_fini()
From: Philipp Stanner <phasta@mailbox.org>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon, 27 Oct 2025 14:00:15 +0100
In-Reply-To: <25c97722-e05d-467c-908e-baa31e636a44@kernel.org>
References: <20251024161221.196155-2-phasta@kernel.org>
 <25c97722-e05d-467c-908e-baa31e636a44@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: t19ydhdbzc3pnxf3frk84k717hbxabab
X-MBO-RS-ID: ad959cffc22c1f1fbba
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-10-24 at 18:17 +0200, Danilo Krummrich wrote:
> On 10/24/25 6:12 PM, Philipp Stanner wrote:
> > nouveau_sched_fini() uses a memory barrier before wait_event().
> > wait_event(), however, is a macro which expands to a loop which might
> > check the passed condition several times. The barrier would only take
> > effect for the first check.
> >=20
> > Replace the barrier with a function which takes the spinlock.
> >=20
> > Cc: stable@vger.kernel.org=C2=A0# v6.8+
> > Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity rel=
ationship")
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
>=20
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-misc-fixes


P.
