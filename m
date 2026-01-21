Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iF4wKniccGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:29:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2EA54647
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E8A10E729;
	Wed, 21 Jan 2026 09:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="OI4UcWWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2A610E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 09:29:25 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dwzRQ2wc0z9tyf;
 Wed, 21 Jan 2026 10:29:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1768987762; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iS+g7J7TXdF74NFS7z5ZHif1+RDpnoW5FGKHH0HPRQ4=;
 b=OI4UcWWI+8M7By9lE1nzIc4YK1axr0Tm2FjcwuDHWRiKGUUmcf3oTctHFLjsB2LnghQrkk
 ohEL2SoFmhbaMKoGbDxUYesyKiHzGaaWVmDMeeT/rEH3H4U0McfdyYNlnDAAK8jNUMMBGT
 KMY2E8+OjhwNROnPDsp9KXJkMpfrWYqmfd913zdV5tIt0ZSA+M4bSFV4Fgy79XbmJyZORf
 +7q8JFl5xbTZn/cBfVGP2j6a746Imz/JE2g/HQwp4bUVZvf5WPFTQojzN0+c1v6Z4DoGlD
 jveE9PkZmPay7M1ZHHP0f10T5vsfJ1L6Xkd3LQw5pQqQ3WmYnTFKDSGVqq5vfg==
Message-ID: <697fb47b7c1bad47a413fb7c60778f78263be4df.camel@mailbox.org>
Subject: Re: [PATCH 7/9] dma-buf: use inline lock for the stub fence v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tursulin@ursulin.net, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Wed, 21 Jan 2026 10:29:19 +0100
In-Reply-To: <20260120105655.7134-8-christian.koenig@amd.com>
References: <20260120105655.7134-1-christian.koenig@amd.com>
 <20260120105655.7134-8-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: rjyqt789twtd3sistkis9w4d5bi78uw1
X-MBO-RS-ID: 1330665f9501d9ce720
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:tursulin@ursulin.net,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ursulin.net,intel.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,mailbox.org:mid,mailbox.org:dkim,igalia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	DKIM_TRACE(0.00)[mailbox.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phasta@mailbox.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[phasta@kernel.org]
X-Rspamd-Queue-Id: 5F2EA54647
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-01-20 at 11:54 +0100, Christian K=C3=B6nig wrote:
> Using the inline lock is now the recommended way for dma_fence
> implementations.
>=20
> So use this approach for the framework's internal fences as well.
>=20
> Also saves about 4 bytes for the external spinlock.
>=20
> v2: drop unnecessary changes
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/dma-buf/dma-fence.c | 12 ++----------
> =C2=A01 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 36ff0e5098ee..03a09acdeaec 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
> =C2=A0EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
> =C2=A0EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> =C2=A0
> -static DEFINE_SPINLOCK(dma_fence_stub_lock);
> =C2=A0static struct dma_fence dma_fence_stub;
> =C2=A0
> =C2=A0/*
> @@ -123,12 +122,9 @@ static const struct dma_fence_ops dma_fence_stub_ops=
 =3D {
> =C2=A0
> =C2=A0static int __init dma_fence_init_stub(void)
> =C2=A0{
> -	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dma_fence_stub_lock, 0, 0);
> -
> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
> =C2=A0	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> =C2=A0		&dma_fence_stub.flags);
> -
> =C2=A0	dma_fence_signal(&dma_fence_stub);
> =C2=A0	return 0;
> =C2=A0}
> @@ -160,11 +156,7 @@ struct dma_fence *dma_fence_allocate_private_stub(kt=
ime_t timestamp)
> =C2=A0	if (fence =3D=3D NULL)
> =C2=A0		return NULL;
> =C2=A0
> -	dma_fence_init(fence,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dma_fence_stub_ops,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dma_fence_stub_lock,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, 0);
> -
> +	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
> =C2=A0	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> =C2=A0		&fence->flags);
> =C2=A0

