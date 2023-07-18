Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491867580EB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B21B10E1BE;
	Tue, 18 Jul 2023 15:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF7210E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKe0iTk5RqoRV141Z38D//mHIb0rLZhwB4ge5P8h+/iJuo5QUirR0HQOG5w+Kg7v/qEIYbmXTo+5F1jvRRR4Nbg6pan1P+2few/M0U3QtX5dxRrcll0zX2lN6MNkNstVTb1C+uZR1QvLE0NjJ4HOVNQeZ3zZeoHV7kZpTwwnEJVIBKJfrhZB/U/w6KOnkHmPw/kFhewlxGBcUz5JpXWcIZV2G7Qdv21dXeT75J4HsE//HFdoy+3IhJLSIGvfHpFAAyLJD5bBClvOXwnkreSb19E2GVIJcQ2IiwbuP7kAw0MhwYbYFmRxMayEk0/rXjNa7kTxk/z3kHdRbCCoHsXwhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJOoUkNN9dbWXOvToesYddaSvwsyXPBez2x5/uRJ4cc=;
 b=MCIrgfFvJdr/AlPJ99AkansB5G9h66eK/h69hHrWpFVXqoibGzi7a/aix0Bk0BC1qDHGv9wP4tK9IZLj0axVbXeWpIeSVXnVMe04B2QTcmIUU1ovWZ8163yO0YAdP/vmd+Gw/ejH5M6btHNaAS3G0HZ+/k7V61KY1FapdMJzWCrBrgj8N0lPsfsKbkamQbE1AdYHo39UbBTiOXaFLgxkpKdfsNioKHEFtrI8v1uw1ySOEyogupS+Jh3ggctHW4rRpkae/ycMPPtxVRpj9QaMXIWPXAMb/tUu+fdEGoha/4rwQ9VpQQcpq70YQfPaKNvJtCuX3rFxLvVLUePHpub+KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJOoUkNN9dbWXOvToesYddaSvwsyXPBez2x5/uRJ4cc=;
 b=cDRr1N41KJqNLtG1b5K9x91ouVqJ0KpoxGJa/YZAJflqZQILeBHCFVGcbVNKZ+ULS6tHU4PxgJPyGSNKKKI/pFCCyOrHt3J8GZ/qjhdmkVJait5oi8XUC3SOiCVZeKsxcvAFyYm0LtYqdaIgJJTp40rK2F4SUyVByirkC1dOto0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:31:53 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:31:53 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial mode
