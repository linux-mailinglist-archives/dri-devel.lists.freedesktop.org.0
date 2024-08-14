Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8651952135
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 19:32:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA15810E4F8;
	Wed, 14 Aug 2024 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="D6ehFi66";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC0410E471
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References; bh=j30iXy4QsqTOIAicA5a+3rBeXvQIPSkNgDc1nDonppw=; b=D6
 ehFi66wCHihwfF27B4POIa/+VtgAArk6uSGQuoNbrZyHeWvnZ/ztZmNX2nWVTMktfDSwd7fAV+LAz
 btJWJu2aWA4nN21o27S+uBzYmpyeacYGgn/OXZj06uNDmYGC0DnJ5hV5l1xeVhnVV7lXn87+a8Nie
 eN1E3YhUDi5BwLmjn61Bj3YLUl+2XrsiFbNfu7btl8kBosMROBrxDBS6rsoT0gG2KJLAv0PcxJx0+
 mmQg+NaExXADy4r0VPpnYsd0wrlh+UQ9alEFN6ypYmXUD9IYq2PNOHrr4oUi9zXlBAnQX9bW68L7y
 MYEGI0K8wuiWYBc+DK+7K8oi1clYHSOg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1seDm1-0009GK-V9; Wed, 14 Aug 2024 15:10:46 +0200
Received: from [185.17.218.86] (helo=localhost)
 by sslproxy03.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <esben@geanix.com>) id 1seDm1-000H5x-1Z;
 Wed, 14 Aug 2024 15:10:45 +0200
From: Esben Haabendal <esben@geanix.com>
Subject: [PATCH 0/3] drm/panel: ili9881c: Add JMO LCM-JM800WX support
Date: Wed, 14 Aug 2024 15:10:34 +0200
Message-Id: <20240814-drm-panel-ili9881c-lcm-jm800wx-v1-0-22a5e58599be@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMqsvGYC/x3NQQqEMAxA0atI1gaS6qIzVxlcaE2dDG1HWlBBv
 LvF5dv8f0KRrFLg3ZyQZdOi/1TBbQPuO6ZFUOdqMGR6stzjnCOuY5KAGvRlLTsMLuIvWqL9QOa
 O/DSJ74yBGlmzeD2ewWe4rhtzE9oBcAAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723641045; l=794;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=kPrhEKM/BZV6soBgJ0puownb2x6qHW3ZunIeVUYPM3I=;
 b=u7vmfgfnUuaPrDbu2zhk1HLodRaPRiFmv5cpVhHMxYE8XIDtP5cNUFYFwVRYM9RQsQn269Ajr
 htFJjDeZvzBBn7nFLY/+rlg0C1FIOLXsAEj7UkTYV2R/QK9ywDKpVWI
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27367/Wed Aug 14 10:36:34 2024)
X-Mailman-Approved-At: Wed, 14 Aug 2024 17:32:02 +0000
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

This series adds support for the LCM-JM800WX panel from JMO Tech,
which is based on the ILI9881C controller from Ilitek.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
Esben Haabendal (3):
      dt-bindings: vendor-prefixes: Add JMO Tech
      dt-bindings: ili9881c: Add JMO LCM-JM800WX LCD panel
      drm/panel: ili9881c: Add JMO LCM-JM800WX support

 .../bindings/display/panel/ilitek,ili9881c.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c      | 228 +++++++++++++++++++++
 3 files changed, 231 insertions(+)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240814-drm-panel-ili9881c-lcm-jm800wx-1130fbbef322

Best regards,
-- 
Esben Haabendal <esben@geanix.com>

