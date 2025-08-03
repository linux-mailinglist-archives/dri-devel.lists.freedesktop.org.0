Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F4B19477
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 18:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1EA10E00E;
	Sun,  3 Aug 2025 16:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="eRl+L5pf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3CF10E02A
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 16:14:42 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso1978052b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1754237682; x=1754842482;
 darn=lists.freedesktop.org; 
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQpFEaDLYhO0uu/gdllj5IbvKTRqfxuInh2LybVDw4Y=;
 b=eRl+L5pfH+8jowUYy+v4SiCGxptqf20uVQ1dam3+LsaF3cGun6gMVXK+XPdr+3qjKq
 YCqlwGDvmtBmLxjgVisMeCc9OCIhEreCjOIzhEHGpdkWIiqXVJRp/BpayIpAx7xo7LZd
 X5Vz8NlOCRsxzi8Hp8GAwm2vvSyImDP2YmlIrPDI0+2LdrNBoUO4piu/TuK/SKmzc9NO
 Oz/pekBHqPSUKjO64fKZEb0LHuHc6MUb7lJ0+MWU8Yy0z2EUYAAR7hGGMe6NZua0w8wQ
 pT0V7kIz2lEslWi0hVvHJBR4dABsBgRPAyr1jBA+LGj8tijZHl9mITjgdB10YOUOHOB7
 sjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754237682; x=1754842482;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JQpFEaDLYhO0uu/gdllj5IbvKTRqfxuInh2LybVDw4Y=;
 b=AAhNsobrmq7sefqJGkjDOkIwKTeBXG2foDPsVov2rLHcvh1KzzHwy/zNm4NWTt8uOL
 Ei6R8pVm2O6AsQ2kp1J6Yn0bTfHft+Wo1WU2Ap0ve7wEfSGAjY7D+zOzhA9EUxXDCQuQ
 po1mi0npr8p1zHdPi/7FztzSBQ5iVI5i4KwVaKd2aB5v5ox0Rmyi5PLd2FqXMQaCOEot
 G9OVq0K3Oxa/g7gieQdsWE6CzoohZKxNBDqLpPdHdW3NBpMvcRzC+8Kcf8jvsDZAY1f2
 4kRWz93tpkpPCevg1+Clb+KB39iaJGyvLUfI6OH3t1kWckL/0f5HThj4d0Y+26NbHIFI
 g/fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi0rRBvtNZQHD37+3s34xUDGuWu0VF3fCd1th/W0F5SARG8sQ0RuzC18LNk5PESEj+y7u0V56Gs34=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlU/IysTyy8Jm5x0KsCReNdfrpPVutrk0zhwct+n+/fLGVRcd3
 gbvxB7yC7astfBBCqO3CKYVV0Ck1pHFEWoe0JtmX5Tl42rshA+wl0djDCN3G9dII3uqmFzUqmRZ
 p0/xCJzs=
X-Gm-Gg: ASbGncuxh5xZk+pPyynaw4kKCLDVIMjcxlTdrZ0CuE8iRaB2tkcaKTBBnawK/GjF3gv
 dENmO4iOmSoH+SR5UZDINL7Vy6nK5hzcKlr0CergdIJQ6yvT9EyGc6xfGGT1syuGEkZ8uzcOfx5
 77C8rXSj5nerEJKRBKwGCPZM4mhkixMnzZ6MtRYpr/A+hzEXEk8AFaE7QNYZxeieHQXM3r7Eg/w
 XiLC/xXWTajTWtEdAHuaAeCITUpIFc/6Ebxo+mB1byRpZSOfBiiUkoGciIb7pUkwx+fa0OWpLQz
 h11PSZ+typ9uokTsxcwkpYCjtJVzYKXooqG98F9rIAe1dJLaEb4c+kfe8W8kuYOeriK9e9P+rZP
 P+pOzaM+anFsD+J90B/0=
X-Google-Smtp-Source: AGHT+IGEvYduDzdbwcJ7TQCIF912GvAtfZiRW2LnM75ZKQVh2Lue6+FoQSH0fMutpndDgLCvq3uePg==
X-Received: by 2002:a17:903:183:b0:23f:d903:d867 with SMTP id
 d9443c01a7336-24247013eefmr93455085ad.35.1754237681805; 
 Sun, 03 Aug 2025 09:14:41 -0700 (PDT)
Received: from localhost ([64.71.154.6]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef6c62sm90444995ad.4.2025.08.03.09.14.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Aug 2025 09:14:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 03 Aug 2025 10:14:39 -0600
Message-Id: <DBSXCWOKT4BE.1RD9LVC2CY12E@brighamcampbell.com>
To: "Tomeu Vizoso" <tomeu@tomeuvizoso.net>
Cc: "Oded Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <skhan@linuxfoundation.org>, "kernel test robot" <lkp@intel.com>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] accel/rocket: Fix build errors and sparse warning
From: "Brigham Campbell" <me@brighamcampbell.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com>
 <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>
In-Reply-To: <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>
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

On Sun Aug 3, 2025 at 9:33 AM MDT, Tomeu Vizoso wrote:
> thanks for the fixes. Will pick them up. Hope you don't mind if I
> change the subject of the first patch to something a bit more
> specific, such as:
>
> accel/rocket: Adapt to changes in drm/sched API

No, I don't mind at all. Go ahead and use your editorial discretion with
the shortlogs and commit messages. I'll put more thought into the patch
subject next time.

Thanks,
Brigham
