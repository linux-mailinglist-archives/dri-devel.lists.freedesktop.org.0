Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B51A11533
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 00:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3D310E140;
	Tue, 14 Jan 2025 23:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZYGNotEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9970F10E140
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 23:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736896608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0CtPdOl9PYxuDf6s4TI2h/nRLxqQ12SYi0XSfHzGCmE=;
 b=ZYGNotEM8tA8LTb5ip3UwHFZ8Re+IP+NlIZD5YK1aliv0WZYoHVrgCJUNBfJNqbHL3jHlV
 NdkYY3lxpgYfcFEg5oRFOcHaS2f5B41/2aYkNdNQnEalMSIwUntZAbrsu7tjdNlkbC6B6q
 a0OGQClNMc/mJTIgNcqiVYgmdCKXR3M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-ewls6IBlN4OviTDXrgaNEg-1; Tue, 14 Jan 2025 18:16:47 -0500
X-MC-Unique: ewls6IBlN4OviTDXrgaNEg-1
X-Mimecast-MFC-AGG-ID: ewls6IBlN4OviTDXrgaNEg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385dcae001fso2649095f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736896606; x=1737501406;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0CtPdOl9PYxuDf6s4TI2h/nRLxqQ12SYi0XSfHzGCmE=;
 b=S88EaspdKks61LnDGzUs+iB0LCr8CwEs23c9B1/ZyLz/pMc78yAf9SswHMXQOwp4XG
 WYMcAQEtrg7M9v9IQYEXCBaGe6+Jhqj6rmLnJ/2+c4uAiiu+FRTlyuLg9qKWIiE9ylfu
 TMTxpH9omel/9TLbR3aa3S4zMnPGDA5X4Swc2Kt1INDSLr5csL5fThifSOjFmFL0Hkrr
 oz03TLhPbrTKK8qdaxItq6Otk/hhkZ/Q450pa6XwoPKejcMbqfkgLUdaen8B2WsqncR2
 0NMqwcEcaxhS7m8bse1/6PN5XFOWar/8ZWl1hrSoGav1N1OFAc9D09SYvJvuqni92emF
 aVoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNBzQDDGudBo0OPGlbWBrDwEQ56tfJI8KDw47z5z3qXsFP55kxDoXgiMblWgPS5+PciwC4sON+rSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9Dr0unO6C4LROzzZwuzdLdTHnhCB400YI35c/tNUJBGLJdTjx
 vUoD5jmzA6tVoWlZkMvbjmtF7wiXpgDyIHjWd1RoxbvfC055S92mqlw0zT6VkjqJSyj4Wr2s3sy
 TeRMzp/Com+nJPHqk82eFOfg3ijEwcc9K05s6ytDW9LgfW8FrZBnMA4XBp/lf3v3MEA==
X-Gm-Gg: ASbGncsUj9fDHfJ8mG9eNf2KJrIAb0MbOFdHZw6naewMQJgBb3QCoVlxQS7tQ3iK2NR
 5F8yzOh+SbBR5fXvlm08LZfGJjUTYt6g0Kp4FweUVrwJ/FVdkN16YqnJ1ywQXwXmMFqJJL1n+I+
 CPiis2dC3SudY2B/xfgt7hh6Mbbxvtfj23CYN8eoIM/SqdybrEGUvnYIDkKmaqf99lN9olcHayt
 GoTKbFiFZFGoMMXioCeqgbqzHYZLxS33xUB3OqUuJU1uUt8Wr+tyUBIQvwiEZDPBZPOmNi3Vk2z
 iugd1ArvulsdT6FP4+fpisfl9zkB5dcjLZq4t6U=
X-Received: by 2002:a05:6000:1a88:b0:38b:da6a:89f9 with SMTP id
 ffacd0b85a97d-38bda6a8d52mr8267006f8f.29.1736896606166; 
 Tue, 14 Jan 2025 15:16:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGazKlV4IMrwXmxEQwELbtEyZT4yvOIkmHRJAFEvt5XojsMKfwzVF5mTaCNRQK9tXJNN/CpBw==
X-Received: by 2002:a05:6000:1a88:b0:38b:da6a:89f9 with SMTP id
 ffacd0b85a97d-38bda6a8d52mr8266993f8f.29.1736896605849; 
 Tue, 14 Jan 2025 15:16:45 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37d111sm16446372f8f.18.2025.01.14.15.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 15:16:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/ssd130x: fix ssd132x encoding
In-Reply-To: <20250113152752.3369731-3-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
 <20250113152752.3369731-3-jkeeping@inmusicbrands.com>
Date: Wed, 15 Jan 2025 00:16:41 +0100
Message-ID: <87v7uhvvdy.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8akvvuviQMO8s5uHps3401Wz4FZgitZtQpU7ZG6hpXU_1736896606
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

John Keeping <jkeeping@inmusicbrands.com> writes:

> The ssd132x buffer is encoded one pixel per nibble, with two pixels in
> each byte.  When encoding and 8-bit greyscale input, take the top 4-bits

I think the correct phrase is "encoding an 8-bit" ?

> as the value and ensure the two pixels are distinct and do not overwrite
> each other.
>

Fixes: fdd591e00a9c ("drm/ssd130x: Add support for the SSD132x OLED controller family")

> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 2622172228361..64f1123080996 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -880,7 +880,7 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
>  			u8 n1 = buf[i * width + j];
>  			u8 n2 = buf[i * width + j + 1];
>  
> -			data_array[array_idx++] = (n2 << 4) | n1;
> +			data_array[array_idx++] = (n2 & 0xf0) | (n1 >> 4);
>  		}
>  	}

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

