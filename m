Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D07334A3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 17:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC2410E648;
	Fri, 16 Jun 2023 15:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DBE10E648
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686929001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lA4WetjOkBjPwCImnk3E1z+blRFlganosEwAAK5HqlQ=;
 b=dB1l6AhXDFPUlEJq2xEfid5BbEArSxOaRSHzQ1u75kzebIfKY4rNDHq0fJIgldwamQViqV
 qTMhNa0qBi8Bz1xHPvOHjSK4zz+EMDlGYgH7kkTt/n2+HjsXT3HTXFKNskQPD3+zRp4YDX
 Hc5Qoe/XBKQi4zoMcU7DJhz5VwCyyNE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-bBsBuk1zOWS6puaPgoTiTA-1; Fri, 16 Jun 2023 11:23:19 -0400
X-MC-Unique: bBsBuk1zOWS6puaPgoTiTA-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-57008cbc58aso10398187b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 08:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686928999; x=1689520999;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lA4WetjOkBjPwCImnk3E1z+blRFlganosEwAAK5HqlQ=;
 b=bn5uKA0Sg31UpfuB/UOM3lQ3UzkDF1UspPAs2UDp3DdYNUtNUjHac7z9V1h7EJn7os
 Kb6UGKG5U+sEVnzowRqenI4pZoB3ar9Yh8JrreqDKviTm2sgSoYXgmWhV+A8CtKSSktl
 h8luSsxTiz6Dda0TPwzd29t5Y+dRTDsq05GEhEAH9SxRCsuebWgOBPKBnHSIcW4soX1f
 BPt8nmJIrLBWlzQ0yIMl3eGsGSJNrgAkxo6xG6FYuTHFAixYefy7yKo2z7zfHE3shyNd
 QzbNlA7ssscEF+LAlDYCoVGVktCnWjWz6QFwmlMYHFL5H+4nfOBmBCEnl2zJEot/o04q
 gnkA==
X-Gm-Message-State: AC+VfDy5V6CI3L+8swJYRzciwnps0z0IX/Jiln5oR7TmbuB/tvGQRPmm
 VhqyOrYl1poXBV2idKzE/c2ZvSLJZTq0uDm+SiWw5vej4lkeAPpfeBP767u6ieQNNdcuXuGyiSM
 A+KF8y0Ddrt3UK6mfXEkqXD1Q+A0O
X-Received: by 2002:a0d:dc01:0:b0:55a:18e2:cdf9 with SMTP id
 f1-20020a0ddc01000000b0055a18e2cdf9mr2220619ywe.49.1686928999374; 
 Fri, 16 Jun 2023 08:23:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7NOTCKCTI0yyuQ0+PMG4jd1bn9GV0P6GZZ962o5J8zX2cgNyFC6rRy/x9Cnu6fAalYWPOdIw==
X-Received: by 2002:a0d:dc01:0:b0:55a:18e2:cdf9 with SMTP id
 f1-20020a0ddc01000000b0055a18e2cdf9mr2220605ywe.49.1686928999136; 
 Fri, 16 Jun 2023 08:23:19 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
 by smtp.gmail.com with ESMTPSA id
 t66-20020a0dd145000000b0056d2dd6c5bcsm3164519ywd.89.2023.06.16.08.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jun 2023 08:23:18 -0700 (PDT)
Date: Fri, 16 Jun 2023 11:23:16 -0400
From: Brian Masney <bmasney@redhat.com>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH] drm/msm/adreno: Update MODULE_FIRMWARE macros
Message-ID: <ZIx+ZHXTRGe3j4sh@brian-x1>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: freedreno@lists.freedesktop.org, quic_akhilpo@quicinc.com, sean@poorly.run,
 ribalda@chromium.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 konrad.dybcio@linaro.org, joel@joelfernandes.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Juerg,

On Fri, Jun 16, 2023 at 02:28:15PM +0200, Juerg Haefliger wrote:
> Add missing MODULE_FIRMWARE macros and remove some for firmwares that
> the driver no longer references.
> 
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 ++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 8cff86e9d35c..9f70d7c1a72a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -364,17 +364,32 @@ MODULE_FIRMWARE("qcom/a330_pm4.fw");
>  MODULE_FIRMWARE("qcom/a330_pfp.fw");
>  MODULE_FIRMWARE("qcom/a420_pm4.fw");
>  MODULE_FIRMWARE("qcom/a420_pfp.fw");
> +MODULE_FIRMWARE("qcom/a506_zap.mdt");
> +MODULE_FIRMWARE("qcom/a508_zap.mdt");
> +MODULE_FIRMWARE("qcom/a512_zap.mdt");
>  MODULE_FIRMWARE("qcom/a530_pm4.fw");
>  MODULE_FIRMWARE("qcom/a530_pfp.fw");
>  MODULE_FIRMWARE("qcom/a530v3_gpmu.fw2");
>  MODULE_FIRMWARE("qcom/a530_zap.mdt");
> -MODULE_FIRMWARE("qcom/a530_zap.b00");
> -MODULE_FIRMWARE("qcom/a530_zap.b01");
> -MODULE_FIRMWARE("qcom/a530_zap.b02");
> +MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
> +MODULE_FIRMWARE("qcom/a540_zap.mdt");
> +MODULE_FIRMWARE("qcom/a615_zap.mdt");
>  MODULE_FIRMWARE("qcom/a619_gmu.bin");
>  MODULE_FIRMWARE("qcom/a630_sqe.fw");
>  MODULE_FIRMWARE("qcom/a630_gmu.bin");
> -MODULE_FIRMWARE("qcom/a630_zap.mbn");
> +MODULE_FIRMWARE("qcom/a630_zap.mdt");
> +MODULE_FIRMWARE("qcom/a640_gmu.bin");
> +MODULE_FIRMWARE("qcom/a640_zap.mdt");
> +MODULE_FIRMWARE("qcom/a650_gmu.bin");
> +MODULE_FIRMWARE("qcom/a650_sqe.fw");
> +MODULE_FIRMWARE("qcom/a650_zap.mdt");
> +MODULE_FIRMWARE("qcom/a660_gmu.bin");
> +MODULE_FIRMWARE("qcom/a660_sqe.fw");
> +MODULE_FIRMWARE("qcom/a660_zap.mdt");
> +MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
> +MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> +MODULE_FIRMWARE("qcom/yamato_pfp.fw");
> +MODULE_FIRMWARE("qcom/yamato_pm4.fw");

You should rebase this on top of the latest -next since the a690 needs
to be added as well.

Brian

