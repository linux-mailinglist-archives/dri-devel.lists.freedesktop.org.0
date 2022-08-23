Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB8259D1BE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00258F2CE;
	Tue, 23 Aug 2022 07:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2098.outbound.protection.outlook.com [40.107.255.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8602EAFC2A;
 Tue, 23 Aug 2022 07:10:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFXph66u0LV/BdMgP0jqgEX2bVbgedgMDzDt3PQTrplEtKwpwE7fBpBz14/1EXY9P5O5Y11V9+n8fKn9U9tkk27FkFRrQUgEGemAsk6g6NASugseoxgV+K8UiR23BHCbAx1wIYxY7PHHOnwfg6LVw0WoofCVTXZw9yudxjGdM4g0jXW9qOlyXQmBIx+q9jqFng9y05yHZBAHwXdAIrVdLklsROf0wfzi9HiwUBaQpha5ZfgKtdpuiBE6FIA9H4M8eIq0YzDyKFDWAZq/GYa8SydyfqyIHngBuqe0YSF1wwUVlXwvIa9sC0NwdsJvR8FgAmgZNYjXn3cpr/uA9H5Gkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlLcFevXOlkHcSsBxeqjKPrmdzfcpeAWd+8vwiakzas=;
 b=MXK/7PibQLv0R6Rhc/kqUTgFUoRIePeBd2/Rv+XEgr8amPTF3aGoAHdZj3SZakXZjVT1RDQm5u/KaMZfRGSYFjNUPkxOL0RPvibpR18ED09HwQIePSuIP40Y3xpgz7WvJ0xWEwQEK84eleFuBZXGHuncZ/z+w9lCF0vz56Ak84Lq6rnag6/CV1I6IrUJzd9h+rsJ7a6DEa0eqHLkIS1wcEB/abqjh9TVw9xkyfRkXfVKi9ZLKXCXNgQo1+In8AOJgOK8YpBnnKNIEoSAqXkeZxLTYbt84gAJ0GE0jIu2ePQodRgmuFikHK9HlkyetEiELkF4XcHOdkqWusfRZRdGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlLcFevXOlkHcSsBxeqjKPrmdzfcpeAWd+8vwiakzas=;
 b=MIbauXsod0Amp+YOVZrxWA0JTfcjJQNi8V72wZPzkmAfPiFAXK/XhJtVGR4iWXJyc1j4JGEYGxGmDhQA+UfNQrJAAGNgiQp+6Zo5GIAnxfMMsbDXEpYIRz75g0yANfcZ+ljO97FCIjy60ZZj8K3V92AT1wm1qXIDmPU3K3PsRC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by KL1PR0601MB4321.apcprd06.prod.outlook.com (2603:1096:820:70::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 07:10:38 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0%9]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 07:10:38 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Samson Tam <Samson.Tam@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: remove duplicated argument to &&
Date: Tue, 23 Aug 2022 00:10:17 -0700
Message-Id: <20220823071022.24438-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c380e9d2-ab9b-4b1f-f2a5-08da84d694f4
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oeFjxjciMJV78iymV5KS2ecVBp2SItXKCuThpZmFgFD8PFNPCOb0bI8jfE5tQLy5GPzD04J3GzNX/DnLNbNRqLmQw1copVws+6HqZhwH9sV7dO5MkXEVhfAwj82qU6RAIz2eBcqvIIT3ZCQCokF6/AJ5w/nMxTzsCGKDQDdq/DVCDiVnLgtEXYjF+kyrY/VXjIYiI3TspYBeiuRySwy0qoUMIqRwn7+yKUhpnPKs9lg54RXhXMQqOuFsno4a2QVJmeSIXZlDdNr2bOUPRM4h15v5Pahozj3vQBOIaFui6lLcAiFzETtoN9hgSRx1ZOWoZbOCSKuDAz5LAhkmGeeEAi8Kj8ZyJOOvIaPX9+WnUw5CjiskNs06WS4x+yxXXAcE1TCY9wwcqMJ6NU4aklrRQ0GrifzLoRJUmS/11TDt7Uf6bCQ6brQ+jUABfFo4ky0Zea1dxLZC72QwWW8zplI+muXfXtZYxkg2xIc2tITlfQOOgmQLj9ocHH0X4hVxO8O1bThmJ5H6wMW+V6gz+snXA1QhayYYO6r9dI4cLF7aMw9FJnGk4YoLqGi81gNHptVcqrPx5MC97qs+EqwyNvpo+g9D9aFyBqm2CNLC4uP7u4CK4iSWnsinmN/Y/xoEuwTz9SpJcYayyhPu7X+clzJYODGJ4ZxWWQLHOP7SJQ3ejX0JOys2FJjjffR7f/q2Z+7H8I55wvOcqcR92xy04GAs7Hxj2QBW9NSB30wtKfOw2C2drCXMp2SZXRT6szKiPpho51V4+JQmFdskHFIDwhAkgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(110136005)(186003)(6506007)(1076003)(107886003)(52116002)(26005)(6512007)(86362001)(2616005)(478600001)(6486002)(41300700001)(6666004)(83380400001)(36756003)(2906002)(66556008)(66476007)(66946007)(8676002)(4326008)(5660300002)(7416002)(8936002)(921005)(38350700002)(38100700002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hjTBZR2CgtTIbcRKx5FIp0tztVaRHjX0qiSycy02JR2hmvMzY3As0huT8lBq?=
 =?us-ascii?Q?5+Jb5CceFCvZLjSVJNIocGpvdj8BjTRNKNhvZw3MWeJQynAb6EI0PO9FVsko?=
 =?us-ascii?Q?Av2dOA6GyemBWAf6N51RjGQbmHwpVzVlUwxmUtKY+ZHd+1gNbUFZ+WJNrxbl?=
 =?us-ascii?Q?G8MGMbSU65Crk3OQe2nS0YVd+hO/Sw7hhIFBO6ZafQaDAjSr0X4DtEzpPxXG?=
 =?us-ascii?Q?fL0wu+a/sNwsevD5XxQx0rx4W3nNvcX+sZX6y74RL6my18bTow14WgnIeLTg?=
 =?us-ascii?Q?bslJ9paF5uAGPvTfur60x/OOP6aQc3Iq3gY6g7WUqVGdHZGSeGZiN+hVnBqT?=
 =?us-ascii?Q?0pDpqbydTghV3tQymKs8Upi6De9/JbupxBVXn5V/8ePme8tuOi+IiHaZ0uXa?=
 =?us-ascii?Q?t+sjUnZLSV64GR85eNrG/XRkQCb05Oe2/KIvcaMZn1dPQKRMfboHvDZ9IYn4?=
 =?us-ascii?Q?aTxxiX09iKl40zAb27fV08Mmsm0J36jRlG5JOBNn5HB66YW91VceRNj1Is/F?=
 =?us-ascii?Q?lJ/wKn2vlg83CVApx25t6xAx/WqzV1v8qOLnky6hrPjJgmUdibkfDtcGXQkf?=
 =?us-ascii?Q?nmf6NPZN+iiq/+PbEyUVL4VPci3wg8kYzbIN59RgP/qWFU5n7TN6OVM2ejSJ?=
 =?us-ascii?Q?wMvJdxSyLxfYiPnOaISsyQyW6btjiC4HkTXh0YQpLtK4Ohp6zw/78YeLaBNi?=
 =?us-ascii?Q?KydQPA3x1lN5IbMqdYIoIZyxEehBgdsBK/Rl9W5+yUo+/DcJCiI5OpDJZlKn?=
 =?us-ascii?Q?pQC3rVipkV93GyDgqbw8i8fZFwW7ccuEZI2WUoQnWvpeYv8linZIRLcJPfop?=
 =?us-ascii?Q?Z8gEYooTyoatSbL8IBFs39v5TNQ7329OfWJ706+KESrZ+6E0EeYI6DROkcwm?=
 =?us-ascii?Q?Y0JZCZBhXa2E53B4/EtYAkrdLRKUBGrpf1Q2bqNIPayTBKUOjmfP5T/LCD6a?=
 =?us-ascii?Q?RKRn9SshjED/fUOmPgCElGkSgvGzdlXKSjZXcgtF0Tiy4v+ZVpNtdHnMdvS9?=
 =?us-ascii?Q?1EDWFoeYyquoG8/2e5alcCN5AbGKzyWkeqAeiwZpuHMtOW/EYXm4pdUGghWv?=
 =?us-ascii?Q?MeKQ2I6651fO7YvIbZaqHvEUEnIP/spzuoKnYy+T420gKW/ArPFx2GkuoGiH?=
 =?us-ascii?Q?0/jgpztiDVJ/uyDeXwh3Omq3+I3TPXCrays4Zj9w2797fxjdW2Sj31g/4tEN?=
 =?us-ascii?Q?o6DLbKWnCvXssJDacbYAjvd7y9ZW5R66p2xI4Y3WFkYG3+9MlWuygXxfl6Ki?=
 =?us-ascii?Q?b9KvVqYVY6KO9th7YQEdrAHqMYMaO/dw2egBZ8/3GQBI4jGYwYdfWGfaMeb+?=
 =?us-ascii?Q?dkhu+r1HsTirkfkwEv1wm99YRFgxNApQY2InAcZZf8Pc2shTx44zP5lf7B0Z?=
 =?us-ascii?Q?kQYUXmVKHsRsoqDPlWa8868P1tBrYiWj5UTelRpHXLQvozxlv4wMxuodyI+c?=
 =?us-ascii?Q?VtU70quEkRGarcsPO6AO2RYWOtkMqn4TNbhFwP9/F+mBtZtNi4hFrq6muiR6?=
 =?us-ascii?Q?iJbHVgStBQxK5sZyEznGKJLmHgQBsQhUD7zw0eJyV0gO1+9d7DpeLcdV+vIo?=
 =?us-ascii?Q?TEgrmjqgv4aqqch04Q9GCQzGiPzmcAeWbpptgpR3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c380e9d2-ab9b-4b1f-f2a5-08da84d694f4
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:10:38.5950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAemJcg+aIw7M07Zr5g1wul3p5Z3iPheQA24kgnlE5BRgNSk4PBdvCEtg9v1PsbPTY8itEsxz97g2aQPm7mq5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4321
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
Cc: Bernard Zhao <bernard@vivo.com>, zhaojunkui2008@126.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch trf to fis cocci warning:
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c:
2349:8-34: duplicated argument to && or ||
drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c:
3680:8-55: duplicated argument to && or ||

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
index cb2025771646..fa26834daf56 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
@@ -2346,8 +2346,7 @@ void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 
 			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.ForcedOutputLinkBPP[k] != 0)
 				mode_lib->vba.DSCOnlyIfNecessaryWithBPP = true;
-			if ((mode_lib->vba.DSCEnable[k] || mode_lib->vba.DSCEnable[k])
-					&& mode_lib->vba.OutputFormat[k] == dm_n422
+			if (mode_lib->vba.DSCEnable[k] && mode_lib->vba.OutputFormat[k] == dm_n422
 					&& !mode_lib->vba.DSC422NativeSupport)
 				mode_lib->vba.DSC422NativeNotSupported = true;
 
-- 
2.33.1

