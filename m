Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5071A8F2D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 01:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F7C6E5D2;
	Tue, 14 Apr 2020 23:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0506E5D5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 23:35:19 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D0DC6C00CC;
 Tue, 14 Apr 2020 23:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586906982; bh=cbwVPNBBMDU3Qsse2SdkAJsbA5fiCp4ztKxUhtvleWQ=;
 h=From:To:Cc:Subject:Date:From;
 b=I9YbktXPbOUEqFICj4aMMImlRJrFxMgJgrPXue5z/GF4twcfeXC/PudnuBQn/VckG
 UR6hyiuapJKc6nnZJDCLPw9BhOl2EvPC3lUesbR3nRrOEupwJl/JhCZI0Qq3qpqaSi
 s3vpDOALJcUmc5XQnImHE2OW97N8JMnMhcns0wW8/Yz4A5AJQsu6X42DHNof/xPm3T
 vU79f60Ouz3TYNOu9mPeLnfLmNjj/l9XwNgQDGTO9ny9ZV32AtbPMnqeYa7v96JpZ7
 NjleVLXs3Rs23sIhNZkjNnuwq5KLIDG+s6ITwpIUXowkS/VvMPE62/Vd3Rm7Jd3IrZ
 x3+BBCnZoG6uQ==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.48.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id C1FB0A005C;
 Tue, 14 Apr 2020 23:29:35 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 0/2] DRM: ARC: add HDMI 2.0 TX encoder support
Date: Wed, 15 Apr 2020 02:29:27 +0300
Message-Id: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-snps-arc@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes v1->v2:
 * use DT Schema format please (.yaml files) for DT bindings

Changes v2->v3:
 * Add missing 'interrupts' property in DT bindings
 * Drop dummy 'dw_hdmi_bridge_mode_valid'
 * Change bracing format of 'of_device_id' structure
 * Change compatible string to "snps,arc-dw-hdmi-hsdk"
   Now DT binding file is snps,arc-dw-hdmi.yaml and compatible is
   "snps,arc-dw-hdmi-<soc/board>"
 * Minor fixes

Eugeniy Paltsev (2):
  DRM: ARC: add HDMI 2.0 TX encoder support
  dt-bindings: Document the Synopsys ARC HDMI TX bindings

 .../display/bridge/snps,arc-dw-hdmi.yaml      | 136 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/arc/Kconfig                   |   7 +
 drivers/gpu/drm/arc/Makefile                  |   1 +
 drivers/gpu/drm/arc/arc-dw-hdmi.c             | 116 +++++++++++++++
 6 files changed, 267 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
 create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c

-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
