Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6F5755EE3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91A610E089;
	Mon, 17 Jul 2023 09:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41BD10E089
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689584418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Itt90Gux0jb2OT7jpr0Odfrrivk8UdcQyUry5wTCds4=;
 b=e0JX2FlmUqX/CXUbIyF5rlz0SdHOfFlsENQrLsdZe/2GnF4631f9izgb4dpuN/7XW/oteY
 YDCfQsngFVHnrkSuMZ1DU/4oBSu0S4XPqRU06dh6mR6B4W0Askh2M/gSxxmBeAUZgbCFWN
 yRjc0oWureNKrBzRVHKfaMm4wsmk/b4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-iPIu-S7qOay2HBDYDwyv6A-1; Mon, 17 Jul 2023 05:00:16 -0400
X-MC-Unique: iPIu-S7qOay2HBDYDwyv6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbb0fdd060so26470525e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689584415; x=1692176415;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Itt90Gux0jb2OT7jpr0Odfrrivk8UdcQyUry5wTCds4=;
 b=mGYCc+GaR1Yo/wfLua5ZSeaNfoLaOpe7z5rRUAE4fmnDjzjdYQoue2brVtXFFgyFFR
 AFRk0QCQwg8MZ+J+PZjbI/x0NDepVsynbDXFZ3MgxKRUlAiAVnnG2xq86Pa/lVDkAbx2
 Fn9RdKlxIhTy92ogZqQL3NPSWeRQ35Knl+X0y8bYYToY31tgnK9o2DCsYXCij71s6v8D
 OkIxc1Tp8nAt3IX1fbFVdIABl8s6T9O16Ev0JpUlG4Zxd5C6uBBm339SVw9iQtqgBgUq
 a0n9biu0oiWdoNwjH74FYN5Dw+WYRkELISoyyfO5ETCybF3vTWymI6LGMSqht3Z7mK5U
 uxig==
X-Gm-Message-State: ABy/qLZ98LbTeg0v9vXhDUFcfuwIJq8/ZIZ1ZKRk4wBSJbJnY4KIfZjs
 4A+o9HvWcvsJ5uiOf7/ajQxrIDsZyvm5zTyveulC9I73wFMV24QFYYRMhdMWidx2ljaD7DQuykE
 /hd3mhgrBYSG5tlTS8Mh3qrZOw6+jNF9/0gd7
X-Received: by 2002:a1c:6a14:0:b0:3fc:186:284d with SMTP id
 f20-20020a1c6a14000000b003fc0186284dmr9864513wmc.18.1689584415474; 
 Mon, 17 Jul 2023 02:00:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGDHkpkyeESX7xooqF0K6wFlMJilZYbngZvoyjjN8XTXh/IMVtAl4W74et1UyCmFZIWMbN/Bg==
X-Received: by 2002:a1c:6a14:0:b0:3fc:186:284d with SMTP id
 f20-20020a1c6a14000000b003fc0186284dmr9864495wmc.18.1689584415132; 
 Mon, 17 Jul 2023 02:00:15 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f17-20020a7bcd11000000b003fc02218d6csm7415959wmj.25.2023.07.17.02.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 02:00:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
In-Reply-To: <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
References: <20230713163213.1028952-1-javierm@redhat.com>
 <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
Date: Mon, 17 Jul 2023 11:00:13 +0200
Message-ID: <87r0p6kj4y.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi
>
> Am 13.07.23 um 18:32 schrieb Javier Martinez Canillas:

[...]

>>   
>> +static const struct drm_mode_config_helper_funcs ssd130x_mode_config_helpers = {
>> +	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>> +};
>> +
>
> After some discussion on IRC, I'd suggest to allocate the buffer 
> somewhere within probe. So it will always be there when the plane code runs.
>

Yes, that's also what Geert suggested so I'll just do that. And also make
it a dev managed resource.

> A full fix would be to allocate the buffer memory as part of the plane 
> state and/or the plane's atomic_check. That's a bit more complicated if 
> you want to shared the buffer memory across plane updates.
>

I don't think is worth the complexity, allocating it on probe and released
when the device is unbound from the driver should be enough as Geert said.

> Best regards
> Thomas
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

