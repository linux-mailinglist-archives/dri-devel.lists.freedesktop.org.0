Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIckOKmRgGlA/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC40CC003
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0E110E48C;
	Mon,  2 Feb 2026 11:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OsDpsBan";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011049.outbound.protection.outlook.com [52.101.125.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BDE410E48C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=scdv0jEyDP0bDMdznLwbi7yGWQt9LeBhhPGfCLb4XYHtj7VUgKaiX4jiisFusFl0wc6qV7IRn+0PIRXT4hymTy+CTTVNY7RAr82RqYLOBLnP4wfAbOUtUfTYZC+wsHKnJ4P4nUZcDbX67aM6TTrkLE6PfSKGgwvfHl3253oVKqg7ceVFxS3RAenQjU/NbrV9jc45mAFAZVcxaCj31UFYlf7clOr3/ehbSYUaUUNj8ydMNnx804GY4kQHsv1s0M4SwjQgK+b5Lp5SZwFXm/KRTsMEIGvAgfoL4lTBmK/39Bt1er/KBreabgHLOq7/9wu+E1AFc3xOz3XejnO6caGSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9rJPLDmbfeyK3ITZd1MDLZsZMU7coIzkWyOOpYlM0Y=;
 b=UxsR08V73mswo6Vjbcjzi4TzTWC31aqOlPIJNrfLFfUUbQSa85jSu8yq/F8DPPrKzF8W366OwPysMU3eQorY9tcAS/Rds60W5wwuMB6wys+FviYkHSEzgVljEa083/L1P8IlZGbgibWEE+hvcMxscBCCtknTyHNAcDYIysymG7idcZweey2z0wAKON3KaSgPi39JYmqJw+dL6jqtNrbZwLMeKYT0UWZsFA0qVq1a7qQd2mWDX+zJeQPcX+lgp0y1OpQsSafx0sw6f3Uv4HfbFVFe0jaYBbTomy/NrPn+6DO5mAsXK8ICfoTHhcgO7QHYgERpbf2r9O+SqwlSqJGqWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9rJPLDmbfeyK3ITZd1MDLZsZMU7coIzkWyOOpYlM0Y=;
 b=OsDpsBanojOMf3T9cwtOqLsjW8fF3KhE9gj2Y2hPv8pEZkTIFr5wIYD2DfHYgfigchjYEJsA6eEgtiukPOWe8vBBmuF/YLEj/Q4NXOC0CjgijYsNyyhfGzWU0exzY4I2XOthlpoQaIQg1npq8UZCGTNpDk1VsC0Cr5NR1eOCQaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:59:32 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:59:32 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 07/20] clk: renesas: r9a09g047: Add support for DSI clocks
 and resets
