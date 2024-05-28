Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA9B8D2904
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 01:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515AB10FF6C;
	Tue, 28 May 2024 23:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="dMcwoEME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2050.outbound.protection.outlook.com [40.107.114.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F62711223E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 23:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFCzQF2k1boJvqPhNPM/6PnY0XxJGTSMmSUXtcMKKXJMIudmBB2gqAhffFozmP+b/fHClZRtV3SFI5kP7OM/p3EzXYNdZomSbg61j2oj+IKxqQ/657gnTTbpezDZUzkFagHh6EMlkX9qwT6ciNWW/Fmh04YlW8M/1kH/B5ZWaa1mkanKoZthe7p1pgHpjbUXpDj21uGU19O0pkHWPdJHMvwNarPxmHXR+bSr8S/FvUMyoc9Qj3KfmJ4EhNyReaexubtRD6fgYUUJjshvd4fpUzFXJjyNm8joK6e+9NV1dYF93gCFMIhsXUAm4SOVAAqnFHE6xq7f+9a+d9sxZuDcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RBQqFYJ9l6oUjQ+wE7YbR54LyNIP2FkkrriFkT+5Fk=;
 b=fBirR+70GRfKURj4S0UUHRRk34gMcSRbKlThrsgzssuQbIxS1cenfJh/2eeziYTEl4T0TNj/2iw+gZMLr+vaemtU9kIK5dNjQOvzK47onoWJBg9yNF6Tmm9Lf3C9/0IMhUutrh5D3RrCeY56VBF3ueGPVKh0mKzGtbz0UzYGqgmo34ajPC3ykfwtH6rhYlmSA2OrvAohk0zK2M26rYhCz6qu6oO9SkG8kJnG8OIeGZ1XyRC4p3V3t2sZ5L22yr1Yt2guRyFqsfZpKBOiTxVER7qbGn35eVoOZ29eHOOCZsZKYTV8vFFfiPR5Uep4AdbW28k6BmphecuutWhrtZzYJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RBQqFYJ9l6oUjQ+wE7YbR54LyNIP2FkkrriFkT+5Fk=;
 b=dMcwoEMEqiba/Gdncl6dx2DycToRhPtG20FP2t/CcIZYXZGnqAsXWzP+WISJSQ37ClDnH80jzydcj9WFDQ7Kw4G6cMUaKb2+XaYFl08gpXH9dY4XGHKqhTZMDTpJc2pST5yibs+hPxL4Dhpwy/LXFCVhRYNyom8tBR/QtqpR60A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11224.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Tue, 28 May
 2024 23:55:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 23:55:32 +0000
