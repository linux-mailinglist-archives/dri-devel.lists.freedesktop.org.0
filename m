Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE50F950C13
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 20:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C05910E3D2;
	Tue, 13 Aug 2024 18:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="TTboVg+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A206210E3CF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 18:16:56 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-7a337501630so378041385a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 11:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723573013; x=1724177813;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yb//bFg6w3kBWyz7jCIoc0uCU2L7eORtwe8AvBhyGXM=;
 b=TTboVg+aWUgPD+iO3TkExEGR9MkRrvBJXr6OWp+Iu4Xb7HrIQNK/7wd8//2HOrNrkw
 nqpdCgoNOfH8X+HcDOJWEQOA6HXDXwFeDmnGYKgYMkNtvVnt1i2Dbts12Mh1czmDC1+D
 SEnUSvIv9r6Zhs4iX3NTVZzXJiSKUME9ZjtbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723573013; x=1724177813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yb//bFg6w3kBWyz7jCIoc0uCU2L7eORtwe8AvBhyGXM=;
 b=rZ3Bp2r4e06HpD06GndcT/KcM9t2JPjS5CmuVBLF+O4AN6vgCLUA4Gdwsp4zrRwxT4
 wQzHVLeHJWNWXSy2Vap41tb4IyyAcSwi8TUCi94RNsaer2Ct7zDyWtj9fa7NsxoPzg3g
 DqlPx9H4ZSwEfP9TNNOx5XIftfCfcezaf4izNh3UUrDayZ+7SSPObssxbwgS3RwYN0i9
 Atwd2Vs8dhrgejZYZUcy867UTNgBGhRNh8ogT1dacZzTFCHlJYBYajDpojLuQDKU8zO5
 2gncuYWvNbBZlilKl3dnZEQnwLn7vxItohxpOexRsSTuOVA+6mcIAuuAtMIUiRdDVGiY
 rUVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAFCdQIdLD3G7Ti00ystYRlv7qStP3VRRLfOX4xD+TqEavyMROPoxSEvfEjP9uUGer7HrlktGEL60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEAihB/vjF0NSDFmsltHeC/m+90hPAS8fmCzrdQzwVZI4k8Cj1
 q9sAA5dHaRd8GOjjt1XGgZipcUnV1d/+NO3ekqQBoLr+7tdzgONPI+dZaOlBfaj8IsDeiBfMzmw
 =
X-Google-Smtp-Source: AGHT+IHCMqTN4/SYtFev0ToOg7ntrudvdvtv+UZmQORHGZDQSA4cbDN3U4aCZ9HlukalnUMLsAkyiw==
X-Received: by 2002:a05:620a:4481:b0:79f:670:7635 with SMTP id
 af79cd13be357-7a4ee3e5187mr45351085a.62.1723573013128; 
 Tue, 13 Aug 2024 11:16:53 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com.
 [209.85.219.48]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7dedf98sm359880585a.98.2024.08.13.11.16.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 11:16:52 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6b79c969329so30739876d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 11:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXCeqswSOd0ueIUpnJu9uGz6U+ckfvN/GWzXZ/mP7v/Hn9wW6qj0AJDkZ4Th9/DgyrbIZJWcDFjiOw=@lists.freedesktop.org
X-Received: by 2002:a05:6214:4603:b0:6b1:e371:99d9 with SMTP id
 6a1803df08f44-6bf5d15a44bmr3257676d6.8.1723573011530; Tue, 13 Aug 2024
 11:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
 <20240806135949.468636-3-tejasvipin76@gmail.com>
In-Reply-To: <20240806135949.468636-3-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Aug 2024 11:16:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wi9qCm3L+Cg-WxwGEm+xs-M-aKTNRvpFPs-Y3a6m4KrQ@mail.gmail.com>
Message-ID: <CAD=FV=Wi9qCm3L+Cg-WxwGEm+xs-M-aKTNRvpFPs-Y3a6m4KrQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: startek-kd070fhfid015: transition to
 mipi_dsi wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
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

On Tue, Aug 6, 2024 at 7:00=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> Use multi style wrapped functions for mipi_dsi in the
> startek-kd070fhfid015 panel.
>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../drm/panel/panel-startek-kd070fhfid015.c   | 115 ++++++------------
>  1 file changed, 35 insertions(+), 80 deletions(-)

Pushed to drm-misc-next:

[2/2] drm/panel: startek-kd070fhfid015: transition to mipi_dsi wrapped func=
tions
      commit: b080a60731ad909eae4463684acc23d322e93579
