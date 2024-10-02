Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7AB98E3D5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 22:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB8410E436;
	Wed,  2 Oct 2024 20:02:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="T1KFNIzy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2267710E436
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 20:02:41 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5398f3be400so188308e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 13:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1727899356; x=1728504156;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91dAvx/GtXFhViAEPrc2ya71jT/cwYu2QCMwf3YXBnA=;
 b=T1KFNIzyYJJEs3rRD/sw/tOUvicgRbx0s/5pQBmHfiyaR3Xp3evFMUf7vf/ydQjMeU
 ftfc54nbRtuRJhJJsS8BLpHPECIpjgJFVbATy2rBMah0Q0086XVoA3nHtVaYPge5GZ3c
 2TRVFWvIhJxDNKzTioPZIri7V8ffyNrs4jK20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727899356; x=1728504156;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91dAvx/GtXFhViAEPrc2ya71jT/cwYu2QCMwf3YXBnA=;
 b=GdcpOzbkOaQ3vgAZ5Zvs9mZ2LoKb8hMRStITwCGc6STYftKFC8ve5xrUjikHIJYlvt
 hxUgODUJ4S9fC+0hVfm2C1b1tXIffN3rQShX9iKl0MVBQq7h3UT1vrfZPDvMuJNqo4ZR
 hsBZEYSg+Mwo88xb+O8wW1vO+E/39P3Z0iNBDiNU4Gyb3OM2Q0mVT4XvKUKHGSQ1rW+f
 M8G9/sGrhOtMr+GShBc6Sjf9w1JhgDqAtcgt3MqXwc+oO4LQJSF6p4L1fnsMsI3LM6Lk
 02X7uzHNcqGWnze/9uUyS1No1D7eUYeQ1/HDQq8n4qCKwVjDiqV1H4kmeqoIOOe/j6UP
 POsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0dSf4k/D//9oHEI0Il1YFfj516tcYjqDczBnBaBsx1+BRy89hbKG7D9GfQpZ97QMw7Q+sOfLYjXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdVTpvnZI+2YfADrq0qbvgs3UNJ+AF6b2pEs8sJ7hOCrqKk3wi
 EYNmod6MXSlYbvDUOXwdn5mQdshL61TNT77TdLqlvX2yicUkvUb7/S8thJRIlljvh0/M+DZDQ9B
 l3Q==
X-Google-Smtp-Source: AGHT+IHtC6bul2QEkmpT55ZYdVyP18x39fFuzfl7D1XJ+yeXv94hi3UzGtdVFI9jBFgl+KFJZv2S3A==
X-Received: by 2002:a05:6512:3d10:b0:52e:faf0:40c with SMTP id
 2adb3069b0e04-539a065ebbbmr2930301e87.3.1727899356406; 
 Wed, 02 Oct 2024 13:02:36 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a043219csm1986293e87.150.2024.10.02.13.02.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2024 13:02:35 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-537a399e06dso171398e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 13:02:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTI3krPzcIxTZAD9KAUbnbnzdtG8vNPuXF2M/Y/JvEq4gde5icWrQgB+pww+wtt3Re/+Njz2RNdC8=@lists.freedesktop.org
X-Received: by 2002:a05:6512:3b1e:b0:536:56d8:24b4 with SMTP id
 2adb3069b0e04-539a065eb21mr2856666e87.5.1727899353357; Wed, 02 Oct 2024
 13:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240927094340.18544-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240927094340.18544-3-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240927094340.18544-3-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Oct 2024 13:02:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTOCNtvvT3Z-5-7eRnFt4Um9R+vq2BB+V7DhWngsKrWA@mail.gmail.com>
Message-ID: <CAD=FV=WTOCNtvvT3Z-5-7eRnFt4Um9R+vq2BB+V7DhWngsKrWA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: boe-th101mb31ig002: Modify Starry panel
 timing
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

Similar to patch #1, this sounds very suspicious and I think you need
to root cause the problem and submit a proper fix instead of just
playing with timings.


> The "backlight_off_to_display_off_delay_ms" was added between
> "backlight off" and "display off"  to prevent "display off" from being
> executed when the backlight is not fully powered off, which may cause
> a white screen. However, we removed this
> "backlight_off_to_display_off_delay_ms" and found that this situation
> did not occur. Therefore, in order to solve the problem mentioned
> above, we removed this delay, and the delay between "display off" and
> "enter sleep" is not defined in the spec, so we reduce it from 120ms
> to 50ms.
>
> In addition, T14 >=3D 120ms, so we change
> "enter_sleep_to_reset_down_delay_ms" from 100ms to 120ms.
>
> The panel spec:
> 1. https://github.com/Vme5o/power-on-off-sequential
>
> Fixes: e4bd1db1c1f7 ("drm/panel: boe-th101mb31ig002: Support for starry-e=
r88577 MIPI-DSI panel")
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Similar to patch #1, no blank space between the "Fixes:" tag and the
"Signed-off-by:" tag.


-Doug
