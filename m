Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E448A6CEDE
	for <lists+dri-devel@lfdr.de>; Sun, 23 Mar 2025 11:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338610E0A4;
	Sun, 23 Mar 2025 10:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bYbQsyuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0BC10E0A4
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 10:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742726869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UIgEYgxSYsjgdXRrFtC9BdjCRFvcEtF6KCw7k9R1lLQ=;
 b=bYbQsyuTyTWuq7XZ64XuOHBLd7KAvYSZsoTWjR754AQHrFRPhqVuh/Dv0OlpmueXEfCKpg
 qHs8lFSbLjQbwouUz/46E9UwZOc1HTurSAt52s/mYyWxhFgMevzRaPYIbtsRAoZC4Malj7
 wFaSFn9ZgUmK7Zz9IvKiahzI1/JtEYU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-TYvdapcWMOqTSKIx-S7IFw-1; Sun, 23 Mar 2025 06:47:45 -0400
X-MC-Unique: TYvdapcWMOqTSKIx-S7IFw-1
X-Mimecast-MFC-AGG-ID: TYvdapcWMOqTSKIx-S7IFw_1742726865
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3912fe32b08so1791960f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Mar 2025 03:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742726864; x=1743331664;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UIgEYgxSYsjgdXRrFtC9BdjCRFvcEtF6KCw7k9R1lLQ=;
 b=tOnBf6X/wgVr84QiQ0FQLLW6gwolqaSjNLZgQBXzm9xacKZkHmCJPtUQqFV8Xah3wS
 jjT03pQsFMVdYkwnV/VPLymlaYGQQ5A/uQyJJMqvYSQ5eMopsCYHisq6G1L9tTNu5m9g
 b7iQBYRn00XHjucjFvMmET73MSXtICLNowbunnSFW3DIVBt1jXZ83otrbZPje/BbMVWs
 Wqu5Jj5vmtDq6tQLnV38ssm+aMYC54Tt59ns7xwUyb52XorTDTblWZnt2YriC0YJY2Sf
 Q8J11KRmsu3l1an32qtQySN/VcLcRkQchvw+s2yhjnpWCmYt1g+NzpmWjRqQYSQ0n5Wx
 eijw==
X-Gm-Message-State: AOJu0YwCdBQu9qwpcfvd+QBKE1OnMyiiMunlKWkxOYgRwTNEaVIilfHi
 3wwjfsesAK4G+uI8ALwgQ/sUIarVpz4o4fqh2q02FHLIV0zDr8xm7K+daU8P6dOPLQmEyYbeXAM
 VQdBQPG/+ajwVivbdaXSq6BRtDb9VwMVjIj3I2VQUHzemo1lqBmH/UoewD4hk3POu1Q==
X-Gm-Gg: ASbGncsNRYTpxnjEdCKvYFd2hfr7U5W1/CcVKj54TsDy4vszRrZGspobVb7F7n6WMiR
 CMl9uLQOEltipqkZ8IAD8Kp1HXLtFhPdycj56zjVKwZxecXCwGxN+AwD8GtwixuuQ1nhiVAfKtn
 Y8K9WXvuhdKiIqc3U54knoGkVXK31bsVDp5RMH8uEOC5KezEVphbpUnkaO5ZOdnW+l0ZQjIMf+8
 KpyeOmiIbO+YTPkdNnLr+nQ3eFmltmVfCM7F5HZeAip8KUgfoSeRjOD/x5fl/++dLHT+g0F6tLR
 JjAGGfZ9ak6ftpUNZq03UA2YWMsj/FjGv6qaAkvVoOtJAilJBkRMB5bokge+HIA1coi1wRP9Yg=
 =
X-Received: by 2002:a05:6000:42c2:b0:391:4052:a232 with SMTP id
 ffacd0b85a97d-3997f9424ffmr5731305f8f.55.1742726864661; 
 Sun, 23 Mar 2025 03:47:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeoZ8QbQkQLnWDUg9boviI45/3kkumvRKCjsZpFkprJzVOGTDKPELKDzAKOs1EmGSUeq1oZQ==
X-Received: by 2002:a05:6000:42c2:b0:391:4052:a232 with SMTP id
 ffacd0b85a97d-3997f9424ffmr5731295f8f.55.1742726864239; 
 Sun, 23 Mar 2025 03:47:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9efcb1sm7577673f8f.94.2025.03.23.03.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Mar 2025 03:47:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 07/18] drm/sysfb: Merge mode-config functions
In-Reply-To: <20250319083021.6472-8-tzimmermann@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-8-tzimmermann@suse.de>
Date: Sun, 23 Mar 2025 11:47:42 +0100
Message-ID: <87o6xsdnw1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 70vjECWGX4Uv1QIA1jLDRAS-aVWezGe9p9oE4nVat8U_1742726865
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

> Provide initializer to set struct drm_mode_config_funcs. Convert
> ofdrm and simpledrm.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

