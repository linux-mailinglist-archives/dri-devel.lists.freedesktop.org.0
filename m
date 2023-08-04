Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE92676FF63
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CB110E6E2;
	Fri,  4 Aug 2023 11:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01C010E6DE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGss+oqB1phg3k+Rsd95HsGZD3Cx/61jFST8KwFUd52jHm5AgszWtlSsRrpdS/ZWyjVbu92Ux8XQsqlEx+0mNmwr1lcvOMhUG0BdDr3MOV4mEOw28jXIDv/SPsN5YRUpmxos6MVfpVvzBbCdi+H5vbOuja2xC5PWV+oDLWa0z5wSCj3sKj6G0W3ax1GmwIH4R4XGgwrOihLApZS7QGCM3EJjVOvthHQS9/0+sPN/sNDw5aGOnMndHgsVvJEHMpbwoJl/4qiv7q1sMeUOTc7CJ0jcd9Ihm2p8MHmhk+cB+JcUqkZTN4XIn3H6PVnxKqWWCw405qZybIx6VlAgqjg6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slBelTXO8tVfdGq4uRLvcUhKTJHVqEVsYiDS7ZuNWM8=;
 b=Sq20l6vWx5lg9pG1PyPytbiwJBmVlq8P1O1ubnCwBEhAgGq85MdDyVqXpmtIJLchlKAVVsE8mF1WGT5midmn8INnHl92kOHiHJldPliIszOCqgZ8VVlB9ZvkFvULgajBjU0fxAcoqRmLJ//9ujgxoDgnxxFKLtjfX1upuv/M/pjiTll/Rx5q4NjhTWVR3iKrLBDRVrL4ro6bY4+n695bZpD0/qFYpQdpPkoWxTyBHj7KUkt08QmdOC4p7Y855yEeU4bhmjylT+M+KIDMj+gsMVhMaWECe1Jfmp9LF56TSJyxa2q6zQXyF6BkXE5LdxidtbenU9CIQ4tOZOnamFwNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slBelTXO8tVfdGq4uRLvcUhKTJHVqEVsYiDS7ZuNWM8=;
 b=J1wDZSGWcxT/DqkrWvvgFbb9eYU0MRvfDzpaxqpIZbMY7ZbhOQ6J+I5ybrYpBwbxyTw2sEOfN/vJuPr2DuRWnZwoFjBNceGheDYiYOoAIw9JMqMdi0zNQ+rX9hFeCCrrAeyRgmcz7aFnqbTfgu4sZKcUub3vWGK8vt+RXPU6Wp4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6729.eurprd08.prod.outlook.com (2603:10a6:10:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 11:23:18 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:23:18 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v3 0/3] drm/panel: sitronix-st7789v: add panel orientation
 support
