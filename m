Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27902651ED4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4132C10E373;
	Tue, 20 Dec 2022 10:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7D910E373
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671532292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3z4HVJE8IdVpbLnkX88svNGrdQ2F7ptcuaenvAUZfwI=;
 b=VoAn/t666qoIIkab+4A2BoxEYZwPNKYbRfysfg5CeJLmP35KXdCZd0nrJfx0d9/wVABgch
 cRpc/BZzTF/tA+ORG5KZ+nazPeBnRJDK+eD4Bvt4WfJ4ItGoNpZX9AJyi2B+1mwIoMSfB3
 v7BF9Ro623Q6V7uZqOl3CrJ0qTC/aRQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-97VB5wxtNQiE_W0xH1wcMA-1; Tue, 20 Dec 2022 05:31:31 -0500
X-MC-Unique: 97VB5wxtNQiE_W0xH1wcMA-1
Received: by mail-wm1-f69.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso2452446wmk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 02:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3z4HVJE8IdVpbLnkX88svNGrdQ2F7ptcuaenvAUZfwI=;
 b=35Zuny22G8windq/Hdf6Lxl7NhHo8RGD8kgRMxE6MR0Q+ZtqEN5rfCh5lUd943VEq8
 KkWT1CypdzS29HIu2POVMLBJ6rngQ8auDc9OQSi/YKjn29VeNWO+DbZ2totH6sdmFf9Q
 s93h6r0z/wOOKBE5bErMNR0c+2b1v7q+Cks3YrHpN323EVdUrgB5G64ARqbPGxlAz70v
 0dtJWgn55xZlShwOfvzfOqst84XLtcN3frE8XmBhVjk5iNpe9vik8kZtniWnunNezgC/
 7T9ftgWCiP1SJj/bYr4Gg0jcCDYym/drh46x1tM1ux9xIrtAjZIgjyqdsCbnI2uY4Sq6
 L2Yg==
X-Gm-Message-State: ANoB5plGEyh6uA9Xk1zeQXQnHbLFllhj8vZjuKV6mF2m2hR2BxNSwJSm
 BJ7thlO+FMJ5xM/irKqGcldAO6Xm6AgiW3utVEEwya8ThvKe6n0+ooTqe7yKCcm9a/aseaiOkZr
 cfExcMdpjIGcBZ2r/vIQ4VM/iEFAH
X-Received: by 2002:a05:600c:348a:b0:3c6:e63e:89aa with SMTP id
 a10-20020a05600c348a00b003c6e63e89aamr35064607wmq.6.1671532290186; 
 Tue, 20 Dec 2022 02:31:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7fe5BANtzlOS9gP70yosRx26U4s6hllHmBa8KnvDZL0cwqBh3iJA9Qf2rtQUR2lr9HmHOOTQ==
X-Received: by 2002:a05:600c:348a:b0:3c6:e63e:89aa with SMTP id
 a10-20020a05600c348a00b003c6e63e89aamr35064596wmq.6.1671532290027; 
 Tue, 20 Dec 2022 02:31:30 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bt21-20020a056000081500b002421888a011sm12439724wrb.69.2022.12.20.02.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 02:31:29 -0800 (PST)
Message-ID: <e158ee82-ab4e-b665-ca01-d9367604e6d4@redhat.com>
Date: Tue, 20 Dec 2022 11:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/9] drm/format-helper: Add conversion from XRGB8888 to
 ARGB8888
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net
References: <20221213201233.9341-1-tzimmermann@suse.de>
 <20221213201233.9341-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221213201233.9341-4-tzimmermann@suse.de>
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

On 12/13/22 21:12, Thomas Zimmermann wrote:
> Add dedicated helper to convert from XRGB8888 to ARGB8888. Sets
> all alpha bits to make pixels fully opaque.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

