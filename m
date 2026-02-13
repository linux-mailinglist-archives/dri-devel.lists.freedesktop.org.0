Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJr8FDhRj2noQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC45A137F4D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA6610E822;
	Fri, 13 Feb 2026 16:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j6AgDB2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010011.outbound.protection.outlook.com [52.101.228.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B79110E822
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:28:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVQ7zxwQMmQLcSfZXY7LiCTeEYNr8TPlZPrNhlcBZrStLb6U5AsSDzYf4+sV4abv5+1k7T8iqb/GH4zDEAGFIZn+p3TPu/V7uUH+c6L+ImPUn8xaj8Pr1mM0VWkQcBdpGIQuFnFlwQSnJRf/zlqet6fEnAsLd3gzdRqd/NnbcF6cVx62hxvJlYZRGz/UpAIA9S61PuFFMJ0hYGejI4cJKD3BEiNwdklpuShCvLTNMajIkijgckP0RMHuyys9lAGbvvPvIQ1xzVeQb6u64mXBAiuRndU7AMJ+yolm7fLCJuibXsAw7eWu/NQs1/l9xmkV1ZnNY7N8SYlyH9RnWsIbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGEgGW8lCSrkdaLpNiRT1wed+J3Gvah7XMnC3chqlx8=;
 b=WDFPDwYkFoSN3iVwNGQSPfkMARf/TEm1eOPDgxpWGvwvDX3+MaJJIZytEMTtO66JkH8dCl33vBHL3g6G1nTCVCIK5lbVKR7cDBJ0AxSf9bfwmKJj+ClsYOC0Ywk5qHeeM3TwzLMNirTOEz6ioV6sbG5nvwVaUYSpPYqJOjhTWWyq4HAKgJk4QMU14XoUMlUR5LeLSYolSJ2umiKm7yahukTuWhVJsAJAykMIq0/tKufSGtQgWWSeOFjtEBYWSZX7Vn4ykTT1VicFeDxxJF1apPofVsOTwvYF9OLiAuiXAuZ2ec8er92AHqiVC/SdLjRIKRKNiGpf7FW9l2zKYc/m/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGEgGW8lCSrkdaLpNiRT1wed+J3Gvah7XMnC3chqlx8=;
 b=j6AgDB2rcG5FflgEQt9vwltLVMs67/S5NGRUqmMOG8QPltYRgkXoVjszpjdKDi08yKZbscbM5ZtLw7sVbiedebQKHeupKBq9atYOa6jhJ4SthhNy+394Gc3Olf7XP9uo/w597W98Mh/hk0IUd0GeTQQr2zs05dRQ+2qopmXdcoM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:28:32 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:28:32 +0000
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
Subject: [PATCH v5 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
Date: Fri, 13 Feb 2026 17:27:27 +0100
Message-ID: <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: 671c3fdd-ec1f-4c20-0f99-08de6b1ced27
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SxxOhL7dtoGoF1RxksJSqnuzVoS9vYiaBzW1FEL81zD8la6q4/Tg8HHyPhx/?=
 =?us-ascii?Q?ML+e1OxnvLR7hWv1RTnmjnrIYJUFV45TqZIrOgxsKoKOlryTpSnCw0d+ELmv?=
 =?us-ascii?Q?0yqYVZ7iNbdBPN3e9czyvfUWytbr2ZtrM/+topepIAIj2IYB/qD2IQYPVcEA?=
 =?us-ascii?Q?5BQ/YpXe23Mhp9ft9CewaCfWT9mvvliP2yXKPdq66sNiiN0ezBDAJ3+1Mnst?=
 =?us-ascii?Q?GZYSia9LHAMbwyaQz9kXbTWKKJLe67WaWFQvSmRpXUWrFRRIyeJMjUNBd++l?=
 =?us-ascii?Q?n1p65cjNOli5UxScrWtrwo5qUsDOqAA8v7fW2/d0CmZ7ar9M4yAmwcxFS3FJ?=
 =?us-ascii?Q?qNrRn31XGxyoV6FK9FlBNItND9v/8DXwy/gSQ0w/wzjcAoKKtQ6D1u780P60?=
 =?us-ascii?Q?Lfz2U7j9sEStBoAaee0xJL0zvADcQ02y49JhflC5xrvIUwPN0ch2KBeNkL8h?=
 =?us-ascii?Q?10rsuirWPXHAq+2fMPgLynG9qU2gdkzXabjrgo47iQtRBLUytU/hys+24Ju+?=
 =?us-ascii?Q?MHt0/+PA9OPk9Sm6Ya8gLaJqvYMz4nyANe7m1X0Yo+wd/uFt3YcM/HkAyAIU?=
 =?us-ascii?Q?W2zzgsrnE1ZXBZuzBMNJvGmGDchqsCc+H9ySNHlqUVGrULxltV4zWRvSfAwq?=
 =?us-ascii?Q?OnlktDZgxhRpyB1yUxe4uBBhun1TFSb8x27wNHCU4hamANVlXc6+YdvVeLsF?=
 =?us-ascii?Q?Jvel7j8zevhaue97CSW3rhJ7YipD/bElwXJ6hMF8aKPCdjqw/x81uztjbt4p?=
 =?us-ascii?Q?9EgLFLN1kurczAeo5gIwbVFqP9dSSJ6YdPEEHx4HVGxAfV7fqQWiK+svKR5V?=
 =?us-ascii?Q?ejMB7YVvqHoEFqcrlInRJ8VTfiDPE74dDtfBrM5lmpJGaE+YFhgjoUSCzS8D?=
 =?us-ascii?Q?D+FVz0vUcC/g83UtN1qOal2u/PVuF12+dMQKvHYIWf+lac1LwiWxeZRySDey?=
 =?us-ascii?Q?csBJ2N3Q77Osg6s5pK3El2dQwAXJISj23tiB5Gv/Mi2Q3BKgRYWRv4JGooOj?=
 =?us-ascii?Q?UPYBDFbSCL5lxbUyjok8eonnzmSRT5eq79OufRGG7GQwzVSh7f5FGEavWlJb?=
 =?us-ascii?Q?9l0+iZu1ftfEKT8kGOBGa+feFnkWmGIX8riLXKVBa1JbsN7M2+MW6mv9Yx0v?=
 =?us-ascii?Q?PUjJWGIr+ObpU4X2lqx6MfqyQ9nV3raEs+200VwbFX6xKTsupe3sXWXvCoFn?=
 =?us-ascii?Q?5rt9kMMjWSv1v9lhKetysXQzJOWMaPyqagpsG2e8yNNK16ou4OfBdThVLwET?=
 =?us-ascii?Q?Rh0VWRK7mMrt/08g1l6/+/wYv8j6MsBqTdhVXLkFQyzQ2GnVgZ8oQleRp457?=
 =?us-ascii?Q?ayhCyupnn76jdrVSHJcbBBbetj/ezIYNKx5PLtKd4ISplkYwvHvYiZ/guRdV?=
 =?us-ascii?Q?yceSj6RgJEWsOOSQzYsI8oCcZarVxKO4+wXBkewCL0OBn5RnbzSMDMAuvcQi?=
 =?us-ascii?Q?bEyHPeIBjGufZypW5hj6xIbcG39jqUBfHi1naMjWrovZHzXv2PwqOdCvQGOJ?=
 =?us-ascii?Q?MZPwQMBX9pEHNXL6epy2b+1sQOQ88o4CcQ2pzl1uDYg47BT0/PCidQ7QV8hm?=
 =?us-ascii?Q?FNwxaA/R9XrG/u7uHYNZouPD0gFtx/u7ZtI8KtRX03ei+RW8wve0FPD9iUfp?=
 =?us-ascii?Q?fwf+0IetxR8xEbSjSkHEP0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zGeW/LV9q1DU73l7ruI4FlIktJgiDcWfOhAkWksAdbz4aYXUO5bxH/arBnpy?=
 =?us-ascii?Q?6VFldqp6F0jVvRhv/r6dv8/0PJyzPtGX4UjRuWsWnamHBKmDs3uKpM79RNRL?=
 =?us-ascii?Q?jw9flcRRUQz5vchFMI/sMQTJDHelVoHwfliRk6Xj4dTqvBI2KL8fESQu/IXt?=
 =?us-ascii?Q?TVMEyGsh8GCyJERWxYy43N9yhTGtSP9Mk9aOLTx0pt5Svk1ePC+HLDcA2wF6?=
 =?us-ascii?Q?Qr0JkKbFFl5VqCq3+NFti/L0VV3pJLjrVwAWdPtIHIb3q2KxWKvkpX3F6Z0o?=
 =?us-ascii?Q?NdcRYzxO09op934wOIoW1yHouJ4ldS2cqtRxPIwLZDyiruO7YHvlcjLk/het?=
 =?us-ascii?Q?YKhua2wmyS08sj23hnhNMBMfKz0tG/5RO/76JlymA7SD/05h38Tl6cL2A/jv?=
 =?us-ascii?Q?tX47heXezVmp26jD9Iy122thk2F2Br1jWiWlQLRFbUg4Qi/G+sp3MOvnQe8L?=
 =?us-ascii?Q?4X6dgDMbr3LR7pIwu1JSJfcJVKtzJjugV+mJJJa9G4mx+QCD6nAKUOOk8GIV?=
 =?us-ascii?Q?evSHvmgnbvRhmj3TaQ3XEbFaRahiuxmnCDqtQl7woE+7XPD0ybl5DmFT7Im6?=
 =?us-ascii?Q?aXmJgb32Bq758+XZmTIxgKnEyLV5s2wzCr9LPIiuB4U02X7ubHnGqLmU8Fns?=
 =?us-ascii?Q?//xLnh75WWPF33kiFI6xszX2OI6sNIotiaDChP3hcBFBkCk/EpIGKNem1sux?=
 =?us-ascii?Q?gT8ByHIMkMp9vvpvcqrfassE1udVuUD0cq6ECNPGUjE3K9DIrBuC9ax4q0To?=
 =?us-ascii?Q?G5it8WPAnjA1mGicyRljUgKKPSAdPZQgAOy4Vf2/UQaav9KGsqHJ4nuMH32b?=
 =?us-ascii?Q?wPo7wds9ddcZqyQ8gZhvQ5garDkmxSuLgoqO9Txa1axVcrvkcuwAvx7d3A1q?=
 =?us-ascii?Q?vnSG8Pr36P1ajMZTFw/mAsOh7G0zWOOGfuuxXZhHOwjg74BNLQ4q3wsUNuxt?=
 =?us-ascii?Q?Xk7q7l1+4/V0Aur6edAlUPvM0Fcn/1QSPMfhlifYL9VR8MGS2PSWwWKX+R8O?=
 =?us-ascii?Q?3zQkAbSXJ2PoUXETWHOFC/25D5LC3oUdfwC2kgmRqf5qdXIElTE/Z4aUgRhv?=
 =?us-ascii?Q?Cw4hKipGGVYZcKOYmmw9IJ4M3SyyOQBpKJ9e00z5fhDr4HDKQtDWLsZl+NfG?=
 =?us-ascii?Q?FH2KZdL4F/31GqRS8/zzrAXDEHRupJD6PMUJKB4gohawL03d6XLckhu3z+DS?=
 =?us-ascii?Q?QIraLjs1+ni3vf0FviyxMNDwYuHoXnMLMR6XCNI1Sx3C98miwOyk9MB3Rmla?=
 =?us-ascii?Q?6TE37N5nAAvORSYMZwiePVKcLtC8Ccduf328a0OSMsCmZXO9ChcysV9nK1GU?=
 =?us-ascii?Q?6WxObarXPBSXIWORR3QNs8argnJGKyG3KiSDEdDvf7OtsyKnlhIDSIrUxDM1?=
 =?us-ascii?Q?t89iKyO9NIRXRJVLV+GK19Ui3oDm0vOGTpTHi4Gr5MRXuB9hxXWEntFplxJo?=
 =?us-ascii?Q?prVRr3iUZm/WWkh2yzb56Jdds0sH58eeZr2qMfdU77s34OjSgCRtQWsXClWY?=
 =?us-ascii?Q?kQCdKeUqgYZ381YHgiReWS7w7HRK4iU5RWK4dLuBjoWmQTDToXFm/mObO0rr?=
 =?us-ascii?Q?rv1EMa0LKmk3TjCBYJcIFfatNUCB5ABSrZMMtOuIqoxwdUjQbQfQwV+I0q+W?=
 =?us-ascii?Q?cs90ZwKOSmBh5pKT5fDP2Mfdx0ErzmfBZ0T7JqCqrHfUPhNIM8/QGLszfxvz?=
 =?us-ascii?Q?A6Um4i3nNX74lDSWSD7YI47rmYiXNTxpJSLTY+wzk2TP2TTEXzqOijNs5U0I?=
 =?us-ascii?Q?pfkRk0QBicLCO5vHpn6u4xdi5ssO+dqrYFH4KGME+Z43M0snuiSQ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 671c3fdd-ec1f-4c20-0f99-08de6b1ced27
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:28:31.8777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q7KEw/RFoyOQ7mpKZSU3gsPNjAf/9W20EUDlEqXOBkDlpflxxxkEoBV5qFBuagW5B8wppgGLB13750+ysW9KiFfASpJKtHv8VvE2O7EgB4kGvJN68ls/+hkdQ21RaUlL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16005
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
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AC45A137F4D
X-Rspamd-Action: no action

Add PLLDSI clk mux support to select PLLDSI clock from different clock
sources.

Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
them in the clock driver.

Extend the determine_rate callback to calculate and propagate PLL
parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().

The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
with different duty cycles:

- CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
- CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)

Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
allow the DRM driver to query and configure the appropriate clock path
based on the required output duty cycle.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No chages.

v3->v4:
 - Fixed build error using temporary variable mask
   into rzv2h_cpg_plldsi_smux_clk_register().

v2->v3:
 - Added missing defines for duty num/den

v1->v2:
 - Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
   allow the DRM driver to query and configure the appropriate clock path
   based on the required output duty cycle.
 - Updated commit message accordingly.

 drivers/clk/renesas/rzv2h-cpg.c | 184 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   8 ++
 2 files changed, 192 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f6c47fb89bca..4a245dfff27c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -76,6 +76,11 @@
 /* On RZ/G3E SoC we have two DSI PLLs */
 #define MAX_CPG_DSI_PLL		2
 
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM		4
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN		7
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM	1
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN	2
+
 /**
  * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
  *
@@ -418,6 +423,20 @@ bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
+/**
+ * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
+ *
+ * @priv: CPG private data
+ * @mux: mux clk
+ */
+struct rzv2h_plldsi_mux_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_mux mux;
+};
+
+#define to_plldsi_clk_mux(_mux) \
+	container_of(_mux, struct rzv2h_plldsi_mux_clk, mux)
+
 static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
 						      unsigned long parent_rate)
 {
@@ -649,6 +668,168 @@ static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
 	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
 }
 
