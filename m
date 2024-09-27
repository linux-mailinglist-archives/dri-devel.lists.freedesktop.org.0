Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A200988391
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 13:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A1710E1FE;
	Fri, 27 Sep 2024 11:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mEwoWO8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB2310E1FE;
 Fri, 27 Sep 2024 11:57:58 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2e07d87adc2so372634a91.3; 
 Fri, 27 Sep 2024 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727438277; x=1728043077; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/00YoVmyxoQD04QF3B+FPA5cgwCGWAPgMWHF0NDU/mM=;
 b=mEwoWO8RMm9mBj88ZZ5J6kzegJzko0OJOU6loijISJ0RtxANlRffQqa0ODNZGmAGsK
 wIwpuqf7TX0jxdMa1LwBDRIALPi0+hfLsOTiC9my3Kg78Llrab2yPsWyktwMZlmJpaJS
 cNi0uGczV1gEW03zGTBSi1ekA/zouheDZbbCdEBOdF4Kv6nsla7T5DhKtUrCfVG+1s9M
 b1akE1o6SokAr+yendMly+z/dfFOKIL7WbTj4hi64roRmgSHvYIwon/wRV5aXWxmwBDI
 PBfudBRKL+vw1X7/sdxSAN4f+SY32xd2hhYgfljs1iCL4jSU9yKSu7W/BElA6737c9D4
 2lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727438277; x=1728043077;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/00YoVmyxoQD04QF3B+FPA5cgwCGWAPgMWHF0NDU/mM=;
 b=q7Q4WNp+7e7P0c3j/iv9CgrFA2JV9hH8+SoEnmEjKFXDP5TN7Vgy2rRMyVycNq97R+
 wcXqZxB8wne4gkHub2HbUk25Wm9ASmvw6uCq1u3pP45iYaoJ23pC+s/1dBADida/Ml+t
 OiI8Iik1f5zOVP5JWu+VcHwLzKWQj0PQlJ+tJi0IgnJco3XoOnf5YU8jAqRGzfps69Ab
 hPju26IkF9poC8SfMbcMBFp7X/OhQ7y+6gDnCDK3HNDBIzKwtg7xL1NLyHj72wnennbi
 +WGtnmECWYOrnRnR+i4d+BPywW0VLkNWwD+XbovyjuQQbzB0+49wTKeaOhQ+rPqVl0N5
 azyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY0aoGhWkUek0ZI6LYpLNjLyc4ppxyiZ5YnuGDSFNFCmVSB/+CL26XwzwAsgchd+FBpC0MiVqQuYVZ@lists.freedesktop.org,
 AJvYcCWiDwhdPYaRHfieXAwz0TI/Yh4jn1ChpDNeCvL6SSzaqjneLCsw5pb3FkmiigEUfAxYNn0e0srjc+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPWLtxgtYBiAmOE857pD8vPEnxXvJeDhlo9fQ0URQEP/x7tb6Z
 LG/4M7S0ZJ/BEu/NFgTv5+jo89lVokIioTNSqDx1cBBIknPgCu10c/Ex7IkjnGTVult9eV/YcDZ
 rEfxiZVlrUCD19+GG763kcaHJdkE=
X-Google-Smtp-Source: AGHT+IFMYD0OH+mms5PX41lPPzr/Ohq/r9pchznWtwGPOOpsDLVNm08dDIYqmANikx8KUubtMRcg72JLma6cxaU0Aik=
X-Received: by 2002:a17:90a:68ce:b0:2d8:e7ef:7d23 with SMTP id
 98e67ed59e1d1-2e0b8d7c62cmr1427986a91.4.1727438277454; Fri, 27 Sep 2024
 04:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
 <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 27 Sep 2024 12:57:46 +0100
Message-ID: <CACu1E7HEZztQ3bctuVdrwLCVY2oJ_01AyeKdwCuuB6gmsPurpg@mail.gmail.com>
Subject: Re: [PATCH v6 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

In the future, the right thing to do is open a mesa MR with just the
register changes and then copy the file from mesa once it's merged,
because all of the XML files are supposed to flow from mesa to keep
mesa and the kernel in sync. I've opened a mesa MR [1] based on this
that will hopefully get quickly acked and merged.

Connor

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31422

On Thu, Sep 26, 2024 at 10:17=E2=80=AFPM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.
>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/=
drm/msm/registers/adreno/a6xx.xml
> index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975=
dc1034f6b7a2e41 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
>                 <reg32 offset=3D"0x0" name=3D"REG" type=3D"a6x_cp_protect=
"/>
>         </array>
>
> -       <reg32 offset=3D"0x08A0" name=3D"CP_CONTEXT_SWITCH_CNTL"/>
> +       <reg32 offset=3D"0x08A0" name=3D"CP_CONTEXT_SWITCH_CNTL">
> +               <bitfield name=3D"STOP" pos=3D"0" type=3D"boolean"/>

This bit isn't set to 1 when it's stopped, it's set to

> +               <bitfield name=3D"LEVEL" low=3D"6" high=3D"7"/>
> +               <bitfield name=3D"USES_GMEM" pos=3D"8" type=3D"boolean"/>
> +               <bitfield name=3D"SKIP_SAVE_RESTORE" pos=3D"9" type=3D"bo=
olean"/>
> +       </reg32>
>         <reg64 offset=3D"0x08A1" name=3D"CP_CONTEXT_SWITCH_SMMU_INFO"/>
>         <reg64 offset=3D"0x08A3" name=3D"CP_CONTEXT_SWITCH_PRIV_NON_SECUR=
E_RESTORE_ADDR"/>
>         <reg64 offset=3D"0x08A5" name=3D"CP_CONTEXT_SWITCH_PRIV_SECURE_RE=
STORE_ADDR"/>
>
> --
> 2.46.1
>
