Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F0CC246D6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4FE910EAFC;
	Fri, 31 Oct 2025 10:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UIAS2LpQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F123B10EAFD
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:23:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-475ca9237c2so11552595e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761906196; x=1762510996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iXMKN/f3hPlGQyBPZaLnadEppjkwbleTDBKw/agnyeU=;
 b=UIAS2LpQGmKXMuedOItbn7zRoV5ASAwD7Loc22zvExmgOI/p2r/28xYsnDyivW8edZ
 fHmwUWMDrtq5+/okYoDowgncvObOcQmxmGpoglrjmsmmgaJCZrJzyM258zrj0f+qbOCx
 7ZXbL3ckRBxe2hxTqrhuD+x0b48JWEuMYJrK4cpLpaaasEu3O8WH46+hMsoypUB2XpeW
 5X0S1XkDZKDSnxHhGdxGboGzM9Htb1AX/jjZFf3x3GdVjGOHoOefPHpMuvEEXI2eyWen
 5bWHYC/qfhVamX6vUtjfTDfeMyzL3Amsvjg02x5SUvZc/MRpP8voTUl71wwtT791k8T9
 /uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761906196; x=1762510996;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXMKN/f3hPlGQyBPZaLnadEppjkwbleTDBKw/agnyeU=;
 b=jKjBFSlGxdE5RMO9f7UpZwZ9OzKOK4Kyu0bVXQTnmr0/QLjxB8t/Hnco8VBxSIJjsX
 2xjjlRmD/jc4avVE3KMKyJyj2ms5MT3Twb84U22GQ2BCjlSsg/grIf397AJPSVwekClP
 3cWke4Ziq+IxBPArxnn7I2TIV2Duc2f7G+BwC1d4dIX0pIQ39x9lqmyuYpiBpyBBZhH/
 o11HBMa9c9U/FHpzQaXoGoTwUniVS907HOf1qR9L76Rh1Z3m1Sz0Yy8uMaT1WCKtKrTc
 eamMpNBUP6y12acrcNYsMEnmtjBkWIJ4p9PVzQE0fp0om3+gvbkm4DqYL1z5BxFxaMk+
 iLuQ==
X-Gm-Message-State: AOJu0YychnhAKnCF41bwphU28Tqe4HRB+WH15r/+Tk2y5ZhbTJRdZTve
 GSKo9sR/YeNL6Dwcw06XZQIaqmtmKB6uLWBlw9xCASs2VH87oNL/hGHEeJg3ufJRyVI=
X-Gm-Gg: ASbGncuVGHK2ot2RIfK36TymYCPlnNBmBTvx2SMUuGn7kvY5XMvbf9HY+jM/6o5ep7e
 DVcZlrceERjBD3/P4f03RwCahyeqHtTInKQaxbPZkyByfCu0huJX4OGlRfUP+xWxfnvdfWCj0Ne
 7YnEwdnXBpVw4LOv/++UtxJEIIG6cP5KdBG84R3nQ7O00Sd6pQ2xiT+XPyid875kf4byXltQ/7f
 gQHoLTM8v7Z0flrirV1jI8LmCMOXTIaQ5PZJeO9P0JB4dLiU4v6woqWQzMfsCFf44P0Hsu0QSbe
 aD4hRMi91ixPfAvS2cRr86aNcLEFPm5IJOyqWYcc+LApWGi7+1wRJ/ep+7GfnXYpgVXx8LsFqDz
 NSgYZrhzCMMiVTUH2iwyAH6IzDBsg6aUCwoxxqcHAP9q2bJrgzz9ZqjRW+hDE9wVP9A3+VGK5F0
 esn5ViCJCW7NmVUJGGxpOE
X-Google-Smtp-Source: AGHT+IHuvEibfn7tsxClW8DlHuT+oqRrLGx8+6cBjm1BnQcfhVjHOD/UlqB22n8dAmDrfxw2hKQRZg==
X-Received: by 2002:a05:600c:1f91:b0:477:e70:592b with SMTP id
 5b1f17b1804b1-477305a7cddmr27504455e9.2.1761906196326; 
 Fri, 31 Oct 2025 03:23:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728a96897sm87112355e9.11.2025.10.31.03.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:23:16 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org, 
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v5 0/2] drm/panel: ilitek-ili9882t: Add support for
 Ilitek IL79900A-based panels
Message-Id: <176190619569.1659489.7212460878951359541.b4-ty@linaro.org>
Date: Fri, 31 Oct 2025 11:23:15 +0100
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

On Fri, 31 Oct 2025 18:04:45 +0800, Langyan Ye wrote:
> This series adds support for the Tianma TL121BVMS07-00 panel, which uses
> the Ilitek IL79900A display controller.
> 
> Following review feedback from Neil Armstrong, the IL79900A support has
> been merged into the existing `panel-ilitek-ili9882t.c` driver instead of
> creating a new one, since both controllers share similar command sequences
> and initialization behavior.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/2] dt-bindings: display: panel: Add Tianma TL121BVMS07-00 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e147c472fffcdaecf27f4eacdc2ef48623867bdb
[2/2] drm/panel: ilitek-ili9882t: Add support for Ilitek IL79900A-based panels
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2b1ffe042c4767c569bfff852f34f357817738f2

-- 
Neil

