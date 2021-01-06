Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6492EC404
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 20:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B7589DEA;
	Wed,  6 Jan 2021 19:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.micronovasrl.com (mail.micronovasrl.com [212.103.203.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868C289DEA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 19:36:20 +0000 (UTC)
Received: from mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1])
 by mail.micronovasrl.com (Postfix) with ESMTP id C3BF8B045E5
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jan 2021 20:28:02 +0100 (CET)
Authentication-Results: mail.micronovasrl.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=micronovasrl.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=micronovasrl.com;
 h=content-transfer-encoding:mime-version:x-mailer:message-id
 :date:date:subject:subject:to:from:from; s=dkim; t=1609961282;
 x=1610825283; bh=UFekAn+Esjbm1Jzl4lfFfkN34+YRVkJ57d84p7XBf3w=; b=
 Zn59ZQVygDHkmANskSCP8DJucFqxHb5qZiLSGZVh63KHOMVzCl1yFXbX8CzQarik
 3LWb+jLnR/zT6NLm1Wji6+N05amMT8sBA/if+EJGzBN9RhbHWPkW66/Orixe5dT7
 ZOPDLMYZUXY+l06HkEUUMi79oQeRxZj8M38uoZFW2Gg=
X-Virus-Scanned: Debian amavisd-new at mail.micronovasrl.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=4.5
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from mail.micronovasrl.com ([127.0.0.1])
 by mail.micronovasrl.com (mail.micronovasrl.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 7_cXw6g5KkY9 for <dri-devel@lists.freedesktop.org>;
 Wed,  6 Jan 2021 20:28:02 +0100 (CET)
Received: from ubuntu.localdomain (146-241-198-163.dyn.eolo.it
 [146.241.198.163])
 by mail.micronovasrl.com (Postfix) with ESMTPSA id D9D3EB04373;
 Wed,  6 Jan 2021 20:28:01 +0100 (CET)
From: Giulio Benetti <giulio.benetti@micronovasrl.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/2] drm/sun4i: fix DCLK and improve its handling
Date: Wed,  6 Jan 2021 20:27:58 +0100
Message-Id: <20210106192800.164052-1-giulio.benetti@micronovasrl.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

First patch is a tested by me fix, while the second need testing to
understand if it works correctly with any sunxi SoC with DE peripheral.
Already tested SoCs are:
- A20
- A33

Need testing:
- A10
- A10s
- A13

Giulio Benetti (2):
  drm/sun4i: tcon: fix inverted DCLK polarity
  drm/sun4i: tcon: improve DCLK polarity handling

 drivers/gpu/drm/sun4i/sun4i_tcon.c | 20 +-------------------
 drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
 2 files changed, 2 insertions(+), 19 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
