Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEAFB7EF92
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 15:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0222D10E63D;
	Wed, 17 Sep 2025 09:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VYgkSQbP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC4310E63D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 09:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758101595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=89BDSPXQuFlvPv95q9QMB56awWQ5KCn+7gDQqVOL5IQ=;
 b=VYgkSQbPWO35QAT4LrBHQgDH2eQDAF9AMNWv+gXKDvRea0V1jIyswTXiMO5RYQeDwGCoam
 gZw30zyxwCBWe0ytphFMhu2gBNl0Q6Pd0jF8iUNAI/d0TzSSlLpKQzG0/5zUX0J6bK6xLf
 uWcpX2YMpx3QcYHhR3jgveso9KjC5F8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-paPfqeQZPMG1Axww6B4wcQ-1; Wed, 17 Sep 2025 05:33:14 -0400
X-MC-Unique: paPfqeQZPMG1Axww6B4wcQ-1
X-Mimecast-MFC-AGG-ID: paPfqeQZPMG1Axww6B4wcQ_1758101593
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b920e0c25so41767125e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 02:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758101593; x=1758706393;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=89BDSPXQuFlvPv95q9QMB56awWQ5KCn+7gDQqVOL5IQ=;
 b=qkIpWSGQUo4ZTxQdL6t3TdrYJLhkFjjg9aCl5R9Ipp/jh3J/IZDJ34H/suCvwVNPNY
 7g999m0FNn/2cg6xCfZGkW1gqV75hY2pyNA/QsNjy31CYqNC1/a48mNvjIPZq8bc1cz/
 HEmnQyOHLnwSj30qAkCCOYTfTQyWKB2f1Pq2p7LbC0JnIyuANJJECjt9hIHj+FnT7ogq
 Ahqee6R1WH9KImKoSlaNyC+59jG5TjzqlPsbdRfgejm0U4REfgjNsiPHmZ9diqcTm1Ov
 h/j0kXHQL4wJKdhVG25dlrlZH4GGoggKjquFVL2W/aZ12sICIY2LrJ3bHPzaG5flzDdB
 iQSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYap9DZ2I7k0IOu3jOcpcbZNyEdY/LMJzLmTTQkGUwtuTgUYI9LBC/Ttkg6QE87VaIaYHaWb0cpes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9/KdPRy/njNBbNllCN3K0ECQmSq7WFKBUlstbHGN9kQZkZ48R
 MxdZOHK1wUFOlRCDXRMJzZojpILPtbGx7wOiURlts1hf9NacNIRxz0MPpLsGNB5aFqkkfSt7xL0
 mwaGiDIGm5SN9slcGfUS0rtUlS2tdxq6q1xsB0V5G1W1t2yGKER/ldBTpgDpQloRE4Wn6+w==
X-Gm-Gg: ASbGncu6ouaCtcOnxvtB1Qqtp7zFZYTR26L76vP9CdmNk4GUBaniVbUsnUSvDX4KxbN
 ODHVbiJCQ96xmceJL4dvzX0Um2pmq5mb8n0usBEBqEB93Np5OwOFnTU1kl15fSTtHk6Xhgei8Lz
 Hx2PL84+ttQB/95Lz01EJib2qyLl3HIWNg2eXmPLNSYD29Ux9RBoM+HXJkLXwQuzdjWspSAkaD1
 C+Ru7jUyuCA1vomnD7i2llMLLT8w9WsNVe2kp95VaAZOunNX4RhVJZTq8L+wXl3t1MI5t0jaO+m
 vkmU4vZfNN2qxaBGKTVH4Yynb6HVVKA7durTIIhzjWm0EG3s2tJY+LX4om9snkLtPucQ7PeS6/E
 NUENeu9xfNKFll1rWxnUvIQ==
X-Received: by 2002:a05:600c:1f8c:b0:45d:7d88:edcd with SMTP id
 5b1f17b1804b1-46206b2e1admr16045715e9.30.1758101593130; 
 Wed, 17 Sep 2025 02:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENXZ4rn06CVJu6gZ71Iaf2lGuFxnBG38Z3AWJjORTvoJCFn1PWRhC71R9PJs2NEILp/czqrA==
X-Received: by 2002:a05:600c:1f8c:b0:45d:7d88:edcd with SMTP id
 5b1f17b1804b1-46206b2e1admr16045405e9.30.1758101592738; 
 Wed, 17 Sep 2025 02:33:12 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613869528bsm29227745e9.14.2025.09.17.02.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Sep 2025 02:33:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: James Flowers <bold.zone2373@fastmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 skhan@linuxfoundation.com
Cc: James Flowers <bold.zone2373@fastmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] drm/ssd130x: Use kmalloc_array() instead of kmalloc()
In-Reply-To: <20250914073841.69582-1-bold.zone2373@fastmail.com>
References: <20250914073841.69582-1-bold.zone2373@fastmail.com>
Date: Wed, 17 Sep 2025 11:33:11 +0200
Message-ID: <87ldmdo23s.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SWD_ZoROqsOLAzLRLAbBwJ0p3TgYuEKZ5ESyL1BN2jg_1758101593
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

James Flowers <bold.zone2373@fastmail.com> writes:

Hello James,

Thanks for the patch.

> Documentation/process/deprecated.rst recommends against the use of
> kmalloc with dynamic size calculations due to the risk of overflow and
> smaller allocation being made than the caller was expecting.
> kmalloc_array avoids this issue.
>
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

