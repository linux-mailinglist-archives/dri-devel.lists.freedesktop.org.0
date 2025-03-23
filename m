Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70172A6CED4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A5E10E0E8;
	Sun, 23 Mar 2025 10:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gBXZKa7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C57E10E0E8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742726366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WOLXkNTAPJ8mAp6ossE7uqsCMZiJgYM3G8zvEFiAwzU=;
 b=gBXZKa7kF6/n3WQSvi1JCEZJ27HJm+kHRLTSPwAxMvRc2w5nhBhrxO4UQ+Xy1peno3iLFL
 rmyH7BeteOmL/wPBqsTa3UZA3Q4x9xdJDx/x/He2d/AV1yfZ2oq/Cn/g2SylFuom8asEUZ
 d5aa8B31D9xHCKG+4L9Lv7wbbHeo02U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-49_lVbByORexhaKU-YNBDA-1; Sun, 23 Mar 2025 06:39:25 -0400
X-MC-Unique: 49_lVbByORexhaKU-YNBDA-1
X-Mimecast-MFC-AGG-ID: 49_lVbByORexhaKU-YNBDA_1742726364
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d51bd9b41so18424415e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742726364; x=1743331164;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WOLXkNTAPJ8mAp6ossE7uqsCMZiJgYM3G8zvEFiAwzU=;
 b=kJse5E++vzmN2Tbl0bXHmq72C/GTHvjEHXNFy1Xl4u8eJwme8cJ5DEubGJzgubPHL9
 8SolnDRol7i76zLHJ7S/7gDSGL6JlE/Or6OP0jvmSLKbaWY+esKsz/RvP7XLbBVM+vJA
 6zXqCpPQKr6JxwpwHSsb4EqbM4oteAFHNHGoVKH1n/FYcXgYSTeCdvwy6y6/Jlxgque3
 utk+qwffGQooErZdkke65kW/WmwQ4QUAHDddd6bYEJC9Q050hdTCz1TJX2fjYtfRkxLN
 otW/AM2snjRpp3iU5Kh/EZfjRiCCgh/YWDTuJnaVZv/UEZftRQvBiCnxDLxuC2LHPutA
 YgWA==
X-Gm-Message-State: AOJu0YwCvWRYgXJXtC85At8T2vh04upcxmg55eH2vuiXszwGPpjpJLad
 W7ca/lEsAcNRN+0LJDUnJ5Z7vc0+yRGs0xAQreGX4yP/tyien3uVpRYdt3WjaRxr2s2jTlma5Zt
 LCdk+ouazVI0/Erx1VoR8IM/DGKMIhsV5O/DLQeZvOTIL76TFhLIKyfx5yJbM/2NvdA==
X-Gm-Gg: ASbGncudcDt2FirOd9LKE4jILzCofT/SZk25jzY5rXpF6eLwdXoQ8hfOpbpuGMb/uIV
 32WP0wzIM6c0eog/LVnoe9oVM3PPHRMRp4nreIAEUZa6nOura62CrkHe0+d8qHUTRIdMCkP+QgU
 58jQoJGepMQ0kBWJaa0lo4++s4fLErg6/LmKmy6mMsf6fwnw+eQdUt1bRB0eoPUNsdfThsdWItH
 /tsAluvbZL6muROTjZq6q8zRdTsHHEaHKacPtQ/JmrnSVN5FdDVQSbrvWuBDoV3l9suifz/H0fR
 jghdfC6vULjaab+P1kj5dHt66SqZFQoebS3zQ1ahPVkbo86jhYf7EjoGcB1N8OCNSHWDWtIxPA=
 =
X-Received: by 2002:a05:600c:3c9a:b0:43c:ec97:75db with SMTP id
 5b1f17b1804b1-43d509ec467mr92370895e9.11.1742726364312; 
 Sun, 23 Mar 2025 03:39:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTh1m1gMypG1qNRoi1Jz9wsmu0Hx36IDTN+DZ2X4Yuv4fMIgVmHLKr6vEAtEF9j9JI0zZxjA==
X-Received: by 2002:a05:600c:3c9a:b0:43c:ec97:75db with SMTP id
 5b1f17b1804b1-43d509ec467mr92370755e9.11.1742726363942; 
 Sun, 23 Mar 2025 03:39:23 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e6667sm7529225f8f.72.2025.03.23.03.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:39:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/18] drm/sysfb: Add struct drm_sysfb_device
In-Reply-To: <20250319083021.6472-6-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-6-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:39:21 +0100
Message-ID: <87tt7kdo9y.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0THqUXQp1AwmsCr9NVUTVHijWyFnIzd6vP8ahyq6nko_1742726364
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

> Add struct drm_sysfb_device that stores the system display's hardware
> settings. Further helpers for the mode-setting pipeline will use these
> fields. Convert ofdrm and simpledrm by embedding the sysfb device in
> their device structs.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Nice patch, this makes total sense in hindsight.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

