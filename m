Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19724857802
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 09:52:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2AC10E4CE;
	Fri, 16 Feb 2024 08:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TNRHE2Nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9A10E89B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 15:06:49 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1d911c2103aso5973485ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 07:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708009609; x=1708614409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wRHZqIOyBrytKgjz2NXJfF7uGwSTiUJd7ozSIo4Rz5Y=;
 b=TNRHE2NvukHgQZSetUHn8kirLBNMsLUVIsUnjQAQN90AS4YwKRuwfQsgvH9NV7rIp9
 uGlHv1NCJb/0xCmI6pDz2skF5m/ys39oTESfAajvGYVCCUdw5vBF3XHVnvIRGDGhjT4B
 5REBytjHqcuph2/aYJBDEKSsKTl+mOVnQdwMQ5BAWyXA35mmUPapyimV/iP04W1E3T4j
 kfw2qa5xy/gCmEh9nNuHNr8dxHq2RcPTlQB0Lhd/5N0n+H+H4GY24dexcMZF2ZLAqGDN
 PaaFcDhyhUiRzBoTuLs4k+aX2RJhvl8l3oNxJ24X5Q2TsT40T3EZ8AqRyhq5EnlSdmKo
 5g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708009609; x=1708614409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wRHZqIOyBrytKgjz2NXJfF7uGwSTiUJd7ozSIo4Rz5Y=;
 b=WfD6quBSSKj7jM/L42+8L0pcJOlPq96hPuH7X6vOs0eENDybAKjVBBpEupm7196Kud
 egz9DrfgeGiX5247ajFgcFnsBnJshhEjMz+BuWaftsxRr2xEy9HbTkq7Nvl9ZsirB4dS
 q55aI90geK2CLc/dfzO+n/MAb0cbCwjmhbdfbLvrPP5v8jOpWxO0LtsUppTp+dpVxtbB
 S2A0Tg6NjeV9Tl+BVBmZvZY9x4eGGYuJ5Pg6J5iTgDnGRkWK8SJsT9sgeXRqgAamQ3um
 GTVG0lpBAHmo/raqroJCHuk8uZ+DXN4TMDQYNm97nrLw2By/CU5FYq/q6qgPCok0GlSa
 4upA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWh7GJTRJfMUqYNZMBMqMiYS73dAeSpAJYQNgggi63D8dx95C2RWe9rFo65jXsEb1oXYaodCrF/PoNHF0g8EqGM+EIQgHw59VfoWOxKnLXN
X-Gm-Message-State: AOJu0YwMOmGs1uQYvsrY/KkgIcPZgRr530hSjaPT8lm1PJgms1WFZbnK
 k4dbzwJvIpEz0B4yGnErLiOoyebrcSU5fzYmVxy2DYRhnE7Z7eI16xH2Qn4jN9s=
X-Google-Smtp-Source: AGHT+IEblop9x6atphDkcaL7O9OM5+yWMRm/XmJEMDeW45mWdx6pdQdYqGT8NM/WQeUzq7tk9pqffA==
X-Received: by 2002:a17:902:c948:b0:1da:2b52:52d4 with SMTP id
 i8-20020a170902c94800b001da2b5252d4mr2938295pla.39.1708009608588; 
 Thu, 15 Feb 2024 07:06:48 -0800 (PST)
Received: from joaog-nb.. ([152.249.118.214]) by smtp.gmail.com with ESMTPSA id
 u5-20020a17090282c500b001d8aadaa7easm1375987plz.96.2024.02.15.07.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 07:06:47 -0800 (PST)
From: Joao Paulo Goncalves <jpaulo.silvagoncalves@gmail.com>
To: aford173@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com,
 catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, frieder.schrempf@kontron.de, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, kernel@pengutronix.de, kishon@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, l.stach@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, maarten.lankhorst@linux.intel.com, marex@denx.de,
 mripard@kernel.org, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 rfoss@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 victor.liu@nxp.com, vkoul@kernel.org, will@kernel.org,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>
Subject: Re: [PATCH V8 00/12] soc: imx8mp: Add support for HDMI
Date: Thu, 15 Feb 2024 12:05:59 -0300
Message-Id: <20240215150559.287571-1-jpaulo.silvagoncalves@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 Feb 2024 08:52:17 +0000
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

>The i.MX8M Plus has an HDMI controller, but it depends on two
>other systems, the Parallel Video Interface (PVI) and the
>HDMI PHY from Samsung. The LCDIF controller generates the display
>and routes it to the PVI which converts passes the parallel video
>to the HDMI bridge.  The HDMI system has a corresponding power
>domain controller whose driver was partially written, but the
>device tree for it was never applied, so some changes to the
>power domain should be harmless because they've not really been
>used yet.

>This series is adapted from multiple series from Lucas Stach with
>edits and suggestions from feedback from various series, but it
>since it's difficult to use and test them independently,
>I merged them into on unified series.  The version history is a
>bit ambiguous since different components were submitted at different
times and had different amount of retries.  In an effort to merge them
>I used the highest version attempt.

Tested-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>

Tested on Toradex Verdin-iMX8MP.

Thanks!

Regards,
Joao Paulo Goncalves
