Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 733E5A351AF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 23:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8553610E139;
	Thu, 13 Feb 2025 22:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PApAhFl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4F10E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 22:55:52 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30615661f98so15784091fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739487350; x=1740092150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/24JPm7Fd6JZXHQpZIKrpL+icINzVWbUkAHKK0IjNBo=;
 b=PApAhFl+WAJBbDRiuIMDGfSxZs1NyNlXtLIGaUH9frMFOCKzIrOlqpi5qpjCVAik5H
 Of5xw4GPIBaxTYtuHe0Hm9UK+6yYE0kfMb9RDZSfGsnKBxRuoO+1nan5hFoMnjnxGhBg
 tpJcLEJbw2ZZOGM2Pgw/iSU6w6Q3AHX6WP3IGwn+NROLIZ66xCQDQtXTjTAOAYqGnT+O
 FvGOycb+TcAOhadR+l2tRiZTM423DsYDYByqXF41/5BvCd59fyLGBR4tCnOP/dquGgKT
 6dyEuZE6qSjnkz5kGmKYQ6tZ7AWLt5/G/bUgYIAXcsrTbbtebh1tYy7QSMlzL3kc8Tpg
 LMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739487350; x=1740092150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/24JPm7Fd6JZXHQpZIKrpL+icINzVWbUkAHKK0IjNBo=;
 b=SSIywGBAVOR2VhBFNDzSU5BPDAfw5dNH7pEAqITVeNlGCUSbvn+rD+Sc0PGBCiePMN
 lR5Njx4Hl3jaR8LDUtgS3fVWh9bMbaS5N0gUXh4sCDsgDnxMzOSf5eT/PBy23a+5eHoS
 pi3pOgnagXIIYDo5qjjq5K2EDjTBlV/KuUaaMv9JJrKVDO7bcTkCZVXVrHIu6AV3HSUp
 J2BL5OGdB3ZD5Jvi4BmkdDhNnqSY5iKQL+czmJf05ms+7F/dEskUOgeAR8UfVDJ4e5gL
 b2IKEenBD8JHjRmB+hd8FihJEcKz++SJNlDryl9i93i451TDh/hxss3shFxBLdWj8ruc
 8IWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5ACJQSYY1kwXlUD9QZ2f/1s3ECEMp9xv8n3AuELNoYytEWoeYrVk5cA6oaF1G4YADjjHvBrRFGZk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRPmT43qNoAVAIqnD00lBBhtW5Gamm5LPsZeq+9Z2jW+pDPIQA
 kr56e4Cp8Ooq2nyNgjybhw53F7fM4AZDph/2DSmV4HtGdu0bnfTcyRy9Zl5k88Y=
X-Gm-Gg: ASbGncuSt+tHD+QnbvOOr9hmYMI/aHrTRqortgBQcXcuSPG3BLDgdJ/AxJZHJ3Lbimc
 C/m/1D10LhPq4pSvDVHbZkEwCz3sKHIEdUrib7XyqO8PYxZ5TeHKuUb1NKZfXdMT9OX0+9CipqY
 FQG1UzMVJ2GPuWll8dcJvr8fmwM7VRMUJmSQ1fwtPI3Q7xz59qa9PHJMZ7Kb3BApzCN+3E9DvPn
 IHQEmaY/9+SFOak6/+EixUaHMqqIK47lvTBQqThfOxvckftS8lpoDKosqdZ7oTl45erHDgrDwRz
 fELgl39G62YkalzBtpqW1WOmzO9ISjNHhLgybj7BCPxnussUyVPFstZZLUg=
X-Google-Smtp-Source: AGHT+IEZ1626++5xMDHpo0WMOzC0N7lgwh+1qvbo5fUuwYvi+B3DfqXZdqPho8NHik66LI3m5T0N+w==
X-Received: by 2002:a2e:be20:0:b0:308:f6cf:362e with SMTP id
 38308e7fff4ca-3090dc65edfmr18377611fa.4.1739487350464; 
 Thu, 13 Feb 2025 14:55:50 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::7a1]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091011d566sm3377011fa.46.2025.02.13.14.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 14:55:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Simon Ser <contact@emersion.fr>,
 joshua@froggi.es, Xaver Hugl <xaver.hugl@gmail.com>,
 Daniel Stone <daniel@fooishbar.org>, ville.syrjala@linux.intel.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christopher Snowhill <chris@kode54.net>
Subject: Re: [PATCH v12 0/2] drm/atomic: Ease async flip restrictions
Date: Fri, 14 Feb 2025 00:55:45 +0200
Message-ID: <173948734065.719858.7405160715916126757.b4-ty@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
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

On Mon, 27 Jan 2025 16:59:38 -0300, André Almeida wrote:
> The goal of this work is to find a nice way to allow amdgpu to perform
> async page flips in the overlay plane as well, not only on the primary
> one. Currently, when using the atomic uAPI, this is the only type of
> plane allowed to do async flips, and every driver accepts it.
> 
> This patchset re-uses the per-plane function atomic_async_check() to
> this purpose, so drivers can allow different plane types. There's a
> `bool flip` parameter so the atomic_async_check() can do different
> decisions if it's a complete page flip or a plane update.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/atomic: Let drivers decide which planes to async flip
      commit: fd40a63c63a182aeea1089a343e2f729de7e514d
[2/2] drm/amdgpu: Enable async flip on overlay planes
      commit: 41129e236f14c6c54145c722da06f6793e9fd13d

Best regards,
-- 
With best wishes
Dmitry

