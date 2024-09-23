Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8C297E538
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 06:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7E610E36E;
	Mon, 23 Sep 2024 04:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Q0Scqo6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0334510E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 04:11:15 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so41972841fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 21:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727064674; x=1727669474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bzw04PZf0Wp70Ne6HQFmFnwvWqAFwMmQEnzY+hhgqtY=;
 b=Q0Scqo6ViDaVA30+9BRyqAWltyOkFg+WDEH5mrSJ1/Qx9xkoNtKDki3SK/r3QotRpL
 96mGJ7vlY0rvu22i0EPZXskRdyVZBrYun63inMCreVLiJUQncpdSir98K5ugIFxxv8uY
 lbi7i57k3M11KeTnGQn6mALprmvbpNhY5zGXVRKx6aJ8b2+9Ccwc9Gt/02qly7h6Upyq
 G831NH3W10obPbcdzeqI6SDyBCE+M71Yh8hm4MRSxZ8ybO6dWdzaFki3dvEFqZyW5vVd
 3sqpW0xyvwpVc8bGyC7joQsg/W5bzMgG/cFr2el4FnL5LEsInwAGMMtVeSEsdlr+FvkD
 jXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727064674; x=1727669474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bzw04PZf0Wp70Ne6HQFmFnwvWqAFwMmQEnzY+hhgqtY=;
 b=Ma6iCxO5P4/UZX9676UFBceZqPA6ctUbX1+fFwcL22rXbzyINOef968Z+Gszd8iXxa
 f+10Q7jkEcM7jajNI5UJE8OqXOBF9eL5GUW2zKYeGy2vI6TBXl/o9QBTszIhlVo6zICL
 wCj4UPzw9if8+Ha7nl3KNXkUPSH+/+mkckQjKgKF98M+jtLsC+zm5DbFI2vDRcTWWeF+
 8wGP/dNqJFYD4ttcddSZV8ivH09DiWr3yDy+yI6Ob4gz6w+MQOOR0aLTgRwk+bvJwRld
 vQlKAuEHHdAO2HiYDAs3reLoq6dztC4lGCdnmJVS6rBkLL7wGWxFSDPrAGo92nAkMYC7
 8GBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuriUZAhFh/uxgvaIpJf3p4V7KWO3pNc1Hkp6H8ThvDTWjR70v+QUX1nLIpEto8Bw4PskvHcgmZAw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD5EuofBJ5VPiQZ4q92AGJTwuw3Cw5XnYnnFEW5gt7LdK9cISl
 Bak3vq7phz2odj0juw/3K12md1MA2URK9bzyzjjNYSikny8i6rx0trey9OWa0k4=
X-Google-Smtp-Source: AGHT+IG2mI0V+zIkUmlvNCdY6wSIS0STTWJT2Fx84R5jhDpbx2HRXBM48C73YcCdv04YRYnjSNzjqw==
X-Received: by 2002:a2e:b8d2:0:b0:2ef:20ae:d111 with SMTP id
 38308e7fff4ca-2f7cc355cb4mr48406991fa.6.1727064674047; 
 Sun, 22 Sep 2024 21:11:14 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f79d4878adsm27824431fa.123.2024.09.22.21.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 21:11:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: mripard@kernel.org,
	Fabio Estevam <festevam@gmail.com>
Cc: marex@denx.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] dt-bindings: lcdif: Document the dmas/dma-names properties
Date: Mon, 23 Sep 2024 07:11:09 +0300
Message-ID: <172706466234.1395184.17165074006162117967.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903162729.1151134-1-festevam@gmail.com>
References: <20240903162729.1151134-1-festevam@gmail.com>
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

On Tue, 03 Sep 2024 13:27:29 -0300, Fabio Estevam wrote:
> i.MX28 has an RX DMA channel associated with the LCDIF controller.
> 
> Document the 'dmas' and 'dma-names' properties to fix the following
> dt-schema warnings:
> 
> lcdif@80030000: 'dma-names', 'dmas' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> [...]

Applied to drm-misc-next, thanks!

[1/1] dt-bindings: lcdif: Document the dmas/dma-names properties
      commit: ee06d5f52c1d35e319bd240c8438ffe5ed02b24b

Best regards,
-- 
With best wishes
Dmitry

