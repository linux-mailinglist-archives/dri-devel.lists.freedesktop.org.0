Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3DB3F7EB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4956E10E1BB;
	Tue,  2 Sep 2025 08:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pcd6bIBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3750F10E1BB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756800867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7sjD/QRd0X/r3/hIK35g/NLILC2+ivFRe7H4S8czaX8=;
 b=Pcd6bIBHiU0MtxZbBLmORgsGQyYdRE0BXGpS42enu0ZXObw3gyQF2+oyh+3mRnkzcbrRa8
 G+klXwDyzJWAd8zcJBRMxaXlh1JWk/bes8YfR43K/5wKK18S6yOapKPeE+V1rzSvhic3WH
 g7YMPkKksuK3OdHEOw/zM0pY/tEVO7k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-oMqyb2xoMB-qsSTdmXbIhQ-1; Tue, 02 Sep 2025 04:14:26 -0400
X-MC-Unique: oMqyb2xoMB-qsSTdmXbIhQ-1
X-Mimecast-MFC-AGG-ID: oMqyb2xoMB-qsSTdmXbIhQ_1756800865
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b920e0c25so6970225e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 01:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756800864; x=1757405664;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7sjD/QRd0X/r3/hIK35g/NLILC2+ivFRe7H4S8czaX8=;
 b=P8r6DzBwJiZRvIfVvl5zufqNyYDkMsBfW7CReax3AKESYQenbA0aSGkottRFDIUgOj
 ym6KTVkEUn8qnQMuAAxQEC/cBTejM+UqpACVuWZU3T9wLyHXX9BS4mQPB2/EdLTeC2jw
 KqfhuQUgtElc1hgDLsRRPRZjMFv25HU5fNoS/IwFylWCmFrO120daw+83wVyHzVVz8ie
 ONk/nyE4lyS25u0LpZjJPRwEFczeWXpRk9TxHUhSuUxHCmsupTufA+ao9TgBjeTwbKbY
 W6t0YsJsAjCDBNlr084n0/gOhWbVApnkBzcj2GsoK7yKf09/s6QRfeQ5B/1lTeLpqq+u
 zj0Q==
X-Gm-Message-State: AOJu0Yz13pcrh3Cns9HI7vx43YPISIufD82qVW4UcnXsjN2b1XJIZC+u
 YYB84orbOMre9P/Skcol01+ESPrCnci1LAVNWzDe4Qy8jwHN2Jsh3WMlw0qRFaPbNev3SlIUv/+
 cSXNH/3ZAHJxfkfk5iW/AC7slCB0qPq1327ISnJV/5/QCkmDfvN/l8KrzuNDjR7+nKlvrOVeWHk
 w/sQ==
X-Gm-Gg: ASbGnctuJd0rnR59QL0EHi6wnLY7agB8rIoszO2LrvVdbDiBNzN/ee5Y0Mk56CdFDlJ
 cqojEZ5kJ5ZltTmpJFrj/PClyWO7vej8D2+r9XkwlMJCavxF3vEknR3YmljiOwCNRr0j5JZHRMk
 u5w3b+QutKkdz1kHfGBenkEadiPEKs43SIRLQJP/fdJ9/CyYIy1EKYTS5wQwSuc/xeLU3rEcG81
 KdVXiwh5WcsuO7gtfvw/QhQD8To9bcxNlJdBaNGTMAJkjJfp35AyJ7A4HpczWu1qNWeDOzR1hOw
 sE+5evUZAI7fTJ0UjiilQY/mTj4XB/EukCV9kOQQhwueWBt76R6A4An0vkD0m37ulg==
X-Received: by 2002:a05:600c:4f0b:b0:459:d821:a45b with SMTP id
 5b1f17b1804b1-45b87bf56e3mr84719855e9.9.1756800864456; 
 Tue, 02 Sep 2025 01:14:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSE9BbGoAU9QWUHXjPbgLFfuEZvjJTrv5W5hVxfxt5ez8sFPvU3aLh4xjk4Nk3CockqCwCUw==
X-Received: by 2002:a05:600c:4f0b:b0:459:d821:a45b with SMTP id
 5b1f17b1804b1-45b87bf56e3mr84719555e9.9.1756800864077; 
 Tue, 02 Sep 2025 01:14:24 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9ab7c7dbsm7829315e9.11.2025.09.02.01.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 01:14:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, louis.chauvet@bootlin.com,
 drawat.floss@gmail.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 mhklinux@outlook.com, simona@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 2/4] drm/vblank: Add CRTC helpers for simple use cases
In-Reply-To: <20250901111241.233875-3-tzimmermann@suse.de>
References: <20250901111241.233875-1-tzimmermann@suse.de>
 <20250901111241.233875-3-tzimmermann@suse.de>
Date: Tue, 02 Sep 2025 10:14:22 +0200
Message-ID: <87frd5fezl.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BdC1Uf8vP6IAl9IzBZru-gCGpNA-SiAAhQBlgnPbGBs_1756800865
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

> Implement atomic_flush, atomic_enable and atomic_disable of struct
> drm_crtc_helper_funcs for vblank handling. Driver with no further
> requirements can use these functions instead of adding their own.
> Also simplifies the use of vblank timers.
>
> v2:
> - fix docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

You could mention (as you do for the first patch) that the helpers' code
have been adopted from vkms. Since the CRTC enable/disable callbacks are
the same and the flush is mostly the same (minus the vkms specific bits
that touches the struct vkms_output).

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

