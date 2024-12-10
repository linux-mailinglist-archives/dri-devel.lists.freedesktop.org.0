Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CCC9EB21B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 14:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F32910E8D5;
	Tue, 10 Dec 2024 13:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ri1xDKzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F18710E8D5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 13:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733838165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K2evyBV6XmxxlV1avo/FS+rwZXLHzCz3qHmAF9H2G/I=;
 b=Ri1xDKzGnR9J4QjgJBLJF81FpR6I/BRRFADfyncXr39hB3MTK8taR8pv18xQD7iJxGlgDE
 fzcjmx61Jw62U2nYNarXl15DJRJl/E0uYCa3gbj8zEeaib6UwXI1XYe7PGarHrEhovaz+4
 44eoEdsBsCGCSfdXaX4NKLCWQTzHRlw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-tKbXOvAkNVqFqz83xd0PIw-1; Tue, 10 Dec 2024 08:42:42 -0500
X-MC-Unique: tKbXOvAkNVqFqz83xd0PIw-1
X-Mimecast-MFC-AGG-ID: tKbXOvAkNVqFqz83xd0PIw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4359206e1e4so6173795e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 05:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733838161; x=1734442961;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K2evyBV6XmxxlV1avo/FS+rwZXLHzCz3qHmAF9H2G/I=;
 b=p6qlwoGN7R2FUu97UIUM9o2ge5Sa1LePm2DLA7PdEkJHVWa/lm2kCV+OaEqI9E1ekk
 QXE9WiQLo2DCZ+kBXXNFLgjuezqOkR18CpfWEPDPBgPbfDqHxS4f/wUY2LVskgUdFhwL
 svsdDJSR2/kthvqJpUsk+57Uq7ug7654ofIZmWP5nP9kqTnZveTfJuC7aDWjtHc1vB8u
 PWw46hntISC5oYJOndfWDvBQvBpTkz0YX/uOv8AQ5ZkOP1fQg0lj13GrdIDB/7qN5uTg
 oaipXDkKUcUUUYqepSmtUn7zSP97xjfUKAQwJTk5utgfkHzIl104XC0DQvRxKfSUGceE
 gGYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc+8pqaEK2JqwGXLhfFMbozy6kdLbvFzvsZFuYdrQqMvQhNfFeHUwGoM1T/uwAzdkvaq6EPseT5G0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySEZwkSg8LHnBS5llF8NMr1vfw+F4H0FZnR6VKUeoTgtpJAnnf
 /lrKBZEd4WTVkvS6eP6upLAcVieYywk5VXSNaffFVor1qFT8LNQVFZM/FmTkmfIDwqPptTZhHk5
 lJroVc1OBD6QgDEcwdjvGmQ7QtnHSWbnKv9BhPIJFjhz0m6NmHP/U/zXG7MbeWVjP/g==
X-Gm-Gg: ASbGnct/1Dm9qVvEA8b0G3JteTUqbZHSlD/sBZhlUN4EzbdzWFNG07+ueULGF55KvTU
 hxIuw+MEjCBpai6jSVfz+/io72yTtzEokeWa7lTZXOieBxCmaDajmru9UmNgg04sdTlI2FRbC8P
 5FKW6o88j/PLYhH0iR1bFKJoKl1Wl2WkBowGKGVMpvZqweMtYjrK/dwojc5yOIJ+amFH3JPSdNk
 W4LPu0WtaEO5UKU1pFDHRfG6XUv5LuNNPv5WPxTegVrQfJJCSalobdR7L1KK72gguG/y/4sfR/X
 S1Oo1Oj6U+YCRlAk5Q==
X-Received: by 2002:a05:6000:4604:b0:385:d7f9:f16c with SMTP id
 ffacd0b85a97d-386453f9740mr4345818f8f.46.1733838161182; 
 Tue, 10 Dec 2024 05:42:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/EzS42fP8Ylhxmzy6/cZtctx2cg5XbsNOtmOhU/S0scujl/REYju6ycezW9PzMx/GLIdX/A==
X-Received: by 2002:a05:6000:4604:b0:385:d7f9:f16c with SMTP id
 ffacd0b85a97d-386453f9740mr4345761f8f.46.1733838160742; 
 Tue, 10 Dec 2024 05:42:40 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386221a5eadsm15742309f8f.104.2024.12.10.05.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:42:40 -0800 (PST)
