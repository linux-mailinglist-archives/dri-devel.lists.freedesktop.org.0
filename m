Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E03804C3C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4669710E4A4;
	Tue,  5 Dec 2023 08:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D73F10E4A3
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:26:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c09ba723eso24883455e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701764816; x=1702369616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fhk0vrrK3aMQqTPPZhkL5dCm1kbb+HSVRSnOFk8wugY=;
 b=VwA4n6lqNK27ySVnKL9UEtqmmeLBAxGTqc6tt4ICsI+GHFad3efXTFxpU8bIfJn5KW
 6YJGbfGeb87YXEQZ9N6OmEiPUCWteY+DhSe7uSw+KyujgIe1fxUa8kHPsSewFtVavZpF
 mSHHfr8IyQo1/dsdMlrxhiusodIIuP46ffSgiO+dSV6u0CtbBFrdEpHXwLU5RCwQgA2F
 aGY/y3TDpKVnEL9RVlGfPIXg6KvDAbYUA+hDj/VXHnhkKOZXk3EP1ve/03wCIYvcKQwi
 WMyrCP8TFofWFLQPjd6f+Oatk+TG9kZD94wMsuK5gejmJjg4nCBbbTb1SbX7w59Wy+Es
 ck7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701764816; x=1702369616;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fhk0vrrK3aMQqTPPZhkL5dCm1kbb+HSVRSnOFk8wugY=;
 b=xLZUdlNGquZB8xUgRHre2hcT68nyPaZiaIzNoLh9g4Ne0d20KkBvaYFcOBdlhVGl+d
 /ii39rOEfnkyiHn30rQSVz5rV+o9c4n4hGPBmFCSN5SVZwQf4r7ahXFEkO1HXdrnHYid
 T5KaNAdiqsWx8igMBqNCdeMkeVyLhkoMTr61Qw4vKPON6HOXh7DVW9BuGPgo3ypmwMS9
 MoMq9HOLx+Z86WKx+ng+0kNlk/I0NNFzfv3B6ufibBdbBC9xQqCGjpI9BxZd3BYL8nt0
 mGLeh1MwhxobXRYtCTxnHyaV76sfXpYEVD8HVbYnnkFhi3uGhMu0L1ST9HyKFmXBqA6g
 Xjew==
X-Gm-Message-State: AOJu0Yxmgl8oR2Nt2FlqO+lxFjh3CV39eWukAHIDFqmj2qgespLXiFYm
 UooizuV+1eY0Jbg3+w8LpfDF9A==
X-Google-Smtp-Source: AGHT+IHPShSi3GvRNJWHwAxMtJssSWjt72NL4oJ9fh+a8bP3Z8ocH3lCJwCKGGEKvGVi37O0qYOMAg==
X-Received: by 2002:a05:600c:3c96:b0:40b:5e4a:4063 with SMTP id
 bg22-20020a05600c3c9600b0040b5e4a4063mr214136wmb.131.1701764815659; 
 Tue, 05 Dec 2023 00:26:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b0040b538047b4sm21329282wms.3.2023.12.05.00.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 00:26:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Michael Walle <mwalle@kernel.org>
In-Reply-To: <20231123102404.2022201-1-mwalle@kernel.org>
References: <20231123102404.2022201-1-mwalle@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: add Evervision
 VGG644804 panel
Message-Id: <170176481474.4073725.14480764473949447794.b4-ty@linaro.org>
Date: Tue, 05 Dec 2023 09:26:54 +0100
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 23 Nov 2023 11:24:03 +0100, Michael Walle wrote:
> Add Evervision VGG644804 5.7" 640x480 LVDS panel compatible string.
> 
> 

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/2] dt-bindings: display: simple: add Evervision VGG644804 panel
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2a5244a04e751c8617d5e7707550d97a83b1102d
[2/2] drm/panel-simple: add Evervision VGG644804 panel entry
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1319f2178bdf1898a76ea8c4f00d57b240bbc5fd

-- 
Neil

