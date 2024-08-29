Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42409642E6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 13:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EE210E635;
	Thu, 29 Aug 2024 11:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p9tGyjmY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB81F10E62C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 11:22:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-428e3129851so4951525e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 04:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724930547; x=1725535347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGUXNcN04Y9MaZPBhh9adsoWjhrmOFV1DxQRKRls/NY=;
 b=p9tGyjmYyURoVKW+iR1bDgm6yKDBoTndlKP6ES0rr+0M8JRHe98bjCrWZ9fe1SeRgx
 QCg1E5kh/PSiTHFkTypP1P5uKm5MGbhmJXOYrfUgO0JiO4qY19vHYjBodJjSIKOLQKhw
 ro8YpC2JDf+ikRQ5epVYkzJWoNHeF5TFAbYEbF909qTw2IO73rkOrbpG8sQmAfH6mz8t
 ipeds/ME/rRZEzQ4YLQ2HXOz/FxMwW6ZUOGoj62ilpq0usHjiJr65/J0GXSdy7jWeF0d
 1Ev5rIhHSXizYHamhPno099/R7eKGZ9wjjKj77cguBKXNa9bCBBf8K42AnS8l8T218Ej
 WsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724930547; x=1725535347;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sGUXNcN04Y9MaZPBhh9adsoWjhrmOFV1DxQRKRls/NY=;
 b=kM54qGQpjlVcVMDCDOxOg7p2Ne739cOzjVcaQl4YxoprxNZspPq2FYfR2ChdJgvdhD
 TWuA/6VRP/Pi4weCoH8rL+OSY2nft8lKSBW+MEdiNBcrMd9FtZ7+FkVAKpRx0YEXMM0U
 gy/31lO1khz/yMKvLmVAI5lsGo9FKrH+CG7LjEWKgTWmWuN4bXLi7iuvP8j/BKaWSmHa
 1gBQ2QTdIXsYyzaFEUsUOJ+PqumMdFeb8pbqD4ICnH20nejfRJsC6LGqKdycrDd94ol5
 cGZVtLDuo9Fp0LUaXKn7Tkl6/R4DPu5rbAVrkbiDRh2ovMfXMA15c7Er+7R9q3XTiXOz
 KK9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuBDJmcnMsiQBdxGx6Qr58AX56WhApU/VngAYeyB5I5AVD19gWuHBJpjGmwsfg04KzPHPbv4ZCZeQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2s+IrsxEErsgV/IrZH6Qb/DJ/SAy+Kr6iRNcBDo3TXrXue05y
 smTiKDFrhJy+pAkIlDGAqSlaQFZp/sZfAHbN/Zu+XGZ87AQGxWN4kCzpOMKdR8d+ZcONSuGg67b
 z
X-Google-Smtp-Source: AGHT+IGpqUMCzEBAM6RTehWTEXC3oIO+Obb9EuLNoraNM2SjW5aJQ09jYdcjL27yffI4QE1CzaO0TA==
X-Received: by 2002:a05:600c:3b97:b0:426:59aa:e2fe with SMTP id
 5b1f17b1804b1-42bb01c2071mr19975075e9.19.1724930546877; 
 Thu, 29 Aug 2024 04:22:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e33d60sm14122015e9.43.2024.08.29.04.22.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 04:22:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, 
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240827152504.30586-1-abhishektamboli9@gmail.com>
References: <20240827152504.30586-1-abhishektamboli9@gmail.com>
Subject: Re: [PATCH] drm/panel: nv3051d: Transition to
 mipi_dsi_dcs_write_seq_multi
Message-Id: <172493054606.1145269.2440128121534341021.b4-ty@linaro.org>
Date: Thu, 29 Aug 2024 13:22:26 +0200
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

On Tue, 27 Aug 2024 20:55:04 +0530, Abhishek Tamboli wrote:
> Replace deprecated 'mipi_dsi_dcs_write_seq()' macro
> to 'mipi_dsi_dcs_write_seq_multi' macro in
> panel_nv3051d_init_sequence function.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: nv3051d: Transition to mipi_dsi_dcs_write_seq_multi
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bfbdf72d6c145e008805f0745ff79f9b8e301e0e

-- 
Neil

