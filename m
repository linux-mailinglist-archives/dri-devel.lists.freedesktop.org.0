Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1909580BC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 10:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96E510E503;
	Tue, 20 Aug 2024 08:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="PTvVuPI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010020.outbound.protection.outlook.com [52.101.128.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B27010E347;
 Tue, 20 Aug 2024 07:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hF7+oJahegZZE8c8v3PxwB2+4EJfh5HzKoZLpkCsd2srtqyz0Zf9ag6CNDrKGnemgHUSv7CcI/daPYyLCuY2FDD8rIyxJc+Gu5BiOfTIQj1C6SKfr8NtmmMcpj5s7XEHEBXXAZAmFZ7hoNyE3nYN54cg/6EtfNSk1u4FE25IGE2qOHYkdpPR8mdFu4/2KOESGMAYqc6S5XB7XLAqDDL2CFGfynmGuCPA1/8qXriCUbg4Zy8MeOJRQYkrbDC+dbkD8u5/dW79rm0qtXOW/xqO8unwGkiFd0bYqsozHR/8nqBtWkZi6kausHtzWbzuOhWtE/+z/czeu2MWrHmJiqjZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WYKUntMzzHqoGFvtgriQrKhijQT41q+9OCpPuKfpF4=;
 b=eCgvWmAXIJ8kHTwSwgBaR7dM2ZxP9T6Mk6ldeAEzo4Ncmikr/1aphaG9ldACmd3PrdMM5aEg3+GOeoP3d9XnORpwRhjvDVfET0tQiKMDQSqtYd+nEcZiwk86ErBfzFwCAOAo6/dR7eejsYQMocQSorbnGUV3tZs+hxa5QCclU+YTd4FE5ya4Bn0MRUsKhyY9fCMXQKP42orTyxJ/Y88f6potK/fYoTgeAHKnYqjC6YYmF/surbKogZkTrWKpeqAuKWugtbZxhcXmdaqK0YrgoPknRnEDnkS0LE/6ezhlqY99AnYibywrHck2Qa1aNKKPJubN1QVjWenvJsavpqi71A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WYKUntMzzHqoGFvtgriQrKhijQT41q+9OCpPuKfpF4=;
 b=PTvVuPI9+dfih7DaVDcFDWW5fhsfOC0l0CUKh5h8/Aol0ksHwpG2VE3T/cI/P2p4oCuC3mb5W1KHkoFEzXgSQ/hwtTOBBCfwKbA3HRv9pGD5Efac3MjV4bX+gdXTc8JQpu4JR/qJDtCRHVUWCZlvgohCLGRy+yNBecY2gXFuG172TI6vOm3L93jc/lJ7sIkTnZFqwbrT9oRNgM5or8YrD6IcpmIi1tcqvW6xQKaHXcVeqLctusxFhrEB6/HDIaXM9fz/8lh1oTV42TWnYqsXFxc1HRoKkhIGN6EG0GYx6Q26A/HoV6VrzVB6aaTm15BlHaEWJdsav9QCOvNHBlUXRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB7117.apcprd06.prod.outlook.com (2603:1096:405:b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 07:45:35 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%6]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 07:45:35 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Yu Jiaoliang <yujiaoliang@vivo.com>
