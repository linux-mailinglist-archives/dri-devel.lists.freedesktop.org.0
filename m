Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997546B9B9C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 17:33:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD33610E176;
	Tue, 14 Mar 2023 16:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AF810E866
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678811616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b6jx+Feqw4PpEh8ZADrPDT989RAtGEM/tJSACFWTn+c=;
 b=IGekfNUSMv4z0a7naUxZRq3KUUQclhHki50MRZDmKjTtYeiCV8NTgVXlJwfZrVIcVW04bY
 ky6Gl/OjKOxTfBTVihdiB3PMg0nNTrXFwa7lWL3YdyrwrOYrqekTTMvPYJ/yhmj8Td1SvV
 HpVOAjqTxQviIQhWFnFOLkhBKMYnYNI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-aazYOVbyNaKqIIgEYwPCjg-1; Tue, 14 Mar 2023 12:33:34 -0400
X-MC-Unique: aazYOVbyNaKqIIgEYwPCjg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n27-20020a05600c3b9b00b003e9ca0f4677so5881987wms.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 09:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678811613;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b6jx+Feqw4PpEh8ZADrPDT989RAtGEM/tJSACFWTn+c=;
 b=pWU191i1GBGD12DyPrt7DlcYNNHmOWUCP1aWDIdQRwRUJikb0bYYANqm39y+DXDh5l
 cSdhjrvCOnNw2XVQgOR9qle/VyOHvq2eew0DDjmMaM1t8wf7RKsFYBHyZ2rN32jTn6tC
 RvJ5oAwd614rsBy7xzw2Rnf9Xtk9e1y46TFbZH1rPof1sL57Ky0hC0l7EX1csC81wbaZ
 tn92VDO2w/c7ahbN+EgQesu+ERp5RIlIbOE5Um9bq2MDyQNuuKg7y52kC+kumMwUA9Hg
 P6x85WYVVdrzyCt7+AlxHuEG7EAedap9pIQl31htvk5aE25VMWDSyLBsiOvLDsOjvxgn
 qj4A==
X-Gm-Message-State: AO0yUKWrkajKsXxC5oX/Cw6Hg3ZlOriCta/Uq+LO1omi0R2zci4MUTOs
 qJNOZEcBWq/nVQiDgb7luZxqX3iE+xH2u4VoeNs6dj4XbVLuVS7lcWrts74F4Ir4k4Ee2eqw/l+
 9fzpbVET0IaKbC0QXhiaCMacYP2Tl
X-Received: by 2002:adf:ef90:0:b0:2c5:a38f:ca31 with SMTP id
 d16-20020adfef90000000b002c5a38fca31mr11713956wro.7.1678811613666; 
 Tue, 14 Mar 2023 09:33:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set++uHkeAYXjqua7szeU0r2S7/mqUy9hOKGwihSFQIHr3gcVZoG44qG6bwmWO8OKV4iHu3r1Nw==
X-Received: by 2002:adf:ef90:0:b0:2c5:a38f:ca31 with SMTP id
 d16-20020adfef90000000b002c5a38fca31mr11713939wro.7.1678811613397; 
 Tue, 14 Mar 2023 09:33:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y4-20020a5d6144000000b002c8476dde7asm2474740wrt.114.2023.03.14.09.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:33:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 2/2] efi: sysfb_efi: Add quirk for Lenovo Yoga Book X91F/L
In-Reply-To: <20230314123103.522115-2-hdegoede@redhat.com>
References: <20230314123103.522115-1-hdegoede@redhat.com>
 <20230314123103.522115-2-hdegoede@redhat.com>
Date: Tue, 14 Mar 2023 17:33:32 +0100
Message-ID: <87cz5bl2cj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-efi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hans de Goede <hdegoede@redhat.com> writes:

> Another Lenovo convertable which reports a landscape resolution of
> 1920x1200 with a pitch of (1920 * 4) bytes, while the actual framebuffer
> has a resolution of 1200x1920 with a pitch of (1200 * 4) bytes.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

