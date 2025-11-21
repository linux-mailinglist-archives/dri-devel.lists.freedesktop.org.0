Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66356C79787
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA19410E86E;
	Fri, 21 Nov 2025 13:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VEIJ8owk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B06E10E876
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 13:35:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so15491445e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 05:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763732146; x=1764336946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQTDlLSHya5ZJFcSZ4CgYKRRhdfnceV1QeecZlmRQYU=;
 b=VEIJ8owkAXLuzL+gvHxCcZm9Hk4d/w0/t9mvBfDAx9GD/kAxbzlEfnPwYxYERsIa36
 kwf70pIKxx7nUO2nYJxDdOQWzIJTxsiZAHnUU8rNp5GhKv7N4fCSEPPrFHUG24yQ3Nd8
 HMbos7iZQyx7/0m7NjoIkm0/2uuA7PUBpYI4ktlir0BqVvtcrV0BioiycMEmsfBcyTE+
 paOFrs+0cBJxqRIH3cjlKWKcnO5hew8vECg/cEZ0RLUgYdphVH5L0Pdjkx0kEF6B33G2
 dEppf3TLPA5wSkiVOFA2XTKCsiPQVg00chsq1N2SCn5YW6R9LtwE69qA6df4af927WlF
 bXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763732146; x=1764336946;
 h=content-transfer-encoding:content-disposition:mime-version
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JQTDlLSHya5ZJFcSZ4CgYKRRhdfnceV1QeecZlmRQYU=;
 b=ed7GCD1KRERxHuZKHxliiAZaBXSrOVEKe9uvN57hr2j/vUrfsHqka08kofHdwb5oXZ
 +hGiNfoKXHyZWWAahB92klTWW38LL+He31ZHHMdGXAdEz3ny/t7YCuUzOQNSlZdhyuaM
 S9ioGOsPlpkabPfyvUUGF7v3hJegS040fhbVCTbTe7E/MsufdWOBSuKse5iEOPsuzfYe
 AwIAnTO6D2yQlundVAYpq5st7E6VvMlGKwsvPw8L5YRVf6YbFTKd0orMu+DkXbHdT6EU
 6Jatep8EPDzDROLCGRmxRy1LS2auOigAhy1JXxeCC2pvrNwt62tXBS6a+8EfoIMYPYi7
 oJWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzJi+TgzdFDzIeR/bSzYz4LAH4flNp4OJui3K6nmO5Hc6Qf1MaZo6nTOyOBGaUN2Tz0b3EJSYkB+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiIAMjLoEpQgrUCWsiymtbzU//tm6fWDjF3G7VnIHXiYtycGL5
 bQjxRFMscZTiVfpLCRZcAHYuQyXNS0HQheCEPYcBmu6ZElCxS9bsPQ8LCzUdsbx7G1E=
X-Gm-Gg: ASbGnctxmFjUG9OjC8X0EW1KnTEz6l+9cKbx5PSQ8hOGMKfI0nH0BrtoIdhbyl/4fLN
 EjWfEHPJ88RUKJhJQ2WbiV57zucuoBVoN2xSrOFlMv8Z2M+DqpWlh4/bTDC2mX05N/QOhgZ1yeV
 qA7UrGGNfqh+mXDQJiP3h+ZdmQke/+tzJLOwKZd4/ZqLB/KcEOIChvgAh7ZfxGOVhjp1yPCs5Le
 GL/u/wnQcOB8L91Gjtcq/BzDQJNLOAcbFzMMd+ccsgevFCvN08v2bGC/GryXT1HOlnuws4+WgKG
 gqHOcMJIMWjnYMXs7sBi2faRdVAxIMhDYmkuVidptHXAC5gEfke1A6H4MoDg9Xvx+Vx18Z1lAZ6
 DUv2AdOo1k3j6GBT+luaY8KrfcYkRUBLyCDJBwj/kVbXgTI+CZFtVVLE1c304vmwushigYOR9Cv
 wEt/cZvLaG++jXVF3ypKwYjYIZ5lo=
X-Google-Smtp-Source: AGHT+IF48UZsl84AvUaz0yRQwq1RSA9byQE0yoohws0P1EphOv9uOpY2K7n/i7Twry36Uhm8udlIkQ==
X-Received: by 2002:a05:600c:354f:b0:477:641a:1402 with SMTP id
 5b1f17b1804b1-477c016e74bmr26120025e9.4.1763732145659; 
 Fri, 21 Nov 2025 05:35:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42cb7f3635bsm11262391f8f.17.2025.11.21.05.35.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 05:35:45 -0800 (PST)
Date: Fri, 21 Nov 2025 16:35:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
Subject: [bug report] drm/amd/display: Cleanup uses of the analog flag
Message-ID: <aSBqrjTkmpMhLJmF@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

Hello Timur Kristóf,

This is a semi-automatic email about new static checker warnings.

Commit d46e422f65ae ("drm/amd/display: Cleanup uses of the analog
flag") from Nov 13, 2025, leads to the following Smatch complaint:

    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:8858 amdgpu_dm_connector_get_modes()
    warn: variable dereferenced before check 'amdgpu_dm_connector->dc_link' (see line 8846)

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c
  8845				&amdgpu_dm_connector->dc_link->verified_link_cap;
  8846		const struct dc *dc = amdgpu_dm_connector->dc_link->dc;
                                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Dereference

  8847	
  8848		encoder = amdgpu_dm_connector_to_encoder(connector);
  8849	
  8850		if (!drm_edid) {
  8851			amdgpu_dm_connector->num_modes =
  8852					drm_add_modes_noedid(connector, 640, 480);
  8853			if (dc->link_srv->dp_get_encoding_format(verified_link_cap) == DP_128b_132b_ENCODING)
  8854				amdgpu_dm_connector->num_modes +=
  8855					drm_add_modes_noedid(connector, 1920, 1080);
  8856	
  8857			if (amdgpu_dm_connector->dc_sink &&
  8858			    amdgpu_dm_connector->dc_link &&
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Checked too late.  Presumably this NULL check could be removed?

  8859			    amdgpu_dm_connector->dc_sink->edid_caps.analog &&
  8860			    dc_connector_supports_analog(amdgpu_dm_connector->dc_link->link_id.id)) {

regards,
dan carpenter
