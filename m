Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D07CCB2AE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 10:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120DA10E94C;
	Thu, 18 Dec 2025 09:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZzWGDI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A79610E975
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 09:27:51 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-34c21417781so464482a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 01:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766050071; x=1766654871; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WhON1kBGSnYBcNM0Xm1HRmbA6kvcPy4xVa3dVnU4ZWE=;
 b=UZzWGDI14E+iRrfKUExSZ+LckP5ZXncDy4xbLHOTZhaUxnrW5L29+ydEyKPgRrlPXB
 up9QIpDoV6gyJohIxvzktk/swWnRtl19hzSSlAxa5QFPkNW6hB7awNBtTZgHlhUUkAt2
 aFGEyIZjh//P4r5HdGf5yfcOjjG7D6Qu8kHqwEU1ce+hFrJMVZvqmzLv76EkqNP0YrWl
 BwrmbnNAEJXVJvvp7+Z7sIeibccGAvYMxljGKnelnQe7+N27RafHoh0qmszLRi8rV6vZ
 vxk/J8VO2DHMMcpacRaarPVs96HERlaZ3WSyPHjEH0g+fQ2Qzy75Rxe1rF4gTU6IQ6OM
 A9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766050071; x=1766654871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhON1kBGSnYBcNM0Xm1HRmbA6kvcPy4xVa3dVnU4ZWE=;
 b=V1pw1I1jdlBRGLcHq2wcqFolaFx78pgrnuTCupCGZlA17j4ozu21Oe0KKtLph8dIbp
 xjo4uD2Pd7acW1TboHJk9WWBWkdagYKwCFprT4PGotGFTVccRFAfiRaxUmLX+BD2iWPn
 aa+d1eBwgoE/QuEns27Rcgf4oVl6i0omPUhVxlUzdxswqZnCW57fGpzuRwIBb6CnksCb
 rFUt6jPDrTvu9CyP/tNLe8/4Lnb0qwx58qTvRQwSlj4684GCQG1wg3D4r9br+nB936z4
 Eh+GJ3P27cueWHmAjEDp4yWsQed755yYAaefoixx0RIvYwsqf9qB4C0Id88PcQx69IOw
 cHtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9sqYl0vw2+/JSFDj3NZyjX4pcNuR1MLeyFb/xdOWcQ7UukCnU9/uFoZtlkBsuSihXLNB8hJ5GxIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/FmY5TLdCvrS2RvLScL2efyyeCEKQmWtdQp7gWRfk0n8A1CPM
 zB/+OSgpDDn3eHh0NdaoGLDwGr4c+9HwqDB63wGD1mWHssHp2VzzDuz6fayv41/C5q7kQPNB15C
 WTTEXxs+caF0g5Y4+mx+TE8M3PsiXCJE=
X-Gm-Gg: AY/fxX5wHXe8T3Uxmsw9xTkrZj/Kt8eg+Yt2VOAUsx0FPGlKMsBwho5iSHcV+OTdkAg
 MXD7RMWSJD38LCPlKKB+y9iZ3O1MOGWVNe7R1wjbJzupPkOS1JQEsdfWdlVA9/J4Y+2UAvXsBZY
 XT/oZCBYL8IfkFbfgQJuc0/kJfyoSPKirDWK+AA5Sr5A7+GHcQOAe5LJLxoECJbnlRf6LC22Ux4
 Xc7LPT59Y7sm0Sx2w1wHDkX2IqEu9mVsVSpp/UxcZpDJkpspO8d74jGbDZY0U1RhOdgdGeL
X-Google-Smtp-Source: AGHT+IHKLs0ErrslcEID2gTn1g4eXLSrpW08hZCMtClKxzLELJybNqXrQz/d+KWezm/XLit/WgseL42v48pJPhCJQdU=
X-Received: by 2002:a17:90b:3911:b0:341:8ac6:2244 with SMTP id
 98e67ed59e1d1-34abd6d35ecmr18544917a91.9.1766050070702; Thu, 18 Dec 2025
 01:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20251217170104.2767939-1-suryasaimadhu369@gmail.com>
 <b767cb12-3023-44cf-9d4f-2fbb40c1431e@amd.com>
In-Reply-To: <b767cb12-3023-44cf-9d4f-2fbb40c1431e@amd.com>
From: Sai Madhu <suryasaimadhu369@gmail.com>
Date: Thu, 18 Dec 2025 14:57:39 +0530
X-Gm-Features: AQt7F2pq82JBBLZ84-QX8ZbE6HiBLVP25-Wdkm6lHhN7IjjL5G6HBQRNeA59IYM
Message-ID: <CAB0uMAfx4uiXZg5HB=--0Hpnx6nD8pu4a=pWmFK2B8HHx4R=VQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dm: Convert IRQ logging to drm_* helpers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 siqueira@igalia.com, mario.limonciello@amd.com, wayne.lin@amd.com, 
 roman.li@amd.com, timur.kristof@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000001eadc70646369316"
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

--0000000000001eadc70646369316
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review!



You=E2=80=99re right =E2=80=94 I=E2=80=99ll switch those remaining cases to=
 pass adev and derive
the drm_device via adev_to_drm(), and I=E2=80=99ll also compact the logging
statements a bit.



I=E2=80=99ll send a v3 shortly.

--0000000000001eadc70646369316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><p>Thanks for the review!</p><p>=C2=A0</p=
><p>You=E2=80=99re right =E2=80=94 I=E2=80=99ll switch those remaining case=
s to pass adev and derive<br>
the drm_device via adev_to_drm(), and I=E2=80=99ll also compact the logging=
<br>
statements a bit.</p><p>=C2=A0</p><p>I=E2=80=99ll send a v3 shortly.</p></d=
iv>
</div>

--0000000000001eadc70646369316--
