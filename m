Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLYJOrGRgGlA/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F64CC011
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C1110E493;
	Mon,  2 Feb 2026 11:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WbU8EGeQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8549710E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:59:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kigOoP8SmJbknzJ2kbCFc6EJti8rRbxbkDQjZNwNRs+phOUctj+fn31R7O3Tv/wd4qyuAsI6oxHQV+EHVoTNSg8pfKoNd2k/d3GrMSlMRR3YM64/XlTRrjIUbI0mHtnfPB6BdPZH/gpuH5mXFmFONxgGJNwD1scckB1uqSlVGaVqeN5PlMI6ed2kf9iTeLH36w1peMhFjzLL4uHSyS6lHMM5m6Q9a+VJbHsBV0RSRDGauafymHibyV9V6dFL8vCLuHdHeNu5Hhj9OmbUfBFWrQZxwDiUgNHLby2c2Rlv0uHP2EYziK+A77w1jwR/XgXzhHX+JdFJY0yP1Hsg4f/1VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbAUFOd2L1u7+klR2iFTojhliva0EO2mh6iScuvgf+M=;
 b=ACInli90OZuzfjImH3HdKNcU+LWiwwT7j3oquN55Hkw2qxz++rk5vtBmVvIKpBUPIEggHWtUsUxU5zMsM69ka+p1L2ZkJwCXRYTp46eKDH+vHkMGec9FRYPWHowsvuBW3xM2zAOgueH7pG0pdxTY5LZxyldrpv2JNwKIj++EOcWwUpGhWQpaGa7E9Sq3NCqIna9QSXt3tN3oLZkeywe116ZKGyPDa2CzAEqsC0liEWKzvkZe8EQ+rTgshh2CO30vb7h40rweCk/sSd3vGN7pgWXDFR/1NArsFvbZGLVHi5etJ7VTxyzjps8FKV0XycNPcWuJ38lqGcoyhymkVjzIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbAUFOd2L1u7+klR2iFTojhliva0EO2mh6iScuvgf+M=;
 b=WbU8EGeQBwmDZIapaMkRjjHpmMZ40buP/5mFNPpLX/VOpqds+1/fnEATnO2OOycHJxQnenyUCrG0i45JWAhR/5pP7p6OYgDcf8kBJxvqJ8xZwsYxhX9zUKVKtN/m1xjmaO7Pufz8K+JnTD2tnWytHc4qmLEURja4F7pTAmHePwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:59:40 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:59:40 +0000
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
Subject: [PATCH v4 08/20] clk: renesas: r9a09g047: Add support for LCDC{0,
 1} clocks and resets