Message-ID: <87fru14hl7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 resend 2/8] hwtracing: use for_each_endpoint_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: <prabhakar.csengg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
In-Reply-To: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
References: <87ikyx4hm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 23:55:32 +0000
X-ClientProxiedBy: TYAPR01CA0166.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: ef75b43c-f816-43ed-530b-08dc7f71a937
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|52116005|1800799015|7416005|376005|366007|38350700005|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DhvhBd07dBUaBqXmcv6cLrnEIKFAuAFSLBEtWcw6UMSDLfBzI2pzfRiwPLIL?=
 =?us-ascii?Q?nn5JXE1rdl8ZOORxoGyX++loyJMQXNYLKX9Mn4v1pPwMLh1S+uGoW57i2y+U?=
 =?us-ascii?Q?ZWSc+0UyAkPuPgYn8SodIVuigM5+jVfjA+LVWd3qm4jr4z3Z1KFDD70bieLp?=
 =?us-ascii?Q?Yf88iYjgdDPGtkweQboAIo1I/yqT372lyL5H/ZkqZ5JfRnf+2jTJnAP4H+qH?=
 =?us-ascii?Q?6MOwknZXphze9YYKrCXn9ljeLRUYdF3ei/5olpkR3fKOHYIqa03BVZQuOXPp?=
 =?us-ascii?Q?N5mZK7zpwO9L7AKuBKWcSYIwgpb1pMVNgNmcDZUhEZSVczRw+c1mEHd2PWNV?=
 =?us-ascii?Q?oxqoiYob9fWBhy5BTd+wObiBp18vt/64f7kiYzO520KgnCa+VNUpnQNrlSOF?=
 =?us-ascii?Q?PWTCdWh/YpujSNBa+lfOAHtrjH7T1M/RAKedt8wOe2v1zy3Yn3TuGJh4QQJn?=
 =?us-ascii?Q?Q4VAU0kc/RoJ2sUCwJndANr+x2WCm7QOKxG6vKLDGiJeHPF4d+gbVnVP1SeY?=
 =?us-ascii?Q?I18g5mxiPqpoy0UvxpFMtyAJWrH6A3skUTJ8SnMkuk5SXBqatgriHWXTWs+K?=
 =?us-ascii?Q?gwc+2oYuq6snYzPrqkawF3mbzVZlIx7gbaVT0GuuquAgRRx5isdT/lexD+h6?=
 =?us-ascii?Q?LEL7Rs8+N5yPkHn0YYGpIukvcmxpmg6JM3LTGSG3yZiUDhana30/qavs2v75?=
 =?us-ascii?Q?HQBrhJZjz9hK7xrqc0bByhkau8OlxYc3j0LlY7yAf2JwGSYzqTI4iTEQQREN?=
 =?us-ascii?Q?EqkdkoLB0AGWI18TE3Oh99lWtSJUGLCNLGTozlJr3JOaxOzkWHRiWakqNWV0?=
 =?us-ascii?Q?rVll/j9NdDjSQ8yKsNl9+Smc+njsj5jSrpU9Gv4MgyjV7Xe7lZ1Oz1kOTp7f?=
 =?us-ascii?Q?Z9sglnyPR5jnEfB+bLz2QdZDuaa+Try9SWksKB5xbx8ni5xfRF8QRHNaWgu0?=
 =?us-ascii?Q?rVi/CEd78ySMMC/1qSvo1wn5QNiB9LiPWVd2OHxLdqvwldgxcAemMcTurXx3?=
 =?us-ascii?Q?K5fvnsE2oCXdnuekcLzVFLuLtovIOswOamJjz7QtKLB8cS18TEKyk/e9QIfo?=
 =?us-ascii?Q?vKSuCz8F6DEXqgvsFM+/pf6L7jxuaeHNa05a8A1EoFDPn3JnOv9Zb/TlxewE?=
 =?us-ascii?Q?BZhqhUuguJz1ZZWh/qadHYX2CX7dklbYtgBvEb03fHdASn4whMqU5GDg0+0E?=
 =?us-ascii?Q?BMCy1mrkPNlkb/EDlUF9QlxX6P4Bnnuo4iwFpLITe1F9+KoJZJSy64HboCjZ?=
 =?us-ascii?Q?z+ENn2pyivsupGWGPmgN0X/Tzqz/DrwTRJKvaFBVwHcw0zXqxQAHy3SadGgh?=
 =?us-ascii?Q?/XujImvIeIri9ZGqIv8HtFzm5oKA5Y7zCSV29AEhRZg3mXPaJ7eldHCPrV/Q?=
 =?us-ascii?Q?dTXOkUw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(7416005)(376005)(366007)(38350700005)(921011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/TfmRrj/YD4Pg/kFDksrUiNNAHL7dqE9gb24ZncSlI+SB9CEh40aUFuSbUcW?=
 =?us-ascii?Q?GIsnaO7jeKH6eFejttTZykofgGA7oSq3rwHQuCNckwga/o/1WEDsgEc/Xy1x?=
 =?us-ascii?Q?F0W7KAYz+u9aomVTqsTRXECp02AwKU16hhc1aVLkjAGgBp7VY+HU3yGxIlQr?=
 =?us-ascii?Q?2701sbBS75ZLL40mbkup4nYle4lxu/AfXGyDbGC0pXJwhDDwRkdDIS4dpljK?=
 =?us-ascii?Q?WZqAkFEcDX4yT1MsJav/8v/FPZ+Oe4tA4eHdtuJo31OTqgQi/UEUEh0qwog6?=
 =?us-ascii?Q?jvzUxlKNIwDLUUTRNXCfn2vGRwdjCPKisbQHwdnYlRCXXiAE4zEBXYu5g8kT?=
 =?us-ascii?Q?ggysCIkeohfNbl/9dvSaYaILZRPtYrygJykJ/VWTRiVBmKQr9HAySAIMSu9M?=
 =?us-ascii?Q?ekcd2bu1vzC+Gfx+Vs5PsYGrmLp5ZhFk9XBPOjJIGhcp4qwF8gXnxAImkJ0b?=
 =?us-ascii?Q?DTkpik+yjX5BCdSFjJfcHSgSRKczXZAt7Kquf+jzkR5/5dEP+w52FD0hIMI9?=
 =?us-ascii?Q?b61mc/zWitPd7RI0rjLczQbTog92aOySRIeJWvaCJx573wgv+F9EgLQu3iVo?=
 =?us-ascii?Q?fhfavOd3M/pFsto1jEJpFisr5d3EkLu5JRoeDVM53GGIQW34xWZpbzL+sVk5?=
 =?us-ascii?Q?26dBWR0ogiSpRKhYHb3lzJ3j6iQizGI+DKAEVX+BL/4jeLVlfJUkVtWhp6hW?=
 =?us-ascii?Q?W9oHWV/wylR5EtP1KD/ECYguQt4LtzZBZUDUxotA4HW/9lLc8zApOv9ZPCxL?=
 =?us-ascii?Q?9O1B58C/hcD7VlSH7djwLkdNaWyCNsOHM6ShXkDA6vFmc16Y/28xMyd5tLbY?=
 =?us-ascii?Q?9hhM7uWK4AFW5nkRaYB9+gW8ciSYtXSZFcpIhMGw9Wt9sVqdupY3FpBfqgON?=
 =?us-ascii?Q?dJldVMlEHWN5wm78RespZl+HySDUjw9YsbtLOJ0W8xWwA3kcqanY0SIAsVEP?=
 =?us-ascii?Q?zSGPW8oyn4pYqfAciT6tTYUezwibNxKEB2QPQrcwqG1Webzx7mLnYf7pHmLs?=
 =?us-ascii?Q?mM6VBNrWO/psuN903TmdFCyqd/I5cOdzq3cOgsD4BsM9oPEzgViOXat/ieOC?=
 =?us-ascii?Q?KLwVp1z2aUs3AqoXsxCDXq0rIJiZEzKTxIqxL4Q0ZE0JAPlW3650tNQrc7ZN?=
 =?us-ascii?Q?IcHtnuMgf6GNQV7z5XyWDrJQrcoVVQ4JG5oxCpFDuHHyx0r2+z83Exrsf3dW?=
 =?us-ascii?Q?zz43voaQDnNonpUN+cJdSV8KibHU+zJainqHP2PngMlHPOS3+l6mFskNT4np?=
 =?us-ascii?Q?5QAKtE10iejHskg5tqRxK/BtfVk01by/ahft2z7GPCsDfweCmfdRVoFewacb?=
 =?us-ascii?Q?W8MNOMvGg2Q8vAy+k7+QLsJa3yRsgvH95DWxKso7p0LelMAV9GFDsHC+JOYf?=
 =?us-ascii?Q?cPB2OdNaJtyriWWowKxq/qyxBbS9UK8U2L1x/uxUmolT3KxNJ/tx3957WC4b?=
 =?us-ascii?Q?UsECTXWO2amKN9mJYBCo8JwB7JqotlX+uhLU4QTjFq5JchVZxLWSq41HvkMR?=
 =?us-ascii?Q?kszLidhlNp/SQ8mguoIyI/Uwlm70SWCzav/tTauLbvVlYtTZZYiX7VZoVPoV?=
 =?us-ascii?Q?D1MJT4GTho+41f4CKvGelmbzKjypSBFeV2rK0SnYkA+KXSuCgpUWLm2ywPaC?=
 =?us-ascii?Q?WKn1fTyaiHNsbpVe9qoTePM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef75b43c-f816-43ed-530b-08dc7f71a937
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 23:55:32.7738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/IYjOisvwzLv5n2Vaf318afUUmSLza+JffSQv2LTCyC+tqzxQmff7mbPyI4Wtnl/37zSYmPez7qDtZHfm7PF9hCWIkIhKJckQyK2m8MCoZ6HBCeV+V/UMkpPNihWN2U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11224
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

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 9d550f5697fa8..e9683e613d520 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -275,7 +275,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	 */
 	if (!parent) {
 		/*
-		 * Avoid warnings in of_graph_get_next_endpoint()
+		 * Avoid warnings in for_each_endpoint_of_node()
 		 * if the device doesn't have any graph connections
 		 */
 		if (!of_graph_is_present(node))
@@ -286,7 +286,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 	}
 
 	/* Iterate through each output port to discover topology */
-	while ((ep = of_graph_get_next_endpoint(parent, ep))) {
+	for_each_endpoint_of_node(parent, ep) {
 		/*
 		 * Legacy binding mixes input/output ports under the
 		 * same parent. So, skip the input ports if we are dealing
-- 
2.43.0

