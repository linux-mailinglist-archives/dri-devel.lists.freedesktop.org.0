Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F15C71811
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 01:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81BF10E6B5;
	Thu, 20 Nov 2025 00:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.de header.i=@posteo.de header.b="kb6jrvKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBE310E585
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 06:56:30 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 527C3240027
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 07:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
 t=1763535078; bh=/E2wj8U1nC9oVcIMFJW/hIrDo2ArudwTBYEUCh9D85s=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From;
 b=kb6jrvKfQwTik/7yr9pDUpatvP8wJePXBwuc0UZxx00M9T4h4LWCSYSXkqb828Wik
 DMq3tWT3sGqWkQpOzgUESndK9UZ02u1dia0XUuWrsEAFwpvRXIs7owS09SuazkNTT/
 xJwcJ94RgmADR/iofQ6M142tgQACVk49O+qeyLmsTPO/6D9AKTEXds/rnAYMjEbOMy
 2kjDdFch91As7HSz1BiVutnMGOuWwFYMucbYbLiI6/i9QYVVyQ/B6U2zMCLwRjAx37
 gvECSxnpvUs02cj2qwThaONxAfYvK8NxBbIlGmYj59rNQtrcaWtyUt8LTYiDuRk4O2
 EeOvZCrljuhzw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4dBBw42Wlsz6tw1;
 Wed, 19 Nov 2025 07:51:16 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org, krzk+dt@kernel.org, airlied@gmail.com,
 gregkh@linuxfoundation.org
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Martin Kepplinger <martink@posteo.de>
Subject: [RFC 0/4] how to link a panel to a touchscreen controller driver
Date: Wed, 19 Nov 2025 06:51:17 +0000
Message-ID: <20251119065109.910251-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Nov 2025 00:10:28 +0000
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

hi,

When there's a panel/touchscreen combination that is sold as a combinded
module (with the reset line shared even), how would I connect the 2
drivers and make sure the touchscreen driver probes after the panel is ready?

I have the feeling there is https://docs.kernel.org/driver-api/device_link.html
for such cases. Can you show me examples of 2 "random" drivers connected
in this case?

In the past I also played with CONFIG_RESET_GPIO using the reset-controller
logic, but I *think* this is more for 2+ of the *same* devices connected.

Might there be yet a different way in devicetree I'm not aware of?

The below patches - for completeness - are only the workaround for what I'd
like to do, exposing the state of the panel so that the touchscreen can query
it.

thank you very much for any hints,

                               martin



Guido Günther (2):
  hack: drm: panel: mantix: Allow to query enabled state
  hack: Input: edt-ft5x06: hackery to probe after panel

Martin Kepplinger (2):
  hack: edt-ft5x06 / panel-mantix-mlaf057we51: declare
    mantix_panel_prepared() in drm_panel.h
  hack: arm64: dts: imx8mq-librem5: add purism,panel-librem5-workaround

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |  1 +
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  | 12 ++++++++++
 drivers/input/touchscreen/edt-ft5x06.c        | 22 +++++++++++++++++++
 include/drm/drm_panel.h                       |  2 ++
 4 files changed, 37 insertions(+)

-- 
2.47.3

