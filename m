Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD86B4066
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 14:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B8310E1FD;
	Fri, 10 Mar 2023 13:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2392410E1FD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678454866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/oDoMqLVnOuZxZgE4flgShP8OtqI4S89KmGHHiU1L20=;
 b=U5l0mq+LS+kJXyglZcZE9j2qkGRQ42c/l9wBEBOtIePyxo9PbWyRVhcDn/EeY2Lim92hcA
 sDtXm4paEZMoLD7uXzftDQ0Ulib8knQvzZxPbpPybUNHv3+unMkSVYoXQ8yzu0kk1nRGoj
 CQQnL4jUF/QPR0vfaovw7cWeuN4t9vQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-je3NF4oROSSjtfWve9hCFA-1; Fri, 10 Mar 2023 08:27:44 -0500
X-MC-Unique: je3NF4oROSSjtfWve9hCFA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so1822604wmk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 05:27:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678454864;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/oDoMqLVnOuZxZgE4flgShP8OtqI4S89KmGHHiU1L20=;
 b=RL+xdv05gzfCMzujS2gJEvwPlwbxrx9O+fSdeMf8M2/8WVHc9gkLQXBXJsIgfEPKkw
 peOFumUOxO3yaD83q75qECotphMNSwAOVaBrtUiclfNQtzX6dJCF/USrHkIRgYe14YBn
 G8B1vj607mv/Dmk2rL0Ed5gdlI3ytCLdujDY8M2AGfxlGMt4MfRba+j5aFmgEt30B72g
 GVxbr+PgtjH76DQdzGbj5tPesMELVQxNYaEFX9erTWcBpU+cxRlNlfXg+iMqfu0mJRLJ
 HlKVCxIE2VcqgkszIL4Qy5ZuUh/30frWBqNWuiCX6t186HK3Llc9ajwgQvM8CoasO8tC
 J65g==
X-Gm-Message-State: AO0yUKWhHapX4+adnQnDph7b64Qijnq3PnlgYNZOZygUbkC9OruNIidK
 hnntrKhu1NyA5D9gdKV/C3o1XAujpJMAHTR9X57CMPsE8EIUHlL5RmidXVIpsRcz86oT1md42hg
 VdMkY3Cy2kmC3yM2qP9anNm7eCk+5
X-Received: by 2002:adf:e5cf:0:b0:2c7:e60:abe8 with SMTP id
 a15-20020adfe5cf000000b002c70e60abe8mr1364276wrn.9.1678454863886; 
 Fri, 10 Mar 2023 05:27:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+/F5VlfIt9oBwbVxs0Diw/+nCO6V0/XYKj4aznLE1oCJqsevDI6s1JsyAlPJIAU5Rh/oqB3A==
X-Received: by 2002:adf:e5cf:0:b0:2c7:e60:abe8 with SMTP id
 a15-20020adfe5cf000000b002c70e60abe8mr1364253wrn.9.1678454863604; 
 Fri, 10 Mar 2023 05:27:43 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h19-20020a05600c351300b003e2058a7109sm3339325wmq.14.2023.03.10.05.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 05:27:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/virtio: Enable fb damage clips property for the
 primary plane
In-Reply-To: <6c556799-6a78-4b67-a4c7-4de0a8f082fa@suse.de>
References: <20230310125943.912514-1-javierm@redhat.com>
 <6c556799-6a78-4b67-a4c7-4de0a8f082fa@suse.de>
Date: Fri, 10 Mar 2023 14:27:42 +0100
Message-ID: <87fsac7n3l.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Enric Balletbo i Serra <eballetb@redhat.com>,
 Bilal Elmoussaoui <belmouss@redhat.com>, Albert Esteve <aesteve@redhat.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Christian Hergert <chergert@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 10.03.23 um 13:59 schrieb Javier Martinez Canillas:
>> Christian Hergert reports that the driver doesn't enable the property and
>> that leads to always doing a full plane update, even when the driver does
>> support damage clipping for the primary plane.
>> 
>> Don't enable it for the cursor plane, because its .atomic_update callback
>> doesn't handle damage clips.
>> 
>> Reported-by: Christian Hergert <chergert@redhat.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>> 
>>   drivers/gpu/drm/virtio/virtgpu_plane.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> index 4c09e313bebc..a2e045f3a000 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_plane.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
>> @@ -390,5 +390,9 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
>
> virtio_gpu_plane_init() should really be two separate functions. But 
> withing the constrains of the current code
>

Agreed, I thought the same. I may post a follow-up patch once this lands.

> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

