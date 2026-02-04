Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IESINpSCg2llowMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:32:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706BEAFF4
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 18:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04CA10E6FD;
	Wed,  4 Feb 2026 17:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TmQ5dIxB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991E210E6FD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 17:31:59 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-432d2c96215so104257f8f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1770226318; x=1770831118;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y2G2lXD141iBSL0L8iFrhRwAFQpSji3elNwlUZQdzaI=;
 b=TmQ5dIxBGhVFbpP7gW3qxZs1t0K3dG9zfsgZ16BliCl+d6TrONlv9W8BukjQ1J0YHf
 6tSWcsodZ27KbebBM0EAe5MFT6Wvvwq3IERqpT/a7yXGIQKnxYe73JO0QvvQhKshmQNZ
 fNnEW+aHJljA/qPy7qAUVLROja+7rt0zD8HjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770226318; x=1770831118;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y2G2lXD141iBSL0L8iFrhRwAFQpSji3elNwlUZQdzaI=;
 b=h1Wj6MgTtUR3nKPXIJmBIPZY3Sq9sIrEFBr7s8Ga/POrFxjP09lEtpRfcwzDiq3bzW
 EtR8+dmTAESFaQB8qjm6aEkNB8vpzKVz2bjgJcTkDY6K8Ic807Hjz7NFjjkJBsu9Mu9n
 cnZDHIdnwS3EwSUuqidX93AdA2e8fG+A/ptMEqXi3wgMQ91Zdw53AcRYAXBHA9E9H9sk
 d1Eu7ZC4L+x69zwCMfz4rGUuXvzVFMRWvcaaBpoXOtCV7ExhaO5q1O/yTzaC3rDnIX0o
 6i9lHDDOdkaqXgAf93IXhUO0zR65Ml0YvyiuauvIHZxJqwPZ2qd7xX7kpSdy2mynVuf4
 iwjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaZTbsqpK/b90SgG2fUg0sSQJqeei2sfSGEjBQVjcuaAS9atVCNDBGEWbrp8S7g0MliFFUjh9TsNY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgphfLla4PWO91QYniQsKucuBfxA4LBUrhpebQB/jfpcrnxrGh
 V4+W49WS271WC88zmwal3Fxos2uNtCgj4H7/krNTU1jFNBd2ipuM7TwpmIZNn4MghlY=
X-Gm-Gg: AZuq6aID5NRDS3iyiesuFjqwtpRRxNMkX4w/+csKp5KSU/62gBEanxZnDPZWMIgnzFK
 MJ0qTxgY/o/WF5UWcBXROwXaSCXY6wR6PfAV9xeoWSkApWRLDeekTzD8ZF/Heqwtkr9wFKNz49C
 pvLee0pE++NW1RRfYongCClnAaHiA+aDsDoUrFVlnYXC74yzIyZZhHCB6ZUHASH4SnXY0/TMNcw
 8YzfJkr3By8a+FWNIbfM/pDeDybOD84zRbexuaNqVQzdsYkVy7x1vK52KI1yvH/dabpIJvLmh4E
 8sDErOxz4SZLvkZzyUX7hWFUx+94YfjB4xs+o1UIXn4XzDpfX3h8/OAF57f8h8Di0055f2P/vFi
 rpUVVRZul9wMpxoCO1fR59Neh193ys9PfvBpW/DS+No7g3sRw6ZmC7F4/PHAm/8aBfVuD49NOUG
 O5deu8C/n/MHEbrXv1OJ59YKrCR9S70dcIeFstV4hKHJQEQrHxlyypO69fm5Fw/u/6rZF1WCLwg
 AU2LcAKfjpulYb0451+EZ3gQwnnuU0ADSePkNQMkKt9
X-Received: by 2002:a05:6000:3104:b0:431:35a:4a8f with SMTP id
 ffacd0b85a97d-43618059dc4mr4909933f8f.47.1770226317966; 
 Wed, 04 Feb 2026 09:31:57 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.58])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180640f2sm7241565f8f.39.2026.02.04.09.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 09:31:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A support
Date: Wed,  4 Feb 2026 18:31:16 +0100
Message-ID: <20260204173154.337674-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amarulasolutions.com,kernel.org,gmail.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3706BEAFF4
X-Rspamd-Action: no action

This series extends the Ilitek ILI9806E panel driver to support the
Rocktech RK050HR345-CT106A model via SPI.

To achieve this, the current driver (previously restricted to DSI) is
refactored to support both DSI and SPI variants independently.

The series includes:
 - A refactoring of the existing driver and Kconfig to support
   multiple buses.
 - DT binding documentation for the Rocktech RK050HR345-CT106A.
 - The implementation of the SPI-based driver for the Rocktech panel.

Changes in v4:
- Fix "WARNING: unmet direct dependencies detected for
  DRM_PANEL_ILITEK_ILI9806E_CORE" reported by kernel test robot

Changes in v3:
- Add Reviewed-by tag of Rob Herring

Changes in v2:
- Introduce DRM_PANEL_ILITEK_ILI9806E_CORE hidden kconfig option.
- Split core and DSI logic.
- Restore vdd-supply as required for both DSI and SPI types in the
  dt-bindings.
- Dop useless settings in case of rocktech,rk050hr345-ct106a in the
  dt-bindings.

Dario Binacchi (4):
  drm/panel: ilitek-ili9806e: rename to specific DSI driver
  drm/panel: ilitek-ili9806e: split core and DSI logic
  dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A display
  drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel

 .../display/panel/ilitek,ili9806e.yaml        |  38 ++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/panel/Kconfig                 |  22 +-
 drivers/gpu/drm/panel/Makefile                |   4 +-
 .../drm/panel/panel-ilitek-ili9806e-core.c    | 134 ++++++++
 .../drm/panel/panel-ilitek-ili9806e-core.h    |  15 +
 ...ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 153 +++------
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 323 ++++++++++++++++++
 8 files changed, 576 insertions(+), 116 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (82%)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c

-- 
2.43.0

base-commit: a14980444f418de53a7cc315eb4fbd8a89c72991
branch: rk050hr345-ct106a
