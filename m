Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C214B7E89E7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B0710E25A;
	Sat, 11 Nov 2023 08:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958F10E25A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699692388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qe4AnVqkbysPosOtrXNw4qx0DGe8XSJWaRQMRFv81Ro=;
 b=Nv9v6nM3FtwLptwKraQeZ2TMXpN/vm60K/Jdq5b3A7r7kmHJEZzBacGJQwscOS1WrbYflf
 dHli+fBsIKGrXX1JgWlUy1eGAPx0qOyua9nAAxpH3jCeRtdrsIJ89H1ZL0dK+9b4JAuKX7
 c+dlhNHX/oiVGBeoiKmKafA3eMsRgLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-j4NKKy0nNnKiZfpHZi3lmA-1; Sat, 11 Nov 2023 03:46:25 -0500
X-MC-Unique: j4NKKy0nNnKiZfpHZi3lmA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4094d1e52daso18954795e9.2
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 00:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699692384; x=1700297184;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qe4AnVqkbysPosOtrXNw4qx0DGe8XSJWaRQMRFv81Ro=;
 b=sE+Okj75f8/ynRFP9Kppkol4pwG/u23SivfEJMmUlEl4sE5GIfvcOhtBqO0QOxY3ty
 /7dI4qbZuJ/IaQgkUj1rGpbGMyNDjp1/9UviYdu3nLIprdKGi71dXGE5Zdb1Kbu7+ZMJ
 Xbb5X4bAbkCQ+o3VNw+1PEzK6TfwBtPFomRKdpLF5dzyYuxfuCsJr9FNIqvWqkvPLIvt
 sDyeej7WaKaDUjxpHlCWikhbznyoNlZXdVnqxtZcoCpiSMNDJoLBL58UGvvu740ygVUZ
 1Mj3PDdl00dMELdqbYsklIJ3EVzVNvyaVd4jO8Vbf/7VGwVsm3nPUkYF7wlxxodKbI8I
 jRaw==
X-Gm-Message-State: AOJu0Yy5rICh0jhFwA6amcAK9JN1+bymssiRYOrT6GZm60OZOm3TEihj
 hySxuu11EcDmAnVVfquhtYVtnG59Ziy6YJ9FxDb+ggVB/lcen+Ypu+7YlGIiUa4Ruw8F0mgBNxb
 QlEkQ/xQsIWdKUFTlDzgufbwkv2//
X-Received: by 2002:a05:600c:5129:b0:409:325:e499 with SMTP id
 o41-20020a05600c512900b004090325e499mr1236500wms.32.1699692384458; 
 Sat, 11 Nov 2023 00:46:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQWv9ONWQ/9v4pE27vYGxbfOnqlBRHwhWNrhiZeopvK2vqA9fqnRiJMVbSHt1YK5D+0gIa0A==
X-Received: by 2002:a05:600c:5129:b0:409:325:e499 with SMTP id
 o41-20020a05600c512900b004090325e499mr1236487wms.32.1699692384065; 
 Sat, 11 Nov 2023 00:46:24 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 iv10-20020a05600c548a00b0040535648639sm1541957wmb.36.2023.11.11.00.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 00:46:23 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Worsley <amworsley@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "open
 list:DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Fix failure of simpledrm probe when trying to grab FB
 from the EFI-based Framebuffer
In-Reply-To: <CA+Y=x3mF4jFX7PiJQ-1Gk9zyBE1mwZaF_GLYjSspT+mxtMn4GQ@mail.gmail.com>
References: <20231111042926.52990-1-amworsley@gmail.com>
 <20231111042926.52990-2-amworsley@gmail.com>
 <CA+Y=x3mF4jFX7PiJQ-1Gk9zyBE1mwZaF_GLYjSspT+mxtMn4GQ@mail.gmail.com>
Date: Sat, 11 Nov 2023 09:46:22 +0100
Message-ID: <87il68ad9d.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrew Worsley <amworsley@gmail.com> writes:

> It's inline - part of the email - not an attachment?
>
> I can see it in the copy that went to me...
>

I see it now as another thread. There is something weird with the threading
since your first email was shown as first email in a thread with no subject.

> Andrew
>
> On Sat, 11 Nov 2023 at 15:30, Andrew Worsley <amworsley@gmail.com> wrote:

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

