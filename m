Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99642B3F7BF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D7C10E5D2;
	Tue,  2 Sep 2025 08:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O/RhPOO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBE710E5D2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756800551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2OhQYE6+zAbUaMelqyE0wxDBwF42vTEkThKnSoTAqWA=;
 b=O/RhPOO46Y5sprq9b7RWZ0AN/o3BuJfozlF3w8r9BFVeTzKg7zIdiYJ93sj19cJrO+K1vZ
 OHY4vBURTVhBSCQCqyKp0djPNMdN6Rw9tsTxP0IT7kXPxgck9difUrf0PkFcHG2G+r2OaA
 SVeQc6IHtoApGjhvedg7WVt6bekgiQ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-df1_j-9xOjm7bCMyahlo9w-1; Tue, 02 Sep 2025 04:09:08 -0400
X-MC-Unique: df1_j-9xOjm7bCMyahlo9w-1
X-Mimecast-MFC-AGG-ID: df1_j-9xOjm7bCMyahlo9w_1756800547
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b7a0d1a71so41187815e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 01:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756800547; x=1757405347;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2OhQYE6+zAbUaMelqyE0wxDBwF42vTEkThKnSoTAqWA=;
 b=HXTnB7gViC77bIdh6yjsDMiWBc2WRAFrBGd4BM5DJEz3H6x8E4Fqwnwspp23HycCH5
 eANgFxz/KFraW7ZeeV+mcQZkugomC+x39moDhULw1QmO4k4la5ZE5OhCAKjlKPY0vhBg
 WOlvJNuz/swGgEbmYS9NbNJW99vd2gAyyTjkklPawhtZwdtGRrCopSsQQpeTxlPmxidp
 hMmeY6SMF1bYHwsI099zIhdjYPF7q/c9pWxKjkWlo9qUiPLIPASs9fnH1QdJpAQ0ugpJ
 Ix42Lr3/A5TtVhB+ZxpUFgtHmNFjdDUgIi6uA/FTf0xsbAqXYl3S+t2VIc1zebMW/2/t
 6Amg==
X-Gm-Message-State: AOJu0YwgLMeuYHGk3wm0ANvF2uy9jlk18Ua6XwC4BWfulILu4N4iByrr
 OslOuYMd9bxY6Wnyz8543mXdJIHEpAXvVmf5T/juzPeS1OXxs3vjFkZp+noq/TILUTl2+66QuEf
 YQiZIXYQLhQPjAAG1REh9V7cwh4i4A4LoMzwfb9ruT9QRLKaZbu0l6Ods2+pKj1Bi4mW0zA==
X-Gm-Gg: ASbGncuaOA6TfBiNDVmRLCdFgSFhsXqrzQiQ49XwYgwikp3mPZkXkwGH8qLAT5pDCi3
 qt+KGsnW6PoiE02knD1mXxoGycSX7a6ocDN6r5JEetkfzJASdRkUo+kmRp/fmTvVuBeRddh7ZQQ
 tVeGZlsFEZvayLFCJZw6j3b//CundkwfbbB7jmxg4JWbRkTuhnyPHemb2HhjsV33xMLejMhQduX
 Vl4+JxHwPnWl+jzfZZTTaBQJ2hN3E+WL8Mk6Fd8SICns2MPW0ln1OhGU6bT9A+L4ibaw0hFr9qU
 PP1X8q1e4gd6eZyaCLqxYFL4hXCx5Qbfp1kTjlmGdJv6Hdahm5bm8JZRP+eOiRpJDw==
X-Received: by 2002:a05:600c:1c92:b0:45b:9906:e1cd with SMTP id
 5b1f17b1804b1-45b9906e531mr8098335e9.13.1756800546916; 
 Tue, 02 Sep 2025 01:09:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/VpL8irUiMZ+51HF+UjS7DWzVHhCgZjxmNAmQZbWxJxQmRyWxfPkgR2t2/4l9ukH5cuWMrg==
X-Received: by 2002:a05:600c:1c92:b0:45b:9906:e1cd with SMTP id
 5b1f17b1804b1-45b9906e531mr8097925e9.13.1756800546404; 
 Tue, 02 Sep 2025 01:09:06 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8f6cd502sm30099075e9.1.2025.09.02.01.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 01:09:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, louis.chauvet@bootlin.com,
 drawat.floss@gmail.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 mhklinux@outlook.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/4] drm/vblank: Add vblank timer
In-Reply-To: <20250901111241.233875-2-tzimmermann@suse.de>
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-2-tzimmermann@suse.de>
Date: Tue, 02 Sep 2025 10:09:04 +0200
Message-ID: <87iki1ff8f.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: evDkIetJr5lsj3yYnMFz7IhakhnIP14DFyIXEYDdXO0_1756800547
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

> The vblank timer simulates a vblank interrupt for hardware without
> support. Rate-limits the display update frequency.
>
> DRM drivers for hardware without vblank support apply display updates
> ASAP. A vblank event informs DRM clients of the completed update.
>
> Userspace compositors immediately schedule the next update, which
> creates significant load on virtualization outputs. Display updates
> are usually fast on virtualization outputs, as their framebuffers are
> in regular system memory and there's no hardware vblank interrupt to
> throttle the update rate.
>
> The vblank timer is a HR timer that signals the vblank in software.
> It limits the update frequency of a DRM driver similar to a hardware
> vblank interrupt. The timer is not synchronized to the actual vblank
> interval of the display.
>
> The code has been adopted from vkms, which added the funtionality
> in commit 3a0709928b17 ("drm/vkms: Add vblank events simulated by
> hrtimers").
>
> The new implementation is part of the existing vblank support,
> which sets up the timer automatically. Drivers only have to start
> and cancel the vblank timer as part of enabling and disabling the
> CRTC. The new vblank helper library provides callbacks for struct
> drm_crtc_funcs.
>
> The standard way for handling vblank is to call drm_crtc_handle_vblank().
> Drivers that require additional processing, such as vkms, can init
> handle_vblank_timeout in struct drm_crtc_helper_funcs to refer to
> their timeout handler.
>
> v2:
> - implement vblank timer entirely in vblank helpers
> - downgrade overrun warning to debug
> - fix docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

