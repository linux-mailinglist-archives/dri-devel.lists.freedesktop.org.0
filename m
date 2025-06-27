Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B2AEBF71
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 21:10:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D08F10E062;
	Fri, 27 Jun 2025 19:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QXf8f2Mj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049A610E062
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 19:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751051409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8dhUCmQVBVc3ggbPxSqO6DltDZ+HKdR/dQ/Hvgc9d5M=;
 b=QXf8f2MjRMv8tCfU5RBjjy4aysaqG0EJFcx1R48jWL5B9pgz+p/QMR/G4H/cy+V2kRVotk
 VSDCyq9is9tFB6hcMbm/1uTKqgO/hHoPdU/GNZl5/qymR4Wf7k67oDT7gzIXMxYq7fKJIF
 LVbebSaLVdPil80FtC7IEtaWVmElmJU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-EEuflc1xM5O9Lcq7YEcQ5A-1; Fri, 27 Jun 2025 15:10:07 -0400
X-MC-Unique: EEuflc1xM5O9Lcq7YEcQ5A-1
X-Mimecast-MFC-AGG-ID: EEuflc1xM5O9Lcq7YEcQ5A_1751051406
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a52bfda108so1207127f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751051406; x=1751656206;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dhUCmQVBVc3ggbPxSqO6DltDZ+HKdR/dQ/Hvgc9d5M=;
 b=jBDhZ1gZ10kIv4l3kqjkl/Y94MrOFnRcQnzBa/WoicJmtawmpZvvYvD7Jx3UoANtF4
 QchQgX9TW4xJQpvQJONdjzJp04vIR6Y6QgONE68R2sQaq9sndoP6fkuLvpkgKwHfLw5X
 KWpCXoqbxf3IRwygmQRosM/VspG9bV1WVGoTaj+WMs8T/ueZGPP9S2vuSIK9NA2PKZQg
 ltlX73Nnvp3rLNU2bYAabV7aaMCWUrAYFX0s29E+jVV+na2rHDymV6ZSUxTMSaqq+1Tf
 rU/IK5KkwzidfJ+182XjPwPIqdzEs8a+SmTe+zLgcLvF+kok9smPAF/fui2LkmEX/z9J
 mV5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhNzrDTl7kC15fcb4Z74fSQ4OMCmtLGXyjW6bSxFi0Fn7chhFBVu1+4evLQhdhWc8LZ5czjoCNA8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyd6iSZ+X1FBvHBDUEAMHzj8ZkQL2ZRohGxS/+p2U+pWZZ3f+Zc
 2cmxK2WPw0slIe3+ckqXog/VfRQ6hKV/6ZlFo+sUGfMqC3Qaaygly7bw2H6IC5OKiXOHm6KngVd
 hujGk303i8Xbuy43iX0kG1CP2JCKrFGILYP5XFNQa06Z2CvxPKSTz52zqeLAu5ot/8waxiA==
X-Gm-Gg: ASbGnctzolfqtYuUE6/EfaWBRe/jOst5NuptnMu2QZ8C2e8lkNr0SY6IEj1BfAJwY/K
 fSKIxyjCXOYfO0TH04IvH1Y144WzItqLoGw3AXKU2MG4T4yYmT+2npqVMEHCQRvWxtVyCX5rfEj
 4QuXcb5lm8Q8qzIW9AQCDjyIG2V3zVyLgTfzI1IrAasPGJAYI6o27KIgm7dNXtJzZJxF1R9R9Yz
 yduD/Q55IYOsfSGIKxzF0ekRr9l36gb+Lvv9+leFdnjNDpzR8DiZG6iP32J2z/jMHW4AIt4r7iF
 IYoTOS1J2czW70a5BQ85qLu4R2Kod1sSBVtGtj1ATm6lTrxRyv90ZthFmNlUhV1ldDItblKDhqM
 7dCrl
X-Received: by 2002:a05:600c:6214:b0:43c:f81d:34 with SMTP id
 5b1f17b1804b1-4538ee59e00mr48894105e9.9.1751051406197; 
 Fri, 27 Jun 2025 12:10:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+dlVQhSspA5PwToMnM0ThWWPH9JNUOFrS62C1jlwna+ewSRl206auR0M8OY+YVTp2hsPtgg==
X-Received: by 2002:a05:600c:6214:b0:43c:f81d:34 with SMTP id
 5b1f17b1804b1-4538ee59e00mr48893895e9.9.1751051405736; 
 Fri, 27 Jun 2025 12:10:05 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a421434sm59447325e9.37.2025.06.27.12.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 12:10:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Clark
 <robdclark@gmail.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Naushir Patuck
 <naush@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 libcamera-devel@lists.libcamera.org
Subject: Re: [PATCH] drm/fourcc: Add RGB161616 and BGR161616 formats
In-Reply-To: <20250627180454.GD24912@pendragon.ideasonboard.com>
References: <20240226132544.82817-1-jacopo.mondi@ideasonboard.com>
 <CAF6AEGvhjktN52k4_hJjz3mXTGJgH+QtK68yhFbsX45ukKnG+g@mail.gmail.com>
 <20250627180454.GD24912@pendragon.ideasonboard.com>
Date: Fri, 27 Jun 2025 21:10:04 +0200
Message-ID: <877c0xatmb.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hGVEFNlyCYBwOMmDL1DTcz6tE6nSuzgvteJWcD6bwMo_1751051406
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

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> On Fri, Jun 27, 2025 at 09:39:37AM -0700, Rob Clark wrote:
>> On Mon, Feb 26, 2024 at 5:43=E2=80=AFAM Jacopo Mondi wrote:
>> >
>> > Add FourCC definitions for the 48-bit RGB/BGR formats to the
>> > DRM/KMS uapi.
>> >
>> > The format will be used by the Raspberry Pi PiSP Back End,
>> > supported by a V4L2 driver in kernel space and by libcamera in
>> > userspace, which uses the DRM FourCC identifiers.
>> >
>> > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>=20
>> Resurrecting this, as it appears to have not ever landed upstream
>
> What are the rule is for patches that touch core code like this one, can
> they be pushed to drm-misc by anyone with commit access, or do they need
> to be collected by a drm-misc maintainer ?
>

According to [0] I would say that you could just push it through drm-misc
since there are already a few review-by tags collected.

[0]: https://drm.pages.freedesktop.org/maintainer-tools/committer/committer=
-drm-misc.html#merge-criteria

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

