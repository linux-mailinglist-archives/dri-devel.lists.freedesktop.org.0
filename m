Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFB89B2CC8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5D610E45F;
	Mon, 28 Oct 2024 10:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WE44lu1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABF410E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:26:19 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso523970566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1730111177; x=1730715977;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pgo/k+HOa5AvPj9A+1CCmgMfc+PmvaON+Q6yQ1cAi7o=;
 b=WE44lu1l2nuVwerGYfEc7WvGWmPTsV3b25MUQOeKvRJxduQh9z9X2DiTl53YEUao+O
 tz3AWwSJD7pt2QkP8Fcahg0o4TCeD8q0SE87bRwlgYVcRnLp1q5o0zDHV2AwzoLqHoH1
 uD+1LC6ISqlh1V2uWaMb+V+LxkDRcpPDiuUjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111177; x=1730715977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pgo/k+HOa5AvPj9A+1CCmgMfc+PmvaON+Q6yQ1cAi7o=;
 b=fx5a4WumUUqCxn18b2Y4Ggz+xU81N5RSEdvbNf8JFZx8sVib9eSEG8J/bgiKMDj6zR
 DppP9r4+4P5JG4mDi3IL4kjJ7QegjWjld/ZaybYWIeOwpVVhylVrcSPmcEYEzp4JbOUM
 kO9SqFYCHj9bOOZ4igB0kSVsX2thljej8lT6KCsmsbQiKeOIdZIKEeRMhGvFZtlg/9AW
 XYdhdLzrgk5dqSjxGnuWCoZgP1t4as6zPWIjZljexGDhr1wn53nLTE7wyxWhqSGGiYnr
 h2Pk/WH7kCl2IYfrSexEsWJ5J8VSyfxasmu+8MU9WIdjouRVzhBy5VTx7NuWHByUdHqB
 m4Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8E4vPSgefHE7HAv1n+NIhiV3TVHrFlRCrEP9Witfpgof0H5Q3v/iOplxBRH3Sy+5KL21tV6Dba0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyU09iqrcCD4rFSbBn/Ieh3v1MoOyMRBCcBNXkToy+IyLiKLdgg
 iN4Z8qBwFPJApirbWszhX5RIVcRNDYms0rd2bzDnHtZUGo3lGAPsM3a4/k0EdEM=
X-Google-Smtp-Source: AGHT+IE1qExZyTeDCcsOPLbzeTHr0FDTO0+eG+29GGN1U5BkMPni1pRPTaIjSGyhvowARpdu2dlhRg==
X-Received: by 2002:a17:907:7292:b0:a9a:d23:f8ca with SMTP id
 a640c23a62f3a-a9de5c92bfcmr611522566b.13.1730111177428; 
 Mon, 28 Oct 2024 03:26:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 03:26:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 05/10] dt-bindings: display: panel: add 'syna,
 boot-on' property
Date: Mon, 28 Oct 2024 11:25:28 +0100
Message-ID: <20241028102559.1451383-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
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

The property states that the panel display has been initialized and left
on by the bootloader. This information becomes relevant in the case of
supporting the simple framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../devicetree/bindings/display/panel/synaptics,r63353.yaml  | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
index 2fd6e0ec3682..987fd6f8b866 100644
--- a/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
+++ b/Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml
@@ -25,6 +25,11 @@ properties:
   avdd-supply: true
   dvdd-supply: true
 
+  syna,boot-on:
+    description: |
+      The display has been initialized and left on by the bootloader/firmware.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.43.0

