Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04F7D93BB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 11:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4546E10E962;
	Fri, 27 Oct 2023 09:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C3410E962
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698399108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5tK4NsSAMVwjRdwU7wyEET86Ne+WP2XLYS+WWydcWk=;
 b=Sgvk9H2xvBT2DLHy0pfixyAp8tYRdSMhJmqmf3FhuGTln2SgPvDmT/ExG9ALItx7gkCcm7
 7k2+hAAYChfBg6L1Xwpld9Q+mBRySOl/ge6Ots3gGaKIwl6isqhPXACQTzcI/YA9r6hLry
 3mvZEO6FO5E8nNkHetaoH0dLjgyC0mQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-1win-xglMimkuNYlWDv1UQ-1; Fri, 27 Oct 2023 05:31:47 -0400
X-MC-Unique: 1win-xglMimkuNYlWDv1UQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4084d08235fso14430645e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 02:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698399106; x=1699003906;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i5tK4NsSAMVwjRdwU7wyEET86Ne+WP2XLYS+WWydcWk=;
 b=eCaU1ocU3cJk2tksIuLEm4EGGDLtmsfhd2PumgDsBmhPbxp0PNgGJUdrRZv9mgzBqz
 4QhQBPPgP3N3SXh1HoWorGqdsCBioGjV17MDLDZ3N1sxPFB/23teTWUXHwDa9CCZ7Czi
 ZqBvmBITeHdUJ6xzSw2hPdzj7+zMaVkfMYiPp7+RCChwPLSWb2VvmPgLwzRFcSMyComd
 fXOYfXPw4PUDcI7lKFzobM6FdQy7bDcS5/gKtwxFWW2201FT4CRq12sMcKvnpExQ1y+L
 P2EOA4CyVJ1oaUx4AcoxtEH/C9tIJSi9vfknwS6u1YiusOcv7jRtaj9Hia9kzHVzocus
 hlDg==
X-Gm-Message-State: AOJu0YxNn2WXLccMd7LJ6bau4jYHQgfgkOhL7mt8TYunWpLwJ2WV0Euv
 Ro5psu3NoZoE+apKg10b0af4brl/5+HypDPeH7tYi/qM0CAsRKpe9C5u30nO5qer1ybVcnafOxQ
 9h41abyF+gFmBAqVp2+B38tMW2dwU
X-Received: by 2002:adf:ec52:0:b0:32d:a405:b6b7 with SMTP id
 w18-20020adfec52000000b0032da405b6b7mr1728467wrn.32.1698399106370; 
 Fri, 27 Oct 2023 02:31:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4GTSZ5mevbLNAhGTl6ibJEtqheMFk0mh+g9KjS0o00s6f7UUrHkcef0JX6jVsVgS7HiPf/A==
X-Received: by 2002:adf:ec52:0:b0:32d:a405:b6b7 with SMTP id
 w18-20020adfec52000000b0032da405b6b7mr1728454wrn.32.1698399106098; 
 Fri, 27 Oct 2023 02:31:46 -0700 (PDT)
Received: from localhost ([212.80.183.76]) by smtp.gmail.com with ESMTPSA id
 j15-20020adfb30f000000b0032d8eecf901sm1369948wrd.3.2023.10.27.02.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 02:31:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: Fix possible uninitialized usage of
 crtc_state variable
In-Reply-To: <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
References: <20231020225338.1686974-1-javierm@redhat.com>
 <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
Date: Fri, 27 Oct 2023 11:31:45 +0200
Message-ID: <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Dan Carpenter <dan.carpenter@linaro.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

> Hi,
>
> On 21/10/2023 00:52, Javier Martinez Canillas wrote:
>> Avoid a possible uninitialized use of the crtc_state variable in function
>> ssd132x_primary_plane_atomic_check() and avoid the following Smatch warn:
>> 
>>      drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_atomic_check()
>>      error: uninitialized symbol 'crtc_state'.
>
> That looks trivial, so you can add:
>
> Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

