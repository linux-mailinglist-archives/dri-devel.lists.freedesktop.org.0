Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34E9AEE2E1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A986610E498;
	Mon, 30 Jun 2025 15:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i5nz8xZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10C10E498
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 15:41:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso2176369f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751298082; x=1751902882; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KseiYlHId62o+/W17588ZHb2GeDakhzrku8PZZP4CGk=;
 b=i5nz8xZp9EeMUOjJzEzMWCFacLBMQxVflrkrM88TJ1knx9Ir3EPqBTdVDcAOswBksF
 61ebtw9QA110tlXMGarmT1T8Dbmv9JEWVrnakIcSaxF+XicSdqc4cFWK0fRseOTmlvBa
 fgIpsJvJhyfiTJ+B6Zu1S2f41SeRXFwg64xmC0HhIrcfRrpf7m3htHlWVfyaIQexTStX
 v+TaKMeOba7Opk0Rb9Mqm8JYp4/UscPCGB+oIzjXVS8LA2isYTmy9c9xlkrhK3aIxtJE
 vfUdHrntwJn/1HMT0YGGm/NfNFsw3uhFSo6Hj6j0aShTtk6UkxSgJD5zp1ClA3kkA59M
 NLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751298082; x=1751902882;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KseiYlHId62o+/W17588ZHb2GeDakhzrku8PZZP4CGk=;
 b=YcXuU74bKvJyjOXeyN1jpqD8gm16iymVSfEn5R3ErZhuH7BLLIp4cH1aBHQOmQPTep
 sKyaBWtU/ql+mJrGvGHzlmqTsCnLhGbVO9LCRMmYInzw4Hs2yMUsmfbli8sXIGvBUcUw
 E0Azja9B+LPb6PXMw7PPvdH0544oT/YFhJvcYmfyG+S2cfaIBQ5It10pLyyOXuGxOhQY
 nAFudVjoDSD1TMzkxfKnFpckaYL3NE9SWfnl1VmH8BUTCtxdfivO+nie+Ev3KQWhRm59
 ti3fxYx3iQWjn9NUEq3IGsvaCVucXTqSV9/ofK9bwApeZCCSmPUhpQ3LPiGIOyoZUR0h
 ZcRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVM6OSlwrTRRKXE8LQgrHsp8BR62/oG9KgQ2yJC/d1xWLMgWp6/rKOIYVXGKE0abck8nXxvmKcNGGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf7Fqcw2hyxmAEJkn7RybI0+JnAbWEsf4L0g/KJyJhZrQU2gaW
 fVI93HRcDcDHEEkQRsNQ3wC9+1mfGVVDNFvcXRBLuV0JGhtkm2B53NhjF+85rLgMKrI=
X-Gm-Gg: ASbGncvv8PMY5XbzmLPKntLB3ClVkkaYJTqFYkU3sMKKMEh61soFk+KYEZFP+tfRzZ7
 wwN68XAoUcqstk5UQVG3e1rmgq2ET0NSeZYjZdccXE4RtHjZGTYG8845dpKgpX3pH4Ve2I2yCoM
 BqUluV59ekY+lO1KFfGm765gpu4WVhovY/d/+zV7d0Fy8b/JTGPY8bj4fL3W3Yo/OgDlHATS0zJ
 mQoMBFmAG4UpIRrgZTeUmomwwAHG9NFmliteL1LylG9Uxcfy5fIIFo4Rct7XXXiLrfpmOaVyJzK
 aZIofzw1lHkTR/d47YoFfJHTrvvckhZfHCqEqShWHFqW78XXoAGvwWbs4cxteTFRypWtKqpOcII
 cvO+iXEE=
X-Google-Smtp-Source: AGHT+IFWzLOIobY7pvawU+69BL4YqZzWGXgHVpyHRsypApfibBzKSF9kGVm7OZpx/NKr+Rf9FbbFXg==
X-Received: by 2002:a05:6000:2b08:b0:3a5:39a8:6615 with SMTP id
 ffacd0b85a97d-3a8fdb2a677mr7432498f8f.11.1751298081899; 
 Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad01csm170270975e9.22.2025.06.30.08.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 08:41:21 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20250618080955.691048-1-andyshrk@163.com>
References: <20250618080955.691048-1-andyshrk@163.com>
Subject: Re: [PATCH] drm/panel: raydium-rm67200: Add missing
 drm_display_mode flags
Message-Id: <175129808139.2286551.9507645918020654828.b4-ty@linaro.org>
Date: Mon, 30 Jun 2025 17:41:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Wed, 18 Jun 2025 16:09:55 +0800, Andy Yan wrote:
> Add missing drm_display_mode DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC
> flags. Those are used by various bridges(e.g. dw-mipi-dsi) in the
> pipeline to correctly configure its sync signals polarity.
> 
> Tested on rk3568/rk3576/rk3588 EVB.
> 
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: raydium-rm67200: Add missing drm_display_mode flags
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4dfed55bfb4b500bbc45867c1b83789cc4dbd106

-- 
Neil

