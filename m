Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C6D9401B9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 01:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284A110E47B;
	Mon, 29 Jul 2024 23:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FhZbvkhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA38110E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 23:24:08 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-52efd855adbso6027135e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 16:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722295447; x=1722900247; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XrzHUieE57O8Xm/6GB9EXPFIIeoNMve32gAhMa+3RzM=;
 b=FhZbvkhqd8ZCx8ob/PNJBG3oRJk3pr5S2b0TCyBlI2lGSwkuYnNN+R0ESdeOP3RjBA
 m0ILA2WYpJDF4er+Lp0PXoMzOR+CjAq3eedzByBFTnkBbCgsWkDtiAcd2OtrGynA2CLb
 HH3U9Cgn+Z+Yzq9bD+xJ3JZu67MbQoXbylQx9+x2xG/uhszaQY3IQOAz0skRPerkTb7E
 4whijqEI8pkirzYb7xEd5UILnClcCf30udTap2UN/fIMXVwVdCiZgI3TjEVQxDNV8/54
 a1G8weV65+/lAGNvIPgKrUXf4qOKmanPjtBRQOOtnnn69UM6TtTGcngKjHImfs+obYFh
 LZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722295447; x=1722900247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrzHUieE57O8Xm/6GB9EXPFIIeoNMve32gAhMa+3RzM=;
 b=QnULJZJmhSVmGATr/VkaMvEjMrFmth1keGPA+ckIUMxKKBG1MvaKECwd8xHoRFQZY2
 PsBNOLHvxquSw83pF5XICseXYfcYZdGukyirod76rhUUR7waXEzoOyY+JxDFdPFLeGAx
 fdqwj9ew4p9TDyBEAik5ho9AQCXF1nkuh3dpf2OmOwRgWA5IYUXfQTbBii9lRzRM0y46
 TKqYyLtJwe9WlMU1C5PEfH6fHWYJyuFI240GnXjkgZWykhAO0anlAB2Rf1qd9e4d5Ns0
 cFxrureJPNayzzWg+BPbCU+Oz9RdJvpKQAR9v2QTXgpvXch03bD7qGbeAbbslU5kIm5v
 xZ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKFv9m40kZGVxf7sK0mRnwE6btxDZ3PML39ZTPzdyNppJRxhMFLdB868D16RB2WhDJYUNounhaf9UojUuAAxWvHJfUfHa27rgptonIXup0
X-Gm-Message-State: AOJu0Ywz/8vlUdLCxvnZDC4YA/gWlKTU3eltrXjSkMYqpzI1PnCSCFIS
 iUd9+jcJTpXA9S8mAP7pDU9nTaxzxOA/fSKKJ9jknG4I/g+DCjx1uiQD9DFrs30=
X-Google-Smtp-Source: AGHT+IErWyDhMP9jROtqhZFDJFA2vlY/gpijXBfEM3ZnLqW7745VpivuWk0nzblQmCBzAIE9vgZE8A==
X-Received: by 2002:a19:2d5b:0:b0:52e:f367:709b with SMTP id
 2adb3069b0e04-5309b2c3056mr5120927e87.42.1722295446834; 
 Mon, 29 Jul 2024 16:24:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bc3f1bsm1648737e87.1.2024.07.29.16.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 16:24:06 -0700 (PDT)
Date: Tue, 30 Jul 2024 02:24:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: panel-simple-dp-aux: "DP AUX done_probing() can't defer" on
 MT8186 w/ Collabora kernel
Message-ID: <y45w6ytynovupuiwky6atwonho7r3r2hx5mnwxdifh7xvh4nr5@jxssn6blkm5e>
References: <38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com>
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

On Sat, Jul 27, 2024 at 08:33:10PM GMT, Alper Nebi Yasak wrote:
> Hi,
> 
> I have a MT8186 "Magneton" Chromebook that I'm trying to boot a kernel
> based on Collabora's for-kernelci branch [1], using a config from
> postmarketOS [2] (intended for that), on a Debian sid installation.
> This sometimes fails to enable the display with:
> 
> > panel-simple-dp-aux aux-0-0058: DP AUX done_probing() can't defer

The error is caused by mtk_dp_edp_link_panel() returning -EPROBE_DEFER
(most likely because something is missing). However this callback must
not defer, it's called at at a different point.

The actual issue seems to be in these lines. The callback tries to bind
all components, however it should not as the DPI isn't available yet.

[drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc/dpi@1400a000 to encoder TMDS-32: -517
[drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
anx7625 0-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to host.

> 
> I know this is a weird out-of-tree combination of things but I've been
> asked to report this on the mailing list by wens on the #linux-mediatek
> IRC channel.
> 
> [1] https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-kernelci/
> 
> [2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/linux-postmarketos-mediatek-mt81xx/config-postmarketos-mediatek-mt81xx.aarch64
> 
> Serial output from the system starting with dmesg and some more info copied below.


[trimmed the log]

-- 
With best wishes
Dmitry
