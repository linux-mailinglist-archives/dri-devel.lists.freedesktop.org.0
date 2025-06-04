Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A3ACDC69
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:21:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8D010E052;
	Wed,  4 Jun 2025 11:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LF/QknrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03C10E052
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749035707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H5bmvoV528ZDMkA8vQ3GG9k3siMYViBoGzRoypMVKOg=;
 b=LF/QknrArLMbI+5Qh7O69AMQijTwM/ENcHoQncY+jm5JnZrTbsi7zia1U4CTc2Gi5DALTy
 76RlgKPRfVvVW7SgG+xccq7K7gS4ZcB3A2/FgnYT97XkxkH7+5QXWh4e/y8xHgnq9DDsau
 S0EhvngjTe9U8Wk5fZ9dm6xG8pDX808=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-SNwn2XjsOdKrH_IvDl9Q5Q-1; Wed, 04 Jun 2025 07:15:04 -0400
X-MC-Unique: SNwn2XjsOdKrH_IvDl9Q5Q-1
X-Mimecast-MFC-AGG-ID: SNwn2XjsOdKrH_IvDl9Q5Q_1749035703
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-442f90418b0so36151995e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 04:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749035703; x=1749640503;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H5bmvoV528ZDMkA8vQ3GG9k3siMYViBoGzRoypMVKOg=;
 b=BQjs2mpmJbN7TmOfxQ3rREQOLU0G6z1ob3GS42WblIK3iIeG3QI4VEHs7JGZoibHHz
 JsVxCsW86J/Nx8yhq6hG7HpkN7TakPXunPmrP0w1UpnmZHJ2sIsp8gKTewkYdxceMTbd
 TzCEvMs2GGnEa7M8fvF1aMWeE2Bduti1U6Tozkux2mqk7kJ67WcgvvPKz306hqkXcF8G
 Np8z733dvm6JH61QJw9aG3ibu15HA48K0Qr/NwMhWwrL0pf5Z/Ttwyx6k1BGt1QP/XMQ
 Fa4mUej8BcFwt4uqSg1YHnc/7FbytCyyfMjAAnRzvSFNZ5hES/LbHbSH+YF4kUk5E8KO
 dSAg==
X-Gm-Message-State: AOJu0YwISzupPCEUCfaZX3WbjAGcGMnyHsfTxlI8XTeV/V+0uy4pZivc
 13llTu+YaUBlWylmtaGp2Aoykqb/wWeAAOCp47mpQSUHYNLKNWodQi2Mmk/ii/DtahTcPCqymXB
 IqFVom5efnRogv71cGJ+Cc4q1TxJ9UGfuUX/GzbzjZOoLcVrG5467RgTB+eBl/qOWtDVfGg==
X-Gm-Gg: ASbGncsIEApLSuDvD+VVw0tL/jwdrtqqIxuRMvZgKFR2bnbPFrN4cBoqx8QO6qk8ZN0
 8A5m8Qr0hz+4kzhLK126lb7H6XWWEwraGOlV0kBQ4PNWOq6RTEXbdf9UYQL0Mt6RB1K9OQxpS1q
 28ajRLSEJvjXOTGljU65rb4DA4RoKRgxjkEx+2aHcdh8e6miW8X3hjQY4wVHrmtN51SJQQQEnim
 fJTaLJ1J4zSxTKw3tB23zn2zYCVv4VfBkJW+Shb4SFxZGA80ww1k/FlkGBQFid1g8kvz2f+COA/
 ValiWe9Ih9JGFin0S0N1u1pCt3odpxT7xMkyNNO3u/GY/ITfzPfK6Mvfrn7TVi7CJB6A7w==
X-Received: by 2002:a05:600c:3542:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-451f0b3938cmr24124165e9.30.1749035702778; 
 Wed, 04 Jun 2025 04:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEkyu2yxy9u1E10EDNHkq0GJQg9fveXJ4AfXqJRU2A9xpka6O8heUM24yU/Pjyhp3aJF3xAA==
X-Received: by 2002:a05:600c:3542:b0:439:86fb:7340 with SMTP id
 5b1f17b1804b1-451f0b3938cmr24123775e9.30.1749035702404; 
 Wed, 04 Jun 2025 04:15:02 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a522ab67dbsm916950f8f.62.2025.06.04.04.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 04:15:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Helge
 Deller <deller@gmx.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
 Zsolt Kajtar <soci@c64.rulez.org>, stable@vger.kernel.org
Subject: Re: [PATCH] sysfb: Fix screen_info type check for VGA
In-Reply-To: <20250603154838.401882-1-tzimmermann@suse.de>
References: <20250603154838.401882-1-tzimmermann@suse.de>
Date: Wed, 04 Jun 2025 13:15:00 +0200
Message-ID: <87ecvzahcb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4QGa8vlFzhun96sP1b0MFxlMuhOk88-JuydvGmD-N9w_1749035703
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use the helper screen_info_video_type() to get the framebuffer
> type from struct screen_info. Handle supported values in sorted
> switch statement.
>
> Reading orig_video_isVGA is unreliable. On most systems it is a
> VIDEO_TYPE_ constant. On some systems with VGA it is simply set
> to 1 to signal the presence of a VGA output. See vga_probe() for
> an example. Retrieving the screen_info type with the helper
> screen_info_video_type() detects these cases and returns the
> appropriate VIDEO_TYPE_ constant. For VGA, sysfb creates a device
> named "vga-framebuffer".
>
> The sysfb code has been taken from vga16fb, where it likely didn't
> work correctly either. With this bugfix applied, vga16fb loads for
> compatible vga-framebuffer devices.
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

