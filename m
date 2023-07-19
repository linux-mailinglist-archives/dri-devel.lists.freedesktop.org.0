Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA941759F4C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3173F10E508;
	Wed, 19 Jul 2023 20:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18D110E508
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689797230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i4g3C6nzU3Agvgh/c0t6ZuWBnKAptGwQm3c5SNMdT5Q=;
 b=UOzucYoxwb456lbMd066+3iG06FYQO0ovpgdl5tZpGC8trwT/N5St4ew04N9Ruh154rqTW
 xGbGClIADcXaFW7JQhKITDz5U+LSD9J8j4e68dXFXWzXNGuaJ2TrTbHsGbYbH2zJl9fGNe
 ooAxkfgSzNy5XHdo/d+bpFyD6UtvuZg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-99f4sVEUM5STUL4T1r_NXw-1; Wed, 19 Jul 2023 16:07:09 -0400
X-MC-Unique: 99f4sVEUM5STUL4T1r_NXw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3143ac4a562so13761f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689797228; x=1690402028;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i4g3C6nzU3Agvgh/c0t6ZuWBnKAptGwQm3c5SNMdT5Q=;
 b=Q9uLF9XmubYBYckX07ZIsdNQ6Ax/3PONkghPIABqslqB41Er2QLWbrgZNUgojnpKeR
 xI9kg1s89Jixz8aJjKBrdlTtH/gh0Ok0+F3GG2EOTFJcK4NtLMa9gnIzcXWAU0tb21UW
 MoUdhEi2oELJJeWH+tntmacykK3f+bFFyqO07BATacHwnaJDgNwvWi/kfIJGzAbY/v/Y
 skzKXIAQn+/MeZXVMe56DxBGLKDnR8SHPyBOL9tbKCe0YwXfqVeChwCNIQWUHm6SRuCB
 hmbJ7aC7U821CXy08mad8PvpB2Xn11sO7OyGUb3hSe/haLHvM8+d8RTDRPCVYnUbd0S+
 kbWQ==
X-Gm-Message-State: ABy/qLb0rPW7aTkZjrgnA6MC2WXQ0wbaF2u+jkA2H1dulGNDGjOgWWh1
 qdw9u/Aebb+VSu/hS6vJ1McLhqFea4B+M7fzYMJdDvh2Qeob1Qd1Z6FzJN0pdigvJqgJXJwOG9l
 MzK2y/dqgxt3MNb5lTtibZqyTXM5l
X-Received: by 2002:a5d:4143:0:b0:314:133a:f04 with SMTP id
 c3-20020a5d4143000000b00314133a0f04mr694225wrq.49.1689797228308; 
 Wed, 19 Jul 2023 13:07:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGGpjl4pcXBRRgdFlcvKhEnkSCPwpm/o3Je+LPH5KIPIVm/X3+J0u4SMJq0uEAL2pKg5oBTQQ==
X-Received: by 2002:a5d:4143:0:b0:314:133a:f04 with SMTP id
 c3-20020a5d4143000000b00314133a0f04mr694210wrq.49.1689797228021; 
 Wed, 19 Jul 2023 13:07:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r1-20020adfdc81000000b0031412b685d2sm6119194wrj.32.2023.07.19.13.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 13:07:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 10/11] drm/vc4: tests: Switch to atomic state allocation
 helper
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-10-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-10-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 22:07:06 +0200
Message-ID: <877cqvhdhx.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> Now that we have a helper that takes care of an atomic state allocation
> and cleanup, we can migrate to it to simplify our tests.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

