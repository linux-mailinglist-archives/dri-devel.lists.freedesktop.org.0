Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC5847B9E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 22:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD5910E878;
	Fri,  2 Feb 2024 21:35:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t0eDaXbD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3FE10E87F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 21:35:54 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33b1b21c020so1291492f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 13:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706909753; x=1707514553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=upbbVLfpfkn9xqaS0gsTHwR4HfhogOcvQXfO2JT/dxw=;
 b=t0eDaXbDqA1mur8ub3TQLfJOMRqnI+FrrcRR4lCmH/a/jcGK7TuVEyiUjMUhdOpegz
 u8zaSG/YVgGGNslx3En+Ct9iPyo3UwH/q9iiSi7GZVSQXbZhQ2nPRQC3Dvp/S2vVBvNQ
 b1Tz+au+QP6e1vYeGnIALG0kmgHwXzhD9Gg9jIW5DSdXxbzl8ebK28KMP5sNV8kzGkOS
 5LBhm3y7kQ4231Ag/F0LvEAcS2umVRgRFIMRknZhZHofmm4G4voB2lOfrRXLrhkhk/Tl
 NMT3YELu61gpr+DOgyILxNLG+8j30MAbYdZqi8O0YJsbti9zv0vi3ES0hsqymKFZ2nlW
 Vo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706909753; x=1707514553;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=upbbVLfpfkn9xqaS0gsTHwR4HfhogOcvQXfO2JT/dxw=;
 b=ETyb13Z6e2POqov5LtJ2SA5T9M/wWRLiGf+NyUiHXCYrBChT9/dmaOJZ+gkPbAT9ct
 vC0qNmuOESxUKoWs8URSqZJIqHVNFkWRdCrDOgTfZ/qqgAAGt9gTnVccu2Hf2gNHVIYx
 BhIywba2FvtYrlKv8rzsGIn430jNVIU1cavoe8g8P6gkkf15qySlMlmW9S5E/IcaGEq4
 5b+hLWMo6/YHtOrF3L0FDfSnDf3/roNFcfHKBGAlHEhwDS5gh7pSze6AqN1VuQt8XA5N
 pX0wgKjtXngv8IVziH4XVU8C+MxkVCe5Dg/kWwO9/VR6H21zzFcr5NPxYofo0o3p1l3X
 HMyQ==
X-Gm-Message-State: AOJu0YyBXofi5rQ1JGzz9eVCXN+DiWxKZpNBTLNFmlXeGPVzGaOrE0t4
 w7U+jfIiCXcD0p+zctxTKP3pWTDZWxdwHdN5iShNXtcRlWXUoe6FzyRrQnIAXEM=
X-Google-Smtp-Source: AGHT+IHFSX/D0r9equZ52VMYMcBXvHcPIbyPKiVRSWcMM1ZcF0DJ83B3hve+2MYoXzI2q56hziBa3g==
X-Received: by 2002:a05:6000:1887:b0:33a:e746:4ef0 with SMTP id
 a7-20020a056000188700b0033ae7464ef0mr7951095wri.46.1706909753084; 
 Fri, 02 Feb 2024 13:35:53 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVYgRwC5N1ylK7bEDYbopy5UmpBBDckvl7RqeaQlFU+AL6itLWjAb7E70lConJLUPj+yWi0+oeoqWGVtOfGhrmykjY/g5DWK4zCsLuQNfcYrQgMNXQM9Fq8oonwcfl/fzBL4dy//5LiBCCih/CdSxZeJAHXRmAPPCP+GOCPqKUltNF9i+WdEOyUh5X6GlG3vlHhtkdFjnnUyQEFPXRWHQy5N548FBHKNlz1WHhOX6Nz1XWhRRLYCYQjrbA9DCTqJrflsGTIKmCvRGh0E/rQ8V3gDKrbsXFtGuJDBuNaVqvy6/PZ5EYIv9eh8psyxhxJJNHuIN1oGKIF6WoTeJ4QAI7zKnyolq/qpTy71JcuGozQZiL1GZ8LsH8XV4729thamqCszCNVBK426rbI4ui4jN+FGZoQvliyX5SI45+mcLiWWji7R/XDpquhA0za08Srr+Az53VWUp9yG6Z8uJ2fks2RfKmHgaEkSwikwqSNN5ZtTbACN1R8DlQK
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600000d100b0033af350fb88sm2687201wrx.25.2024.02.02.13.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 13:35:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: quic_abhinavk@quicinc.com, Bjorn Andersson <quic_bjorande@quicinc.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240202-rm69299-maintainers-v1-1-423aa40f344f@quicinc.com>
References: <20240202-rm69299-maintainers-v1-1-423aa40f344f@quicinc.com>
Subject: Re: [PATCH] dt-bindings: visionox-rm69299: Update maintainers
Message-Id: <170690975220.3073109.7977446273055179028.b4-ty@linaro.org>
Date: Fri, 02 Feb 2024 22:35:52 +0100
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

On Fri, 02 Feb 2024 10:03:11 -0800, Jessica Zhang wrote:
> The current maintainer (Harigovindan P) is no longer reachable through
> the listed email. Update maintainers list to be Abhinav and I.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/1] dt-bindings: visionox-rm69299: Update maintainers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3d94e7584486f7ac4a44fe215330ae6a1094e492

-- 
Neil

