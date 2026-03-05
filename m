Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJH6H+pkqWlN6wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:11:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB94210605
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 12:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003F410E202;
	Thu,  5 Mar 2026 11:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aCxXFrXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4180B10E202
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1772709092;
 bh=dLrn9ltYdYrd8MsAd6moKicuYz2yrptmBuQgQKvRwgc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aCxXFrXinZBBCtVGxXWjTY0aMCFdvzfrG51WoKmkJ03ev4BEYovx42t+XIqDoyDJe
 iiZizu3uVAKofyogaG+WGferRjRQ3esrf0atqnZznA30ptBjKr8XBdP+VTy+mL7S4k
 bpvCH1bs8SEdSmT0zlX6fuH+rDYma0NCEkSASM84ZWgJQx4Bpel6CeTm/1LTXzO18K
 nXcofatp48yBqm9XS4hwT4QM8Qji7WEsg1MXDyAIdVRFgd82+rcwYzcMbYkBekJuSz
 ifYOiMKeeiSTfwXKSvUKCtIM6LdO5ZFxE6X3WNUlcjstsNLibN/7++ayFQOTMBCCpm
 55XHuD4p/Qadw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7562617E0071;
 Thu,  5 Mar 2026 12:11:32 +0100 (CET)
Date: Thu, 5 Mar 2026 12:11:28 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com
Subject: Re: [PATCH] drm/panthor: Correct the order of arguments passed to
 gem_sync
Message-ID: <20260305121128.7c507580@fedora>
In-Reply-To: <20260305110723.2871733-1-akash.goel@arm.com>
References: <20260305110723.2871733-1-akash.goel@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Queue-Id: 0DB94210605
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
	FORGED_RECIPIENTS(0.00)[m:akash.goel@arm.com,m:liviu.dudau@arm.com,m:steven.price@arm.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:nd@arm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[arm.com,lists.freedesktop.org,vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,arm.com:email,collabora.com:dkim,collabora.com:email]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 11:07:23 +0000
Akash Goel <akash.goel@arm.com> wrote:

> This commit corrects the order of arguments passed to panthor_gem_sync()
> function, called when the SYNC_WAIT condition has to be evaluated for a
> blocked GPU queue.
> 
> Fixes: cd2c9c3015e6 (drm/panthor: Add flag to map GEM object Write-Back Cacheable)
> Signed-off-by: Akash Goel <akash.goel@arm.com>

Oops, good catch!

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index bd703a2904a1..a70f1db0764e 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -893,14 +893,15 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
>  
>  out_sync:
>  	/* Make sure the CPU caches are invalidated before the seqno is read.
> -	 * drm_gem_shmem_sync() is a NOP if map_wc=true, so no need to check
> +	 * panthor_gem_sync() is a NOP if map_wc=true, so no need to check
>  	 * it here.
>  	 */
> -	panthor_gem_sync(&bo->base.base, queue->syncwait.offset,
> +	panthor_gem_sync(&bo->base.base,
> +			 DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE,
> +			 queue->syncwait.offset,
>  			 queue->syncwait.sync64 ?
>  			 sizeof(struct panthor_syncobj_64b) :
> -			 sizeof(struct panthor_syncobj_32b),
> -			 DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE);
> +			 sizeof(struct panthor_syncobj_32b));
>  
>  	return queue->syncwait.kmap + queue->syncwait.offset;
>  

