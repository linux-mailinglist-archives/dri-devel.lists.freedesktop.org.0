Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 961DFC8DB84
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 11:17:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0046F10E7DD;
	Thu, 27 Nov 2025 10:17:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Cli4CK3X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD5F10E7D8;
 Thu, 27 Nov 2025 10:17:44 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dHC6Y21rgz9sym;
 Thu, 27 Nov 2025 11:17:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764238661; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUX6g1+cMLR5RovSUnlNsHoaQA7NAILRZDgCTdRlTBE=;
 b=Cli4CK3XzkF3MQcBNHxChG42NdcyrblWVcZx+KBp5UTSaxfiLCV0/gR1crhhRYTKrlD90W
 igk5BSxEZlVDlLf1Qmqaxpw8aEQh1cNuwigKudm9beTIGWIFA3APA9goVBHMz07vJKdsWD
 uUDka9FEWImlr0Of/N0atYuaTby5fhCBA34vyvBqWvhEEMC8rQqHDz/lh7wVb6Qo1lAtid
 mJ9KlRIMzC/KLES3N4Zv+4tfaXdxjZP1XCk8d5/4x4l0vJvT7ClXxBeJnaYezDW2e0dFPD
 6TO9xLKh8FrWq4xThWS4sZjAanqfo9+QlpMrvJPl5ONINxEhTfwV9dl0uQqBZA==
Message-ID: <79eb3c713e810ec025eb3cd20583cb666ca7322d.camel@mailbox.org>
Subject: Re: [PATCH 01/18] dma-buf: cleanup dma_fence_describe v3
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 11:17:38 +0100
In-Reply-To: <20251113145332.16805-2-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 84f1c3ac36b0a1da64e
X-MBO-RS-META: 8pno8uwxaajz8buasnmowgm3zrpoii17
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

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> The driver and timeline name are meaningless for signaled fences.
>=20
> Drop them and also print the context number.
>=20
> v2: avoid the calls when the BO is already signaled.
> v3: use same format as trace points for context and seqno.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---

I still think that more fleshed out commit messages are great :)


> =C2=A0drivers/dma-buf/dma-fence.c | 20 +++++++++++---------
> =C2=A01 file changed, 11 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index c5d1478b28dd..b4f5c8635276 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -997,19 +997,21 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
> =C2=A0 */
> =C2=A0void dma_fence_describe(struct dma_fence *fence, struct seq_file *s=
eq)
> =C2=A0{
> -	const char __rcu *timeline;
> -	const char __rcu *driver;
> +	const char __rcu *timeline =3D "";
> +	const char __rcu *driver =3D "";
> +	const char *signaled =3D "";
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0
> -	timeline =3D dma_fence_timeline_name(fence);
> -	driver =3D dma_fence_driver_name(fence);
> +	if (!dma_fence_is_signaled(fence)) {
> +		timeline =3D dma_fence_timeline_name(fence);
> +		driver =3D dma_fence_driver_name(fence);
> +		signaled =3D "un";
> +	}
> =C2=A0
> -	seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> -		=C2=A0=C2=A0 rcu_dereference(driver),
> -		=C2=A0=C2=A0 rcu_dereference(timeline),

Why does usage  of rcu_dereference become unnecessary?=20

> -		=C2=A0=C2=A0 fence->seqno,
> -		=C2=A0=C2=A0 dma_fence_is_signaled(fence) ? "" : "un");
> +	seq_printf(seq, "%llu:%llu %s %s %ssignalled\n",
> +		=C2=A0=C2=A0 fence->context, fence->seqno, timeline, driver,
> +		=C2=A0=C2=A0 signaled);
> =C2=A0
> =C2=A0	rcu_read_unlock();
> =C2=A0}

