Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1739E350C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 09:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A338A10E0A5;
	Wed,  4 Dec 2024 08:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P/Db4UJr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336FD10EC3C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 08:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTNvl7cgL+p0ASUzh0vN+7abULWeWnEwT5yy3nzXUVPEGpOhKXCD4dvyXB4GohwrFCc9iN5IwNqmk2G/C0I4m1Koe9mZu6f+cB5YG1jLtmL2aWkXu6lMsbYK7XombuHAA6iQeMV9OLiP0fe5pr/InlZ5PZb4zLQb/ZfL1JiXhkg93J8X28LOqBYpvth7jJE/COhwtQ2wA8Nj7HFuNFtUdibNKbBx0QoR9BFz67wdNHP94fRz/Ba44Efjwgg2Bv/MqEB7ODRq8ifU2UWPRDLDOPHI44u7P8Fr3dyMLClXCjd4c9cgMaHf3n84MxcwHCwCG0LH24LEs6FncLTdOvu3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXUwsbelDeKBYmQvYYZgPcUxZ62Bfx2O24nhAoz1Z6w=;
 b=ZWN4pREmnI8I5350j4dPz1z46vJy9uOkliupyVumUkbn4/cw+pKg2l8HuWyzT5EBg7sZDe7e2on+Fh0wCgGM3beApwOEzMxjpX+Czz4x7VICPio8OQb+BkM0GccBJ3JAc4kIawhMk3BipFoinvQ5Tbz5SACDdJNqUsFqZz7MpmjAuhMQz35b63j18sLPYHozui89X0ggpYhu5eO1w7P++gkYGBcCo1MLnPcac7fXAefz335Gb0xRWoK/66xbwTmJprhKJRGvgJvp+7hGeTGcdtTLyfjXHyh2t5WHdU1Lnq8gZm6zjkdP1noA1lYWL30Yfr8coHrE3Y5YaejtA9p2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXUwsbelDeKBYmQvYYZgPcUxZ62Bfx2O24nhAoz1Z6w=;
 b=P/Db4UJrCFsyX65xlPLVi2rdMh/S/6ynL/yORbPAKqPfj4Xds3EOUxPu0Vw9b4XUbpFCrwXZgeg72PqHAsGo1ft9Z4U2cPc96hCwp21wj5L1U0i+iX/Aedg+GxPSDjw/T/U0s84XLspL5DJyd2G/SOR3whcHc+AuyBxqe6zzRQI=
