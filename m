Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E248958248
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D59610E57F;
	Tue, 20 Aug 2024 09:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ALU3PYQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F21710E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:31:36 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42808071810so42299985e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724146294; x=1724751094; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dR0CreoU8vpVj47jDOdAp+cTu5413/pQZmWvPzZH2KA=;
 b=ALU3PYQyMOEWyBIIbWr6z4UUNLA7FkxPaLX2isnEwGXfBHKE/TvHH1UjZpeYNKWCoZ
 Fr0YsyouGwj0aGiIw2Bske2puJnCHV1dmjQXPaStdVyGH69x7PPhO2X/mJYnT3Kj2AhJ
 JVzsntbdu7RkSdvZCCb6UCWavAIZqfe48U/7Ab+8ZRvFOQnyLdN/QpaJsp7kU2YT711d
 B/AOS6A1gE/WI6Zt09+uNGUiBDU/d1EhjgkBlb1akvZG6HlLrYhnCFNAnFvqYM/9/ma0
 EFzxARQWLZGLzDWIPxSDg2W+nCK/41+Xu/gS7avntT4f8htL6+U6WNxkP8Ev7Ri8nIEZ
 BIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724146294; x=1724751094;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dR0CreoU8vpVj47jDOdAp+cTu5413/pQZmWvPzZH2KA=;
 b=LmNtigZ9r/vkOF4jyMzpK6/ITKAL4kayU9UgX4ataQcJeA2AOMLWeglaal4xxBJWvO
 CrkLC8K34BEsqLyHhwW9GRcASk2T/RHpmpHZMSHTioc2mAvhISWLkF15KfaEDL4BceGK
 +fRGsXQJyZ48356rdRs0yTKKFkF7e/w5+bmweCJc6/srZJ7kdMLqtpNjIXej4DoYDBZ+
 0AbdPhnLk/MVJeT98ObjapA+E0qsyX5HyuIr6K6F0X/HjETNyRjmpLw/puP4/jv8hH4v
 SxS864D2OMMoYNH3Ov6ca2RNb0sEbH+NmRewnu9OUWObiR7/93S/EWSe4qcOza1vLJFv
 li0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2Gd/eU/Fzhr88ERuRXzOKotBXvFwDsLRr4b6/fekNMNcTOiEadUpMCGxi0TTqpTHcUTuySOhWXiI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDSVjY140dM/9fHy34slAfQKE8eF04nhIBoNp6WeaBz4L6Lwb7
 8YGHm5aqMmttIZELOvA+AZAs9LpXL5nPSrhEQeLJ5iTexJOSHtYUdx/WAOkPZMwj82aDeonOs9B
 d
X-Google-Smtp-Source: AGHT+IHX+zBO3kMosl5V3wdA7ekb2kmacB5cUU/l4MDgeLTQn+W+q0tXM80DVANeQt+/R4mbjOcPgQ==
X-Received: by 2002:a05:600c:4f8d:b0:427:d713:a5d3 with SMTP id
 5b1f17b1804b1-429ed79daa4mr89507445e9.11.1724146293900; 
 Tue, 20 Aug 2024 02:31:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed648f00sm136597505e9.7.2024.08.20.02.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:31:33 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
 skhan@linuxfoundation.org, rbmarliere@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240819175122.33176-1-abhishektamboli9@gmail.com>
References: <20240819175122.33176-1-abhishektamboli9@gmail.com>
Subject: Re: [PATCH v2] drm/panel: ili9341: Add comments for registers in
 ili9341_config()
Message-Id: <172414629306.2571141.1078174341276677864.b4-ty@linaro.org>
Date: Tue, 20 Aug 2024 11:31:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Mon, 19 Aug 2024 23:21:22 +0530, Abhishek Tamboli wrote:
> Add detail comments for registers definitions in struct ili9341_config().
> Replace TODO with comment for each registers.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ili9341: Add comments for registers in ili9341_config()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1453323eac4f13817a07f40e78e76dfc635aab34

-- 
Neil

