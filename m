Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1CFBDCEC3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F81A10E299;
	Wed, 15 Oct 2025 07:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eqJS4NwW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CADA10E276
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:22:35 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso3307580f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760512953; x=1761117753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPcOIJjAqivuI68Wr991lCzvZe9U95/X4cXzOMjHBFM=;
 b=eqJS4NwWWBhoBMVego1Vbv4bLwPuSLYYDeYA/BfYCDoyTY0Fh+83Da2kHYoYnKXvTk
 RSMbg4XS7Ki78QVQ1S23KvNuXqHI5FJYmuSi521PG3K+a/ZoPLPTxJfESv/M7xdjjhY5
 2bXLqH+g9UgZxdIeZHDOjn2yR/qmGbYvSOTleNNk9cHbq1CDw9nrTaufEZEwMuoR4bv9
 YW0Im96Q+H8uWBCFhkWiz3igdPrwQSP0W11p0YQf/fgJnaDHANx7XZzHsNE0r72THdYQ
 dYc1zRc82KPeEWQGZslRi9c2eZwE2DvBAsmNvHrw382CKmCHkYop3sjwGnYJ8THteiou
 SMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760512953; x=1761117753;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bPcOIJjAqivuI68Wr991lCzvZe9U95/X4cXzOMjHBFM=;
 b=lp8+uKSejAci7WJ/Ky1zyh1sJPwJn0aqVNs1wh81Pi+wT66FniSI4SB7btzgifRZ1a
 VK1yDt/RPqzhuI5Rs9rZ70291NrdPbvuPqB0/J2JRaAwo/Aullztn/xXrm2Lg8zoq9Pn
 rI9SrcSvNI+c1EkmDXP+x4FM3DjkCup0wR/hDfzcvs+8Ahtq2IIZTYxkPB2UqxQHqLki
 yrawXuDalcnscxy1BepQxDNLQ42p24FJCPaaK0jGcZvkJRnfrDPu444PV8Hf1QNRgOiy
 OiFVQHtRddaHxCje+rCfk/Ic0O8qYDXKsAOUX5mPzxz5zBH/h7ViC9hysGmoTC8eW6ii
 io3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWteOsFr7t5JUYlowxqos6TDZDOOi2/hrVDnJIh6alDEbHNiBmUTo0bPCQkvXXCuX4cRukpOq0fSmk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvOqMly9OF7MnedQhUM+vhElKmxWoXZwQUQy+uYo0XY2TGCOrU
 KwfdFW801Hul7n6StFW/dajnjckmg9QukhLcb1Q5cz6wFQH+rygY+2GI5UPv+Dlb8bc=
X-Gm-Gg: ASbGncv8GMtSGaeR8A9F3gj+OMMvtPotvu0VbeMCbekBuaVBJm6kGT6C+bAJYtVTyO5
 pDk/VbXEfUXAjiOQEQQSBvWYxDrEgmMpnuplJNMBu9o6YV/DShLJDJ8mgkld+/NoEWTEQm7rUCk
 cheL8n6ogYzPE1FTeQuNDNS458qD+pqFmB0h/VZX6geWINUDLOH+pOZTfofdJpAO2AhW2awBRKw
 dPZz5FU7zNzSDBKZC9VmFeylX8O0j8aiVsi3uQ0zJnjIm+VhGLRXCDpOGhHzzxSsHoPoGPvexk6
 ydFgiVcOWveo0hxSi916oKsm5hR7C8mIksvOuW3x7uoNO9YGqVvPvWPDP4zlKBYvOHFiFRmPrGb
 j6nm3EzB7YbtnKHbsw++/Q/Yi+BKFOiyFKES30uCmC6QaQBkzLIOqHAzB8FqGC1Nd2w==
X-Google-Smtp-Source: AGHT+IH3BD5WhA7FG6Zp4c0PVdvEcLCxk34zjohYVpVCAm31anzYKVfvwlaIYZ0XuSu0KRWu7NkXdw==
X-Received: by 2002:a05:6000:2dc9:b0:425:7e38:a09e with SMTP id
 ffacd0b85a97d-42666ac2d01mr15689229f8f.2.1760512953270; 
 Wed, 15 Oct 2025 00:22:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce57d4bbsm27804930f8f.2.2025.10.15.00.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 00:22:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Dmitry Baryshkov <lumag@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
Message-Id: <176051295262.2274368.18317625493336873860.b4-ty@linaro.org>
Date: Wed, 15 Oct 2025 09:22:32 +0200
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

On Thu, 02 Oct 2025 16:57:35 -0700, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] MAINTAINERS: Update Jessica Zhang's email address
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b076ed3017529ec528f2f28b8f37242a6a29a4b0

-- 
Neil