Message-ID: <ca4485de-5463-4356-a024-fcabde45478d@redhat.com>
Date: Tue, 10 Dec 2024 14:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241204160014.1171469-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241204160014.1171469-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uJdpCyHVaxgrDr61eRqeu1VvbqorSHmEkMRhYIdaKFk_1733838161
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 04/12/2024 16:44, Jocelyn Falempe wrote:
> drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
> This is not a full replacement to fbcon, as it will only print the kmsg.
> It will never handle user input, or a terminal because this is better done in userspace.
> 
> If you're curious on how it looks like, I've put a small demo here:
> https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4

I just pushed it to drm-misc-next.

Thanks all for your reviews and comments.

Best regards,

-- 

Jocelyn
> 
> Design decisions:
>    * It uses the drm_client API, so it should work on all drm drivers from the start.
>    * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
>      It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
>    * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
>   
> v2:
>   * Use vmap_local() api, with that change, I've tested it successfully on simpledrm, virtio-gpu, amdgpu, and nouveau.
>   * Stop drawing when the drm_master is taken. This avoid wasting CPU cycle if the buffer is not visible.
>   * Use deferred probe. Only do the probe the first time there is a log to draw. With this, if you boot with quiet, drm_log won't do any modeset.
>   * Add color support for the timestamp prefix, like what dmesg does.
>   * Add build dependency on  disabling the fbdev emulation, as they are both drm_client, and there is no way to choose which one gets the focus.
> 
> v3:
>   * Remove the work thread and circular buffer, and use the new write_thread() console API.
>   * Register a console for each drm driver.
> 
> v4:
>   * Can be built as a module, even if that's not really useful.
>   * Rebased on top of "drm: Introduce DRM client library" series from Thomas Zimmermann.
>   * Add a Kconfig menu to choose between drm client.
>   * Add suspend/resume callbacks.
>   * Add integer scaling support.
>   
> v5:
>   * Build drm_log in drm_client_lib module, to avoid circular dependency.
>   * Export drm_draw symbols, so they can be used if drm_client_lib is built as module.
>   * Change scale parameter to unsigned int (Jani Nikula)
> 
> v6:
>   * Use console_stop() and console_start() in the suspend/resume callback (Petr Mladek).
>   * rebase and solve conflict with "drm/panic: Add ABGR2101010 support"
> 
> v7:
>   * Add a patch fix a build issue due to missing DRM_CLIENT_LIB, reported by kernel test bot.
> 
> v8:
>   * Rebased after drm client moved to drivers/gpu/drm/clients/
>   * Rename DRM_LOG to DRM_CLIENT_LOG (Thomas Zimmermann)
>   * Drop "Always select DRM_CLIENT_LIB", and select only if DRM_CLIENT_LOG is set
>   * Add an info message if no clients are initialized in drm_client_setup()
> 
> v9:
>   * Rename drm_draw.h to drm_draw_internal.h (Jani Nikula)
>   * Add cflags to remove the "../" when including drm internal headers (Jani Nikula)
>   * Order select alphabetically in KConfig (Thomas Zimmermann)
>   * Replace drm_info with drm_dbg, to be less verbose (Thomas Zimmermann)
>   * Rename module parameter to drm_client_lib.active (Thomas Zimmermann)
>   * Warn if drm_client_lib.active is malformated (Thomas Zimmermann)
>   
> Jocelyn Falempe (6):
>    drm/panic: Move drawing functions to drm_draw
>    drm/log: Introduce a new boot logger to draw the kmsg on the screen
>    drm/log: Do not draw if drm_master is taken
>    drm/log: Color the timestamp, to improve readability
>    drm/log: Implement suspend/resume
>    drm/log: Add integer scaling support
> 
>   drivers/gpu/drm/Kconfig                       |   5 +
>   drivers/gpu/drm/Makefile                      |   1 +
>   drivers/gpu/drm/clients/Kconfig               |  48 ++
>   drivers/gpu/drm/clients/Makefile              |   3 +
>   drivers/gpu/drm/clients/drm_client_internal.h |   6 +
>   drivers/gpu/drm/clients/drm_client_setup.c    |  29 +-
>   drivers/gpu/drm/clients/drm_log.c             | 420 ++++++++++++++++++
>   drivers/gpu/drm/drm_draw.c                    | 233 ++++++++++
>   drivers/gpu/drm/drm_draw_internal.h           |  56 +++
>   drivers/gpu/drm/drm_panic.c                   | 257 +----------
>   10 files changed, 820 insertions(+), 238 deletions(-)
>   create mode 100644 drivers/gpu/drm/clients/drm_log.c
>   create mode 100644 drivers/gpu/drm/drm_draw.c
>   create mode 100644 drivers/gpu/drm/drm_draw_internal.h
> 
> 
> base-commit: c6eabbab359c156669e10d5dec3e71e80ff09bd2

