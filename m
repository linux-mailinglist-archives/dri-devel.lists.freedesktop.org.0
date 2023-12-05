Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEDE804C35
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C60710E48D;
	Tue,  5 Dec 2023 08:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1210310E48D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:26:54 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40838915cecso55067355e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701764812; x=1702369612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ONp2xeZJwWnYurG8deLTSE0gkCza6RtQu4dgCKPeQ4=;
 b=d6XVw0MKyExiWbPTHuWizQ3TTcdyQ9WfWlFoNzw+X0ZV8D6EI41NXMp1nV58WfuzjX
 x3NXIHP3w6ZqokzzfvqMGPiJp+KsIeLcrmcqTheWNymGwWBYpjcr7z0JDY7mXAFPG3eg
 B3m75D8iW9GY4ud/dqIT7AT2cim+XMb0Ww+icvAxXHKJwHzjjRNKhbKR63r9az5Z+vuj
 mfqlSfsIFKSUUlcfSe1SksFkR3xJK7AKFOOHpOEAhAu/+Bh0So56fPSZUvm1nGvDaXiv
 V2GAYEHx8/x0Hhu+nmOG3ntL9RbP+rS6J5Bf2uJHBPqjq15bn6w4qjD+FEtvXNjVqoVF
 4nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701764812; x=1702369612;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ONp2xeZJwWnYurG8deLTSE0gkCza6RtQu4dgCKPeQ4=;
 b=gI99Cu7YBSbRLpLrMFowm9olRIi9J7W8/3R9MAUqyKquDhbLe6xG0Lu3yXKWgcKRFl
 qCnwo7Sgpszi5dPzUIuysFpk3itrLuVu/Xj8mevg4U9xhpkxoKd2r7WXiE5kJLwy1Vr5
 3rmTbuEbvFZiCQChMnioVqYKXVPIQP5ml3CpZXSMmT5lnLF/RDxlMranogRBkDj+q7xy
 08WMz3mq74y11vgJ+0cJ1UI863bTiurs5lcig3CqQyL7vvIYPVks4+264VHyqC+On0cJ
 F4Wzgi9v4PRUwsX4YsSehMPYjkjEbqKtdIKWVIzx2UirdunRpkio6HfJusczTV6AcMrj
 Vo7A==
X-Gm-Message-State: AOJu0Yxnbf3YBo2ZiJIKrTpCfe6Oeu0u2u67CTR81SLkyk47NM8b97JP
 fHEWky74fJiRy/kXqObSw/as+7DpeNhkeOgH5yGjh0+a
X-Google-Smtp-Source: AGHT+IH7wgiY+RXSlX5gVy/D8OdYWT70nRrboj3nA4gpJE5NsI9UJv5ilLIdET+CbMek0Lds1Rb+Aw==
X-Received: by 2002:a05:600c:ac1:b0:40b:5e59:daa1 with SMTP id
 c1-20020a05600c0ac100b0040b5e59daa1mr236001wmr.180.1701764812446; 
 Tue, 05 Dec 2023 00:26:52 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b0040b538047b4sm21329282wms.3.2023.12.05.00.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 00:26:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>
In-Reply-To: <20231127051547.15023-1-tony@atomide.com>
References: <20231127051547.15023-1-tony@atomide.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add boe,bp101wx1-100
 panel
Message-Id: <170176481142.4073725.17752464155243136680.b4-ty@linaro.org>
Date: Tue, 05 Dec 2023 09:26:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 27 Nov 2023 07:15:43 +0200, Tony Lindgren wrote:
> This panel is found on Motorola mapphone tablets mz615 to mz617.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: simple: Add boe,bp101wx1-100 panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=4777dded21717c31d2d8471bccaf7c0ff58feaa4
[2/2] drm/panel: simple: Add BOE BP101WX1-100 panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=eeaddab4c14beb02157db5ca8f9e074066759bfd

-- 
Neil

