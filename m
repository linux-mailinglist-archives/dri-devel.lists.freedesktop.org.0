Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C0950C11
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 20:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444AD10E3DC;
	Tue, 13 Aug 2024 18:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NYKAU0mK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B0510E3CE
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 18:16:49 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-70968db52d0so6052843a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 11:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723573006; x=1724177806;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01RAQRrnky8LUTuttXkx947DobRI/6KygC35LnslJMQ=;
 b=NYKAU0mKpn5jMDCiCFRCtxfN41x+IKACVnjF4K7xVMIOiE/cncq4FRt5nKc+ZP27D5
 7BJwR6RsPhdE2C2qihpJxy88Jrm3w7+edGFhoNAE0ueTeT8ZJLSu/oKhjOucxHytMKuJ
 OKeBlB0oJ5GFJUY31GXos8isxvgrnaL3zWOUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723573006; x=1724177806;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01RAQRrnky8LUTuttXkx947DobRI/6KygC35LnslJMQ=;
 b=kYPlLslxjX5OiD1ABuu2taco/8HxMUFzH7PmttD6870bkB/CWQQEQvXyYqVPG6liii
 YXTxWVCB6GTKBMPYArVvNx552weL0+bTvgTUlcE/txEbZap+JaZqHmM2+5dDsyYkjczi
 arjiJ5qIv/DScNjyo+QIsA0SimezcOqH7G2EKVwGpwlL1Hpn2aJbBPK8wCwkPyOQG1mD
 G/txHdSBvIVuxU3MhtjA5sew4JwBIDjQ3lIthDh9yHyAjZEStU7W4S44fkNvkV3k8IMO
 MtrsVuYlCCcnKMWYCwOAzrkPpn4k0oRP0W5wFDVcqjdj+Xe9cUTkolls1C8dti68eMGE
 EMCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVITgKIH/aUgs8M7Yzk8ElwK8dWej0Jdrbf65XNi+7RbPCpNuOcY4RCLpGUPlA8o09GJFedZY/K1R4EpY2lTPE3aIoWSM+wUfpcD7QAyc1N
X-Gm-Message-State: AOJu0Yw5O83a56qv4VVtdqp+KlUlu76ZZOA1LhP907N26OcEkDON8+4e
 tceFY0vYswhr/p/dojUpt2rq13azlzbQEjBJOs5vAjH4RVmn3xltTS9l9mhXRQg/VqKjcemurqI
 =
X-Google-Smtp-Source: AGHT+IEF/dnPM7R47B2rzEtUcyEIq6mJFLgijkdl3qhIvbTSYmVyxb+dmeDaOtWWQ/AMF2AusflZHA==
X-Received: by 2002:a05:6358:98a6:b0:1ac:f00d:c8c6 with SMTP id
 e5c5f4694b2df-1b1aad61f1fmr37581855d.27.1723573006430; 
 Tue, 13 Aug 2024 11:16:46 -0700 (PDT)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com.
 [209.85.219.51]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4531c1d7cbbsm34375761cf.50.2024.08.13.11.16.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 11:16:45 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6b79fc76d03so33240126d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 11:16:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWCyXXYEVub/kWX0u59uFRF7a4pVzGkM3POGjoTdreqpvK6swHzEfSwpCPQrbo2ML+sWIilwJuBsVCMpeYJLR0U9VlZIDNep7pPIQjiCgRh
X-Received: by 2002:a05:6214:5d8c:b0:6bb:bdf0:e49c with SMTP id
 6a1803df08f44-6bf5d1e2401mr3362066d6.31.1723573004873; Tue, 13 Aug 2024
 11:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240806135949.468636-1-tejasvipin76@gmail.com>
 <20240806135949.468636-2-tejasvipin76@gmail.com>
In-Reply-To: <20240806135949.468636-2-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Aug 2024 11:16:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xqe2Fx-3Xgqxni1L+NB3-vyhD9NwrR1kMOgSn5=-mukw@mail.gmail.com>
Message-ID: <CAD=FV=Xqe2Fx-3Xgqxni1L+NB3-vyhD9NwrR1kMOgSn5=-mukw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
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
> Add more functions that can benefit from being multi style and mark
> older variants as deprecated to eventually convert all mipi_dsi functions
> to multi style.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 194 +++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     |  10 ++
>  2 files changed, 204 insertions(+)

Pushed to drm-misc-next:

[1/2] drm/mipi-dsi: add more multi functions for better error handling
      commit: 5ddb0a8aa8e4754a8fb77e284e0d6f46c2350f88
