Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FFD088C4
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C64010E889;
	Fri,  9 Jan 2026 10:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fGgCTRLR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 725A310E889
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767954406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f/w4aAW2SrMolYvW3866mfnxV74MsG7+xai45acXkT4=;
 b=fGgCTRLRg9cTfd8tZks9VyLsGpqHG/S3rrk+rlvFwVQp3FKl9iQocD1S3C7Wk2eTJo77w6
 6fp+Q/EXLBGersMYkfKHji3+3br6+0aFd8Ok5OQKqKNrIFq+wvpWjME5d6vgrGzFu3UsRb
 Jn7YDmkW3nzkwgbC88bWdCaMm57xIkk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-S0iVhu40Oz-EapfEi-HrrQ-1; Fri, 09 Jan 2026 05:26:43 -0500
X-MC-Unique: S0iVhu40Oz-EapfEi-HrrQ-1
X-Mimecast-MFC-AGG-ID: S0iVhu40Oz-EapfEi-HrrQ_1767954402
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-47775585257so28265785e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:26:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767954402; x=1768559202;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f/w4aAW2SrMolYvW3866mfnxV74MsG7+xai45acXkT4=;
 b=bKdvEYTRY9ZQETLqQVH49TZvQAmzGwiAG3XNv0kXE4PDUDRUCiW4y2KM7EefLE80IB
 zWoAjwjwiYqeCbmAWdwdy+Kvu4BFxUro6JFfnEZpX3ym7qsGiFmSebnIqQGSWUljiIqk
 sRxwIvxe4/D7+Ss2p0fULF8VISX3TY7+pvr5dE+XJgK1tvrWciPHDMD2f8TJKdbY81qh
 EF5+p/r1L6k7EQi3nMJmT+cb021S3UZcU/zRDANAne7/JXSUbUQr9pcOnsZ9YlKhjc2E
 +Ky5d8j7A+4mcHQ5E5MWpzE78LdJTzhhHum+SN416ghIynnRjT+bhZpHMjEEeXBR0Xb8
 FdhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAvMT/JYBFHWzNca+6nQgpP2CsnZa4RxBxwPhcSbm9XsLL5F/hW6qEdp5Cl7e28t5zhIn1YYsc+B8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7jCYI6KjgYLFlPPvlbLqmknR6BKmGD1zJqBBTsdDOWvjTNFzO
 bO2WAVtgVv5hpgdJIRuQIbiUFZzdpjvJqZl6yB5oHGeyyBHwnT3THlPRe8Y/AOCAICeja1YsLTJ
 5T7Uc8M74ld+tXSz1w8ym2y5GCgwNhxXXztwtWvNSH6BG3mZ21JTW3iZCGQNuxx117CPMnQ==
X-Gm-Gg: AY/fxX7hh0CjKWWlIQOiz5bEmU+0LCNJWXJbAbqDFrPF5zq+IKW0oBrNa6Ccw/P2/fE
 kghF6lahi8jtVoJ2OQQNpEdUP6jW9DYHYi+7jGkRfH7Nur6ermMalFHS/UNeVwZJ82sL7hHeNip
 9w129eXNbR+ueYgHsyAJuvmbfZIiV/RFo6y0oW1sMBLkhXlzZKlg9SeIqXrBaQaalzzFUoYiCOD
 q5Wo00aaXwZi0XrF7lAh69A8chlpWXP2xO5UbLM3qqiqVWhaplzADgs6IPgQsYf74WYUd/McTU8
 KWPaj0YnnY/dYzQ2+70ttWDgnCTkVlUOBHfFo5gxC2DY4w71ASzxUtY9Ck48AjPkZTm0py4s8yR
 6AzdM7RLTSovbtQ20lRxbdkakrozrTFZOWp09fQVgkiEB+rGDP/wAJCNp5p1qCFl/S9/u
X-Received: by 2002:a05:600c:3143:b0:46e:49fb:4776 with SMTP id
 5b1f17b1804b1-47d84b1a14emr111811125e9.11.1767954401677; 
 Fri, 09 Jan 2026 02:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkCLyTJfwI2U2fven5BTIwjrPF6485bf2UgTi68si039XftNRiJ1TVtPhLUgaGU8nsyouMSA==
X-Received: by 2002:a05:600c:3143:b0:46e:49fb:4776 with SMTP id
 5b1f17b1804b1-47d84b1a14emr111810845e9.11.1767954401283; 
 Fri, 09 Jan 2026 02:26:41 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5fe83bsm22022397f8f.38.2026.01.09.02.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 02:26:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, tzungbi@kernel.org,
 briannorris@chromium.org, jwerner@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/8] firmware: google: Export coreboot driver and device
 interfaces
In-Reply-To: <20260108145058.56943-5-tzimmermann@suse.de>
References: <20260108145058.56943-1-tzimmermann@suse.de>
 <20260108145058.56943-5-tzimmermann@suse.de>
Date: Fri, 09 Jan 2026 11:26:39 +0100
Message-ID: <87ldi7f5eo.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: smIIx4JgO8RyC_fKNmHbubUD5d7aEFIxofCVa44EIps_1767954402
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

> Split coreboot_table.h: move struct coreboot_table_header into
> coreboot_table.h and the rest of the header to include/linux/coreboot.h.
>
> Prepares coreboot for allowing drivers in other subsystems.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I think that patches 2, 3 and 4 have merits on their own and could be
picked by the coreboot folks without the need to wait for discussions
about the other patches to settle.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

