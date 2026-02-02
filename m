Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBSwJ3WRgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:58:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F22CCBF77
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:58:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038110E468;
	Mon,  2 Feb 2026 11:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="eB3l9G1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB8A10E468
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncGEimn3S10VGuh3WsGfTCsd9xAoOTWCvTx07JOOufuHEMr6tpdaAS0UaTYm3ezN+e5Up0EM/ZDlTgc3GO3ijD5JHEybIyY+Mwuwop3jIXfBxe2MDoblcRSvQoWppZmk6sDSe2VHzbI/amF97yzqn98eYDn6ouOKkTqexIV2tYZCTYNJwMsbGcXQh6wGQZK01Cem2XHguxHaDi6uAcJj9mDfoE9FkiuJnAPSCOZCOJTxBmpXPU8qW3J5KfOS1QAGZ/Pr3TOjxE55D8Krn7FsujKFZn9ntLZxo63mH5T3hyd+qCfXLvoMiKXUyJz3dqwxjtQ88o4ykMwSgfB9oegXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2y462Uj81qyR7pLSBZ0CxEcxIQo5zLxOJCI3LF6JfI=;
 b=zLiLuySMR0orabkBlAm9rrOIGNUL6Y+J3flQUTI8o/K9ll0RfnOPrgof+tCRDat+rohGqW+jYrd3nsRNy2/aO4lAa8mILLQe27jrASJV9mLnstL7n03ZhjTPFRiFSJq1HMEqVsnR1LzmJkQKSm2zwpYQw5+Pt1xY4IUFV460zgf8q48OzlTZNYyAifqRdl5fWaZgLgpuQM+jHwprmlZR+fFsZKiQGZ+DxPBwSOAgYZ97qK0MKeZyckg54Tl5vhBUTlXwJ8aZaEjUw/jhxeksziludl6kupT5cmRoBjJtLRnekTt3o8Md/0YSErRIPIszUp7DHYLwA96Dyu5UOG62/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2y462Uj81qyR7pLSBZ0CxEcxIQo5zLxOJCI3LF6JfI=;
 b=eB3l9G1hP6JrNSUW07gs7RAoYS0xjWdU37M0k42E+oLxKh+tEcMZz/hWDY/zp69mqM8x/2zsA7NyTzrhr7ZDVMvcqs5zmeiVi2pVytY7SB/z+0sHZRNqB8Migcpmx02Tjl47aIlMvf4vikPVfp8N7JltpLRmYIogv76BIn3J6cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:58:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:58:35 +0000
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
Subject: [PATCH v4 00/20] Add support for DU and DSI on the Renesas RZ/G3E SoC
Date: Mon,  2 Feb 2026 12:57:31 +0100
Message-ID: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 622f0689-c017-4be9-2e30-08de625264d9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wuPEIxTnMvlaxMuYhSwizb6vXnGP/w6n8GQqD9YuIhlUC3eY4b9w1sVoSfIf?=
 =?us-ascii?Q?cER0XquhPoPeNbZ3xP+RsPE0Vw6adJwdanqlOe3+bmLtjDt5Fdm1CKIjPcS9?=
 =?us-ascii?Q?ZZs3irWGA56dkOzWSMijX4QKoELlVXuksM2LDN/3+DeUGS0PdSWB/aGxkpaB?=
 =?us-ascii?Q?TEEKrWgWB5IjUsdZFQdqW3iJd9XfKrtwHGcyD2+r7YOY/cYbaxez83o/fFxk?=
 =?us-ascii?Q?C5IpH71yNKRLle7BJc974R48ElOYRtaXzRlnm5ldnMy5PELIyoMwMGyriXcE?=
 =?us-ascii?Q?4mrVWQxp6hJKiHhEppLDxRlMOUYrQstfIXabzzAO2gqgwSVwbdepngglVoNh?=
 =?us-ascii?Q?JKe82tsNUlVhIPmH2MjJBOh2p71+lLzOPpOyclg1KRxUp7TVAbsJoOGNfuAG?=
 =?us-ascii?Q?8+BDN5TRuELcd4lxoJqvWqeq1M3duwZMXYf45ZxMZ8XW+742s1je5Vi/OIT2?=
 =?us-ascii?Q?uoF7q1AMO0sUbLhEELWaGeqOY4VeB0ZnY+rykEdg+VPyNXQtKjg8z/5DzSwi?=
 =?us-ascii?Q?ZBZbxRJGQPmN7ZCRYd4upwuhiELYQUC9QZpgfZAYFPiP6R51KlxqzIjCeaWG?=
 =?us-ascii?Q?3nSTnjc0sI+GC3+wjpoVvVk1wtS+pTnm96PWpIA/ni6GhBzz+SBWtoPveKh8?=
 =?us-ascii?Q?4K+qcVrBssbTJyEoCop/+pUByY2Ek2xr5vw+84Ik9mvn0dzmTc0jhzPnk96W?=
 =?us-ascii?Q?kyXfMfoA2mvPnf8nG9eoSpYBwUtJdDi2GjF8+jPtBTFEKNVOMYwaqV2T/+Nx?=
 =?us-ascii?Q?aPqP0Lrfm4Pl384QgMmwtbPQibcIMURVTdN+0d6NldR4fV9ZGkFrV98PoQRS?=
 =?us-ascii?Q?2A1RpTFljdlIAEEYxd+eGISRLnLXbhVw2mWVeEz+/MCgzYGK5nofc9QJaKF4?=
 =?us-ascii?Q?e3CEJMMNBUP81u98/8YOW4okKNUAbqgNSsBA/pAW1UgctSZJgZl+DMJH+jsX?=
 =?us-ascii?Q?UVeR+FWwDMqN2rUaRi2G7UQFZ2nT1mvQ0dW3FjcVe4dfbtfnCJN++muOUWkO?=
 =?us-ascii?Q?kXMCDZdtpWsN0zEUfFqABLR69T6jfWvCGzXgg/QwHu4WX6cE4qhpfk2+6xdH?=
 =?us-ascii?Q?cGn6ydxroqSTQM6Z7DZMEetYieK1WPPG3sk/GZ0hG5FKnYZ5rqvR4Eb49EtI?=
 =?us-ascii?Q?Oi2SD3uf2rmTHTSqGRPwuLVJdL7XWqyFmoPrHr+o/IGx+FCaw5uoYLPi6ws1?=
 =?us-ascii?Q?JDljnU9SHQopUIP0+t5IbQmf0g1YuMpEYWit2cYSJA5QtueKzgCNRKMEkk3D?=
 =?us-ascii?Q?vtJAulR4QbhIKv9R0H68x2hnkFgMbFtiPYG1i3PyXUPeIwaiy4jlkVG92Fy/?=
 =?us-ascii?Q?V7ff3WX9BkVWCbhfySGOGCUvEoQdq3D/TFl71xm/91favfXuszOtQWYf+TJc?=
 =?us-ascii?Q?LF8gIruunzBG2AY4KKQ0IVxa/f9QXU/xTIxqZAAKI+isw/x/1fG2SOtBYZRH?=
 =?us-ascii?Q?/BQifh4GJrV8s4jYlHNBU3RANgYPTomkiz2WoYsw3Z6npViv0wUOyMr6Nwuc?=
 =?us-ascii?Q?RWU0DINPzYsrkDkQ305nLG0cqHK8q8ars683qCcuSgpb5/APgLvfbVGqUfD0?=
 =?us-ascii?Q?cyVfr/SrVDr0esuS795/93FvZS1vowqka5aUin+Hj0vwrKlxXRyQ4gHlQ7XZ?=
 =?us-ascii?Q?PXdA927wGBfym3itP9Wpm48=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6V/cRowmT2F5e/O2oLf/yh3SLvRgMemn/N4EzVSBh84YxSxM3Ov2My/xuuMx?=
 =?us-ascii?Q?emMgLC/Eso7t0J5Id5W2S7hGn2FVj7y4tRFm6jnMSfMHONbz5n6XD6krcrGj?=
 =?us-ascii?Q?wka1qo/WCYp2FaCrHXmWbTVxgX3p58i+zJ+EBEzbRLGJFQaCdO4td7yQq6ft?=
 =?us-ascii?Q?A8UmtXQ++aOZLBx1dPx/lhs/+AeHcWsiMIveJDkNS83q5pc14xBVezukfiAv?=
 =?us-ascii?Q?DqHInwBQlCDbTouReqLBhtOmFK14yAw9Vsz17WbzhSH4jnpSbE3WC1q5Eq9R?=
 =?us-ascii?Q?2jtgVBhxvnI4QKDh/Mbc/7N28jk9fKhKxwL8KkabvdlU8SrBu8a1/r8d+Mk3?=
 =?us-ascii?Q?XvOKcv3mjNaEz6/hsJG+ZaOYuE+mqaUTcqv9xACbeMCQKxk+S1qPSsbjBLup?=
 =?us-ascii?Q?Mp6zZkOSUya07oHGwzqJjx6aIqAx02xWI0cOq1f1ZZYLQ/o3sAJ1woh6l+B/?=
 =?us-ascii?Q?FfktLnGabMMug+4//8mU3mlUnr8e+vL85ehUDnEN2oOtGxuwdPL1ljf2p394?=
 =?us-ascii?Q?9NA2LUTrK2hFRaJ26SkSf88SlwM9S6wBaIbj8seOYUXjhyc5RkiHlRAogbLb?=
 =?us-ascii?Q?UR+xZVtYsIKytZa6DbiItfaTp1r6nnbFolzGIx05xtA+LhNTHGjOX1ZNiM1p?=
 =?us-ascii?Q?yfW6IzeKCJff55/4y6R4dz3rkdb5w8LrA6wBuaqXisuTxJPQb01SoGpmy6YO?=
 =?us-ascii?Q?SpOdsRIYbGydedl+PE/VxUlV6zM499sFhSu6EaNE5xKqMeAfzCO3YG5fGLF+?=
 =?us-ascii?Q?HNTlC+LZ9dMArVkd+P/T2Lwn677TAm/jGNernuO/Lzso8MOf9uArlgCoEn1b?=
 =?us-ascii?Q?g2oe0ENuSzxlDNUx3w4KmKJs2dHmP4ZzKQO2iJ48izq3GYbs5/z19YGchAbv?=
 =?us-ascii?Q?/9Oawdyix7C34GBTLnU2eglvkEHge7vv2Sq5HTlZhWndzRQ+uIkNGdIkw7b2?=
 =?us-ascii?Q?MKiVHrQlLoIt6QwioQZDIK7oUQy/9GonP7eXYkDnRIWe7XvznwqmiRScPCDB?=
 =?us-ascii?Q?5CXhKt0F/7eaa60g8+OPvMGW1mRt122wn2inrh0L/ROgdnMRFk8jK/y19Icw?=
 =?us-ascii?Q?Et2bK7h/unqhT0nMZW9YW6K60UEWgw2b4PzH2yGeGk/ordMM8ixFWv09uUhl?=
 =?us-ascii?Q?Rr6y1uTEhsLsn7in7KS3ddBiCT9qrIhlPGxaxOSV47oao7i4p9qrzUIn1fQc?=
 =?us-ascii?Q?f3Gt2fFTrepLDb5zxHgxdiZ2a70FMAJ14cQV1IAGuWCZWezqaTBu7BSjW5dQ?=
 =?us-ascii?Q?X+LgOWOdvI+EdJvUTFk5oLG3FDhaEJMdq6Ih93kybwIdfiEC6a0MAkk7Rxur?=
 =?us-ascii?Q?Xm7cF4HlfkHeA4wzphg/cjL8K9i0fDBxqnnKHffd5ucyZ7feMJVgVIGIlRXq?=
 =?us-ascii?Q?OrwVvMr/HrqjLlaPigBzu5mlVJnacwiEd1sLy/LIyr3XWaylITPpwDs53Or5?=
 =?us-ascii?Q?DjZppHqY6um0XvqHVnQAJZY2TiG0OKobmQLGeQ3eLPZ7lG8IAEZkQYP/aH3r?=
 =?us-ascii?Q?/VDzfBvC3Wmzo0628BqBUQKWohKpN76klcriDF6g+lqLH1W7Sr9q44kmMFqu?=
 =?us-ascii?Q?TNlhvkjNAb9FWQYkMfaMKKNOvNbCWSi7egEfJcfa7bhaaCaX+LiwtPK/m+i1?=
 =?us-ascii?Q?FcaPUUEdAvmM/lY/ew+8WHe+CU4MrVXQdNVoB+Zocpm5LaM5ik3QAWb2orMb?=
 =?us-ascii?Q?6qeDJOzV7+QsrBiEq0ZDxmVz8/1xDiCF1uaNjj7YDIaL/rmTye9QxW3yriDj?=
 =?us-ascii?Q?FNVYL9+OnlGMRDO4KVCSlufTALWSiq2ezX0qaYsGUDvOXGiQuE37?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 622f0689-c017-4be9-2e30-08de625264d9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:58:35.6112 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VoTWEGa74ibyG8oez3sdevQSoAkuqUiMhApvA8DmZ8+hM8djNfX2iI00z0btUFWiK4bU5R0RT2CglFwj4BG/76zW6I46IEKjBIW3F1JmtX8Kj3mqBh4yOQoCCEMLPz13
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9F22CCBF77
X-Rspamd-Action: no action

