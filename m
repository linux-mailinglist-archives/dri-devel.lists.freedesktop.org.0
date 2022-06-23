Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512925578EF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 13:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348E210F081;
	Thu, 23 Jun 2022 11:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D6410F081
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655984767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hdQi1c24mB3XUDrKywszMP2JKpGIGWN6yx+00DzK72M=;
 b=NFi9WQEVtYBWalKj3oOPj3t7pZVHlfoX1r9essSXxa8r7lvR90BKqddE/2hB7I5h6mPYJT
 t9qP+O+dBK48+/JMhmq7w9pr4Vr1rKnELOCm/NcWmQlXAXECgAd6BwmyTGENzG6HGTx59L
 P/ZWSgR+E06iPtJ9tvx8WYMSnLemFdY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-XhA0rk4SMaiovFyOdQXx1g-1; Thu, 23 Jun 2022 07:46:06 -0400
X-MC-Unique: XhA0rk4SMaiovFyOdQXx1g-1
Received: by mail-wm1-f72.google.com with SMTP id
 t20-20020a1c7714000000b003a032360873so666125wmi.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 04:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdQi1c24mB3XUDrKywszMP2JKpGIGWN6yx+00DzK72M=;
 b=THjvcw9FFVidofrpZlbJNzuQxgiC1xtPfV05ZfTyHbIC/FKy44bYPmXalo2R5jKwZz
 DoreCuuCJERObaYQqODkZ4EkXiIJngz4gt1oBmSCj46QgJYz9FFwBlJKhY+1Bx3eYtXQ
 JKy3d3en9a6z4QQOhC4NnQqE9P8bZW/jfuiF5Ooba7hUJAvNpU6EKlQkhwBrOdTGfV/k
 kbKZ+E2dM8gianuWVn3nA1uNh/5IsCFTJA3wyatcgXVxvad0isqeKEknGlKLa79jv3YC
 p1z8BcPX220xxmPxhmDZchoskyY2fhsmFxGh2XQrlvzYaeuzOKFR9v2nO+hAW6lyR3VR
 EAIQ==
X-Gm-Message-State: AJIora+RGy777CRTmMjz3g1fzHZXwFgsGMYIkJKXXRTX78xnzrMAQdIU
 NCbyQ8y4EtjG/M/U9XJt8gQu9oi45G/M0V5ZdRAoGJmP1KDfWEAERwDeMSzL4vkHQ2hqjKM4s9M
 ZeJ0RWPN7rJnAXRolUHk94SSHf5zE
X-Received: by 2002:a05:600c:354c:b0:39c:7e86:6ff5 with SMTP id
 i12-20020a05600c354c00b0039c7e866ff5mr3743061wmq.145.1655984765078; 
 Thu, 23 Jun 2022 04:46:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tmlypA3wXJ/OMrd3CCC7DB/S0rwBNZ56WvPLaFTf4u20Ij8VSMNCPKoxS1IiNb6nf2qXJPqw==
X-Received: by 2002:a05:600c:354c:b0:39c:7e86:6ff5 with SMTP id
 i12-20020a05600c354c00b0039c7e866ff5mr3743044wmq.145.1655984764878; 
 Thu, 23 Jun 2022 04:46:04 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d6b81000000b0021b9416fa13sm11392839wrx.90.2022.06.23.04.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 04:46:04 -0700 (PDT)
Message-ID: <0767f7c7-13fe-3209-50a7-61c1a46a1149@redhat.com>
Date: Thu, 23 Jun 2022 13:46:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH resend] drm: panel-orientation-quirks: Add quirk for the
 Lenovo Yoga Tablet 2 830
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20220623112710.15693-1-hdegoede@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220623112710.15693-1-hdegoede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Hans,

On 6/23/22 13:27, Hans de Goede wrote:
> The Lenovo Yoga Tablet 2 830F / 830L use a panel which has been mounted
> 90 degrees rotated. Add a quirk for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

