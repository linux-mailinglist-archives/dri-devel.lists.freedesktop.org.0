Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FFAA7E035
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFD810E476;
	Mon,  7 Apr 2025 13:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FLf0vunS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E592B10E476
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744034334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NKQaxm+8dbF4nb2OYVZtaNLSz1NxmABEoTvWQVFR0f4=;
 b=FLf0vunSqRYPxl/z9v+oVZRo15psb4OiLXE1UO4exF4/4HbV/qdHNJvgTwpIB2E1Q1L01F
 MuiCdPz1hU0LKKKfk9FaFx52oq2mJFH7vRLiQ+zd2Z4zRToQiPEb156dw5/V4PpopB0A4M
 Pqypp5uvXXC2h1XmtZF1FpqE6aR+wgs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-pJSMFrn0NDyrh8e9J3xbgw-1; Mon, 07 Apr 2025 09:58:51 -0400
X-MC-Unique: pJSMFrn0NDyrh8e9J3xbgw-1
X-Mimecast-MFC-AGG-ID: pJSMFrn0NDyrh8e9J3xbgw_1744034327
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf327e9a2so37696985e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 06:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744034327; x=1744639127;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NKQaxm+8dbF4nb2OYVZtaNLSz1NxmABEoTvWQVFR0f4=;
 b=nE9SLjzbRrFL+w+K53hh3yzyvR+5xoBORJWHRvQWkPB/1VPRvWkJJ+VgfHZx4kmIiH
 AcXrOZEMd0Z98jvfnljKMqAL1IbaAdQXms7F5tcjTZCkzk5DmeTxFAmkYJFeCHLEaSQc
 73w9h+xGyZVvg95jQ4kpP6vWMB+8GQgmWjPKkdjFki2CpRtk+f7JVOxrOfaBNICxPh0P
 KjluD7jTveKCnahnkxYhYEK0UY+7DfGPaDp94GFWdKJpQSp+MHVvNCKA2CkNwGujiG3N
 hnqldbacgZGs5trCRZ/w7M+AcohQ6FpT6rK7Y0NVA6SIFvSzLw6Tf9qaLKMrvQ3ftNq0
 sJIQ==
X-Gm-Message-State: AOJu0YxD9L5kVuPe9HoRNyPBPSAwQb4GR+cEcl+Fs7ckyYxJXhVMKsr4
 cCPxbb5J2iq0Cn0xEj86cSLASCcTQy8pUrUa2hy3VPDo/RhUUBflyYS5K0iYAfZ/05I3uA/4P/M
 jSKF6fqSsvhBeN6lmhFH0azoC5z1+NJr+UiEpLNN8o9GoXW2oD7YUcgCT4vABWYmcQA==
X-Gm-Gg: ASbGnctS79i8Lk51sDCTpXQdDTRH08xwwkhbdniwTS/c5QZQSsfQTPoWwL6cx9EkfDu
 1HbE6s+pUw+TCwhiiQSX3I/Oh1DKAvJv+MoWewpbPT0/x2cK5fU+1GE8eMQVsuDbocxDakfEIwD
 KEQfVZT9vf9aeplXUVsfszNTRUgoS1b6HJhQJsF1kyT4RKIYBHE6J7vqcQJ6CHIJH7mRvarcG5K
 eWqCxxopxF8f8kGL2d4jKLUXT0R3lIIwO0wl4Re/wssPCkmaOVwSIlnEDH9DP77YjsrA6bb7el3
 VhtRmIf/Wi5tkbXXDZioC8Gdr8iYgJI7+xL1P/I/nux2ch8gnNUKwOA0sSDo3p7DJ+W3Oz2nCw=
 =
X-Received: by 2002:a05:6000:40dd:b0:39c:1efc:1c1c with SMTP id
 ffacd0b85a97d-39d6fc85bcdmr7500123f8f.34.1744034327186; 
 Mon, 07 Apr 2025 06:58:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5QgaUxNWjuEtXsBlHixyWJCdpw1rSkd5MpsB3uA7GVZiOCsyohCshMX6qfj8sEJwl/CAiMQ==
X-Received: by 2002:a05:6000:40dd:b0:39c:1efc:1c1c with SMTP id
 ffacd0b85a97d-39d6fc85bcdmr7500100f8f.34.1744034326836; 
 Mon, 07 Apr 2025 06:58:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226ecdsm12673154f8f.99.2025.04.07.06.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 06:58:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/simpledrm: Do not upcast in release helpers
In-Reply-To: <20250407134753.985925-2-tzimmermann@suse.de>
References: <20250407134753.985925-1-tzimmermann@suse.de>
 <20250407134753.985925-2-tzimmermann@suse.de>
Date: Mon, 07 Apr 2025 15:58:44 +0200
Message-ID: <87y0wcoyy3.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Nzo6rxtmEogn7RFp7tpQeXJDrwrYuq9KWxi8ttLkqBs_1744034327
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

> The res pointer passed to simpledrm_device_release_clocks() and
> simpledrm_device_release_regulators() points to an instance of
> struct simpledrm_device. No need to upcast from struct drm_device.
> The upcast is harmless, as DRM device is the first field in struct
> simpledrm_device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 11e8f5fd223b ("drm: Add simpledrm driver")
> Cc: <stable@vger.kernel.org> # v5.14+
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

