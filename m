Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0069744E1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 23:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B2310E080;
	Tue, 10 Sep 2024 21:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ku8wOsHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68A010E080
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 21:33:50 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7a7f8b0b7d0so305783085a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726004029; x=1726608829;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UcLyo9qz2j7Y9T1HkAzmlsK07Giu2sYtTKhQoC98CTQ=;
 b=ku8wOsHwpJSjjMvwMGinOvyGTAOA4fsJGwt7U68fbfVhVgJRqO525x1yQhnim0Hqzy
 +fYNvHv8h9AKVW6KA6rZsom4IsDcNbBXfjJQ+Q+QKosLW0O2hFfbkZSfc6T8W0csOcSr
 hDbB705psmFT0/yx285NqOgV5o0B50jrMjqGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726004029; x=1726608829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UcLyo9qz2j7Y9T1HkAzmlsK07Giu2sYtTKhQoC98CTQ=;
 b=cDBpsH9oYbZNeTIQPqcwjAsJhvW2NCKwLWWF9QylEqoBpa6g1tUZoJA6c8XsmXY04Y
 lq5VdXh8V3NXmgf5srNWHP7aL5tixMBXkNKfKtc7T1p95CyBrcf2w9bVuOhy++dslo+t
 KJn9Y4eDuHQh5zoEjDkHpQj+fHHnUfaRayHHjIlvgZGgLHmHG86DBsm9Lnfd6tib2WRF
 pavG56/keK687IRXkur/kVJkSRTIwbOaxsXzaKR7Q3neS4y7GnjVrntGlGptuKadWTiD
 l4J2ZcA19Ot01SJgrbUhpWqLS1fW+eNSVz2mEgm2WVvugtlCGAUKBrHWrqSAAc7bE0QE
 N83w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaGns0c59vg/jkdHu0C1wTIege3ErnPMMhUcjZJ7R7PXH7Otz76edY+KaoFeYErQAqTlYvnCNiWeA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxzUF+NFs25vdrgmYEB8scdugMPfz2r/8agI/gUaMYEWKtRB+7
 L3Tg7r9pgNSqb7Z39f2VNAmpHRWwodtJuR2X6Sr/PVNNQ/uJOvGKDeP6HlYsjijuAFTBgsCN48o
 =
X-Google-Smtp-Source: AGHT+IG8OEJALZwQ7LkO4MtODP3q6DwnJioj8wDSu/2NUsHxy1HdInDhshkUlLyWJm8k1TwhKUCkfw==
X-Received: by 2002:a05:620a:370d:b0:7a9:d0d2:a5fd with SMTP id
 af79cd13be357-7a9d0d2acabmr240843785a.49.1726004028774; 
 Tue, 10 Sep 2024 14:33:48 -0700 (PDT)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com.
 [209.85.219.49]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a9a7a1f48asm341974685a.118.2024.09.10.14.33.47
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 14:33:48 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6c352bcb569so27062686d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVm6Le2XhdUugqDNtWJhkosbL+uJBh/L1W10mIByR7RJl/c7RIoHsr/kTK+SLgEIHC8cT1URsK/IkE=@lists.freedesktop.org
X-Received: by 2002:a05:6214:590b:b0:6c3:657b:4111 with SMTP id
 6a1803df08f44-6c52851ac83mr269171416d6.52.1726004027447; Tue, 10 Sep 2024
 14:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240907140130.410349-1-tejasvipin76@gmail.com>
In-Reply-To: <20240907140130.410349-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 14:33:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VMAUB4yiOZto9_iJ8rbQHtLsfiDF9K8KSvdac9brJ2Gg@mail.gmail.com>
Message-ID: <CAD=FV=VMAUB4yiOZto9_iJ8rbQHtLsfiDF9K8KSvdac9brJ2Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: raydium-rm69380: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sat, Sep 7, 2024 at 7:01=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Changes the raydium-rm69380 panel to use multi style functions for
> improved error handling.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-raydium-rm69380.c | 95 ++++++-------------
>  1 file changed, 30 insertions(+), 65 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
