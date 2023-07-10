Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F375274DBC0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 18:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637E010E2A7;
	Mon, 10 Jul 2023 16:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6F10E2A7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 16:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689008255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LoMYW18vJXNHTEpLoz7+gRHmG7+n2OVYuQI+lT5sFFc=;
 b=hlBiSGioDz+JgF83fsYqpBgFaHAVSO1fZLXaTgIrymyLlVX02DsHK0hqroW6wEGXvQSrh2
 ZoDoE+PeiySPrIIcMs/r1YsLNEFkbpnIf1b8MvOvqGN0CCBA50g5D5qv6CSHkaxpMDTANV
 50yeUxnlzyXah/mSi5csEqMc1STWax0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-2JtTjTWhOa-O7LFAQJGGjA-1; Mon, 10 Jul 2023 12:57:31 -0400
X-MC-Unique: 2JtTjTWhOa-O7LFAQJGGjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fbe356b8deso29027855e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 09:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689008241; x=1691600241;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LoMYW18vJXNHTEpLoz7+gRHmG7+n2OVYuQI+lT5sFFc=;
 b=T4VQ2s1zSz9tX9qZTDrEczvzvcTucpV4ENA1YLB+PqzZzmfW9hEmkl8YQAF4CbUh66
 LPqdLBNDqfVB012nuvwHK8NEEqfXADKg5++hBzFzPIc1eObAmlw3S8NYPfPMWhOPH4Uh
 UBM9QAIyZKhzTs+b6C8FNtujdvIbY2m0WCk3a0xm77ko8gDBHa18RRisEbS5rJq/VJmw
 Q120XnZGRDQPCx2JQW4+Hba94jLn+uvklGH+HFZaVpbdUt78lLLgaju93UdJ3aJHwlxr
 0Jm/ls6oYSfk4gWa+QxjAGVf3FogPJfP4dbpr/NeFAD+8JsEGrnz/I5ytBNz+Q0Ix6k8
 XZ4w==
X-Gm-Message-State: ABy/qLZHX+byeZ8JQyZFu1a3VZRKLPHsn18gRIO140pq565sZ0jt8aqG
 nHhTS71YRA27JDVHvfGwry25sZH2zh+OzDwX5e7UwWeDtizT8WBhAqfgFMC15qwCM+BUa0I2/GS
 W8301LPZE7O2lJDKF9lyVp1kA69oH
X-Received: by 2002:a7b:cc8c:0:b0:3fb:c9f4:150e with SMTP id
 p12-20020a7bcc8c000000b003fbc9f4150emr12567344wma.14.1689008241247; 
 Mon, 10 Jul 2023 09:57:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFRVXM8MQjD6Rt1Xe3hVa5sE1tXAMtUEmjJjoeOSg1/3Qfhceud+AVl4CyG2DAeeUsngsKBog==
X-Received: by 2002:a7b:cc8c:0:b0:3fb:c9f4:150e with SMTP id
 p12-20020a7bcc8c000000b003fbc9f4150emr12567331wma.14.1689008241005; 
 Mon, 10 Jul 2023 09:57:21 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c5-20020a7bc005000000b003fbdbd0a7desm10780652wmb.27.2023.07.10.09.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 09:57:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH v4 3/5] drm/arm: Make ARM devices menu depend on DRM
In-Reply-To: <ZKRE0T-3Mbht8HZT@e110455-lin.cambridge.arm.com>
References: <20230703230534.997525-1-javierm@redhat.com>
 <20230703230534.997525-4-javierm@redhat.com>
 <ZKRE0T-3Mbht8HZT@e110455-lin.cambridge.arm.com>
Date: Mon, 10 Jul 2023 18:57:19 +0200
Message-ID: <878rbniu1c.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Liviu Dudau <liviu.dudau@arm.com> writes:

Hello Liviu,

> On Tue, Jul 04, 2023 at 01:05:27AM +0200, Javier Martinez Canillas wrote:
>> Otherwise if CONFIG_DRM is disabled, menuconfig will show an empty menu.
>> 
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
>

Thanks! I've pushed this to drm-misc-next since is really a fix that's
independent of the other patches in the set.

> Best regards,
> Liviu
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

