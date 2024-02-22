Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05086008F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 19:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A110910E9E8;
	Thu, 22 Feb 2024 18:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nQHthIYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B936510E30B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 16:44:21 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4128d15ae56so4227065e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708620260; x=1709225060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcbNdLGTQbcf2fuT3ItJFHWUdIKmO9oNeQCZ3LPc8TA=;
 b=nQHthIYFFDQ4n6/uzS3K8BY/y0huO2Y1b1s3dG0OPBTGLbL37knm8VCOy3JcxpHLsU
 uqh8hBceGswx139IiIKNNuAON3Z83YvyLiXdOIZsGwYXn0cRoSt5NWUz83kAmJy2SwA4
 +lQHluGJpHwEC1ma71/2EbnRovD7tVPPl0qf3tipIC4odMPDqoa3Nl6aLOab6SLz5AUm
 Nmc+gJICg5OzJ37d1WjvbzSc9/udm5CN/oCbjsWv5F7qA0DC9cZGV27bEzyh+40p3W42
 rdEUwD3CRJNsmXgu2RiI6X3oMZlrz0UocDZBY5+EPw4QMFuXE0b01E1BEs7aujtaKHc5
 BJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708620260; x=1709225060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcbNdLGTQbcf2fuT3ItJFHWUdIKmO9oNeQCZ3LPc8TA=;
 b=GjFBgvvKl/6/l5E3QykTvc2MQiyEJBGwe7Wkt+iKvxZiY4E8lXVn2aU9WLVL/xZ+Id
 UOEqsq0W7TBxZqT2rkzVtm7DUlvgf9SNZdXTFqdxy8ZmohKUETxpyH0mZcrvZbbvnv7J
 rOH9NcdbiVWCjKb2/EJdvYIxxqVr8/J/yUhoCDA3z/2i/i4b/zKj1n0j0ZHPVsLRC2Uz
 VGCCAuPfYTMPnFjCksEAmOxrecMDNyVErrFNia+qtMJZQR1aKGxoWy48RXrEKsv+ddUp
 0LVycGIT702H1R8X+VVzxvkX9VuHwJnzfZ/34mxoNxhn54iGtJ7qV4LV3XZUTZdNXN7L
 Cmfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf5QRMAVPqSwxyS2BF/g3qKNwMB0tHNT3Vlxik75aLePO5StKyL7IoL3gDJ5+dl96GZ/FFrh/QwiGKMSD+/rLoEYGhkWkkV5/NdmKkJJG5
X-Gm-Message-State: AOJu0YzEYYjldFhxhZUK1XVkLLNWoQIg3AX7G5VW5WtgXcRIfFlzgNNr
 rp7f7At+D1E16Q8TMRSb20NnOWSYwgx77UEC18XUTeHWSvub3wye
X-Google-Smtp-Source: AGHT+IFNt485egaSmCG12sJjptke/Gcj6Y697CYaU6NQfQhfAVlQSLqd1ixQvqVdZ8/2eQ8csXhp4Q==
X-Received: by 2002:a05:600c:4ec7:b0:412:64a5:a21 with SMTP id
 g7-20020a05600c4ec700b0041264a50a21mr8657417wmq.40.1708620259827; 
 Thu, 22 Feb 2024 08:44:19 -0800 (PST)
Received: from localhost.localdomain ([90.255.110.157])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a05600c35c200b004123b049f86sm22800420wmq.37.2024.02.22.08.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 08:44:19 -0800 (PST)
From: Adam Green <greena88@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: greena88@gmail.com
Subject: [PATCH v2 0/2] drm: panel: st7701: Add Hardkernel ODROID-GO Ultra
 panel support
Date: Thu, 22 Feb 2024 16:43:12 +0000
Message-ID: <20240222164332.3864716-1-greena88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240221194528.1855714-1-greena88@gmail.com>
References: <20240221194528.1855714-1-greena88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Feb 2024 18:12:56 +0000
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

I forgot to include the 2nd patch in the series in v1.

Kind regards,

Adam Green (2):
  drm: panel: st7701: Add Hardkernel ODROID-GO Ultra panel support
  dt-bindings: display: st7701: Add Hardkernel ODROID-GO Ultra panel

 .../display/panel/sitronix,st7701.yaml        |   1 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 158 +++++++++++++++++-
 2 files changed, 158 insertions(+), 1 deletion(-)

-- 
2.43.0

