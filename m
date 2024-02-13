Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698418535B3
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 17:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358DC10E85A;
	Tue, 13 Feb 2024 16:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x+s9a9FX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997610E85A
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 16:10:16 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51167e470f7so5517531e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 08:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707840614; x=1708445414; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJKUUFTA0CdrHmvE6Ug8SOMjnvae40DHkRJftVt5u48=;
 b=x+s9a9FXu0LrY1tMksmiCNhFqGNk1x4xfCOpSoWIQolHpmSePj2yPovkNFurE1wcxg
 xU4VIo3OuMQOxrvyjvFBSOf8eo0f+WMb31pdpl3pf6vhEGAQrbj/9ZsuCYhlUTK08AOK
 oUlsHuUrN8bQUecTneTWEYQ1wjpeXgIdFel58TCJ/2lLcEykHwM4M7xAq55JH8xmVEmh
 aF/WKd8FiYWvExEuatGK4v3iIOCQEwJ2fwzRHvg2+cNQCb85jo+2lRB9jO/Y4G9mM2uB
 UWvEx3Xn2VcCOOYseGXivTksHLTQC8KQPziQzfmMDxLF+cJxz9oB3Gef5zO9UY4lE8Qt
 ve7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707840614; x=1708445414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJKUUFTA0CdrHmvE6Ug8SOMjnvae40DHkRJftVt5u48=;
 b=qxIyeKSsv4EUW32ZlXJOhZHBoVGbNCBOErYvXbg8wDxngxVC0Hq7+pMcvO/S3F6+vY
 6t1YHp+BGo1paiQ2defAFSVLQnwfkI6xjjTjAZrt+LkVUchmstujkrGgzc2IXytazSn9
 XQCOpTW5viYRBEC3/7MJov/bzeZll8gcyJVdSAk/O0eUpxreTC70sR76YxMaOFigrGBx
 rrZ9SsqTE4hVa6rDzjO3XjjSmcPbKj4QV8BdPx/LIoGxEhoirUG2BIXJF85kGOfBaICe
 kW10NCcY8FHLBVonSc00dIw1+vuTP0RxgHaciMRyAaKGs5bCAUcK3We0ZIBW7M6yVMYn
 40Lg==
X-Gm-Message-State: AOJu0YwQqWqNzn25dHP+r/NMUiO0krBu2SY1KyO4Dn/uQCokFkuZAsHT
 XfI8OJyGeonI26CcZCdR5xRcvK+dXXaoQT4O129G8CUYKCOB7RZXNqGxtepzmqNxRo+LdCTGg2z
 X
X-Google-Smtp-Source: AGHT+IGTFXXW8YxjMGYY+oMpZFD6bzjHghivDo9sbaJPl7MZaFAbm+z+TRbkh7kxg81WPddiGa8jow==
X-Received: by 2002:ac2:499d:0:b0:511:9f5e:b7ab with SMTP id
 f29-20020ac2499d000000b005119f5eb7abmr439081lfl.50.1707840614357; 
 Tue, 13 Feb 2024 08:10:14 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVzJwQFlatJn5vWXcqUKBmGaKD++zC2qjQKbpLATzLJqfmp5P8ISl0NSqigQszPM1+H6u7XziMNpCCCTswN7UMGJG/EEZ3P/NNk34YUTRSmQ6T2FXuTwS7YU+2f15NdCSx33k9pp7hJJlSMunmeF6XH+wUvE2N00/ja1mKkfIufNHOdVwCSSFFEi1oslnu7dn38tRI/YyOYd0QumhqDOwUqx9FCkIUc4ae7WPB274fOoGJQWMhUbvDNuEHFwYbxnq4Kv/ozLEVKAk3SQyeCU/3aoGSkat9kHsqPzXFFxyL8FxmVXkkzWgCk
Received: from eriador.lan (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300::227]) by smtp.gmail.com with ESMTPSA id
 t16-20020ac24c10000000b005115317395dsm1316102lfq.7.2024.02.13.08.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 08:10:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	Rob Clark <robdclark@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/crtc: fix uninitialized variable use even harder
Date: Tue, 13 Feb 2024 18:10:11 +0200
Message-ID: <170784060080.666897.14996571723108482636.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212215534.190682-1-robdclark@gmail.com>
References: <20240212215534.190682-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 12 Feb 2024 13:55:34 -0800, Rob Clark wrote:
> DRM_MODESET_LOCK_ALL_BEGIN() has a hidden trap-door (aka retry loop),
> which means we can't rely too much on variable initializers.
> 
> 

Applied to drm-misc-fixes, thanks!

[1/1] drm/crtc: fix uninitialized variable use even harder
      commit: b6802b61a9d0e99dcfa6fff7c50db7c48a9623d3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
