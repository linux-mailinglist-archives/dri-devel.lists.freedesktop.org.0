Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F337A7700B1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 15:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2B110E6ED;
	Fri,  4 Aug 2023 13:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352A410E0B1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 13:02:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7OcVCqF5n7ckHkc2bq6RRGRQj3v0ohkkNQuVk/F1wu3KV4YQA7TMIcZ1z6zb2iM+qT366AhthIBGJD8EWFviHZ63oMxtbuUNOIrKtk4X66CdmZ5/ZUlDe9if1B11f5z/mdCoL1wk1b25yddTsnmSkhOKTAX7ttx6oAtXUP2FzJwr5AxAIuimy3FLamY32E2EAwXtGlmpOuSH8nnzJDiQiBj/itX3zusawPXPSciVTzru2Zg5vTvLn9aU63QhxWG2ruzcDeSpTSdyW/8FcmirYreyKhl04uNfqb+8tll8VdKwqvknoN3jPBj8f6BBoBcJ1sEnJqh12Fj4CzZyNz7Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1AjY8tLPl+UeolIhnYooEwdpMBJTzG7Omsc1oajt5iQ=;
 b=lbRt5dMu5m6gEMeOSfoWjhxCHeTXf/NQ6g7HzBS5QNHd4tMDJsWJJFR7SlCD5rJXJfRJY4jNbKfntKKGAG1rkkHwoDErWuRyKOxafjX00EpiDcWUFR+lv88o+YWY7kO7V0ydg/vBzIa3XC2IP5vcjePlcuUk4Zgx6mHuF56NNSyNsWhY7CwTl3js+u32XHK5KbpBcuUDadcePoD9q1eslPwI7Q1/gFoDPhW9I0AB7IURk3yfiaZeeQAY5BYbAkRI+RE4WT+OgHn9x/ts+XO5EBV7YcE1W7dDrfeRJngfYpFOC1kssAJV8zyeenCcM8CNg0+P+2MmcbuvsV2hFNsqjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1AjY8tLPl+UeolIhnYooEwdpMBJTzG7Omsc1oajt5iQ=;
 b=cHEPdguNYWhqWtrJo90U4S5jL1DFVtXS3jQtZEckX2x2pvcj9hOeR41QNfLKHG7Ul0SW7R+phSBkELhZnLZVRj9xFPC6Qw3Y1Bdwnnnn4NRbWeAmUwZd/S/89+cNcBNrn1V7xtznPrh8RMyNsgFXOI7gIrHHnGgFLJX+hV9jxZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAVPR08MB9353.eurprd08.prod.outlook.com (2603:10a6:102:302::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Fri, 4 Aug
 2023 13:02:40 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 13:02:40 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v2 0/4] drm/panel: sitronix-st7789v: add support for
 partial mode
