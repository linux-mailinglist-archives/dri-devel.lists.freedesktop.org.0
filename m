Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOtHKDSSrmlTGQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:26:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 101F1236212
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 10:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BECD10E4B0;
	Mon,  9 Mar 2026 09:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e7OKZUpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9263F10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773048366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1H9VgSIcKFIGUqagiyR8hKUnbcZS/b32mUUSRzGFVEs=;
 b=e7OKZUpFPdzz1hqYTP95kY66phhMxozwJSU2bCNNWhHaFBicoAS6+aHIdb/SeKjClgH9TA
 JzqvgvNKocbzhNpYlaatBQVn7+Vj4P/x03+jKGLqvVvSoYy+S0fQxVUwiiLjNDT5XJA04Z
 qIJX5ac6zuSFcIRHGx7Irz3sP7MwH6s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-zEZsp1BkO7KRN15msl-vtQ-1; Mon, 09 Mar 2026 05:26:05 -0400
X-MC-Unique: zEZsp1BkO7KRN15msl-vtQ-1
X-Mimecast-MFC-AGG-ID: zEZsp1BkO7KRN15msl-vtQ_1773048364
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-485375aa56eso8075905e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 02:26:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773048363; x=1773653163;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1H9VgSIcKFIGUqagiyR8hKUnbcZS/b32mUUSRzGFVEs=;
 b=BNfoTpNbksMUb8OHIfDm0lCFSkcj7pdkujUVn13SgvX7McOWEs3QtTMzfTJ9TUbnxn
 T4N4bcSx8cEc4sQGweOk2rCEaV6StiuZyPQEgjPVsnvDl+sg336dc9rjNWatDQfB42+F
 8ZkjyPlYoy+OrQS/al5H3dZ6ns8PfO1NgF8NENULZbic0iywz7C9JKteI5dvrD9eNxzb
 lm9/trXf9sc1FFLWRQTtKd/1lEMnAnHBnZGbhI82z+/UBmPE1wCGqUPNJPkDEGrnccTR
 MmdHKmQUHHFY0cj2qALeoDMyDGMXERD4G5LunOGsH+a0xlu+EpC4q4RTEkBrZcYnXXU7
 Qy2Q==
X-Gm-Message-State: AOJu0YwD2ChSxtOiUzGrYxADqONm9Kl9+GvoO9955Z3I+zAS+M2U584w
 WPNiYgEjhgBbDhI6mGz3dgAQLNcCj/8FLWbnv1Fr6WCZfJyCXBgKWRGekhd8T7qVNT6NLaM+KUg
 bEamG0yBzaHrxGbVk6xEimxX5/D7dHUGD3IrC4ZSrqnTcP6sk0UnMqkomQ5xts1q2axdPEF7AGq
 bXHw==
X-Gm-Gg: ATEYQzwVHnq4VVO23RdB7JmP5O0dsswXkfhroytaMzIbQCxTgTguxmi1ZR1CTsOyRLD
 QT2QDH0weaj3Eh61m3KP9qwDkIeQJ9udPMNJoqgSrVTR0mK8OJuHEJiRmBxqLaX76Mry4VXMoax
 2Ifg8+8gTc0N/ErIoL8VtAWvWGYBkNsyExHd3EDowYJFyYep09sRWE/PTcOQ9ib02xCIlDuRK2q
 495mAU3Msuefh8Zlflbai6Ht3rZ9VV8aDibRvEw0OBUJ+xWIhJvZUL4XHXr4p5darIUItyoKyAU
 DNcJpTn3fuuDGU2Ddsg5nhtt+p43sVP2GidKc4rIAaD807gLgEUoPiZBIZxBRvV7pYoIwcIbKfb
 ToDjmE+eJJdtX45yfVkeRb8zi4e/QBGTHcVQZX09oWFdHelSMGTxVynpp4gEVwM1HiPNZXm9B49
 e/Jxiw
X-Received: by 2002:a05:600c:3acf:b0:480:1c10:5633 with SMTP id
 5b1f17b1804b1-48526979e65mr171347065e9.26.1773048363418; 
 Mon, 09 Mar 2026 02:26:03 -0700 (PDT)
X-Received: by 2002:a05:600c:3acf:b0:480:1c10:5633 with SMTP id
 5b1f17b1804b1-48526979e65mr171346585e9.26.1773048362962; 
 Mon, 09 Mar 2026 02:26:02 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4853fcb6b92sm14081045e9.3.2026.03.09.02.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 02:26:02 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: David Lechner <dlechner@baylibre.com>, David Lechner
 <david@lechnology.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Noralf =?utf-8?Q?Tr=C3=B8nnes?=
 <noralf@tronnes.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix/st7586: fix bad pixel data due to byte swap
In-Reply-To: <ca862f40-1dbd-4056-9f70-8ec3d6789604@baylibre.com>
References: <20260228-drm-mipi-dbi-fix-st7586-byte-swap-v1-1-e78f6c24cd28@baylibre.com>
 <87cy1iv9zb.fsf@ocarina.mail-host-address-is-not-set>
 <ca862f40-1dbd-4056-9f70-8ec3d6789604@baylibre.com>
Date: Mon, 09 Mar 2026 10:25:59 +0100
Message-ID: <87ldg1icbc.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mqKjo1xhgu00dDuKFYIxQqDPAi0s-dA18cmDo4_464g_1773048364
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
X-Rspamd-Queue-Id: 101F1236212
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
	FORGED_RECIPIENTS(0.00)[m:dlechner@baylibre.com,m:david@lechnology.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:noralf@tronnes.org,m:lumag@kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,lechnology.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,tronnes.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,baylibre.com:email,ocarina.mail-host-address-is-not-set:mid]
X-Rspamd-Action: no action

David Lechner <dlechner@baylibre.com> writes:

Hello David,

> On 3/5/26 4:36 AM, Javier Martinez Canillas wrote:
>> David Lechner <dlechner@baylibre.com> writes:
>> 

[...]

>
> I pushed this out with: dim push-branch drm-misc-fixes 
>
> (It's been 5 years since I've done that, so hopefully I did it right - I followed
> the docs and it all seemed OK to me).
>

Yes, you did it correctly AFAICT. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

