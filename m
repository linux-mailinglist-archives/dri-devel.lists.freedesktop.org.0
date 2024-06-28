Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE0191BAED
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 11:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F364B10EBEF;
	Fri, 28 Jun 2024 09:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lvY0Ndhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4382710EBEB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 09:07:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52cf4ca8904so533574e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 02:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719565641; x=1720170441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XB5EvDrakOPexl9GfGTU4JrWCssuFa6ZQG7ub++KlZM=;
 b=lvY0NdhycQ6qqr6Xbk0C7scq7+yFZHJA8k2ntULsgydZwLY/H7/ElhlgVRjzMWO3U9
 YIGxM49Wt6pYwEWxIewjOnXtqT0TL/Rvhs9p3koRd2Lys+g4vdbeOuxxv1L4PeJTx+eE
 XUeeRAiF+3R74Y72a2QAAW7t21LyI3PbxEUWLclF+6gb3cBnJWk61LbA1VOFbIoa0W3j
 GPGGpCWTFMLNt+QmwTlFiqiK0GwQWo0dW+3ilRl1xNNRY4JlM/CD3iHCf6B+HK6vc4Xp
 HgcfS99WZyu3tQ7XVmM4bz/ROoFl3oGu0JCG+1Bfy88kHgHejpF5HOcqfr9s0kyI+nqr
 9aUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719565641; x=1720170441;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XB5EvDrakOPexl9GfGTU4JrWCssuFa6ZQG7ub++KlZM=;
 b=vUCwZQXcCw+cccBAzAxMleN76lG7nE1G2wEysgnp3hlEEy5ss02aL9W/SZTeouWZB6
 +BwzSU7Kx+AOAf8pJCx784zTi2NT8BXnh5TMK36kZnZvnor6VOeRUFp2dDY635DLBjaR
 Ibav4bakYDonZ5j2lx7S9ZNA5TBzMBolgCcjTRIHgKE9Rj6ZGpxMcmlRzpL0b6EmB9WZ
 CzXaE2zJuOZUPifl/c2K5dRHzovGH0umDFKBMBiVVApQ54NowGm0nVxuhN4Dk/OYXM91
 6u3LI1zuyJpgHhUyvSuDf8PzzDpcTtfGE6Bd7n2ZXv+M42I9ehF+FrL3/0AZKoEl7Wzi
 PT7w==
X-Gm-Message-State: AOJu0Yy7auR6qEhZG25/IjBdYNMrhmq0yvdSFzEMwUZWTBHcR9v8nKPA
 DY2v1vhUnK2oc6ND/LB55H/SkBrl4dUOGKwCo44rn/GWf6mLo0Yi7P2ABvvCMGs=
X-Google-Smtp-Source: AGHT+IHR5Ql6wS15UNWAOVb5aKvdINi1DnDQLmYnWVu5yPtbmbQXdKi7BzF02P3kLBpPAnSoB8LhRw==
X-Received: by 2002:a05:6512:2083:b0:52c:e040:7d9 with SMTP id
 2adb3069b0e04-52ce0680398mr10053969e87.59.1719565641000; 
 Fri, 28 Jun 2024 02:07:21 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb967sm1612896f8f.82.2024.06.28.02.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 02:07:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 jagan@edgeble.ai, quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org, 
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240624141926.5250-1-lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: Re: [PATCH v5 0/5] Add kd101ne3-40ti configuration in driver jd9365da
Message-Id: <171956564012.990484.13901393761695275896.b4-ty@linaro.org>
Date: Fri, 28 Jun 2024 11:07:20 +0200
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

On Mon, 24 Jun 2024 22:19:21 +0800, Zhaoxiong Lv wrote:
> This kingdisplay panel uses the jd9365da controller, so add it to
> panel-jadard-jd9365da-h3.c driver, but because the init_code and timing
> are different, some variables are added in struct jadard_panel_des to
> control it.
> 
> In addition, since sending init_code in the enable() function takes a long time,
> it is moved to the prepare() function.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/panel: jd9365da: Modify the method of sending commands
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/38cae7b626ec7b89cd14f15efb36f64682c76371
[2/5] dt-bindings: display: panel: Add compatible for kingdisplay-kd101ne3
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e7f5112ae111a125366039666e9c6ff8dd71d0a4
[3/5] drm/panel: panel-jadard-jd9365da-h3: use wrapped MIPI DCS functions
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/35583e129995164aebb169103fe64614482ccf8e
[4/5] drm/panel: jd9365da: Support for kd101ne3-40ti MIPI-DSI panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2b976ad760dc3a62e4ff4c4e5afa02ec16e4013a
[5/5] drm/panel: jd9365da: Add the function of adjusting orientation
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e1c550898f75eec9c6dcfc16a584d5bc58eebf77

-- 
Neil

