Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E36A9A27617
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF50F10E05F;
	Tue,  4 Feb 2025 15:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LkuH/qjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18C210E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:37:51 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-540201cfedbso5202072e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2025 07:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738683470; x=1739288270; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IXRswmzs3E1pPYR4f55S4R+8P/qWlGpviWkaCfNXr1Q=;
 b=LkuH/qjGAOzngyXSpkF7EXVK5MMAWW7xo58BBvwWa5+Qt3G78/+zOCHkbAPbrGkCpJ
 7xMGsSxzIom6B0btDpuIqi8jsBxEQaPZXXkv5hY3Ynnl5Bhmd3soNoo78FtgUUfZLQEU
 LzOv17HQkMSpCb/+SqEOTRlq7EFP0u6TcL0ioGM8fdNJGZne8nr+gppIcTlBj9J2rieG
 FcFbow2AVNaCWSRIPyZ404tS7OoM5SZXB84+K6wZCY9k5eqaEnhvGUMi+oHJQQ7y2v7c
 IJq1WWyVSzLr3x+DQJE0D3ea9IGl0NNx1tCk/m6QPNDSfrZduFToh8F3gvv0yOg3gGw4
 yzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738683470; x=1739288270;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IXRswmzs3E1pPYR4f55S4R+8P/qWlGpviWkaCfNXr1Q=;
 b=jl0LYDy/3QE09P31QuRPJOTFFBpxmhfldXeqGIDTaeuLuWPyCDZsiswcaOvyidtsxi
 xrGMnjQEOjKVdAof7zDGmNJ79UVz/ra7srDuwGLrQNDKWkpFjNjquGuvXfmqdRl0gq2e
 3E3g603hNAwMWSnaHwymxWZKOh1ke1Uj6vOulc/vlyjam227oeUxdruRICCWQMgrize7
 JkRWArHsvG1P5w+s5I5I96cpPSaEdRQuAEzIcfE+xMNEFdrzXQ8veZjAlCu/5dmGng7H
 P1Qw62GM5NfQNtNl8bQ5sNerbJpH8pW0M/z79sjUrss3harw6mjoRb7WAVH1DmX1rwUX
 gsmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWndkJt1vwJQ3YnMX3FJcucAgZeHJdw6Pf4dtIZGBISNDdsC9ek8qwJTiIuCbZ1/S9eGKJF45xbm0E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxYDPVXViZotLLLM1PSRo2a7Py4WIkl/+ydwyUbrIz0yXJmG+Y
 wz6SKPEBPJ/X8P8ndu09NYNia8HarbQbXe6O8K8ts1wRVn8vBv9o5LjTJmP/GmQ=
X-Gm-Gg: ASbGnctBfu8BjxTMS9OtE9SXyVj3Yk0SfFYtVdxMlsSZLrXEml5vN3d/ID0K45opg3h
 8pCngL/KVxmmujj723dFK3eddXKMLjBE1A9M4Sgqr1tFZdmQHAJLO10x/RP78/MWxFpz7Iy8LzD
 5V1FhybL65uzxv+sY+6ZCudfes6gRT1pPWy3e9wyk6+nDT1f2/FVPkD4Fa3G3K3wM9jLp/K40Pi
 vCzuBoEn0ZEu7lzQBDCvWEcAlkxGyH8KM87KLjWEbXeivuIAIgh2XMvWBqFXsVRdIEgFlCLuvna
 fgXf4LmnyXMZX8kh35VWDwkCsYlEkzXFax8TO5XJR96leDiannGWES5bjqGviFdKty6cWOw=
X-Google-Smtp-Source: AGHT+IHBfTNkAf+lmgLZuPgndyNDwP4gVMSK0kteVAMO6RgJ3GlDWCfLBab5sN+UwkPZ9Ed5iueJvw==
X-Received: by 2002:a05:6512:3183:b0:542:8cb0:88a8 with SMTP id
 2adb3069b0e04-543e4c3fffamr8931689e87.52.1738683469609; 
 Tue, 04 Feb 2025 07:37:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543ebdf1068sm1596844e87.27.2025.02.04.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 07:37:49 -0800 (PST)
Date: Tue, 4 Feb 2025 17:37:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pin-yen Lin <treapking@chromium.org>
Cc: Hermes.Wu@ite.com.tw, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw
Subject: Re: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for audio
 stream setup
Message-ID: <2wkhsjxrlhrapu3jar4kdzddfav3epc45h4dlpq777i2bmnnqz@oel7prfwvtqm>
References: <20250203-add-audio-codec-v2-1-5c8cd72ee5bb@ite.com.tw>
 <btzdguakskos2gogmwjkz6zoquiut63kmirvdsh4yjoqqvzpin@um4hcrlnecxh>
 <9742a55aa51a461a9d5b9352db0f3c39@ite.com.tw>
 <CAEXTbpe891XQW6FsYs=uw-PanmVznp5ieeCbJWprZ-+=83KwJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEXTbpe891XQW6FsYs=uw-PanmVznp5ieeCbJWprZ-+=83KwJA@mail.gmail.com>
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

On Tue, Feb 04, 2025 at 04:10:37PM +0800, Pin-yen Lin wrote:
> Hi Hermes,
> 
> On Tue, Feb 4, 2025 at 11:49 AM <Hermes.Wu@ite.com.tw> wrote:
> >
> > Hi
> > >
> > >-----Original Message-----
> > >From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >Sent: Tuesday, February 4, 2025 1:28 AM
> > >To: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>
> > >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; treapking@chromium.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; Pet Weng (翁玉芬) <Pet.Weng@ite.com.tw>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>
> > >Subject: Re: [PATCH v2] drm/bridge: it6505: support hdmi_codec_ops for audio stream setup
> > >
> > >On Mon, Feb 03, 2025 at 02:04:30PM +0800, Hermes Wu via B4 Relay wrote:
> > >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> > >>
> > >> For supporting audio form I2S to DP audio data sub stream.
> > >> Add hdmi_audio callbacks to drm_bridge_funcs for the HDMI codec
> > >> framework. The DRM_BRIDGE_OP_HDMI flag in bridge.ops must be set, and
> > >> hdmi_write_infoframe and hdmi_clear_infoframe are necessary for the
> > >> drm_bridge_connector to enable the HDMI codec.
> > >
> > >Please split this into two commits: one adding OP_HDMI, second one adding audio support.
> >
> > This will need send patches with cover letter, should I keep patch version or reset it?
> 
> I would bump to v3 in this case.

Definitely.

-- 
With best wishes
Dmitry
