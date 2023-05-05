Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D7C6F7E18
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 09:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEC110E58E;
	Fri,  5 May 2023 07:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 585 seconds by postgrey-1.36 at gabe;
 Fri, 05 May 2023 07:44:02 UTC
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E80110E58E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 07:44:02 +0000 (UTC)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id C2553D27;
 Fri,  5 May 2023 09:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1683272050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeveXooqm+xBLZjxuZkZXBfIKe/R2RjArxvJxAqKSus=;
 b=WeS3SdbYdkBu1lvqYn/ZfzldBjvY/iitD+YPfri0cviuPnuqFGdIpgUyl/gB6PZ3Yhle25
 7iZiTwX3jJh9xoyKOKFDNczLlPl+HrIxe0ixAvCJOvN/po49do7JC9ibapmx0BTTuYO/X1
 QsOIP6z9CakiSc+Ox+g7d8AIr1UWTLJb6QyZ9er3vDYlPS1OSb3Pps0zaFvPne3XJtnwjU
 ke4y3dJuDUQHjbhYBHsoHsilF6EQkQwZxYEqxCPs838+iLgvjxlJokj4y4dwBkTB3B//yr
 B0tXTVPAy45fksmk92I3MfULIa15yg5iTh0rBk92BmZpMUYpVLvBSbL2fv3uDg==
From: Michael Walle <michael@walle.cc>
To: aford173@gmail.com
Subject: [PATCH V3 5/7] drm: bridge: samsung-dsim: Dynamically configure DPHY
 timing
Date: Fri,  5 May 2023 09:33:59 +0200
Message-Id: <20230505073359.3715594-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230502010759.17282-6-aford173@gmail.com>
References: <20230502010759.17282-6-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: marex@denx.de, neil.armstrong@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, jonas@kwiboo.se, dri-devel@lists.freedesktop.org,
 aford@beaconembedded.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>,
 jagan@amarulasolutions.com, andrzej.hajda@intel.com, wenst@chromium.org,
 m.szyprowski@samsung.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> The DPHY timings are currently hard coded. Since the input
> clock can be variable, the phy timings need to be variable
> too.  Add an additional variable to the driver data to enable
> this feature to prevent breaking boards that don't support it.
> 
> The phy_mipi_dphy_get_default_config function configures the
> DPHY timings in pico-seconds, and a small macro converts those
> timings into clock cycles based on the pixel clock rate.

This actually fixes a bug with the DSI84 bridge on our boards. The
hardcoded settings will violate the D-PHY spec timings for lower
frequencies, esp. the Ths_prepare+Ths_zero timing. Thus, the bridge
will read a wrong HS sync sequence and set it's internal SoT error
bit (and don't generate any RGB signals on the LVDS side).

Tested-by: Michael Walle <michael@walle.cc>

Thanks!
-michael