Date: Fri, 04 Aug 2023 15:02:31 +0200
Message-Id: <20230718-feature-lcd-panel-v2-0-2485ca07b49d@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOf2zGQC/32Oyw6CMBBFf4XM2jGliDxW/odhMdCpNGkKaQtqC
 P9uxb3Lc5KbczcI7A0HaLMNPK8mmMklkKcMhpHcg9GoxCCFLESV16iZ4uIZ7aBwJscW5VU1WjZ
 U1YWAtOspMPae3DCmpVusTXL2rM3rCN27xKMJcfLvo7vmX/svseYokBuqS1UW1UWr23Oy+vf27
 DhCt+/7Bztz8kfMAAAA
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691154158; l=1212;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=LGY0KAlrWbMMIjTqYlEAbb45+zIBUZ9W+xLiNxjSsNY=;
 b=/i4ADlsnp3ia45F0G3F0a+5QR2UZZqMOWWLETQTCdDlqwWgt6zDUqUyj2NXC9O0OQU/ZeTtbK
 HGgY5qbbN78Cy8veUcpJwj6dr6ymjzKi8dJfz8mmbHk60SmSa58ZRib
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::36) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAVPR08MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f71cd6c-1fd6-4c15-c2f1-08db94eb1545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4EHeZv30NIwH4UiZuyQfeu+PLYmDiobu5KCIMaMj+PYwLo6U6yBu0EQ01Ebqa3DEI+7ewWDmk+C0Vr6PEMFFs+UAHaDQkQh7OMBh5GZhFoFu1j99HJCNybNQ0pyMdZN7B7YHFchlmAwXQ77Qy+l3ZqIF2oCdFj04SQagh2aACP+VB/P5lg8YOXpZvbM/mkS5fz+0RjFE2qYwralJXaizPPRhKesSTzGEDeVjlP8s/pwJaBRe6WWEPGzP7+0fUQJslonxlZlZV+qSn0wyIjZl5FRvEWVhiBxofi0pKWA+hycs95K3sbSc49n9FX8qrrlqbJTxNzUzXAyJDWOA5t6K9lJygmwvkqParMg236QUttv/AXlneUc2Rj+l+viRxUCbMakNeYbyhzxP8916eWXeU4s5HVuiWPlIHH4eVeokYwzjBKSQGbgtuaoje6nhez/jOtK6JaJ0yVZqdl4qt/zJGaJdyF1bbYkiuNmqSGbmdhhHGrdkOSLVPMuUOOw6K0RoF8AowQg+7jbi2oe9ja9YGNRf7ogdTzTgKd6rKp4ZCCbzbzBmu/kryQThF5ha14I855LcCobjqqfItObjQ5HepfS6dBtrKhK01LGiD4951IA5ANC5T71Emt5nqTJfiqup
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(136003)(396003)(376002)(346002)(1800799003)(186006)(451199021)(2616005)(107886003)(8676002)(26005)(6506007)(83380400001)(4326008)(2906002)(66476007)(316002)(6636002)(66946007)(5660300002)(66556008)(44832011)(7416002)(8936002)(41300700001)(966005)(6666004)(6486002)(6512007)(52116002)(110136005)(478600001)(54906003)(921005)(38350700002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9FcHBuVW10eDVKWGowNkNRREp4eG1SZzQxQmpMY0QwQTU4RFJ5MmF5NVVU?=
 =?utf-8?B?d2luYjVWM2VTenRjZGs3ZHp6Rkg3YVludXFnOTB5cHREeTc0N0J5VVFpaGZn?=
 =?utf-8?B?aEhRZHJmU21zNkxTUWNUVnEySnJhdEZmVEttdVg0RjlJNm13K1FYUzJycE9y?=
 =?utf-8?B?cTR6UVpxYlpNUWZ0bDE4RVpvZDRDUHdjNXVjWUVHWW1YOW5PQTN1clV6N0dI?=
 =?utf-8?B?QWVqa0JFREtkWDR3dXQybFJYVzJodzIrOXNJT1gzSE13WWZ0V2l3QWtMeWll?=
 =?utf-8?B?RmFKcXhiK1NUR2pNTzZTZWNHdmVLdjFLRjhkVjIzVWEzNk5TenBWYjZkK0Vu?=
 =?utf-8?B?NEoyd2dvY2hHNVk5VE5IOEpoWE5raXExMUp3Qyt0eTA3aDBjVk9PZ2pkL3pL?=
 =?utf-8?B?MUdEellNdU1KYzd4QUk2YmE2OXI2OE9UWmozSjBmMzR6YmNkMUxiN003alV1?=
 =?utf-8?B?QTFscUFLUm5ZL2xFMUZTSzAydnpDVVUzbzVEdmdNKzdPdEh2VDQ1dWI3Y2Mz?=
 =?utf-8?B?Mk40R1RrUE9ac3VZUHRmYml5RTMyZnNXdWNXOGhrMGpjVjZpOEtId3dvNk9E?=
 =?utf-8?B?N3JWYjlrbnZZYUJUUDBlay9BN2NyNm9YbEdGeFYzMzNnLzZXQjYxdTRadGtT?=
 =?utf-8?B?ai9xd3BJUHN5dWE3ZEpqMU5CM09PVkJULzNNRHU5MDE5eGVSN2RSZDBtRUl4?=
 =?utf-8?B?UmVIQk1BMjNZWXdxay9FSG5pSy96bVlyMXdSWWp0ZzFkYVBlN2YzSjlZOUl5?=
 =?utf-8?B?eXNRT3RJeGp1dC9hTTRndHdpdnNwZ2ovV2ZFSlRURDA3bURjUHAwTjhGdTMx?=
 =?utf-8?B?ZHZuWFQybnFFOW5nLzNrWHcwLzhnenh3Rk85bkNXM3ltd3o2MGQ3YVhnRzNT?=
 =?utf-8?B?KzhmRnVXRWVicGowcjJDL2krVlZEemloc05KRmU2L3RhZnB2Nm5tNis3U3Q1?=
 =?utf-8?B?ODNac05GaXZEZWlXdGZIU0xxSWM5SE1uMnVLVU80cHM0YmlSRWF0Z2lDZzJN?=
 =?utf-8?B?NXI1SVZqdVlvY3JhRDFmZTdBNm5nMDFjUE1GTmJvNUd1aEpRVmx3Nlh5bmR3?=
 =?utf-8?B?bS9VSHlYQVVGcE5TS1UzVkZlc0g2MnBRUXZmRlVOQVEzMEY0UXVFb0VtVi90?=
 =?utf-8?B?MWZNZVd0SHZSRERnYTVtSnFTWDFDNU5WUFU3WTBNclhDWXpMeGxFTFU2U2NN?=
 =?utf-8?B?K3BOVkwrU2tOWFZMUUhQdkdkQzRnNXZ1WThVUXlzYmcwZU1iclBKR2N1cmxH?=
 =?utf-8?B?R0luVjQxbGtjKzd3Qmk2eHJwZWYrL3kxNXZ2a05nOWJ3UHNHUFM5U3dzcHk0?=
 =?utf-8?B?M2xMOHRWb2plWUQydjl2S2VVcGRRUFlnM29RSEdMZGdhVjhMNGtMc3FjN1RL?=
 =?utf-8?B?OUh1VjdjbDE5alBjSDRnZSszMW5JNmhvaHllNmhxQklyQW1UUXgxMldtdlhU?=
 =?utf-8?B?R2tCakVHYkdzNlJQTTEwc1ZaUXJYN041KzlHWTloNVlITjlOMkNPV3hnNWpo?=
 =?utf-8?B?RWlhRFNvbWVybEtpcU9Gc1R2RC95MlFOQlczK0ZiY2lTUm10enZTV1FNeGZO?=
 =?utf-8?B?R21HeVo0cy94bDRVNE1oVVl0V1A3S1RRanRXYlMwdFFXbmFGYzFJejNvdWZy?=
 =?utf-8?B?VlFpTUxLT2pEVjhEdysyeDZpWkNxSWZCQ29hN05GcHU1bDlWL3VNcnh3elpr?=
 =?utf-8?B?VlZQSUoxam5XNWZiY29xVEluRXFwM0RFbTZ4SkUwVnQrRDVybTBYSGQ0WC94?=
 =?utf-8?B?UVNMS0swd1IrZ2QyR2x3TDVsVnhjTVNrMGhKb3h4UXNWcWl0SzlWMDlnVTlN?=
 =?utf-8?B?cXVDUVpUSUZJN0dJRDVyYUdyNktuRkRNYXJKSnd0a21mbWVmK2dra3lsSmdR?=
 =?utf-8?B?bDhsSHZYdEp3bGFNWnNCU3VBajhCMHZKbkRidzMyYkltVStDQklONVY5WjdK?=
 =?utf-8?B?TUQ0NVQyVEZMc1VNRTdMUDZKSFBJSVdsejlVdjlyUU02K0dIUHhlNEhLNzM2?=
 =?utf-8?B?aGRmNWxDNVEwYU1yaTNUT2lpYkNnOXkvam9NZEs4KzZHYlllVDR0L1RNVXJE?=
 =?utf-8?B?d0VxNUhlRWhMMXpqMVJKUGdiM2JrMzJZYU1DSDlSSy9kVEJ5bnY4R3hOMmw2?=
 =?utf-8?B?VDFxOEhnQ1lpVGJyYlRLRisxNlhWOUxIMndwTjhvaUVVQzdsZzB1amlUa3hi?=
 =?utf-8?Q?9nvEVfnTIy4Uw/8dYB9MdHY=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f71cd6c-1fd6-4c15-c2f1-08db94eb1545
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 13:02:39.9323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i2AhiAmD9rK4Wc0dZJkBJy6qjPcUp+E+1doDwCZjGp+9ouyxRLdpoQU2LXIu2TUr9N68w1gkyXLXQhIBvceX9rC7s3UGhcLnvN+q35ABSoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9353
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

This series adds support for the partial display mode to the Sitronix
ST7789V panel driver. This is useful for panels that are partially
occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Support
for this particular panel is added as well.

Looking forward to your comments!

---
Changes in v2:
- Add comment w.r.t. modes (as requested by Maxime)
- Link to v1: https://lore.kernel.org/r/20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net

---
Michael Riesch (4):
      dt-bindings: vendor-prefixes: add jasonic
      dt-bindings: display: st7789v: add jasonic jt240mhqs-hwt-ek-e3 display
      drm/panel: sitronix-st7789v: add support for partial mode
      drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support

 .../bindings/display/panel/sitronix,st7789v.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 72 +++++++++++++++++++++-
 3 files changed, 73 insertions(+), 2 deletions(-)
---
base-commit: e83172ec548d420f2e0b01e80a9a8cbae39bbe29
change-id: 20230718-feature-lcd-panel-26d9f29a7830

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

