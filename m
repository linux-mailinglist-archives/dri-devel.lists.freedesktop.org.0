Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDpdNLNRj2kNQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F4E13810B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B5B10E831;
	Fri, 13 Feb 2026 16:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LzljL5bQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011024.outbound.protection.outlook.com [52.101.125.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C7010E833
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:30:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBQEYDMQCDShuwUH7fRNg4dZ3Z1XlvTcMLcFulriKIq40OJdraZh0MvQaf7BWHJcEkfft2I+B2OzryoZrwKWkTvAxgnjtnpXq8QWxIu6JFT9q43/QsaPKGwvcjTl20xU2djs+J/+AfHYGE0O8X0VFKQu8WBbs6bBnIKTAPMgnQxrVsRQN8bhaTzm7RnUpi6OqWn4G5bByNdkpgvAVCGtq+vL4ysFhT+2qEwQiWg8O8up6wIOzVICwa71H3A3cJqZqTskMLOAJ+EEl89K3hY+KYWc2IQQn5nMK7SUiPBslTPYuFbFoAqw9LT0XtP3D0DRpyMi/wSSKWH84x0fNiHSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2MKjECNldM3ES4BNg2CeJan+krMEAL0Tb22MZqeZnQ=;
 b=L/5zXJ5xUwb+8Sa4vmMPQRWai3IAbK4m2WyOc6MUI3CvoQTxSFzMthzc6o2izdAa7eenKTFvaOfPtmYslTVFkfR2aLDKs5D4PxgHq81qA/mafgbCyqg8kn6gc+Rn7vyiy4FBA1jyOtBz6akxXVqgZ0WI7tgQnB+nAxrkASIdm+zFeV96O1VGfLLNA5gYPogUWmH0BrNOFcOKrtaFQByh2IWAkBeWdaI/TPtfNoOE0FGSrcfoOOnndRc6t8shbca3PS+rWO+NHdTJi1KBdL2dtOHS2YJwp5/FXWNKuV9pLkrKed0jQ2N3OAl5EHhcnR/IycrRwOMRe8U4Gll3XEkFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2MKjECNldM3ES4BNg2CeJan+krMEAL0Tb22MZqeZnQ=;
 b=LzljL5bQTHmCP4b0iPSnvXUJqmtLbsK+RvcRDM4QXN62D52tRq2sVH0iq33X26g4Zfy9i/EbS/OeBewxyewVBo6OQnZjw7zh9ehfrdBOOV+2HChA8DW4+ucId21j1Rxg1vkRRkxGo6xmKKWWCQuE90vy+rLJ7cHYaGdyaydpbw4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB12106.jpnprd01.prod.outlook.com (2603:1096:400:3d8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 16:30:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:30:37 +0000
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
Subject: [PATCH v5 17/20] arm64: dts: renesas: r9a09g047: Add fcpvd{0, 1} nodes
Date: Fri, 13 Feb 2026 17:27:43 +0100
Message-ID: <847adf39a18356fac8098d703b0f0a940c3c109d.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB12106:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bf8b03e-c23b-4f31-85e1-08de6b1d37e6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XE1IAbTai2xjAtTNzShDxEuM30QD1qBDaJMO9UqAOSDsmcPe++j2SA3IhbaG?=
 =?us-ascii?Q?nYpCErqooNVWRMwuK2YQUWjWyD+A4C7F7v2gbEFi8EcB7gn0jz4UKAW2Bd9m?=
 =?us-ascii?Q?aMX4FjnMsYAPVKM6w3l7fwvje7KffMgWyiCgFT7g5OQImfPZivvkqoNOP3lG?=
 =?us-ascii?Q?tGq/qdI4FZXOY6c4jI/cWwvVYuM6opDlS82AVYwqSdgmZstunFt9A5Iikawk?=
 =?us-ascii?Q?XSZ2M2Oco4yvdGRwrOIPnYTyuy46Ewzt3iZFZJcBrFMU9SCoObI3UYwKXCCn?=
 =?us-ascii?Q?+am4QHAtvhB55A/kvDKmk00+6hh/wOU2hOpm64yBWdO2tciL4Wc8uj60ogmt?=
 =?us-ascii?Q?be5ZwvRAnDpUuYxK8OHnduTIlsRE+nhoofmgSjX5UPmxaaJmcIbEm1hm8jcy?=
 =?us-ascii?Q?dfeETXYPmIe1fAo+h06a7wHiqNkpAdlE2zaYTHwE927aMZ2UMbG+96//zhIj?=
 =?us-ascii?Q?namjCaqDqECRPp42X7kPvsDU6wXlUTi/U4lOYlar+l781xb72y6y1mGpu8qo?=
 =?us-ascii?Q?qzwfJ4tLZVnOeQ1GRfz+JAWwG0klQ9SgyN4WuGDVOKrTblYO2BdlU+GcA2yv?=
 =?us-ascii?Q?ymE1Xn451u12KMIcea03Tggo+gbVFidILROqa+KWfLf8HABPVrCdtKHE84qT?=
 =?us-ascii?Q?YRp+IA65KCYr8OqEJZgHloEmIGU2NZt8xMzesj56NOi7JhWPrqueL5p5MMtz?=
 =?us-ascii?Q?qCBYV0uChRQNLaMIAqzcJ7mD/IGOy2aI2yZhM2LNyVlGLAEQPuGTZKDgkl3A?=
 =?us-ascii?Q?q363h5QS3N4L52m8AZqqQCcXs+40SX6CZBS81FEZ+BTfAbSdobhRkx7/k3bs?=
 =?us-ascii?Q?J9OarpBN3sFvRe3mhITGAlDH0gd5mEAh2MmUsF6KdNHXI9/XKiV5dn+2dTPg?=
 =?us-ascii?Q?uYw7SnaUMFX6jQzTcNphH2c1hd+KOzb1Ad2obfcZpn+QGjh3uYgF7bbP8+RM?=
 =?us-ascii?Q?05g5tVLP3bjUNPcouOSMnMz90qTk3P6dFdCCFGz7evuvT3Q7TMUaAN0mb+ZJ?=
 =?us-ascii?Q?hhsLKx1m6erPLPxIQxyQ0k6cQcS0RPIYBWjsqm9+TM70Iq6QDmPv8oYAbIwf?=
 =?us-ascii?Q?s/GonFc9h95V+KTWtATBRyuIbQ0XPqKBwRmxGpd73nb4Hm6PbkH1PrWmPs7s?=
 =?us-ascii?Q?t9j1NMO6oFDy8Ol1x/qYav3Ky2LiTWqYc79qNG51B5AYJ+hY7QHYHgwdSAGM?=
 =?us-ascii?Q?VnbzfXe88VvelSO5klBM3a8Mg3yOqPgm/cwg6g7RcwcD3IVRBlQj7J+Jfh14?=
 =?us-ascii?Q?9xbY+VEZrJMD5FKjxlUDz+L7CjZkhDeugyMuNu5qhYq+bykyM/AZb7AXA272?=
 =?us-ascii?Q?EnE8WEg3Lov2iMWSNbOGtT3+G3LhW2+jKXZwSWLfThw/fqwMuQxNRocQCx1Q?=
 =?us-ascii?Q?Rr48nVDx3lWrNm2Na6fEMEgTYt0iY2UZ4iZnez6zbqCIY5LNEok60thilaad?=
 =?us-ascii?Q?CXhxY0FkQyxhCP1CuCHDqR9qEwjNaa8Ww+FNnQqa/Ri/JM0OEMx9q1I518Ry?=
 =?us-ascii?Q?U5uVRnKNlgCMnIkMYyMybsfqkzAfrs6ycT6PnRCbY1Z6QroZYkcceD2ExEzs?=
 =?us-ascii?Q?j2QQ+pzyr36oZnTPC2DDuoPILbCGfzhA7ETc3rjsTdyEelTNIc3fQh622n0J?=
 =?us-ascii?Q?kniIB3DDG3tQg9nzYGV1fd8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?paG42unSBmniIwAJ1Q7wbtVVxtSTWbTxRWk2/0xFTgtUUW9Vo8D3VPrXtcM+?=
 =?us-ascii?Q?2uoQRVYVBljQ08JQa4ZO6KNPWox6QexJAJLZ2gJ2loNtngXS8cs2a+pvJHMe?=
 =?us-ascii?Q?8UV9m+G2y+kfX5ng3LZ/Lj4n5vrGwFU3+zDQxRBouVBe/+5G3O1VNAvJsDQB?=
 =?us-ascii?Q?GLfauBcAje9/8+1gHg3IKOr6LvCb8ltp5EneDkzDNWQXAKrqBSZ0eDcweLIY?=
 =?us-ascii?Q?9ggTgW/XjIWP4pdYq4S1IXicvjB8sL7imKP0PvdTwu6d4Trh5HVjlD+Yd2bm?=
 =?us-ascii?Q?XD4JVLjFMPT0+9raJLmKngsRqVP8YBDp61E/PJAx0R69kxPHt3otBrIdEHnX?=
 =?us-ascii?Q?8PefgsR2DQGPepz2oFhCMG9Gw8m8lKWhe/be+f3BhgvZ5W/bgePpG/hibS0Y?=
 =?us-ascii?Q?7PiASF1OoY6jvEk0FdzV9FB3P0XS26EMP9CZzzy2MTTebjVXF0fwRHQwdwqS?=
 =?us-ascii?Q?ObZkme0A3g4RlFaLD30NyfBqcbjMpM65fwUDXYCzxd8ZsxevBwyQqJZ3X/p/?=
 =?us-ascii?Q?MkNdc9CKjbIbToJafI+wA7JAZP2LCTeVh5md8SXtUmjQXaJPLn9aRn0gNVI0?=
 =?us-ascii?Q?QFrXYcVj54mpHv0PRlTf1SJiy25gb052ZoR8QMLksq0BMb6yWQiZ+akFzRi8?=
 =?us-ascii?Q?tmn/+NQpfAsOvT8JzrPN6JrQoFMS3OZzkPmbV9DoIiS7hCbY1eBZJa3dqctB?=
 =?us-ascii?Q?nnsqIZBjUvpX3GMPUA58qulI1peJR6QdC0Gr8SpVIrPSI/quK4Z0ppdErtz3?=
 =?us-ascii?Q?IkH9rtnG2i5g2Stmi4ITg3aSM5Ey3LICeYpPq6cysQ7vDYqNe5kbQw0m2wTu?=
 =?us-ascii?Q?gHRRBDDsrq4ixfyDHuyduhdM5Fz9FourSQQqaK9RWsvCat5217cWBOzXZqZ9?=
 =?us-ascii?Q?d5tw9JEwY6kMShjDuIWCLDgtq6SX23C96Uv+smtCvGra4twJfFlE1Pw2rqYI?=
 =?us-ascii?Q?hZrIaFZb0ozOXLwmkmocgSPWMTeGCAyMz5xNEaxBYSmN1BgtleqOnuhab2Ck?=
 =?us-ascii?Q?e7l6qVF2hpFfrBR3AJ0yvIp+Sv82AwrSVQgmCiSrRvcbXY3taDWrjkTwRHxg?=
 =?us-ascii?Q?L5iIjj1OKEoQmrlMXL57/v0p/zpdkJL4V1OivdLNDtviH8trwLKgtmgjB45J?=
 =?us-ascii?Q?lseFqPaYp9Ue+Ucb1ga18oc3JsKw/1xU63a50RyyRBiO160yM4aZp5RVtEbN?=
 =?us-ascii?Q?9M4bFMcdxeVIjZMtzjAVlS5A8nrwLDSlU/AiveGqfqVqB7fXFs1jLZrQ9ND+?=
 =?us-ascii?Q?ZnCkr2NSJKz3pLZ5acnLinJsJ6YcUp9nBMhkSpDvmvpbXHLttyFdo2lccW9/?=
 =?us-ascii?Q?SGpftmeL2tOpVWfY/1ymD1SU4/y4n2d2G1jXY2D7emlLP98xD5x/PTTcJRcD?=
 =?us-ascii?Q?bv5Y6h+La4pVcohTKQTdlQkWkPlBBam88vCKH80GTSxBn6aALRXRnjmLKq6F?=
 =?us-ascii?Q?sT+6wbTTFIqfChk4gOC2/2Y49adTWAlspw/ShXHvdldaSQXB+f9bdVZOlOfH?=
 =?us-ascii?Q?re3mrfkw8pEjQt9EZgo/MwTdIQkj3lYwkQZ1WckVwFjezvLo9q2ni13zdXJE?=
 =?us-ascii?Q?H0JmUZ/bysgwRo7APH7fH1ticXnGWQ3/qlZRTQDBLZr6IT9a4CcyPAHFOhwJ?=
 =?us-ascii?Q?BxfuZP36ler73Pj9RvPNOaLW+jECvL1JkTIa7Ee3Gt4bVmtvPyRY60a6xtZ5?=
 =?us-ascii?Q?bCBWlqqDSx1PbZzWkK/rwynurHzP11steXQfjAxfWCfm5V/S+1oXfDLFQhJB?=
 =?us-ascii?Q?6i+EWMDaW+8vVmK2RtcJIaolMugyGhSjkZLxKtRXx7sBCYgnz88G?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf8b03e-c23b-4f31-85e1-08de6b1d37e6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:30:37.0136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: caXNY8kruBn4appJER8I3k+VQdztnnpHF2Cmuz3gb/y5iYvGF6koeoIm9Udj/om+XdRSHQKJVQaURxcIDYcSbgnYVk3sz7JyHaDNktD1uEVewXDY9Omz4/wHVHmxmxQT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12106
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_PROHIBIT(0.00)[0.251.79.240:email];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: 25F4E13810B
X-Rspamd-Action: no action

Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Squashed fcpvd0 and fcpvd1 patches into a single patch.
 - Collected tags.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index cbb48ff5028f..c90a778250d6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1431,6 +1431,30 @@ csi2cru: endpoint@0 {
 				};
 			};
 		};
+
+		fcpvd0: fcp@16470000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x16470000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+		};
+
+		fcpvd1: fcp@164a0000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x164a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

