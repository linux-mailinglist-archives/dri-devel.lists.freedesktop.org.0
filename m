Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHRlAEnxfGndPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:58:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA32BD8AB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1541C10EA38;
	Fri, 30 Jan 2026 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XNA2n+k5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9445710EA39
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaHAdUgB31ufl0TscfghlgeeW1I8jzqDXjlv9MnZRYbgUS2v9rNCOSLhH4KfyttyD7CWJisrYwZHUrTL2QZS8By26k8pbjrrxxn7BQOX1IXTt36ErJWMXmpGdIcwAM3qDMb941iCKrjQI5knU3MkoGJqiJEkz82KoUoxaggzvCVA2SJWNCqMxqvluRUjivlwfOe7x2NBlVEQPNcHNJkWelHHz7zmZLzQcZ1PQSIV2mNw3aXWOXJ60LGGu1IZcspD0daPRMTUegibKVEygDJqSe5QWFDLR8Q2hpWwRGDk7w5WSQT1zz/SrThNDedGXkkAp8URyRhQXCyGT055Rggvfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhQxhsQIAFt3NtZeF3nbQw6pkaky/REG9ilu+DPB3CI=;
 b=J7+jmd33NvFItsGQ6A9MJVb8kJamBvOWZ5EBZO8EHXzsHZnuUDoWF09IsGj5/6q7wXnDdjK7Y/B8XNkdZxw44GSp3MBUh5LCTbvz0LXMtV8ViHa27amfSzGBGjOS5N7er1Yt0PeBd89GjI647AZksxbuDo3eU74o4mfPu/+FhcWav+CAHlziPotdUaGVxyoZ3oK+b07k8RP5CO7AD4KeTaO7xL981qCg2du8KmONcahR2/5loOvtvNnDAFXAh948EOQRXfkn87Q/NhmEHxQLXG6PKlwdP/xn67B2PVOs8ClGIgyKdc1F0IiJD+5O6agObu3GV4R+b8yOuaaefZ8vgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhQxhsQIAFt3NtZeF3nbQw6pkaky/REG9ilu+DPB3CI=;
 b=XNA2n+k5ATtntpiPAIR29qH81LVFFWBUp/XtzRDBpIT/xL+gCq8F41JhfkBzhamJ39PRwpBWDRGTeXHLzbpLhMudWkF/uf+la7Hdld3sWLoDSEkx8ntdSjUX6W8dIiYny0QLcIYGroTl7sZ+CpcfuC9nbC7xN8dNfgSIVJ0z2DI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYYPR01MB14020.jpnprd01.prod.outlook.com (2603:1096:405:20e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:58:23 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:58:23 +0000
Date: Fri, 30 Jan 2026 18:58:04 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.comy
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 00/20] Add support for DU and DSI on the Renesas
 RZ/G3E SoC
