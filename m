Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682EA51D25F
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 09:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B51C10E189;
	Fri,  6 May 2022 07:34:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2EC10E189
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651822473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YVV/F9WHxdXScNEZChl8c5nYVrBEBDkMFqnLnJ3JUR8=;
 b=PhHnJBpZYUF9xOddaPoPXTIbpOw1P2iKlC+7GBZ1ZBpL+sT+eLliUrlZr5wFBTY9HTWIs1
 W4b7rEpfQHCouBqNUcBaBm1qXalfLWoqVGxg6GtEB57rhXim8ICfzlioMYPDVwLH38Gy6p
 pPRpbCFb0ncX0bvMXwvHewO+4N5ODSE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-FZsQBcKDNzu2oaE7cbeZTA-1; Fri, 06 May 2022 03:34:32 -0400
X-MC-Unique: FZsQBcKDNzu2oaE7cbeZTA-1
Received: by mail-wr1-f72.google.com with SMTP id
 v29-20020adfa1dd000000b0020ad932b7c0so2256265wrv.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 00:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YVV/F9WHxdXScNEZChl8c5nYVrBEBDkMFqnLnJ3JUR8=;
 b=oad52pHWqvE1/n+hx8fjb4c9LaFF98SquDC53IcDz/ySsCsSpHKrwv3pzGuVKPdYM5
 BZRF3NzN3kfpmDcJ/uKn3jmVVIi6/w3AjfHbhHIdJTSiT29gWVMBDvOAnWJRYRxmZhq0
 mLZjDPK6gRZU1OCEltc1HYxpSYh1bkaWaOzRtURBgcFtv7Y8SJSr7WdJekHC1itkGa3i
 2KINqKeZFLNxw5Ek1dAxi4dy4DLT8WQghk6dapsf32JJaViXl/duquL+0jLCJm5OfJQ7
 MZ3jtBjsBG6NSJEEhrVzjHvReyDyMCjrGfvo8GdVDzv2RuMkbqyEetsWE5BFlnwH65hO
 ZSdw==
X-Gm-Message-State: AOAM5319umdHKJZUfO/rYWQmYrXZHGYOVxkBAi4HvxS0Tz8Y0aRoPu2P
 +CvnM9iFDI+8+XX+NyWiYsRxix1YOFZ+2II9ci2hwQONWgIQExJhY4Al5iPzPUXn8n0L0ooFS+J
 q6YkUgoHlUWb4e5KyINtPegMtTlf3
X-Received: by 2002:a1c:f312:0:b0:387:8bf:bd3 with SMTP id
 q18-20020a1cf312000000b0038708bf0bd3mr2012823wmq.112.1651822471127; 
 Fri, 06 May 2022 00:34:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3zBi5qrCjqE/FCrjwQZMOB3aA4NN9P3JVqib/Yx6UdP7hc96qqNbtfggn1wFtLl0BTWjHiw==
X-Received: by 2002:a1c:f312:0:b0:387:8bf:bd3 with SMTP id
 q18-20020a1cf312000000b0038708bf0bd3mr2012807wmq.112.1651822470916; 
 Fri, 06 May 2022 00:34:30 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d7-20020a5d4f87000000b0020c5253d8bfsm2923866wru.11.2022.05.06.00.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 00:34:30 -0700 (PDT)
Message-ID: <6936289f-acab-7140-9bb4-73b42db91876@redhat.com>
Date: Fri, 6 May 2022 09:34:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/4] fbdev: Fix use-after-free caused by wrong fb_info
 cleanup in drivers
To: linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220505215947.364694-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/5/22 23:59, Javier Martinez Canillas wrote:
> Hello,
> 
> This series contains patches suggested by Daniel Vetter to fix a use-after-free
> error in the fb_release() function, due a fb_info associated with a fbdev being
> freed too early while a user-space process still has the fbdev dev node opened.
> 
Pushed this to drm-misc (drm-misc-fixes).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

