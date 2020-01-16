Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E5413D1F6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 03:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF6F6EBAE;
	Thu, 16 Jan 2020 02:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 096386EBAE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 02:15:16 +0000 (UTC)
X-UUID: 28bcea15ec5743cebd1b0ef9dc5f3cc6-20200116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=itebPIuvSzJr5GaEJLbLuiRcsXbtJlr3jeWCPIKouLg=; 
 b=NDcmPLeS4vxiBV+bNnaiIBLIyDooLmRfENmSdE0L2PHK0a66PMABxDUrq4ZcBMEaD2oaFT4G0uUfsIHmoomZn50LLzxikwL3l8zWBJkNYU6YWs9LBljXXT77VkJFvhtJWQomm1h2+L7cRhrzSX1a4i48B0TENV9x0C1VI5BzMbk=;
X-UUID: 28bcea15ec5743cebd1b0ef9dc5f3cc6-20200116
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 387514652; Thu, 16 Jan 2020 10:15:13 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 16 Jan 2020 10:14:05 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Thu, 16 Jan 2020 10:14:17 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 0/5] add driver for "boe, tv101wum-nl6", "boe, tv101wum-n53",
 "auo, kd101n80-45na" and "auo, b101uan08.3" panels
Date: Thu, 16 Jan 2020 10:15:06 +0800
Message-ID: <20200116021511.22675-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: A0E5360FFACF32C65E5C1E5739A8C19C64DF2CF0A8C3537E6D2C6A9245318FA22000:8
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v8:
 - merge the panel documents to one.
 - delay move the drm_panel_of_backlight after drm_panel_init

Changes since v7:
 - base drm-misc-next branch
 - fix document pass dt_binding_check
 - remove backlight from panel driver

Changes since v6:
 - fix boe_panel_init err uninit.
 - adjust the delay of backlight on.

Changes since v5:
 - covert the documents to yaml
 - fine tune boe, tv101wum-n53 panel video timine

Changes since v4:
 - add auo,b101uan08.3 panel for this driver.
 - add boe,tv101wum-n53 panel for this driver.

Changes since v3:
 - remove check enable_gpio.
 - fine tune the auo,kd101n80-45na panel's power on timing.

Changes since v2:
 - correct the panel size
 - remove blank line in Kconfig
 - move auo,kd101n80-45na panel driver in this series.

Changes since v1:
 - update typo nl6 -> n16.
 - update new panel config and makefile are added in alphabetically order.
 - add the panel mode and panel info in driver data.
 - merge auo,kd101n80-45a and boe,tv101wum-nl6 in one driver

Jitao Shi (5):
  dt-bindings: display: panel: Add boe tv101wum-n16 panel bindings
  drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel
  drm/panel: support for auo,kd101n80-45na wuxga dsi video mode panel
  drm/panel: support for boe,tv101wum-n53 wuxga dsi video mode panel
  drm/panel: support for auo,b101uan08.3 wuxga dsi video mode panel

 .../display/panel/boe,tv101wum-nl6.yaml       |  81 ++
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 854 ++++++++++++++++++
 4 files changed, 945 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c

-- 
2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