Date: Tue, 18 Jul 2023 17:31:49 +0200
Message-Id: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGawtmQC/x2N0QqDMAwAf0XyvECtMHW/MvYQ23QGSibpHAPx3
 xf2eAfHHdDYhBvcugOMP9LkpQ79pYO0kj4ZJTtDDHEIYz9hYXrvxlhTxo2UK8ZrnkucaZyGAN4
 t1BgXI02rl7rX6nIzLvL9j+6P8/wB8QvhQ3gAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689694312; l=1147;
 i=michael.riesch@wolfvision.net; s=20230406; h=from:subject:message-id;
 bh=z3Es1zds/gkLLCAHQEUq+mtyoGvhWNC9iKuqqOVOt5Y=;
 b=YW9baPnrPWfS0DlmJEIftqwCWwoCXXcNt9rf6LqdAqOfqfLde6plnaQPzT3QN0czmoQKwPA0b
 WGTd6HujKKoBhdkc7gFm/wRBEqIyyxhlM1n0FYPkhjAowMmQUq11S2x
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=G03kuYHL670EcdsWaNfVA7KnHWmkSpj98XziQm/hjbk=
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: 7111a4a1-7cc7-4069-9e53-08db87a41cb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rXXTSiq4+HewZmpYv3omtOyJYjXAnGrtT0NrLy64Q58K8ICVDeUegttSgHWgiwUg9hKzG0mW7TdMDzzcReHjcB9IuRaUQZEfPrVZcmXwLdwIE9/97FWeWPf+FfhaDT6c2OYbq9pQkzpemhLO2AfvXjQ3ApW0o1mGLN6FKHKMtN2TL1rKvW9uPkJxMNSngWeZxlnKGtgCw8e5zXkKGaR+sNwIym7PN+nCePkSsRHiZSPKhjuafO8A+n0su1vYLdxmCWFMk7gxcqvJV5bUW4MsXDAvC0BWrglIxo/mnNbZc/rwrpRcNaxpFFDrweSIFsLLrh5Yev/vaJjOvAcFbcD3/m/Qfs9uP71MSpJsgyP59yowrdcGAcCLX5fTqke5RqPLwLgN0qujZwyN53Kele7fE1AIy8ULgClCGpfubHSj9A5qaUYOvv8soJCTz30N5a8BHnT4VDvIuDFxVmxW9QZ6wheBrIn50x6U24UpbJ2pKx8/qfT3pT9QE4SRAqSICX18kdZrcNkBeRTPdW5axbe09KopEWVpq51xvw6dyTpHjf0R/kYKPByy2fsKIiwuNqizA8qPORaISuPe0BkiOnk0Eh7vMa+hiKEfzr/kq9y6XABLRzJgVoLU7AriSTNWpAf0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(451199021)(6486002)(107886003)(52116002)(26005)(6506007)(6512007)(966005)(38350700002)(2616005)(83380400001)(86362001)(38100700002)(921005)(186003)(36756003)(8676002)(8936002)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(44832011)(110136005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3QrVjJRNE93anBQbkhPNjN3YTYvOGlXOStJcGMraFJTdWZUdUEvUUozaGZq?=
 =?utf-8?B?QnN4S1JoemtGdHptSFZQVGlRak1mTWEyVEd6d1pNRUhSV1lBcks1V2tCbkNQ?=
 =?utf-8?B?TTFWRFBzdEVKdHkyalR6Q0s3WnliaTU5UG11UDBkQzV3dkxRMGJvQVI3WEo0?=
 =?utf-8?B?VHpZS0RwRHl5SnpYckZMVDI4b2lOMUM3RXBTYTIrTDdiM0RSWUNjRHcrOFlh?=
 =?utf-8?B?b0d1RDJxMW9VdGVuRTBhNVRuRjFCbEhFN2U3KzE1dXNIbWJ4UUJHT2lhUC9K?=
 =?utf-8?B?WWpDWFkza1QxbVdFTFlGV1V1U0YvVUNDK3BzN242SHV6Mk5LVjc0bjFKVGx2?=
 =?utf-8?B?L0YzQW5QSjBKSWpzdlN2Tzd2NWdnZVdZbm5TWnJCbEFJbzVsZkpSS3krOGY1?=
 =?utf-8?B?eGFGM0FYVGVaa2N5cjE3d2lZN2ROMkNrWW1YdGhRWmFCNlFGRWIyZHcyQjFr?=
 =?utf-8?B?S25lTHFtQTkzQmw4WUk0eTdsR21IZE5GSndCV2dIZW44eko4ZDV0SkI0TVVU?=
 =?utf-8?B?ZzQ1RjMxVEpOeDlRemFiVEZrL0g5UFlQcjBPV2JiVWQvRDJKc2lXb2F4OENp?=
 =?utf-8?B?RURmR1FhNmZaSklVY0tSWGtVZEZCLzZ4RUlMYk1ZcnF1aWNycytIc2IvMlFT?=
 =?utf-8?B?bnhPREJKWGF5VWJHa05tTGU4RWU4Nk1aZE52ODJKbC9iNll2Sk1sZitYL3Qy?=
 =?utf-8?B?aGk0Y1NyeXpaOFJCWnZSb09hNWJEbW56SUdFellVc0JlUENHUFZpdlpSWnhm?=
 =?utf-8?B?RmUzMlU5SXdOTHJLSVFOanhQVUZGZjkyLytNMjhyenVRU3JBVzZKNmF5ZmVn?=
 =?utf-8?B?Ti81Mm1SRyticTZMcS9hRW43ck8vWjhxQ3pWc3dTZnZCcGtrVlJweE14c1Jn?=
 =?utf-8?B?RkkrRklWUTlEYmw1ZGhSS1d0L1NMTlFrWnpTYVd3SVFIYmFwQ2lWc0xESy8w?=
 =?utf-8?B?RlRQV21PNW9RU3Y1YkUyaW9obThrNEt0aTJWOUJGSGV3Uy9iQklqWnlTZzNC?=
 =?utf-8?B?aXZNU1pqRHpmT1UxUGt2NE13L002cmxOMnhLanhQbHQ0cEhYa0ZLUUhvMGJF?=
 =?utf-8?B?WCsvb1NVMEpKdHVFaG44WjRHeERTZTNORkx0eE1weG1XdmVsTnU4VmUzdFRU?=
 =?utf-8?B?SlgvbnVPSzhKeVg5NlJsM2xQWXh6ekt6QzFMbHdMRnZmVmtMaVlKd3JOL0hS?=
 =?utf-8?B?eFVYeTVPU0Q0bHowZDA4czF4T0JzeExiYURmU1RYcExaSjFKaVpGMkQ5dnMx?=
 =?utf-8?B?OHJScTViQnZzMklYcVdmRXNLL2J4bHdhVUlNKzNYTXhnU0hsOWVBR3hHS2Rs?=
 =?utf-8?B?azZaMW0xM1BKS2JnYWF5c2RXQm9hajdVTWZQQ2RJcWhSSGhrQzVBcXNVck1n?=
 =?utf-8?B?aWlVTVNKeVBodk1USkZXWjNvWHdSb0diWmVoUmxFdCsvNWJmdjIrYWs4eXFG?=
 =?utf-8?B?cVk1TEs2MStDOG1QYm1RWWRqWGpWRHlneDJXZkZ4aUFWNElKcy9Nc09CM3Jt?=
 =?utf-8?B?U0J5dHVBcU9FbmVIWTUyMUxmRFg3QmNMS0J6cTVhMkRpbTBMTUhmN2JpMXhz?=
 =?utf-8?B?Z2hxdlNJQmc2UzdITUQ2eXBzaDBUZDFTUlRtNmdPYkV3aUlMRGdncWZFZ25Q?=
 =?utf-8?B?RVVRaklCSm9kcmJMb1BHNllOOGdkekhSN1JpaC9rSjk1OUdoSmZXTlJjWlJs?=
 =?utf-8?B?SmpNeUZZZ29zMTdGdGI2YS9iQkxiYXM0cGRXNDMrcUoyb09RWCtHQjlmL0ox?=
 =?utf-8?B?Yi95RWN1bzd2K2RQWVpqM0ZLYkluQnJKRWZFZ3QzZHZQMksxNVZHbUR0Q2tq?=
 =?utf-8?B?WmFHOTZLUDBEN3FpdHUwRUtmRFdkY1VxeHlLOWV2V0cyelZFd0NLL0Z5aUxP?=
 =?utf-8?B?d1ZCMnF2SG1XS2srVnl4ZTlOWUJXSXRYbUxUejB4ajc3TzBxQW1xcld0cktO?=
 =?utf-8?B?bys2Y2ZTdnRINE9XSVhldXBwd01mY0xadnVMSEUzcGY4Rk8yU0xrL05PNUdB?=
 =?utf-8?B?TGVyYStCK3hrSW5zQ3FSTXAyeGtxU0kwcTNmMjltdXl2R1VmTzRPYlV4a3ox?=
 =?utf-8?B?WFBZNVhCQUJwWFZwcEtSYnBNNW9qQm0vZ244a2pjUDlodnhhcHJVTXlGVFpD?=
 =?utf-8?B?NjFxSThpSXhneVpSUUMrTGQvWDlVSkFzTnJ1UktkZzdoRVZNNDNPKzRSOHFi?=
 =?utf-8?B?bUE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7111a4a1-7cc7-4069-9e53-08db87a41cb9
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:31:53.0113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5BMNPixd9UzQcD3piujmNNZLIjN2562ifh5Z56Wr0zVEUatH3hS52q+7URqUI+8Ksh4A065g+46ozVdrQ5QbdgFEibiD2MrYTRrHvcDdMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series adds support for the partial display mode to the Sitronix
ST7789V panel driver. This is useful for panels that are partially
occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Support
for this particular panel is added as well.

Note: This series is already based on
https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/

Looking forward to your comments!

---
Michael Riesch (4):
      dt-bindings: vendor-prefixes: add jasonic
      dt-bindings: display: st7789v: add jasonic jt240mhqs-hwt-ek-e3 display
      drm/panel: sitronix-st7789v: add support for partial mode
      drm/panel: sitronix-st7789v: add jasonic jt240mhqs-hwt-ek-e3 support

 .../bindings/display/panel/sitronix,st7789v.yaml   |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c     | 67 +++++++++++++++++++++-
 3 files changed, 68 insertions(+), 2 deletions(-)
---
base-commit: b43dae411767f34288aa347f26b5ed2dade39469
change-id: 20230718-feature-lcd-panel-26d9f29a7830

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>

