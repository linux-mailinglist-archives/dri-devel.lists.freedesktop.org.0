Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9AA2BA66D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 10:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB8A6E895;
	Fri, 20 Nov 2020 09:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62C56E898
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 09:42:11 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A3AE223B0;
 Fri, 20 Nov 2020 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605865331;
 bh=07pOOQlCf1AGEDTz1zs87GUSSMbKSFGMWO3JJGzRHPA=;
 h=From:To:Cc:Subject:Date:From;
 b=YlefRCN3zf5t5Fs8vJbnE671oSCmica0pA8MVDzFZFPRILhxbSFH0SEBTxkqGTlrS
 0Lb1thKVxN+O94OfspWVuT71QXDyXMwUvqIASQ3bafn0VjyUEQqs5S1fTOdv1f6vUG
 HJO5ZsKSNG5ECQB+1SgpA0GMTUByLQ9+ttnHiwmE=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1kg2vh-00CDFB-6P; Fri, 20 Nov 2020 09:42:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] More meson HDMI fixes
Date: Fri, 20 Nov 2020 09:42:03 +0000
Message-Id: <20201120094205.525228-1-maz@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 guillaume.tucker@collabora.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Guillaume reported that my earlier fixes for the meson HDMI driver
broke another set of machines which are now exploding (clock not
enabled).

I have thus reconsidered the approach and came up with an alternative
fix (enable a missing clock), which Guillaume confirmed to be working.
Jerome pointed out that this driver is leaking clock references like a
sieve, so that needed addressing too.

The first patch start by fixing the clock leakage using a devm
facility.

The second patch addresses the earlier crash by reusing the
infrastructure put together in the first patch.

Tested on VIM3l.

Marc Zyngier (2):
  drm/meson: dw-hdmi: Disable clocks on driver teardown
  drm/meson: dw-hdmi: Enable the iahb clock early enough

 drivers/gpu/drm/meson/meson_dw_hdmi.c | 51 ++++++++++++++++++---------
 1 file changed, 35 insertions(+), 16 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
