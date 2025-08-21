Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C96B6B2F4FF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 12:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1FC10E0E7;
	Thu, 21 Aug 2025 10:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="INVJvCGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E05210E0E7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 10:17:19 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-afcb78d5dcbso120545166b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755771438; x=1756376238; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jMBGNe53qB7K6/QwgxbSOAqilozoH1T7Ksw/7As9UoA=;
 b=INVJvCGOwpM8W8Klk2rCWLWrYaTf0q4mRd/AKVlTx37TCaNYzuXK636+6V5+s/Ts0j
 S3x8+6+NoE7Q+eHXrKhhiKhvuS4MSMRo+NvJC2cLiuH0q5eWy3ERih34XUfS+AwbRapA
 6BJmvJDUncoKBWY43AY97jsj4xsyI+hsCb0psBQnJpcfk61Cw/Gap8EeYZFB+rRcIjug
 fjGqK98heSZyh1RCv4NTXimdXO0c5QGUf7CCEsiGAdkv0nr4fMCC0+k9jawVbi+Xc0QE
 j4YQl7lRGmxYSnIoo7m1DLy84eqwJ4JYzD66YjLvZUtjYiuKHximcuXwOYFrPDMyhv/7
 Bo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755771438; x=1756376238;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMBGNe53qB7K6/QwgxbSOAqilozoH1T7Ksw/7As9UoA=;
 b=MGr05aNgcFfvDMDKn3I1xD0fuQh8DT3kROH8h6/4uNPIy44gWZef+1lFgoRqNJdPZV
 kPhZCLlfSZlTluYc/J7ZI9K4CrK+/+u1KK/zGzw+tP8gT9TohIaR41FtqIIGEYfYJIWC
 o8PC8xOoiqFcF1bOzVXZwiw/gkxeb2hfUdBrW/4kVgl/fEItPWWCW9bHtmjKrrtE/ajA
 SmcNhCoXH2uJP74UqHpKDbdaqiClyUPDRZ7OnKmkQqg46W+8YzczyBdPAKNp76Ooz7jY
 +B6O0+2cDW3+DcxaM2gebgO1nMyO8YVik4aOTi29R60+OoRBz00ocw7xEOgf9wsE5ZnJ
 bbUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVFSWrAOsHnKQc5jZNlXNg2rOKg58GFkodqIxQsJs8PJmG8xSLyy81eEEiNZteMJcPLFCHDPnTAh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaSVdZdWZYkaCi3prPAax127K7z70Rw46jWUkXtiLjjGQCfU7o
 mvguy99dDYXEuZnep/L3IwjpcmP3oIgqNr2pqyC4cCCKR59k0YE+DOZgw8qK28oKVO0=
X-Gm-Gg: ASbGncuT/KGszfooFfWqudTGolkYQWq+jItmXjHjKbap4/4lLzvKz0l2L9ZGZX2qDgz
 xFNpg6Vl3rOiPO7z8zKT+AWQRw68atAFd++qV5oa6uSypGiI1k1bcnP0vd2ynmQNHADI+YlLOt8
 2AJzUJHo3/0m/xl79M8vJCVpcXLWlSxXQXRCz/bzmw48gwxsMg10mGLvUQOdDT52Ywe8jBSxJ8t
 mVmlpofbChxOC//JLYDt1ROKlL/d9VBw17Ee2jFa7eo/ekjlMiCEJrN9H72Yb8w9czDkLo25dhB
 ftsCbBe3oOL+XrF8oMrqmAOLgp38YRHUM/bW9nO2oA8QSnVePreY/JwCaZ6xGJ/gV7JRkr5qurI
 Fv6skwL3ZkA/qJW+kWcQ=
X-Google-Smtp-Source: AGHT+IET3W48/CcMp7L9uxYnuFSk+zvgVDhOyGcxMX+XKGh2yPWJrKGqYHuBVwmEJF9Hx7vOlkfIsQ==
X-Received: by 2002:a17:907:1b2a:b0:aec:65de:5258 with SMTP id
 a640c23a62f3a-afe0787cff0mr200345366b.3.1755771438079; 
 Thu, 21 Aug 2025 03:17:18 -0700 (PDT)
Received: from linaro.org ([82.79.186.23]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded52ea4asm357672766b.101.2025.08.21.03.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 03:17:17 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:17:15 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Val Packett <val@packett.cool>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>, ankit.k.nautiyal@intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/dp: drm_edp_backlight_set_level: do not always send
 3-byte commands
Message-ID: <aKbyKwf5XyUbVwdw@linaro.org>
References: <20250706204446.8918-1-val@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250706204446.8918-1-val@packett.cool>
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

On 25-07-06 17:42:24, Val Packett wrote:
> At least some panels using the LSB register are not happy with the
> unconditional increase of the command buffer to 3 bytes.
> 
> With the BOE NE14QDM in my Dell Latitude 7455, the recent patches for
> luminance based brightness have introduced a regression: the brightness
> range stopped being contiguous and became nonsensical (it probably was
> interpreting the last 2 bytes of the buffer and not the first 2).
> 
> Change from using a fixed sizeof() to a length variable that's only
> set to 3 when luminance is used. Let's leave the default as 2 even for
> the single-byte version, since that's how it worked before.
> 
> Fixes: f2db78e37fe7 ("drm/dp: Modify drm_edp_backlight_set_level")
> Signed-off-by: Val Packett <val@packett.cool>

Tested on Dell XPS 13 9345 which has LGD 134WT1 panel.
Without this, the panel doesn't come up at all on boot.

Tested-by: Abel Vesa <abel.vesa@linaro.org>

