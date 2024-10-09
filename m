Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A4996192
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 09:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3381410E67D;
	Wed,  9 Oct 2024 07:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GE2w4Luv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E4210E67A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 07:56:04 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-42f6bec84b5so67113315e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 00:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728460563; x=1729065363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kmMlDXGibAdqKrNC/s4tQOqEsl9CbNvY/ixtgVngYk=;
 b=GE2w4LuvkVeJ3IaRdTm/syGmP01pDb6ctYXipnZchmr6DNMa9Hie5XXqET5/ODsKw5
 RpY8F3pKQkc7/Szqj5oDUMh0/nNPyeSE7WaFZi41ngz96A0l/e6IdzJyuhX+BlMB6Ap+
 zrAWLL9D3f/SfLhhJ3g3LgkNmSrc9aM7xOCvXgm047/mE1T1z8bdqTHi6nACc6SsQKEV
 g0h3ieJT0CzDR2rQeQAb6T6aYDbevBTQtTia1Bq8LFzLxIF5Zyyg0qxIfSr+qmSOeQLl
 iGJ7/0h1/qF4UDHiAIFXHnvSjflvZpGAONzclymgAUg098r81kwtxHcrXGmF6x/InknB
 0dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728460563; x=1729065363;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0kmMlDXGibAdqKrNC/s4tQOqEsl9CbNvY/ixtgVngYk=;
 b=MHV/FKH9MuuKWb7LgiPba1JfwENLduTxbxSS+dDeXRBvkK4urHqgc4Lu0ijJonv8va
 KRNOrdbfCveaofVv7whj1vUmzYjqiHWJqsspk/otsiI1eoGr1Bo0Jc78BQqt6nuAylod
 VVivBLv3yNftSRvuUDlboOuzV7JR1Jtxp55epjWntBSovATOhepBZdSzbieZpwRZdfOs
 8DT4KqsmbvsYFYzzNga25L3n9vGL+bDiJrlNwmyaEejyRmzrmhHpd9DlrMqHKun2H3RH
 8M8TcZMgRe6hTbEd8ENzxUkuASk11HzPvqX+Sjipw0NVC+Cdtg1ycn261Q1aecedOeOL
 NcrA==
X-Gm-Message-State: AOJu0Yz9aYAfS5ABiypLANvxr/HoNxfOBaPIbNOk0HM3Pp87NuW5Bie8
 hUVbgQpP5BhMYYSxEXIIJlchWsbZAzUb8IkJfR9al/v2ZifNiXDVPIZuNri8Bh0=
X-Google-Smtp-Source: AGHT+IGVnsvhJt5/bGGQd1j33k6EUf41BaTJwb8mSb1jF2UGlQuMTXhFJYasWIvOI9vvkkF34p+yOA==
X-Received: by 2002:a5d:6990:0:b0:37c:cc60:2c68 with SMTP id
 ffacd0b85a97d-37d3a9b532dmr846334f8f.5.1728460563207; 
 Wed, 09 Oct 2024 00:56:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16972fd9sm9660342f8f.104.2024.10.09.00.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 00:56:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Danila Tikhonov <danila@jiaxyga.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, adrian@travitia.xyz, degdagmohamed@gmail.com, 
 linux@mainlining.org
In-Reply-To: <20240930202448.188051-1-danila@jiaxyga.com>
References: <20240930202448.188051-1-danila@jiaxyga.com>
Subject: Re: [PATCH v3 0/2] Add Samsung AMS639RQ08 panel support
Message-Id: <172846056170.3028267.4886940070722840412.b4-ty@linaro.org>
Date: Wed, 09 Oct 2024 09:56:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Mon, 30 Sep 2024 23:24:46 +0300, Danila Tikhonov wrote:
> This series adds Samsung AMS639RQ08 panel support used in:
> - Xiaomi Mi 9 Lite / CC9 (sdm710-xiaomi-pyxis)
> - Xiaomi Mi 9T / Redmi K20 (sm7150-xiaomi-davinci)
> - Xiaomi Mi 9T Pro / Redmi K20 Pro (sm8150-xiaomi-raphael)
> 
> Was tested on sm7150-xiaomi-davinci and sm8150-xiaomi-raphael. Based on my
> analysis of the downstream DTS, this driver should be fully compatible with
> the sdm710-xiaomi-pyxis (unfortunately not tested) without requiring any
> modifications.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Samsung AMS639RQ08
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a62528aa539a405f76cc3478f6fd3f842e7c6a4e
[2/2] drm/panel: Add Samsung AMS639RQ08 panel driver
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bd07dbb929f6c5bbda60d52a0003246e53f48c29

-- 
Neil

