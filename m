Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMBPLD+ohWnUEgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:37:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49789FB96F
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9000B10E0B8;
	Fri,  6 Feb 2026 08:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WPTiJ11o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9006110E0B8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770367035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NyVVDSJAEWeUvOVHLGP2D9FNBz8EHGC9RVXlKtVKk+w=;
 b=WPTiJ11ohy1TRvTT0GJ0nlHZI0N9bMoo/HWEMAzYYOQXjsucC6zLOiX+RDja0U/gYYb8mW
 BL3WHls9JersqgoYW6StRj+YIzTpEiJCKigQNX+VoK379tNTx19y94FWAOauiB/bBSXHHA
 27g+0k+WlZBoOIr7+9yzPll4fzb3fX8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-HdeHJBhQNRqpg8Hyxtg4gQ-1; Fri, 06 Feb 2026 03:37:14 -0500
X-MC-Unique: HdeHJBhQNRqpg8Hyxtg4gQ-1
X-Mimecast-MFC-AGG-ID: HdeHJBhQNRqpg8Hyxtg4gQ_1770367033
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-43284f60a8aso1639627f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 00:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770367033; x=1770971833;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NyVVDSJAEWeUvOVHLGP2D9FNBz8EHGC9RVXlKtVKk+w=;
 b=r7zKLSUVGgrumFJfob69ubfq6TCxjG6VzsSv30dkLOC0eG9upOTbx4KCHRpQrqpxZA
 wAvr5pXTDvImjiFJnNYzbW8dmctGCNY28yO07t7GrSiDc63J15xzxoIrZJ2IRu5HJwHb
 wb7HYiCHgJLBD5MYBnLOCECP0SCk1CmlBaBgK17Dc2rXrF2TOIg00gp4XLgXLNwpZyu4
 Eq0gu6UHT3CJoMIs5DIAi4LT/YuqsDEYrH/+3kGxr2xBrcPlU0NN2fe6tFtnba2fgVAD
 Pgpb6JylFY5hUyh3quAP6dQkuyq+5OP9J1wZ79qmSfvpBuDmPQUrR1eErzU7hFGgMH76
 QMOQ==
X-Gm-Message-State: AOJu0Yz77tx/qSFqa7FaVHfIulqgPNeXOn2uTivj6miz8W7TV/yJo+QS
 GmTr8/a2brCIBCXHEaeOLiMpCnmRSAnVPU4S1Vx10Se/8nQ1PHMrmAFcjgIMY6aiSYb8Y0kv/Lz
 JcjWgF6TPQe3Sj454atGNCt5J+T8bgd1moYyz2A1HfJbcfOAlCN6cJ0wegUJbG0GAfMK5UA==
X-Gm-Gg: AZuq6aJBXm6ceQCA0/BZBZOvvSZKV7Uq6lFcFhsFzSBeq8ipOtiCgnP1FBy0i3g1Zml
 YCdtVwZu1ux8W63hS+2k9tQIq8mezrAlAURAMr8HGfPHy+pFLu5qU7reXr7Iqeo5mPInRqxuPl7
 3h93lgYSL5/WFs8ZHtTs66y/u/6LFzWQwFOOonfwkNytHd8d7qh1sVPIeCrik8td3eSzg2VOe1v
 Gy+2nnsTZEvH1zHtKU2pBxFAZfkGGL71Ng0QDCStxINd4J4LiZpk6eUeT2zCOINqs+Vj+gQd80g
 H8EUWF3T4YJqUh9tphX1jiTah25OTCTXO6RhbZmF5ZrhoAFKcZfccTmSowYbsxRQepqnS2Kc6QM
 fP5BBaUYQIjUxmpDSQ0lmU/pgUvltJ2SsO9/iSR3QS0YYTeUVzQDfYtRG/jl0nhylARxI
X-Received: by 2002:a05:6000:2601:b0:436:7ab:9290 with SMTP id
 ffacd0b85a97d-4362933cacfmr2757436f8f.1.1770367032938; 
 Fri, 06 Feb 2026 00:37:12 -0800 (PST)
X-Received: by 2002:a05:6000:2601:b0:436:7ab:9290 with SMTP id
 ffacd0b85a97d-4362933cacfmr2757396f8f.1.1770367032493; 
 Fri, 06 Feb 2026 00:37:12 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296bd3b8sm4068623f8f.11.2026.02.06.00.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:37:11 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fbdev-emulation: Remove support for legacy emulation
In-Reply-To: <20260205144056.416759-1-tzimmermann@suse.de>
References: <20260205144056.416759-1-tzimmermann@suse.de>
Date: Fri, 06 Feb 2026 09:37:10 +0100
Message-ID: <87ms1mgte1.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lQftgtIQ1n5hBjvF7ieOMYYMRId14dFksJ9i6iJCy7w_1770367033
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:jfalempe@redhat.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email]
X-Rspamd-Queue-Id: 49789FB96F
X-Rspamd-Action: no action

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Remove the internal DRM client from fbdev emulation. This has been
> required when some DRM drivers provided their own fbdev emulation.
>
> This is no longer the case with commit b55f3bbab891 ("drm/{i915, xe}:
> Implement fbdev emulation as in-kernel client") from 2024. Now there's
> only a single DRM client for fbdev-emulation that fills out the client
> callback functions as required.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

