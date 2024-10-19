Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AD89A4EEA
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 16:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A8A10E326;
	Sat, 19 Oct 2024 14:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F3zxYEk4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DA810E326
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 14:57:18 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-539e13375d3so3418143e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729349837; x=1729954637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rJ2iC8uZMY1HDwTJfNJvqqDE19WyrllRJxma9ymbAuk=;
 b=F3zxYEk4XnCJh3IyCXNMwOKq7tzsGmuBb3GosLslUXf4DTK6llXzTbAKg5u40VacNE
 ZH789VXlNwJVCsbFH7Utqc/ohoH2QZaFsttR0t80emlp1PPGi+JaFCzz7SYHjTYYxOGT
 ANq217IuKB5roOn3uoAYdXMNkkGlP5761BC1wLRdM3FIGiwxNvxsPfVhNu6G4oQrrgDp
 BQd7iLhlq9NDspfoETNK/uPziFOcRCZ1pVb2SfAuoDd2rsTFX3uthIEX9tvdr8oofR+l
 EXFDQjRrrQKiYC1fEgZQtA0c2w+6rmtwK6sZdDdVMZvolMeSlPCtrkHFBKS13IBZPeXm
 2EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729349837; x=1729954637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJ2iC8uZMY1HDwTJfNJvqqDE19WyrllRJxma9ymbAuk=;
 b=e3+uJybBMPjDGr8ybb0AeHEz4gnmHGpnulLMlszZ6nNBqe1WQLUPK/bQoF9wCk5hSK
 pQLQ+my7BdWAdhC03qa3AXbDrlLMI6Hp6vpgGigKcw3+Hd58CJlq6dlNyqJarDv6p59p
 DNa99+0ceNeMH2xqvv9wtLYrgRKv9QlzfHWltkSD7oPFVuCmlhRwAZQYN0v8rRFihiYl
 Ai5877VVmJJYs/LrcBtDdGDhcudiWm/Yk3DsXA9RDZ69rmkMEkqc5tuKIX2bXZY8NUFu
 jtXK6fV1U1bwk5x0HWho1sfx1CkmChsLBIWMOoLOpXRpKUGXi3MqZfNHHQ+DUFBRYcwB
 GGqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQybjc1ZO83c6KH8b51aHmVJLP8JE4KfPyHmfO4wC6pBsiFsF8xQWJze4BOSNfjoA2NdftWHdTVG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxlc4LvKkldOlpkFEZcHyV9RPk4GYjUBB9ThRSW/CBuyCMjtMIM
 xS6+wEyVPzgEDq1HM66rsen1Ko0dZQ7KQIxYPt+E+fhYI6RxAjlKZG6t6cVh4qo=
X-Google-Smtp-Source: AGHT+IF6ehd6MLp512Lxr54GRgB7UYFGZIxVNuSpnrJfaKq2A1UKU3UCX71O7OvXFYc4vFiSmROqfw==
X-Received: by 2002:a05:6512:3095:b0:53a:3a:f4f4 with SMTP id
 2adb3069b0e04-53a154adea6mr2769371e87.31.1729349836657; 
 Sat, 19 Oct 2024 07:57:16 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15214f1dsm551788e87.288.2024.10.19.07.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 07:57:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel-simple: Document
 support for Microchip AC69T88A
Date: Sat, 19 Oct 2024 17:57:08 +0300
Message-ID: <172934981949.2755496.5766136954108736976.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919091548.430285-1-manikandan.m@microchip.com>
References: <20240919091548.430285-1-manikandan.m@microchip.com>
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

On Thu, 19 Sep 2024 14:45:47 +0530, Manikandan Muralidharan wrote:
> Add Microchip AC69T88A 5" LVDS interface (800x480) TFT LCD panel
> compatible string
> 
> 

Applied to drm-misc-next, thanks!

[1/2] dt-bindings: display: panel-simple: Document support for Microchip AC69T88A
      commit: c3f0b90f6ffc178bf158aeccae268276363d6945
[2/2] drm/panel: simple: Add Microchip AC69T88A LVDS Display panel
      commit: 40da1463cd6879f542238b36c1148f517927c595

Best regards,
-- 
With best wishes
Dmitry

