Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F710AE5BBC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 07:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E9210E4C3;
	Tue, 24 Jun 2025 05:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tomeuvizoso-net.20230601.gappssmtp.com header.i=@tomeuvizoso-net.20230601.gappssmtp.com header.b="QXn5kWKX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA3810E4C3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 05:04:10 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e75668006b9so4435309276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1750741449;
 x=1751346249; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZqEyiR61C1W0/+KTWzUiTKCsg/9mevRSEFCD7wnXFig=;
 b=QXn5kWKXqFXGEuRCk5/uTswxX4dBsT8LHx5iEUG9lh7LnAIMBU+2mKyJfa9pFdP16l
 ExXhE+M4JlAameJgKzXRI7N/0TJWIFJszFFdNAznRBFmP0DBuK3qYM2k6ur79JdpNBqe
 pokccwp3IwimBy0ZOHe64ZoJ0JKqCZ5usBo/UhDB+THCE3sun5AU9vB7qBguHzx+lmBY
 MmLVyLxJQjIvLCXVShkhxnECl5qcIw4Aa/reQ1JSlaP4e2iA2AQiovUZdyoSpOp8AnP0
 rqdxNbSTzDa8xi5auwKmdHSwONyBeVYP+WmREibv8uC5z5JwOrQ0t7zjb3yRaVCPCU0l
 d1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750741449; x=1751346249;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZqEyiR61C1W0/+KTWzUiTKCsg/9mevRSEFCD7wnXFig=;
 b=th6kOsLoZ7GkyBQrMxd/X6ojVoSG/TNOcsZTDlIR9ovsmIybgN0OZ9+LdsExATKSNT
 4D2Fq6xP872BCHMIY7VlWDO6pPTzX2gNwTl35AV/UEC9MwAGw9O+tZlrqNquQYtp0hzb
 1rFwNPODoegUGDKdKUBAUkiJl2lqFgbCkVlFfreEt3A0QUk6Jg43h5oV/VsVdtqQqVls
 CYuaCvzS3PN98NFSG1gIztcLXhnWoVSIdB8aMGJH8nwCxk/z+IaqSVDr8R419Ln/sJxt
 MKnhln5KoyBBjA72sqh6btsbPLQDuOTWWjC8MvHfypsb4GZ/c5IHCMvet/BwvxhmQbay
 i9Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnKInL5ccRo7DDFWMbr6u4vHQ0Egy6A/Nm/ZtHjBnyESyqt9QvKbO3tFMz4GaBZoD23K9v5IQQCfA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytUrRr1hYYbsbnMoSfGFF0t3juufxKGZ9LBQRdKYeiES7YWoLV
 b+nJr/OERmPf0UWhmT2IK11eo3734+YhQdszTEgoeUfmkPasWEtGcoRXp1HbX8KI/VOrIoh+hMl
 zite2CZiuZQ==
X-Gm-Gg: ASbGncvkvUTdlMwfJzR56guRRcF7oOfD3AV9MNX42Ofw3jVShUWiIVIaddLfo+FWq8w
 TnusUZO8k1BdSU1g7oPsHoAUjgBSw1EmS0ItCVU2+bNP3RbYo0yZs4vrTrL55OuS7CbJuPkm869
 5kaUYbrSC0RNheVGnf5yVgGvWrhu8MdD2/ITRRYYcdFJ9xUA6cH3CpzZ9p+Z6czLyT0lLRshiyH
 G59zDLWNnn6prh1o7KJMKXI9cjwqHSnTBr77tdpEvlnUfPhIghPK0XJyHD6oZMOj43uX/NijeRb
 7HbybsPImo2z1Ddfez510xvJ5LqhNV+UNPTXZx81r0UR6hSj1iOSMPxDZC+ezrt4nCSNhdAhPvw
 IzHUEkfI6AccY5Nr5ggzQOhxK+UT3fQ==
X-Google-Smtp-Source: AGHT+IHR+g/W7bo6/oSbi4h3f0UN+ScarWgMtQlfIiJP6PMB7QTytM8ElwnzmVwQbZJHH17mUEM//w==
X-Received: by 2002:a05:690c:7307:b0:711:af14:3981 with SMTP id
 00721157ae682-712c6514a09mr226707177b3.31.1750741448820; 
 Mon, 23 Jun 2025 22:04:08 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com.
 [209.85.219.180]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-712c4be2ae5sm18612277b3.83.2025.06.23.22.04.07
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jun 2025 22:04:07 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e75668006b9so4435271276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 22:04:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzHH/tBqamrX8jDcEVLBgmyN44uPbD9EGvSNLlgK4LQImgrk2H0OBqciwvIpsgvRC7y6CAGbpf+q4=@lists.freedesktop.org
X-Received: by 2002:a05:6902:2402:b0:e7d:a012:290a with SMTP id
 3f1490d57ef6-e842bd31ba5mr17718497276.44.1750741446999; Mon, 23 Jun 2025
 22:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
 <2241399.8hzESeGDPO@phil>
In-Reply-To: <2241399.8hzESeGDPO@phil>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 24 Jun 2025 07:03:55 +0200
X-Gmail-Original-Message-ID: <CAAObsKB2tLewhCt6LWtuCW1niCPAHvqjWYAQ8t6fv9YLVsQmJQ@mail.gmail.com>
X-Gm-Features: AX0GCFuWUi05UoZnTls2Tcn0dm5ovOsTmo6J_0Og6xGh9EfBiQOG6iE0FtJ2MtI
Message-ID: <CAAObsKB2tLewhCt6LWtuCW1niCPAHvqjWYAQ8t6fv9YLVsQmJQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] New DRM accel driver for Rockchip's RKNN NPU
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, 
 Robin Murphy <robin.murphy@arm.com>, Daniel Stone <daniel@fooishbar.org>,
 Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Jun 20, 2025 at 11:28=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> w=
rote:
>
> Am Freitag, 6. Juni 2025, 08:28:20 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Tomeu Vizoso:
> > This series adds a new driver for the NPU that Rockchip includes in its
> > newer SoCs, developed by them on the NVDLA base.
> >
> > In its current form, it supports the specific NPU in the RK3588 SoC.
> >
> > The userspace driver is part of Mesa and an initial draft can be found =
at:
> >
> > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> >
> > Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
>
> > ---
> > Nicolas Frattaroli (2):
> >       arm64: dts: rockchip: add pd_npu label for RK3588 power domains
> >       arm64: dts: rockchip: enable NPU on ROCK 5B
> >
> > Tomeu Vizoso (8):
> >       accel/rocket: Add registers header
> >       accel/rocket: Add a new driver for Rockchip's NPU
> >       accel/rocket: Add IOCTL for BO creation
> >       accel/rocket: Add job submission IOCTL
> >       accel/rocket: Add IOCTLs for synchronizing memory accesses
> >       dt-bindings: npu: rockchip,rknn: Add bindings
> >       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-bas=
e
> >       arm64: dts: rockchip: Enable the NPU on quartzpro64
>
> from a handling point of view, I would expect patch 1 - 6
> (driver code + dt-binding patch) to go through some driver tree
> but have not clue which one that is.

I think Jeff Hugo would be pulling it into drm-misc? We still need a
R-b for the job submission patch, and also have the userspace driver
ready for merging.

> And afterwards, I would pick up the arm64 devicetree additions
> patches 7 - 10 .

Sounds great.

Thanks!

Tomeu
