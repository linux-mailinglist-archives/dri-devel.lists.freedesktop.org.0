Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EFE577709
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 17:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689A790F9F;
	Sun, 17 Jul 2022 15:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696B790F9F
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 15:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658071355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ggJJhj6z9FjNRQKXIwP87QT09TGuW+KkdDrUhWIYzLk=;
 b=AVHqpllqIECBk5PPf2Htm8zyHw5kgnp6988UKKNO7Lw8GsVEP0RSwOnJhttVdH97SaCek3
 LokRfviQDj73E9obmcbkqAnvUc1eY/oV/GFp5e2S4X3rHZFqmDZ/KCkrthT2O/HiiSYyZW
 7Wf8jeAPsuldLxJ9Bwh/Say4AoFHxes=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-YaZuNeUINleD9yPl-SiTAw-1; Sun, 17 Jul 2022 11:22:34 -0400
X-MC-Unique: YaZuNeUINleD9yPl-SiTAw-1
Received: by mail-wm1-f72.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so4426231wma.4
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 08:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ggJJhj6z9FjNRQKXIwP87QT09TGuW+KkdDrUhWIYzLk=;
 b=rHS+UGuoZC57wFSnjW9xf+ZNtuWcKlbVNTpSRO5bzoR6Y4bVFzUHhRPg9ottlIIJYE
 OBjrx88sQTg6/QOPnQadhrhnLgGuCpwb36CBl+vcxZ+XKYfiLXjNDbL4KRPJ0ffc0/ki
 P1d8c6mp3LuNzIUc94HvgfVPoXKK5tmzBNCs6c40sqIUaY7iuTaB7BfdbxXWRCT/npRX
 fuGeAPZm11X6BjosSRXVwBcJ64tqWh1Orq3jdUJfCQcq+bdkvEebbeVxNQ1UdEEeVT0p
 eMZ0tayGPwUluOsUFUaJguad/u7ya/QKDTQMuACcAmHcdNJprKHKiheuhx/HxmxN+KTj
 XkXw==
X-Gm-Message-State: AJIora9haofXP5MhLNM6cwT8D5Zg3v6FjIaCx2GAQOlQmPjA10OjOoFk
 d1rgrzHH3tyX4ULhhxDh2+qummVhFurNno8OAAe7t3JDQV+XsmSnH+zTCm1ox88k4B8ktt02fb6
 Owh8LmBIwSwDbs/KNHavIQvLidBbt
X-Received: by 2002:a5d:5703:0:b0:21d:6c55:4986 with SMTP id
 a3-20020a5d5703000000b0021d6c554986mr19925909wrv.455.1658071353101; 
 Sun, 17 Jul 2022 08:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1smtUre4r/DwjHR9JQ9VsNi/GFHo7pF7rhIAkxB9fvtpifcFRKO/tRt9fBOQlTH3Js7fp8JeQ==
X-Received: by 2002:a5d:5703:0:b0:21d:6c55:4986 with SMTP id
 a3-20020a5d5703000000b0021d6c554986mr19925900wrv.455.1658071352925; 
 Sun, 17 Jul 2022 08:22:32 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b3-20020a05600c4e0300b003a2cf1ba9e2sm12510586wmq.6.2022.07.17.08.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jul 2022 08:22:32 -0700 (PDT)
Message-ID: <c3896065-d89c-6a22-a378-c9acc8c99faf@redhat.com>
Date: Sun, 17 Jul 2022 17:22:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 05/11] drm/i810: Move the i810 driver to drm/dri1/
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-6-sam@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220716181750.3874838-6-sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/22 20:17, Sam Ravnborg wrote:
> drm/dri1 is the new home for all the legacy DRI1 drivers.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

