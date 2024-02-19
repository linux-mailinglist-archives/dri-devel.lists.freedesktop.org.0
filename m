Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404A6859EAE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 09:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D922410E195;
	Mon, 19 Feb 2024 08:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T2qq0eMN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F03F10E195
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 08:47:16 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4126099ccdeso11402875e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 00:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708332434; x=1708937234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YkKhuvKsEed9Py7C2fiWGDe+5remAmNan/P66AVdUhg=;
 b=T2qq0eMNnYXX0SGMSMiRRR1HLDZT/8FNmewUcDa5PhqCPa0pZtmbueLWSwx6KOP41e
 tCGS7/L1UONOtJWdZ5I3V44/Z+FaY9oywUTcQBF8DWGPEUvPV5hQux8QlJAhYw8Cc+Mm
 jrMOAdjUKBowYWgxRMAm9naT3z17X6iLcbFz0U4qB662fBAYigemCFCTZpcij1pvUD2a
 /zfnN+9NgIZwkoOQMwZqYqqUpjXvd/1snaXPJM2eNFuyENAlyE65tc04DIgEf0M2XrRj
 FH8L93LRwh1CM+QBk6mWe3T+dShozWfsqJtW+zYK//oGKBK9AE8XAUCI9ZTh6b1wIkPf
 s6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708332434; x=1708937234;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YkKhuvKsEed9Py7C2fiWGDe+5remAmNan/P66AVdUhg=;
 b=bGxhPApiJmYstH7oXU9MolRn8FLZe+bDVVovo7ajCxyzSUcaOOSUEN6rtLBM1krArm
 eWAjLuuPizIFcBAEw1M0Ipa0WoAZF6gFSZsSnv/eADAKVCkrZr34/FbQQ3o1zRHzO0/8
 BRJDlY8nugzqF5/KzqSVKXTGDLkqaT+ETuoUKh3p+pzK65WE8dRzGcU99WJPLvAPABhL
 w1e98BvJek94fKvQuxZ6sdf+yl0WFcGJ6yX2Ifjy5LPVTZYfMG/rMScTMB4canrPBfu8
 /NK98RwFIPdaERhW3oF70KfF83G4VXj6NhTMvZpENM3gv5Y8A3PnbgVR92Xg8bfTY0P6
 +i6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkZq/w34TH0OwxKYCYbitF+CuHZUgwlkIRk9JtWt/Ry1JPSRan1uyTTlv9QlbED3AVHZCr1uSnVD9CEpwQ3tQ8sSZqYboIOfIQpe94NODA
X-Gm-Message-State: AOJu0YzIDGUZtbpBL5WOLKFpacJ7PC0FEdNkEsakEtIj56oPKToK+qme
 S9RwbEMppf1OTLF9j334JNFkaU5/yAfwQAxNeP9qC3O2uOls+H86lL/J1o0HqaE=
X-Google-Smtp-Source: AGHT+IEOJaRgLUfw1Fy36Qpxf45JsPYnzvIpHgy+e0TCI3oFwEedoWRDKzdVN3pgzb2tsjofWGis/g==
X-Received: by 2002:a05:600c:198f:b0:411:e5c1:e573 with SMTP id
 t15-20020a05600c198f00b00411e5c1e573mr9008685wmq.7.1708332434066; 
 Mon, 19 Feb 2024 00:47:14 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a7bc8c5000000b00410bca333b7sm10499211wml.27.2024.02.19.00.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 00:47:13 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 khilman@baylibre.com, jbrunet@baylibre.com, adrian.larumbe@collabora.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Steve Morvai <stevemorvai@hotmail.com>
In-Reply-To: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
References: <20240215220442.1343152-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] drm/meson: Don't remove bridges which are created by
 other drivers
Message-Id: <170833243318.1719293.16562400747417002919.b4-ty@linaro.org>
Date: Mon, 19 Feb 2024 09:47:13 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
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

On Thu, 15 Feb 2024 23:04:42 +0100, Martin Blumenstingl wrote:
> Stop calling drm_bridge_remove() for bridges allocated/managed by other
> drivers in the remove paths of meson_encoder_{cvbs,dsi,hdmi}.
> drm_bridge_remove() unregisters the bridge so it cannot be used
> anymore. Doing so for bridges we don't own can lead to the video
> pipeline not being able to come up after -EPROBE_DEFER of the VPU
> because we're unregistering a bridge that's managed by another driver.
> The other driver doesn't know that we have unregistered it's bridge
> and on subsequent .probe() we're not able to find those bridges anymore
> (since nobody re-creates them).
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Don't remove bridges which are created by other drivers
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bd915ae73a2d78559b376ad2caf5e4ef51de2455

-- 
Neil

