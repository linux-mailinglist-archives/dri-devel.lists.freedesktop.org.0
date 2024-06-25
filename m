Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BF591670B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E2210E636;
	Tue, 25 Jun 2024 12:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wbtr00yN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B2E10E636
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:12:09 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-52cd6784aa4so4475014e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 05:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719317527; x=1719922327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JUWxLKV9ZU1i1HqEH7t4Y8lzNFBtk5FDAR2lcVEnJ+o=;
 b=Wbtr00yNAjKgfjX0zoP1hD/n1ftRs/OM5D19mkhTd9Qwln0KXFJbS9kQ1cXDZndxLY
 haoe8egAPO7LZzBN6eI0TH03O+sIw+gPm5JK48zMt0114PiaMxjKRSIO94wQhuyDYCZh
 6wd5Z4w12iLsXONuMqWuKvbvD7eYQ8d6K7qwthmaZY1vQqva+lobd/jlmqSJan7R7Uu9
 liU4l87I1Apsi/paFtomQ/Op3XBp0g2Jh2wLUTmuQWz/cud6mNBHLnWBs7NcSNKrlQgD
 TgKrToll2IruGru4N3zNecBjjvagl4P4LF1/f1ghWRP9WLNB6M+BxnUVre3SN+5MXm66
 24hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719317527; x=1719922327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JUWxLKV9ZU1i1HqEH7t4Y8lzNFBtk5FDAR2lcVEnJ+o=;
 b=orcgJ2wxD4esOf9uzFeKu3XzOuMZvly1SuA6PM1vGBkKG5b1C0pEW8VPoRlQe1Ll35
 jiGH+BbMCrshUhKL5Ky2ehVOovzz7x+kOPqlavmSOqftit/5Ifpejdo1OPGmsthAPC2F
 vt+Sb2LJXOkRDsoCz4puMDzpKEv7ApJZPObIZEmdaTtg3AgrE8ZB5L6nA1Nh0KlkTqaK
 Pb2TFu6WJTXnYSbcMu3iHZA6/Mr/l307pTKQwzBDSVuPAsG9kRnKbef+ekRU5cvDW4O5
 R0/TST0okUapBE6oWRvg5Po0Bpjh40JmyAxTLOgUd3d1fP2B6XoZ3cVs84J1VmLZqU/+
 P6rQ==
X-Gm-Message-State: AOJu0YxyaYfqPGSv4n1WfAphPvABxQY8Atj5ZPQ/fq0ZCv2ux7N6kFbh
 j3lo97GGcdNZAMkwQ/B8dOxXlWoUgx2cazSTu8z4mGt7IttQcr+tcNze7qr3NTo=
X-Google-Smtp-Source: AGHT+IH80A0Q/I9cA3o4S8jLtTyDN052E3s8QDSrLmqKgOdam+ij6v1cwzCOFUinugK9U/0pYOmD/g==
X-Received: by 2002:ac2:4838:0:b0:52b:c27c:ea1f with SMTP id
 2adb3069b0e04-52ce185faa8mr3746809e87.55.1719317527555; 
 Tue, 25 Jun 2024 05:12:07 -0700 (PDT)
Received: from eriador.lan (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63bcef1sm1214808e87.72.2024.06.25.05.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 05:12:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] drm/connector: hdmi: shorten too long function name
Date: Tue, 25 Jun 2024 15:11:57 +0300
Message-ID: <171931750561.3859266.10071770084943744269.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624-hdmi-connector-shorten-name-v1-1-5bd3410138db@linaro.org>
References: <20240624-hdmi-connector-shorten-name-v1-1-5bd3410138db@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 24 Jun 2024 20:39:58 +0300, Dmitry Baryshkov wrote:
> If CONFIG_MODVERSIONS is enabled, then using the HDMI Connector
> framework can result in build failures. Rename the function to make it
> fit into the name requirements.
> 
> ERROR: modpost: too long symbol "drm_atomic_helper_connector_hdmi_disable_audio_infoframe" [drivers/gpu/drm/msm/msm.ko]
> 
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] drm/connector: hdmi: shorten too long function name
      commit: 06ec7893a4b48a1fad9e94cb670862ddd65b6eab

Best regards,
-- 
With best wishes
Dmitry