Message-ID: <aXzxLEiANRVVhBHP@tom-desktop>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR5P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYYPR01MB14020:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bc42d8-605c-431c-88c5-08de602928d3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b+ck/BETqrCC7jcadsqAz8Ib6+kQxjrgpnp6S4KCUmAQf0jeR6Tbd4smMPKi?=
 =?us-ascii?Q?wVHO3NaJHhKpSrWY9QIMPKKCIQhIVTJKVOl0ZIuLfIEpJzPrpOJUWAkyw3oV?=
 =?us-ascii?Q?yr3VsLwwrmdsbeU1S+LfvFF1U6L1VI9vCEjQiVqqDGZ5v1APHJR/qroJvsLi?=
 =?us-ascii?Q?uQuv13Rb9iMWzs1G8GCjaGYm3zj5YBNYZohK5BrEOF5llK1ZCNlYWD9bNxc5?=
 =?us-ascii?Q?+JykrphdgCo5dQlgzRjVZV9uli25b3UYnBAHHiVp7AwIBYI53yYFYcqWuUlQ?=
 =?us-ascii?Q?LacWeniFikc5KkMDHFz094uiCFt3l4X9rsrWk91OMEv2cJK2p5RnJv7wqTs4?=
 =?us-ascii?Q?axNI/gpNDcYHmF0xXJlYYm0IprhU3i04m0kKnMRYbrpBS6WWaL+6yXuvCbz7?=
 =?us-ascii?Q?sH5AFSDkgfU9ig2HvWk+kkloBozbT5eKTj43EwrXlLcPrgqiHsGoTwuq+bJm?=
 =?us-ascii?Q?QgTM+GHdwgBnqYAZP1AfxGIT1SrAS9jQYFQxu7LjdpyitEoIWOErM/lKMTEO?=
 =?us-ascii?Q?GCtadE5rZq8OCfiGjIvykeK0Q4Spe+34/ZF/t5JsHTgS8vB0Vj11He9q+SgW?=
 =?us-ascii?Q?RK8Ib6/2LMEQhx73Ee8PeaFEbnqiYyGqTrCr6SXk9Ju3Um7XCNiHXtNebgKe?=
 =?us-ascii?Q?Dgty2fgLr9tazPO54ZvDlC1zUbfyYnRnJ39g5DnL0xhaxoGI4QBQ/wei6elN?=
 =?us-ascii?Q?6cwKKZ8MLgCcw+cQIjEBpYKEuGdGFf0RDumbLqtXJ81R4porit2XGhpfrZoI?=
 =?us-ascii?Q?18hj/wlSCi7aysil1Y9EFn5oFUGzjLPq8shbvGa4WursaDzxXahPFokqsrE0?=
 =?us-ascii?Q?AVQSGLO8XtVItmUPn81aCAVtZrnIyQYpgQAICz95wQCHmnWxhFzAJeESpyu/?=
 =?us-ascii?Q?7KWCMSpkKdCYaGWdqeU4EA7DMi9osBcbLT0eHshkT09rviG3scnja49W2xrf?=
 =?us-ascii?Q?OJFidS3YYyUZXeP7RznS1CUnniyKYkGFF8IAlwWZ8alKR/HFvtINdOKAS1KV?=
 =?us-ascii?Q?+aUrpeL3RM/vcu0mBrsL5vo4V/1LwcZ4hFoEQyiWpP/wXOxE/35Wqtt308li?=
 =?us-ascii?Q?Hh6lcbBqSlna3QPMOp68aDxEQv11nzBzg4hboj5bslTqSNfUWmkd8Sc1fHL0?=
 =?us-ascii?Q?r4+3EUeWDJPW62iAPOil6w/uglF4MsxF3qdVl+9l4qHtXlOE3L76qzojESJ8?=
 =?us-ascii?Q?vvgndNHhbspuokHB5o70D3Ggz/vRkpvAH0aGZNKA2p7emlYh0LsUnztR00zn?=
 =?us-ascii?Q?rI0cAkctBsWEXi1lsa84shisnCKAB3O+IlLNgq0vEho39M/ayoLpH7AdjpqX?=
 =?us-ascii?Q?FACoFtr4Th72mmxjJu2HK3zxk8jjKleUipVEsguorpf9sbrmpv+5GzJtgZLg?=
 =?us-ascii?Q?Cnci204rbjM+b/gTsIIayuVW/Fz4PIB1Wux++cX4aijGqKKa0BLEElpidjJL?=
 =?us-ascii?Q?ZEGJRANviNh9yjDCJgcP3bVfrbZotiNrt4UPhPx4rhzUSr6FzKTZ9iGDw7Ff?=
 =?us-ascii?Q?+JbL5AjPFlMzxLPZsXtHUUNGjVZWMyWj+kTFiYRy9yMdKXI1QqD/iEtkuzvC?=
 =?us-ascii?Q?YaKw5yHEheEHLFZv9h9McG/VFrK5ptjSPJ18HTgvySgMpan2u0QHvdV1m8F1?=
 =?us-ascii?Q?uHZR7cvKDJFgKhw9qIIHPfo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XqN31+0fgXLZ2Ncw53qLh1Cvlp3qXd8DY7EkU3nN++nl0SA1yL5QWYWwb4Ys?=
 =?us-ascii?Q?IjTyWKci26Grg11idIbSitCpVluQoG9m7zCd4lvIqVYMiBgMP0dKEv0jibYz?=
 =?us-ascii?Q?MkLv/dYw4K+LQe7VY/LCgZs5lp1unP83dr6tVrqIjvfOS9VoFM3eu2+2KzRY?=
 =?us-ascii?Q?Oa/7pAXuAnShJWDg8E0581j6pH1B8AZGjfXh9w9qJvbX3u4DIMQSVCtbVnoS?=
 =?us-ascii?Q?xfFQ0DkIW0vdUOu7jCUVQQw3UTv3mWarI8HL9Vs+FS1TO+0gqjrcVAVN1fik?=
 =?us-ascii?Q?HpmcXqgEKWqG26ie2MFMyIAzmEJNvJTlNpoVewjh9jmAUcgW2HyuWouIqvnL?=
 =?us-ascii?Q?0xkgfFwdFr5CgFcPxRkW1aw+XCEnpDxe+SJzcpvfP7J2Ah+GuK0jcTcUL5H6?=
 =?us-ascii?Q?ji6cz/cAZm06eZKh3BlDm/nDSKQXdQCwdpTyoqnbNt79jPaw85A/Pj/JOEDM?=
 =?us-ascii?Q?2hzRrD8E1H3tF/m4uxgzWYZyz9pUd2aS1mvixVP2qDpi2Gx0n5JjsWMsMCQC?=
 =?us-ascii?Q?iwfi/ANasqZbu0FURCjoTedpazXC9nb3BH1Mx9GwEWMSw5g0IgKvcltKdRI6?=
 =?us-ascii?Q?gKqXikotW2QFX3IgYKgJduuTtVz0nDF1yEsY9Wx5jbYfWiZnA2sLnBbMrNC0?=
 =?us-ascii?Q?DLo1SSMlF6r2l0kneerasvRW/x2UNCXg1AUyp18Lh+NAA4coP7rqbok4i/mg?=
 =?us-ascii?Q?o1AlKtEPu+ufehtecz1RKPYNTh9o/FUox57Bl/Mz/ZgmPCVt8yyrsFKbzGp0?=
 =?us-ascii?Q?g3xXfqXMf5lzazVDYAtLSXdAjQZOJ6ba76Cr4Qajpt2XZyTH5zyTUc9B98V0?=
 =?us-ascii?Q?fHoBS7VYZqIZTKoReOxjweBz2qdLRg3KabO6kBBXXgpxvTgILxjF91r51nAD?=
 =?us-ascii?Q?FdRmFd+bqMS6F2L2pkHQr+YzQKHWgA/XY9az7ginLdcbtZ1+X7kmkNPZZ6A3?=
 =?us-ascii?Q?fHNun2sosJ9rPtdwf70FCoqF7AVnn8hEoWz+QnzWE7QuHQpszKT1a0c+NMdo?=
 =?us-ascii?Q?MraDjLv+nKQtLtCQbhvUvbZc3BNIKbzij6iJRLLV7oaD+ArX7RBR4kX1pfCP?=
 =?us-ascii?Q?h26M2f77HU46CEkqpKn85OsPYn4F2vnPrwwoVXYKLpjxz5tyJES6tBd2v4a9?=
 =?us-ascii?Q?C4kiBG0g+r2uuAor8XVh6Vn0B6qWabrWIy6Rj/LaF86cuxzDp22KnhP1AHOj?=
 =?us-ascii?Q?3tLFdKL6F19kSisSgmvkjVAXuYaJOUk9yz/TmUc8/OQ5yTKHjdgHXOpOYo/A?=
 =?us-ascii?Q?mM5rehXg4yggN6LoS4voW7ea5yb2WFjX+K20qLjjq1ul8eK4h9xCjfFrCQbm?=
 =?us-ascii?Q?dQmURt8wL2NnVkRmblgb1eCXxW8hE0PBKpBHmg7ad6n1JucGGdq7TLsYv8YE?=
 =?us-ascii?Q?G85cYiGcguB3BQkrwTO/1VQPdQnZa+xnBCARvmqcVlPrz8bFeY1BGgJ7s6Fv?=
 =?us-ascii?Q?Me6zEdJb+8773FkqbNA2l1xTjE0caDoN7QgGhHZv4z7iXVeQcfHLVvyrJvK6?=
 =?us-ascii?Q?YP1kUn18yM1kBkxaqStHOvg713fUdmB8e5mSZf+Q67VEWuIFFy9RwC/9/eKZ?=
 =?us-ascii?Q?pSzctZJd31LGSP9EhuHkYYQ7jszhCYVT+3CPM0VMvbVEHTrZHRD8GVXqqJ4p?=
 =?us-ascii?Q?3mikL0ZgZsG4Y69dVVMk4WF6AF0wbtkcl5/SfsgAwV3ImWvIOMHZfAW389Le?=
 =?us-ascii?Q?xJiRiIIJN+JUMHgo6pV+G4Z4C2SVe+oWCJ770KRnKwmlGEO9/DPZ+Ld4JTdr?=
 =?us-ascii?Q?/J/RHDvS7KQ8x6/To7/J8na5O3BHbij1xn4BDb6HRS2lwomS3qxB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bc42d8-605c-431c-88c5-08de602928d3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:58:23.1889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4Gevh58d2WI60zH0gemnmkdUro51FY9KsUfexYy53BdvyBAHdLOeSSIF8Vs7SksU1kEWDKeTWh8R/l3LoQ5yk4AhGYEyoEECtIuMYQnM+LDKZYc8+TFelp/mjv6f9kj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB14020
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.comy,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:laurent.pinchart@ideasonboard.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.comy];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 5FA32BD8AB
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 06:24:57PM +0100, Tommaso Merciai wrote:
> Dear All,
> 
> This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
> interface found on the Renesas RZ/G3E SoC.
> 
> RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
> of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
> and Display Unit (DU).
> 
> LCDC0 is connected to LVDS (single or dual channel) and DSI.
> LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).
> 
> Thanks & Regards,
> Tommaso

