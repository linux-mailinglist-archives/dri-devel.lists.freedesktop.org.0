Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED35898E3CE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 22:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBD810E0FE;
	Wed,  2 Oct 2024 20:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="H2gg1K3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A2F10E0FE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 20:01:24 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53988c54ec8so172079e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727899281; x=1728504081;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RTbP2THnQ7ZPSao3GlpGoyqfA8hmjwpPW28NYvs/R0=;
 b=H2gg1K3xQRepCZGrgl2qcOkUOOCGbNZoHzEEP7uFfu2fW1UlV/2+pG4HLPF7npQ/Dp
 4velwzwwBpuu0tQSYQXYh6SVW41NrnyeAuCMMg2KofojbuRnwNvWMUMgOOqTFQosd+cQ
 G4Avgopx3ITOv2jXduTIfr7MSHtTpLwA0C0XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727899281; x=1728504081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RTbP2THnQ7ZPSao3GlpGoyqfA8hmjwpPW28NYvs/R0=;
 b=k6yeZ16nFvFSJzuex+FRhhCCsamBzVUKFDBJPg6zX3TdpLYJ7QxPQ3kVyfbKjo24UX
 qfSvOoTYkm+knzvCdBdwXCEtHpzVoEQtZxWeh4b3vrAhPHX18xeVtDLSRdQbIh7awsCe
 56/1H3xnQDj2GqZ4kqG0JzO6mMdCX6PFsXVXSX5afD/2GzDPvU95KexdkvtmmqjYlobR
 rVOtmg6iZkygoMo9rYXHMFC8zvLfeaak+eo6I2TNPdbJg6Aqt647FTo9B+JlGeaYAjTh
 vppXiQAEtLXk+Shb8FcvldAL6tAvwoKuow+vOxm1MwZnkBye4R97cRevUXEqje6wuaA2
 qzvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGhJ9/wu7fihTFxgBtlkcI1JFPMk0JtkYBMOegsR9wdGUf6ChLmM2IpNYkXesLHNqQKKsSZZ7a1LA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0pCDrJtu2tU6V2GOiG7wwOyjS7VZR/BCza+4EAC0rU93dKk4u
 TUDZa3ojr3CRCsu2WdDZT2TVZkODukJtBRvVjcDTnBHO2feox6BpoS5yGlIgIoVOZJTd45T3q9r
 nFw==
X-Google-Smtp-Source: AGHT+IHxNEVOypmIpHMsWM9czEpus96MXgfWuwgw8qwFhw5J7sC3EdduAOccSSLj9XEkJZKNplKryQ==
X-Received: by 2002:a05:6512:138b:b0:536:a50a:3c25 with SMTP id
 2adb3069b0e04-539a065c529mr2797593e87.12.1727899281440; 
 Wed, 02 Oct 2024 13:01:21 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com.
 [209.85.167.42]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5399fbb5062sm401653e87.219.2024.10.02.13.01.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 13:01:21 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5398ec2f3c3so175596e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 13:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXj8tFkkMQ8YL+l2YipdUfoFF/Op07fZs95pJSzP+X9DZCh5BMNk8vZ4/w4vctkinQC0cbjufWKLR0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:b85:b0:539:896e:46c0 with SMTP id
 2adb3069b0e04-539a079eaf0mr2740940e87.37.1727899279887; Wed, 02 Oct 2024
 13:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240927094340.18544-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240927094340.18544-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240927094340.18544-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Oct 2024 13:01:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vm-MzhNrotMz1n-iYvm_VAfyVRDtTp4yrQ=6sCTzX1Vw@mail.gmail.com>
Message-ID: <CAD=FV=Vm-MzhNrotMz1n-iYvm_VAfyVRDtTp4yrQ=6sCTzX1Vw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: jd9365da: Modify Kingdisplay and Melfas
 panel timing
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, hsinyi@google.com, 
 awarnecke002@hotmail.com, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
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

On Fri, Sep 27, 2024 at 2:44=E2=80=AFAM Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> In MTK chips, if the DRM runtime resume has not yet completed and the
> system enters sleep mode at the same time, there is a possibility of
> a black screen after waking the machine. Reduce the disable delay
> resolves this issue,

This sounds _really_ suspicious to me and it feels like you're just
pushing around timing to get lucky and avoid the problem. Generally if
decreasing delays like this fixes a functional problem then the
problem is still there (just hidden) and has the potential to come
back if a little extra delay shows up.

I don't understand _why_ it's important for DRM runtime resume to
complete before the system enters sleep. Is this causing the Mediatek
DRM driver to get confused? I would have expected that if the system
went fully into suspend that it would have totally powered off the
panel and then when we resume the panel shouldn't maintain any state
from before the suspend.

...so this needs to be debugged more and a real fix needs to be made.


> The "backlight_off_to_display_off_delay_ms" was added between
> "backlight off" and "display off"  to prevent "display off" from being
> executed when the backlight is not fully powered off, which may cause
> a white screen. However, we removed this
> "backlight_off_to_display_off_delay_ms" and found that this situation
> did not occur. Therefore, in order to solve the problem mentioned
> above, we reduced it from 100ms to 3ms (tCMD_OFF >=3D 1ms).
>
> This is the timing specification for the two panels:
> 1. Kingdisplay panel timing spec:
> https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
> 2. LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LIB
>
> Fixes: 2b976ad760dc ("drm/panel: jd9365da: Support for kd101ne3-40ti MIPI=
-DSI panel")
> Fixes: c4ce398cf18a ("drm/panel: jd9365da: Support for Melfas lmfbx101117=
480 MIPI-DSI panel")
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

For future reference: please don't put a blank line between the
"Fixes" and the "Signed-off-by".


-Doug
