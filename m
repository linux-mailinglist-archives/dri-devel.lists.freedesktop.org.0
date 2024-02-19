Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B94F859ECA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 09:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627B410E1A4;
	Mon, 19 Feb 2024 08:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dhwaUbwn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E5E10E1AB
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 08:51:15 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-512a024851dso2256592e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 00:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708332674; x=1708937474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrPQnhq+uifNDW6L1wLQ8gkUjpW0jaBliebCRq9SQQ4=;
 b=dhwaUbwnT/Sg/0csCCEFFYcAJ9l/72BAaiIXcThcYWG4vuw1IWV8UKiJ9KT9zFGNf2
 6Ioj9zvZIF6ENiR/sKYCQ0vMHl2vqZqAT0C8eyhksXRl06Ig0uAIFTdwXfPcJQWQeCE1
 J5mTne7jxTqiBFR1oolcB9aCmthS2DBPORtdJaAso+HTSb3o3LZFaTb+6LN+CaS2kgDZ
 9JlSnJ0u7zo01BeeO+BSWPadfBwXHlDTF69OSPxxTprHHrL/uvIpLem9rDEFz15nmyz1
 aCscbe2dgGv55nrhkA8SRYIiA361+9c3N7i2WC9LSWeEcSeljjEy+IEGbpM8rLZrjmex
 65tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708332674; x=1708937474;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrPQnhq+uifNDW6L1wLQ8gkUjpW0jaBliebCRq9SQQ4=;
 b=tPH3JpN7UxcljTmicEHvXGxqm0oyD/ZB0Vb9WN+po7Y76mxvSUlG/1bL1zrgfCMiu/
 5mxtgNe1Cjm1jNoiPF4C5PtRojPwVZYx+tAWeLG5lFKFmzRBwg+f2iUoawtgDOfpj+bi
 eiSKMbU1ocPxCWH+H9eyZ8uJFK47gQbhJNgXorzhHI/zXCF9LxYydVhazpv+V7QQGrrF
 WXg2ntheHCwpRcg8IutyELKEAvh7alkczTIOZCP8caYwmev8ihficupvSotQ6fGssbEv
 2xcj+3sVVOTSIyT3ZLK845mgCa91VoCSHwvRtXjFzARAjAr3Eg38P52GH2naQKaTwSn6
 bFsA==
X-Gm-Message-State: AOJu0YxLzDoeYYiPDYv6aTv3KHOH6y+xhXOvfNCfRVuzwYwHV6UKedq6
 nPvikP/dK6y7mLcdSdpHpYp66bWWQfahVlZPxx7yRzJPHtGZnTxOl+eOe2imXJWLll4e9hmO5ed
 CxCXVBA==
X-Google-Smtp-Source: AGHT+IEp94VAwIV8UDUHZQ6iK2j8S1+JA1YOJjp/Q1c61r3h7VoeVocWfcqAQMleJ3dGtbsARm1Nsw==
X-Received: by 2002:a05:6512:2150:b0:512:be4c:b53a with SMTP id
 s16-20020a056512215000b00512be4cb53amr39287lfr.3.1708332673938; 
 Mon, 19 Feb 2024 00:51:13 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c1d8b00b004126a0dfd11sm409187wms.29.2024.02.19.00.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 00:51:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
References: <20240218175035.1948165-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v1] drm/meson: improve encoder probe / initialization
 error handling
Message-Id: <170833267304.1737509.12815192021500266320.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:51:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Sun, 18 Feb 2024 18:50:35 +0100, Martin Blumenstingl wrote:
> Rename meson_encoder_{cvbs,dsi,hdmi}_init() to
> meson_encoder_{cvbs,dsi,hdmi}_probe() so it's clear that these functions
> are used at probe time during driver initialization. Also switch all
> error prints inside those functions to use dev_err_probe() for
> consistency.
> 
> This makes the code more straight forward to read and makes the error
> prints within those functions consistent (by logging all -EPROBE_DEFER
> with dev_dbg(), while actual errors are logged with dev_err() and get
> the error value printed).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] drm/meson: improve encoder probe / initialization error handling
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1a9e51bef89af0f0976cf4c83a1e682895695dcf

-- 
Neil

