Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E1A21ABA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A132F10E787;
	Wed, 29 Jan 2025 10:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="efCQwwYo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CE210E787
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738145447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qZBAxKVcNOmMz7bK06WcrszPx+JkZyVjuNJwgFNHpPU=;
 b=efCQwwYoXxeHn3shsjZEjmi21NYZl0YOd6g36hNSGYMSIympeSg33hjqXXHLVQk0ttc4b0
 yFCCo8jcxAs6gjUlufGc+mdLup22j7T+Gdi+f8m1gWFJbTOvx6FeEknxgBJ0//Upzw4g3N
 cBDdIhKdkV7WY4CsVCSIaLKJjdB6zSo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-HWv-K-yXOgq1Ifx8xgHnBw-1; Wed, 29 Jan 2025 05:10:45 -0500
X-MC-Unique: HWv-K-yXOgq1Ifx8xgHnBw-1
X-Mimecast-MFC-AGG-ID: HWv-K-yXOgq1Ifx8xgHnBw
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43624b08181so2825445e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 02:10:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738145445; x=1738750245;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZBAxKVcNOmMz7bK06WcrszPx+JkZyVjuNJwgFNHpPU=;
 b=g22iKk7/92MuozWbxccL60vVuoJLixQXJ0cNw/93eM+pURmivtJRVM5oEpDViTBo1R
 Byw2HBbIc45jUPH9u/r82BzR55BOjymim2k4Y/Nu6WHARcwDjJNfa3rEPHRWqZcFjxyP
 Ux78W3R5QvSsb8L4i5jfMrL1cLepT3xTvoWy37YNbNv0eynOXIjsdCcerFvpU6YgTeU0
 unXe9PlACyZa9+VOnPj4dKG9bC/4whlQDyLxhZ/Bs7qmQ1nMDmGCCABNvbbSiRCayuhS
 5pdDgUEl8ZSjiHbZ6boKK9d16BZ7FQIE5xHS1v+3qp40vjLcvHH4yciA0zY3V8ddtS/L
 MPeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW65RF5bCEirnJwypL/ViMhr1cLBrYSPbVy6on1glM2r1f446BFbKe6hLu6iTvAKyn374QxS5Ep8oo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtzwjDaXRrDmoGgPmp5mwQV+eaNMFrVdAvxahMZQqC6FkqlbV9
 y9as+YwP/Ps/PxJfE8e5RfVqz9xBgqyH8WUDy3U0CjwJ3kEjAEcz2QCCsv8unPRlnYCf+/brxfA
 o2YeJlfwOk1vfVQtRUiimgia4GR16lP+TSqgKAW7Qn4QInoGPrhr36OT8YVBr9es5XQ==
X-Gm-Gg: ASbGncuRRVZpNHWhdnIzWiCxjme9XLww3ZYot4bdHg3mzwFm1yfCvuXYHtdP3YPhJPA
 x50JuBNZy/D0qY3CxJ1oVVOakWUtslcCx+QJT994ymX55nV0IrOmj9CxXavfTe7r8bqz0wTcC6u
 J75G+3szVRblng5UER9BN+pLFI7JtGFX9yV6fm/CBIGFEA0wX/T6v24eTE/Ys2SOx+aXaKsIEwL
 ZsXQ4oIAbdXNbmEZpKJ8d3KiYFNiV6k1t8IaSAKCMqJDUHAo8GolspUs6oSQ9sqzvFc/3WkcxqK
 z0XfBjTVEiiEDZK7oJufVKes5pf/DiwswT2x5jk/MuMj
X-Received: by 2002:a05:600c:4f0f:b0:434:fddf:5c06 with SMTP id
 5b1f17b1804b1-438dbe8ca78mr21348595e9.1.1738145444647; 
 Wed, 29 Jan 2025 02:10:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBPzW3m8objqfkQTJJB9YBCasvaC7BkSPKIlC03mwbU1xU7WmoynMSJnXRYI2mTeBYRgl58g==
X-Received: by 2002:a05:600c:4f0f:b0:434:fddf:5c06 with SMTP id
 5b1f17b1804b1-438dbe8ca78mr21348295e9.1.1738145444306; 
 Wed, 29 Jan 2025 02:10:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13139sm17121495e9.3.2025.01.29.02.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 02:10:43 -0800 (PST)
Message-ID: <1972874d-50f7-418e-aeeb-a8b5a1c5f298@redhat.com>
Date: Wed, 29 Jan 2025 11:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/ast: Fix ast_dp connection status
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie
 <airlied@redhat.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20250124141142.2434138-1-jfalempe@redhat.com>
 <93bfabd4-20a8-4d56-898b-943dccb41df2@suse.de>
 <c0446bfe-5a06-47e1-b12a-3fae73365f36@redhat.com>
In-Reply-To: <c0446bfe-5a06-47e1-b12a-3fae73365f36@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NWmNoBZMvICrRYxOkvPZzdPYr57arx_8yBJR_6h8a2c_1738145445
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

On 27/01/2025 13:52, Jocelyn Falempe wrote:
> 
> Thanks, interesting that it doesn't affect all hardwares.
> I got reports from two different vendors about this issue.
> 
> If no other comments, I will push it to drm-misc-next tomorrow (only 
> adding reported-by: and tested-by: tags).
> 

I just pushed it to drm-misc-next.

Thanks

-- 

Jocelyn