Date: Fri, 04 Aug 2023 13:23:07 +0200
Message-Id: <20230718-feature-st7789v-v3-0-157d68fb63e2@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvfzGQC/4WOyw6CMBREf4V0bU17IRRc+R/GRR+30oQU05aqI
 fy7BZfGuJxJ5pxZSMTgMJJTtZCA2UU3+RLqQ0X0IP0NqTMlE2BQM8E7alGmOSCNSYiuz7QxTIN
 uERroSVkpGZGqIL0eys7P41jKe0Drnrvmci15cDFN4bVbM9/a34LMKaOiNa2Wvaq56c6PabSfp
 0ePiWzADH8gUCDAhFZcSZTMfkHWdX0DOL+gPw0BAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691148197; l=1448;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=Rlv+OrqF4W9N6HOZGU1I58Qwrx5LavP+2o5e42lyPSg=;
 b=22Ma83JX8sm8KKmd7Zw3FGFC3YAwgMoFtC4TR3WthsJrcKLpCSbkwC7oRqCZQUKiA3w4m1Jva
 NSkQL5Z3VvYArjcOuAS9utL6VhwGdK16g5ob473/Wz7e+Ry5Q9+bweM
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR07CA0281.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::48) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdacbee-9778-4895-851e-08db94dd340e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ogmUBBd9zrnEpUX/Ak/CbKsWh9hVuzPzSS/MRF3f5UjDKYvQ9fhpIkHWfiFeYoPOb7tnYZ/1cCXzUUtmg+B26DDlwEmfk9Fuaet04FMENGO6iGqEg6GKvUykTbx2mc7JCGPpMYvMdQ+L/c7mUkaiL76gW/QH4Dt/GSfQDGjYHnvIFFciDAy9dqVdgSh4HEYCv/zokof28GfCIVohEPlCl6CLrX4qo8oOx0xpfNhbNxesw1mmtWntE4bKcpKHbka36d0xNrYPiC6CP4qHVPDPviabbOc5xlJKIAkJxTVffSjBXCl9tDf+szxkwTFd0vGQOIb6uGnMaMk8eJ2N7jg0bbcBlKaQySu8NXyUPuGOBBWVTeAeubAH/UPT2UTvOLZ74xEjuJRFhciVvczRBAyJuo75ntFBAH2/aqy2puZ1Wt/aSUu/uu1AWoK0qj/BMitsekbSU3zXYVGCnNa1BeeqtsGXK0xrWI4yBkVBmEGSDA9EtIY0Esiu/9Vz4OLeeYAr8K+VxRXpVP5XNcev+7rrbY7J2y0rMf+9RiT8DrQm3RD6hvNvKDwLAMEJXOwu2jCNr3jOmTfnjN1qdoSECoADS4fR6lmo8eIQXiJ8nMn8Xm71r5hSdwQ1YBhl72iuHtZA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(186006)(451199021)(1800799003)(44832011)(66476007)(66946007)(66556008)(4326008)(6636002)(2906002)(921005)(38100700002)(38350700002)(2616005)(6506007)(7416002)(83380400001)(54906003)(110136005)(86362001)(6512007)(966005)(26005)(478600001)(36756003)(52116002)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODNaSW9yS004UW5FbVVnWDV1RnZ0WW95Vnh1K1RBWlM0U0haYld4cW5sN3ZY?=
 =?utf-8?B?T3BxTFRMQXNhYy9zSDAyYzhuUnAwNUtWcXBOVUtqMFByWnZodWhzcVpBTVNO?=
 =?utf-8?B?emROS1VqUnMvYVMzMW56ZjBvdDJYcStaWG9FWVZGN1dQK3lEek5ZNjQxMytC?=
 =?utf-8?B?emxXNFNuamtaRkxmeUhiVDE4amZ5dGZNU1NwZEc4M3d1M1F3SmpIeXhzN25T?=
 =?utf-8?B?anUxVzRRMUQ2aVNJUGd2ejRKMGNtbmZCWkhQQVpGdVNzTFJvU2ZEZVZnWU5o?=
 =?utf-8?B?cnlqc2ZUTmYyaVBCSVRoM1gwc1JyUkg5MnZGaCtJd3RMVzcxa1lOY2UvNjIx?=
 =?utf-8?B?VVh0NDZpcm95aWhlejJzWGVzV2RSUW1SczN0cWw5SGxXTzNtVFFjRlpocEwy?=
 =?utf-8?B?SGRDaEUzVkRRMFhsUWo4QWxUTHAvc2l1ZEdVWGJHVzkzaVhnY3RjRkVabmV0?=
 =?utf-8?B?VjNzdVAwNVRXMTVuY1I1dExDQzVzVmhKVlRFZHF0ZDhtVUVyWFJuc1lFcVRm?=
 =?utf-8?B?U3dyRGM5VDIwVlFQME1jd2d4YkFXbDZVMTdneU43TzdPayt0ZzIxcDNBT0lw?=
 =?utf-8?B?Y1dQTUQ1T1hLUjZLRk5PdlMrSzZmSE03dzRKeUhBdDM5b0VNdis3QVcrc0ZO?=
 =?utf-8?B?Nk01bjFPME1OQy9vd1NzOTd0WTJuSnl2RHVFUjY3VG9oMS8rR2FlYzhTL20r?=
 =?utf-8?B?K2tDc0NiUC9pWjVsbStsYThuWUFpSzRXNmI3UVNXczlwcFhWOGNIT2NaVEEv?=
 =?utf-8?B?Rnh2NkMrRk9OMjJPa1dCYWUybHEzTXM0N3ZyWUhhejAxMzdnR3RFM0JWMXpl?=
 =?utf-8?B?VVVSbjVZVExFMmM0bEdRM2xJM0VLeWUxQzN2TGJUTVlIZ0hzTDlsZWI4cXE1?=
 =?utf-8?B?MDM4UzJncGdlQ0FlMnJiV3lYYkk1bkZVN1ZadXJkblRlcFQ5SGVsMjhLaW9C?=
 =?utf-8?B?QTRFTjU1YlRkZlRXYlZuZ2tDZVBNUWJhSDcxSWJad0xIaXNBRi85OGZKK2h3?=
 =?utf-8?B?ejNxRExZeDJxR0NBT01meVJrWENSUlloR3RVVDdqV05BKzQvemUxeG9MSEpv?=
 =?utf-8?B?bFNIaHI2QkptVkdGVFU5VWZlSVdkMnJ6cVpzU3ZJbEliMjh2Z3ZWTm40MDk3?=
 =?utf-8?B?SHFKeTNsaEh5LzRVaEdHdGpabmpsK0xNSEhBK0x6azBTRnR2NU8xT0VjTE1F?=
 =?utf-8?B?TmY0V0xTQnM1N2I3QVZMMklUTUVNdFF4Q2JCbk40bFI4cjF6WEpKcVN5S3BQ?=
 =?utf-8?B?TktMRC9LWnRJeVNVZjVHc1NoMUFTOXN3YzNDSWVSSHp3WHpUaCtsaWd1MjlM?=
 =?utf-8?B?QlI2Yy9YVFJma0dOclhuV0pYNkF6OGsyVTE2MTdrcEVUaGpxNWxDdE5ZZ2dy?=
 =?utf-8?B?Z0tCMzRwb1RvWFNiS2lLbjF3YTFEOHlRWC9VNFRieUZUSmhJYTJubHVuYncr?=
 =?utf-8?B?US9ReEFwSzJRYWxMWmF1dks4MlhCWkY3dVBBMjJZaHdJYjlNeS9iSXgvWk5N?=
 =?utf-8?B?QnBxVkFNNy8zNHVnZHFmZmh0MnhlanNKb0ZZRElleXBLRURCSGxYWUhsczlV?=
 =?utf-8?B?a05rSTc5QS8rUFdsb0JVZ2o5b1JISFBwcmgxcWlOK3VhK1FYM0xGZUdiT2ZZ?=
 =?utf-8?B?SkVWOFVGZFV2NXM0dDhCdXg2MzRmNm9RZm02TVFHSlBndzA3MlhhbkRleklM?=
 =?utf-8?B?dURId2JrNzM2eG5pdmFIYkE3aEdCMW81SXpsTGJLVW5TMGZFZ2xIcUZIYmpm?=
 =?utf-8?B?UnFReWR3cEZGVkljc25Tb21rWDFYUVRKQ1AzdDJXZnA1WnZLeHkwZnpCeHNP?=
 =?utf-8?B?a1lWVGdrN3dxdXVBMk9NM1hwTWpicHpzdW96Um4yQWxVQlcrL1Q5Wjgyd2RS?=
 =?utf-8?B?VXlXNFFPbWNHc2thSk9nemF4bmZ0L3diWldrZENmaldWS2ZMUVFhTStJNGw3?=
 =?utf-8?B?QWFycXRFQ01KTSs2REtmcituL2Foei90dm9aenB2bWllU2RsWnUzREpaQ2dv?=
 =?utf-8?B?cFNCZmdCWTZFRzgweU1uZzA1SVFja1JMOFdsdWFYNmsya0pIL0tyNVhFY3Jz?=
 =?utf-8?B?end2QzVkVGtUTEVnVzRXVDJ0VFJKcGtQVVhvaDk1dUgxRy9WSjhYOGpRRkpP?=
 =?utf-8?B?NzVNUWJ2MktpUEk2aTgwM1VQNUhMeC9CdlllUXYvMUdBbVJ3NWpEVFB5ZVpP?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdacbee-9778-4895-851e-08db94dd340e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:23:18.6540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6LEd23HWo47+bzBMn5seH8sHBC8v5rXhahw9yO8Dwlf7rN0CPqeIvhseIR6KiARwL1ZmO4Mh4WQTCP2F0NnA7yzp4L4XauzaQSIJEixjnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6729
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series adds support for orientation specification in the device
tree to the Sitronix ST7789V panel driver. 

This is can be seen as reduced version of [0] (some things of [0] have
been implemented in more general fashion in the scope of [1], other
things have been rejected).

Looking forward to your comments!

[0] https://lore.kernel.org/lkml/20230314115644.3775169-1-gerald.loacker@wolfvision.net/
[1] https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/

---
Changes in v3:
- Rebase onto drm-misc-next.
- Link to v2: https://lore.kernel.org/r/20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net

Changes in v2:
- Move indentation fix to separate patch (as suggested by Neil)
- Link to v1: https://lore.kernel.org/r/20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net

---
Michael Riesch (3):
      drm/panel: sitronix-st7789v: fix indentation in drm_panel_funcs
      drm/panel: sitronix-st7789v: add panel orientation support
      dt-bindings: display: add rotation property to sitronix,st7789v

 .../bindings/display/panel/sitronix,st7789v.yaml   |  2 ++
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 27 ++++++++++++++++++----
 2 files changed, 24 insertions(+), 5 deletions(-)
---
base-commit: 6db96c7703edd6e37da8ca571dfe5e1ecb6010c1
change-id: 20230718-feature-st7789v-4d0c2c6e2429

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

