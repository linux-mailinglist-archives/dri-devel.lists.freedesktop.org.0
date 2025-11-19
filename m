Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51C1C7034F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 17:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCC210E036;
	Wed, 19 Nov 2025 16:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xxUoJ0io";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2349B10E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 16:49:08 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b3b29153fso3791849f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763570946; x=1764175746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fP3mEwFpsF6SroI//feXRB59U8Qjn1AbUsRd1VVvnew=;
 b=xxUoJ0io4QHBNtvz0nv9L1jq/0zLDMhUQeaAFBroPoot18yAWHOknsefQt95QUrwSI
 H09Lcd+YWCI6xsr6wnbCnn0jnhpcT8+VE+/KcHi5yBSV/LJS5sRk6Fi/h5MIGEr7XsQe
 6Dhc+PcEGzZTwyiABxZl8B2juEbcL5g/w9iGl5jDa1BHkgOPgnLA+hmEM67eVxsMOXaE
 8XG7iPfB6Yt01nYOB22CpNqJe0CDsVFCd+5A5FCOKGHb2IbYJaXow5mfGa6FmbTDFtYH
 uWlPr/l/o5nV3Z8eDDHXnHNL31AH0Y4izZk95jJfaLq8ZzOeg4aI8Rzj3uuIlTtGsfp0
 wfcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763570946; x=1764175746;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fP3mEwFpsF6SroI//feXRB59U8Qjn1AbUsRd1VVvnew=;
 b=XjjX1q152YFz6O0cUnhkDP8Oq11asZZfinDPtEsJtVJGUSbDUuJFrD55sOBEmmPsPV
 pcZ6vjHp3bIb+ChX+GvCd4U8Y9jrvugE/jH2h3dhpTIVJX6NxZK/UblyP5o87DqZEV4H
 Oobr7OKC/bW3WetJlXFbAG5DenfuigQEdWGWVDCJlYIL3SC8hZppoUE5lAnWacsi5gjs
 2IGu6NapniTR0I2Paj2ICSTilrTPPlhjhZHf3bdZUnOtJy2CiQT5KRHBZes64L1Q5XFf
 bUfSz4/AmuVN49fcntkostNOXITBYT/4webqajhQ28JW7LH4eSrikfHdO8zdHld/UaLW
 2qIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXntfX1OAB6QKbH6/9qmWPqerh/EmXIWCrQG16cHMCzhzxu8XgsAy/pfmts4CoblhJgPlaBLveZxRA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsnLbRoHsqroDpLiN9wYzM1o/Jcp/bJfjtTb1+WNib3X5ctzIs
 CFPkkAGN1yI08S9Yi7vyz/sIcDGl4EbwT6fVscgXzfpwLAkC9TyYHBiNCLbYM80yGaY=
X-Gm-Gg: ASbGncszfga3TwZGZpoLmku+zEn97DfYN7A6Lj3Pgi3xInfktY2Nvp5GPKcJkCXEzZt
 H9O2rVbD+PtuvVaJt4w831g0//yxvh3+ebgOkVCnyj2vYGP25NgPbQoCt9MqaY030+QV8Eu1oBP
 zGJGuw0LhY5GmmgKU+Zq6otExlrDxbRV44wWMqA3COTF2czzshQMYTBcReGRtz9iNXQ4ABLaL6+
 c9BI1GvtGrYBPqdkuQmf+6dW8uzeM75t9HDMrGhSfrhMOLYumugQy3PKJB+CCgC+JDOeChvRFi3
 nNDOO01eJ/hq95/Uo7+zt0t/mn2tNBjA96QT/LJofq9jzcxcNPdo7pm/Bfw5VLfi2p6DLT0/nyV
 yNzht9Q5H/3zeEpm71Z9g9cq7fg9Na+hUm3G2xzwKEl7yR3rZ5qmMZTwkA0GmpMS6np9vMbK1NM
 C+U9+dyTJH8/c853OA2UDVEdfKUCLMnG0=
X-Google-Smtp-Source: AGHT+IFJpIEuxRckg0fs35/YF1zumhfLI6hXTo+NQzpKlh4APBaEOe3Aa9NPbO0iCSdpBRsqom8cRA==
X-Received: by 2002:a05:6000:401e:b0:42b:3cd2:e9bc with SMTP id
 ffacd0b85a97d-42cb1fb9793mr3572008f8f.39.1763570946125; 
 Wed, 19 Nov 2025 08:49:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm117957f8f.21.2025.11.19.08.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 08:49:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: jesszhan0024@gmail.com, dri-devel@lists.freedesktop.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
In-Reply-To: <20251115025827.3113790-1-festevam@gmail.com>
References: <20251115025827.3113790-1-festevam@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Raystar
 Optronics, Inc
Message-Id: <176357094533.280640.13259117637796979460.b4-ty@linaro.org>
Date: Wed, 19 Nov 2025 17:49:05 +0100
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

On Fri, 14 Nov 2025 23:58:25 -0300, Fabio Estevam wrote:
> Raystar Optronics is an LCD manufacturer based in Taiwan:
> https://www.raystar-optronics.com/
> 
> Add a vendor prefix for it.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] dt-bindings: vendor-prefixes: Add Raystar Optronics, Inc
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9c1cd9e01c46bca66df47a4775685a862114c3a7
[2/3] dt-bindings: display: simple: Add Raystar RFF500F-AWH-DNN panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1594c6da54838823f7f88f7b692bd917530f6bd3
[3/3] drm/panel: simple: Add Raystar RFF500F-AWH-DNN panel entry
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1b2a9ec82099a39611705884c446cd45b6738537

-- 
Neil