Subject: [PATCH v1] drivers:gt:Switch to use kmemdup_array()
Date: Tue, 20 Aug 2024 15:45:03 +0800
Message-Id: <20240820074505.2728118-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0057.jpnprd01.prod.outlook.com
 (2603:1096:405:2::21) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cdd5d9-742e-4c1f-d5a2-08dcc0ec13a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|7416014|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zfFOllisly0Pke3Hfj9T7z2blbM5lvKtqsKXUppIC153yqOdbmREaXKXKEq/?=
 =?us-ascii?Q?S9ZffR4wkYLyo2iq5vIGCDh2+YpcngPxcl1TRYX7eDdJnXnxL+6LXTyGxZyi?=
 =?us-ascii?Q?+hyEspNG43DNBquFXe1zY9UyJMM8WKZFCoG/s2MF23rz+CtEDkUa7m8+z1PH?=
 =?us-ascii?Q?1lQQIkxZfv9E3E3PZPLmsgTISNRXjjL8pKnLruC/BdO2MJYzBTk9Wr06/F5F?=
 =?us-ascii?Q?vztAHb2Uobz8jwOqfTcwr7ASJsnz5SOvJnpIk+aFzRSV/H8QjRg2lrYOv9Pu?=
 =?us-ascii?Q?RqJuvtQSB5TxkNH+eCW9i0RJr52gwUIBEawHWHQo+Roo/PdHN3cxfORTNHE2?=
 =?us-ascii?Q?BeCA20XQ6mb6F8dXjJbVN0Lzul3Uei8I+27ABZ2kHnrQEYeg6bHfJtwdsiE7?=
 =?us-ascii?Q?IL4aMhrX+oanBVx13Y47/QEk88h/uqnB3WFvA4t1BZuSugg1AAsmW4yzTWXp?=
 =?us-ascii?Q?W2St/AyYGz4D3JYCrTG0rw7j8ObC5jDDPmv5rAFFbdYUTtMjHu4CcYIjbD15?=
 =?us-ascii?Q?VI9A7KxMQpVkn6S9KgD+4KWblMhZ27sSvRPy1vRmi9qumYEGCRcEKRBoNmjf?=
 =?us-ascii?Q?dHbeWJlOPhrnJ5jlSamku0RvMT6EAVfI5Hs8HZeDL6v1Ysjm57tRNNle4tRd?=
 =?us-ascii?Q?n+JjXiJrlO9oxJ9EotmTx0UyJCvg9jS9w401UJ9ihWdM8DN57xULvBLfyqnF?=
 =?us-ascii?Q?GucFd2pkWKT023W29IKboS+5Ok5+CmWEYxD1EOaI6sn8I7wmVvmOEnCrLgkX?=
 =?us-ascii?Q?7r2qwkfRY/KHNf7LAI0aYLgDeKPOM3Pb+YlkBoMpWlT46/34+jcsGJrx2/qA?=
 =?us-ascii?Q?rp7XTegokVPrdv/xNoJq18mSiGWikM1FY3J/Xmc+qbHluXR5KN8aopqelFTK?=
 =?us-ascii?Q?LdkobznaNBunGDeNg3BnmUCUuECep5ZDG3PXTWDTM+KpMR1bpu1PHuf7rgFX?=
 =?us-ascii?Q?JYRBHlEXmOBc2okQYCttA3fRPoU+uTn4+cw7t3OavV04iKWE1ZbHB+18UsuM?=
 =?us-ascii?Q?ty+D7URf9R1TQJaSJW54d2w4dBDdD0ryHqBN60wJvaWcHQdJDHXpkTmjyc9I?=
 =?us-ascii?Q?a8lcaolE6yRTWrfToW39rJUFhwXpL0Vl5mMDzWv1Ccb8lPCWjPEWAQN+FsSF?=
 =?us-ascii?Q?/xsJ177UeZkQV0qwXHTGROq9fWvRtyYEul3Xo+yi7vOMRG0hMIVYaFrTCve0?=
 =?us-ascii?Q?tP+AF0CzrBS1gkDhEw5yIToiVimi5qVJdVSK0/yLXutexhToI8XNvNX9U7jZ?=
 =?us-ascii?Q?IHQum+BAcrIKCYP/j6ufTg2apYHLxPggTmzdS/KmiN8GUh6Tcf/GMC04Ax86?=
 =?us-ascii?Q?MKAuLMwK5wdMnTr9JjqkJzEKsD4woRmGu0qpqeb4XQxeZfQAAi2aOp99uiLW?=
 =?us-ascii?Q?Oj78A2VE3zolU5UMkklb4Z7Z5uEDgO+l+4UgJl9yhhVG0nQhYFm7Z+WV3/Of?=
 =?us-ascii?Q?bRU9gXfo2vQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FjhKaR7znS+Qhcl+RLiTByQNkA7FOYDz34Nzy4VIxDyJ1DP9XBpZMpk5n+B9?=
 =?us-ascii?Q?mfHp/HrrE2/KDjMjPegvqtrpjjO8nYCqJK457QMmpr7ro57PkhmZQe+Ed1wY?=
 =?us-ascii?Q?rNFUgKjc70zIF+WEK0qLblu6OiYrW61KfiL8tlfzzJQD9hipqliM9C83WjM8?=
 =?us-ascii?Q?+JH3J7ClHr4MBHjyfseOe+P/oLBvithwDHcsslseJLPHMe9P5JgdpK3l3bJ/?=
 =?us-ascii?Q?yPfkN63COGk+FtVIsqr5ucndG3LxfKfcU6xEMQ0sO+vafN0a4f/8u94jNaBo?=
 =?us-ascii?Q?GHbOva76jNJaX3HbhnHyXyckpI+IHf89EJy2klCeq9T86Qt2y8F+hRJx1YCe?=
 =?us-ascii?Q?5M12IplliT1vRUXOmBkGv287X2Z/Hdi33TUisDK48BRe7JBRtuBA62eK4KUM?=
 =?us-ascii?Q?qzT4JdKYg2hpBcQzjZa/9EyQR6rsfWIISu3+ckmXauIgCe5g+h1BQkh0ka1i?=
 =?us-ascii?Q?nGjRYVhKaLki4CgzIVAhqT6wCRg/+YsBLdlGKWi8GwJNvBc7MXq8J9pwnfBL?=
 =?us-ascii?Q?LfqiQrR/Y7SkCDCavP/qKEefwSSASaI0yETA0wAbZfjiRp5dhrhQoAOpN0gM?=
 =?us-ascii?Q?qiSuVKhn2ISuYiZwGS//Tz3lYurKAbOIgR+aI2AdMaYpfIx5Ci8/RgALSwSc?=
 =?us-ascii?Q?uW436yQnkEIblRFLd+w7IX0gtwKVut5bbWS0Tps42UTzsyotP2Gbud7lGz2B?=
 =?us-ascii?Q?8gUO9Etl0ebWKXe4uUNX4pol70eTT8H4UwctDW6AV664D4hR77FgBd5nOB+F?=
 =?us-ascii?Q?vJ3+rkmrC6UMsUK4zotA2PoQjIddt+wU4rMvYNWf+Ie/WEv5WLaPbmV1QiY6?=
 =?us-ascii?Q?UAZh9EcgqPlNznFxPR7w2tuCyGeoDBIBM0TO9Woq4xGvXJBvCGQktO/RZXec?=
 =?us-ascii?Q?1WaLuOqeYl6On41gpTWFx6aJtErZexo5C2ZbO9i3P9yX0wA7EeQvYPSM7aN0?=
 =?us-ascii?Q?uGh0B+hAjMWyjDsnXyTNFrgvb42R3X49J0e1CxRDAlcJSiwTrtyar0qGL5Lo?=
 =?us-ascii?Q?i2jlWpctA2pYL0ocfuZTzn59tbtq2H36oiP9/TCYD/EYfHAyCeqhRPfkWuWr?=
 =?us-ascii?Q?Fxf7/H+6tFY36SYEKVPPP7rvEGDC6SnQXMQHITg41aIyJ3S72HNY8mzDJotg?=
 =?us-ascii?Q?T0Tj9wk2Vfwt8t4p0Bi3sgb62zHF5sstB8KoHzjdqCGzeBvntGIfhozFxeeS?=
 =?us-ascii?Q?ckgHoXU66IS1g+Av34TN/4wAbHlIGwdafzS0fqpqH7f6vvEySrNNEMvblnl/?=
 =?us-ascii?Q?ADfmL2XFyOwrs/58/Mr6TYIQ9iokHDG4bXcq5HcgSj7HdqPSnj+qdum8Q1oZ?=
 =?us-ascii?Q?91OddhL7a8lrFe2cQKS7+UTtj9aGQfVwRvZCPD2xbMDbXUTR7ULOl/9eTL5q?=
 =?us-ascii?Q?Mi5UdybiCAgj23azFaElTe/jlFYeIu4eRqgvMRAFfdKRSqHOe2DlCXuaZghy?=
 =?us-ascii?Q?bN2IeYqp8hjIz81Cjmru7vKbnowYcMa0aJje8PZSVo+p+SbnzIV9bdXoCJYz?=
 =?us-ascii?Q?y7jXiCRG/5Ca+pBJLLzsuRs/afApRYEay2i6JMsPE9Q8dAk9a6Io2PQrerJD?=
 =?us-ascii?Q?OYgkSxfGT/s0mgqFR/G9Vv3M2rj6xEGX73+8XA4v?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cdd5d9-742e-4c1f-d5a2-08dcc0ec13a1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 07:45:35.5501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8DPz/VeGC19bSiDP135ePcQ/0+d9txw5mvDshHaEWW5E3oCpjSwsJ5+gPmBLrd9nlveMm/EH8Z2/IcJX90r7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7117
X-Mailman-Approved-At: Tue, 20 Aug 2024 08:19:19 +0000
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

Let the kememdup_array() take care about multiplication and possible
overflows.
Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 09a287c1aedd..d90348c56765 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -111,8 +111,8 @@ static void wa_init_finish(struct i915_wa_list *wal)
 {
 	/* Trim unused entries. */
 	if (!IS_ALIGNED(wal->count, WA_LIST_CHUNK)) {
-		struct i915_wa *list = kmemdup(wal->list,
-					       wal->count * sizeof(*list),
+		struct i915_wa *list = kmemdup_array(wal->list,
+					       wal->count, sizeof(*list),
 					       GFP_KERNEL);
 
 		if (list) {
-- 
2.34.1

