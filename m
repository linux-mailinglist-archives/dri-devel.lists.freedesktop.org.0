Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E45AB1CB7
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 20:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8EC10E064;
	Fri,  9 May 2025 18:56:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ygj5BVBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5741010E064
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 18:56:03 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso18993325e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 May 2025 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746816962; x=1747421762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
 b=ygj5BVBCJVzy9Kml0bZmNI5hAj9/wsH+zp/d2betLo5NxNAT+As/Dy55h4ACbG/AaI
 9NUoVIBUf6qewX01eRqkKCFQfUr1PQS3z1lfEEv++fhgMvA1uxJjaoFIZlu1Gn3fq7wT
 nfCbTlADbGZEVxY/ioVHRhbDw0FsmYGUhszjLxuR3FLTnb0Pu6GZ+xxY+a9VPvPiXH7J
 qpTxJ2NCebZbnfVhIkF53YAhEPls2OPtkNpehvozZ/SZe5lZWNBeReh9lSThx4ZAm/eo
 wzufY4lfznqcTR998eU06Aj06rBNcc65O2SWGq+Yp/tkpNUQZVKmieqcflHwHnkURocj
 NJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746816962; x=1747421762;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BbxtS5yi/0Srg9MgfDGhVG9mOHgxoToLsBc2u3rrXu4=;
 b=bgk05NQ/4qrevFcYzh8LKmBkm6NUXQwMgK5+m4vPM0T0hLsXuyHnt0cXQy+CVFxh9w
 wHQzyuCkU1wiSLfguRyfzHYoXpDi64cksmUmd8tK2bUNHH4lPocCNwljG5YKJbv2aHs+
 F3rVXNkAw6xPu3SYkiAIYfILYByGhTUJG7xOQAVIwN2LNzrTA+R/6NjKhysJw60AM9Sv
 PqMzh4Et071aHEDn/eIEbllfQlTfgOB41Jss43pse8yrgxmgbFehnX73DPzltnuiXUhA
 4s/xLbOBOio/OBXy8QeLG8udVqX3XU1J7cBD6OP34/AQCj3TJHrO2CpDfHFxyLsjWOSz
 e9xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLcXjt6kDcUPh3LrmLvYCJFRhlrdIok/O1S+ro1PIbMelozJ8M9IVZ26dAZT55Ty+hOo5XcBV6nzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFNcT8/3VHTdBnLWMfgmeAUlBwzHPs5JckzeYpikqM1vIjjVv2
 9zxwr0oLkkAHdZ3YxKCk5I+oEpY8jvkWpJZX25twzVRYnzaIyg04GPqC0hHS8Hk=
X-Gm-Gg: ASbGncsIRR5aKrdhmsQ0IgMtYtcep+CIJbQSGTbIGS0voL0YTb7WW4QmDQuSmxSvUod
 CPJgR6YV8DUuEA6FCUsBadF2/4bJeSqrtiT22P4v7NrBLVaZNoSbAnNCMJc4QslyboeNqjusUl6
 O9gS99PqH9Hzg2GJC2RQsFvUgBHtrfPYqJG+E+6763SQickhGFeFBlFqhK0NTo2Po7yBz96GPad
 nxAKEedEf0nIX12+EYzuP4Z+M9Eno9w1gjQ8a1iUDFXHb9/YrRniJPe5WVN9oJAaoP40qxll6Kx
 k9KSf0L0l3aPDjzzurtMc5x7j0eRhi68L+SmWPRkiROCdMYQdduokcuaCdkTAlA9OGRc6yV0
X-Google-Smtp-Source: AGHT+IHYQkpkKi8CkEHzddCWOZceMUv66ifC4WqdnYwF4TBNK6QI+OtfU0ViTWxy69iYNRZgfgnN0g==
X-Received: by 2002:a05:600c:1550:b0:43c:fabf:9146 with SMTP id
 5b1f17b1804b1-442d6d6abfdmr45281565e9.17.1746816961791; 
 Fri, 09 May 2025 11:56:01 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d687ae10sm38009955e9.37.2025.05.09.11.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 11:56:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr, 
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250505184338.678540-1-richard120310@gmail.com>
References: <20250505184338.678540-1-richard120310@gmail.com>
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
Message-Id: <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
Date: Fri, 09 May 2025 20:56:01 +0200
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

On Tue, 06 May 2025 02:43:38 +0800, I Hsin Cheng wrote:
> Coverity scan reported the usage of "mode->clock * 1000" may lead to
> integer overflow. Use "1000ULL" instead of "1000"
> when utilizing it to avoid potential integer overflow issue.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: Use 1000ULL when operating with mode->clock
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb0851e14432f3b87c77b704c835ac376deda03a

-- 
Neil

