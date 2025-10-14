Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B705BD7F56
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 09:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2D710E569;
	Tue, 14 Oct 2025 07:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DyIZGQ3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7CF510E569
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 07:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760427391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1vjIWoi/164XsR7x2ZrPuJ9XjGOCw1cRW5cuBw3diZE=;
 b=DyIZGQ3BaciLf4qde9B+41Us1tMbmliByoNhNXKYgYzzqwe8Qr9fY4oMI3o32nglDftm27
 49NvkYCYZIqcse8IzNoQG2VOGRTxgeAQi2tcE36ZJcj+9HWTlA6Gw54pIMZu4AKjDxcHOH
 rJ20qccjt4R7irUWWNM52ezMv8OBzwQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ZM4PHH-hPTKfdgG9KOqIpw-1; Tue, 14 Oct 2025 03:36:30 -0400
X-MC-Unique: ZM4PHH-hPTKfdgG9KOqIpw-1
X-Mimecast-MFC-AGG-ID: ZM4PHH-hPTKfdgG9KOqIpw_1760427389
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-42558f501adso3757389f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 00:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760427389; x=1761032189;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1vjIWoi/164XsR7x2ZrPuJ9XjGOCw1cRW5cuBw3diZE=;
 b=BPbOUJ3e7OmsJKmwZssOcBQ/Was1JR3eVefL4tw12ZM6uMqVdVKsqn0UqtzbdYIDCf
 0TJOVULzJo5vHO7QNPcMdc8HNU3sd3wQn5wr6TkZL7+bVDm8Znl46RuqJj3Oy004EhcV
 AfKX7Y8XjSdlvOKiCrR2Nns16Rj7W27T0eTVUbpnPC1CXBbjzm5Z+8dtYL8n+dUmqbIS
 8KDOGur8h2QL9pEq+T7vU9ADTy9eby+ozY0gL5V51XnD4cdO4BzOG+2XIHOjQIYFIHzd
 T9HBgYwIVES14kFDGp/Tuu+7MLflZ/9syMkONsRozYRb6WO7hozoki0BTNc98E7PJ7PE
 qKUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU37dbO5JgNOs9tJPtuvsxDG8+aTKFovQPGQx/F4+fOaMUGZHOwU2hChCK4EplyJHl1MaMX61yNtWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOIlkAv2tu7REmv7Xr3Zp7PYegTiLWEnfLoFCWVwsIs1hu1blY
 SVyNVM5hCavn6zDTyORX/S8CzOb1PNhYyrZrBj31sVMKpwk6051bcAHmQoEmISV2CLH+PjnseR2
 +vzl5HBRR89v5cobn4zadzO4l+R6W4RV9IulV4xinIsbk1btsLqGC/dO/c99jCpck5vvhkg==
X-Gm-Gg: ASbGncum7eFq6E7P8z1IniuXdSM+LsEcAhUwKFgYfc8cd6xqJo1AkAQ0E0xST2dLHct
 cG01h2DTFUrEhYmP9MgY7KtVxVFkfnO4sLe75KAIhXvCFPSXEuKttV1U7e0VGYjEllh9j+yFgmt
 NGe7DQZrm3QXEU5rlT+YTb3awLD7mQQzNUamZFSmhQU7bVABeyX2Si6rFujIbraqCIZwgxtu5kt
 AJh3GgNTsZIVNxZ4LQ9jeZ+EtCutvO7q9Ky/Stkt7F4dkWeMP53OYN0JCkMpeDdjDF+S8mc8cYC
 ltHqFmXvUskzvWMQ6GWt1it8DOM/T9tnEPXOBjcGTDYB1l2iGWhbe/OAR+7JiOFuNCAhBsrVEaz
 /HH8l9oPyIvTW4+a3JTh/l78=
X-Received: by 2002:a05:6000:18a6:b0:425:8538:d3f6 with SMTP id
 ffacd0b85a97d-42667177dfcmr14861352f8f.19.1760427388939; 
 Tue, 14 Oct 2025 00:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgR6EeBgIxPIYN/rDHcLYirWOSSsnc3zChf7HMTDBNzJiYe4qrbYdh+J6TafB+G4Nqz7GOTA==
X-Received: by 2002:a05:6000:18a6:b0:425:8538:d3f6 with SMTP id
 ffacd0b85a97d-42667177dfcmr14861334f8f.19.1760427388571; 
 Tue, 14 Oct 2025 00:36:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm21846822f8f.35.2025.10.14.00.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 00:36:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/panic: Fix divide by 0 if the screen width <
 font width
In-Reply-To: <20251009122955.562888-6-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
 <20251009122955.562888-6-jfalempe@redhat.com>
Date: Tue, 14 Oct 2025 09:36:27 +0200
Message-ID: <877bwyq6is.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AD4_hfuuwf9CYmOcTvJskGYy12WNVpqPxBTR3goB76E_1760427389
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

> In the unlikely case that the screen is tiny, and smaller than the
> font width, it leads to a divide by 0:
>
> draw_line_with_wrap()
> chars_per_row = sb->width / font->width = 0
> line_wrap.len = line->len % chars_per_row;
>
> This will trigger a divide by 0
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

