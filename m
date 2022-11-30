Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B730A63CFCD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 08:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B07610E418;
	Wed, 30 Nov 2022 07:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558D910E418
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 07:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669794217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOmAcC8wI0nz44fpW10EKxGTkM7LiYtJGDNMPN/9IRs=;
 b=ev39AjsTzNTGwqvwJom/CbKYhmpAnbLsvxvXnv/djtwnstPTe0ZXul0gWmZMBSzTjmz2P4
 REdJXUrT7rUd8j6eyzJIZ1Lzp3jYcGdesvdX/RZQDwHs10iu8GIIlKB/DDhj9N+k7zUND5
 Tnoaawn1F9E9LRMCdmaYeqZO85H9shI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-176-NXcMjEn3OqmStWenfv-ANQ-1; Wed, 30 Nov 2022 02:43:35 -0500
X-MC-Unique: NXcMjEn3OqmStWenfv-ANQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfb1d1000000b002421ae7fd46so1916597wra.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 23:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LOmAcC8wI0nz44fpW10EKxGTkM7LiYtJGDNMPN/9IRs=;
 b=hIPThOt0Mh9eCnrTVTknwbGEepzq2pM7Ow5TpfFk+LWCHmWbs4hDvXJeHYoKhFphoE
 TlC/T9XvDV0ZKUU6MyBBMoKXkuV2FiDZBv5QgfxS6FOSUIdRePPG8lh37K+Xu1q8xnzO
 WTKEMqH57OC1Ow0XU/vL7WE2ofSYuPmqBQ0nUF1G030d/1ZVPYSkcfsiwpJ08aUlNwcA
 cT3DWcjS/SYY/wLF3SDvnBZObXt5mZk7p4NvKbrOZ6a+ylQYG0UOGamoif5WFIa2xWGR
 coxercAsnVENOtaay/68ZxeCaJDMFzH4zNIgzs+zJ3NinuYeZxzNW9Wwqh7hQd8rSEF5
 9LmA==
X-Gm-Message-State: ANoB5pnV+HZer3RaHS1pkggN4VtipGezqQTgp42ozoAfZzfZljn58EXm
 tIKAsaZYlVhTY0wUTcUxZ2VdQLkqtCqp9kfqzUm5L7WJcdzHW+Q8sMZTeVJOl4GNq/ZpiNHwPhI
 clqJ7CaZYpZ+t45JTd/zLmJ2eFB5u
X-Received: by 2002:adf:ed8e:0:b0:241:d7ce:4395 with SMTP id
 c14-20020adfed8e000000b00241d7ce4395mr28279406wro.553.1669794214434; 
 Tue, 29 Nov 2022 23:43:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4h4a5uzBVHFKDwZiWHdLNm37CAe0+0q1xUrNm+A36Fp+P00Dw8hhkL3eBhgWa0IjS/thAPgA==
X-Received: by 2002:adf:ed8e:0:b0:241:d7ce:4395 with SMTP id
 c14-20020adfed8e000000b00241d7ce4395mr28279400wro.553.1669794214255; 
 Tue, 29 Nov 2022 23:43:34 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t16-20020a5d6a50000000b00241bc209ae0sm711451wrw.32.2022.11.29.23.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Nov 2022 23:43:33 -0800 (PST)
Message-ID: <caf6d4c9-5936-ec50-3f38-90177910c103@redhat.com>
Date: Wed, 30 Nov 2022 08:43:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: panel-orientation-quirks: Add quirk for Lenovo Yoga
 Tab 3 X90F
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20221127181539.104223-1-hdegoede@redhat.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221127181539.104223-1-hdegoede@redhat.com>
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

On 11/27/22 19:15, Hans de Goede wrote:
> The Lenovo Yoga Tab 3 X90F has a portrait 1600x2560 LCD used in
> landscape mode, add a quirk for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