Date: Mon,  2 Feb 2026 12:57:38 +0100
Message-ID: <9c6fe708dce7d8dfb06f58acbd833eb2163ec370.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0fabd4-6f70-4de3-ee5e-08de625286a5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cz9t3ra7vf/oxD7gg8kJGOHZ7LF2VGLQ3yQF8oad3ywpBAMm5pCO3h7pCeKP?=
 =?us-ascii?Q?Pew9SuBh5FChCYy5eblJi8UQSd8B2G3DhWUBQhBZsN8oklM1xb3mcz0t/By5?=
 =?us-ascii?Q?mStfpF77ngdTPxsr5MWddgYpiLNt2FtTIy8EG/M5PpU8QthYgooESEN2/kqC?=
 =?us-ascii?Q?SORWHoISXOfeRuH8pYJ5VirP+6IVtJWcTpRhiXqZLTxwKIi9nmAy41tWi3ss?=
 =?us-ascii?Q?ypDzoRUPxWaS+luNC8VNxdf/JqZzqVCBlSOqJwIr4kFe+oJbjBhZhieFUe3y?=
 =?us-ascii?Q?b2xBPy95BfVBB//uIa1uTudukiJM6aWxnezkWDm94ezdFRcZE7vTtl7jbBAi?=
 =?us-ascii?Q?F/dJ/0eLj3AAa+J5/P4HyVZcGi/FeUByMUnLmxj1RmbveaYU7aCjDq6jdfVa?=
 =?us-ascii?Q?s3GEydHMHZjAtJv7AkdhqFkWbLQGpk26IGrmtOpXzz/iNirOa00OmmTsmae6?=
 =?us-ascii?Q?VGEbDiFMgjWpTGZSHBsMbxAJBGHdRQamrnRax0vc8cQjiEWMpnUCCi1Uqa78?=
 =?us-ascii?Q?v6I3V0HVTgtSbRHn0byGUTbngVhfS2TB7flFrC+g+TwEYqDIikYyfjBDZ8s+?=
 =?us-ascii?Q?qp5KJm3NjOu3eakAU+sVkTR9/UkLFwxzXi4ibDXkViSdv2lNsTFQ4Pstako1?=
 =?us-ascii?Q?J6oWAgUxZ5L/h+nCGWckVJnn4mc7TWmbGmX5rLVMOwTo8cCpYQIBdh4qEGZo?=
 =?us-ascii?Q?ETkLi2//DwKZ71qXbilAyusm/MtbbSySBuJlePaUzdAeCL7mjN6JS3W/urLR?=
 =?us-ascii?Q?c81sOcrNTuILlflHYjmdIekDClyPvXrnFix2yuKvUVYr+nXpzU66tttPUG5T?=
 =?us-ascii?Q?pZdJJTc7IxPYN5FBH5mHKPjibJzevPEUWcJfAR/XkL63+rXAkYBDV4BGkpZu?=
 =?us-ascii?Q?oC2I/x4u95kbZhWCKGebraQqGZCgkruHdvgyntrm/ic3yyBb6aiseIg0UAyx?=
 =?us-ascii?Q?zDaUuuZlY0XrKwjYoAer34mVG/oBInx1B/AoeW4tkouVSLn7WIt+fkQ533OG?=
 =?us-ascii?Q?v5rS8ChQM5RcWLnBjNRB+fAsMHc8/qaawUVG/FJo/Taj1uYJDfcFp5XrmR5A?=
 =?us-ascii?Q?dMSS/VGRsqJGDMM2hHfeBmg/JSX61CmEBOYWX0VPs5DwL92bWC6COIPT+5M1?=
 =?us-ascii?Q?4HPRX+453gwxGf2Y/oIlOEAfFNrsTlkXo9mc1rVavumLrJ7tOCzdkYYo2038?=
 =?us-ascii?Q?12OkJmx5gxuGp3RxT5WYcW/q+MZemzdx2Nu+pohV51oGb5Otkv7zwa1D/t7+?=
 =?us-ascii?Q?MbbitqYcGPihCY8X4v7uIB5uAeBwPxVFHxV3cnoS6eLj2m9vbidMX1t8PoC1?=
 =?us-ascii?Q?ENCX81ehWuKoCr8ruvEcNK59hX+evWe8uxpzai+/4WZqPDMXL9dtk3B4lllm?=
 =?us-ascii?Q?RIIJi2HaducG4GDZPAaPmTCQBTxxcMNYJxT4gZzECkBMuOsNlHxOcGZcWK/q?=
 =?us-ascii?Q?dttUH7Czp2wgUwUmPPJU1LrhlAQ9EQuZCURkQeDeNbLfztRhJxZMw4EqsQ0/?=
 =?us-ascii?Q?ey92a3G0JfKtCNZtGAxKlxty4b2ej2iufWhrGbs61nTOIealCZjYc4uXdPxo?=
 =?us-ascii?Q?ITaT24YYbzh1RFp9C1a8BNuHHNYlMIH4a9JtktxXn5DrsEUmZ1h0daY+L1WQ?=
 =?us-ascii?Q?JNxGowmz4MqOFxLI9hWbdJY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e3qMkUi5JK7/VLV1aHgoj6MtMyIzp4fEWqa3p8o5t56a0O8MqPH+c66Ccyqa?=
 =?us-ascii?Q?rShGGpQbVm3q+nRsFU22uIDaL3/dJCH6Tj1Ok1vHGfS0avjJSxzSKLVLSIoP?=
 =?us-ascii?Q?/QHnQ5jWmoAEPnN/Rd7CRs9+FjFe3ylP1sB88OPY+qNK4SMrHLaYbvnAvHht?=
 =?us-ascii?Q?WXU0EVGdtJPnaZjKsWSY2eHqliRaJQlh4GRb2IGq3c7wcID2juaacXRLdD00?=
 =?us-ascii?Q?w+OvNF0NaOastq8b9AYaHTXfppd/USueHtikKPgyLZa1Q+SjyKafYYautc2g?=
 =?us-ascii?Q?5jpau7/Vkrx3PPXVYbNAhBSN2l1qMZ+JXSj0jRZR2Kklrq/AxvGwvkUmjTXZ?=
 =?us-ascii?Q?oOUZ46wSoL1/pPBODaVHeTDj4R2tEeTB9IRPlg3k56xvO8TUn0zZMp67amYf?=
 =?us-ascii?Q?XLF1E/46s8maMaEep1LO0Q18w5riOVJfI44OcaEQlH7rQEyxj4fiIwfsYl+p?=
 =?us-ascii?Q?FjsNpYNojM5Zk9XUPjSfJQE9ynRBnjmBLHk8nmExmdc8oGGstyhNua5WRIjV?=
 =?us-ascii?Q?ScI8P+Ok+icjEEFdy2J+Ad8dmHjj2jOBrhr2TwSP0Eafe6+Nv4+5Vb/A1Vqs?=
 =?us-ascii?Q?nkenxLf/GsY0TPMOhQ6GYjHuiFkxw9ndWHqTu1Rvep9C5wu83OPMHimAWtQx?=
 =?us-ascii?Q?bDKNpJDK30RkTu+EF5ovZY7KLm8x3SWHBO0Pew4rStDTHeTk5IMjWfuKXkIF?=
 =?us-ascii?Q?Fd3cca5Slt3V3+KqTIXitMoBCtjsnD5aoPbBUq+Zpe/R35LBaWXWrGISt9Rt?=
 =?us-ascii?Q?k/5w5D1uxxZGXkWw/lQR5AeBaEBXri67mAfTFYAP+zE7+FA8lBzqFRrfHdAm?=
 =?us-ascii?Q?uzYeoOPuHi7FWrNFolhxF+0gNiNzBV6aX9pwGlB5FAlS1sV6fUJghhwQJ3EV?=
 =?us-ascii?Q?NzsEHSmKjnHFvlr4e9VnLll7EkigN14PxmW7gQtGtPnn40yvUu/sXCjeiqv0?=
 =?us-ascii?Q?1VrGrFtsNnbHozi/TR3ULYXn+T+JyOUK+rKXfiYimUJ/p2wPJqAqYhwSeVb6?=
 =?us-ascii?Q?Lx+7yJ862yCgLECeUeRc/dMPbz44YPm3aG9rMUmH2NXkLQL1Lne7a8WTmj4P?=
 =?us-ascii?Q?US2Vzs14hD21gPzLQjVB+twvbzPRO6J4aqQfS1G3BYcnr1C9tJr0NlkdE6ys?=
 =?us-ascii?Q?CefH0yac/eX/oL55whKNxJZaJZssNh9tEvo1lE2+Ab7QC7huCp/Ed50NGsYw?=
 =?us-ascii?Q?6uNs5bNdyz/O1eaPQY7Edbij5eqPmoEas6GQKImbkfLhUgzIrhnsY5vpI1C/?=
 =?us-ascii?Q?tI4QtqcEsKmRIykiat3fDocw8acXiZ9c6Ya7Vjng2fnP8ZbLhUns/0BsG2tV?=
 =?us-ascii?Q?UEfb+FP7l3qR/BkGLoEjKwEK+W39P2ZZijRN4mUBNukHdSU+/VZDI3l+UP95?=
 =?us-ascii?Q?vtylXE244N23e7SSQXJzhJApTQw6L4X/1jfxO2RxJZACND72bplzJsSrSf3F?=
 =?us-ascii?Q?xZ5GtsqOOreh6uX0AaxQ6ly/Q5Pv18BlNgNmhYOtih8mt1JKzVvmERb+pWd+?=
 =?us-ascii?Q?kuXMyBf0kfntZ+mPjNMCDE00E/Hb2/sBP5G9laovFYWHQVnIcslk9pihiRjv?=
 =?us-ascii?Q?t974ervZ3hyHY824c8DxgDbAqB8axdrY4t4J1z5nASVu/9UdwQoFdoOjQAVP?=
 =?us-ascii?Q?RZqwqrEtbKEkZB45ww39wLSod5RZDmqZ3ujP8rYWX1mGJcRDKryjxoKZ1yYz?=
 =?us-ascii?Q?NK2b5gfkRB6pyrQhfTYKMBWBI7nWuacW2rwAQ/wnTIUEqYByYGDs6IyZPbaQ?=
 =?us-ascii?Q?tKfC7UHcfHh8aa/Ld4XqI/Tqs8U2wS2R7+TEThINU5UXQv5RZP2T?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0fabd4-6f70-4de3-ee5e-08de625286a5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:59:32.2462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erpYp8JcwR2JMLqBttW67IECb0EaesteS+Yo2I4HKVbFK3JxXHlVaqvqVGkDA90c+XTpwfxOO5e/AeRo8C+oYkgYNrTbynFUACXGnrq+5B3zabW4DMf336QOg5ZnFq3L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6552
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 5CC40CC003
X-Rspamd-Action: no action

Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
to enable proper initialization and control of the DSI hardware.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.
 - Fixed "dsi_0_vclk2" position to match order.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e10e6ff52f8..596349fe6132 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -486,6 +486,16 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
 						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_vclk1",			CLK_SMUX2_DSI0_CLK, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_lpclk",			CLK_PLLETH_LPCLK, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -494,6 +504,8 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
 						BUS_MSTOP(2, BIT(15))),
+	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -562,6 +574,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
-- 
2.43.0

