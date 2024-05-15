Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271608C6396
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 11:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB68210E261;
	Wed, 15 May 2024 09:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="z5YIcU4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8446810E261
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 09:22:28 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5238cb1e3bbso880771e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1715764946; x=1716369746;
 darn=lists.freedesktop.org; 
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FBbNWG/OMw6mjje2DUg4HY8T9s5UGqSRY1JIF/OODoc=;
 b=z5YIcU4jDEcOxlBYzc7Sz0cWrSs/ysPOykyumg1iVsEIiB4GbMvjNoex9X0f9pz7Uw
 9em843ibi5HnlnhHiGnT9IPN9zLdlPJkh155MtA7BZPZoRNjPQF5YUxtCHgXJcdDEsQu
 a2/HBkC6mIYcLaZEI6RzKMzTf7yGWs2RUva3Q275zdREr96zF7SC9uxOWl31/3RRcRv4
 BL85LMelwwSsZv65qLpSn5B7eTiDAXPRHMvBv32bKr87UYXeB0TAe+q92cc+5T9T/hZ3
 LZIqvAnprG4CoSo85lWzPoodhE9IiMPv9mMlNSA/jXobsy5VXL8uKNgoyU4x+H8uiEZ2
 ttjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715764946; x=1716369746;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FBbNWG/OMw6mjje2DUg4HY8T9s5UGqSRY1JIF/OODoc=;
 b=i7sfmU1vlBFjeKRlx3RYp3DZMuj5wLM+qs9KU6f1rjvUbM50JLPP4qLxFouH3nMeMa
 idCK2LQFHsGH5rSB1femYDbSIJmF9haZfyGhsc6yOoCwYpSB7MUNWr6gIvMVl0vE5ijT
 NlFNxURyFDrub/RwSGNmx2Ox8yy64J+2sr4rQ8lbSXFLUjjfGbJkd6cE9QwdPqa966fY
 xrHx11Jr2B751GyN/B/4SLu4wQBHiy/7huqIxqYcjFnb2tCROueq//ACQr56feuq+Hvm
 nrnYaJRc7skHBsZVPKP9uPNeEPqyE4K+8QHT71zLU8nUlwxtg7+kgMes6eWlJMCMTa/8
 rpTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVILW6tob3xuWebed2/lloHOvHVghbv2DiU4CtpVun6HcYVZHK9WzmZRZ4rmDG2wsFBFPI5SsS7Ui6pD9Ze4EhG3x+EA1gRHomZfERs6w/P
X-Gm-Message-State: AOJu0YyjA1nhZHpyNRfzf9MqsCKDlIgCHiLaJYC0V9cpDq+n5TAv1h5u
 eDwi3v42ULKUWoyQiLn9ZwfTyFEBgPusl0WPeM9143OWBW+aUJQXh2iIfAMxuME=
X-Google-Smtp-Source: AGHT+IG0RKtKfSxpkdkdqacn/LpX4UZ//8yKs/yBjKefxmtSjNC/xUszhGzel+HKzS48AXsNMqpWeA==
X-Received: by 2002:a05:6512:48c5:b0:51d:682d:c2ab with SMTP id
 2adb3069b0e04-5220fc7eee3mr9783448e87.32.1715764946385; 
 Wed, 15 May 2024 02:22:26 -0700 (PDT)
Received: from smtpclient.apple ([2001:a61:aa3:5c01:b167:7b8d:34fb:4ec8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4200f86ab7csm149381535e9.19.2024.05.15.02.22.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2024 02:22:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH] drm: Combine identical if/elif code blocks
From: Thorsten Blum <thorsten.blum@toblux.com>
In-Reply-To: <CAB3Z9RJ+VVAvVfKWF2LCzH3288vi6CF7uv+g+qbeu_L0c_k0Nw@mail.gmail.com>
Date: Wed, 15 May 2024 11:22:14 +0200
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <60613D48-7C93-4B9F-894C-CE70E5F8D123@toblux.com>
References: <20240513212836.292589-3-thorsten.blum@toblux.com>
 <CAB3Z9RJ+VVAvVfKWF2LCzH3288vi6CF7uv+g+qbeu_L0c_k0Nw@mail.gmail.com>
To: Luc Ma <onion0709@gmail.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
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

On 15. May 2024, at 09:43, Luc Ma <onion0709@gmail.com> wrote:
> On Tue, 14 May 2024 at 19:37, Thorsten Blum <thorsten.blum@toblux.com> =
wrote:
>>=20
>> Merge the identical if/elif code blocks and remove the following two
>> warnings reported by make includecheck:
>>=20
>>        asm/ioctl.h is included more than once
>>        linux/types.h is included more than once
>>=20
>> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
>> ---
>> include/uapi/drm/drm.h | 8 +-------
>> 1 file changed, 1 insertion(+), 7 deletions(-)
>>=20
>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>> index 16122819edfe..315af7b19c97 100644
>> --- a/include/uapi/drm/drm.h
>> +++ b/include/uapi/drm/drm.h
>> @@ -35,13 +35,7 @@
>> #ifndef _DRM_H_
>> #define _DRM_H_
>>=20
>> -#if defined(__KERNEL__)
>> -
>> -#include <linux/types.h>
>> -#include <asm/ioctl.h>
>> -typedef unsigned int drm_handle_t;
>> -
>> -#elif defined(__linux__)
>=20
> I think it is intentionally like that. Please see
> https://patchwork.freedesktop.org/patch/78747/

Thank you for the link.

Does anyone know if the reason for the change from 2016 ("make
headers_install can't handle fancy conditions, ...") is still valid?

Other headers use the same #if directive:

fs/ext4/ext4.h:948:#if defined(__KERNEL__) || defined(__linux__)
include/uapi/sound/asound.h:11:#if defined(__KERNEL__) || =
defined(__linux__)

And there are many others using similar conditions:

arch/arm/include/uapi/asm/swab.h:27:#if !defined(__KERNEL__) || =
__LINUX_ARM_ARCH__ < 6
arch/sparc/include/uapi/asm/signal.h:92:#if defined(__KERNEL__) || =
defined(__WANT_POSIX1B_SIGNALS__)
arch/sparc/include/uapi/asm/termios.h:8:#if defined(__KERNEL__) || =
defined(__DEFINE_BSD_TERMIOS)
include/uapi/linux/soundcard.h:1040:#if !defined(__KERNEL__) || =
defined(USE_SEQ_MACROS)
include/uapi/linux/stat.h:7:#if defined(__KERNEL__) || =
!defined(__GLIBC__) || (__GLIBC__ < 2)
include/uapi/sound/asound.h:11:#if defined(__KERNEL__) || =
defined(__linux__)
...

Thanks,
Thorsten=
