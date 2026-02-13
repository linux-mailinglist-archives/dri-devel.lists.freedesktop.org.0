Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMhfOx82j2n2MgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:33:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D26E13712F
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:33:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F54C10E08F;
	Fri, 13 Feb 2026 14:33:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IQTnMH5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776E510E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770993178;
 bh=qnSypbY6LZaolUO/OilxrUesEiJrM70AYzxCLD5qJ38=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IQTnMH5A62deCf6qBjRFoPha2mbGA0164GvrfRhAbAP+tigsvWYcmyQ0L90FMAhPp
 s4qWmoKcNbvPDYu6bzH3kwFCOLsppssK62M8FQ48LEeQ/5d3iot/vYFXSDHcq+nVS5
 AUfaLWqOq6IzvKT0nwKvy8mIsD7CtfHYETkWJxrdKnuXbLYO+pLOVly5L1D2BBGs+p
 yENp1Bc7FvlfapqGlpbXOKROpwGPhfz0Gl2Qebc405/zcVOikebbazBvoBa7xU3N9e
 Zqsy7BRxBR8CL50Juuw8E8FX0t3+eesPkdCY6POw77lb+HeiYIlgKDNtOuQEQdMLvN
 4E/JwurJR1XeA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D53D717E00AC;
 Fri, 13 Feb 2026 15:32:57 +0100 (CET)
Date: Fri, 13 Feb 2026 15:32:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 6/8] dma-buf: use inline lock for the stub fence v2
Message-ID: <20260213153253.29016148@fedora>
In-Reply-To: <20260210102232.1642-7-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-7-christian.koenig@amd.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ckoenig.leichtzumerken@gmail.com,m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,m:ckoenigleichtzumerken@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 6D26E13712F
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 11:02:01 +0100
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

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
> Reviewed-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/dma-buf/dma-fence.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 1833889e7466..541e20aa4e6c 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
> =20
> -static DEFINE_SPINLOCK(dma_fence_stub_lock);
>  static struct dma_fence dma_fence_stub;
> =20
>  /*
> @@ -123,12 +122,9 @@ static const struct dma_fence_ops dma_fence_stub_ops=
 =3D {
> =20
>  static int __init dma_fence_init_stub(void)
>  {
> -	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
> -		       &dma_fence_stub_lock, 0, 0);
> -
> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
>  	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  		&dma_fence_stub.flags);
> -
>  	dma_fence_signal(&dma_fence_stub);
>  	return 0;
>  }
> @@ -160,11 +156,7 @@ struct dma_fence *dma_fence_allocate_private_stub(kt=
ime_t timestamp)
>  	if (fence =3D=3D NULL)
>  		return NULL;
> =20
> -	dma_fence_init(fence,
> -		       &dma_fence_stub_ops,
> -		       &dma_fence_stub_lock,
> -		       0, 0);
> -
> +	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
>  	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  		&fence->flags);
> =20

