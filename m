Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D714969CEC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 14:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E684310E52F;
	Tue,  3 Sep 2024 12:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BiVwh+Sc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CE110E532
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zx4hxQtRMdOzrygXNdwQEDskzaynxlUA2aQcUcONdUA=;
 b=BiVwh+ScsdhggeB/RdB3+G3JoPbn3JtVOTgU+nmq/WEHINBE+GGl0LbltdHKarKNLICNKX
 l5rqu8MEwqmQeMzi+OlN6gtKcq71DSZtDzPI6LiaXMIzNBVJZCmUA26Vc1+IMA1/ljyqPg
 9YDudoBlp4DvU+EE97WP9mgydREFqg0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-YuDMa8X1NgqGwaYaHT6Jww-1; Tue, 03 Sep 2024 08:07:02 -0400
X-MC-Unique: YuDMa8X1NgqGwaYaHT6Jww-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2f4062343deso50567131fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365221; x=1725970021;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zx4hxQtRMdOzrygXNdwQEDskzaynxlUA2aQcUcONdUA=;
 b=U1cPKpNT5JLuAgjXqOD0FrUp8jm5lixSxB8J07hUbiF+ZfqN4deJltUUOWAHEN40o3
 xYJcSkO+IOfYzI9B/ga3QT3aTHp7iLWS11blDpCWZWZb1Z+sqClfuanF/9DT18gzQbbt
 eOlmi8luP6myTrcC4Tmecyv0Xqz9sWfy0//fzz5ncuDHdMe7VCkXYWlLGSpjWllL+9Gd
 QDylUzB8nfxZe/ZxKxqFz2TtrRstvi3Kkaj93ak2s3y+OoxlKx1zX2GnUQ1LRe7fszm1
 oJ42NBBK7uqMsSEmIVAYx7bEPZnMcydqwGJ9KZdhEK/BzA+fcq2vacbSzD9gsB6kbwrs
 sNDw==
X-Gm-Message-State: AOJu0YxPF5RZj76rfbrZ4oGimTpk8RdfvOdJNfKurd38WBzO4QYb/lyW
 gCro9a+NfA0NLOwjzO0deeRkUMOTGyn8EThGJ65z+ZpYZN2nfOaUdJK1DaTPNftYOzAHsbfXJG6
 SrxKnGL0LTWN9CcYaoHR2fDW93RhrAdlDHCQtAf25iS+WSS810ZVtuiuVo9fmGAETYg==
X-Received: by 2002:a2e:be07:0:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f62655044fmr76802021fa.7.1725365221301; 
 Tue, 03 Sep 2024 05:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhYL7VU+pPWXFbZvZO3luoy/PZCZxgIoqNkVLPQzNR06jKjtB+IuiohUKE273yPfAVbpvuDQ==
X-Received: by 2002:a2e:be07:0:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f62655044fmr76801781fa.7.1725365220740; 
 Tue, 03 Sep 2024 05:07:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e273e3sm168566335e9.30.2024.09.03.05.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 70/81] drm/qxl: Run DRM default client setup
In-Reply-To: <20240830084456.77630-71-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-71-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:59 +0200
Message-ID: <87seuhc55o.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The qxl driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

