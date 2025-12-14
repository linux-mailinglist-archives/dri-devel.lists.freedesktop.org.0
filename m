Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C6CBBA04
	for <lists+dri-devel@lfdr.de>; Sun, 14 Dec 2025 12:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035A610E47D;
	Sun, 14 Dec 2025 11:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LGnSoLOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7D410E47D
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 11:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765711265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c6r5POLV/N6bZpyEWnqxqiSk+sKxaoM7p1dVcdRuiVo=;
 b=LGnSoLOtRAoLSLtxorS+iEVim/CqUGmJrO8kgVeS41/yEqXcjCFcuxIci6ynM+i1ByT+WX
 kTQMbqNYYl6ne4OZqYG0aTrrD1cM9jHwegxKuR4e+yAz/Yo3qDmIqVWib5ztIXkf+txVEh
 96z5dIfqThqtKJt5+tg866wSh9dVKDc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-xrEq3pL6MqiGhRSbgzUa6g-1; Sun, 14 Dec 2025 06:21:02 -0500
X-MC-Unique: xrEq3pL6MqiGhRSbgzUa6g-1
X-Mimecast-MFC-AGG-ID: xrEq3pL6MqiGhRSbgzUa6g_1765711261
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-430fcf10287so3052f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Dec 2025 03:21:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765711260; x=1766316060;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6r5POLV/N6bZpyEWnqxqiSk+sKxaoM7p1dVcdRuiVo=;
 b=J8mj4JHXvgAyoSjRptYh630JkKlS7vjYVkeXOHeF9S0EcPI1+UPtmp6jRHxBv7RSoy
 2Rr9K3hlfJfyZHngVFBZJtgp2ezEXSRTC+CKXlzozplNszDLSLTf5vjHaHeo+9e6EWOR
 VmV1ygEKh/MnGaVGGlTamXXu92rPg/X5NHSOYYE0AcqlJXPFzTw2u+iyvOlbikN28SAV
 h7yfniTckAiXOaymqSluDEfkEwjB6yAwoF+9CroR6j7t6o4pWaGWM23C2HP14Od79Isf
 TVvOChuV9/JmERB1i0dAArqfedqnSxjpG+6cYz0M0f93HS54FIg7QHaJLD+VOwMSvTuK
 XLsw==
X-Gm-Message-State: AOJu0YxyQT822h61aUjIcM5S4s8fkI5wVT2OcbpFBxfZ/pu5zKuBfx0w
 +j8XN6ybVPschheZw9GCb85WQhxIHQhb+/Ajj/2JWBDCo5wkAxB4R9T103X4qS6KALgSfLWdsta
 jFh9yxx91jrIpgcxkJGbeqQ1a1ZhTN4dFM84pW1pCYhYhShGtl5WOh4dmfULdcX3Jp5xyVw==
X-Gm-Gg: AY/fxX5sGbL1F13ssEo3/AeDGwvPqMGNjZHk2Ed+ThCj8rnBh0r+HH3fAqOYA7HIWM4
 oprK5T7NQ0jAgs5gyang1p+xKRi/Zp13CHzU9DJJxjmfMiZcKYPGmJF8aAeet2UjCTlWiS2DP1X
 npOPGYLwmsxG5hpmkPRWftenAvBSnVQ75kV+psYV4xPVGsfB3kZTu4TC/rnfA/Wn4Gqb9N0Q1ee
 DF+ZvbYUSDpBzUjGu7+Ui5lb94DluQY+FsIxJp+MOPxzRjzC56HA7MO89dzJ8Zg77I166tc4iDK
 n/SUwWmIjmHrlh9afxRRWWIDpVShPkgUNvTY+u9SxacYwA7kO2k1vfpm+VTW5Et0Bgs5dGTzW9u
 06HS2jrjLQLtIF9YomOtmF7Ir8pqn/ppKJylY/sbERYJmq7AD5RK5LN+/NWp9Q06SmcWh
X-Received: by 2002:a05:6000:4285:b0:429:b8e2:1064 with SMTP id
 ffacd0b85a97d-42fb490f769mr8493708f8f.47.1765711260695; 
 Sun, 14 Dec 2025 03:21:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGgPJymfCuemlmm7+ETCvsjMaxYkyAd0iEIZAqqLOH+4TfqAzY5Ma7gY+j/25are3mG2ZQ4Q==
X-Received: by 2002:a05:6000:4285:b0:429:b8e2:1064 with SMTP id
 ffacd0b85a97d-42fb490f769mr8493687f8f.47.1765711260269; 
 Sun, 14 Dec 2025 03:21:00 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-430f280cf05sm8089069f8f.7.2025.12.14.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Dec 2025 03:20:59 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Marcus
 Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH RESEND v2 3/6] drm/sitronix/st7571-i2c: move common
 structures to st7571.h
In-Reply-To: <20251202-st7571-split-v2-3-1e537a09e92f@gmail.com>
References: <20251202-st7571-split-v2-0-1e537a09e92f@gmail.com>
 <20251202-st7571-split-v2-3-1e537a09e92f@gmail.com>
Date: Sun, 14 Dec 2025 12:20:58 +0100
Message-ID: <878qf5l36t.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YlgSwKzmPxsGr3mCEy9fwvwuUNwa3OGhWEL6IUiVWhY_1765711261
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

> Move all structures that will be common for all interfaces (SPI/I2C) to
> a separate header file.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

