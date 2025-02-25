Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21EA43B6F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD24D10E60A;
	Tue, 25 Feb 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qT9VwGzl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B6010E60A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:25:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so51242755e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 02:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740479137; x=1741083937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jO8Oylg6YjBoTtqrf0241KPt/pqvJPTWmEtRbVr3k2w=;
 b=qT9VwGzlxLW46oF76fKpr5nYW22rc7r6x7hkiVLyjydZ/aycKXyL9qucuFFcwuYs19
 pCP6+OGIDYiNKgedATba/twI3JXuwQndbJl4SxTqtL+iGi2vNSHG5OBIyIpQt+ij+wxo
 CfIVgJQ3MPIsI8U7VnZ/BSD8AnBkSZGo7m6ZXFFzi0uJ0+GcY76eBvmc/2bl76sWcQJ6
 mr/+zrJ/f+P85PmS5uO7G17d9f09osN7lxC8ojm8s8wT/m4UIo6A6Iiy34yIEvjN6QcF
 iFXCoykZB/Ttq4+hnJVGWu1miSLOjUbcmGk+ag9RPjx2yk/TX5jsHXa16pXSGwUl1n2E
 IJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740479137; x=1741083937;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jO8Oylg6YjBoTtqrf0241KPt/pqvJPTWmEtRbVr3k2w=;
 b=KCtssP3PvLYFZtMp23oToVpAcNXW+E+9n3jDq2KncvjwooNlVmUZgtZip+UAVcmJhx
 8qqZ4Pg6YMiiDYeYdqn0DTGFenvrO3Fhdqd23+KMMas0ADRJjrWNBcuj6pcd70Qu6G5T
 KtSHu2r1g/u32twl0HC7IhwP3sMjL4gGtpHNYbbI72hWErPKECS4oP4XDXsjsvaBlvu1
 eUOfc4j5T6RlWnTPlWd98OWUYQtdaPIFDyB/1x+M4jgGy3ApbK5EN6nImyhLZ2iHwOvn
 VBym70eQl3ls6b3DqU5rkv3X641CjcJsVG+SagBn9lR9R94/CfpvwzMQKJKBmUT0g8/q
 DuHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQ1Q+EmtCSumXxxB1XQr61F1GtTTv9LUuUzMp85yyhHUin/zC4InNib1G7I1WrUnBhFnaxYKSV3KU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8EbTf1KamAR92FOfh2jze9afdLkzx6xHTRf0VTVDi4Rtu1Pvn
 ltZmFJY0rww/eShc7nvYaHUIQw0KBtx73jrELTo92dfZR8A/6YKjG6WrOjWtqkM=
X-Gm-Gg: ASbGncvmML4srcHthmvi5mSq6Gs0FFlWRkNwWLZNZYvBzKG5a/R+ykv3Aobse/KKPVn
 5+8UEzybC3CbsufuF9242vlGGuZ7niZx5Zz/LpSH0yox2c39zzS03A4wFxzoDYUoYL4FCgU5H09
 B+J7yIX72vEqqo8ppMUU7jouUCSg1yeXyayNblmqDGLcYZb5tHePS5i3PPLVFpE9+GrfWdzfSOw
 wd4W7z9h/sX5h2MaAhY6VTBih7rjeCIqpqiqhVFmJHnmTjfFqzgKBzrMvX0EvhDAppsZ2fYpza5
 2OD/CIPwPZ1WilEFMmhMydiZPluw7ZO69Kh5WqLkysMXwG8=
X-Google-Smtp-Source: AGHT+IFBoBkLT3A0xWLdkZ30bRcxu5mltnumWdHZho2ezloRlAbVC4RMnE9SJiNp+9to2P/dJV/T1w==
X-Received: by 2002:a05:600c:1910:b0:439:98f6:8bc8 with SMTP id
 5b1f17b1804b1-439aebcf61dmr127211825e9.26.1740479137175; 
 Tue, 25 Feb 2025 02:25:37 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86707asm1764378f8f.5.2025.02.25.02.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 02:25:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250220045721.145905-1-tejasvipin76@gmail.com>
References: <20250220045721.145905-1-tejasvipin76@gmail.com>
Subject: Re: [PATCH v2] drm/mipi-dsi: extend "multi" functions and use them
 in sony-td4353-jdi
Message-Id: <174047913628.2131221.5126510455783898165.b4-ty@linaro.org>
Date: Tue, 25 Feb 2025 11:25:36 +0100
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

On Thu, 20 Feb 2025 10:27:21 +0530, Tejas Vipin wrote:
> Removes mipi_dsi_dcs_set_tear_off and replaces it with a
> multi version as after replacing it in sony-td4353-jdi, it doesn't
> appear anywhere else. sony-td4353-jdi is converted to use multi style
> functions, including mipi_dsi_dcs_set_tear_off_multi.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/mipi-dsi: extend "multi" functions and use them in sony-td4353-jdi
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/fb13d3497bdcf4f544be25f716b6bdf1a4f8e63a

-- 
Neil