Received: from OS0PR01MB6465.jpnprd01.prod.outlook.com (2603:1096:604:107::7)
 by OS7PR01MB11955.jpnprd01.prod.outlook.com (2603:1096:604:23e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 08:11:45 +0000
Received: from OS0PR01MB6465.jpnprd01.prod.outlook.com
 ([fe80::480d:bef:79a9:5a5c]) by OS0PR01MB6465.jpnprd01.prod.outlook.com
 ([fe80::480d:bef:79a9:5a5c%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 08:11:44 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: "tomm.merciai@gmail.com" <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Liu Ying <victor.liu@nxp.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Topic: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Index: AQHbRafh9R2bJWOrXUufuBB1mAqj0LLVvDiw
Date: Wed, 4 Dec 2024 08:11:44 +0000
Message-ID: <OS0PR01MB6465F75E3277651A01A70483E0372@OS0PR01MB6465.jpnprd01.prod.outlook.com>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB6465:EE_|OS7PR01MB11955:EE_
x-ms-office365-filtering-correlation-id: 361cfcb7-e2b1-4398-6230-08dd143b4af0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JeVZzo77R+Q8kJqono3kj+rK31H+59N7bnPK0YFqGiHbF/Wm9WKLdG031NcM?=
 =?us-ascii?Q?htIOHOn53KktySAdygoUTv62JDdNkgWiKI5LLAZRRT79WIfQGDGkGxhRdiEw?=
 =?us-ascii?Q?j2j8mf/wJyTkqPDDeXEKPJfUbsSgJDqPFa5ZLbd6zwrwffcz109m5wvqhodK?=
 =?us-ascii?Q?KT7pswWNLKM0beUjowFl9OgDCtn7qJ2w876OrYQWsKCDVlsOisfhD4+0AAtY?=
 =?us-ascii?Q?HGNSqBBuxAJ278+vg0iERTT4GhOZxZ8g9loawXILGe8vROw2KbUGXOrzh3MV?=
 =?us-ascii?Q?caY29vnSf3pXk6IGkjTF7CB9Ltbi3ykeOwviY7D6hLVODFYSFfZ5ljUCIwFI?=
 =?us-ascii?Q?6hgnVcFa8CxAxBUkSOzNSypcupo3ETI7WMYWqIBRR8hEeI2RlRsW2W7vwgm5?=
 =?us-ascii?Q?OVJhrTJvDdd/1AHYExLDpC5l5/PjJmkPmkLDjIIr74uvRTuoHIEuSmC/VeoL?=
 =?us-ascii?Q?KvJtWq18gAT1GU9x28gUvcIDZ1p4TbpsK/MNq7LBUmrikc6Rs/6Du46MrlaD?=
 =?us-ascii?Q?NTTc3X7XmICniz3v1YOlmaXDKqdnQ1A6hSskkLAm1NeaJhNpV+KQ6PvAL7as?=
 =?us-ascii?Q?WuMnJNxKx7XSQDk7954cC+ZmiLaVhMqU6glAayOwBi1cLplF8bKZkQTb4tAu?=
 =?us-ascii?Q?7bZs637L8+NHX8TN4p598nxKz3Rz6A+HbIzGdv0rMHQswy7KK0z+STwm9fv2?=
 =?us-ascii?Q?09p5PtG/9ZtK7LIiETIQOZhVtcG+sXNYa7hwP2JT3e9JPr/gcw9JBZvudBRo?=
 =?us-ascii?Q?jgEeFBy/uABsbAOQ2jG0omA1ENnSn/gciYLwL1SAhl3sy9gIsJRlHjK0A/97?=
 =?us-ascii?Q?KEv0uiAAL+vtHYtECEZw+gwT3NFUYtDxjjz/9NxyILGU0HUUL7eJ4hWb45KC?=
 =?us-ascii?Q?m1gHLMnsb8LmmBP2Vu/mERSfFBpZZki5KAfwtxFhVsQIU0JdL4wqyljDPFUK?=
 =?us-ascii?Q?yml9EieG+C9g6noXuIAcUpBCIdrIDGPZtvj+s80M1RL4b5mRfAH6JMm93UZ1?=
 =?us-ascii?Q?EPdq6nMUFbJq3D50DcjysmqOswrMhzAHOg5LUAT2Y+T3NmWAOFV53CaTrogQ?=
 =?us-ascii?Q?evvje28DoTtM49kCl6VaTo57HymTHMIgX3yuPGZHdM6xl/yCJVCCZxRUUMNP?=
 =?us-ascii?Q?HtSMwH6aByRn1bNWrOgk1pdNZSkCoRTGw7CYp53MliQXQj+P2CRSFPfpzXGg?=
 =?us-ascii?Q?UYzpjA4a1jGzTUyZtopEhOwC2lRWMtWsI3xFJBzrgqhs6mdUsupbefglFGlM?=
 =?us-ascii?Q?hCkkFhih/vfubInRpO7xesz+dCYU6AXpZx8dULg8r3jVepCPzG055TvJvgy/?=
 =?us-ascii?Q?F5O/6ggnFPi4pu52I9KXJe9qZsOQznbwUNWcXNWKhSIQMxjDPGgVjJdDboaF?=
 =?us-ascii?Q?es/n/6lA4hP/LBDpCi4oOrZKlSbEfp/go4zPvtNQBeMpvNVxKQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB6465.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AvSpKSo+OAELjWm33OsQSdDhq3k4tdArC/W0wJjHJdc2eeCECjD+XecpizEB?=
 =?us-ascii?Q?9K4/175SDI+w68f8hvX1/n61sD5qheUXW/xGSbOEAv/mUw43r+zMBY1yLA6d?=
 =?us-ascii?Q?Ytx/JIAtD8VZ3xxSSA8FPxH71jVDAJUTC00guLuYp1vtbLWdzUWrgYNSxD7Q?=
 =?us-ascii?Q?89cS6Z/T1phrG7jkFlxPB3lnPF2HKu8I31sGn+tAKlHzR+PkZwIIeSe75g5t?=
 =?us-ascii?Q?dS/WvCwI+X8ooHOyFuBfSy72h6Mr9lAJFzkcaBmxM1FuhDalwWvemnUgfuei?=
 =?us-ascii?Q?WsWwEZShhqHcJDfk30pk1dJlx/TkXxZx2QTRA8fpM6rf9OLsEicYpMyBxpCR?=
 =?us-ascii?Q?Yv4EY/AsiawMSRfFoLHsgIM+Sqq4y7l/gnqLRUNxnVSgrcTBP98nqHGP5010?=
 =?us-ascii?Q?aguv1xH376lfTxQyj70sUxvk2iHojlcsokBA8x5arK/uYYxPBevyu4bWHIvf?=
 =?us-ascii?Q?Ux3XOWJYVTMADofszp9wkyHODZHIJdtUzq/w8pLxmvPdXQc1jH4jL976gVhP?=
 =?us-ascii?Q?rntxo/AIRaP79AQ1SyHN0rVecfRGC0kQODUEJbhrIWkyNnB/Qf3bLuA5T7hr?=
 =?us-ascii?Q?tjXuHSIwPFNi8xW/e8QbydJhBaxKEcK/ILAEDfyLPHph4eFV9505/Q78Ceaf?=
 =?us-ascii?Q?CCXySFxO9MDfFCRO5zaFjdBPjf0zmfBM/ZnHpLWO4J9IhvLea/mGs9ZH4ytD?=
 =?us-ascii?Q?iQW/PC68ffweB/JxoFTRJaOS5UQCJOF/MMXNyPKcHquJZjk3ll9x0eKyzgj8?=
 =?us-ascii?Q?jIguXfj3gUn+ChUC9G/IOdDI9YgBtpSqmvjc0KkApIeLBAgSkFI9OwFnkLT8?=
 =?us-ascii?Q?8S13ngqRRhbO11AQ/Fv4On+thufz0dj/bH3+wP+RJMMOBkh4XMI1vmFjKjjn?=
 =?us-ascii?Q?oFxlM8bE2qghAG+sm7XiWv6fqYnP9j/rwSMfhctjjY0Z7oerxQs2ofrd/GkZ?=
 =?us-ascii?Q?dig9P0dbO7JXhS7V4/+HJhcj2s3eGQKbSTsW9+T7xZAn0FH+n3GaiNk1gY7v?=
 =?us-ascii?Q?j9tYeBMFVjeuKsKEmt7pNPTpMsY8P3782IgfJPQjIF0+vo0krza+ohq/bNQr?=
 =?us-ascii?Q?QXRPtO54bu1oME9fRQzzMlLHgXnIp7LTPzsLVVRddvClWjmBiNCmFZuYQx9M?=
 =?us-ascii?Q?jWKRb6M5mqFNVYaU9od83Ohr+Xi3QCSBr9y0I4j3JVZahPRl0rBi/NjqIlrq?=
 =?us-ascii?Q?yxFhRXpJt5kdSnty1ESngNT9NowNjOk/TN8Kob74ry+p+PhjHtqtw8v5DIIu?=
 =?us-ascii?Q?AjS+Lncc6J3yuB0tNvVi+slPlcRK+6gnKrzmO4YEAb8+1xdqjaF4yBhj0rWJ?=
 =?us-ascii?Q?mj83o9DR+EarBQQIMAd4Dg1XU3NwIn9EM7YsYtFrMfB+BaKxmzoCUXC3jt9J?=
 =?us-ascii?Q?6r18oxiaHGdRqSaxgrLS00Gzbf7bASdlvhZfdQfZ4gA2o3EFbi6q0vQdZHDE?=
 =?us-ascii?Q?QGB5JZPlrSHxwZapp4T7l9AYSFd/UKMigG1DU6R93gHs/XHmW/e0gQeLYf7i?=
 =?us-ascii?Q?OEaJb+URcMH8mT0x4ozifakYQ3kszG5N/zMRECTAOpbln1PvjQAmZ6vJBxBt?=
 =?us-ascii?Q?e5bjhAGK3E1jY4C7XUXwnIYyXdHqDAeRbUMuBup6QCdxX1bNn8PIHypV1XL3?=
 =?us-ascii?Q?nQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB6465.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 361cfcb7-e2b1-4398-6230-08dd143b4af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 08:11:44.9117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gxLrN4KImtv13u7ryEQWKtFi21amSqo5qrYh2iTL/Xdkq1R56M3Q8YMb5z4TbPNYNsKPp/Ck3G40ipev833i15HCVYtGTp3M+059JhJ3H9305Fazye3stpRWfPGrFSGg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11955
X-Mailman-Approved-At: Wed, 04 Dec 2024 08:15:41 +0000
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



-----Original Message-----
From: tomm.merciai@gmail.com <tomm.merciai@gmail.com>
Sent: Tuesday, December 3, 2024 6:21 PM
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org; dri-devel@lists.freedesktop.org; Bij=
u Das <biju.das.jz@bp.renesas.com>; Tommaso Merciai <tommaso.merciai.xr@bp.=
renesas.com>; Liu Ying <victor.liu@nxp.com>; Andrzej Hajda <andrzej.hajda@i=
ntel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@k=
ernel.org>; laurent.pinchart <laurent.pinchart@ideasonboard.com>; Jonas Kar=
lman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten =
Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kerne=
l.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmai=
l.com>; Simona Vetter <simona@ffwll.ch>; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ite-it6263: Support VESA input format

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Introduce it6263_is_input_bus_fmt_valid() and refactor the
it6263_bridge_atomic_get_input_bus_fmts() function to support VESA format b=
y selecting the LVDS input format based on the LVDS data mapping and thereb=
y support both JEIDA and VESA input formats.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/i=
te-it6263.c
index cbabd4e20d3e..83d1db29157a 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -48,6 +48,7 @@
 #define  REG_COL_DEP                   GENMASK(1, 0)
 #define  BIT8                          FIELD_PREP(REG_COL_DEP, 1)
 #define  OUT_MAP                       BIT(4)
+#define  VESA                          BIT(4)
 #define  JEIDA                         0
 #define  REG_DESSC_ENB                 BIT(6)
 #define  DMODE                         BIT(7)
@@ -428,12 +429,30 @@ static inline void it6263_lvds_reset(struct it6263 *i=
t)
        fsleep(10000);
 }

+static bool it6263_is_input_bus_fmt_valid(u32 input_fmt) {
+       switch (input_fmt) {
+       case MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA:
+       case MEDIA_BUS_FMT_RGB888_1X7X4_SPWG:
+               return true;
+       }
+       return false;
+}
+
 static inline void it6263_lvds_set_interface(struct it6263 *it)  {
+       u8 fmt;
+
        /* color depth */
        regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, REG_COL_DEP, BIT8);
+
+       if (it->lvds_data_mapping =3D=3D MEDIA_BUS_FMT_RGB888_1X7X4_SPWG)
+               fmt =3D VESA;
+       else
+               fmt =3D JEIDA;
+
        /* output mapping */
-       regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, JEIDA);
+       regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, OUT_MAP, fmt);

        if (it->lvds_dual_link) {
                regmap_write_bits(it->lvds_regmap, LVDS_REG_2C, DMODE, DISO=
); @@ -714,14 +733,14 @@ it6263_bridge_atomic_get_input_bus_fmts(struct drm=
_bridge *bridge,

        *num_input_fmts =3D 0;

-       if (it->lvds_data_mapping !=3D MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA)
+       if (!it6263_is_input_bus_fmt_valid(it->lvds_data_mapping))
                return NULL;

        input_fmts =3D kmalloc(sizeof(*input_fmts), GFP_KERNEL);
        if (!input_fmts)
                return NULL;

-       input_fmts[0] =3D MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
+       input_fmts[0] =3D it->lvds_data_mapping;
        *num_input_fmts =3D 1;

        return input_fmts;
--
2.34.1

Acked-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.
