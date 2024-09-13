Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC6977ABA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 10:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BD810ECB3;
	Fri, 13 Sep 2024 08:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eL3tihE9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D149310ECB5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 08:12:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso8066855e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 01:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726215138; x=1726819938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91mRVMd2vhtU530/+TgkYOHm6YHa2hzyKxVkYXWa9e0=;
 b=eL3tihE9T7snSn6apVU6VS0l6xPh7mAPiqljNACbpcthVUcnuOgul+T0CVdDk6TLuu
 PdUE3zTyD8zzZ7AgPXvNzbMJxDJDIxnplsYkkaMuCVtnVO/6/JYpTVSKAXZuteFE7yeP
 NWoRKOI0ov5yUgJsRUIL5SZMzGrdCbYLpsW6bZDzPXIqRKo9X4/+CwVewpwC9580mTXd
 AnW6IE9rzV0w5wDTwT7cTsBjGRDfI9FhdYaoba8Elr3TH7So1tuBYGDkQmBL0jad4pw/
 3QahVgRMCwqaP9fAYNLELfz/yCd9/B93ex5lzZEvaSIRCufcczWGcCL5B7vtUAz4b10v
 Q05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726215138; x=1726819938;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91mRVMd2vhtU530/+TgkYOHm6YHa2hzyKxVkYXWa9e0=;
 b=CnA4dibo8auIXHaP2HpVdl2XX4OQshHKiDSzu2WNdI8XDZ7Yv91KOCT/ipqa0f6ufC
 LoZP3NQKzUSHzWJtLFiyifBnWZSHZMhn5KCGYmMugK4mRhsv5tZnFBOAKw1Ml+Xk+4lP
 0S3Vr1eN187pgq6+ce5OcpFTJEWhHuyKF88o01tQB/YddoV1xTb7ALscmx/gfmaDCxTN
 XohCjUhd7Xj0pGYqZzJveWDrPHq2PdOMYDsjMpLXBLoqY70Nv8OD9IHV6mUqelz28ZiW
 o6f0UMcrfHrGdVj3Q9PVDG8BiJBDcq3PnaZj3jNBlAwBcqqU6AgUFShFll/uBQhpkEzP
 znkw==
X-Gm-Message-State: AOJu0YyRGk5KqAwQ5MvxR3DO4RC0/uUrf2VF0rvgtPyYjtXrh6p6SnoB
 90hYToo6LLeVrIPsLQcsyAqsvk53T2uBxt4dOHzzUV59vF9vzH9JeZzL1rCbIlQ=
X-Google-Smtp-Source: AGHT+IGwA+aeL8d8gBdinh5auwRgrcbjJuOako4emQukDLrktpdPJvwcvs9zLinFyxiUkKcXseJJNA==
X-Received: by 2002:a05:600c:5107:b0:42c:bd5a:9455 with SMTP id
 5b1f17b1804b1-42d9082864emr16365285e9.18.1726215137907; 
 Fri, 13 Sep 2024 01:12:17 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc137556esm106939955e9.1.2024.09.13.01.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 01:12:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
References: <20240904120546.1845856-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 0/3] Improve tc358767 debugging
Message-Id: <172621513694.966490.6966201660178351575.b4-ty@linaro.org>
Date: Fri, 13 Sep 2024 10:12:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
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

On Wed, 04 Sep 2024 14:05:42 +0200, Alexander Stein wrote:
> this small series improves debugging the tc358767 driver by using
> dev_err_probe for additional information (patch 1) and print IRQ
> debug output only if hotplug status actually changed.
> 
> Changes inv 3:
> * Collected Robert's and Dmitry' R-b
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/bridge: tc358767: Use dev_err_probe
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/446967304b5671f9b9e5b1b7a620106b4fd6b1f2
[2/3] drm/bridge: tc358767: Only print GPIO debug output if they actually occur
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/31735a97cbd81bc3d858b44a56c8e8dc134a0a3c
[3/3] drm/bridge: tc358767: Support write-only registers
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0d317e820d40963a63eb61732784f23ca0e82d23

-- 
Neil