+static u8 rzv2h_cpg_plldsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzv2h_cpg_plldsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
+						     struct pll_clk *pll_clk,
+						     struct clk_rate_request *req)
+{
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	u8 lvds_table[] = { 7 };
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
+				     lvds_table, ARRAY_SIZE(lvds_table), rate_millihz)) {
+		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate;
+	dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	struct rzv2h_plldsi_mux_clk *dsi_mux = to_plldsi_clk_mux(mux);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_mux->priv;
+
+	/*
+	 * For LVDS output (parent index 0), calculate PLL parameters with
+	 * fixed divider value of 7. For DSI/RGB output (parent index 1) skip
+	 * PLL calculation here as it's handled by determine_rate of the
+	 * divider (up one level).
+	 */
+	if (!clk_mux_ops.get_parent(hw))
+		return rzv2h_cpg_plldsi_smux_lvds_determine_rate(priv, pll_clk, req);
+
+	req->best_parent_rate = req->rate;
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_get_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	u8 parent = clk_mux_ops.get_parent(hw);
+
+	/*
+	 * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
+	 * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
+	 */
+	if (parent == 0) {
+		duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
+	} else {
+		duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
+	}
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_set_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	struct clk_hw *parent_hw;
+	u8 parent_idx;
+
+	/*
+	 * Select parent based on requested duty cycle:
+	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
+	 * - Otherwise, select DSI/RGB path (parent 1)
+	 */
+	if (duty->num * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN >
+	    duty->den * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM)
+		parent_idx = 0;
+	else
+		parent_idx = 1;
+
+	if (parent_idx >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	parent_hw = clk_hw_get_parent_by_index(hw, parent_idx);
+	if (!parent_hw)
+		return -EINVAL;
+
+	return clk_hw_set_parent(hw, parent_hw);
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
+	.determine_rate = rzv2h_cpg_plldsi_smux_determine_rate,
+	.get_parent = rzv2h_cpg_plldsi_smux_get_parent,
+	.set_parent = rzv2h_cpg_plldsi_smux_set_parent,
+	.get_duty_cycle = rzv2h_cpg_plldsi_smux_get_duty_cycle,
+	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
+				   struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_mux_clk *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	struct smuxed smux;
+	u8 width, mask;
+	int ret;
+
+	smux = core->cfg.smux;
+	mask = smux.width;
+	width = fls(mask) - ffs(mask) + 1;
+
+	if (width + smux.width > 16) {
+		dev_err(priv->dev, "mux value exceeds LOWORD field\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_smux_ops;
+	init.flags = core->flag;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	clk_hw_data->mux.reg = priv->base + smux.offset;
+
+	clk_hw_data->mux.shift = smux.shift;
+	clk_hw_data->mux.mask = smux.width;
+	clk_hw_data->mux.flags = core->mux_flags;
+	clk_hw_data->mux.lock = &priv->rmw_lock;
+
+	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -1085,6 +1266,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLLDSI_DIV:
 		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI_SMUX:
+		clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dc957bdaf5e9..74a3824d605e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -203,6 +203,7 @@ enum clk_types {
 	CLK_TYPE_SMUX,		/* Static Mux */
 	CLK_TYPE_PLLDSI,	/* PLLDSI */
 	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
+	CLK_TYPE_PLLDSI_SMUX,	/* PLLDSI Static Mux */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -241,6 +242,13 @@ enum clk_types {
 		 .dtable = _dtable, \
 		 .parent = _parent, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
+		 .cfg.smux = _smux_packed, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.43.0

