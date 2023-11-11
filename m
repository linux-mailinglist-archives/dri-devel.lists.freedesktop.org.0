Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA547E89CF
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 09:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F97910E145;
	Sat, 11 Nov 2023 08:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFBA10E139
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 08:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699690984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atynAEPTfoWaTFzhCmsRpTVi62wChDn9ybU1dA1F4RU=;
 b=EkTuw6Tfh9Vh8lkswYNsTc9V/EKv7YMx+gAy2Sj9aUHLRqS0dFeLhyOStkuI+X901tf+KM
 y2E9cjpEvcPJ6aClRybunT5unafv5M/S/rm4iBJvspFbfZy5vDN7T+cJqtSqyQOTp6gLgK
 f0y3YSBj/HHo2dM6y0K+3ino1guV44U=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-gQLrQxemNZ2iigbwAcBp4w-1; Sat, 11 Nov 2023 03:23:03 -0500
X-MC-Unique: gQLrQxemNZ2iigbwAcBp4w-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5079630993dso2796277e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 00:23:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699690981; x=1700295781;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atynAEPTfoWaTFzhCmsRpTVi62wChDn9ybU1dA1F4RU=;
 b=qyXHMoAit8OBgtBV7fyAfJ9RDjO+L34xjocx6gNKzCnpp6plUDa9gw+SPs3fEnDkGq
 HpOHyaK5bUuvgUnR39xFtf/cpTc6daJ6X8tLTJuMVyPhF90JLzOoMrU1FwZQQzV+zzwN
 2CHAsJnwAEbDr79KI9SxEkqvcAzaiutoxYKwcT2dDeNLzZ5XpUk2IlU3iIIhBfPd5JIp
 EbkY+T1HkynZQSgOZDFi5uvtsM7yC3giLMy9ROl/7UZZ3mxT+Ku3Mv6rHk0j3aYs09V8
 56/EKgorQ4WytZ2/i6nr2eDwBY/yDV/R3Kl2NblOcqQvO1DnisZ6j34+2l9p3I+HUBBx
 FtKQ==
X-Gm-Message-State: AOJu0YwUhpuFCb4zguAZY0ZTXyva164CGxydotGBetYPsbGhUwF95B3I
 K2cry5RrmzsBbL1sQaSLC73MIqIWJ3sl1jkx+Ilp+eGfmUwBcGoku0vGcumeDcIE6+iitNmTplG
 DaXvUtiUBXBb8HOdpwmVVd2iQ0ftB
X-Received: by 2002:a19:7509:0:b0:500:9a45:62f with SMTP id
 y9-20020a197509000000b005009a45062fmr864858lfe.8.1699690981698; 
 Sat, 11 Nov 2023 00:23:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH6nJoUNA6XRAC1D3A5wF+hzfzKU/LOq+x+G3NEN3OgJMUiAVEfgREdpR410T3zw36xrPV2bg==
X-Received: by 2002:a19:7509:0:b0:500:9a45:62f with SMTP id
 y9-20020a197509000000b005009a45062fmr864846lfe.8.1699690981373; 
 Sat, 11 Nov 2023 00:23:01 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c10-20020a5d63ca000000b0032d81837433sm996350wrw.30.2023.11.11.00.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 00:23:01 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Worsley <amworsley@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "open
 list:DRM DRIVER FOR FIRMWARE FRAMEBUFFERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re:
In-Reply-To: <20231111042926.52990-1-amworsley@gmail.com>
References: <20231111042926.52990-1-amworsley@gmail.com>
Date: Sat, 11 Nov 2023 09:22:59 +0100
Message-ID: <87o7g0aecc.fsf@minerva.mail-host-address-is-not-set>
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

Hello Andrew,

>    This patch fix's the failure of the frame buffer driver on my Asahi kernel
> which prevented X11 from starting on my Apple M1 laptop. It seems like a straight
> forward failure to follow the procedure described in drivers/video/aperture.c
> to remove the ealier driver. This patch is very simple and minimal. Very likely
> there may be better ways to fix this and very like there may be other drivers
> which have the same problem but I submit this so at least there is
> an interim fix for my problem.
>

Which partch? I think you forgot to include in your email?

>     Thanks
>
>     Andrew Worsley
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

