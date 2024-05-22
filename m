Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB668CC303
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 16:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4510E2AA;
	Wed, 22 May 2024 14:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EanB5134";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5035010E2AA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 14:18:18 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-43df732cb05so4099911cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1716387495; x=1716992295;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tp4KP5oH7k3Z3p5mvwLefK8v+H6XRCcOVGolKaP/uaw=;
 b=EanB5134R/BluNijpQXzvYfFuCn50amBSQGHHBv+ZN4peI6xe0oh71hVoKWTrGhzpU
 9rWtCbgfpsb/8KGk6RWmKcjNpf5IFpXy2WXiVqSsjuZ6Z1Z/dwQGKVRMPX4dNR70pQKl
 2c4J9awd7DYJd5xZGJSao8TBBSu3998v1zdWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716387495; x=1716992295;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tp4KP5oH7k3Z3p5mvwLefK8v+H6XRCcOVGolKaP/uaw=;
 b=KxNECxlRVmBl8yf2Ro1QPQheR+NUA+sgoO3ySk/zglKwrlMh4lk5QDLHVlU5LUSLU1
 65q/abYscgWLQyYOwpifqFtDwChJYkS+AzvdTfxnbggMjVj9VRyFHoA0VLVIgkMepfFt
 7YderhwgJQBQorISdJ2s1fPOhxNF4bjQofISFGof9IpAd9CEh0H6sp1DmNkUloRt4N77
 jZaGWMPNnd1nY51TQeE+SCEGna9piuM+ftZuOywYKMER1znwn1QGUi+8YYKyRyBDA+P3
 pIk33yWQWY4yKr10ayusFnjv8xb1N/LqpDyKuoxJUMX8q4+HLHwaIkPxGL8arRNX6tdc
 FqRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFJKa27n9z5jEJd5kMFb+Gl/xbOlcYG9OcaRfhGDXJFC9t2FuKr2y8oMiAItle98ndGP2pvN2AnZYwktJXtX/PzvkdoO9YdO/vvqgx/u9D
X-Gm-Message-State: AOJu0YyNV0bYSR2J8u7JxJ4EWL/+7LejkjzIQwsJnH8A3bL1CAIFNFhe
 gFM+HNXLSlFt79ZC3CISL4/jleDOoxHRkgPbGu0iX1XZEC00TVF0Z7pKoiNx9VOiTL3GQg/Awmg
 =
X-Google-Smtp-Source: AGHT+IG4kjMpBKSW7qjl8EqazNFKhNv84O7JXs/O+nlwSHYdjXpkg+Szj+q/uE1KebZd9E6D8HCp1A==
X-Received: by 2002:a05:622a:449:b0:43a:db0c:e7f0 with SMTP id
 d75a77b69052e-43f9e0de654mr21588301cf.29.1716387495410; 
 Wed, 22 May 2024 07:18:15 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df56b32c8sm171337541cf.77.2024.05.22.07.18.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 07:18:14 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-43e14f0bd75so392891cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 07:18:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUY2m1O1c2HxInB/YvrFyJFIMV8O7ZQ2U4t17pBf7SBJdtyGWAxlUYaGSupDBxt+hqIvreivsdxWlnmyKmywgem2FkqT+ejrDOcjGH4l3/q
X-Received: by 2002:a05:622a:5a97:b0:43a:b187:6a7 with SMTP id
 d75a77b69052e-43f9d3de508mr3824681cf.28.1716387494000; Wed, 22 May 2024
 07:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240522113924.1261683-1-zhouhaikun5@huaqin.corp-partner.google.com>
In-Reply-To: <20240522113924.1261683-1-zhouhaikun5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 May 2024 07:17:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XruLcUq+4Y=tpVKREt3zeO5pjyzP-SH91ghJR8rfWZCQ@mail.gmail.com>
Message-ID: <CAD=FV=XruLcUq+4Y=tpVKREt3zeO5pjyzP-SH91ghJR8rfWZCQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: Add CMN N116BCJ-EAK
To: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 daniel@ffwll.ch, airlied@gmail.com
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

Hi,

On Wed, May 22, 2024 at 4:39=E2=80=AFAM Haikun Zhou
<zhouhaikun5@huaqin.corp-partner.google.com> wrote:
>
> Add support for the CMN N116BCJ-EAK, place the raw EDID here for
> subsequent reference.
> 00 ff ff ff ff ff ff 00 0d ae 60 11 00 00 00 00
> 04 22 01 04 95 1a 0e 78 02 67 75 98 59 53 90 27
> 1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
> a6 00 00 90 10 00 00 18 00 00 00 fe 00 4e 31 31
> 36 42 43 4a 2d 45 41 4b 0a 20 00 00 00 fe 00 43
> 4d 4e 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 4e 31 31 36 42 43 4a 2d 45 41 4b 0a 20 00 98
>
> Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...pushing to drm-misc-next...
