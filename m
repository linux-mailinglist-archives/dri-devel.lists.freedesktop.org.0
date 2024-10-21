Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 360F89A69B2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1AC10E4F7;
	Mon, 21 Oct 2024 13:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iXv9AZ8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D848910E4F7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:08:05 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37ed3bd6114so1949827f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729516084; x=1730120884; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VqnULJngiAuI4PU+WENgbKZbOXrbYOY8YLdD1t2buO4=;
 b=iXv9AZ8LqECjk1PSpne8UPq5YLKU11RJJbkgvlBFQ+4/FtbxbXdLAzwmoIjke1/MFy
 FqUJN4liZupnEx+nYwe8LIk74CMYExA2NhHBxdxts3vy/7fP2IHnZlxEUnbunN1OktBh
 Oro1JUkxTXY1iPkXzzeHSX1DbgNsgfzeYspxUiVEZfqiuboHVE5AhfkRw6kH+6jMVa2t
 OX3veVAviGvzHt1Y/LZFihMNl6gYcVZweNZKw+uqdqmsrGGaSQ50qTsHY1a7lV7lOmmw
 IkzMIFs8rg9m24udBcm2sYErEwqyHfi4n5aSzJE8HbYKbyD2/4oFgT0VwSM/0Qkvnqap
 wwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729516084; x=1730120884;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqnULJngiAuI4PU+WENgbKZbOXrbYOY8YLdD1t2buO4=;
 b=FkfYiNJIBQPAZLGROFtGLJ6LezsKC15b0eTKk5RqKTvJKxtAtT/rb+3lq3PLRUFvlU
 TByoUQh9lq4HUaT//mdwUQc0/i5XBm1aOkviaaNFGXIaMyOQ4MNHOxZ6lfPMuLZlyEwn
 XSeXNrXnJ1CEDrm3oyse7+WD2x37V0aCyIJp7I07Kk0sFQ8DGevxc5a7pRfRO+2/msvO
 lumgudZtjWcG5qonemH38WiTknEiuhoqpvpvWomaWq3hSMl0YzStMe/tZhyxSVllDXiG
 d0RKcG72GbTasTnEd9jLIaVBpRI7gtoPr3kyaC+2gv2CrNZBp+sgPWxgcgMW9FJuuy8I
 SSZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOl1Q92Z/Qf7HbLMc6Dl+fqmq6U0r//DW9uMBxBf8snsqXsMjJ2oOoZieGX/MEKKEHz9/itAFcjf8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoRbRjk1VklDoBfnF0bDniJ6ZrAuROuqM02HOYlUdeE8o7nzTD
 S1wRdvnkmXPXodak9GQc/Q4HRI61T23UyQhPcWz69n4tX+KMzVbnIVeq13tFpVA=
X-Google-Smtp-Source: AGHT+IGm1/5Xh2Z81XQToS4JZjHin15PG7qBhTsyW0jnN8vOfqwSxnZN3dWJ97hienGRAVBco+uHkQ==
X-Received: by 2002:a05:6000:b45:b0:37d:54d0:1f20 with SMTP id
 ffacd0b85a97d-37ea218b5ecmr7255011f8f.24.1729516084157; 
 Mon, 21 Oct 2024 06:08:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a4864csm4327496f8f.35.2024.10.21.06.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:08:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
References: <20241018-drm-aux-bridge-mark-of-node-reused-v2-1-aeed1b445c7d@linaro.org>
Subject: Re: [PATCH v2] drm/bridge: Fix assignment of the of_node of the
 parent to aux bridge
Message-Id: <172951608323.1285208.3162107667310691864.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 15:08:03 +0200
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

On Fri, 18 Oct 2024 15:49:34 +0300, Abel Vesa wrote:
> The assignment of the of_node to the aux bridge needs to mark the
> of_node as reused as well, otherwise resource providers like pinctrl will
> report a gpio as already requested by a different device when both pinconf
> and gpios property are present.
> Fix that by using the device_set_of_node_from_dev() helper instead.
> 
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/bridge: Fix assignment of the of_node of the parent to aux bridge
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/85e444a68126a631221ae32c63fce882bb18a262

-- 
Neil

