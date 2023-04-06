Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA70A6D9633
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 13:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B11910EB73;
	Thu,  6 Apr 2023 11:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189B810EB73
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680781639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e7IWx4hjGZbxBgRuJKLc+v5jOw355RVkzN+v5YQUB+I=;
 b=MkergpM96z/csU3YaRRkz/shT6iqph+erqRwOgu/FFGSNpaYqjQ5YZFp1+WL8cmj8RxXna
 YiwO+VtND3eN5sqMqUDsOYuTs9ydy01EHqSun3hhx+SevNnegH3sQ5rgs6/42HZt1AJVWR
 q1yy6pzuWbCISiYVeTMtcrTzbwpmscY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-4c9hcofcOaWuRRDEuplvDg-1; Thu, 06 Apr 2023 07:47:18 -0400
X-MC-Unique: 4c9hcofcOaWuRRDEuplvDg-1
Received: by mail-wm1-f71.google.com with SMTP id
 l16-20020a05600c4f1000b003ef6ed5f645so15156330wmq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 04:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680781637;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:to:from:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iWwwDUBcTxMQFoR2Rf9eY7h3vDUIUGt5Sqa76Fd1rXQ=;
 b=BulZtNjpNEAhLWOxVkK+8HTlkibz+Pfp+xwY2mVG7SU7ffUqDeJxq/oJCDZkJj5jxF
 OusKvahacDV7XtxUYJC79xPmXIsQCThEqn4s2WBeSdr2u9gj+Oa+0Hwv+/+GvIT3XfQb
 KBHB0pxqxcOT9S63aBZmNuFu8WzgrHoZxm42lQbSmBzbIHbYCDoZvJWahmMn+ecZkzrS
 xgAaNC3qSfIjKkNG/EFAi06f7MxTrGn8Y47WIxsc0qjygckv4dpiBja1/SV7pW2wzqRL
 ogPRth/YPjGkPeCMGJhym8e3J17ZzZ2etZxHzKMxdccJAy030Oq6nNu7OJK0RtNye7XD
 bgaQ==
X-Gm-Message-State: AAQBX9eNZH6v6h2K2TInQ8GG7C3yOlifZCVBgJY5JGeNLlTkETkSiGjy
 gLZB16u4aMaSw+X/SElnXeagKB6fe4OsJRdt94ppXcM0ITp9Io2wOP7ZLYoWsTon1icf94qrhT/
 t1zSG6togzN3FZnqHdf7hVoA5d+qq
X-Received: by 2002:a7b:c384:0:b0:3e9:f15b:935b with SMTP id
 s4-20020a7bc384000000b003e9f15b935bmr6859112wmj.32.1680781637698; 
 Thu, 06 Apr 2023 04:47:17 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z0w2RyUkiZdYYT4EK5OLcz6zUdIliWv60GkRn8oIaecMiGXS9uj7lrRVOK6go6/Yfh3Z6Q3g==
X-Received: by 2002:a7b:c384:0:b0:3e9:f15b:935b with SMTP id
 s4-20020a7bc384000000b003e9f15b935bmr6859102wmj.32.1680781637431; 
 Thu, 06 Apr 2023 04:47:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q31-20020a05600c331f00b003ee610d1ce9sm5006690wmp.34.2023.04.06.04.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 04:47:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: =?utf-8?Q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 linux-kernel@vger.kernel.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Marius Vlad <marius.vlad@collabora.com>,
 David Airlie <airlied@gmail.com>, Haneen Mohammed
 <hamohammed.sa@gmail.com>, Melissa Wen <melissa.srw@gmail.com>, Rodrigo
 Siqueira <rodrigosiqueiramelo@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/vkms: Drop vkms_connector_destroy() wrapper
In-Reply-To: <accdc804-19e7-df59-7dd3-69c83f52405d@igalia.com>
References: <20230406110235.3092055-1-javierm@redhat.com>
 <20230406110235.3092055-2-javierm@redhat.com>
 <ZC6o4l7tzSIwFTKw@phenom.ffwll.local>
 <accdc804-19e7-df59-7dd3-69c83f52405d@igalia.com>
Date: Thu, 06 Apr 2023 13:47:16 +0200
Message-ID: <878rf58c6z.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ma=C3=ADra Canal <mcanal@igalia.com> writes:

Hello Ma=C3=ADra,

> On 4/6/23 08:11, Daniel Vetter wrote:
>> On Thu, Apr 06, 2023 at 01:02:34PM +0200, Javier Martinez Canillas wrote=
:
>>> This helper is just a wrapper that calls drm_connector_cleanup(), there=
's
>>> no need to have another level of indirection.
>>>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>=20
>> On both patches:
>>=20
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>=20
>> Aside, would be a nice cleanup to move vkms output stuff (crtc and
>> connector) over to the drmm_ stuff. The plane already does that.
>
> I sent a patch [1] a while ago moving the CRTC to the drmm_ functions.
> If you could take a look at it, it would be great.
>
> [1] https://lore.kernel.org/dri-devel/20230116205800.1266227-1-mcanal@iga=
lia.com/T/
>

I've now reviewed both patches from your series and they look good to me.

> Best Regards,
> - Ma=C3=ADra Canal
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

