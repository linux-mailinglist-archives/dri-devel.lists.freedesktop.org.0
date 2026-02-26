Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCBtFCJAoGmrhAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:44:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD53D1A5D85
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 13:44:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF64E10E91D;
	Thu, 26 Feb 2026 12:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="crJJRpB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2075589A1E
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772109854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qapPAN3TFL6kQ8Cjv3H+bVhNboOTyODNWYLCWTNWpYE=;
 b=crJJRpB49zUZzrzxB4ESSEEssa50pmGyBxIwDnHw6tklGlt+pnoEBcgnHj3+xvErsXviQx
 0IqChFfi7J+F5O5j5RSVLKBR73zAg2WFPiIVWPoW+BsxqEAMjrBls9DSzRz+M8Pd2WSV/j
 T+AESEn6GLfx9GEJNYPKsxyd2E2fZ4k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-uJlMjWS2Ml-6N26sR0IiQw-1; Thu, 26 Feb 2026 07:44:12 -0500
X-MC-Unique: uJlMjWS2Ml-6N26sR0IiQw-1
X-Mimecast-MFC-AGG-ID: uJlMjWS2Ml-6N26sR0IiQw_1772109852
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4398ad5d81dso458587f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 04:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772109851; x=1772714651;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qapPAN3TFL6kQ8Cjv3H+bVhNboOTyODNWYLCWTNWpYE=;
 b=VoG9xd9Dj3+680gtj6PsKJNwfybQ0Onbv/i7GjGgEOQQsSG0QoKCE27lRJtEXH3hAq
 /M84uf9js9OQSxhgT32CD03BZXXnF6DGck/AhfU9Y/SBC/05p5sJNrxHmJ+wt/4FuWaW
 NWUNParJ8RDuU8z3hHJKdt8cWY0s/TXqyg5eTA2t6t9MidfNu/NE07BIYrDN4I9W9W97
 B17O7tbuGZe8JbGo8h9QluW5mt66fdaAJ6Q+qoV17CSRWmHTU0XE+OHsq9VdS20fnQk4
 lBPyHku38KYGyG5TrRz6kWwKg5A+Jj9ARKW+iMf92kJmarcdeqbjOUooZGOtlBozxCAl
 3DWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiBVUSRhA1Ztc4HSgvuqmNf0F6cnhqbAVDPp2Gtas4JAtqtEALedz3Kr7kWpphqYMnClkkvcYeCes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5qYcbilmoEs5p+EIt+pOriG+ZN0Y5C6abr8KvFa85FVgQRdvZ
 zlrPY+DRPWFihSJO302VVQ5KEEYDB6xhb/D04QTuKDbWpV2R03jvL3kyUqQAHXcblb2GCTvWShU
 A+93HUPWIowSOH0Pu45dzh8jFfb135PECQHh6Zd7pv0YMg8UTQhKDMv0QC9RmpZAmoOCXTg==
X-Gm-Gg: ATEYQzydDqXw8Qbuht+KYc3j2Fl99RSteBxMKECp7PG41S5kOwpa9smIFX+/QmLR1zk
 8KxmPmkKqrbsyqDy0YILATXOD6wt7/EhQ7zcWhjYM4JtokU7D4tEmXoC+NoBIzyQftSH0nCPrYE
 KbNL+ukvjrb3KCmz3quUCOkMLarrTvxPYuWs0rVFFfl6nup0pVWEwU7SNs6ueKlA3e5ew1yrK1C
 1ybFYLLyw3VEk7rojuGPFjFoE7yzKlrPah+D1EOXJ4U2vrIMVGGKyruwbwnorv/pXsWDJz+rMQM
 koL8HGlPYouYEahBhafanA2jTc1SN1OvkJfDQDhDf7nScc53AAtlVdJ6G84GlYRQr+kwaVN1M8R
 y4iEZ4UpJXFyCgpE3m5VrDa+WTZOD4brFM2vv7+fEh0dxY4C0f/cSOy1ZAkHd/0KDJ32x7TvAyp
 pRlesR
X-Received: by 2002:a05:6000:603:b0:437:6ec2:b11d with SMTP id
 ffacd0b85a97d-439942ed120mr7288113f8f.38.1772109851538; 
 Thu, 26 Feb 2026 04:44:11 -0800 (PST)
X-Received: by 2002:a05:6000:603:b0:437:6ec2:b11d with SMTP id
 ffacd0b85a97d-439942ed120mr7288077f8f.38.1772109851121; 
 Thu, 26 Feb 2026 04:44:11 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4398a292babsm17442027f8f.37.2026.02.26.04.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 04:44:10 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Francesco Lavra <flavra@baylibre.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/solomon: Fix page start when updating rectangle in
 page addressing mode
In-Reply-To: <20260210180932.736502-1-flavra@baylibre.com>
References: <20260210180932.736502-1-flavra@baylibre.com>
Date: Thu, 26 Feb 2026 13:44:09 +0100
Message-ID: <87qzq7vfmu.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: st_L10Hyo7j6G3vSGSZUc75SGoKJTUEAy0VWMREC368_1772109852
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
	FORGED_RECIPIENTS(0.00)[m:flavra@baylibre.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:wens@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre.com:email,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Queue-Id: AD53D1A5D85
X-Rspamd-Action: no action

Francesco Lavra <flavra@baylibre.com> writes:

> In page addressing mode, the pixel values of a dirty rectangle must be sent
> to the display controller one page at a time. The range of pages
> corresponding to a given rectangle is being incorrectly calculated as if
> the Y value of the top left coordinate of the rectangle was 0. This can
> result in rectangle updates being displayed on wrong parts of the screen.
>
> Fix the above issue by consolidating the start page calculation in a single
> place at the beginning of the update_rect function, and using the
> calculated value for all addressing modes.
>
> Fixes: b0daaa5cfaa5 ("drm/ssd130x: Support page addressing mode")
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---

Pushed to drm-misc (drm-misc-fixes). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

