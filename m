Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E299A085
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A11410EA85;
	Fri, 11 Oct 2024 09:57:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uu45pac7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3EC810EA85
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 09:57:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2FC2BA4530C;
 Fri, 11 Oct 2024 09:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0D7C4CEC3;
 Fri, 11 Oct 2024 09:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728640638;
 bh=Rz/W9QlH6CCASPfisYQo2Uxdr9sj88V+CDnZpNAOLWY=;
 h=From:Subject:Date:To:Cc:From;
 b=Uu45pac7QlRCjDze5nXkdD3zdJRa8iASemsM6nXnwldHPXwQ5b4L/JUsH+wbmbNDw
 oDP2kOGu7RArTS+Fb33fCO2Gv8DpZAkRZVi1H9NwVfXsU605YwWCA9/aebTPMNdYql
 EFW9ycJ7FMxOw64JIHx2n9Wkg0EZ+u4yHVWMsFwwDO4dQoZU3OLiFiw04z5TmlqAlU
 1ixVxAF0QTTeo83suulLa4SEDDi4zKY3gCc4Hy4P38PkPbr/U7KLysbkQS9eF7SY50
 nJ4kZdICJgqAyx53rkUtiB6EOM6EVQsfqBH9gHUQJt2oesInVFBGMPKWm0lmz552IV
 0DWKPXb3dXhCQ==
From: Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 0/3] net: String format safety updates
Date: Fri, 11 Oct 2024 10:57:09 +0100
Message-Id: <20241011-string-thing-v1-0-acc506568033@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHX2CGcC/x2MywqAIBAAfyX2nKBW9PiV6FC22V62UAlB/Pesy
 8AcZhJ4dIQepiqBw4c8XVxE1RWYc2WLgvbioKVulVRK+OCIrQjnRzOu7WB0tzX9ACW5HR4U/90
 MjEEwxgBLzi/82WLDaAAAAA==
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Woojung Huh <woojung.huh@microchip.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, 
 UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, llvm@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.14.0
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

Hi,

This series addresses string format safety issues that are
flagged by tooling in files touched by recent patches.

I do not believe that any of these issues are bugs.
Rather, I am providing these updates as I think there is a value
in addressing such warnings so real problems stand out.

---
Simon Horman (3):
      net: dsa: microchip: copy string using strscpy
      net: txgbe: Pass string literal as format argument of alloc_workqueue()
      accel/qaic: Pass string literal as format argument of alloc_workqueue()

 drivers/accel/qaic/qaic_drv.c                  | 4 ++--
 drivers/net/dsa/microchip/ksz_ptp.c            | 2 +-
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

base-commit: 59ae83dcf102710f097aa14de88ea5cb1396b866

