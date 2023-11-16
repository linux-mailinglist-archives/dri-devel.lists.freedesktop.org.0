Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20387EE011
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 12:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB4010E276;
	Thu, 16 Nov 2023 11:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE60510E276
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 11:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700135086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RWBdAfvMBvXM91oAEjKzolXCmdPgAd5lIYD+DF4PVIY=;
 b=D5vPp0ZdAOHaGwLoF/T2CQU+JnRXpBIxfjxV3I2SQG60Xl/lvMhAj7XY3FyZkyizPramO7
 EtohkxpnOKpmNXabHqGwh821awMBRM+ucJylRMSNMpJ02zBXtClXIhEDNSwBctX8lx7EYr
 V3o6GxEf0Rre1QzVDPxocMQKaZ7cKKI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-VTYdbdTpOsKiEcxpSew4pw-1; Thu, 16 Nov 2023 06:44:44 -0500
X-MC-Unique: VTYdbdTpOsKiEcxpSew4pw-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-408534c3ec7so3960505e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 03:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700135083; x=1700739883;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RWBdAfvMBvXM91oAEjKzolXCmdPgAd5lIYD+DF4PVIY=;
 b=DXnjjrtbzTCQJ4e5u0MQUwKIqPiDy23zDVz3klODmYTp/3Veh4GAg2Nk1doGgXnrVa
 M+4mSY8e3tpbLS47nP0hhs++LzK3ee6TrhEdo/pn9PgwfpWwygm8Ydwax3XGeerYD3IP
 0Dr487GoMUe4sJuEjvByTu+zHiekFST02AM9mlL1MS9NYuMHjjX3UZf0x6N0YYZ4hl56
 TXRW+jbVqCPvUe/HF7jb+JeUvge7mEgbyDcCY4ABoG92/LpBODhtx/QyXCFoSoJM0Xxy
 OTtH/i9cq5PXqkM1g3ZB2LT0W7idRBDysa7fkB2TpV3+v1XbDOGn5MOefaM2HndvdTnJ
 erWw==
X-Gm-Message-State: AOJu0Yx149ANO1pS1qZ6Pc0Hv6ElJuTd0LOyoDsFzLeCMu5rO+jcqGya
 Mtgrm3Oo51FAIWjFnmN4IjPuD+wKpGP9LZoK9kD3h124OAmmL+eMfHXJiHquTM4DKPSY6JMrv1Q
 wPnFnNlayRSC3pstCIvNFkpof6jMd
X-Received: by 2002:a05:600c:350a:b0:405:359a:c950 with SMTP id
 h10-20020a05600c350a00b00405359ac950mr13330093wmq.19.1700135083499; 
 Thu, 16 Nov 2023 03:44:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAB7R6TX3y7IW/ozo4VrNr9YJdex4yJeaGhFiIclSVMpfZrs4uKUq3O6rvSXhk8OPjiKhQqQ==
X-Received: by 2002:a05:600c:350a:b0:405:359a:c950 with SMTP id
 h10-20020a05600c350a00b00405359ac950mr13330084wmq.19.1700135083231; 
 Thu, 16 Nov 2023 03:44:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y14-20020a05600c2b0e00b0040644e699a0sm3203052wme.45.2023.11.16.03.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 03:44:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Subject: Re: [PATCH 25/32] staging/sm750fb: Declare fb_ops as constant
In-Reply-To: <20231115102954.7102-26-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
 <20231115102954.7102-26-tzimmermann@suse.de>
Date: Thu, 16 Nov 2023 12:44:42 +0100
Message-ID: <87jzqh3ot1.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Split up lynxfb_ops and declare each as constant. The fb_ops
> instance used to be modified while initializing the driver. It is
> now constant and the driver picks the correct instance, depending
> on the settings for acceleration and cursor support.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> ---
>  drivers/staging/sm750fb/sm750.c | 59 +++++++++++++++++++++++++++------
>  1 file changed, 49 insertions(+), 10 deletions(-)
>

Same than patch patch #6, the change is less trivial and would be great if
someone with the hardware can test/review. But the patch looks good to me:

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

