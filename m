Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1813D5DA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:21:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7916EC2B;
	Thu, 16 Jan 2020 08:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40093.outbound.protection.outlook.com [40.107.4.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC006E97A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 12:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwSw2GzXc3ybvGT4L30/dM990bjk89VBZyUnZ0gVAIiBb3it3VPqBJFaLAngE60KbchkskaiH1CSyOwyHsdt94ApXql9M1bE2ypijexYvvn3xdJnLpI7GdMCWuTybdFbVUwqeH6DE0AcDma34ZBEo5zHOY7XKW97gE88qI9Fp9NYEAb5dIWSU2zKeQ1j1dRbYA8pJqXnH2NFZSZRxfngjg+Ckc7CUVQAl6vjZJAasqbCGRKS++kyfbr5vU4VYeKHWoNfYozeWKxg1mbqVx/mdISv8bFzMkOZ7BzkQ0wEsfAubofPHwl4EAApPcEpsm2cJWS+sEo16LOkYRs8VHIEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9M8wkwM8VH7vF+foXDJpeEMSeZOaQ5pZQMmK4tguDdU=;
 b=j4aciQCNI+2QDASdPoV1Cb//HFDn9zWOMPz0AnCGPy3uc4kJGVLh+sfgHrQgoSQld7/qisxM4piwHh8jKImU10dBLMqhAmqoZLxnTMfle/JePtlWFV2iP5S/t4F5Z4AyW3g7oCFhc1BOeyZfABTbfaoXV+YM+59i3o7BKNMSf1SObPIhWgNgLOs+VakymUgQ+CUuChoR3s/A55UMbEhxyBr4p1agHV9M9E2rGUOlSQ+jKiaBCTzWTtx/4+fWqCiszEC/rlryV14GhWhGgigwgWqmZb3NknSSoJzvp/RrxRzXgVe3pQLPL6GKMPUAt4ZY0q10zYdSkgvP++BmXjwzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9M8wkwM8VH7vF+foXDJpeEMSeZOaQ5pZQMmK4tguDdU=;
 b=hSm4uFUBfg72IWe5g8QHlk3/4lSxqvudU92XbsAViY5aQzuGLouGkpo3KL09k7HTnV8StiGM34D8gXPWc5K3m6VKapQVJ6+jDQK5BJrmK4eey+t0DFUfzzebCBaR2cdJahYb396Har+/yKLKbIGRZz+fSkEj6CU6xTe+9tPqN1c=
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com (10.170.238.24) by
 AM6SPR01MB0060.eurprd05.prod.outlook.com (10.255.22.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Wed, 15 Jan 2020 12:34:19 +0000
Received: from VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52]) by VI1PR05MB3279.eurprd05.prod.outlook.com
 ([fe80::c14f:4592:515f:6e52%7]) with mapi id 15.20.2623.018; Wed, 15 Jan 2020
 12:34:19 +0000
Received: from localhost (194.105.145.90) by
 PR0P264CA0039.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19 via Frontend Transport; Wed, 15 Jan 2020 12:34:19 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] drm/panel: pass video modes bus_flags
Thread-Topic: [PATCH 2/3] drm/panel: pass video modes bus_flags
Thread-Index: AQHVy6AbStXpDk/5LkG4OWGT5cIsUw==
Date: Wed, 15 Jan 2020 12:34:19 +0000
Message-ID: <20200115123401.2264293-3-oleksandr.suvorov@toradex.com>
References: <20200115123401.2264293-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20200115123401.2264293-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::27) To VI1PR05MB3279.eurprd05.prod.outlook.com
 (2603:10a6:802:1c::24)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.24.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0db77f6-6ac8-41bd-6b87-08d799b73ddf
x-ms-traffictypediagnostic: AM6SPR01MB0060:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6SPR01MB006063733453419C03F9D662F9370@AM6SPR01MB0060.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(54906003)(52116002)(6496006)(6916009)(81156014)(316002)(66556008)(64756008)(8676002)(66446008)(66946007)(86362001)(71200400001)(44832011)(66476007)(4326008)(36756003)(16526019)(26005)(478600001)(2906002)(5660300002)(4744005)(81166006)(8936002)(186003)(1076003)(6486002)(956004)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6SPR01MB0060;
 H:VI1PR05MB3279.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JQlaoe3xcYC7yJuVww+w4OOugBXnimIcen+Ntbt4Z73cp503z2EEhEXh20+mQJL1VuINPo2PG007cxGxDzpnJ7aQEQq/rm6PWz93xQx29jQxf316BnJaQaFryacyjMYSGRBJldBcaxavfydJ0JT8ty7dUJkxsH6tWCQdaUu9TnPujg5LiQxWbKuY2dNI/b23BSnqc0Qz2ywTPdWjHYO7vAK/vAqufmRfsCscQ4cyd05XZaX4mkxXTg1Uqil5Xq/iJ7u0FYjBbyi8Ca57Mbg0vINwHFxngm1aUX4VmULEewbUiXjLEY5wcu31Kvs/WO69SA7QygqABnh6Ix4QJWIsIfNlS8DNt0TKXUdoQAyvebwvc0+PAOIotXesWoF3Y+IKJXDJ1VmJp2mZVed/cqbnGhPEoaBrWcW/3XsCl06FTdipO8a0qkGcTJCmrs4GOZ1W
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0db77f6-6ac8-41bd-6b87-08d799b73ddf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 12:34:19.3920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cH1LEE6+vlaWGJJGuWGP3ZQ31KrDuLNNZWYAStcGtA1chnoE8sTPcFvHtUApEtsJKpBEUISQSNstYbO/EwOoO+QmkXmE8FcSZ1VLIwYXHcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6SPR01MB0060
X-Mailman-Approved-At: Thu, 16 Jan 2020 08:21:03 +0000
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 David Airlie <airlied@linux.ie>, Igor Opanyuk <igor.opanyuk@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stefan Agner <stefan@agner.ch>

Make sure that the bus_flags parsed from the display timings are
passed to the connector display info.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 drivers/gpu/drm/panel/panel-lvds.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 21a169aa3ae4..334a67c1a52f 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -101,7 +101,9 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
 	connector->display_info.height_mm = lvds->height;
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &lvds->bus_format, 1);
-	connector->display_info.bus_flags = lvds->data_mirror
+	drm_bus_flags_from_videomode(&lvds->video_mode,
+				     &connector->display_info.bus_flags);
+	connector->display_info.bus_flags |= lvds->data_mirror
 					  ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
 					  : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
