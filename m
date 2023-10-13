Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530417C8877
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 17:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4543F10E17D;
	Fri, 13 Oct 2023 15:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEF710E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697210412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k/AuDIRzij+kWm5ZIXiIa6zntO0S2SYmaTGa19iHgWE=;
 b=G04ry8U8mjWksn/4A8SlJJdRb8mtSRnAZINvRABhaRZIxcVfYa9dUnEgASjXiAI7DJM461
 DFxtajLqJQZKQWkLtrJZWgzOtnZQlF34VQ98AISg8ZURyY3VSVNmIlb0JBI0pc60A2j907
 /eeCVGBzkHvpr+OYVBRWQMXd0VUK57k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-urfAGqAaOEyAyZhf_W5wBw-1; Fri, 13 Oct 2023 11:20:11 -0400
X-MC-Unique: urfAGqAaOEyAyZhf_W5wBw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32d9a31dc55so516128f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 08:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697210410; x=1697815210;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k/AuDIRzij+kWm5ZIXiIa6zntO0S2SYmaTGa19iHgWE=;
 b=eLNMH5/AUgAwbtqNwSSJLoJWjlhr7u3Sg6F4isRGN+MRrplR2wn0VQHfRleEltnBQv
 7itp0n3eTszuawtt111Ce6bLaxhXtp4RngoAGjb1OvrJb4KKQozFPkxqAlcrqr0HiAUO
 N+8GEUjHKTBI1cDqqSLEi6t+kXDErqVADEQiOMuf93LLhOtmyuH8pil7SMbfSQXRCkhn
 LAQteXFQzHctJN3zpna0NCgYqCLwQZ1h61JU9fl+w1xWh9D1vIWO8W3qeiTIMIzkO5kN
 3jTrbUW8CgHtD4iQMI0Rd87DNLgxKqBBMvjJeAes4wQKrlUylVRQSn65KrlWjT6XYphg
 QeZA==
X-Gm-Message-State: AOJu0YwR945CGeoXWhK8tNXyIT6zHtDoId3oAyadtDFhVCCjdZ3Ed3wE
 L7FnjWy/K6+nEHB2QqfoUGKrtT9We1K/Th9zaBeeCUqC39B5+ZRutC9WgMsOvg1XfosBLHzb51r
 STw5EkiHMgaUi4MNzs6kLD/+S6v2V
X-Received: by 2002:a5d:4402:0:b0:32d:8907:2b18 with SMTP id
 z2-20020a5d4402000000b0032d89072b18mr6639644wrq.66.1697210410192; 
 Fri, 13 Oct 2023 08:20:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGEAmpZE3P7fyIbvO0lrP+ZBuqaIET5uU3Qr8HuZR7EYE0qwIBfig1qZvB8TZA6vC0WREO5A==
X-Received: by 2002:a5d:4402:0:b0:32d:8907:2b18 with SMTP id
 z2-20020a5d4402000000b0032d89072b18mr6639624wrq.66.1697210409848; 
 Fri, 13 Oct 2023 08:20:09 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600001c900b0032179c4a46dsm20991487wrx.100.2023.10.13.08.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 08:20:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] drm/ssd130x: Add support for the SSD132x OLED
 controller family
In-Reply-To: <21ed30ec-506d-4a4b-b787-37b054285914@suse.de>
References: <20231012213843.1151060-1-javierm@redhat.com>
 <20231012213843.1151060-5-javierm@redhat.com>
 <6740c736-ba5f-4df2-ba2b-da0902f51f6d@suse.de>
 <87bkd2sh77.fsf@minerva.mail-host-address-is-not-set>
 <21ed30ec-506d-4a4b-b787-37b054285914@suse.de>
Date: Fri, 13 Oct 2023 17:20:08 +0200
Message-ID: <87zg0m35xz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

[...]
 
>> As you mention that these could be follow-up changes, I assume that you
>> agree with the current approach. Should I expect your review / ack for
>> this patch-set?
>
> Please take my ack for this patchset
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Perfect, thanks a lot!

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

