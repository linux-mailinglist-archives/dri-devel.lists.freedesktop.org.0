Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DD9CDC9AA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 15:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC3310FA79;
	Wed, 24 Dec 2025 14:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="IWdD6LJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D24810FA78
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 14:57:52 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-59577c4c7c1so6406831e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1766588270; x=1767193070; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBil/1BlF+q4Dj/UPxj4gednLToiu7OKX6pIq/V68fU=;
 b=IWdD6LJV8tKy034Hs2acdPkH2l8zyTptHW5p9L68oPb5mI/MWEMWT3lBaqbxAzcR+b
 rzCHm7eOKV+w9WKdzC1P9bXCpwMbnuVqeIfzL7XgE3gdi4K7IrOGfcXFEcnWb37lOVju
 1BjlmjTwNM9m4NLWbzsUtfat6Slblw61S6HIdR+d1xg5R1L6qCXtNySd0FCoWeAMgVND
 Oz/bZIbRSMecBGE9lOUPDfEd2BFQcU3zGRk+HPELi/q2MU6djPQkILkpWQovIOrluuI6
 G82OSD6rV2RSPizE6onigD2jX8ZY9ErcMV8PE16NTwDvhZlDAx3hMASte6FSv/QgRmsm
 AdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766588270; x=1767193070;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IBil/1BlF+q4Dj/UPxj4gednLToiu7OKX6pIq/V68fU=;
 b=LKM8OAXLFrsCc01Ra/GBse8bR+PVOlK7yLfu56hcX/182JfUQHWnBg9HyuXbKvA03i
 pr+oTlFxpDxTSYHqVy7AK+7WUs7b+JoGMMBl+59KbeWXEHSTtC45i3lvqJeBwn/hFDNm
 bdxH3oLDXMtfxKXaNm729L7SDoS8IxKP3+vCHUv57qEvObwIKyprs8WaMKxfZ9v76xPA
 4xBj5nOyeSbVvm9caURJg4UcRcMF2yG7g6okfTqWvLk8NMb3/uyuQkEIxu9+b3CWHexX
 R57SAUkJZMzzav7/4Qex9R/3VTxShx5Te6hsLrEEUorjqWjDUTTeZIxL9ntUXn78P87c
 cKrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURrFi/+cISvIGmO2os4nHJORhQJX2/iwi7OBA1YXTafDhcA6pt3aQXKSciE6wDjHx4KT9gL0dh+Vg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLX0M/fZmWtIJDOk9lSZnwvUIfQBZHhcVcf7AD3ot9Q6h13WOm
 Coj1vNUckPNUhAWwDH1TAKWPdX+F1sxtBBs9R9vm19OZ1xZo3q2k1vJPxjZIQmVVO3ErLM7w9HZ
 RdUNS3BkZNWN2+nG0bws7V+IfgKLm6aSmLTTWMaFr+A==
X-Gm-Gg: AY/fxX4XjZR8pZeIAFd2a953HgFM1tFVTQaCN+dtZPLaIWfVVnDLEeF96EyXoynSpMX
 C4bc4Jo6VtXPrOnayvjEncOMHxDq9KW77aN2PL1yW8SX2VYAn/bkuHAhqL2Yd2DPsEaGxgQTDM1
 vF33KIgrIPaG5nOQDrTIn+huMyhj4El/iDZOPIiW80i8ZTorAz3Wh+2zzRLo+zITJdRe1RTT8SA
 lqwKZ4GIaN3QXzG64Vm/s6GdyW5E4Kc4OyPy+iSmW+vBq4/1IB5/khia1vMKZUAchKHWvu3Hrf9
 jQ3GAt4WGuKp/ZyGesQGcUJP5YlH
X-Google-Smtp-Source: AGHT+IEgJ4DvJza6f8nrVt6smijc7MYv+2jVVc9Xk7eZ3JyUwizr2J95vVnjlu+rq1GIIpvWYrI9MO3mpcNk8k5Vwhg=
X-Received: by 2002:a05:6512:130f:b0:59a:1482:16a8 with SMTP id
 2adb3069b0e04-59a1482170amr6611182e87.24.1766588270392; Wed, 24 Dec 2025
 06:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com>
In-Reply-To: <20251104112923.143408-1-marco.crivellari@suse.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 24 Dec 2025 15:57:38 +0100
X-Gm-Features: AQt7F2p4_5Om9G-3ifUhTGyCvRSOPvuJvIr3ZkpzQW5Po9fMVvAd8RkxxHIjK_8
Message-ID: <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with
 system_percpu_wq
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
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

On Tue, Nov 4, 2025 at 12:29=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
> [...]
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Gentle ping.

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