Date: Mon,  2 Feb 2026 12:57:39 +0100
Message-ID: <d6c0da8ef8758d207500502eb232d20c02fc9fbc.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 55f3563e-b5e7-4a82-178d-08de62528b92
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e/oOspbDMA7d3odkFOcIBqWEfn345mMI6U2khy2G/uLaxSzJFSf6EgvvsYYb?=
 =?us-ascii?Q?MAPHPX1Jkyr5YU2m45zDWm5smozT+uZrBTGSqi8BWivxqwFu3vTi4czCJnp3?=
 =?us-ascii?Q?6EL50i4spRTR8zmAHU66uzBFSeEmx53cEwmpmrnuTOp63zK/tIQHBi7kAGKG?=
 =?us-ascii?Q?iLtY+xdJ1KssgXc4IzNHwvEcs0OccQcG6Aa6gazb0GUyCfj/DHU0GJKC5DOK?=
 =?us-ascii?Q?gR1cjesPNruJE41z65cdjS13tSWnDCk5iN5BV69PXrv2cOj6NoqhE5H8QGW/?=
 =?us-ascii?Q?jtOzrsy+TV8OXqlKrCP+NzBCJgwqr/3E/bSt/ndz+Bu0z+8KczEgIfLZKU/g?=
 =?us-ascii?Q?eXSFCfX/8YsBor5DvqRUhnMPIWxgVQ+/72VjkdjJF9A9iFFr9HHM5lUr0Pn0?=
 =?us-ascii?Q?Ms76ueO4e3PH408bXH0p7tB6I9LEuZkwcEqNHwgAzdyvkALQIUXHrbYjH9R2?=
 =?us-ascii?Q?lLKsJNNGVZINKbkwUi3H1jCA2aKG0lAKQKuW8I0NSR4iXe7t9sjGxvw1PuxB?=
 =?us-ascii?Q?xjYZV3mKVMzi+Nv+7YBWrlDG01grKwT0NYZBYS6jb5AZ1YW4qkSym+7UZy3o?=
 =?us-ascii?Q?LROjuquMTp8veRO4SPwzTt0xDe/tU7GsBcUBdmiVkes9trDPbnE6aVsuAzY5?=
 =?us-ascii?Q?oF7YQdIgsiLEgst7c9J3Uy03NF17kC+QWQOn6ZL2Q8IilLLPr3ap4EFEJ+w/?=
 =?us-ascii?Q?lZbkMu6JZ2aWSHeelPrNMAXEj3RTY2ttrd6s9Z7oyR8kV5epnjoviAyI28Z5?=
 =?us-ascii?Q?ldhTPKWe46QAUnLnIeQ0mMhdP4CuWHoTHhNFyKnlDJAEcqE3Ry3EyEqx/39E?=
 =?us-ascii?Q?xZwoLBQ+1OEmypsRpc7UtsXgR+nW99pXNbGiNMr0GnO2uyrEz+6omJpIjFI1?=
 =?us-ascii?Q?afDiUFlZFaFA9hpRoHz8nSV8QyNVAcPKwfmmNfKpDlglJT+Gi5h8BoJ726Fu?=
 =?us-ascii?Q?Jsw/NKqlxpo5egJoKPUGnrn8V1ozYwMlhzvE1Yyel32rzrcrHayM5rMuC8G5?=
 =?us-ascii?Q?q7AIPeBiCxQGuEAmbT13yhV43dMTWLHTp3KgaiCk7pp2J6x4ER1oC7ztgnol?=
 =?us-ascii?Q?F7wRz9hRpcixwPZe8XVArzta8DFJfCBxl9GqNl7vL09QZ9zSDstn/KVic/+W?=
 =?us-ascii?Q?ItmAfiad7U6EvGF/HRyoFNpr3eq1QTFeY+48C/BjNYWBIxmddjbqiUDReuHU?=
 =?us-ascii?Q?dgVXFobiAD0fqhteigLF/wzZNw/T/dAGnYcxNk6/XrTiqwmHrjSHirHg3N7d?=
 =?us-ascii?Q?AUBvquU4kvkrdecvCbnNImYMOX18G4KJVhArJ1zgvN+DZS0P0le7V+Kq002T?=
 =?us-ascii?Q?0Ve/aWndRy8a71Y2VqXgsaXAsjASThao9NfzV3FQ8kXgXns4yxfvi06KGLuk?=
 =?us-ascii?Q?c8UNiwLAxFod5ZbkwNCOB3r/sBYGRYi2r8UEQ6XLL5NjEQjJFjKBugNsX8aP?=
 =?us-ascii?Q?eTEQ7GDbR+wBqXM7inrMQBtITje4JM3HZTw1t8Hp+ttob8bsxHVHQDDCKXfn?=
 =?us-ascii?Q?Et+OKyJ8CfTykQmMVXC0KWDQrlDduXBIhmVRlDWRMCmDkpQN4LvjZz/+E6Lg?=
 =?us-ascii?Q?/5ec6oNeUjKmvhTjqli6uv+q2oJDCHuok9bFlGWuxDRQDNqmmf7EiJ8fDeuc?=
 =?us-ascii?Q?p+d3vJdRnaojI+SxWUNI6eg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PII93U1Mt3bV6O1v4+FoxX4CkWAAxDl1eUfz+XgTrLjv8fFOJdwT/qXs0Asm?=
 =?us-ascii?Q?B3iWLXViOGUyX7J3liP7YMN02dq14sfEU4QaY48KLOlS7ZMs01qHMgTiqAM9?=
 =?us-ascii?Q?WgiyenHNKoreuGXPTcyKMhDVuJzTqbS2dB3PzblT8LheqHyPvByco/68PX19?=
 =?us-ascii?Q?OyFfPPpZUYIhJhJRGjTZl803eLVqlBopHCakGKimCRtFHo4/6SLD6p6EjAlY?=
 =?us-ascii?Q?73E6BpQ9LDVxncvieWBHhGTFSXG7lhJQUedC7d0zZ0xoIJRLnqIM2UPuUCFt?=
 =?us-ascii?Q?v76RDPSDm0BS0ssYa5KKg1DeGthj7EeY+9cXppHvA20eFoLqAPdgNPa7MDo7?=
 =?us-ascii?Q?MZlhHFsyozWr169RLwQydLqQortRknWVBC7/IArjwZRN8y3tWl221R73QJNT?=
 =?us-ascii?Q?gdALZ1mGXdWHpQMSnB4VLjUrsACGB0mBQi+5xX0AxEeg32M52JCKCh5QzCL2?=
 =?us-ascii?Q?QrDStlWbcRn0QTu173yFJgEWjf03P2gkEtftYx/0izlnhupzxJztNU+PqSW7?=
 =?us-ascii?Q?Oj6lWHd02U3y2bNpOPqHMNlJ0CQseUE9cGy4beOLMTfwYjVBcaiHfZ8u9IWY?=
 =?us-ascii?Q?I3akGB/9h2uOe79KpSsDLJ69OUEzwHmcNJUhY/fPo8GAmmoQmVC2IdEARFxW?=
 =?us-ascii?Q?F0lhRNVd4Qq8G8UMxlnD53S0KbXXVh73giOLBXLFNlMxXk7xPyIBswlcD7Pf?=
 =?us-ascii?Q?0d2SNxbMiUoo1F1EKMdVU/F0WAr7oYUbZWEP9fjEsIRhfbZz93qJGA27JK/F?=
 =?us-ascii?Q?1+xataZy+ryG03vxi03RFv8ZC5A3I0iYOtI8mIdQtYryPrEHxJ1MyiWQ9WJj?=
 =?us-ascii?Q?l6s51gwTfITbKsVQmG7+pJCosRNbj6PVcutb+vwI4m5BZjHTO46IQeyyjAqT?=
 =?us-ascii?Q?ew0LVpnrQSA2EeGZG8fhZvIh0JvyoXiZfieMh+Ms+1iLNfArD0bJYJo5ko7u?=
 =?us-ascii?Q?sJ4HW+5G6FvexkTY8lXeCc5oo2/9b2MKYH2dJGyOc9JUGA9E6gsE00dl7GcB?=
 =?us-ascii?Q?hnmM9ipqk5xlPTyHIPpoPj/UsI1eAE5iMABGqpRIQ7zhyem2KhX4u+98/6G/?=
 =?us-ascii?Q?Y0XxWesDFf6dGkG/ssXL0gHqqAAUzw24KhFa1gj6CltnE5zfxyP0s4fTZdrr?=
 =?us-ascii?Q?0WOYp770iZiwT+YOsD+OQPet9f/npUmspHCk/IQGsUV+7lSeuLC3DYJgNaYn?=
 =?us-ascii?Q?1eSzDKouF/UhUhF/6WWLuLxVC/VhFFm4BsEoBWfQLtNQVt5+OgGBwO3Dpkok?=
 =?us-ascii?Q?bmp5eylTpAx7VQPzedXkmslV1fD1iRO8pDUGIR9ScTJKwEbqABa6krZXPn4K?=
 =?us-ascii?Q?YLs9j575pt63xWZKxVMNU4LD52ybmUmjhRtwc+KcgSgyEcht44ZrXBWmK8qV?=
 =?us-ascii?Q?ccoIPL/gunavtqFpqtmJ/neVvS5SzH0StjOhC+vYU2ke0CnetG16o3nx2zpZ?=
 =?us-ascii?Q?RLNQcSEHV46wfMViALR0OC3zKRj9+L86IybW5U3kPuXtHY61Js2K3Avg7zf5?=
 =?us-ascii?Q?fK2iln8YObRiHqZVY6I2azCQVIdbs1CLriBOsWfqMf78L5TUOl6lfeNES6zR?=
 =?us-ascii?Q?ewpNgnlfWaEzbTveu3e2/Mc9VAW1oXBv6eKgdy3o4iBoEZjSReTwOMa+TfE+?=
 =?us-ascii?Q?hmt16lXiZ+qTdiFOH1wekWgsRRvO7Kl1K3ApX0zyeaOtWAiXlWlVL4mBr2rm?=
 =?us-ascii?Q?tm8pkD9blSptQEgmESJSoX4Yq7X24jhy8f2LJrlBqqTn4BDLSdzDO6hEghjI?=
 =?us-ascii?Q?elxIRvOKA4gBnhqZ95o9Vf/U0qPv0c/VcQrRn+xikEltIfJ4By1V?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f3563e-b5e7-4a82-178d-08de62528b92
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:59:40.4849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBS0NrVH1PcBC+4/ou17+I97nMXP8wi8kWZeU9mLwIltD8jwDQIUPJ2q0vAcyEmwdrWDCbs4orcxnxxZfPZeHhp1jlCtGyl34KiPDAbjHYb6TttxKyy5StZkyGEsXlyc
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 68F64CC011
X-Rspamd-Action: no action

Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 596349fe6132..06ed9baf710d 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -496,6 +496,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_SMUX2_DSI0_CLK, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -506,6 +512,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(2, BIT(15))),
 	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lcdc_1_clk_a",			CLK_PLLDTY_ACPU_DIV2, 26, 8, 10, 30,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_p",			CLK_PLLDTY_DIV16, 26, 9, 10, 31,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_d",			CLK_SMUX2_DSI1_CLK, 26, 10, 11, 0,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -576,10 +588,12 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
 	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
 	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
+	DEF_RST(17, 14, 8, 15),		/* LCDC_1_RESET_N */
 };
 
 const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
-- 
2.43.0

