Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLhTHZmRgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ED2CBFE6
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C7D10E488;
	Mon,  2 Feb 2026 11:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="k/kctSa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C82D10E486
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:59:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDeWBWv9f62FMtoJ/4b5vFG/6Nv0lnwQftyEjvjq1y9jmGw9f01/40FdO73B2lOJAL7PQTnuvoev4y7F5CtHKu2ZmAwuRzAUTDTjVjNawqTP432dJLcOGzX1RMI58dVJo8xaeyGYYQZmIAAFSxDpSG9i69iPsf9qw66RQDNf1AABED+IVJ+MGfpWRIcFP7W+kuCd6jQVJltr1lSnaEFpSHC26iZZ5vwxK+zBC+L8/nJ3TrEIQcgL5qBoU1zUnNn2Gez1DHTG+TjTNAOGofytk4lIpqJlhK4eTO1AZLLYo//xZradx0E2S3DM0RSzyh55myyS1tvXo2u3oLPHTUqAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkF03rgtvi5I70SwYjvEABaCA9jLfzH0RwcJP1pBx0w=;
 b=jtaZ7+yyqPmMbPd2KQuKyOhXTMtt7LvMdOVwQ3TFdDfNwIDRgVGh3ESuQhQ6PsUl3/2Ej46xzDF4NkdEx4HQ7v1fXTtdH8uUDTZe2vmP35IpuNHRI9HFHnYo9YhsfXagvEeV54inCs3eYOl+jpE7w+y8tJhoZ/ZdzBW/gX+F0f6YhSEQ+PJbiNbvGNWUVf//yUu/JxtQc+tcTVn3nRitXBx1LO3Oixo82ZqGhZ9+J7jBopf8wvlXen9cM+53icI8CP0tETAI3ywwfLiljo6jq0OYO2SlkX1RCJUYf3xtiy0NvrdpB8YnT7UUsOw5JjR+2Yyu+9c1uMN3jq1yOCUXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkF03rgtvi5I70SwYjvEABaCA9jLfzH0RwcJP1pBx0w=;
 b=k/kctSa6xrM/zZmy1MFQfS7jUtQQKRMUG0LYxb5FSiGS1X/LpEDLPyMEBuFSz32rTyI9FOfzkEGZZDYwDflGpDnM2imTFI1aQaCNP6EqmtZUP+a6Li4HGBmp6mU+m+hXqrX2xm4Dzg5wQSSrzGZjkJ7OZVzX5DKYKD9ZxBXV6Jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:59:16 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:59:16 +0000
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
Subject: [PATCH v4 05/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_CSDIV clocks
Date: Mon,  2 Feb 2026 12:57:36 +0100
Message-ID: <d81b635b379e69681736c7bb43fee11b5b73acbf.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d123996b-6115-4f7b-9b55-08de62527cf5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ICGugaWHvs5Dg8OHAEZaPGCd7Rd+uv0C1RsO+nntpmijwnv1DFhtT/SweAV6?=
 =?us-ascii?Q?x9kOanUk6kJ07BwrS/B46IJrcZ6e0B91QFRA6uHlJuQsbLHpM9D5tttZiUAN?=
 =?us-ascii?Q?pvprbBlOcmXNnb0vkMEd9GRb2R3UttT9J8Bro4kntXXzRmoGLPkaMQrlIH/1?=
 =?us-ascii?Q?JT+lShukCSf9/Cl3hhryM2XyhcaCb7Qf1Y/WtF5gu/grLSRUb0zZOXUsFngQ?=
 =?us-ascii?Q?qy4E/8eXOQvN87VjXu01GNO1+c2HKMDIa3Y/lMzycqq/mqaqkcyNyMBDGowl?=
 =?us-ascii?Q?8LAG1iU6IuVocv1T1WXE2R3PhZEBK0LIYERSA8uvfoBGarfpcyJvGUSgdQ6n?=
 =?us-ascii?Q?mk6Kn7UlO93puZTdTO3sbxoO8tix+phHThdHlEnrAtiz+DU0fvPteCb7BPJ2?=
 =?us-ascii?Q?BKcq4TsF2gshRCbW0OqC7ArLy5BOzkCSsw7n4wvboRmo+sbCAERwtIQjUNcS?=
 =?us-ascii?Q?/epDwMy/Qlx+KaVNsvtP4tWx7qhjvSGbsAv6YYAx96uil1BBsTIPrXXM7mGs?=
 =?us-ascii?Q?aBi4hrovPoKOdDvwlATsOGgQgTIKY5GlABiZ6L79ol/QXWLi0ymCRIn8LA0y?=
 =?us-ascii?Q?MhUjWR+naq3v4b8s20M50x3jKVf6h2lTWU+ELbMsuAmUsAfQTBuwuAqNBP3e?=
 =?us-ascii?Q?E40/crAedV32gRIaDF6feFl/0DE8biI/1YoU6Zt2J1YJGo59DxA4PaPmNC4V?=
 =?us-ascii?Q?KnN5un8uHvdp7JfRYXKHvAgnH2U5pKSiCqJO++9hSfo0uI9SrKKjzIlCJr7k?=
 =?us-ascii?Q?y+iHqzDU6lzcVEfVWZ0zUdflp0ltHBtDOPxxi6TyiRCndzbgKZE2I+2rKNyp?=
 =?us-ascii?Q?oOIMlhMzGabb3cCNcJeQzjgeQsURKCX0CTv8EIHogc68CjWuF8TB+tb3sRA4?=
 =?us-ascii?Q?ySmPvoUEWn7/t6cId34Bilr9ZBfF7gCwhm2prP+BYcN91sd47VWdfm3CfUfV?=
 =?us-ascii?Q?pIc5tmuV/U1blnMeaKq+Yn9V7H6nqJZaLnjdNUnDiy4OKKvByqVasAr9W8j9?=
 =?us-ascii?Q?B6eLtQlgIwIv/vbwEJ1DytUGct266AZK/GdOMlZEQ7ORnC2ZcTzMptwUBSSP?=
 =?us-ascii?Q?Sc7BuSZxeOQ+5VkIkdJOjFBysqd+em3B1Z7tjO0v+42/dx5bcEZmUWa8IZln?=
 =?us-ascii?Q?BxewV8pzGVp/fTbWT67P3IBlge/kmsP5ExEUcfigYSb5NosuWP6W6ntmF8QU?=
 =?us-ascii?Q?8+4r7RTYKGPQjhq60gEvSdXs4WvecEBGwrKwLp4lwkQf8tlX1ATxbTONM+Hz?=
 =?us-ascii?Q?0fs8mcLkVXfhexGyLgAC2iEaPw5jT2Rt1i/6jLmXV1EmUKjsk9X2kvsJLskZ?=
 =?us-ascii?Q?oDq93p+d0DLRTROfYgfdOl+RJqEKF6EWf/CIkB1ZqcxMUlkANTpvdNR1wsLS?=
 =?us-ascii?Q?yEDuc/I1577ImHK/3hDoUgsQKBRKqQt+Uxenc+5FlUL/74dbbNpVBVO6yYJj?=
 =?us-ascii?Q?wEMCeQZwEUmaWhCh4f7H6UWFi9HUPZc8sDufkEFoxAqZ85Rs5QbAXDE2Qx3F?=
 =?us-ascii?Q?aM/XLbsX4VWPnb5CEfCClYZeVxYZaNyHuBfLUlUFxUhKUz7VxD0QXePrDo8N?=
 =?us-ascii?Q?R8q4yJfTdiSaUky95VMLHCPuV4y+g1wB8nS453aSKDp9Gty3lIp+H7fqWjCM?=
 =?us-ascii?Q?E/dqAYih8E0SAcY1QD0QGZ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jOtEJTFq4wBSicPGXpiNmxGPtjYNFDMjSzcuHp961N0y0VLVRA+gzm8XJ13Z?=
 =?us-ascii?Q?mH29BbRPnaS5mqV/RPehvBrSRc76E/fJGTVN9XoMO0zoEULO4KtgydxXFbWV?=
 =?us-ascii?Q?ZChH87grNQjQAVD2Xva5eWQ79vPiJqw/ysPbAkwNBCF5/KVlQZHxX68+QhUZ?=
 =?us-ascii?Q?7mCFTcCtB/spaYtiuyllOlApp5QLXFrviV3Cb9/6rdh8PpLkjb+tZKVveR0s?=
 =?us-ascii?Q?naL5FClx5mdLE/tYXK40t2AZ77yRLhYO0NDNv9RacgrK8LtuKW7VxW8hIE3O?=
 =?us-ascii?Q?7LohGA82Gm89vl3otfAH4Gj+cpeNNN4pGQJZyzZGqDQCgHAPsU+bmA1pLnLZ?=
 =?us-ascii?Q?b3pN+IjEx2VujyCwyev7zd761O3A/1d6Y6yyf2qxDFQaL16Q9ZBRnZHYnxot?=
 =?us-ascii?Q?521kVlcPiqyPmNLQeifGh3hn3DzusrhfD49GV+T+1ePR2nId1rVR+FBfD+1J?=
 =?us-ascii?Q?b4CsBeoglhPS0jTTQLTSOKiHzbMir3Zs01OeD+xAteRcWKOtvb11fqqYHRxc?=
 =?us-ascii?Q?PM9wvYr8/VPxEKGFXwrGV02CyjC0Eq2E/IO8iU4IAaL5or3hiGQCHulDIfQZ?=
 =?us-ascii?Q?8Y7YnSh0g1xZC6utUPm8SfeMIZ78d7b1PNfnZxm7ZeeVyeSyNpLc52FouxMC?=
 =?us-ascii?Q?dAEPJ35W1lvqde9+XXDCgHD3G8Vf+DkRLTa7LuP2pNCyqUE7pjlNFHpXAJhV?=
 =?us-ascii?Q?ugv8bgPBqGxJSnu2U0J85lr+v1M+/dvDrYrzmDatq3Qao5d8P6HTOgHcHQaB?=
 =?us-ascii?Q?HZVjZvTKlewCd1FWspihLhKOO1lCnEPIA6u5gsIWocNUw+p696UvXwg1tttN?=
 =?us-ascii?Q?G+Xb1Ixs4wr+bkHO9t+s3R71VnAWVsdiHXZbJ7wN/Ztz+BEQVsEvtWMQgFa/?=
 =?us-ascii?Q?+IwfvSFGJkmfXtQyFc5AEi0bcgdf22KB83igVJ6xQJJi0k5Lf+3szBjCyMVc?=
 =?us-ascii?Q?M2g+UbBmZUtWTffvmEUmsaQLfu82GVCKBW1z/YkkkbEjV0UyuUU9aRT77YKs?=
 =?us-ascii?Q?uSgJUUgfkH2GWiHxTQItrkssMs6I/PMF6x26CK+stZGYzuc8H0G3SYBsK+9B?=
 =?us-ascii?Q?TA0fZaLwtZUaJDUMn34aGlUqVglQHOXdNE7O8duAqqmbn9nEfJtflbpyzYnF?=
 =?us-ascii?Q?+P81znKWTxCPJ1IKez+yJYfWWH8NQmllATKcAq4oc7OykCcKT5XYeZreZDRK?=
 =?us-ascii?Q?T7M6gWGQMCBVCQEWQOvfiEUdpOhPfZkTfckuz0/frDtiQgXhhx+Z0joGsXqE?=
 =?us-ascii?Q?J1BUXmdOZlg+srNPbd+uj60QQMvQKmM6sXUEI1TyQpUwxSNFEdt1MBbt6/z8?=
 =?us-ascii?Q?SANpv3WuO6bXbzrGfbiQlUsCtGumcA+GsCbqs+aJqEnFXQ9TYlxrGkoQ2iY1?=
 =?us-ascii?Q?Xn2Gxwlp2XoXk52PCll9qkwYitFrpTrSp+QswTj/Gf7IigoL4iWr6n84TVKU?=
 =?us-ascii?Q?zXIiXIWfDczv+/OFMa4PuVgD8wvgMNigYX52B39G4AMHXl2BwRIUSh7TjZt9?=
 =?us-ascii?Q?lqStozY7GGyen1SsnSYF26Dd01vEzyUKDBmUR9FCvP2CvEgLy+DmRVRknQ3Z?=
 =?us-ascii?Q?iJ7mXNDbMG7L0ZypGCR/JFpibdR2mwQ46r6CgREmGQI33X/R1mYi0fT37cVH?=
 =?us-ascii?Q?YgUhAJa5fosWPjoDOVXc6Jl8hK1HQznputzjv5GGuSOzgJyzsaKciTxsPU01?=
 =?us-ascii?Q?FahK/U0DhPkcIKUy7OAxrqVZxhO5YzEtmPEKx35gNRlO72qAi1M7l44+FHgg?=
 =?us-ascii?Q?sKWSHk/E1AR7yeYUxTIqUiwGc9SNv8Na+1nPkhvE31czi4q4AwCW?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d123996b-6115-4f7b-9b55-08de62527cf5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:59:15.9866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ISj149R5IK7Z6lc5GzOqAp1jp8moOUFBYfciy4cFWoRW0hXHg/IEmfa9K3t84NZEOD165kWAPBn42y9n8CBa5BFaan9ZMxq5+IE7qv6ekc3GIBzTES9rkaTCP2qBku2W
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
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
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 26ED2CBFE6
X-Rspamd-Action: no action

Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable DSI and RGB output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 18 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 0e707391283f..aa6528b72cef 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -71,6 +71,8 @@ enum clk_ids {
 	CLK_PLLETH_LPCLK,
 	CLK_PLLDSI0_DIV7,
 	CLK_PLLDSI1_DIV7,
+	CLK_PLLDSI0_CSDIV,
+	CLK_PLLDSI1_CSDIV,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -98,6 +100,18 @@ static const struct clk_div_table dtable_2_16[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16_plldsi[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -198,6 +212,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_PLLDSI_DIV(".plldsi0_csdiv", CLK_PLLDSI0_CSDIV, CLK_PLLDSI0,
+		       CSDIV1_DIVCTL2, dtable_2_16_plldsi),
+	DEF_PLLDSI_DIV(".plldsi1_csdiv", CLK_PLLDSI1_CSDIV, CLK_PLLDSI1,
+		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 74a3824d605e..33bc3c27291c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,6 +148,7 @@ struct fixed_mod_conf {
 #define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
 #define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL3	DDIV_PACK(CPG_CSDIV1, 12, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.43.0

