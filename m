Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED776696C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3379210E6CE;
	Fri, 28 Jul 2023 09:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3E810E6CE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0GTcGQClcvNrmkODw/NhrTuC6m7/P69QHPvalFbZeU=;
 b=anLpkI2LUKIE0PLaUj/nVLaSzPbG4bjOUP/0+jeFpk2aFMBuxrxO1SGaw8F81h0EM7yYAp
 3vC6xGZ3qgW2VQqHpx//cbdGObvv3BRaH3wAgH3fKVgGI0y2wf7hvoeVJtIKL45oLNKlzs
 gUeUWhJhKOZE9tVyz1m3eUT1NRAYxLc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-4XgtG8lvO72ippuqkmQsWQ-1; Fri, 28 Jul 2023 05:54:19 -0400
X-MC-Unique: 4XgtG8lvO72ippuqkmQsWQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fa9a282fffso10399385e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 02:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538058; x=1691142858;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0GTcGQClcvNrmkODw/NhrTuC6m7/P69QHPvalFbZeU=;
 b=CSkC2V8T88MuYmdtsnmj53/yfZp+0ZWOfZO0zmWVlETtYj2XBERbywOSEoQVksLhmE
 Lt2zGeXdHc2dKUFHqOT56XBmMQicq834H9bMC4Gz3VeiYptdIIRYzEZRei7Xhlzi8eOQ
 qxqMkM9nb8gwsQOqNxSVROUfhq4WcUlpoSHlc8Af80Wgevupo28VKDAJfEIBIglnHXzH
 U2kxLHX8EIXSw6072gs7EpwdlSkna/XF+66iqoLKTOTGPSEPdYGHO4SzgJOsNwafQ5Zy
 r8tMSTihyuSjOUfuTqolivYvTuHM+lUrLj0/AQMLV0O14NvXXL18b621XkxOU3UUMvsR
 KX0g==
X-Gm-Message-State: ABy/qLZVdMSa2vAVZHh5uFLMA5sEZWZp2xRrI53VdUKrst0wrt1Yyaa4
 PuKk9zGCiZyXTii0EAXRg3eykOWWVYusE0pbIktpZgmfpWH+332Qdt5qBKhTHqdxrHQHrE4Q0Z9
 J/xGTYwOsPoe5qDVi3e44law/nxzh
X-Received: by 2002:a05:600c:ac9:b0:3fa:99d6:47a4 with SMTP id
 c9-20020a05600c0ac900b003fa99d647a4mr1286364wmr.22.1690538057913; 
 Fri, 28 Jul 2023 02:54:17 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGRSbPD12+9qFkX5C461+2ZJKRCXjlQ8V4fPwRzoRVUqQ56eiawC1VqKnyP0ssE1MtTyyZaJg==
X-Received: by 2002:a05:600c:ac9:b0:3fa:99d6:47a4 with SMTP id
 c9-20020a05600c0ac900b003fa99d647a4mr1286356wmr.22.1690538057739; 
 Fri, 28 Jul 2023 02:54:17 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c229300b003fa95890484sm3812623wmf.20.2023.07.28.02.54.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 02:54:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2] drm/gem-fb-helper: Consistenly use drm_dbg_kms()
In-Reply-To: <7d56615fbef2d4d0e5f4c4a23f57269bf8bdb71f.1690535176.git.geert+renesas@glider.be>
References: <7d56615fbef2d4d0e5f4c4a23f57269bf8bdb71f.1690535176.git.geert+renesas@glider.be>
Date: Fri, 28 Jul 2023 11:54:16 +0200
Message-ID: <87mszgtl87.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> All debug messages in drm_gem_framebuffer_helper.c use drm_dbg_kms(),
> except for one, which uses drm_dbg().
> Replace the outlier by drm_dbg_kms() to restore consistency.
>
> Fixes: c91acda3a380bcaf ("drm/gem: Check for valid formats")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

