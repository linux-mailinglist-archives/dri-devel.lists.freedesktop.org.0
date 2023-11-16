Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0647EDE55
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9064A10E5A8;
	Thu, 16 Nov 2023 10:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AE910E5A8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700129821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uAtAjL19nZ/0ZV6KMPfpP7ukF57+qpyYq0AblvSNwYM=;
 b=HWBOXHUB3bjs2y0a47QE5P0KSV61naUm7rO0GvAHQK37sIpAKK7d/P7EECEcFScb2c5UFD
 DGWjBNu7sCuge9/lSTt9QqDYQtHmrNl+aXbyGVVmoBc25Lxz5vb7m4js4eDkfliHrTd20N
 k8S7QCaDGVfA5CTmZ535ILXtUVRBjnE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-HFUMtDfUNrm6ltc5HBhwlw-1; Thu, 16 Nov 2023 05:16:59 -0500
X-MC-Unique: HFUMtDfUNrm6ltc5HBhwlw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4084d08235fso3263735e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 02:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700129818; x=1700734618;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uAtAjL19nZ/0ZV6KMPfpP7ukF57+qpyYq0AblvSNwYM=;
 b=BvMukgQ9UTHU+v9za6vPrX0sn8Z5DAQujeeMk8Kk8o/ZyJcdGcfzYsmviodF2vsuDt
 bp1U+XCnFVzrVyAKQOwAb0JI7JXsjY31BoA+S+XpGn6l47f22oahKvwhhRKhST7Lb6HY
 Kot9rCmI2vlFKild6q2zG6JgrFHgYD4QT3JWGNJvYHmGggN52l/Gmur5ddwmTBTBs6es
 Q7Wel6f2X+TVctZJqTLXG7Wc6ehr23Di2FYjet0lCXQMizVDyIK0bQVy6bCqTkF+G/MA
 amuM235qYBZP9rPwfVm4NRI46e4pazyTx6yiL6A4kxZtH4QJtcPUl5k6wyj4l9vBUc1I
 wZsQ==
X-Gm-Message-State: AOJu0Yx1Hh4CVsdOb6xpgE71ehRLK3gB+IZXKQ9YRxobbYN4oRZdF4C/
 qCOM8qy6Wv3cSzu8qtc7se43am0yJhfIPZXJHED1WeCx6+xPOUdWfnUZIFtas04/7LLXhwx0Pj8
 eEHwBQDbuBCMJOo3lTgjwF3jPzRLh
X-Received: by 2002:a1c:7218:0:b0:40a:463c:1de0 with SMTP id
 n24-20020a1c7218000000b0040a463c1de0mr12700965wmc.34.1700129817999; 
 Thu, 16 Nov 2023 02:16:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwo4cRZ4kMa/b0dHBNMP9yNxr5MEmvXd6XyahEiigcjOkqMWJ95Q4H6fJ41SYwKyCbs0VP4w==
X-Received: by 2002:a1c:7218:0:b0:40a:463c:1de0 with SMTP id
 n24-20020a1c7218000000b0040a463c1de0mr12700946wmc.34.1700129817625; 
 Thu, 16 Nov 2023 02:16:57 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q12-20020a05600000cc00b0032db4e660d9sm13094966wrx.56.2023.11.16.02.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 02:16:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 07/32] auxdisplay/cfag12864bfb: Set FBINFO_VIRTFB flag
In-Reply-To: <20231115102954.7102-8-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-8-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 11:16:56 +0100
Message-ID: <87zfze3svb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The cfag12864bfb driver operates on system memory. Mark the framebuffer
> accordingly. Helpers operating on the framebuffer memory will test for
> the presence of this flag.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> ---
>  drivers/auxdisplay/cfag12864bfb.c | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

