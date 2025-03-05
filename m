Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50144A50197
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:17:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D4110E783;
	Wed,  5 Mar 2025 14:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ccZmPUTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92F310E783;
 Wed,  5 Mar 2025 14:17:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43995b907cfso44349535e9.3; 
 Wed, 05 Mar 2025 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741184255; x=1741789055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BvAmhIp672FcTh8QydCVgJQ9OGkof1lTKDgnIKxGf1A=;
 b=ccZmPUTAuB6FGT/WmFihbqfBTkbC+bCVx6qUfvVH403xinZc4ampmwC8eb9COY/qFK
 jC50BSm3wmcbmBtOKbWIuXmvuATd+dRVawEY6GJKDUImDarEWN5fY7FvY0TpNls5wv2A
 AHFiYnNCRaQhxxqLuK9OFz25mJrd3C8BBXJIo/cP+V/c1iu9CGCvFgCNHFYkdRIeFGTm
 UAqz0oHhZ+agWNt+FkGE5APDp+vpkp72OQxFYsts3J+8xjy8r7AqqGaBz7PErI5VsXjO
 IKE9r+wTRE5CqqVkQ7KQd6QquyFZYVSRda3iG/dthkS0HDpzXYrPbLOi8rPKePc3DR6e
 /5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741184255; x=1741789055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BvAmhIp672FcTh8QydCVgJQ9OGkof1lTKDgnIKxGf1A=;
 b=ofKuWjMXAwBt1XcetywNY4wqHXv5E9kiiQXWubWMguNVXfSi2HDV9JkFrU6tSRfGkZ
 zUar5LrC/zFkUoC5FoiRSn4ALbn/dH6fnsmYnBjnUu0VjxPxDz0ljkPzwwrS4Mbe2jji
 jKOeTKcPhc7AN5fNJk76LL8juUlpXKb0Awba805jtpPuEh4OpzjUAqk54b4vqeg1krha
 EzyYsjxXaYCBNNTKrhRLVU95CudHrnT6JY6AGgxFKrBtJmd/TiG+pFT3W6pySt1uwbd3
 z+utFTBQj0npX6V2SEHsvqu1GfXc+PnTd/bDVTNFX822Pv+mjsSjMPkY8Pv5kDXIl4uA
 E7nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmj1fOP8v8PTb4FxvgMo53OFksuHiBnxqOlRVv87DrcJ+rNeJAq0btMnGRFWvNHDJ/f4J2oW4TYW5i@lists.freedesktop.org,
 AJvYcCXCVdoqzihA6EpCz/x+Gf+51eEkJlDmmodBaDHqT/8FfF5lK/8CU1E/8y5Sn4fxNcaP21ykVjW10pE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxlzalhfB9gJlJLsIhnANBcrEPFJHuLJlJlNsZrMQs/z4hYNjhL
 qF5DHydgLiAbwPOIVqU1ibtbvRinGQQwnFOK5NtfBkqyrJIMTQpx
X-Gm-Gg: ASbGnctNRoTfgZ+6K/L1xfgq9j+o6WL0GQvjCb5zArVbGI8xq4nG6SOV463powCdf/o
 aKhX8pmTd+mfVt39HLTYwQP+4sTSnkFVKMRpm0edboqPtfuwYum5hLq6zEd3PVYLw7ERtDAOqa1
 ApeuBGBdYAKNo8cz/I+yXXbkGazipjtrh7e87HGsYj50P2q5gN2bjbr2EsyP6AJrJn8Wb0OmAcb
 bjNSuT8kZfym/dq9N5rHqRxifoevl9vw1IfKjeRMTTROCx14an20TINuXnkeYAZjYiVRNGyiXSr
 gUAYTisq2MvoRw+9QA2TdS5u8+ngHhUYErjolYlcbf3lYGLwcEq3I7tamxAvraQKFBSKIjkfhyB
 Vmhpu04c=
X-Google-Smtp-Source: AGHT+IHvrbtQypROMlLTHn2hwI/hJh1CATinBr60gY+FLSdoAnk3R75qGQ0/XKEyAvFG+ldQ1Dh+tA==
X-Received: by 2002:a05:600c:35d4:b0:439:9f42:c137 with SMTP id
 5b1f17b1804b1-43bd298f9fbmr29484425e9.11.1741184254319; 
 Wed, 05 Mar 2025 06:17:34 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4291ffbsm18687465e9.15.2025.03.05.06.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 06:17:33 -0800 (PST)
Date: Wed, 5 Mar 2025 14:17:32 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, kernel-janitors@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, Marijn
 Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>, Vinod Koul
 <vkoul@kernel.org>, cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?UTF-8?B?4oCcdW5kZWZpbmVkIGJlaGF2?=
 =?UTF-8?B?aW91cuKAnT8=?=
Message-ID: <20250305141732.26b91742@pumpkin>
In-Reply-To: <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
 <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Wed, 5 Mar 2025 11:51:59 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> > >>> The address of a data structure member was determined before
> > >>> a corresponding null pointer check in the implementation of
> > >>> the functions =E2=80=9Cdpu_hw_pp_enable_te=E2=80=9D and =E2=80=9Cdp=
u_hw_pp_get_vsync_info=E2=80=9D.
> > >>>
> > >>> Thus avoid the risk for undefined behaviour by removing extra
> > >>> initialisations for the variable =E2=80=9Cc=E2=80=9D (also because =
it was already
> > >>> reassigned with the same value behind this pointer check). =20
> > > There is no undefined behavior here. =20
> >=20
> > Is there a need to improve the wording precision?
> >=20
> > There are words which denote a special meaning according to aspects of
> > the programming language =E2=80=9CC=E2=80=9D.
> > https://en.cppreference.com/w/c/language/behavior
> >=20
> > Dereferences of null pointers are treated in special ways. =20
>=20
> This not a dereference.  It's just pointer math.

And the 'fun' starts because NULL isn't required to use the all-zero
bit pattern.
Regardless of the bit-pattern, things like (void *)(1 - 1) are valid
NULL pointers.

Of course, while C allows this, I doubt NULL has ever been other than 0.
(It was 0 on a system I used many years ago where the O/S invalid pointer
was ~0.)

I know Clang has started warning about arithmetic on NULL.
I wonder when it is going to start warning about memset(p, 0, sz)
for anything that contains a pointer - equally invalid.

	David
