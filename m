Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C877889B87
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 11:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BCC10E753;
	Mon, 25 Mar 2024 10:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dsQzRood";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AE110E27E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 10:55:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4148a139b1bso3281975e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711364114; x=1711968914; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZnH613nBUeVax298UlBKbR2krvx0QgfXLhq8xs3I2/Y=;
 b=dsQzRoodh0ij6f1ub4Lr4fPRm2WRtcMyI4R+vUxKK2LUfmvOHLzZIpH6gXFBcA54KT
 5ngsNqQSs53gwM33rQYm1DU7HoZ8iSr0Qieh2MIF2u443ubbL+jhLyjPAqe1zAPwoX3G
 e2Sq0N2gQveBj6Ad/SFlMjJsd6KoWVg1Y2gvOKqpYX6GM0aUmf9xZQJMY+utt4FQJObL
 N53kjhHsKMShaB2AJR3OzB4pQhWvCJMK4w78pNaAKsbg7obNOMwfdEI/aneZxuyawd5U
 SgqPf0C/T4ET8YBZ6PHFhDYmJF2Nb25qV0sL3kuonwq4FJfqpijXqAZ4tbN+oCIgC1uN
 CQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711364114; x=1711968914;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZnH613nBUeVax298UlBKbR2krvx0QgfXLhq8xs3I2/Y=;
 b=v8lZPAb8Vr81byc9R/OZviXBjTme+hVEtrWgRnr9WpMlyJH3cggvX40lcNXpZsraDf
 NEUA70tUMy86KjMNzMzDNsEfn/BvQlnzU84x+k0PIDRK3EVNE0H0hcjylp9hcVgl/i5g
 J1LtK8jbXkWSbc1OfeaObsOyl8Rk7gcHxINJ34Ou4fV+GYQ0bTggXjx9ilOo24x4pUxM
 zrIJ5Wew+qC/02+ptx+5eVLu4z2KJDbjgXbsUaQ69mm4u1bc7DlZG5nfSOuQl4OFvLHv
 pyssSwXwR4gM6c+C6mHNpgUyA1Axbm/DwSTUb4OR2WH/D0dkpOornBXnTkcX2Z8W0Q9U
 /kRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPyH0KfxakLF0fiPpRwld2AAasvmy4tW50udb2dhvYkn94EGe/xVTd4/E0J7ESXywl4Ni5sWZMBu/AG27oCwQoP5O2z+RMyQNPlxOn/Obr
X-Gm-Message-State: AOJu0YxY8mc5/bU5Jqzsh5GvvzoG45pSrTPDMGSzEoFP6m9QRZ1ub49B
 AktWjdgGbFO0k5NPTnNeR3Ec51cslH/WiYveZiRpeEAWiSUVx140m/mos7wO+ww=
X-Google-Smtp-Source: AGHT+IGwGU7gpQJqeexmqiCDr1Yg2n3xkuKSJhvlV6DEgZ55qS9f7MIRV9jlesIETW2qxwJx8OpcwQ==
X-Received: by 2002:a05:600c:1986:b0:413:1f65:ec19 with SMTP id
 t6-20020a05600c198600b004131f65ec19mr5038708wmq.37.1711364114083; 
 Mon, 25 Mar 2024 03:55:14 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b004146750314csm8161410wms.3.2024.03.25.03.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 03:55:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jianhua Lu <lujianhua000@gmail.com>, 
 Del Regno <angelogioacchino.delregno@somainline.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20240325103611.28240-1-krzysztof.kozlowski@linaro.org>
References: <20240325103611.28240-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [RESEND PATCH v4 1/3] dt-bindings: display: panel: add common
 dual-link schema
Message-Id: <171136411318.2357652.10037957949169924402.b4-ty@linaro.org>
Date: Mon, 25 Mar 2024 11:55:13 +0100
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

On Mon, 25 Mar 2024 11:36:09 +0100, Krzysztof Kozlowski wrote:
> Add schema with common properties shared among dual-link panel ICs.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: display: panel: add common dual-link schema
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/48a516363e294a4098622dd77a5ecd4ee924121f
[2/3] dt-bindings: display: novatek, nt35950: define ports
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1f6612e6852ecb053ce1e342d833ed7f395f7186
[3/3] dt-bindings: display: novatek, nt36523: define ports
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/90ed42ceda7667f5596d5e98530dd4119d786234

-- 
Neil

