Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC05587EBC9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E378010ED95;
	Mon, 18 Mar 2024 15:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p3V7vNCW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A76910ED95
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:13:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41411421113so6842485e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710774785; x=1711379585; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x6p00R0RAxuLkgIZ84IADZKmz8eDY7A+/cZOcv6ZG04=;
 b=p3V7vNCWN8WG096xLDFGS8jL1IV0YOZSPK8PwaqMQp/XZZ0iphtmyodIH8K2QhgymD
 fSFh78UKQJ9IlxL3SmLr00YIh46KVb84hd298x2Obq5odhCtidOT8VzsLeV7H4+iPJ8q
 9TQKArVUcChp+EqA+QwjX+4ZFV/U5+9HiHLWGleJNolrnhf6VNU4ikJfCSQq7idynSPF
 qAaFTAzaMPAEcHBeCWLWZNUcqeBRKgGOmcfFhC0LsUt4wijb03+kWHiFeH0TMP5YvKmq
 Hg1QaK25oHuWPq0Igy6VmyMZkZ22fTLES23Bgok5/q7L7++/o/KGtyHPbqJ/AC129d/o
 G7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710774785; x=1711379585;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x6p00R0RAxuLkgIZ84IADZKmz8eDY7A+/cZOcv6ZG04=;
 b=asCss+5xSmy1p5ZB9KtDEdmcgx8BYhou1UjB01ds0e38N9YmykVODKcrBD1AraBNT3
 hIDTnNqZbiutPhdJTgS+Xq/NQIzuuK0nF5jwO2DU10T/REvLtAGbNyBJ+PWEHl+YqJeh
 5DAnNLG9GPgDrE9wH9Aq7fQU2MONJcTr0FQERlVvWH6Ovi0rw5yE7nUI7jNnx9qDdzf7
 JYVSHAoTUiFOco57iSdF/6H6n/ACkwgMY5t3yGZ27lz+YUtzlkk18oMp52/j3YwwQfwX
 E4KjN3bGGIqYYc5hu0XeTJTUb8D76Y1t0jVyqj7R8/b5Z54o1UD6alFBHOkS8ckxaGF5
 3Vgg==
X-Gm-Message-State: AOJu0Yz5AoRR3iQD9tZsHOSzmHkTb5oMx2oukYMbyTb9LgdbcD6XWdsw
 tgd4gYeE6jhD+knG2LfUswjoFmgytBQ5/s6bhDpYpRD4qcxMGymm1zwFRQcuvJH/LYkPSlTFPz0
 61TI=
X-Google-Smtp-Source: AGHT+IECl44lt7QT0fQLuN1Ima10XlWNmUklC92M1E6tyRhdx1nLXSI4gkxmF7e75N/NKDg1NIoPNg==
X-Received: by 2002:a05:600c:19ca:b0:414:66d:db7f with SMTP id
 u10-20020a05600c19ca00b00414066ddb7fmr5095338wmq.10.1710774785385; 
 Mon, 18 Mar 2024 08:13:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b00413ea26f942sm17880628wmq.14.2024.03.18.08.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:13:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20240317154839.21260-1-laurent.pinchart@ideasonboard.com>
References: <20240317154839.21260-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: ilitek-ili9881c: Fix warning with GPIO
 controllers that sleep
Message-Id: <171077478483.2130203.17923228102140385955.b4-ty@linaro.org>
Date: Mon, 18 Mar 2024 16:13:04 +0100
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

On Sun, 17 Mar 2024 17:48:39 +0200, Laurent Pinchart wrote:
> The ilitek-ili9881c controls the reset GPIO using the non-sleeping
> gpiod_set_value() function. This complains loudly when the GPIO
> controller needs to sleep. As the caller can sleep, use
> gpiod_set_value_cansleep() to fix the issue.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ilitek-ili9881c: Fix warning with GPIO controllers that sleep
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ee7860cd8b5763017f8dc785c2851fecb7a0c565

-- 
Neil

