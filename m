Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B0B739E09
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:09:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE4E10E14F;
	Thu, 22 Jun 2023 10:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5933E10E14F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687428580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Iyc9oo6eOBjlwwiDMdCsr8iwFpd3Id6kd+Jhvfv1Zrg=;
 b=Njt3O8xZZzRBhtX27edi/JdaC8RsnRsPL7+WI7EczzNjdTrwu52MT6m2DMnYs2MO3/BI6G
 hwKsfT/YuUB4rluE6ufcD49GeSK0Q3rDKKIMAMgPEoOqgVWq84eAACOHB8DFsjDPsIExZd
 t69Qc03UBpFCL7j7Sc78iu/aU5Q11PU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-3N-tXRPPMFy1rY2AYIlAQg-1; Thu, 22 Jun 2023 06:09:39 -0400
X-MC-Unique: 3N-tXRPPMFy1rY2AYIlAQg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31114af5e45so3224979f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 03:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687428578; x=1690020578;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YTDWEZLNIRC67TnLQxvgMKS8qAvf3ra6SocYaQSHdeg=;
 b=JmUQ6ApJmrEgC5Myi9XtahpyKVH1BxAnEEaD+I1hWeQjf0oo5hQ5UIxw0ltOaa5kR0
 0Kcn14OU8uHwws/X17qHjMowLld4DEQMcC4+kWwJoRpBfzZEhph98Fo2MMKrBi+LJNTW
 o7FVaoeH1XQozvHkGsR71n5s291vcguTElGudWyX5EsOvD4FAyHn9Rl50SChKLAxADwa
 mRO3T4mzGuAO3Gyjwbt8zW/+AzGeSDcgX0RZ1h3FjU8qTrePuCV+/q86wSSV4jnuo4yP
 V/+qKhgIwS/ngJRHp7zNtIFPVxTaalPvONOCQsWbVLTW7jl7cSf3KRa3xElyns57yV0C
 f94g==
X-Gm-Message-State: AC+VfDyeYdoG9zonEX3XLEnHkVhHNfFZKL1gVjwdqMJBsWbBekUBNFF7
 UU74ycS3fCmxUYNWiQpPSz58Ehfr1ZYUDdeFNvtkt2+MnL5Fd/Wz8FGvRPjed8nbqMN83y+sdmg
 giOtQ6W7Bc9EVx5zgDFSffaaMtip7
X-Received: by 2002:adf:df02:0:b0:2f6:bf04:c8cc with SMTP id
 y2-20020adfdf02000000b002f6bf04c8ccmr13984924wrl.55.1687428578450; 
 Thu, 22 Jun 2023 03:09:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mmaoXLnnPlGpMcZQLjGzkejmifnhHk88cMioxTrep0rt9LVD1s46n5BwhWVnXtVOvy0ooeg==
X-Received: by 2002:adf:df02:0:b0:2f6:bf04:c8cc with SMTP id
 y2-20020adfdf02000000b002f6bf04c8ccmr13984908wrl.55.1687428578119; 
 Thu, 22 Jun 2023 03:09:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p7-20020a056000018700b003095bd71159sm6705980wrx.7.2023.06.22.03.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 03:09:37 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/i2c: Switch i2c drivers back to use .probe()
In-Reply-To: <20230616055844.rgmi5hu6sghgttil@pengutronix.de>
References: <20230611202740.826120-1-u.kleine-koenig@pengutronix.de>
 <20230616055844.rgmi5hu6sghgttil@pengutronix.de>
Date: Thu, 22 Jun 2023 12:09:36 +0200
Message-ID: <875y7f3j1b.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Wolfram Sang <wsa@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> writes:

Hello Uwe,

> Hello,
>
> On Sun, Jun 11, 2023 at 10:27:40PM +0200, Uwe Kleine-K=C3=B6nig wrote:
>> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
>> call-back type"), all drivers being converted to .probe_new() and then
>> commit 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
>> convert back to (the new) .probe() to be able to eventually drop
>> .probe_new() from struct i2c_driver.
>
> It would be great if this patch made it into 6.5-rc1, as I intend to
> send a patch series to Wolfram after the upcoming merge window to drop
> .probe_new to go in via the i2c tree. There are a few remaining
> driver instances that I will have to fix in this series, but I'm happy
> about every patch that goes in via its designated tree beforehand.
>

Pushed to drm-misc (drm-misc-next). Thanks!

> Best regards
> Uwe
>
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

