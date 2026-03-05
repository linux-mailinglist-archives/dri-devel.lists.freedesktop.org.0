Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJE3C8JcqWkL6AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:36:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8120FC62
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 11:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05A410E264;
	Thu,  5 Mar 2026 10:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jCzhDttH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6B410E265
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 10:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772707005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z1viVMpYgGTQrPss+rjXxyu4iRV/r/TC02JqQH3k0TE=;
 b=jCzhDttHt01iXXssjaFvjyujJppDvL/iO3RYAuZ+g08YqXKOi65VMB8bWSjqZbc9eliwzE
 /Q26wp6pQqy6i1TJd7hXRJp1bTcclPeyNIN2Xoe5v3Pq0XpEJOKuYahT2okBJPX/IhkASH
 IvJ1tIs52tklqmfzYz7M1OlsV0OFCO0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-U2g14R7KNkimfC3LKL8jqg-1; Thu, 05 Mar 2026 05:36:43 -0500
X-MC-Unique: U2g14R7KNkimfC3LKL8jqg-1
X-Mimecast-MFC-AGG-ID: U2g14R7KNkimfC3LKL8jqg_1772707002
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4806b12ad3fso67042885e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 02:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772707002; x=1773311802;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z1viVMpYgGTQrPss+rjXxyu4iRV/r/TC02JqQH3k0TE=;
 b=I3vm82eJKD8hYewsGFpejCyg+V42GsTDwOose6pMUlk1J64VwqVDVWAgMWtU+yiiS6
 DamMT4QaDNSZBJUYvQIUAgRiqBz7lvW7HHzhv1ipfFTTyXeDBwG039KWphCdXzfqVxQR
 MYiJahShytNBWkkhGXfbGwJxyegDhXJVYhRD0HBdvkLx2UHkhoR70byEPMbT0DIvVZoT
 lLo+X1LAdl4w9kzBaw2mk1FiwpcYAqmZumUmn2ckPhdBn+XU5dZrgvMf/0vvS6S0OpP7
 8ID/uS0rOiXvrV1ZJ5s4ZqLF4MMiviMUC7P/eIwhMDQ6Wp7jRYh2Mowuau0cL7kL2DmY
 MMAQ==
X-Gm-Message-State: AOJu0Yxv/4uoUertM8ub48zevy3kiy4wMF1uTt3cjzMq4fTQzGBZqBX+
 x3f0zupv8R7ve48H6d7kH+83Rakufa22ZNlpN4L0iYUmjVhyRQo+j1cP7s1H0RUdXOfB8lwAuux
 7lvaeb0gztWkFymTsJyXUSABdpQLBjzbBCbrSU7FCPSUKQTVVr9s2+414z5kNPjsCrKhEtw==
X-Gm-Gg: ATEYQzw0Fv/ad5FA7mDkoh3cpoWRRCA4aweaSDjF7eN2H8IPr2+WsWMcuO5rN9C9U9e
 FekbewD+7DrXitZewKmgEdh1NCG+W52c98y9XewCnNXWWcNvAempEa5B8EFUrbykMFXU2jXuNqa
 93+3Zvy3IJ7h64mag8EtDryq7cAqdWNv537qUrPD6B/3VYm1WhesHcr6VX0jdt4ToE32wZ8SJId
 lo3yX6KaJPIK127kmsTVNokEcppWbaaH/KVzWrgzJ3nbAXmUSfThMhgldIiHqoFLn+gtVdvtDx6
 O5IPrffoLNcmw41GTwxyC1P640UK6a/FeBlyaiakJ941nbBAGwsFEFvOKSw3H1clG8e2jhuV6AH
 GHLY0xzwKN7+Poe35K6akkCIvg/skPIvJTf1yzQdZhVJilZ2HmleonwGRVMwUba8h5aFnURqgU2
 wTK1T2
X-Received: by 2002:a05:600c:8b67:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-4851989ca05mr89009745e9.24.1772707002370; 
 Thu, 05 Mar 2026 02:36:42 -0800 (PST)
X-Received: by 2002:a05:600c:8b67:b0:480:2521:4d92 with SMTP id
 5b1f17b1804b1-4851989ca05mr89009285e9.24.1772707001875; 
 Thu, 05 Mar 2026 02:36:41 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb277e3sm32811255e9.10.2026.03.05.02.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 02:36:41 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: David Lechner <dlechner@baylibre.com>, David Lechner
 <david@lechnology.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Noralf =?utf-8?Q?Tr=C3=B8nnes?=
 <noralf@tronnes.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, David
 Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH] drm/sitronix/st7586: fix bad pixel data due to byte swap
In-Reply-To: <20260228-drm-mipi-dbi-fix-st7586-byte-swap-v1-1-e78f6c24cd28@baylibre.com>
References: <20260228-drm-mipi-dbi-fix-st7586-byte-swap-v1-1-e78f6c24cd28@baylibre.com>
Date: Thu, 05 Mar 2026 11:36:40 +0100
Message-ID: <87cy1iv9zb.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0CwhQ77h0FaYPA5ZW4f0dYvHZMlhdYiKDCqB-T11zig_1772707002
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
X-Rspamd-Queue-Id: A1D8120FC62
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:david@lechnology.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:noralf@tronnes.org,m:lumag@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,lechnology.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,tronnes.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[javierm@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Action: no action

David Lechner <dlechner@baylibre.com> writes:

> Correctly set dbi->write_memory_bpw for the ST7586 driver. This driver
> is for a monochrome display that has an unusual data format, so the
> default value set in mipi_dbi_spi_init() is not correct simply because
> this controller is non-standard.
>
> Previously, we were using dbi->swap_bytes to make the same sort of
> workaround, but it was removed in the same commit that added
> dbi->write_memory_bpw, so we need to use the latter now to have the
> correct behavior.
>
> This fixes every 3 columns of pixels being swapped on the display. There
> are 3 pixels per byte, so the byte swap caused this effect.
>
> Fixes: df3fb27a74a4 ("drm/mipi-dbi: Make bits per word configurable for pixel transfers")
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

