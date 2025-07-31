Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD1B169C7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 02:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDBD10E0E6;
	Thu, 31 Jul 2025 00:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Byn2CyKQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E6B10E0E6
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 00:49:45 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2402bbb4bf3so6523075ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 17:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753922985; x=1754527785;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJDt2FYYLu2qEDdCbjucML8LgrSLjpCS+v7eTHCd5u4=;
 b=Byn2CyKQ7FtCj0ATcQ/pvNUK8lZUlho2eFL7kHHpTZCQm0CNDCDAnjzL8et4o3uVKg
 0sFOU36OdppP3GLcOGhxqT/Hoca0OwejvVJPATamhgWS8feCmpRqSXYWdVIKdoN/4Y/R
 QxMAXGPVzqfw9HW5Fj5cB/O67xWs3BSFGewa5orJTChdyGYY/U2UBczKbG5F/Hd2yfuH
 J55Sn78gjHPWvGgB+2DfWwAEQyfENxEsQgVZWVlB7yaaOUoCbnlZH0/6J20FLNtNjub5
 8Q6nVQ9DsHb87pyWGLv49iF2pwdbR8dYbI18MTeSti2+NNtXiglIqT7VBBTeyLjsp/YX
 B5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753922985; x=1754527785;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vJDt2FYYLu2qEDdCbjucML8LgrSLjpCS+v7eTHCd5u4=;
 b=qbRIvDhVshsksq3w803XinJWJ2hrQfXpyS5wgf8BSTq7hDX7FERhR4DNFSM0zXKW85
 H+oWRoZ2q7D26lRrjGAl3lpeCI69DFvvY4J8gy3WGOQaaKFgDNVAAA+oomZZw0nfpJSn
 eop3FKxhPqjf3ZakgGnTnelQhZT3lpE9wN4QgdnQwbC9xVp4re9W63+YVCNec/73WaEU
 QJejB5DeA0taaZ/zhgnTg4MMZKkG/wvFCttAfgJ7v//psCsIZFYV6oryqA2pLbrDiCLC
 D3UgpoiAWnwO5IbEqbojNJDR5cMc+LWZjL0chr1gwtzy7/N7l+iBnwtuRdnscvWoJYQg
 sBjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoC22d70mabWoj6lTQuNiG9vbqe+gsiuJ+ArouRkXK5h7wCNkfHNmpBTSyhXh01nu+kRe5xhQLlYw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUhFrJdVlvQ7J2UucLmQtaacKc3CuHRPYGruvjAfcFt6CXIv6y
 jsvHPLhle+cFwPsANIRMeCGuurt/U7eCmG+ghMYsxil2TgnxthPKzqaZ72L41JU23Hw=
X-Gm-Gg: ASbGncslUwxzqbfNc7ZGxrgUaQS6pjBvQIxi/FBse4Rs6Zp6zPW9xUuUZ8+Pz5Qewfi
 81SIBGHH3BtWvOvwAZvw4z97Aj9DKS4hbW/pSnY9sbloIBk+tmknCqOTyzcDTtbm0Ed+jyE1uPP
 0dA35fy8tjhg6NDwDi4GCsJdrUP8VeePJyEprPuq1lrDA+WLAF4O4XS333trJ2NFoCokR1eDx1u
 MK7g2jN8/GOjXITYb46GnHWArpIdAbH6or+MoMu/3NfYAp1xnD8Aspvq+s7VRT3xfCTLAL16+i4
 rwzBZT0tYINCspBDF4newJxc0u2MqkYisTkGUwM6RnxkCEafyoKsB4XxHLEjKUCdJjnG2sj0ogm
 Ey44GmJBw5VbSqi4oTaE=
X-Google-Smtp-Source: AGHT+IFRg4d14fwyDbWfm6s1XgJ9O3YqeFegbjebAyJ4PNp/hfmIOJ7UPSuIb8lsRamTPF40s9y5Jg==
X-Received: by 2002:a17:903:238c:b0:240:150e:57ba with SMTP id
 d9443c01a7336-24096a72ffcmr57849285ad.3.1753922985361; 
 Wed, 30 Jul 2025 17:49:45 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f0e81dsm2897185ad.46.2025.07.30.17.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 17:49:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Jul 2025 18:49:42 -0600
Message-Id: <DBPTT2WUK2CH.1V1KX11EJPIFB@brighamcampbell.com>
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
Cc: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <linus.walleij@linaro.org>, <neil.armstrong@linaro.org>,
 <jessica.zhang@oss.qualcomm.com>, <sam@ravnborg.org>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] drm: Add MIPI read_multi func and two write macros
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250730061748.1227643-1-me@brighamcampbell.com>
 <20250730061748.1227643-3-me@brighamcampbell.com>
 <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WpbU-iuEDVRuMm87H48PKQ3pz5aBwTRyedguFQA3dvTQ@mail.gmail.com>
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

On Wed Jul 30, 2025 at 9:56 AM MDT, Doug Anderson wrote:
>> +/**
>> + * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-s=
tatic
>> + * payload
>
> I should have been explicit, but the above "non-static" should also be
> "non-constant". ;-)
>
> I could probably fix that when applying, or you could send a v4. Up to yo=
u.

Oops. This obviously needed to change as well, but I tunnel-visioned
hard. I'll go ahead and fix it in v4.

Naturally, I wouldn't be at all opposed to you or any other maintainer
making such a small change to one of my patches as it heads upstream,
but I'd rather not ask you to remember to make that change after a long
vacation and a busy merge window. There's no need for me to add even a
little more cognitive load to your job than what's necessary.

> Speaking of applying this, I'll be on vacation next week, so I won't
> be able to apply the patches until the week after. That will also give
> anyone else on the list a chance to comment if they want...

Awesome! I'll plan to sit tight and act on whatever feedback I get on
v4.

If you happen to be flying over northern Utah to get to your
destination, look out the window. I'll wave as you go by.

Cheers,
Brigham
