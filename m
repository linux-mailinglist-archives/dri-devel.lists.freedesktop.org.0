Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD8A91F046
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 09:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB5710E549;
	Tue,  2 Jul 2024 07:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0FzxGbxo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC63110E549
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 07:34:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 50154CE1B55;
 Tue,  2 Jul 2024 07:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50398C116B1;
 Tue,  2 Jul 2024 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1719905638;
 bh=w3GfV/hQPM47V8A8C7lB/UBMrklFJe5KZzfNawdoh7w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=0FzxGbxoE6hNMJFYe250AXSbI6hqakLsb9w+BAEm/pqQnP9Y5ZcvHfj9zmMA8cj2z
 OYRN/NfeoRIfI0TYnF9Hqz7NuxvRf04Ufr7Jh89s1Qpcfw036CAjAJVFJJCxfrUqMN
 60Vm8PPtFW/k/zich1LxvFIvp2EJrhNevFmAHTho=
Date: Tue, 2 Jul 2024 00:33:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Christoph Hellwig <hch@lst.de>, Thorsten Blum
 <thorsten.blum@toblux.com>, jack@suse.cz, surenb@google.com,
 linux-kernel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-buf: Remove unnecessary kmalloc() cast
Message-Id: <20240702003357.6bfd1d918c56d536bb664c37@linux-foundation.org>
In-Reply-To: <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
References: <20240630011215.42525-1-thorsten.blum@toblux.com>
 <20240701232634.0bddb542ddea123b48dcabdf@linux-foundation.org>
 <20240702064017.GA24838@lst.de>
 <e0f384b0-6913-4224-a3ea-bdae784f5dab@amd.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

On Tue, 2 Jul 2024 09:13:35 +0200 Christian K=F6nig <christian.koenig@amd.c=
om> wrote:

> yes that is=20
> intentionally a define and not an inline function.
>=20
> See this patch here which changed that:
>=20
> commit 2c321f3f70bc284510598f712b702ce8d60c4d14
> Author: Suren Baghdasaryan <surenb@google.com>
> Date:=A0=A0 Sun Apr 14 19:07:31 2024 -0700
>=20
>  =A0=A0=A0 mm: change inlined allocation helpers to account at the call s=
ite

Dang, yes, that was a regrettable change.  But hardly the end of the
world.  I do think each such alteration should have included a comment
to prevent people from going and cleaning them up.


