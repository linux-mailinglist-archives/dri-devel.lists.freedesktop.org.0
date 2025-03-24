Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A7A6D69F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 09:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727C89E01;
	Mon, 24 Mar 2025 08:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g67R6w8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DD289E01
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 08:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742806423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7GSbwAImhmgHARl5Xx4iBsxQhARehH+LTZhe4CWDS4=;
 b=g67R6w8ujZ02YWA8RyNVKlHDR855VqU1L+9hfY1wMCzbucclruAfZ8bJ8CKj75JT8ucdBC
 npyJKTX08rbkSam3InoWZ2dysaMw/G0ucKVSv2zhSy2dJEh6zbLFTYwIu1S61YR1sP/Co1
 zQehj5FbZmwlE8KU8HCgHOECQukI8y0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-H_Or2bMFNN-agEeUsrWtDg-1; Mon, 24 Mar 2025 04:53:41 -0400
X-MC-Unique: H_Or2bMFNN-agEeUsrWtDg-1
X-Mimecast-MFC-AGG-ID: H_Or2bMFNN-agEeUsrWtDg_1742806421
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-391492acb59so2503085f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 01:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742806420; x=1743411220;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xTeoUT8jPppHHYJ/KTdOB+yaI3fpQK/TI2KlKT0+r4Q=;
 b=TvowqSlVJv8kv6MmE+Qm19tGIGv0bnt7/8r0F07TIe4wL3dRwbhw0vIoIutxmvHezB
 6zikSJcnYP4dIlG+HCprXbW69P3iUXs4v+ufHnXNAVmGBUD+K0toi7sDG3n+fmEM1jjg
 Et6hvOEMxVB6ZJ03a5PVyuloDAJ3pMdor18pHgBjmyeTBSyovD9W7ZEUDM5SSC2Wngjo
 0ausNS6FNqerH1ukvw+gtDEQSEBmQXKNutoPGCqLpqVa5TfP565hxu5ycIV7/lVmy7YR
 12lI1h1iNqPii7jgV/cPuAmaZRza2+FCs+QPNrdHNzmZaLNIqwEOPfq8z22AidsiFnsR
 y7CQ==
X-Gm-Message-State: AOJu0Yx62GPTczMU4h0VrjcUOzyBP6vxZTJSbffnd41+hfYIFVkGAkuP
 5XBzOV6odHMrYsNrXk7Qz1dvrntZ9aIqE9djWh6RODkHYzEG49ddn0fijaqdCh8JgRa6lvA0DiA
 DVjkCXTahvZL7a6/SQVBk8XFcp3cjcjOji6pU2liSFyTNE6mQTn49CSQZLOTM5APOCQ==
X-Gm-Gg: ASbGncvCsNgraV8qCeMwSbrA+uLcVSJrd0ur5mFeCsA3QeHT3duxj74uqybJSfZPjqB
 gmuTf6Z07uwugsko0KRmmdVBJ6yx1BjL55VG0vaVB+4fFiw0K7moOVezMe2ucRbKGJe5uPGXdg/
 WsC2chFDwrt5zF5QSHNf14/n5D/b2ZWfDONxQSZ4Ek8+AsJsMqPaxNVUzw97dlVPDM1JeG5qQA2
 dhZEY3KQMOswQxV1YJLtpaEBkBUsuhG9ovKruGWGkKB8nueTkpG2gCdXxMwyRaXEk/PqKsqG9dN
 UZpyKK2TJJpEkReOPyaaNjVXATpKLFxW6LKHQz90wubZZJxB2c6TbhBztD8JKt/CGERilKbl9w=
 =
X-Received: by 2002:a05:6000:1a8b:b0:390:f358:85db with SMTP id
 ffacd0b85a97d-3997f9116bbmr9440444f8f.30.1742806420622; 
 Mon, 24 Mar 2025 01:53:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOr5t9VGsQ2Zo8IOFQx7bAmRpdkAFlMH87BVbzFubJi6z7+460pNDAy5iMZflq9j/uChoLnQ==
X-Received: by 2002:a05:6000:1a8b:b0:390:f358:85db with SMTP id
 ffacd0b85a97d-3997f9116bbmr9440422f8f.30.1742806420196; 
 Mon, 24 Mar 2025 01:53:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b3ebcsm10179651f8f.47.2025.03.24.01.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 01:53:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 08/18] drm/sysfb: Merge connector functions
In-Reply-To: <c25ba88e-1ef9-4d7e-a055-5f7302610179@suse.de>
References: <20250319083021.6472-1-tzimmermann@suse.de>
 <20250319083021.6472-9-tzimmermann@suse.de>
 <87ldswdnf6.fsf@minerva.mail-host-address-is-not-set>
 <c25ba88e-1ef9-4d7e-a055-5f7302610179@suse.de>
Date: Mon, 24 Mar 2025 09:53:38 +0100
Message-ID: <87o6xqzu5p.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CxVCFN8fGnSJRQ0EWkXayC_DqI6CcwCFmK9T3el7nMo_1742806421
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 23.03.25 um 11:57 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>
>>> Merge the connector functions of ofdrm and simpledrm. Replace the
>>> code in each driver with the shared helpers. Set up callbacks with
>>> initializer macros.
>>>
>>> No effective code changes. The sysfb connector only returns the
>>> preconfigured display mode.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>> ...
>>
>>> +#define DRM_SYSFB_CONNECTOR_FUNCS \
>>> +=09.reset =3D drm_atomic_helper_connector_reset, \
>>> +=09.fill_modes =3D drm_helper_probe_single_connector_modes, \
>>> +=09.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_s=
tate, \
>>> +=09.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state
>>> +
>>>   /*
>> ...
>>
>>>   static const struct drm_connector_funcs ofdrm_connector_funcs =3D {
>>> -=09.reset =3D drm_atomic_helper_connector_reset,
>>> -=09.fill_modes =3D drm_helper_probe_single_connector_modes,
>>> +=09DRM_SYSFB_CONNECTOR_FUNCS,
>>>   =09.destroy =3D drm_connector_cleanup,
>> Why not include the .destroy callback in DRM_SYSFB_CONNECTOR_FUNCS ?
>
> These sysfb helpers provide functionality to operate on the output=20
> (damage handling, etc).
>
> The destroy callback depends on the way the mode-setting pipeline is=20
> organized. The driver controls this. It might wants to allocated the=20
> connector separately or use a container structure (e.g., struct=20
> ofdrm_connector) that needs separate cleanup. Hence the driver has to=20
> control the=C2=A0 destroy callback. That argument goes for all the other=
=20
> elements of the pipeline.
>

Thanks for the explanation. Makes sense.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

