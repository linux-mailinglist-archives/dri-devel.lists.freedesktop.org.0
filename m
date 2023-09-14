Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FCF7A057B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 15:24:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A89510E09A;
	Thu, 14 Sep 2023 13:24:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CB410E09A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 13:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694697838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uFwzQssh5fc2VAqJw0Fiz1bE1/NvSD7FuRwvnyf3cNo=;
 b=dzFCr32ImeTaMCEstZVo2DqiatwtOUsCEln/y8pp5uHKmTK1U66MwQujN3+Ae7Cj53ySzK
 KIt/+BwIu5TqigaPxKIQq8cH2y9W4cRHWEh7H32kuZhPdW5WSsoK96JaKmcmumqYe94yAm
 IKpVOtMdA7SbFRPM85nok7dde/IoZGQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-bwyoRCnYPgy9xLtK8ERKsw-1; Thu, 14 Sep 2023 09:23:56 -0400
X-MC-Unique: bwyoRCnYPgy9xLtK8ERKsw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31c5c762f97so667090f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 06:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694697834; x=1695302634;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uFwzQssh5fc2VAqJw0Fiz1bE1/NvSD7FuRwvnyf3cNo=;
 b=BFbNqYI+4itsLeTTPNL+bOT3FfZK8NT4nTlfYaO7Noyt2m8bN/DCo94s48ZVlriwbg
 v2RQwwWHoeZvrgvF5Kbs5sF89cSyc4KnoxuLvWJDf5QJVCog60qDTm9cBSm2CIgWMAr0
 Jn860f0U1nW3pSEb/9pa73wOUQLM+6YoTyDtfSAMwoEzbSjmeKj8NHC5Cgjeqo06N2ww
 c4D9wm25Gi5pFbJjgxTWDd3FVIK8S9ylPP3qZ7d/KNsGREHs241QccEgBDp9q1D7vzJe
 cmT2fwXvkJ77/0rC5KIow5A9Di3qI0IDUYvO8rOgDODllAAB7sS7KsDWLp0E5HmTPN11
 gaDw==
X-Gm-Message-State: AOJu0YyvaRZuzyoxrMqYn1Bq3sWHlTG15lWhU8xAxxipumGuS24J7wAk
 7aAhSNfiFgocywqQ5G+GzfCL9gx7FPYFciThLlql0R8tLQKTvLpZ0niz6epZItCUoPqvbtdD9vo
 1M8A0uIfEldiZYDi3xtDsxex0pLcTWK8gsV6x
X-Received: by 2002:adf:a45c:0:b0:31f:d52a:82b4 with SMTP id
 e28-20020adfa45c000000b0031fd52a82b4mr1962682wra.57.1694697834744; 
 Thu, 14 Sep 2023 06:23:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEV6PIj0s5P5W7Ebly6ktcl1cL+Olu/RKBWGxM4016ZL3sE37WLvQXfMuCZC/k6rZ1Jgt5cMw==
X-Received: by 2002:adf:a45c:0:b0:31f:d52a:82b4 with SMTP id
 e28-20020adfa45c000000b0031fd52a82b4mr1962661wra.57.1694697834368; 
 Thu, 14 Sep 2023 06:23:54 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w16-20020adfec50000000b0031ad5470f89sm1755283wrn.18.2023.09.14.06.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 06:23:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
In-Reply-To: <4norb2kxq4uxs3imi3qjxhyxpvnyf5cpl4sg7yyf3ydrykqhfl@cb3w4wstak7r>
References: <20230913052938.1114651-1-javierm@redhat.com>
 <4norb2kxq4uxs3imi3qjxhyxpvnyf5cpl4sg7yyf3ydrykqhfl@cb3w4wstak7r>
Date: Thu, 14 Sep 2023 15:23:53 +0200
Message-ID: <871qf028ie.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> Hi,
>
> On Wed, Sep 13, 2023 at 07:29:25AM +0200, Javier Martinez Canillas wrote:
>>  static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
>>  	.mode_valid = ssd130x_crtc_helper_mode_valid,
>> -	.atomic_check = drm_crtc_helper_atomic_check,
>> +	.atomic_check = ssd130x_crtc_helper_atomic_check,
>>  };
>
> Sorry I didn't catch that sooner, but there's no reason to call that
> function a helper.
>

Yeah, agreed that there's no reason but others drivers already add the
_helper prefix for struct drm_*_helper_funcs callbacks, and I did that
in this driver as well to follow (what appears to be?) a convention.

So I've to that now for the struct drm_crtc_helper_funcs handlers to be
consistent with the rest of the driver, e.g for plane:

static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
};

static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
	.update_plane = drm_atomic_helper_update_plane,
	.disable_plane = drm_atomic_helper_disable_plane,
	.reset = ssd130x_primary_plane_reset,
	.atomic_duplicate_state = ssd130x_primary_plane_duplicate_state,
	.atomic_destroy_state = ssd130x_primary_plane_destroy_state,
	.destroy = drm_plane_cleanup,
};

> With that fixed (and feel free to fix while applying)
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

