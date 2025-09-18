Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A52B84494
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 13:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794E810E744;
	Thu, 18 Sep 2025 11:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g+5Yk5Kk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0017F10E715
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758193650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tcqSxb5DeL1TyWKfiM0gpz33Rbm3v1LUwku+6t5SVpg=;
 b=g+5Yk5KkBc04GAgqgzb9aI9mPEghbGkqPlt/0QGCKUUEM1dJd1AA8Bx4Z4F+7zFxm/98Ok
 Ggb6NldZbRgVvmUHwNNspQSAgb2ynMuhkD1en+spTYwuBFBd5jiwvWB16K8sOPLPW5blvk
 4eJ7xVXFP+BCUxtrkLnbncMcroPdlKc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-riXfFvVQO5qVY2bDM2UGRA-1; Thu, 18 Sep 2025 07:07:23 -0400
X-MC-Unique: riXfFvVQO5qVY2bDM2UGRA-1
X-Mimecast-MFC-AGG-ID: riXfFvVQO5qVY2bDM2UGRA_1758193642
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3e98c5adb70so364438f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 04:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758193642; x=1758798442;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tcqSxb5DeL1TyWKfiM0gpz33Rbm3v1LUwku+6t5SVpg=;
 b=mGHzjmI3ga5XNZKIdbiKAm70SLTNTABymMwOC2JOM8Yx4G5H2XAY4IBIDsnUhktsq8
 myibSb4ENdwIaaZk/v9t3jiBry0ts3sYzuVyR8zmbv9CATqKPvyftvBQuHLCSC7qACuf
 AJIdPg0VER/yJvqZlJYd4hS3erx/hFHHIEqX50KckdkYsD/4pBHVXjQBFdwwTGusRHnf
 RaQSdZjgu6j7NOVnTbveKQjtxM+0gHOUsaFHraB2wEd730KhyTp839mZTOtd5W/eJf7P
 4oE71McxDVxL7Evw2Vi/9VzxdY3InRRVHJdMYWMIbJKoW6nVFquA/k54y1oiYATbaRcc
 q+xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnKKGDLBI1iqrpD0iSMAmc2WeKSk5rB4FtfCwiUaZNhEv3XbJtnbNF/nYaYy/SMoXy4MojRXQwOMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUv8FhNlY8gwdrlgKVKVsfpUIt2Ef1Euof1AgpWhchoRmsjkNU
 jPKu/+cf2ZJttY5U9HnC+JDBRaygwEIsAv92pWUEzUkQ5dmRjUIgHuFGYGxWwCLWhRJi7wRWzuU
 J3tq3DnIDlLknIyycuTeek8Ru9Cuy9vSZaELNEpdFKtK2XWb4lQCFs+tOTlkC3ttl7PNGdQ==
X-Gm-Gg: ASbGnctYNDn46AfDTzalvH1Cxl79CpLDraHPFs4gwSmSNn14efGZQKTq4kpzurrADd8
 0kigTXkHzyh8wkthNwk2M8YMFkwWWvFkEsqckD569RRzWWPYRswsh7KzdDbdPypBTdiQals8TmF
 QfByYOPgxQREWakEeh5ewjZtuvJ75bWxflpuTl1p2YAPStZrNE0qSixLuPly4ao+7d9fiE3mtY0
 7ChzxU2jmwa9H5k1pGp6f7ZbhI7JXH0WNR+EJmxMSKtqOIKcaoUQBZGnYnSKuzGYswS3hxmfrZm
 xIMtOUkRnpc7hDnx4yJKEIdcDMlqPvyqeBeO3NpVp7bv2vhUgF4ZAIP3Ltc9kE0YFuSp52B1pqi
 Wmca0W8cNsL37RtMBU1/K8A==
X-Received: by 2002:a05:6000:430d:b0:3e2:2215:6238 with SMTP id
 ffacd0b85a97d-3ede1b732eemr2273285f8f.19.1758193641738; 
 Thu, 18 Sep 2025 04:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS9VtB73nB23rIhd1n5gh+mA1OvFubwzSrnnkrrVPB3AI4Ra3mnWTj29dtHNfYx/sCPJ/ARA==
X-Received: by 2002:a05:6000:430d:b0:3e2:2215:6238 with SMTP id
 ffacd0b85a97d-3ede1b732eemr2273267f8f.19.1758193641385; 
 Thu, 18 Sep 2025 04:07:21 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613dccb5e2sm76004665e9.17.2025.09.18.04.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 04:07:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sitronix/st7571-i2c: reset position before clearing
 display
In-Reply-To: <aMvIyOJkXE39sp8T@gmail.com>
References: <20250913-st7571-reset-v1-1-ae5f58acdf8d@gmail.com>
 <87o6r9o25m.fsf@minerva.mail-host-address-is-not-set>
 <aMvIyOJkXE39sp8T@gmail.com>
Date: Thu, 18 Sep 2025 13:07:18 +0200
Message-ID: <87a52saujd.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GMTrDTGTQhjU36z043HPbws3hBcLYaxj3j0LtEPaYGE_1758193642
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

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

Hello Marcus,

> Hello Javier,
>
> On Wed, Sep 17, 2025 at 11:32:05AM +0200, Javier Martinez Canillas wrote:
>> Marcus Folkesson <marcus.folkesson@gmail.com> writes:
>> 
>> > We cannot know where the write pointer is, always reset position to
>> > (0,0) before clearing display.
>> >
>> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
>> > ---
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
>> Marcus, do you already have commit rights in drm-misc or do you want me to
>> apply this patch ?
>
> I sent a request for commit rights yesterday, once it is approved I will
> apply this patch myself :-)
>

Sounds good. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

