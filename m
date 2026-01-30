Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OvUABv5fGmTPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66485BDBED
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B029210EA3F;
	Fri, 30 Jan 2026 18:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="d1MocnUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FC810EA3D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuQWnRKhCImCSKcw9ONobQhYgPTQUHJXccI67Myo74rKTU3ofAt2CtqhO9xleASajweh4DVxAxpkfLeggCI8pRxTZGgB4EhCT9AS5C/pUFH8/6bULDIfDS9+JGvYuaZjsvgh44BNPJ7jyHo71JavdZQ/NdVRsvOgcVG0rCyk+LyYagJze0HDZ2eh+QROXk8AWKE+YmfJ5nxRvYpM2LH0pQjIaSfq56daY++ewkq/ZsIBs+RfFP/75JdgTS8Owreka9TU3I+jxm5eBV1H4FQuy76+8Ba9D01nCtebEZSpVwzr1GxFppI3XIFRywlCtpygzE80t+7DKUZMXqnhnHn4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XuUnTatmUWJZn4GYYviB/y2jZXAhroHYG6lhgFNnOw=;
 b=wSS0M3+2Q/56YzxA0JOCuIMKgsLzFpUjF0GL6KbsEDDox8TJ33FOHDRnUTM8SLAXlcT0SH7zNR0hOxFlHCKcZ7VKdWL7wNXTYB8qkJD9ucQvjYjuO7NS4pOJVsmo37N2WHZBH938iBzD2hs/C+0JwCslGBGYH2aQwqayvnc/6dSI51VsQOoxYgAdilACv78reNFxKn8v+A9RQls6yTCuhsmVxD6+UFLo7ANyF5wCE5nMUJe4Is6PCePK0qVUWRUxaSBn+F4pdP2JAaGl4htXOSwqL8phrAS5Z2kHG5xK/NDIh1izk+FccmrkLXsKIWhL6286KGx7Jv+zDe35VO0Msw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XuUnTatmUWJZn4GYYviB/y2jZXAhroHYG6lhgFNnOw=;
 b=d1MocnUKvSk/ugWDzpXDYekYkEUkC+foHGWBy0KJxvNh0T0q0OE9alkd/tWWSHfj5x+dF7o8W4Liy/Cg2O+PyKPXHUJNs6ExMD49yBvT7Nvt5v+BciYeyd8s7rweXG4zEfwrF0ZstLqULRhbaSUqyZ7IcLVV6ZXFLODUs457iNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:49 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:49 +0000
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
Subject: [PATCH v3 09/20] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/G3E SoC
Date: Fri, 30 Jan 2026 19:30:01 +0100
Message-ID: <4ee75910889b9cc51367924215e5c40ecdba424a.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc7da2b-ce84-4b2c-affc-08de602dd48c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+FX7X6Es0yVLQ45hzsV1pH1aTNcUpewn4DI4Wzq7i7c0NG+8OThwhxuoyVSG?=
 =?us-ascii?Q?F+HbZCCBrgdANB8+NrmCABrx5LHcmr5Qf2CfV5DZeuVUrzld4ipKA63cl6WG?=
 =?us-ascii?Q?XgjNF8oX/PHlevu8F70VwvBMmGp2KQEIm7k4ZDYUS34BGg7soyn385DKhyVa?=
 =?us-ascii?Q?zUGCl9LbyCyPsTDJAPIcTwDoMpgzjtVVGeW0HHrDK7QLxZw3nHtvTVPCS3/+?=
 =?us-ascii?Q?RcApOzApyL/hnnJ6EWBwfZeCSMmQNrGOXi9+UujgzGIa6T40qe5bX76Zb93R?=
 =?us-ascii?Q?0A32QTT6YaT0SeBLPhIByXHkBRE4qWck9W/1OrdpdU0++I8PtaibIB8JI28H?=
 =?us-ascii?Q?kg8Ri95OFKALGJEviQ1/Uh9S9nNZFdHnIZxpBbu8AtHRica89/wXwrX2EL+0?=
 =?us-ascii?Q?pO00Xy7UEyXdCp4jgipjdR8w/ao2nhoq5wuSpP6Vg+QQ9xzuXfh0F6sV+AKT?=
 =?us-ascii?Q?T8A7S1q3xNcb6zXkKc1UjmfeLcGrAGseL0IQSabhiZ8LNRyeiVEdRGO3/xoT?=
 =?us-ascii?Q?EZFwjHswi3M1NmnaR3oIUZe4buEGMwrEUkfwQPxr1I8miXAiyU1H9M0xaDiM?=
 =?us-ascii?Q?1b3kNMEDqTVpPA6vTBajVYmYfqpDLZVpWRLDCxnLf4mm6GasbTPMB1eKRDr9?=
 =?us-ascii?Q?zLgK30CtRdUdqM+Mddcj7v9UPEibW8oBdeHvYcUsgOgM7OmhntL8a+L3wb6S?=
 =?us-ascii?Q?zeL6UcmPkotK6suJ2Dc4EnX+CyemqEuuO9X4BXbcHh7VlzQ6KtS9wyYqzsFH?=
 =?us-ascii?Q?zQIp1ph1bKST7FYsfqEtUF1SEq6vcCzPQhp6pQZm2cmatWiP+hYM8BW9wQm/?=
 =?us-ascii?Q?3mFYEED+gRRLhUDdJATRoz3Zky4MK8bufz+n0djCGNf5kFPZV296UKJiUwmn?=
 =?us-ascii?Q?eYGqcc0ym4Av8Ebl1d+u8e+tzmtq5h/C0ytc2jWCu6uA7Bjgvv1/nlDmIkUt?=
 =?us-ascii?Q?L72ymnSBGY+00Si+MGaGBUpkLqc64G4lLHrXsM0bR2lNeQlTmlOHTNg7+wXL?=
 =?us-ascii?Q?zI184NQ9hxehGcsZi4fsagJwSEFPANKnYyOyN17FbXY+FEAGuB6yth0VreHx?=
 =?us-ascii?Q?F8A0XjlGtBdl5mFNouaEvpcYBVtYXRmtWeb/XUZVbAUHHanZuAZOOhslUM/K?=
 =?us-ascii?Q?jECNtCeclyLEJit8CLOvwcJ8mtRdWAZhxDTsMk7YZOirDuUVCCXHNZ2HtqQH?=
 =?us-ascii?Q?LqFyQ3zjVZ3LcT9+W/dhc0Y3VV5CoYS23NExeOFqTcweEbpBHO8qp8lbfqPx?=
 =?us-ascii?Q?q7xroN0N5PcIPPFxHVuhSUPUHPHs/ECIgGcwMY0gIhG6MY2MCazJaN8WAaxe?=
 =?us-ascii?Q?jY+bhkdfCCha2I7/4kGGwFEB+EY/mRO83AA+/XSzKZn/c7BgT4xLcilQIZ+3?=
 =?us-ascii?Q?5H2Yl9Bxq/P5JfP8CtD1rmjLG8SImdZnmyo+wWbqTBKw8ZT6+J01mDhu4Ubl?=
 =?us-ascii?Q?kblIyavCzNo7CYCz3G4VBviqYy+OUIdzVTpFKcVw1T/r9Eo7/R/+gmnlJ4e3?=
 =?us-ascii?Q?Dv/ZLymeEtWyPvg5evEylRd8FC1bE3LnxjmYGS1s2z6AcAwkmyjb0YYLDiDR?=
 =?us-ascii?Q?u0nOAqsFlU2ITtKM7yj/6q9OTWT8r5ha2jXPtroT/xKoT0s4KMBZXOeGLQKQ?=
 =?us-ascii?Q?Hw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ym9FAJ8XdMmMfz16wKzBUVkMn+Dy2TY9lNtLqQRMXi1bxXTAzGdOnkCE+8Hr?=
 =?us-ascii?Q?wsgamvr60ULrf1luajZH71HoFnI5Q5BUGpNT+EKmf1+XQnXuwVdPWyGKmiSm?=
 =?us-ascii?Q?Ggcpjc+8QbkI7t3vt81ktjUxv9fv9N90Z5Hl8eJz1RJrt1JC3SiRfvouDLTy?=
 =?us-ascii?Q?rsgie5cqOoiOP3fRKBrePi5cgJKPWUnz4T0QjvBlqf+DFNb9XQ2d9+1k6ciu?=
 =?us-ascii?Q?PSuU9rs1jUpAbbKaWL9Tmhjjvhhu9M37i7Y39Sc7j4VTJq6B314ozrOSQLkE?=
 =?us-ascii?Q?B6vumcq9MQNfGIfgxlj9eKQ+eikrEeHmgyaxW0NZZ50kDL5m98wpJXv0mJ1M?=
 =?us-ascii?Q?y9wo2Oj713XcxX5LHE6vtuJinN162Vom+mCi3S9ui8Ut/NCWY1MrphSMElyC?=
 =?us-ascii?Q?LWYAxqSMN62xEVuFTBJ0RwDmpzLqalLutQncpZMF43lhMW5J3Hptcp0PpG3R?=
 =?us-ascii?Q?n7k7uQzXPTgLi7N4uEGN0kKZCVPVCtMNYQ2w9DnxhBmR1vKmKhl0pLnfFL8H?=
 =?us-ascii?Q?Wu9sK7BgrLHbOa8k+5j/pUGtYKN0X2mESmBp95QtVFbITl8Nbvg4N5DI4uuV?=
 =?us-ascii?Q?g6qTtZ52qiuizzuZI/CRpQOMgSbtlWOXh56EprQzfqy0G0GYEgHYlhqh88Aw?=
 =?us-ascii?Q?I+eBktNktUTT4LF1rESYGtfOLS8dRxsTiKx/1gtxX/LCLW52ZP1lyYMs7+OM?=
 =?us-ascii?Q?Sj9LXnVdTqWnCsPXXU42+5ElS5ZmzpnEHd5d9NUYjj3BlObxHKdUx6XPcTl+?=
 =?us-ascii?Q?p95GrD9i200TVqSH96tFviOuak2YL+5zHpgadu8lH6FGNz4XZEgrfBIE2XvR?=
 =?us-ascii?Q?ahU4vkXsuQdTC4YcyyNq30XRFHH73PLeNUKiu9tUTFCla85SZs8/GocjZxkf?=
 =?us-ascii?Q?XSdWyO3e/jFz1ELAizccxLoaOsV+qwF5pAPd8eK8osThJuOOV5Dg2p0njGY8?=
 =?us-ascii?Q?1YR7w42Rv9NAy+w3E8tHAYyToc9LooJ8vnbOvunlw1vUeGVBgWh1zwJvSNEy?=
 =?us-ascii?Q?Q5PWvKvXIZtZGHe33BU9GlwGGuWRUrVuG6M4c7VajJvcD3Pfd401H7hE8slJ?=
 =?us-ascii?Q?jrjPsypewUV3zdno//GRzsyL2VMDYIW0k7AUl/TIqe7DUB6/VRvOYc2vK0vK?=
 =?us-ascii?Q?R/GrxSv68TV73yKrwDEKD4MednBNPFFIBN6RtBk3Ge5qtxwH2srTfrA6dGkj?=
 =?us-ascii?Q?6uELdjC9vyPrdoG9h4F9K4rrO/GDZXVnkv7wVVE4gPWL3uIeRuVlCVpo58zq?=
 =?us-ascii?Q?7U7e/2nyEl7nnxqD3jkfuy5TDbXX/ABVa12l/a8AOpe6kw3wHUHsv3DJ8KT7?=
 =?us-ascii?Q?S68rar01vNhngq5hDu89a+joZPenxtou+U/OSmxsvU/o0pUfkBDglewwn0hJ?=
 =?us-ascii?Q?tszA71aQ1vdlX9kCfXPo4/aoM9+R/8dBQkOpVN46JkaIClgf2jN1xls2mB/5?=
 =?us-ascii?Q?eXctSVPc9DZBS1kf0ZC/aoDLmRAESlgTRsGFJ+yIJHzbpNauJvuiFXAXCUiD?=
 =?us-ascii?Q?x+37CQpre0tSyWhWrJqpgMLbV90jU1jwXFbfi4E6KPOclFEUQiJKpZcTUTO0?=
 =?us-ascii?Q?LWF+QpJ2xcdDjp1IAcxwOxEYhPOopUK7ucY57qm90UWPhLGXtmYlm7LGUXDZ?=
 =?us-ascii?Q?VuQB9JRYyA1zcfdDsvzNjaF6839o+dLpidgzw26CATE50eZEwtEfSciSLO2E?=
 =?us-ascii?Q?XnP9NWdqlwdv3mmrsG7tecwTFB0oim8Ox+KnrNLQfxzXgv9kbj01EML5A0cK?=
 =?us-ascii?Q?sdSjadint0h85Q9xI3fGQq5XIUCZ31UudA+zEYUnYNapiqzAZzCK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc7da2b-ce84-4b2c-affc-08de602dd48c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:49.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4UjsMl+iKNVNG1y4DpZzb1/xj8WB3TSvEnqzD3fqCej2vqv7keXYYjxp7727hemyX+mIoKP1AlTP5yFZtI2BfdROWVpHIxQc9ikL5mePYcFWas4Pf6uFWYRr96J7Deq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
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
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.3:email,0.0.0.2:email];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,0.0.0.0:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 66485BDBED
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

 - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
 - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Add new SoC-specific compatible string 'renesas,r9a09g047-du'.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Updated commit message accordingly.

v2->v3:
 - No changes.

 .../bindings/display/renesas,rzg2l-du.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..55e3fcff7030 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g047-du # RZ/G3E
           - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
@@ -53,6 +54,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  renesas,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      DU instance number.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -137,6 +144,53 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-du
+    then:
+      required:
+        - renesas,id
+      if:
+        properties:
+          renesas,id:
+            const: 0
+      then:
+        properties:
+          ports:
+            properties:
+              port@0:
+                description: DSI
+              port@1:
+                description: LVDS 0, Channel 0
+              port@2:
+                description: LVDS 0, Channel 1
+
+            required:
+              - port@0
+              - port@1
+              - port@2
+      else:
+        if:
+          properties:
+            renesas,id:
+              const: 1
+        then:
+          properties:
+            ports:
+              properties:
+                port@0:
+                  description: DSI
+                port@1:
+                  description: LVDS 1, Channel 0
+                port@3:
+                  description: DPAD
+
+              required:
+                - port@0
+                - port@1
+                - port@3
 
 examples:
   # RZ/G2L DU
-- 
2.43.0

