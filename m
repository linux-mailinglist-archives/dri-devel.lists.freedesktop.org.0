Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM4dMYRRj2kNQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EDA138091
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7031E10E82A;
	Fri, 13 Feb 2026 16:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a4GRFZFg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011010.outbound.protection.outlook.com [40.107.74.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D87E10E82A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:29:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rG9U2Tw/AMfa83IgdCtn7XPnYCVUMVwlbiPoZ14erdHToImQS7nPZJMvF5hIDufBSgwNHKsB23Gyts2ZYFuBffgDWQbZ12qmVYAdBNkpTNcJ50GtsfegPHusrZfbrJtwurr2amO856NnPeU6Wg+NF5g2VSPRNoCisjINdA64Gtxv3jPc++Q5dYbszmL8m9OZBkexp2jOekFEd03P8BwkqRgwCtSFN4POIDmgyDUYVT1CCNieJmNe4T6qeuZvUkOIRDHeCEoC8etyEKLAklZgNTXDrTH9CMiAx2+mMMuaWhzKk2o5q17dbCfqYq1/d/03f00XPjKxyDO7sGFaQzVeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z64lI9tKADTgWJxAGe01xRuJ50WBP30tzOjMBxQNjLA=;
 b=ct17mT+Dw+c/LqIo03/6mXT8CwwtpCXvArGGb0okmrxW+x1YgmJOUzxqALRUbJkL7veABLXoKk9J3bms8HwmSvUYVfS16E5CRnLmfHKGGap04PjC0Kp3xczkEUr2ApyowEm6XAsWIIiegzYKt5wSLVXhTxTH8eG9fnUFEfJHf/37kmWMVselxq9JVouN6eCXQh2C9ha6NTffzXsDaXokMaZvRnhwPSQ/IXXSJbhMSVOK/J+sfnC+Wppxx2Y8SqxvTBSdiYYchmDeugFIZY8dY8Nb5sWRhnRbGYQ7uRGQgw0EkUMSBzThfrTAPxueTekf8O50wzY62vQUJIA0A2019Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z64lI9tKADTgWJxAGe01xRuJ50WBP30tzOjMBxQNjLA=;
 b=a4GRFZFgsb3mLT7wPi2dU8apgRVfKdZU/n05PyYiUxD0sIMqFgPlagi58yLtszyiebnYL1SUtSCC/T27BoeAglMoob3FWSsz4xzqKc9NnRbUi2zBMCB1OIdUsQhP57Z/Ty4nQw5s2fM03Ku5W54nFDIk3tY4vveoFYaW7Ed7pPY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:50 +0000
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
Subject: [PATCH v5 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to OF
 data
Date: Fri, 13 Feb 2026 17:27:37 +0100
Message-ID: <54edf1fa30f571686b55a4d67a2b100089739d10.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: c86850be-63ef-4f6b-c87c-08de6b1d1bca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KmQnaKuHoLtg7fiK1MjR+nBznCloIB+3bXmDMDKTaS0xZz8p+H90DcWUVdpe?=
 =?us-ascii?Q?Bdo3tOD1xTS8WseNiausvfHtQ6jRs3xQx2gAYRx6XSGcEGmo0BuJW+P43lEF?=
 =?us-ascii?Q?VVCAz0Y+QA6y++u3rtJEuG53LgqKKlrn+PThLhEYB7Blg7dWPOXf+YBH+o/q?=
 =?us-ascii?Q?e1VKNaxwhbI3LS0NHIesGG3Ausn4WjjDXuuGItmfeAM8kXBr3NS3SUdIugMA?=
 =?us-ascii?Q?CKrbj1iP1wp17LkdP05xKtWdLU46j6Om6T0f73Ml2KbaU7a9EV0n88HV9R/8?=
 =?us-ascii?Q?zM0ZCl799fx3d61uOvCX2Tly5GKcURvu6Bc8+k+meskAeTIs5tCox7j7fLbg?=
 =?us-ascii?Q?pwBFKg36VYJuDWpV4yYHGP74aNpvDcDb6MS4PtgHFwuLeULUNB+WEo1ocGb8?=
 =?us-ascii?Q?zkI9pLeYt2zuHqt2S8oKp4thDyzpYc7Ja7r82uyqTpgi1WpqK609dV+M3q9e?=
 =?us-ascii?Q?6cuchBCxMnPLgIgdApQxQHTB95TWRLTYb6YtFwwqHR3WGF+rWd8VmauMlxen?=
 =?us-ascii?Q?oXGuDbysj3WilXbDQKcGfep9Ye934Sl/MUGjKYah+kxlYPvNBMhAWAST8zkS?=
 =?us-ascii?Q?XkNlP9fR9MmadIjiWrqrN8U11+YyaYFqKG1RUG3V5a5L3lRDR/qdbYzI8xTT?=
 =?us-ascii?Q?rWQ5h9Dq3LxWF9mxMLJA7LB+6cLIkaQepGhcEAJikRtUfr9/zctgLxKgiFz4?=
 =?us-ascii?Q?Y+ugK4SXKL1v3Rr0DIwBp6MRTk7jrsaTnYsVV0qLM6UpA7MY9ZJ/u2166aAp?=
 =?us-ascii?Q?Dtwek6kZrMhUp7FCx/91S/K131pUCFsoflMsI3ebaze43MThaPdkCkA3QMB9?=
 =?us-ascii?Q?FBZ+BqbgHdNgfRTNGlOTg+WPNuQWzO1e3nn6Ooj5N+Vayad3Bl9jRlkQCLK2?=
 =?us-ascii?Q?N7jdmnC5J1Iry+X9+cFckhUtGP2VBcDsHsNxFHMiPbD+g49hb+fZ+Ekc/PzL?=
 =?us-ascii?Q?wmCoP/mpl04E26AjzArPIKMBuLIAhtOxu5nhTwSZwbuDRZBtH0gYl09MZxa6?=
 =?us-ascii?Q?94A9JX1BFfWwJ59MUyGh1+9JKew25F7BvGTEXvpR4NEfApoegbbgiYwSUza7?=
 =?us-ascii?Q?VB2wyQu1vyrsWgfCTQ4A0QCIZDglwoogCGCUz7otQqPiNmmlI2MwEX+2ZBxK?=
 =?us-ascii?Q?3VJIOLb1IW9R4EOiAtqTkdej6AKcHTB8yiaCQPSyQ/KhUIT+HkA3dJwhv+3k?=
 =?us-ascii?Q?Ld3IJkSwXGNUHkUbLjAzdFJP4k4X8m9XPZpBvtFJLmKt6oqQZMclseqVmu5E?=
 =?us-ascii?Q?yWsHoWdTnd31wfFSgK0tuhc2s8zJLdBv6eP3JYWbueZst1/20bN4bNeXJHQH?=
 =?us-ascii?Q?XA/kxnIs/So/cDFmn4utKQ/XRIIZLhkOkaARGG4HGnrp567crUD8P2QESCCC?=
 =?us-ascii?Q?+H8peGhx8JkCVzRqO0sScI4eDTHhDjJWCMFG5YVdJ4jj6cUMbmXSNaJ9ziUl?=
 =?us-ascii?Q?xlYlw/tMU56e/eMM+1c14AngH+8stifyyOev5kQOkF/kHEgKPfo8k8vFJvjw?=
 =?us-ascii?Q?DMK8tcubxTsp61M0+RO7R1em0/JaQ6+ry7d1rdGJYBtZCyO3/lVr+hmagThJ?=
 =?us-ascii?Q?W2qhDY1RtqR+uzhBPhLf/ybCjZ80xlDJUogPtInDHgsNUbtlBPKLNk/UcaPM?=
 =?us-ascii?Q?C7CZdRvd4W0JNBe1YbkWgCA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u6mecACMg8p+IHQSsszSXJ6aGyW7VTxUrtf/2YRO4tx/f3iYQLnffzpaIWhV?=
 =?us-ascii?Q?XMRg/TjOwqhpMKLv6RaSd6JGf4lEprQuymlHe8udp5FZwk3T1aK8C9rdqyCF?=
 =?us-ascii?Q?yGkl1KzhWDHHcH5MTUVPGJNDPehIT//fPkockCX7BEdx9EY2RKjmTG98kRxt?=
 =?us-ascii?Q?MIEaHspkmTpxV8Sh+Nr37w2KWAg4rd8Y3lypYOr78Rz4UVaTXcwoaW0qjW+t?=
 =?us-ascii?Q?qm21DUFQQ/A607TKdUOXmGgpkqzFE04vH+9fC7ioJeRRe5xNq3JuBUuU5erG?=
 =?us-ascii?Q?YwBqngUfM7XAfbo/PR/oYLY26/GfQ0ccgx85Q/sds6hrkavjx4/qCNzNmIAX?=
 =?us-ascii?Q?wDK3AkK9ZOK8fm/P9YASzXkl+XI1x1VZv5bnTMfBzpZAWgrqWASOYbwP6boO?=
 =?us-ascii?Q?RYXSS8iaw8ywRjpKMr4/fyhl1MjOtXyY12TDMKFis0I8+FQ44xgMk0t17/dg?=
 =?us-ascii?Q?1L/9G/Ytjza1+I4nvrQ90PeN3O/lHiLVAd7RFUMvur1x9qXkVN0t01XHKwdJ?=
 =?us-ascii?Q?tMeYRtiMvNYQtrxLsO0DAorRH4TOuouECmzxrwH4ygJm59m465lvxpJdRONU?=
 =?us-ascii?Q?UQxX41pDzVU8PJmNQBMs7FDJWW291TCxcW8n1eFP+L0co/ekuFiPjFVdh/Hp?=
 =?us-ascii?Q?niIQmLUE2w6vAKyGpwVe2Nsede//R7grHXL54n/NC1HatsGPc26Xd2aW1yWC?=
 =?us-ascii?Q?DKO0Fyeld+nBQ2d+4tki2e69Y28YPSy+JE0PD1HYXy9ulnM9ZTJAjNbeFG7K?=
 =?us-ascii?Q?AdYVR08fJWhvnIoT4I0gqZPPwC9JvuZPeV889P47TWK8X8TJHJf8ZyxwwlGO?=
 =?us-ascii?Q?m9zfiFpHoiV0MmSGp7cAJJx+ff6IAEzSJN/y5AIwiQsrgQMYLP5xA2OMbdPG?=
 =?us-ascii?Q?uT98XAXi2H2d5xAXf/1xVXiAj42yxv4D7LM0m6+SVH5Zr9QdH4CW/id4CFnN?=
 =?us-ascii?Q?RGV0T5yOBtR+FkLRP8eHa2LI2f6qmSXHNc6lus58upgdQLXn5NSR2vXRGh9P?=
 =?us-ascii?Q?QdkfdiFq10/nwlU7mBBkPA+viJfKNPhl2vJQbyGeOGQlm0KXtRPMk9AQnPuJ?=
 =?us-ascii?Q?6xFmq3lxSvySzUsjCLH0rZxXfP84m5sSSJZKNKBijGYXrx9yI1Msrl7I8Dv6?=
 =?us-ascii?Q?0yulLMiJnOPqQHGoGhzcL/q9AQtaHe5klRkcrvENZJAPhrZQJEPPsvXB1jkF?=
 =?us-ascii?Q?zjtwRMHZnH6MOQnAjCEDJWTjk3j2PaOnpRb84DOcoXqiZEwxXAd3ZRAUHKDZ?=
 =?us-ascii?Q?1tmagzp6ZgJ3odChl70VvjPuGWgON2dowpZROsD00gYgih6JFUR1e2VZ4B47?=
 =?us-ascii?Q?HiQCi8ul9YrUMQjD2z4ncZOUU8qWyATHYedqLV6ychhvb4UwG7zy+aSkZdJi?=
 =?us-ascii?Q?oW+AdnDo3hrfPP4PhUczzSEiLQJXs6YfBpNYshWaf+2IjIA4Elp0tAy8hiSV?=
 =?us-ascii?Q?14fX5kGLxxcdYtmmmLoY89vVILO+QtZm5DTlytgwoCZUORTHmX1F7009FBIq?=
 =?us-ascii?Q?qI9zkSDV2qRZdgAu5J7SLWhLYQ7IEbCq2w2YmhKDOh2jPBk2lJ4zMZDheEab?=
 =?us-ascii?Q?gtHRdRhcEiyx3DTUGHkkxlHloKtWyOfYF/be8/kJUy/MbIRPUp9FpDd0PfHh?=
 =?us-ascii?Q?YxKGgWSQdG5E4mptQp3g+NPROXsMKzhjvHNI10CdzBtsykHxS5EwYCFexZh/?=
 =?us-ascii?Q?o6PxEkCJdVF45AP29pfq+2AOFwDkzPwVjBO0ZoDpEttyE+dPAoyfXjEPlptL?=
 =?us-ascii?Q?VejUSi21HG8xIYRgFpDHQMu6F7VvhGGJdtCeo04AGLhzlecNtlqJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c86850be-63ef-4f6b-c87c-08de6b1d1bca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:50.0997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TP8lvsGiR5uMGUfxhlzsjMIcxxHLDQC4WkzJgE22JxhVLA00zzrvRI5rBtKemKrbXYM/p1fZOR0HyPzwtM4FkBZurhPOica0+wRatxfr41+/HQRGeyErkt9MKRdV3f5U
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 52EDA138091
X-Rspamd-Action: no action

Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store
the DSI output port index. RZ/G2L and RZ/V2H(P) use port 1 for DSI
output, while RZ/G3E uses port 2.

Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to
use this `out_port` from the OF data, facilitating future support for
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f74a0aa85ba8..8ea8594afee8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	int out_port;
 	u8 features;
 };
 
@@ -1153,7 +1154,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
-						  1, 0);
+						  dsi->info->out_port, 0);
 	if (IS_ERR(dsi->next_bridge)) {
 		ret = PTR_ERR(dsi->next_bridge);
 		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
@@ -1394,7 +1395,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	dsi->info = of_device_get_match_data(&pdev->dev);
 
-	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
+	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
+					     dsi->info->out_port,
+					     0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
 				     "missing or invalid data-lanes property\n");
@@ -1508,6 +1511,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.link_reg_offset = 0,
 	.min_dclk = 5440,
 	.max_dclk = 187500,
+	.out_port = 1,
 	.features = RZ_MIPI_DSI_FEATURE_16BPP,
 };
 
@@ -1518,6 +1522,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.out_port = 1,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0

