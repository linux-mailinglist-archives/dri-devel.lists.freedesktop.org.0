Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24877A0AE4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 18:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0BB10E13A;
	Thu, 14 Sep 2023 16:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7BA10E13A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 16:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694709500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V0YL1s0r0RMXaZzIshNhC7a9mBahQAI6QCadmD8ScPA=;
 b=etRjeLOtANzvpGNeFE+nH2p04yYoDoto0fjSaGSSxuCRyEyMkq9bzT65XCcY7eL2zE59iN
 Bex41kAjijlcinaWTk0HG3hxS1dNKL5nmJRNFY4HKl76xg8pKhy9cgl6KcDdH+cULY4Mka
 MMGyV0cN9NETcsTRMp7E5rXLeLFxYxw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-i1epa0ewO8e98dutc19V2w-1; Thu, 14 Sep 2023 12:38:19 -0400
X-MC-Unique: i1epa0ewO8e98dutc19V2w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4011f56165eso9939425e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 09:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694709498; x=1695314298;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V0YL1s0r0RMXaZzIshNhC7a9mBahQAI6QCadmD8ScPA=;
 b=Gu+8fudNhTLI7epDLlnwZqKuNnbOKcp1gWa5jsNzIM9i3N2EfgzBp3fZitrrunLOjI
 vIgVwSq4HDZ9aVKnwvZzjz08m0KF7gXrNMrQJBm3AYkAOc9zYy5Eq3jKnye01hM90Gr+
 y2aSVQSMOBsvXYCcMb5iQHHheiaReI0cTsGeFshCWEaDYyXRgsNHydMaaNY09gTciUhd
 fMUYzityYsh0V755MSCKerFA8PFwl0c7ORkBmXnbm+rZwLLnT3gF7/38njqJlukc6iiS
 4149nyrK52RRS6tlDz7qXnP9HadVVgNYTcyyuhoklD5oVj7vNvOtX9tw8g+2Vr/uG87R
 QaKg==
X-Gm-Message-State: AOJu0YyGGe0XyR1043CjANPUbfx3aJjcJHBPTa4cx+XjcJ8Rq8qZC9Tq
 EtwWuWkx5zllZrA1PKJX2485R++9rykHpXpBmn3nynsoNe7NFaxiXcQ4OjAT8VLWnc16q4tbrta
 n9AIpEQNsJ9hTHls+bnBeYfOiV4uM
X-Received: by 2002:adf:e84f:0:b0:313:e391:e492 with SMTP id
 d15-20020adfe84f000000b00313e391e492mr1880300wrn.17.1694709498617; 
 Thu, 14 Sep 2023 09:38:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBOthBlD0bgX2N8wV+hRehTPip5ujqkbdNT+j7la9Evm0t96iLWUoZqxs1LEG97yVEpxc/lA==
X-Received: by 2002:adf:e84f:0:b0:313:e391:e492 with SMTP id
 d15-20020adfe84f000000b00313e391e492mr1880286wrn.17.1694709498264; 
 Thu, 14 Sep 2023 09:38:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4141000000b0031f300a4c26sm2175932wrq.93.2023.09.14.09.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 09:38:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4] drm/ssd130x: Store the HW buffer in the
 driver-private CRTC state
In-Reply-To: <b4gfkcv3zdtdgcpucufwfmi7225redkxll75gr72zdirqtrrj4@u4kvevdmhtvt>
References: <20230913052938.1114651-1-javierm@redhat.com>
 <4norb2kxq4uxs3imi3qjxhyxpvnyf5cpl4sg7yyf3ydrykqhfl@cb3w4wstak7r>
 <871qf028ie.fsf@minerva.mail-host-address-is-not-set>
 <b4gfkcv3zdtdgcpucufwfmi7225redkxll75gr72zdirqtrrj4@u4kvevdmhtvt>
Date: Thu, 14 Sep 2023 18:38:16 +0200
Message-ID: <8734zg677r.fsf@minerva.mail-host-address-is-not-set>
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

> On Thu, Sep 14, 2023 at 03:23:53PM +0200, Javier Martinez Canillas wrote:
>> Maxime Ripard <mripard@kernel.org> writes:
>> 
>> Hello Maxime,
>> 
>> > Hi,
>> >
>> > On Wed, Sep 13, 2023 at 07:29:25AM +0200, Javier Martinez Canillas wrote:
>> >>  static const struct drm_crtc_helper_funcs ssd130x_crtc_helper_funcs = {
>> >>  	.mode_valid = ssd130x_crtc_helper_mode_valid,
>> >> -	.atomic_check = drm_crtc_helper_atomic_check,
>> >> +	.atomic_check = ssd130x_crtc_helper_atomic_check,
>> >>  };
>> >
>> > Sorry I didn't catch that sooner, but there's no reason to call that
>> > function a helper.
>> >
>> 
>> Yeah, agreed that there's no reason but others drivers already add the
>> _helper prefix for struct drm_*_helper_funcs callbacks, and I did that
>> in this driver as well to follow (what appears to be?) a convention.
>
> From a quick grep, it looks like it's the exception rather than the norm
>

Ah, I guess that was just unlucky when looking at others drivers as
reference when writing this one.

>> So I've to that now for the struct drm_crtc_helper_funcs handlers to be
>> consistent with the rest of the driver, e.g for plane:
>> 
>> static const struct drm_plane_helper_funcs ssd130x_primary_plane_helper_funcs = {
>> 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>> 	.atomic_check = ssd130x_primary_plane_helper_atomic_check,
>> 	.atomic_update = ssd130x_primary_plane_helper_atomic_update,
>> 	.atomic_disable = ssd130x_primary_plane_helper_atomic_disable,
>> };
>> 
>> static const struct drm_plane_funcs ssd130x_primary_plane_funcs = {
>> 	.update_plane = drm_atomic_helper_update_plane,
>> 	.disable_plane = drm_atomic_helper_disable_plane,
>> 	.reset = ssd130x_primary_plane_reset,
>> 	.atomic_duplicate_state = ssd130x_primary_plane_duplicate_state,
>> 	.atomic_destroy_state = ssd130x_primary_plane_destroy_state,
>> 	.destroy = drm_plane_cleanup,
>> };
>
> Ack.
>
> I still believe we should be removing the helper part, those are not
> helpers. But it's not a big deal anyway.
>

Probably it comes down to semantics since one could argue that are helper
functions in the driver that are used as callbacks.

But yes, I agree that if is not the norm, it's better to get rid of those.
I'll post a follow-up patch.

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

