Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C22C6D5DFB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 12:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D98895CA;
	Tue,  4 Apr 2023 10:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1176A10E660
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 10:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680605293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bsBHaVVv5Y3tPEgv/RqSi3oiQGMe5+5UDYih7KrcrZ4=;
 b=TPMSEhAvgWstMn8cBEt39yFomFg0U0RBj8y3KqAXp+83deus6MSJHIDCgzerlFNBUiyVy5
 A8EuSWattnbKN3rwUAwkjCA5o6h9DKLhMjCLX4JpTYn8bXlSK9C3Wq/fyXjHTsQg+uHAPc
 pMA/zaU85itZ/CHAIQj00F0ajqa72ts=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-ydFf0B0YOymGOINXs2291Q-1; Tue, 04 Apr 2023 06:48:12 -0400
X-MC-Unique: ydFf0B0YOymGOINXs2291Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 n3-20020a05600c3b8300b003f048e0e09eso283589wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 03:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680605291;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsBHaVVv5Y3tPEgv/RqSi3oiQGMe5+5UDYih7KrcrZ4=;
 b=lHqMIMLL87P6GJy2IkAKwYo+ko4uZ804zTHpW/C4bH3VysZKzABkK8AVsfKuTq1cbJ
 aZnT0uYsN5KkPxNA/z4wic0M52nMjhGW3Qns56D5igdZwwrzA3fPv39wpFQc7Q/IZ7tk
 Phb4lrD01weMxyQoCIeuTH57ofvnXdpHeB6TJ3cokTdDq31kA+oWaMKa3NfbeZGT9y1P
 rp4XJsQSKD7rECxlS3ZkzXYXxlJ/cZUNU9ktT6NPeCsUrmWAA4V42d4PRJCmPzOKSZks
 Yt2S0DVTdtdzfkOhVk1hJkGLzAo5RPf+/Fk07KvtHTkRF4uB/AN/3DbyQTuy3XMItpt4
 MEmQ==
X-Gm-Message-State: AAQBX9ehb8fO+Del+5m0xEw0aMgyNRjb6iJSmLjXhcmb+HKrwjWmorOx
 t4IDGjyxFIiyWEYCDpGlP4F1Msy/noovHso3LUSlmCAD48cZU8L4331zXp/ZVxrypt/6YIZoqfo
 fNp4GRfEzFahfoJB8NAm9b/Gk8/tvEHr9HdwI
X-Received: by 2002:a05:600c:b53:b0:3ed:9a09:183 with SMTP id
 k19-20020a05600c0b5300b003ed9a090183mr1846967wmr.2.1680605291187; 
 Tue, 04 Apr 2023 03:48:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350bwUveWchAHYla+7cmT+EWiGjSCyodIdvY4/nYmDvD4WO77mwvF1r8B8Ciu+OtkZi1HCc00zw==
X-Received: by 2002:a05:600c:b53:b0:3ed:9a09:183 with SMTP id
 k19-20020a05600c0b5300b003ed9a090183mr1846950wmr.2.1680605290919; 
 Tue, 04 Apr 2023 03:48:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p1-20020a7bcc81000000b003ef5b011b30sm14795462wma.8.2023.04.04.03.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 03:48:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>, Christian Koenig
 <christian.koenig@amd.com>, Helge Deller <deller@gmx.de>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] video/aperture: fix typos
In-Reply-To: <878rf8dksv.fsf@minerva.mail-host-address-is-not-set>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
 <878rf8dksv.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 04 Apr 2023 12:48:09 +0200
Message-ID: <875yabexee.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Sui Jingfeng <suijingfeng@loongson.cn> writes:
>
>>  EFI FB, VESA FB or VGA FB etc are belong to firmware based framebuffer
>>  driver.
>>
>> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
>> ---
>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

