Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C2CC1D531
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF5C10E857;
	Wed, 29 Oct 2025 20:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qwE0mL+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41FF10E858
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:58:56 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so2843395e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761771535; x=1762376335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8PZYROl59B0+8VWAIvP+emTQAflEt9bueWJDy1TlQwU=;
 b=qwE0mL+kabI3gcCxu/qL0M1AUq9NFoTJlqaacHcp4iGFeXHMIZsYjLvpAfzS6y/XUr
 IdgzDiNdlnP0LKbBjLfNimtovHdKIXIyEOKo8/Kl+yUC0pLlTwfoTNvWQA6F6k+A96lL
 BbVVen/e7AJtfnzxKbblP4cR7BY+rC6nheS6QpNH7UiiQZKkMy6up+z23rYx4skp5yFI
 lFtpOrxsllOysw+J0Z91redgPOyFVmOOZlKXQ8x/OSX8sLCzwnsNHIv2TMJkg0c3zdBv
 PSJ1gUh3xKUK67O/J/hdSI8CEZW3KwnYONGa0hjgsgZ9HYIdznyBGuz+jWRgMGJ8djP5
 QhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761771535; x=1762376335;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8PZYROl59B0+8VWAIvP+emTQAflEt9bueWJDy1TlQwU=;
 b=nMX+fJcVs2Ms0HYFDsrI8eucBaYz13U4dpdEJmYmoGnJlgfjDhwFRj88v74YDlUAoh
 rS+WOA6nxhDQdj0VikWzVpTnxteCb7qlbs68OOzRbJO6nojheQXKeqjMWariJb/Un1KQ
 Gbw+OWs9jBZQnUo4IxCoOBz76wru3vIvL3Elj/UUYhSeNy6S2stRviVqvVjtHRpo7plD
 qye2YA2ycIExGoLBtPqqZ67HEtBTIYRcXng6S0IRO5bxinmAi9sqTzqb+GAdL4YnfRhj
 qP0ZmaqL0feV5UpNMFovAOE35BBlKk50FbSS/uKYza3j1DT0aGlXRm4ppvB8kZk8ept2
 HozA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3nM4CO+Wt0jbCnWKx+N6wsVDOR64Yu+zi6Ztl0vOOZI6k9Hc41QX9mC/sjt56++UW9GoEk/fri8A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsGjFOLA4EXFJd6THynX7kPzUrTDokp+4moXb3lT2AsKEw73B3
 JWfxBhT+X131H3KIl2WXSH953cMx3W95hFnJwmIF3Bym4bdvyJEDuNxHlfLfuzknzkA=
X-Gm-Gg: ASbGncsS+gC1k+5NxxflJxMuUwGu833hGqTdQxzn7WQOo61CIwexNgdksna3Ab8S1D5
 8HfNf2Ay8iYgh+u7jR4+YjVcPrAdccVNmzSw3Q7QrjDLo80OZmc+fVVNSjI5fcvIPAlqgZNCHg4
 yFVEWBf+qN7WulFEXpiKi1v5hJE5j5CNMzw8rlr/8cXx3hqGoGxGgUF9NvS1dUC094PUa0yU8XL
 apWaHriz3DCxalwznjMSdMw+YqkAZGbXibFBvJb1XhdEEGETYFT11xTDu6MR5K/W4+e6TdgyG2e
 tJH8Nz17ep1eOolfa0UfcqTfKjewviYPtwu3iXF++DwGCAV6ydE8/b3rGx2dt1bqdyHPRVATUwJ
 ARO9LNxhGSs45n05/HOaqQXMM4IjQolq46YDzQuPh+dwSAy4Qis8452yjx2bAzkUS8GFERAXSHI
 zIe9loPJ79Yq9zd6h+GBjN
X-Google-Smtp-Source: AGHT+IEnayHPbaY6SjxO0Lnzit9Wm5g29qzB2gGaxhiaHjbnjOsf9eFfiEs5FI9Ij3D8BfOJxLc4FQ==
X-Received: by 2002:a05:6000:2484:b0:428:3c4f:2c40 with SMTP id
 ffacd0b85a97d-429b4ca3df5mr820876f8f.56.1761771534983; 
 Wed, 29 Oct 2025 13:58:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca569sm27596082f8f.12.2025.10.29.13.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 13:58:54 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sre@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251001-t28cp45tn89-fix-v2-1-67fe8e3046ca@collabora.com>
References: <20251001-t28cp45tn89-fix-v2-1-67fe8e3046ca@collabora.com>
Subject: Re: [PATCH v2] drm/panel: sitronix-st7789v: fix sync flags for
 t28cp45tn89
Message-Id: <176177153417.2036161.16223414447101207716.b4-ty@linaro.org>
Date: Wed, 29 Oct 2025 21:58:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Wed, 01 Oct 2025 01:59:42 +0200, Sebastian Reichel wrote:
> I planned to set the polarity of horizontal and vertical sync, but
> accidentally described vertical sync twice with different polarity
> instead.
> 
> Note, that there is no functional change, because the driver only
> makes use of DRM_MODE_FLAG_P[HV]SYNC to divert from the default
> active-low polarity.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/panel: sitronix-st7789v: fix sync flags for t28cp45tn89
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/056d76f7cb9fa68c8bbf85b4055aeb84af6139d5

-- 
Neil

