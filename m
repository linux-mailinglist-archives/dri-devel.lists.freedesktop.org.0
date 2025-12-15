Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCA1CBD163
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 10:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F70110E2B7;
	Mon, 15 Dec 2025 09:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dIX7rCj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EDC10E2B7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765789359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E/ch7cqSj/IiLkf/Hft/aylN6OFN53FmeYjrSH6kZBU=;
 b=dIX7rCj5uBeSV5ePq2sOtU8h5gGQCY/A6bglQZYzH6Nz/wAG5VheIlZXIWqxhDyUCAkr8n
 na9msvtsuBdLm0Qca0UumbrZu5E5YVKjI/2tKcYHXVUKi61g688AaybK07Y99EAyvgm2Id
 W/SqWs/9nJHszNIqL7jsiO7TJ/tY7dM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-RIRQ3gbyPASpreHwa8blkA-1; Mon, 15 Dec 2025 04:02:37 -0500
X-MC-Unique: RIRQ3gbyPASpreHwa8blkA-1
X-Mimecast-MFC-AGG-ID: RIRQ3gbyPASpreHwa8blkA_1765789357
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2a09845b7faso24254885ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 01:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765789356; x=1766394156;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/ch7cqSj/IiLkf/Hft/aylN6OFN53FmeYjrSH6kZBU=;
 b=nLrsCr4Bz09F0X0xf2ExwjcTUkwcWesd8BDq6gpM+DbkBBUnDPTEuhn/nFu7T2zUcg
 1jZah3p7sgzUmvp45x6tI7hzHSgRebmqH/SU3zr5f6VLuA5fi7NY4ttA6MBWedg5CgE2
 wEjY4/upbSGm/9Nb52mf9XpDN+siaDGZwE87cdZdL84QXiPl3tdtAzgIbCr6Iuqo/Q4c
 SJF9f1RmJIpML7ru5vqnpuEpsBNVUeO4Gy+FUzqSe4bo9h8kewGTkRvTTRygLCy4iBGM
 g51GDJOdYii1vSR8Tbi6dsTmGTJJa9n/xisE7Hv2DeqtvV52NOc6cXwFlngYA3QnKubV
 bNmg==
X-Gm-Message-State: AOJu0Yyi/MmUmlI78NuD0t5pdzdKSfw3hyVKgYcgNv6XRxm9Ky8TsuRh
 Y09qx/nJMhYa6JbqFJyL7S+3P5FXMHNb3b9JUKi4QIqegcyeBVYo7whDQMdudu0kej76WVfWXMp
 xGbDxvJA2LQEK6WtBqoRTFnXLdliQ6oyECucL60KXkoFvyvtaf19Ngz3vW7rrQoAOB0C0Aw==
X-Gm-Gg: AY/fxX75fthi6sA9q5as4NPSmgWObFPSqLD0i5in5UrV4H4U0VDP+mI+sde3IywcaL5
 cqx6V7quQMbNxq6QR9aEj7zdEcJVM3CpKBqnsd1d3lUA9lV2pc5RSpE9i174jBEFWn/j3679u87
 tDqLptnqdscPHKyILUX6+iqXm6Zy9VqvVuXPGAhsMSeg9FPtdnwxgv3bRVuiF354F+Ov+D66qxr
 x2AEddjM3SLgFUmx+K3O+JFuf367bHBcLZ9kHIYU30XZhj2uXUsrpv3iBnkuCYB9DaH4zvUhUNt
 t/4Fq21t8kdIiu2IY1VpSDU6tVOKwVvqFD9hv/gX9eUqOGmaVL77ZsTc8y2xZZCKtt6lZ8cRRF+
 52rX2XGR7osXv+xmn9y8Pc0j6C6Q25JU8FNh4gmhi
X-Received: by 2002:a17:903:2f0d:b0:295:6d30:e268 with SMTP id
 d9443c01a7336-29f23d3841fmr99084595ad.59.1765789356559; 
 Mon, 15 Dec 2025 01:02:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IER3cmnaHZkYefZDZPHqHsxm2N4VlThsyCs8G8BXS/I9YQysvxiYy//d7kviFgCQXZptNgBcw==
X-Received: by 2002:a17:903:2f0d:b0:295:6d30:e268 with SMTP id
 d9443c01a7336-29f23d3841fmr99084235ad.59.1765789356191; 
 Mon, 15 Dec 2025 01:02:36 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a0ced60ff4sm37450405ad.76.2025.12.15.01.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 01:02:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH RESEND v2 4/6] drm/sitronix/st7571-i2c: make probe
 independent of hw interface
In-Reply-To: <20251202-st7571-split-v2-4-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
 <20251202-st7571-split-v2-4-1e537a09e92f@gmail.com>
Date: Mon, 15 Dec 2025 10:02:30 +0100
Message-ID: <875xa8kti1.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g9lp3juhJajXw9_LJk8OG0vVbQjXLtXZxdVJ5BrKzCY_1765789357
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Create a interface independent layer for the probe function. This to

"an interface" and "This is to"

> make it possible to add support for other interfaces.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

