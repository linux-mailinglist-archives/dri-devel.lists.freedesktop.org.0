Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FB78A69B5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 13:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932E112BCB;
	Tue, 16 Apr 2024 11:37:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YttUV1K/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79767112BCB
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713267421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0SRjtUocGfTepjhhgwwKiOTwSYSr6bS/BAY3TsMEaY=;
 b=YttUV1K/PR+le1rajaFbNrBC2GUngtNR5oo873ie/TucFP/q0QU0ELb7loziFqaKB2qYDQ
 Z8sMV7M8TUxamUUrCLzrAtIi3AWL0X8CuHphWot9zA11u/8RDsAfwv7ppvu1C22PVpTjps
 X7OmS1tfFyyoctEJ+kPTikmDL7OqVFU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-9EL7vkS0OSCeUhjlM2mLqA-1; Tue, 16 Apr 2024 07:37:00 -0400
X-MC-Unique: 9EL7vkS0OSCeUhjlM2mLqA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-417c92b77e1so18515775e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 04:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713267419; x=1713872219;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s0SRjtUocGfTepjhhgwwKiOTwSYSr6bS/BAY3TsMEaY=;
 b=bUCIEW9rQp31oOJOmXjrkkdpeuKDU9qYjnB1ToHyCMj+d2MOOkt4ufU7uYkRq2Dw0Y
 eX+Kc0Dpboqd6AN+WMkXoHCuVoD2ZW6W6PJFbTKUGfCDgEAwORuad5smsAehlaLvUZ4C
 2RuKjRfjT6pS6L2LggzqCkxjcO/4Du2tWYL3dTCIPb1JCTJtluCrR12x3UaYwJLQwl11
 c89Q7R19o9t4JnS5GymWMaGPJD41AG5K/ClAjrqqHhbPVndsRB1oJh//WLL4gtZ0HyE4
 bygh3142LedZrH27YE5IDCUECBUK1g8e3n06k/dQI1UrlBcNibWBmK6v4NPx7v1Ca4su
 WVbw==
X-Gm-Message-State: AOJu0YzaTuNbbJE32PMD5HdwT4NWJyAXF3Cg2LIdhcm71rie52y2lFnx
 GMP2AnvuPX7XuyBfQ/kxVe2sqY2J3STowpDWuUG+qyNSt7T32OFGYOLh3US0e95ieJ24bCCYRSI
 lqVuZLeSOBlbza28OhhcPvCtOuBabsHW18NGGxbkWF7EmerkL9PwRdXESRoHKEVqE1A==
X-Received: by 2002:a05:600c:4711:b0:416:3e78:2a1e with SMTP id
 v17-20020a05600c471100b004163e782a1emr9304802wmo.10.1713267418968; 
 Tue, 16 Apr 2024 04:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTn6+1S1Mr4CCs28L9CfGd4/AzteV4U0iy+lT6BiBJMV862Lr8hpayNDeltaD1Msf7/4dW4Q==
X-Received: by 2002:a05:600c:4711:b0:416:3e78:2a1e with SMTP id
 v17-20020a05600c471100b004163e782a1emr9304785wmo.10.1713267418546; 
 Tue, 16 Apr 2024 04:36:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b00418a02674edsm1000967wms.38.2024.04.16.04.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 04:36:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 14/43] drm/tiny/cirrus: Use fbdev-shmem
In-Reply-To: <20240410130557.31572-15-tzimmermann@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-15-tzimmermann@suse.de>
Date: Tue, 16 Apr 2024 13:36:57 +0200
Message-ID: <87frvl7d46.fsf@minerva.mail-host-address-is-not-set>
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

> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

