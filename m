Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9699B041D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8344610EACE;
	Fri, 25 Oct 2024 13:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=johanneskirchmair.de header.i=@johanneskirchmair.de header.b="dClucyDY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 462 seconds by postgrey-1.36 at gabe;
 Fri, 25 Oct 2024 08:13:49 UTC
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de
 [91.216.248.212])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C6210EA23
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 08:13:49 +0000 (UTC)
From: mailinglist1@johanneskirchmair.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=johanneskirchmair.de;
 s=securedbylima-20161106; t=1729843565;
 bh=P3R6bpWXHVToa3o5mnFLcdTIAER9hOUy5GkSK3oxbIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dClucyDY1RF8+yabq5q7fGMmYV0yilRAK4cAeI6j/16NJ/0+n0VCZ1uDg18uP5/DZ
 E9YptnsWHT40GY0Oeylm2JwhtJZz8unLpwecO7ppMg+Vw1ND8U0laH6sdlAAhg6YCF
 qjnfFRZm8I/4Lph4zPSAPiQDmt+7CQtlyx7q7n5s=
To: aford173@gmail.com
Cc: johannes.kirchmair@skidata.com, Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, alexander.stein@ew.tq-group.com,
 andrzej.hajda@intel.com, catalin.marinas@arm.com, conor+dt@kernel.org,
 daniel@ffwll.ch, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com,
 frieder.schrempf@kontron.de, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 kernel@pengutronix.de, kishon@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, l.stach@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, maarten.lankhorst@linux.intel.com, marex@denx.de,
 mripard@kernel.org, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 rfoss@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 victor.liu@nxp.com, vkoul@kernel.org, will@kernel.org
Subject: imx8mp: HDMI display blank/black problems
Date: Fri, 25 Oct 2024 10:05:44 +0200
Message-Id: <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:49 +0000
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

Hey, 
We had some problems with the hdmi on the imx8mp and wanted to leave, what we found out about it, somewhere for others to find it.

The problem was that our hdmi display sometimes stayed blank after hot plugging and sometimes at startup. On older kernel versions 6.6 we did not have the problem with the not mainlined hdmi patches. 
We tracked the commit down that introduced the problem for us. It was the following “driver core: Enable fw_devlink=rpm by default”  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@google.com/
So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don’t really understand what the problem with RPM is.

So, this information is just for reference. Maybe someone has an idea what is going on here. And how to fix the problem in a more proper way.

Best regards Johannes
