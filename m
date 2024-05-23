Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A458CCD21
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 09:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6EA10E178;
	Thu, 23 May 2024 07:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kAmS9/tK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21ED910E178
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 07:38:03 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-354e0cc9c5cso1371830f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 00:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716449881; x=1717054681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4O+SS1GsRMB8bjPXT+6PVKoi06ILz48Vqq1L93jlgPo=;
 b=kAmS9/tKpbH+Fj9Dts7MeauINVn0JoUnqAqzgKyBaaWXgEXdgutsVWQ1MQZhDUSZ0H
 IzM6yVY42nXp0I44egDOX+OES+/tg+yeIVEle5lDjnSwKVE9sGyRRBE5q884NDEyR/pD
 H2tQbasNkKVLFhfgzeLLA0kJoEgl1irZ5WzXwjaedQzm2Qgf8LX4lhQUDClrgLOHi7/8
 hdjYfbHLmXXGl9EsgOXqHZVyj6JmNgi13PS0l3fyNM/SdwnHkQOexkgM4uaXbtOpwvb5
 g5pUn8AZ50f8IpJ2Th0VsuIMSRfrNIabJ3KWE5gzQXEDW/r5Z9xI7TaAaA9XPX/G601k
 yu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716449881; x=1717054681;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4O+SS1GsRMB8bjPXT+6PVKoi06ILz48Vqq1L93jlgPo=;
 b=IYc3adCaiZOPisGgykCfUugsxjbyMwat8Ve8CFdhHwfBPwYzThAsOD3oVvnFA1LYIK
 h7omh3uJaUP6UOy8u3zsxTyTbPMCm1CIU41i91Z5gXVRFzvE7HASdbal80+G+H1BSU08
 UrMWtlEityGafUv1rQJG992n0OAob2vMXxLd2sKS0nIrnr2tt1qArEGFVMuBFPeqxTaq
 GddxlOHajvlK5DlQ6SgZgT53xrb9+vuW/Hj+OFU+Ha1E1LVBlzLtRk+uxgCZ/JNncZaI
 4fBdBphsUjV7OZihYZ+nD9Ysk5kevZHA3SqABND/TKc5/4cj81wIYjLAArt3lxYcepE/
 W9SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8nCM29smw3xAeASW4On79si3faEekHCZZEISshO8xeSTfW9iVin+xTpYEoK+sk/GHmMAML4LceuwwT4N9IxcFSp4P28ZEVmmEXmZcgt2z
X-Gm-Message-State: AOJu0YwgVLMUYCn/Vg8tQ/UzoRWWAwf8RisxDqSbm4w1CzXlE6dLgDY4
 nPUkJVuCF1frzCrkNn77stq0J78WFLKBnxIDsWYsTxAtfzXVZ/CsIoI6UAqxVj0=
X-Google-Smtp-Source: AGHT+IHK3gd8xnykZzZ98OHITQnyjeTmM56u8J6DJqBPYDwpo+keFdbr+WPnivHIFoDfG6N4ETBJbw==
X-Received: by 2002:adf:f50d:0:b0:354:fa69:aacb with SMTP id
 ffacd0b85a97d-354fa69ab18mr613176f8f.43.1716449881025; 
 Thu, 23 May 2024 00:38:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-354fcf20f4csm282500f8f.47.2024.05.23.00.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 00:38:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240520153813.1.Iefaa5b93ca2faada269af77deecdd139261da7ec@changeid>
References: <20240520153813.1.Iefaa5b93ca2faada269af77deecdd139261da7ec@changeid>
Subject: Re: [PATCH] dt-bindings: display: Reorganize legacy eDP panel bindings
Message-Id: <171644988011.2016197.234222014770021280.b4-ty@linaro.org>
Date: Thu, 23 May 2024 09:38:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Mon, 20 May 2024 15:38:17 -0700, Douglas Anderson wrote:
> Back in the day, we used to need to list the exact panel in dts for
> eDP panels. This led to all sorts of problems including a large number
> of cases where people listed a bogus panel in their device tree
> because of the needs of second sourcing (and third sourcing, and
> fourth sourcing, ...). Back when we needed to add eDP panels to dts
> files we used to list them in "panel-simple.yaml".
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] dt-bindings: display: Reorganize legacy eDP panel bindings
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bd0fc87d5adc8e3a0d6fb84c9ed3c77da1f1242d

-- 
Neil

