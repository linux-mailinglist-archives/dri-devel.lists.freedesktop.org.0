Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ8fI8qRgGlA/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D06CCC032
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DFE10E49F;
	Mon,  2 Feb 2026 12:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NCPEXH4b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010069.outbound.protection.outlook.com [52.101.229.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D37810E495
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:00:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seqeiJ5oXqPM4u28cgvflpuMeaXLEpVWQR6uUbqZynStixPxfwJZMCKXUz7CmwYXP2198XPOXVX0ZGh4ueijOyRF4K8AtVCM25vcMczbDckq7tKf4f8nJ5RZwb4OADXCW+gBU8w4hs+KUVJgl6Y5bJgha6rkr07E7UEUtrlnLOZo2WNi7QNyvYpOwbRcHLwmLBnqUcNDZLy0x2TysIM9Hp0u0sKqFPnnADz3GHvLeB4gt0JK3exk/js8a8+O/wI1ovquS5N0i5EA+hc/mHX8kPEC+O1RCUmFXxkqRF8d1psymQWJVkNGlo1QdinAfEJvW9IgSiOr1vnUHdmw2t9KnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yU1hzyf+s4ySVB4nfPTOY7sIU4nH8c3+kIazGJzfA8=;
 b=HkukmZTDwdEi5TnIGLEdeYoGlbKkrJo0HjGvJYhtwBpWIics7XZX5mg1JzFnW9WpOwQ3eD4rRFlZ9XI2MnuGNlQlTkaPidJe1OjA+dkt9kotD7PGqGcEiQnUEHzIobRjrReLBuQBVXo+unLFbIuGJY80wLCuVbvNERXMcscBOEjSzQE6usPUxYRaUzGY/Bh6Cw2o9B4Bw0cWr6hqBBsFKw57BeLa/ERjt6+OpjrfvxcfogR9gGN7+tUWWjg0BsNgj+Cjz1FK0ZA6wHrbgNXkCdWxrWB1RuS1mJEJKF5VEaTKuHZsg99gbRhmAvohgtvrmLkSPUcbl/mIYZ9H1aQncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yU1hzyf+s4ySVB4nfPTOY7sIU4nH8c3+kIazGJzfA8=;
 b=NCPEXH4bsyQhfxrwEuGlKxAldRPXTiNmJcVGCmyUBF4K6pNkthx5MrrtOXPR5yjo8PX3TleUQAZafv+h1gbQyoxgwlnCwUyRAqL1HYX9ed6TEADSIDp+WDa3W0uySUqBDZvoKT4bF3mQxxjWNUrXnDUUti9FA/1qFEAvr4+7ZSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:00:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:00:05 +0000
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
Subject: [PATCH v4 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to OF
 data
Date: Mon,  2 Feb 2026 12:57:42 +0100
Message-ID: <6702efd76eb13ddddc5980d02c1759c08baeff3e.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1d5a4ed5-6cc2-45b4-9125-08de62529a37
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oEvKrl4MzC863bbBTnjHRc8AjN1RQSJlrXGuqHF6v4R8HlhhNS+3+6EW6KW1?=
 =?us-ascii?Q?HTXJ66NOvljKOV5KoOi63YUxsh+vpcm9VZb0f0YMo2eGoXQVyLQRySUJgiyZ?=
 =?us-ascii?Q?AoOGrwMYzc2dB22Mnjq1IXDHOQZcCxQk08eB34yEOWq90qNpfs2JqyD53hlS?=
 =?us-ascii?Q?YdhnTblotkO2MZHWtSmHRblnO0MgF6ETKKiY5nWYSPoX1ErbuiUpA3va+kjY?=
 =?us-ascii?Q?palu/xYGiXYJUGScAV+K/B3ewUolm67g/BLMR3nF/AGbDK1BbiGCcRS2fD3J?=
 =?us-ascii?Q?6JlNLDfWNbDLybs5zu/qXo2PKWmAtORIYD2IKhG+fmtIYZpRb5WrhbX8JzgH?=
 =?us-ascii?Q?OWCOqvXmTG+hz2Ib5IabEj8Oeapo/quhlBw4FYrtNEXI1xrpeRIr1bEtgDy9?=
 =?us-ascii?Q?m+le8DFar6FYEnSOjSt0izEj5vhAaJy0shWyStnmjQ+JDvQOgUYKbMGZSmoQ?=
 =?us-ascii?Q?TZ9ot8NGsUaNws+aygro0nHCbhY8Coz98CHDP5VETu7OaFrGvOqAcpDwqe1H?=
 =?us-ascii?Q?ZjkNaplTpXpdb1xzI/jnS5HqWGLvPFEZGS2OfpFRPa/3v9HCSWZt8PXCuA0d?=
 =?us-ascii?Q?FYOQ+/YIl/l+l0Xd2SpfZgFhSGKLBCPy+AKHP1taz7pULSsoexNmgsAhYhE3?=
 =?us-ascii?Q?M/94EGShCeARk/xmgLApZdV5uX84QoX3MIi28T2aB91o+XTBgnDlum7H0SJc?=
 =?us-ascii?Q?duKc/sh2jCIcOjgi+NZsix2dQ3XDtfGPMHn3/M/uW4cC+brHI/h2TEQTsYQp?=
 =?us-ascii?Q?XYBPdr/H/xxxqYnfVYZ8D4bPMtydFMyg491edopq+JQe/EyYokt/eMogJxRR?=
 =?us-ascii?Q?aaiqwlB5H6deCE0Dee7uaFbnkMSbQ2+h7+FH3D2aH/gRiZKgdRMtTxlr5Gan?=
 =?us-ascii?Q?EV3r7EoBwAZqimMZbAuF4adVXoVH+H89iBhtJ3+FISncrZffQLhYuHL/+NyK?=
 =?us-ascii?Q?YW8YngREVSeQp579/8mg+gfhnPfMXEa+yytZ3gFNwdfWTPlA71gpU/Z1K0x9?=
 =?us-ascii?Q?v8qAvr/GOO6RqTtOwH4wNCo67uK7yE5eVJNkFv5qo9mAIeqnLEFte4fPk5tX?=
 =?us-ascii?Q?DjGstGYzzfLdKqHxuX5/LgMi1qPTkGxJ9Y3dReLitYzmYvJ4NIVwr3pFaAS3?=
 =?us-ascii?Q?4v39CHT25q9VvUE6c4YVEJoXCK+7mJXwCqK2mntWuB+uvIkrrF+BaOqocfiA?=
 =?us-ascii?Q?i2Qs4Mew57FsBwpnJSmz8OClEHKebe/h3mG1gIS3M3PDuXl+1DFNZbHsrt6F?=
 =?us-ascii?Q?pqb+7P7shRGw45RzaV0PU8L2FJdNDitebjZfzV1KlDFa8tgFHFBnNIaiMtXa?=
 =?us-ascii?Q?MPHbeZ105/Ukw55okQOjiJMlTqJA/z3YKFXSPzJE5UaAL7Z6HG2nl/XBgAeD?=
 =?us-ascii?Q?a9sMQrEOBSQyd5ZBuJYMpPQlIaTu+5T5fUVtqESTXV8oQaLCTZODQhubQSsD?=
 =?us-ascii?Q?rCeU9SrQzflQUf5TN5HJKl0hW2N+jncAfQoRuA6oA9bdaHGhUr790pCo5Oa/?=
 =?us-ascii?Q?w4wOirrKzLHk3pvz5hERkIY31+0WRAO/UKu8FC6Bow98DLyKCzZlX/eAOD/A?=
 =?us-ascii?Q?SkuqoniCDj+hVRzgiNet9YzHKv3XEX6aCbgXob/k6yJ84QvtHpIXG1fZvqtQ?=
 =?us-ascii?Q?6a031KiIQ/NZcL7Iw62fjb4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qdQWLFiWB6eJb0AHLVlDnlWLu1j1r7GdoVbsRL/NE6UamARX85H94nc5LO1S?=
 =?us-ascii?Q?h0Zm90WC/BsNky31FrxQoCElO2EJlt1F7meMs4yoZuGS3Yg5je7IHX7hn7lB?=
 =?us-ascii?Q?LNL2OG7mOzd2i8WCxWDdRLnvb6ZNR729AgV2eEM0tB0Y0lpLUbapWEyY1vlo?=
 =?us-ascii?Q?q8dKtuhx8+r+XDuwVp9JgkPjS0fyVfkq9/ZTkNcTLTDdHvwCv107qpaxLjCM?=
 =?us-ascii?Q?DdZDgz3h3/9pZRFGobEs8QoPnbaXl/8aZJaoddzzsOtVGs3Ek69t5jDhJeUP?=
 =?us-ascii?Q?Ky9Y8sUB5emhl8mytMbXsboxFtvEnBsF6h6C++jVyKEleZOgpO5p+NLSbRpj?=
 =?us-ascii?Q?lDr/5upRLwfFfNgQ1Mi/V+od+eD4YfpMvqIMe2po7A8VIQIOWn5kM63mnABy?=
 =?us-ascii?Q?T25sGxiyeZq5g57EeiExhjkOT6hXwCwVaMOsGmmdxvHI4B6VvMqKtIUden3M?=
 =?us-ascii?Q?AdL08TmgBnXCAHUcp+a72G3b6KhgSOcCgu3OSm+A9Zf3kBlwD59G86zMbndc?=
 =?us-ascii?Q?OwKm+RmAemJQjVKKA0TRlaEaRrSz0/vTgZIngu/1X1OMaUh5EaXXoySyAuv2?=
 =?us-ascii?Q?zt1ldiI5oYMddpN+jkonrIaLFurU9/aAQlTW04zw4APeoDDcbfbeEMMKBSYw?=
 =?us-ascii?Q?+Lklwdpcg1PqOl5Zckyow02NzxP9HIkkKu+jD6UHKvI9YHzS5NXJnR0+2Toe?=
 =?us-ascii?Q?VfJMbrd2Zza5+VJQYOz+cOFSZnNaUjKIwWwB6KkcxPQkknkCtsRFFrtPiD0u?=
 =?us-ascii?Q?0t6nJds2aq1ax6fgflJ3HTDH9pwaXOsVhB1AEMRV1zwuEP56iGldrMorJxhU?=
 =?us-ascii?Q?Ud//7UjoAnjwZFewrJ4UU8ES3Re+lQjQ2MbkUvvXjLsDfBZajl/gKbHVZ45K?=
 =?us-ascii?Q?UMseirJYoPKrwCRGLJ1GhG3zTbBNlwR2zQR7srDXDnVbsSqEBQd8Q7Nj5ONO?=
 =?us-ascii?Q?izYL5zkElTlwvYvHSXqFqLLe5zLaJZu0MlY2Io4/c8xYGKE+DNhzZgEgP0Lc?=
 =?us-ascii?Q?1f17TUGa795PfoioNhKtIPa/i/2kxyiEmn7zKcCE+UNVn7zuLsjyaSfRl/2c?=
 =?us-ascii?Q?V52EBNMGOcP1F6qd8ES6EzgEEo9v1qs8okGYmLZuQibq3tNdYipA1aH/fGN6?=
 =?us-ascii?Q?cwY466PFq39GOaFb4N31Es4b3RW4rUSBXr6QKpTbWoyLmgUU4vqreoS3tGo1?=
 =?us-ascii?Q?pU4l9EZKYWn9n1iHIghg1pGYPl0H+Q+/n1f8cJuJ+P8tqRgwzUfFNYCQP5xk?=
 =?us-ascii?Q?JKVwVkqxIBfzVwOO5VKg+TjwKTXORPL/R3ZTzrtEp/uy+RqP72/r93ZsB+J3?=
 =?us-ascii?Q?IPpehWhMuAruD5+uDptMGW1858MiMwKxpVM/0JR4kjYgTdFlrO004ZblpSp9?=
 =?us-ascii?Q?weKdo/P4ynQiDxYFWe7TTwGXubj+17vCPQaRwgZ5A5zbOLahbMmrb1ooK2LM?=
 =?us-ascii?Q?tT8elxWuWAmD/kBDnERiBUgi4ZT1FsmkxR+RN/dLVskO9qHc6Rs/VEOylXda?=
 =?us-ascii?Q?dr0YLkx+KUoB6x8G+0+z3RoHk7S2n/YKN45XaUa+m9Sx28lVWMRs/mqyqqw8?=
 =?us-ascii?Q?tOsKPXBGiqHpIkm9BT2LygypSf19J499DlWZ4t1l/20rAB/hhyYW4IsGCUQ6?=
 =?us-ascii?Q?dTuTPO2fDD07YBSBqbU9u33rUJDoPMb28GHzecYnZ4HLRx9rqzzdCpWTqEv0?=
 =?us-ascii?Q?HVrm5RBFI1/sw0AB8IGTZylphdtloDfZSqhKLrUCdurVb5aRGKlf7NK8woDw?=
 =?us-ascii?Q?jcXblzXud40IVKMgQzLlD27m7l9pUD9eR01Ss9pn4pSlb0Vr7F+4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5a4ed5-6cc2-45b4-9125-08de62529a37
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:00:05.1107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zj4Xuq/Fk0iBpON6qPpU8YnzEv1JIKaE6goKSkLR6U1KlewUWhNAuj9gUkaZ96MRAUFqa3/3JNqlKTo+xm0J2FJYkTkisCnIOIn5IxVqYrpFuWHXvmx66hy0zIFHN9xP
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 0D06CCC032
X-Rspamd-Action: no action

Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store
the DSI output port index. RZ/G2L and RZ/V2H(P) use port 1 for DSI
output, while RZ/G3E uses port 2.

Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to
use this `out_port` from the OF data, facilitating future support for
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

v2->v3:
 - No changes.

v3->v4:
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

