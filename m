Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1A2EA14F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 01:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD3189FD9;
	Tue,  5 Jan 2021 00:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17FC89FD9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 00:11:36 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id n25so20152912pgb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jan 2021 16:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7/v77AqgrMzkwzQQTGKpTGxdqW9oGp5KYpVYy7kh1q4=;
 b=Sh2QNYnFVLm66LLE/NRrCsYm6K+V7cqxcLXJQdK0nbWRlyqnPhKNJCd+VP46gGIAew
 Z6SJrMwpH6av/bcG2c2k4AVBZnuOn3O8+pYRFTgPQMQYmNOqjvnq4zphPGnzWJTFNUv4
 QDDKcIKA5illa9p9/gBciNAIE4PQa1+a+IQ90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7/v77AqgrMzkwzQQTGKpTGxdqW9oGp5KYpVYy7kh1q4=;
 b=Uk4MUD7nPVJUG1J6+gClSyW2I51K7GSsrhydFk4W8yD++CPB3yWivnob2QXseZLZtG
 78hBXd0YHRBsdXrOfLBH4uuVnNmEXf8FVVEdk+Pkys4jKKxYxMu7c+I5xnW1ZeIIIf/T
 z+R0nDqnNUMqC71CNAvi3btXc5ZKblBuXMAe0mQBJwBi9ALx0wttMCJ9OzlyibhUzlxe
 sYZAQ2fawJCkO0jTV5CEaKHdbJ0SZt9Z7vx+6SytiTsTggL7oo40cvaDEA3mwl1fmUph
 6TlZpuy3dv2qtNYkupnlU0wjXjTTEtkADVTpahexVoZ9TTModFxfbQHApYDSBiQT5hAx
 TgYA==
X-Gm-Message-State: AOAM53380xhHb9c20QKydLaHDukpJDfdoTE3YRC2OO5MVAUkubZUEEbL
 6HafldtuXCXd5F6O+n2AuCMKyw==
X-Google-Smtp-Source: ABdhPJxkNI6YhhXcss6CNMdwQnCEzvBGE+2IcCkAaUXDa0sz0L8xl9gQxdRMrsz7vQxZJMP+MP9oAA==
X-Received: by 2002:a05:6a00:212a:b029:1a8:6d7b:d62e with SMTP id
 n10-20020a056a00212ab02901a86d7bd62emr67292556pfj.23.1609805496547; 
 Mon, 04 Jan 2021 16:11:36 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id bf3sm465620pjb.45.2021.01.04.16.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:11:35 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v6 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Tue,  5 Jan 2021 08:11:15 +0800
Message-Id: <20210105001119.2129559-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Follow-up on the v5 [1], things have gotten significantly
better in the last 9 months, thanks to the efforts on Bifrost
support by the Collabora team (and probably others I'm not
aware of).

I've been testing this series on a MT8183/kukui device, with a
chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
mesa 20.3.2 (lots of artifacts though).

devfreq is currently not supported, as we'll need:
 - Clock core support for switching the GPU core clock (see 2/4).
 - Platform-specific handling of the 2-regulator (see 3/4).

Since the latter is easy to detect, patch 3/4 just disables
devfreq if the more than one regulator is specified in the
compatible matching table.

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
[2] https://crrev.com/c/2608070

Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 161 insertions(+)

-- 
2.29.2.729.g45daf8777d-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
