Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143457804C0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 05:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1D110E04F;
	Fri, 18 Aug 2023 03:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD48D10E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 03:36:11 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-56546b45f30so418433a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 20:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692329771; x=1692934571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3m40FRUJpIDHL/YXHaQLM+AuAcFnZMVMgTICBVKdbro=;
 b=C4jGlUfJkXgxD3An6hmhtU+KPQE93MPQPa1EESR+R+1bT9Dxwv4Sn6rSvGVDoUJduM
 7Hthw0xCVjJ5GzPopB6xwOI41P+/W18OQNkVANAOKoITPr913xgHZcyps5dO0PuJGHHG
 tYetDjTlGqErp2xRLc8ct6/Y6FBtj7r+pEago=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692329771; x=1692934571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3m40FRUJpIDHL/YXHaQLM+AuAcFnZMVMgTICBVKdbro=;
 b=ZTVZwDHHKqHqhrnlkYYm5f3y2xP7D0MbIkYcKtSJxwBl6fhHqoFm1CV3RsjfHltHGx
 eTYqMAfUNyqvEXX5OOUCeJFXNZfWDMZIkG6q3UJrFTqSbPkgGHitXT99FoPZxccef4YC
 /s0+JWe3cw0rix8CHQ9ORBaQi60sv9RJcHPT5f4IKdPDyKQyrZcMxMnU2mq6yCW8gApL
 J4gZChgBQX4C7TOt8WdBNOBLZfWLJkPGPGL6VoGz8P2DMNqqHiLhj8onYXYUvcdu9z1o
 3Lk4dSPJOj7LIeOzL73d7fm+tqUiKuX3D6zlHMQZh57eOKOwevxvsby2d8rZVSpWYBrI
 WuBg==
X-Gm-Message-State: AOJu0Ywea/eroWCC1IUmD+Y/nfb+LLZDlpmv19EI+uCk1V8m7SSLMp8z
 ziGCakPNfEsaVG9WAu9VDe7n/g==
X-Google-Smtp-Source: AGHT+IG5DCHR6i3h9KLfRF1clc8LUV/IbwFQyEkyPLkU6zwgsv75e3f+gu3tO2G3UUs7+4te0SOZIQ==
X-Received: by 2002:a17:903:44c:b0:1bb:ce4a:5893 with SMTP id
 iw12-20020a170903044c00b001bbce4a5893mr1331720plb.30.1692329771277; 
 Thu, 17 Aug 2023 20:36:11 -0700 (PDT)
Received: from datalore.c.googlers.com.com
 (148.175.199.104.bc.googleusercontent.com. [104.199.175.148])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b001b857352285sm521228pll.247.2023.08.17.20.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 20:36:10 -0700 (PDT)
From: Brandon Pollack <brpol@chromium.org>
To: marius.vlad@collabora.com
Subject: Re: [PATCH v2 2/6] drm/vkms: Support multiple DRM objects (crtcs,
 etc.) per VKMS device
Date: Fri, 18 Aug 2023 03:36:05 +0000
Message-ID: <20230818033605.2910699-1-brpol@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <ZNthoImm48DYrBJx@xpredator>
References: <ZNthoImm48DYrBJx@xpredator>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com, mairacanal@riseup.net,
 mripard@kernel.org, tzimmermann@suse.de, jshargo@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for taking the time, everyone! Sorry it took so long, we had some
internal shuffling etc going on and I was building out what we needed these
chagnes for in the first place, this will be the first of a few replies
followed by a new version of the series to be sent out.

First up is a respons to Maria, Marius to follow.

---

Maria,

> -	if (vkms->output.composer_workq)
> -		destroy_workqueue(vkms->output.composer_workq);
> +	for (int i = 0; i < vkms->output.num_crtcs; i++)
> +		destroy_workqueue(vkms->output.crtcs[i].composer_workq);

I don't believe there is any need for a null check.  If you look in the
crtc_init, it is zero'd before returning any errors and that is the only place
it is set.  I don't believe that release can be called by an interrupt/async
(and if it did it would need a mutex/lock anyway).

>
>   static const struct drm_plane_funcs vkms_plane_funcs = {
> -	.update_plane		= drm_atomic_helper_update_plane,
> -	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.reset			= vkms_plane_reset,

Yeah these do seem weirdly formatted on devices that don't treat tabs well.
The default formatter on my editor has a few suggestions for this file, but
they are all optional.  I'll send an extra patch that formats stuff and see
what people think, but ill make it seperate after all this is done. 
For now I reverted this.

>> -	if (IS_ERR(plane))
>> -		return plane;
>> +	if (output->num_planes >= VKMS_MAX_PLANES)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	plane = &output->planes[output->num_planes++];
>> +	ret = drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_funcs,
>> +				       vkms_formats, ARRAY_SIZE(vkms_formats),
>> +				       NULL, type, NULL);
>
>Wouldn't be possible to use drmm_universal_plane_alloc?

Maybe, but the *_init pattern allows these things to be inline in the struct as
they are now, and consistent with the other drm kernel objects in the
vkms_output struct.  There are also a few other places we could use drmm,
surely, but to limit the scope/risk why don't we do that as a followup?

---

Marius,

Yeah those values could safely be completely removed.  Good catch :)
