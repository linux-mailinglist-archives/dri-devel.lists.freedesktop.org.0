Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094548717A9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 09:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BC8112912;
	Tue,  5 Mar 2024 08:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d4f/QVwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08553112912
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 08:12:15 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56715a6aa55so2541703a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 00:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709626334; x=1710231134; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O3A/EAinpsgQWxTIMJ6yuX1WTjY1XiN+9FGOszAcRco=;
 b=d4f/QVwOzP2bZxr4CPaJOBvqLLJsup/4A7jP65NPIK537LCjmDL4jnuy7SHFYfkOaB
 5HeqF0xK9eNKCRhh3INUcGZgOliXtUVekSlsD3RVGiRTl8U9l7VlvIWDSLghNy6dktGn
 Fq2ExwFv4QWYQaOMZ3+u0j0raLW+ncePVK+3cbiT+QeRn2Aqf7x8Quwy6zoqQc6U/B4J
 58fEN1sNlC0HyMv9TrbPu9JxrGg3PtOT6ccSLynhvnsLdjlmGybKz1NZ78xp5kIyGeaE
 fhgiJojoNR19Mw0BedKKitqo4iWFn32pWRuSBG29bsH7MUXyj1uylAeiuGvE8dbYcjoM
 T+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709626334; x=1710231134;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O3A/EAinpsgQWxTIMJ6yuX1WTjY1XiN+9FGOszAcRco=;
 b=fRIk9ihjjvEsbosmXAUoS/vyxoKm9T9anf3Kb7fdjueQxZsTO2BQ7NwDLciQ5xccFg
 kiz62Lo8EsDMYO0iZrW0cC16cTtq5/ynmb/V00qiULJkEdBz8EuSAZlUBCKSueT5KRZU
 nZB+HJ1ZJtCTNdfhjYLlmSrYaZ99dMtVaAhtcYwGP/+jdKf0KPboQmw0qF2O+pfrTLhT
 vslOXNUIxdtN4R+/LME8M2/k/4Mx2bBf1bfcKxi6zwVZBot7HZB1CkOP/WSJDytq6if1
 tucOBIDX5Zd+c03YU6ruEvWJLty0MfIm7dcM7KOOJW6slZfONiwHZQp9grVKLHjiaIP8
 1fXQ==
X-Gm-Message-State: AOJu0YwCB5rS/Lo/PYp1EG7LmZDMxErMvBrZktUVZa9KIKiIZ6v8fE61
 GD0hER23Oe6VGdpXuN1r7A2l3vmC43ntn1b9QZPHOCirEwOboA7K9G4xDRmp9A0=
X-Google-Smtp-Source: AGHT+IHvfrycnRsoZbXowUc2gzxlYIB4odgKPVGzXcP83qjOfADAzdEhMwsO4VKb1yKnJHztwRB7jQ==
X-Received: by 2002:a05:6402:17db:b0:566:41f4:a0ea with SMTP id
 s27-20020a05640217db00b0056641f4a0eamr7342577edy.37.1709626333890; 
 Tue, 05 Mar 2024 00:12:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.222.97]) by smtp.gmail.com with ESMTPSA id
 cq16-20020a056402221000b005672a346a8fsm2761557edb.57.2024.03.05.00.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 00:12:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/7] backlight: Simplify probe in few drivers
Date: Tue, 05 Mar 2024 09:11:55 +0100
Message-Id: <20240305-backlight-probe-v2-0-609b0cf24bde@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMvT5mUC/3WNQQqDMBBFryKz7pQkagpd9R7FhZqJDhUjEwktk
 rs3dd/le/DfPyCSMEW4VwcIJY4c1gLmUsE49+tEyK4wGGUaVasGh358LTzNO24SBsJaOyJNnqw
 1UFabkOf3WXx2hWeOe5DPeZD0z/5vJY0KqfXtzSnnLdnHwmsv4Rpkgi7n/AXzJuZ7rwAAAA==
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NA41xUYJ0YMoD6hYkBcTSkjWUaJcxDDJPXNtIoNlDEk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBl5tPVGtrbAtNymcJcqPS8RdWTQCnBB6XqA2oyK
 IoVP3o+JlKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZebT1QAKCRDBN2bmhouD
 11a6D/oCkJmOBb/REyIVR7/UoJl+wJNV70fc2JUAMC0ZNw7J+WJtbOaaolizi7a0aFCspcu5QSu
 ZzsvcpbIm7Bgm8E5aS88V+d/AqEajMyuumKROdHfiPc9aUCTmp1KRMfAxQjHFc+O4xfW7Aim/Z8
 qxfjRRGfXd+kVUDToItIu3ohS0jqWW3ScElQXK8RtdJL9SHWES5YTCTvjNhIplx0qY2VGm/UnUA
 Gm0XlD5kZMJi23Ezx1m3TSec3xnNokZdu7EGvHYpe3vxYtOb4cFAAMGLsBGVCtKhIUB7aC8cKid
 fF6NC4AOocPNHMqKCfDObUlpypdfodV91i24C05ejcw0vaG7q73kU6AbNIrBmjLJy5zOl7f/lhH
 rl6Aruyw1dsg+92+R9r4AEY5H/7VEtaMoUh4HJ9ytDEnATk3amNzSJehfbA9N7h+TbgRyTmc8ut
 l4xgRvpB+fVGn5HTGassKARss52v7pKqE9tCjMtcLpAJhHT8BbbyOWgv5kc0EYYX0AC1MHc0F+V
 iiX1wUxNqTvFxBczhG/YF/omVLKWQGDD/i5LzVwhRna323AizMD4ghANLXaTkEJFKEaHbkHXsAa
 N/yAVP3KnJYG1ncyn5VQ9xWsCtFdbcy9ucDwdSiUE2MrrunER7MRqFJSjA/6lHznwH8JBvUNF27
 eE6fCO3SwnquZzQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Simplify old code in few backlight drivers.

Changes in v2
=============
1. Patch #1: Drop "Error :" msg.
2. Add Rb tags.
Link to v1: https://lore.kernel.org/r/20240304-backlight-probe-v1-0-e5f57d0df6e6@linaro.org

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      backlight: gpio: Simplify with dev_err_probe()
      backlight: l4f00242t03: Simplify with dev_err_probe()
      backlight: bd6107: Handle deferred probe
      backlight: as3711_bl: Handle deferred probe
      backlight: lm3630a_bl: Handle deferred probe
      backlight: lm3630a_bl: Simplify probe return on gpio request error
      backlight: pandora_bl: Drop unneeded ENOMEM error message

 drivers/video/backlight/as3711_bl.c      |  6 ++----
 drivers/video/backlight/bd6107.c         |  9 +++------
 drivers/video/backlight/gpio_backlight.c | 10 +++-------
 drivers/video/backlight/l4f00242t03.c    | 34 +++++++++++++-------------------
 drivers/video/backlight/lm3630a_bl.c     | 13 +++++-------
 drivers/video/backlight/pandora_bl.c     |  4 +---
 6 files changed, 28 insertions(+), 48 deletions(-)
---
base-commit: 1870cdc0e8dee32e3c221704a2977898ba4c10e8
change-id: 20240304-backlight-probe-31dee1efe662

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

