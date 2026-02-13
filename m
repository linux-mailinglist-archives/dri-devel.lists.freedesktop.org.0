Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJg0CkU2j2n2MgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:33:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F13C13716B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:33:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D3510E7FA;
	Fri, 13 Feb 2026 14:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="a1ROsC2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE9B10E7FA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1770993216;
 bh=m02PGLQN3ryTu9fwdCznLHLg+swjN9H1cBfggzX1uwA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a1ROsC2FyzD/GuUou+QMgctw7kHEv1x7rhrRTVyuvgh0yDdxl+zSeMu8OvbpGGmmF
 yNmEe03Nm10sF/jsU7pkXKxRl/EVDZvlh8RFNyOlQyYpZb1iNYsqVQd8BIsyhOvczd
 vnSOd+slLuR5f18k4foalXp16gBk0uLjnBwvFeLinXAamKoFZRSXiTC/MIt+/Z5k8A
 Hri1jk7MtPJDY7n+unLweJ+kvoD9K66mP/WQDaizsGOVmbL+btHGrUm+EBiJPwyPOZ
 q2UqfdlNnLhClaiAncMUPHRdeAggyYoqTC4jIlQnK/LebRWLKCcHd+d9gzcDTgOIIQ
 oyOC0tBur8mXw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id DC15517E00AC;
 Fri, 13 Feb 2026 15:33:35 +0100 (CET)
Date: Fri, 13 Feb 2026 15:33:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Christian =?UTF-8?B?S8O2bmln?=" <ckoenig.leichtzumerken@gmail.com>
Cc: phasta@mailbox.org, matthew.brost@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 7/8] dma-buf: use inline lock for the dma-fence-array
Message-ID: <20260213153331.30c3cdcb@fedora>
In-Reply-To: <20260210102232.1642-8-christian.koenig@amd.com>
References: <20260210102232.1642-1-christian.koenig@amd.com>
 <20260210102232.1642-8-christian.koenig@amd.com>
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
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
X-Rspamd-Queue-Id: 9F13C13716B
X-Rspamd-Action: no action

On Tue, 10 Feb 2026 11:02:02 +0100
"Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com> wrote:

> Using the inline lock is now the recommended way for dma_fence
> implementations.
>=20
> So use this approach for the framework's internal fences as well.
>=20
> Also saves about 4 bytes for the external spinlock.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/dma-buf/dma-fence-array.c | 5 ++---
>  include/linux/dma-fence-array.h   | 1 -
>  2 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fenc=
e-array.c
> index 6657d4b30af9..c2119a8049fe 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -204,9 +204,8 @@ void dma_fence_array_init(struct dma_fence_array *arr=
ay,
> =20
>  	array->num_fences =3D num_fences;
> =20
> -	spin_lock_init(&array->lock);
> -	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
> -		       context, seqno);
> +	dma_fence_init(&array->base, &dma_fence_array_ops, NULL, context,
> +		       seqno);
>  	init_irq_work(&array->work, irq_dma_fence_array_work);
> =20
>  	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
> diff --git a/include/linux/dma-fence-array.h b/include/linux/dma-fence-ar=
ray.h
> index 079b3dec0a16..370b3d2bba37 100644
> --- a/include/linux/dma-fence-array.h
> +++ b/include/linux/dma-fence-array.h
> @@ -38,7 +38,6 @@ struct dma_fence_array_cb {
>  struct dma_fence_array {
>  	struct dma_fence base;
> =20
> -	spinlock_t lock;
>  	unsigned num_fences;
>  	atomic_t num_pending;
>  	struct dma_fence **fences;

