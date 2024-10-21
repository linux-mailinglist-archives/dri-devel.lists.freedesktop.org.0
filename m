Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCAF9A6952
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4DC10E4E1;
	Mon, 21 Oct 2024 12:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Pc4O3Ufu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D7710E08F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:59:08 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43155afca99so31459515e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729515547; x=1730120347; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w+RUoH3ha/Lf1gdT8O1kbMPjqS4t2rKUPiMbdD9TVZs=;
 b=Pc4O3UfukILypT5Rrmou+veaAjqyC6tKuVk7aZDSuevp8WTCDej+A207ZwTmByavq3
 GaNohikxCDkSsru/67vUAcT48hji74yE2tXu+tCrYyLbbBwgkU520HGN/hXX1XBXGymu
 Hhbnrc8QHYbH700nFvjZETNGm73hzQu9eoWv5kXrsrp+vcPWTe8N1ltNakjxI+M2TKDx
 G47WDPohCu8ClJ8VvmrFI5fTtdt/CS9T95qnlaqIUrW+5NmK+zvwdWjauW+UnFIRFy2W
 tK1V3P4hDGd9/07m6OMK7ajhchOJbFE8+JjfG4mEvOGjGm6tNBMrD0lz1MIqAX91zoZu
 CoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729515547; x=1730120347;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w+RUoH3ha/Lf1gdT8O1kbMPjqS4t2rKUPiMbdD9TVZs=;
 b=aMJ9gM59NT0aG9lZReHmQbapRKZXdoJNTjczvrx0iXvpbJzyBm8zFhpD7XKj1VJDPD
 5qzbDbGgltyJ3pOwEdzZH/c3GcSf18oao0d6q1+dONwDT1A4L+iyRJQpwF/MdSfEFTZs
 HaMY8yHPxvMPA7PqsvevHsfLo/ekJaxtvpscH2dCmhSsXVl69Iq9KfYkuDmK+xBhbdkR
 MNJ72Hg0FAvaBrxUwziZhyqXgqPJhe5N5YgrxFJu4KGGmDaTJ/vt2raUI2FG+BSz+g+9
 8owpuhFDVxvhi4fOne2n41c8GOSIDsMyfZBTBxfHTLuEFJPzOVD4icRRTn2Kj0Ub7KkW
 CTvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0IeyXiPy7I9UutE9HBR3cOr7iRFXlzUIevt6c2t7MwgwDXvRnAirvmj/ZvOLr8cxWWCl5uAcQOCY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWdcYVddPQzsv5ATYTgm770Y6XnmkjOeKZrJW5I4tal4bivc0P
 juhVYQqdbdb5BQGWJa6/pX9jIYe6uMzD6BUtOZpue9OoXRGAkcDBL0yiImYYQOc=
X-Google-Smtp-Source: AGHT+IHXnEjrjk+oEEo9O0YjJCw+q+G4imwHDuLvf2Jz7pO3SM5vNPJsiMiVQ85ppGf6vf0IjdMjtg==
X-Received: by 2002:a05:600c:1c97:b0:42c:baf1:4c7 with SMTP id
 5b1f17b1804b1-431586fc609mr90806515e9.4.1729515546759; 
 Mon, 21 Oct 2024 05:59:06 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:59:06 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: andrzej.hajda@intel.com, rfoss@kernel.org, 
 Wadim Egorov <w.egorov@phytec.de>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, bbrezillon@kernel.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org, robh@kernel.org, upstream@lists.phytec.de
In-Reply-To: <20241017085556.3045686-1-w.egorov@phytec.de>
References: <20241017085556.3045686-1-w.egorov@phytec.de>
Subject: Re: [PATCH v3 0/2] Introduce bus-width property for input bus format
Message-Id: <172951554588.1240386.2012740643085248533.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:05 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 17 Oct 2024 10:55:54 +0200, Wadim Egorov wrote:
> This patch series introduces a bus-width property for the SI9022 HDMI
> transmitter, allowing the input bus format to be configured based on the
> number of RGB input pins. The default is set to 24-bit if unspecified.
> 
> v3:
>   - Add Reviewed-by tag from Krzysztof
>   - Ensure bus_width is set/defaults to 24 even if an endpoint is not defined
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: bridge: sil,sii9022: Add bus-width
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/096d518c43341c5d8b80948f6fbc90e916ffc7f2
[2/2] drm/bridge: sii902x: Set input bus format based on bus-width
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d284ccd8588c9b87222ec666a1da57f197023e5f

-- 
Neil

