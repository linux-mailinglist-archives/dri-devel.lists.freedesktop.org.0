Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7D1AEC5A1
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 09:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E18510E170;
	Sat, 28 Jun 2025 07:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XoaNXn6Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B58F10E170
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751096591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/zR+tRhdJvIMo++94eInuug2KHQSKfRczI4CreLh0Q=;
 b=XoaNXn6ZVwMMp7Vtn9mEUJV7eNp2ZBqLsPz+yjgoOy4dNDvx5ZSso/4GMSty39xCTwMKED
 hLIq2ipgCGFFCGmWa4z8dNo6AvSxH/g+gONvcpJqU+BVawrltAfAkZC7P2KohiQkqlET7Y
 /WYxu6EjpZnTA7zSqovkhstJwxBjC64=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-xmMmNHq_PPOgAiLvR9QWxg-1; Sat, 28 Jun 2025 03:43:09 -0400
X-MC-Unique: xmMmNHq_PPOgAiLvR9QWxg-1
X-Mimecast-MFC-AGG-ID: xmMmNHq_PPOgAiLvR9QWxg_1751096588
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45311704cdbso2974165e9.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 00:43:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751096588; x=1751701388;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmbjM2vUohQXnsREL9VLb8Q7wKmlAUxLknQWn0cbM3Y=;
 b=fluJn2qsGM1/ygn+7s0uFOA019dDEjWoqfVrdKQUvmy9CvP2fmzK8CIVuN8y7i3zke
 YNDjFbR6hcgzNYsdMAUHQr1N2/Syb9+GRME/CJtrLOo7hO6BzylohJzgFKKmMZ5O0xWA
 4lMAPA/+N08Lbr5UYb+WJJypf7Xn09jmKoWrGSbiZvSjwqDs8Fx0/fBjip7bl7AiVyHi
 AdD7EQk7qX3KzDW7p4o2PkahIAgkkcO3mIPeozZ7QtUfSuNgarJV8nWkuGIY647KpMSw
 0VIp9aPTIc9PzuFptFuFcyzgpNw4rosTo983fgTf4vCYOIMMq4n+piqust2BZ3gNumzs
 cZLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWriXvVjk5WYBiPxDSN3QoL883YQ2wT8QqrLpmcWc1HLv/jlNx4wq+eWQJcWXWsRIOOfhy0ZvDz0yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ1cgxaizc/JtzRfdGkop+rxf0XY4Xm8OCZBpFFCe6e9c0ms/f
 pJy7nL8+R4kBydWMjI/JwiSLU1+eIMYebDHpa2NoYzZOfW9txNsB4TrPt74FvzyggTWbqP+6T40
 Zcr72AB6IvnguN/98ZvRKoCykOC2MBEDsXYg5WzW1IQuuh04YwLLLsM/vcibr9Qe/GrXlIQ==
X-Gm-Gg: ASbGncuOdviF4wKjpw7kFIQFE+ksJJbTcJI5TKz4zQ9NFNibJ1a2KuQFzVNUvVr+/GK
 njQqCaL8wCUJqz7Yh42GrmyEOYHTEXp+BhJerrU/j7SGthrylFQ114YmbU/LU/BaECyXnYMFTJv
 +MvqgoTRuFcO1JfLPytCSw8iXAJcRuNC/q3EMxIpVzblXy0+sFRXygUGR/niRzWUbZslDqonKjw
 z6sPpbZQXe3VevtW9ouRnw3jyttnMMzjG0w7xXIaPBgPiqrnz1K85p+I++VIs5FiafA+ciIEcYd
 IRvMvu/gqkfBcGZHNJsEuDkKUL2YqlwFdXWlviu3sKql7hFTNYmVcBfaAKta/LrIDMinVkVHisd
 6gH+2
X-Received: by 2002:a05:600c:4594:b0:43d:47b7:b32d with SMTP id
 5b1f17b1804b1-4538ee8c45emr59014385e9.25.1751096588246; 
 Sat, 28 Jun 2025 00:43:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9JsCzvfINyyhreU8rIGVzGLKJ/ZNnXhwma/38lPFC8lLrr8tx0To5Ucb+zO+RmWL+1x1o9A==
X-Received: by 2002:a05:600c:4594:b0:43d:47b7:b32d with SMTP id
 5b1f17b1804b1-4538ee8c45emr59014205e9.25.1751096587847; 
 Sat, 28 Jun 2025 00:43:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm102446295e9.20.2025.06.28.00.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 00:43:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: rob.clark@oss.qualcomm.com
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Clark
 <robdclark@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Naushir
 Patuck <naush@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
In-Reply-To: <CACSVV03Vk9MVrKc7y-w2xRDdonUaEi9Ywaupakqb57-9v=uetA@mail.gmail.com>
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
 <CAF6AEGvhjktN52k4_hJjz3mXTGJgH+QtK68yhFbsX45ukKnG+g@mail.gmail.com>
 <20250627180454.GD24912@pendragon.ideasonboard.com>
 <877c0xatmb.fsf@minerva.mail-host-address-is-not-set>
 <CACSVV03Vk9MVrKc7y-w2xRDdonUaEi9Ywaupakqb57-9v=uetA@mail.gmail.com>
Date: Sat, 28 Jun 2025 09:43:05 +0200
Message-ID: <874iw0b9bq.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qQvq9K5mB5tkKyUMQ9LD04MUo9zd11_iphEhtL0Wme8_1751096588
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Clark <rob.clark@oss.qualcomm.com> writes:

> On Fri, Jun 27, 2025 at 12:10=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:
>>
>> > On Fri, Jun 27, 2025 at 09:39:37AM -0700, Rob Clark wrote:
>> >> On Mon, Feb 26, 2024 at 5:43=E2=80=AFAM Jacopo Mondi wrote:
>> >> >
>> >> > Add FourCC definitions for the 48-bit RGB/BGR formats to the
>> >> > DRM/KMS uapi.
>> >> >
>> >> > The format will be used by the Raspberry Pi PiSP Back End,
>> >> > supported by a V4L2 driver in kernel space and by libcamera in
>> >> > userspace, which uses the DRM FourCC identifiers.
>> >> >
>> >> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>> >>
>> >> Resurrecting this, as it appears to have not ever landed upstream
>> >
>> > What are the rule is for patches that touch core code like this one, c=
an
>> > they be pushed to drm-misc by anyone with commit access, or do they ne=
ed
>> > to be collected by a drm-misc maintainer ?
>> >
>>
>> According to [0] I would say that you could just push it through drm-mis=
c
>> since there are already a few review-by tags collected.
>>
>> [0]: https://drm.pages.freedesktop.org/maintainer-tools/committer/commit=
ter-drm-misc.html#merge-criteria
>
> yeah, should be fine to push to drm-misc since it has r-b's (not to
> mention no negative comments for a _long_ time)
>

Pushed to drm-misc (drm-misc-next). Thanks!

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

