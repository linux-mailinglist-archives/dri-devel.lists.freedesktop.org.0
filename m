Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835ECFE2A4
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 15:08:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6720710E5E7;
	Wed,  7 Jan 2026 14:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tMjJA/SV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244AF10E5E9;
 Wed,  7 Jan 2026 14:08:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E2C0640A98;
 Wed,  7 Jan 2026 14:08:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6456DC4CEF7;
 Wed,  7 Jan 2026 14:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767794889;
 bh=NEoz9kconBg9NkwHDA2V2ValAY1/VU8u0UsT+syAgM4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=tMjJA/SVma0rH5/9z9sCR6sTQBsL4LVaZQgruSqlQX44XAsE7FSVuqC+jRARlkADo
 WTueFnASNLxeKoajCjSl7247BHS4cOmeXmWV/AmtZZTYKCQ+8gU16Nlta2SBUloN6H
 lAWbPREALb0c742PoD4dkGB9fhpp2HJ1dw+Coy7Td9baLCwIImn8aXhQsaqRZweQh3
 kT5bwLJDakupoF7u6fsxcGavB2n3XMGzsFetSSNU526WYtJlWsrCsVCqUnZm1LHALQ
 ooAG26UC41zFkCxg2ceF5jg+cPaHPICiusqtIhMwJ1992wO83DCYBSC2ZIbQMR0JHs
 tCoWKowOJ/LCg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 15:08:06 +0100
Message-Id: <DFIEZJJK8GUD.1XW0UQSIUCH2N@kernel.org>
Subject: Re: [PATCH] drm/sched: Simplify idle entity check
Cc: <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <intel-xe@lists.freedesktop.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Matthew Brost" <matthew.brost@intel.com>,
 "Philipp Stanner" <phasta@kernel.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260107134405.96603-1-tvrtko.ursulin@igalia.com>
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

On Wed Jan 7, 2026 at 2:44 PM CET, Tvrtko Ursulin wrote:
> While at it, we add READ_ONCE annotation on the entity->stopped check to
> mark the unlocked read.

READ_ONCE() is not about marking unlocked reads and does not guarantee
atomicity.

Instead, it is about compiler control, i.e. forcing loads, and, depending o=
n the
architecture, deal with address and control dependency barriers.

If we want lockless access to entity->stopped it should be atomic_read(),
atomic_read_acquire(), etc.

- Danilo
