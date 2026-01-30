Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDhJAln5fGmYPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA4FBDCBE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E2210EA42;
	Fri, 30 Jan 2026 18:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CKsMvUyI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010056.outbound.protection.outlook.com [52.101.228.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64110EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:32:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5vp9dOz9A0rPbyxAp4yU25YIDBqEuQrEBNRDGCJ86kBNU3OeFWVAr/ZHs79/pw2lHS4AAT4KMu8rjCTiWZ++FfhPuMaqsYq2z/R6yYcv5KobenP/vD9EfD4lsJaqeK5XewnvgUeI1F5Wi9hSVyES2nj7144DecyRyTCx7BDhtZYne6bbVx0u3juBS6SW4sOXgwXLV5kVIwL3AU3M5ouL07aqjkPtwG/MqV1K/KzMw4TLjuResZ5xdoN994tUccnk9kJLXtaAFvApT9LOXZGX1fQ6EFJ8M6JnKHSjQBAOk1OOZZwQygTX3GZHLvtfW+FkDAWri5guOYI2pGufiZwKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ju4PW7XHgfmspYRrNEvdEFa/w+FJCWysPxcHzlcuVgg=;
 b=p/XcjBlCiKAPrDlkoLrKSKfRm/DDQAorEedDCObiJ0fsRZSzuVt17US+Lv3E+I7ti2CwUghl3LToCTnvp5HGTiBbO2SjHly2f+xsUG2ub3DLgAszGWV40Px8eyC19rF2D2QvKqezx04msap3ZXWuTZTMF8FRokvvNNAQphcq8R9WDBmYEbaCveqdz0t1iKs44GsExDyR54+utxtvc81s5057yBj35RUc7EEenV/rme4Uk1ttRcQFvh2wy7eGq6eUaLfKoJ6yXkDlbHLwkmvyelsTvbWWUb1f0wWVx0V3bYxHt1Lvb/U+ZWt14bAPCP1Dfe/P0ApkK38Q/RL6bzI5LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ju4PW7XHgfmspYRrNEvdEFa/w+FJCWysPxcHzlcuVgg=;
 b=CKsMvUyItxjGSLzNdAkBWA5BlVjL/6FwjpBLhCSqZ3yc0u4IQ4gOBgaAFBtEwBzFG+ukdHxim4HE1s3PmzxERtTB8+DX8135YOA893cIWR4bGf3NGbSCtqFVE0Wkmit5GLyToX8m60Gf2MGPjiZ+uYH0dN3RqmBIWAxrsMdJXYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8547.jpnprd01.prod.outlook.com (2603:1096:604:18c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 18:32:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:50 +0000
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
Subject: [PATCH v3 17/20] arm64: dts: renesas: r9a09g047: Add fcpvd{0, 1} nodes
Date: Fri, 30 Jan 2026 19:30:09 +0100
Message-ID: <06cda917ca78d54f0fc427fb9ebf29405c80c36b.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe095ca-e5a1-4030-c360-08de602df902
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5H53dKDZEYLKvoPry9WxCh1FnU+lDiO76txkpjE27c2CXjdW2BouQhgAvs2p?=
 =?us-ascii?Q?CxrUidW8ZbyJI6U0inUEP/JYymdYsHDg5BoVBPggVS1QoTMvhpfk1jtLk/+o?=
 =?us-ascii?Q?ZmTyi+ni4xFT/WcEuM/tyW1tTYhlqe/jicW/k/5v4nAD7HW1Ste1ct+7jWf/?=
 =?us-ascii?Q?olPXp77QDojKkpasi+Ybn/Glg2fAAQsNYvE3Oo4qo/l3UEFWNS7JZGsHSUl8?=
 =?us-ascii?Q?XWytTaGjpCILhL/vc5+CoTuIRZVMcN4ZJpNW/qMao4XlOlluW8NZP9B9EZpO?=
 =?us-ascii?Q?lOTGLvOgzNUzggHj7pfaKT63Z75Ibs0eVONJmOaoDU2A2ixD315dVHtmwmJR?=
 =?us-ascii?Q?t2kzpdRe9tpBlJ9nmPyS1qSwM1VQ0Dwb0QjoOy8lYAbRFc+YQJicXpSsz5nu?=
 =?us-ascii?Q?Bb2GGXJWcAh10k9d0OYd/UM74jI+Qx/WW2C4gGMgAWmMPB0vTskGmDyMRS1y?=
 =?us-ascii?Q?BW11H8kd5suhd3G62FEAXlKv6xj7xdnGSpWVNti4xvIyB0ySo+D4eFMliG/R?=
 =?us-ascii?Q?8LQ5hcpQvmlLjE55p4KqcZvMdjXa2zUJXJ2DEg3DCLQReOkknH9nSb2rwlMN?=
 =?us-ascii?Q?e1OiP829tl/MFh0KtQk5CtiBywbQ8doghA4OXru1p5zpzlF5eO0c/WshEYtn?=
 =?us-ascii?Q?+jCz9IdFQ6ii8X3TAH/x9VAJzZKwiNilXbx0sRxAyJ0P03BSBZV3o8ofV9OE?=
 =?us-ascii?Q?BGgM4YWlQzRmN/7sqdZooPa4h0bQy8X4CLu61X2a1VbZ3C6IcX75RXJm1mWw?=
 =?us-ascii?Q?d2fp099hWsQE2TV1hlXDlK/mm+HiDzuRu9FTi1fPNRFawWmXw+rlUwCEI6eD?=
 =?us-ascii?Q?BpXGxuqjHyurgjT2bTQjeEAVZRaYvsS+dotqoJW69l2e+sZ/JIo7sIXtwDPi?=
 =?us-ascii?Q?dRn/BdA28EgUVdI43bYyWxRYjeJRlKMTsGBl8JC+gT9GXV6yDQLAT3yQL0eP?=
 =?us-ascii?Q?S/nshIwYdFnd2R7gpw4hgEEuKFN/ivFygxkU4/S/MCLh+7QhaKMqy56yXNLB?=
 =?us-ascii?Q?hbR3kvZPB0zemfJZU3QPxSIjpdsrN7CuXbc1Vh4TP/ImpnGIeeKvJW+8D7Kn?=
 =?us-ascii?Q?PW5bmfW45qQZuOxM6H8KFjLkptZMMUi4bfw/AVEPBLeSEhrUbSG24idb1d9u?=
 =?us-ascii?Q?hpUqMQVZVJqrtJiYstwmwIq1neSSr0FyrxYu+pGWJiNPlsTXDsKiZrfubUdd?=
 =?us-ascii?Q?rIN0DiSLNeK1UFZrQnM7fUkvIHzJOB69npNtIz6wlcn/Th7qaWxobndqHYRC?=
 =?us-ascii?Q?/g9amD6I+AV8uHK9QkFTjrrJ8uUwksSp4ZhcLJy7oUswKhr1/UpAFQfF3ZzS?=
 =?us-ascii?Q?OVahnNeG7DjP503r8+n53WasydJdR73wPvH5jkCnB3l42XubCSfXpamoW9Ha?=
 =?us-ascii?Q?p/GCE3KRgP2SNE/QcUqEOMqaUjnpHiNtmbdxMlswv7ebMIayoc9++9IdjMgJ?=
 =?us-ascii?Q?RLXDw5jMn5RqLAcpV05FOJgNwTHeN/Jb24eNcVyT15yrPyLEh3gPu0lPAcc1?=
 =?us-ascii?Q?fPuyI7bF+OR69xYZ4jwqZXK7itw1KwF1qF6j0pkibnavKPQnBaODy9iSVMGO?=
 =?us-ascii?Q?y/KcBeOQcVYSocFTgxeeniHiRCS1vw30O3fejEZHJayHMXtEjcFWl13I6g1N?=
 =?us-ascii?Q?SyB/F6hJMogei426XE9MbSI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O7qg2dU4xtIrE6VL/ze3wPQCkeZnBllu2M1d9TxvqmaYrhIVhbFzO4ZCxK8V?=
 =?us-ascii?Q?P+75hMZ9rJoz/ppYarRN5uSAlHmklqOBp17NzfUNiRJeXmiFEquor02hmUa/?=
 =?us-ascii?Q?Wgm+WYDvzBMuIcc2CdCx5cGGn0bbltov//GSLRREkDb8+i7AWCZEY+1c//Ex?=
 =?us-ascii?Q?S2Cde5yFqRBjKqXD2etW4U9Z4VBINkQ71Oa1nGInshkwswTPiPD3lSW34he8?=
 =?us-ascii?Q?fkWJQQStt/AYuSwOkNuFGFlh28tOqq1t01DGjymyxYSdk/EbCvtDSpM8ZBDW?=
 =?us-ascii?Q?K9YspcmfroRboFdPAF6TeWgyqvNNHx7/xNuEDuMPqkWjtqIhsqgVxWmkUyPW?=
 =?us-ascii?Q?8QTnDHq+H12AfZ4fkAKC4+7zdQfOizwAVW9S9vl9Kk+KXzz+6xA9339mkTP/?=
 =?us-ascii?Q?CRL8q7pjdVNCklunmP0iWHfvx4veqJuK7VKSiGOx1Fp2+nbS4NzEiig4WqN7?=
 =?us-ascii?Q?gVztaUB8orlj708IVCg57MgXBZ225JLrqmKc1Nuo7NeSh9fry9Qspu+W4F69?=
 =?us-ascii?Q?XKiThMmPTpcNjHqOOdi0Hunn8ZgZMVlam9zZiMP3DXl8KRChIgtp2dw/8ECP?=
 =?us-ascii?Q?5vCrO6FNKs8N+VVCVfooV1gs039XOjfnxq/xrN04eTkMQSxwldUQRFcZTfJX?=
 =?us-ascii?Q?sCT2A0YLagCKCo9wT3i+1H/TqcoRGYAvo4TsKD+k9kchD4pZZxPTKyQioDTR?=
 =?us-ascii?Q?TdBsvxMI1vOTUr8V8U19ZM+nIByaYXqdD2lpIVaMeVjVPjc+df4oJ1AYnSvh?=
 =?us-ascii?Q?K+ZTAqL1hnsbyZnoHBkpasSqWWs/Pnf+pLdYZJG96etgt7Q1DWa/lo4k+TBw?=
 =?us-ascii?Q?mKss86pgM56P4pkRhcA31KD3NQyikg9y9lUHY3sQ4XVgeXpEs9qQOC+vJ+L0?=
 =?us-ascii?Q?0vCTkl4JmSKNA3NoPSjtDa9g5tNb12qgm73jEr4YrrWnp4/pi9q9Wcn2iLYm?=
 =?us-ascii?Q?vgSaqryl6lTjHgjVxXH9VpZn764EWOmEBG9CTLuJnvmdm3g02GEjCPvoChv2?=
 =?us-ascii?Q?06UTu060mdMt7iDMwzcGT9DrHWJOKAStnsi9xwG4MMNPb04qcqpiq5Z2AvSj?=
 =?us-ascii?Q?B6SALz2vTu0kySnRTAMJgur8Uva6Fc7LAZkmVYoLwmqQ1gABMtjmgoZHt/wy?=
 =?us-ascii?Q?iVFIN8OXTTSH7/zvYLZ7H7oXa3Ztq4p1A18sRilWLqSdwW4Z+tDSOfitpKJl?=
 =?us-ascii?Q?7naHEP7kpHVDQt+8xOz4WcpNbUgFVBexgvghAHAdCAnWJBNrLGvSSk79qxfH?=
 =?us-ascii?Q?WrMaAyVVBs2JyhYcpeuFDV4qpzm/T+Bazzsu89T5vGHA/vOyGPTwe7w2T1RB?=
 =?us-ascii?Q?w64LEgCMv1CwLDKi831ooXt+n87kKI+A3ulT5KiSCFYlX1HcP4kaPYphfL9o?=
 =?us-ascii?Q?T066NYSFABboA25R/vgaQ2YMAsKqA2jQZNAsncczWARKaQSo6sEVXtuI8saf?=
 =?us-ascii?Q?+9Eh5XxA95IhvqkYE0M4NvnIkvQ6R6AmiRUlJHDvo+H1uDnIUe+vl/w7+xFY?=
 =?us-ascii?Q?hmSOf1Kjex45xa7XG36hURIP46iCF/LFmci7ghLzu8XPVg4Z4mVfsuwrXJHG?=
 =?us-ascii?Q?VTxzR0GStYHW3a3EWBDIaGMZrdjhlPnx/ZEWg4i9yAGmhANor3n7lKmjZH7P?=
 =?us-ascii?Q?fDq2mIBsEcXTEbzzUbIIIJKeruHWbeyZJD2tHPbdxAjq49/Kt4Yt5WePn1hI?=
 =?us-ascii?Q?P/fd7ckWwsts0a6lIB5W/9rMD+5hiz+i39Ms1fbtwpsHdZ2o4DYFs78XD7Gq?=
 =?us-ascii?Q?oAGg+9Fcj6elm9MfHbpxtgNYGEjAlUI8vffA6VkLjQ5gcoLOS8Ck?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe095ca-e5a1-4030-c360-08de602df902
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:50.1507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUsBIlY2QLV52ezr3rzh9Nkhcik6xlEeNCvn01PF6pNKO5gVEVD8ZJM0glNoOcEBRWCIvw5TkekhHHmf1InHZVlI1aroijUzQ+WByyVbF524AyWN+wSsMipmwZptT+/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8547
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_PROHIBIT(0.00)[0.251.79.240:email];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email,0.0.0.0:email,bp.renesas.com:mid,renesas.com:email,164a0000:email]
X-Rspamd-Queue-Id: 6CA4FBDCBE
X-Rspamd-Action: no action

Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Squashed fcpvd0 and fcpvd1 patches into a single patch.
 - Collected tags.

v2->v3:
 - No changes.

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

