Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158E2A760EE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 10:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2F010E398;
	Mon, 31 Mar 2025 08:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IXPCS3AO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F0510E398
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743408491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3YHvdds3A+TCrRx/ho1JIq9at01xQmwFerOjrZyVS7Y=;
 b=IXPCS3AOgRM72gFbjI/txCjp4eDKa56pBlab6RuuAn75QDstYhlOMEaLUd2pCA+OBttOlQ
 jQoAQ57Uz/0IikfXd+UYH3yN7AuLZsz6Zzw3M7bxi0Y5lN56djiWNhrHeYljO6Z6YJOuQc
 ffPJCNQ/0jyD9e5nTzFdwhJfN5DdzHA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-uTS3mO9bMJ6zLBZyK6GR9A-1; Mon, 31 Mar 2025 04:08:10 -0400
X-MC-Unique: uTS3mO9bMJ6zLBZyK6GR9A-1
X-Mimecast-MFC-AGG-ID: uTS3mO9bMJ6zLBZyK6GR9A_1743408490
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6e8f9057432so87762036d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 01:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743408490; x=1744013290;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YHvdds3A+TCrRx/ho1JIq9at01xQmwFerOjrZyVS7Y=;
 b=wDD/c81GI52hdBKDCDe3AKnkLcoFoF7VBUE6OjJLHFq4Y0xy9gQjU2SUfENJ7YRDmC
 dyYeR27qLjgGN0UB8AxuQGTFu7XdLuBE1b6SIVkmMRj7J//hR73vxZggOLhz/jL2sHfh
 byMjeJTQU/7gALRIQd88feoX+D3TW8gEvaDgCs6VQ9GbhEikM3w4IGtx4y9JHqdiCsoO
 b/g0xWmH21RO0BZirECH58bJGOkUGbp9nqCLuvI6VmcRk0iz9lP7nsBlw0uQS4LTKRyK
 DVkwz5mji8utp2n16ww+GfTG9qfxQAewmTkc9NtDaBKSHSbxHhPmPmOhYgIgCg9AsPc5
 /WEQ==
X-Gm-Message-State: AOJu0YwLZomD3f0S2yAkzaloZfBQ7liycqLfhqDAs/OwGw/+CQxYSDD/
 5G0odbuhgmodmjX4o/LSFcqvIPXhwD8XdaMrEGUpUKiP4uh1p/dGkx/9h/tpTWtvSoVwQNrEJty
 dNyWIpUrdvl2c1OCcShL7bhCUYVY6Q2rclRTBcdcwwK8QFPWdpDVP1SUzb83RCPKzJQ==
X-Gm-Gg: ASbGncvPJTLy4Nj7Xm22/wAT9r2Z7APle6QhoGo5e0NMUtD9On/MXZJAVbw0WCxI4wz
 HZFjI5SKfNWYRZPY3G8KayLS4jPZL9s5eGI/kBfAJtTzzx1Js7lsMe3g5Eb+O87V1FFqqFisvQF
 rC8j0jAnBVbBjTy585DcAStgnZLTNsQg0jeGaKi/yQX6VR73oxrixX5anDgnp1KaAKnuON4F0P6
 8OBPrhrdi4pGEBrHtyLSRLrDdr00PTIja3cQqN2HkmjkXA0ZfuTiD7PuGfiJrC5vpU56skak6y+
 Y1diAHt9dxxqAXdruHyaP/6MUjej2epxzRLA4fogmEbgCg==
X-Received: by 2002:ad4:4ee3:0:b0:6ed:1486:c3df with SMTP id
 6a1803df08f44-6eed5f97fdcmr131741126d6.2.1743408489893; 
 Mon, 31 Mar 2025 01:08:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUZVSsfnLFG9tmzfgfCRDQ6Hb8etsjYCC4n/977FOotvRbEq2b65KnHPlSzMUK++XiSmQAfA==
X-Received: by 2002:ad4:4ee3:0:b0:6ed:1486:c3df with SMTP id
 6a1803df08f44-6eed5f97fdcmr131740816d6.2.1743408489496; 
 Mon, 31 Mar 2025 01:08:09 -0700 (PDT)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6eec96566dbsm43480196d6.47.2025.03.31.01.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 01:08:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/18] drm/sysfb: Maintain CRTC state in struct
 drm_sysfb_crtc_state
In-Reply-To: <20250319083021.6472-10-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-10-tzimmermann@suse.de>
Date: Mon, 31 Mar 2025 10:08:05 +0200
Message-ID: <87o6xhhbbu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 61N0xzAztK7g5nM6_dmeq6-b4T1EQKIdzjCmyoTakUc_1743408490
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

> Move ofdrm's struct ofdrm_crtc_state plus functions to sysfb
> helpers and rename everything to drm_sysfb_crtc_state.
>
> The sysfb CRTC state is a regular CRTC state with information on
> the primary plane's color format, as required for color management.
> Helpers for sysfb planes will later set this up automatically.
>
> In ofdrm and simpledrm, replace existing code with the new helpers.
> Ofdrm continues to use the CRTC state for color management. This
> has no effect on simpledrm.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