Please ignore this version I've made some mistake while
rebasing/squashing, sorry.

I will post v3.

Kind Regards,
Tommaso

> 
> v1->v2:
>  - Rebased on top of next-20260129.
>  - PATCH 1: Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock
>    operations to allow the DRM driver to query and configure the
>    appropriate clock path based on the required output duty cycle.
>    Updated commit message accordingly.
>  - PATCH 2-5: Collected tags.
>  - PATCH 6: Moved clk_ids to match enum order.
>  - PATCH 7: Collected GUytterhoeven tag. Fixed "dsi_0_vclk2" position
>    to match order.
>  - PATCH 8: Collected GUytterhoeven tag.
>  - PATCH 9: Use single compatible string instead of multiple compatible
>    strings for the two DU instances, leveraging a 'renesas,id' property
>    to differentiate between DU0 and DU1. Updated commit message.
>  - PATCH 10: Removed oneOf from clocks property, which is not sufficient
>    to differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L. Use the already
>    existing vclk instead of vclk1 for RZ/G3E DSI bindings. Updated allOf.
>  - PATCH 14: Instead of using clk-provider API to select the right parent
>    clock, just set the correct duty cycle based on the output. Updated
>    commit message accordingly.
>  - PATCH 15-16: Collected tags.
>  - PATCH 17: Squashed fcpvd0 and fcpvd1 patches into a single patch.
>    Collected tags.
>  - PATCH 18: Squashed vspd0 and vspd1 patches into a single patch.
>    Collected tags.
>  - PATCH 19: Reworked DU nodes to use single compatible. Use vclk instead
>    of vclk1 for DSI Node and set to the right position.
>  - PATCH 20: Fixed: dsi, du and adv7535 are part of the R9A09G047E57
>    SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
>    of using the r9a09g047e57-smarc-du1-adv7535.dtsi.
> 
> Tommaso Merciai (20):
>   clk: renesas: rzv2h: Add PLLDSI clk mux support
>   clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
>   clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
>   clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
>   clk: renesas: r9a09g047: Add support for DSI clocks and resets
>   clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
>   dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
>   dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
>   drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
>   drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
>   drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
>   drm: renesas: rz-du: Add RZ/G3E support
>   media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
>   media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
>   arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
>   arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
>   arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support
> 
>  .../bindings/display/bridge/renesas,dsi.yaml  | 144 ++++++++++----
>  .../bindings/display/renesas,rzg2l-du.yaml    |  54 ++++++
>  .../bindings/media/renesas,fcp.yaml           |   2 +
>  .../bindings/media/renesas,vsp1.yaml          |   1 +
>  arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 175 +++++++++++++++++
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 +++++++++++
>  drivers/clk/renesas/r9a09g047-cpg.c           |  84 +++++++++
>  drivers/clk/renesas/rzv2h-cpg.c               | 178 ++++++++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  48 +++++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  26 +++
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  11 ++
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 105 ++++++++++-
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
>  include/linux/clk/renesas.h                   |  20 ++
>  15 files changed, 933 insertions(+), 44 deletions(-)
> 
> -- 
> 2.43.0
> 