Dear All,

This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
interface found on the Renesas RZ/G3E SoC.

RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
and Display Unit (DU).

LCDC0 is connected to LVDS (single or dual channel) and DSI.
LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks & Regards,
Tommaso

v1->v2:
 - Rebased on top of next-20260129.
 - PATCH 1: Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock
   operations to allow the DRM driver to query and configure the
   appropriate clock path based on the required output duty cycle.
   Updated commit message accordingly.
 - PATCH 2-5: Collected tags.
 - PATCH 6: Moved clk_ids to match enum order.
 - PATCH 7: Collected GUytterhoeven tag. Fixed "dsi_0_vclk2" position
   to match order.
 - PATCH 8: Collected GUytterhoeven tag.
 - PATCH 9: Use single compatible string instead of multiple compatible
   strings for the two DU instances, leveraging a 'renesas,id' property
   to differentiate between DU0 and DU1. Updated commit message.
 - PATCH 10: Removed oneOf from clocks property, which is not sufficient
   to differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L. Use the already
   existing vclk instead of vclk1 for RZ/G3E DSI bindings. Updated allOf.
 - PATCH 14: Instead of using clk-provider API to select the right parent
   clock, just set the correct duty cycle based on the output. Updated
   commit message accordingly.
 - PATCH 15-16: Collected tags.
 - PATCH 17: Squashed fcpvd0 and fcpvd1 patches into a single patch.
   Collected tags.
 - PATCH 18: Squashed vspd0 and vspd1 patches into a single patch.
   Collected tags.
 - PATCH 19: Reworked DU nodes to use single compatible. Use vclk instead
   of vclk1 for DSI Node and set to the right position.
 - PATCH 20: Fixed: dsi, du and adv7535 are part of the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

v2->v3:
 - PATCH 1: Added missing defines for duty num/den.

v3->v4:
 - Rebased on top of next-20260130
 - PATCH 1: Fixed build error: https://lore.kernel.org/oe-kbuild-all/202601311423.gWtJuxiU-lkp@intel.com/

Tommaso Merciai (20):
  clk: renesas: rzv2h: Add PLLDSI clk mux support
  clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
  clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
  clk: renesas: r9a09g047: Add support for DSI clocks and resets
  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
  drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
  drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
  drm: renesas: rz-du: Add RZ/G3E support
  media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
  media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 ++++++++++----
 .../bindings/display/renesas,rzg2l-du.yaml    |  54 +++++
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 175 +++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 +++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  84 ++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 184 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  48 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  26 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  11 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 105 +++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
 include/linux/clk/renesas.h                   |  20 ++
 15 files changed, 939 insertions(+), 44 deletions(-)

-- 
2.43.0

