Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL7JMRiSgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:01:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C4CC0A9
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE1110E4A6;
	Mon,  2 Feb 2026 12:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NHXkyen0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011001.outbound.protection.outlook.com [40.107.74.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D92B10E4A6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:01:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QmA46105w+3dCFUeV9IjNqGOgFoumth0N5pxmrvMuVpHFSMNlgzPaDZwqjBOv2ch72cS9XnHBmt6Br7M/hbIGnan+1vV6s0zOjD0wbG5Z8I6X9LQi+jEhxRprRK7yFzo1FUTUc6uTYRJmfTxgKzda6t0oITzKa+/C6KT1PzpxDl0ooRLuid+EVpeauYsD02mxTt6k8Bpbe7dkenJ9jCDZ7MaijY8+lQuXsCtrsYxyoKy02H/drMd3NvnKNyKPKY5f5mVDxFgPzAhZTSKcLNeqT+k9Qr52wy6dRnSWSX4rhNc/5b5Hywz/2ZAOFmO1xf8/DJBnpldh658cHu8+hkqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWOFHiP+NMtIgVsAL862cVXLQKnbC9xQ/haJxziiTDw=;
 b=Qv5mGKsJNWunWOZZdEFFkS12r8+8RDE4J2tL6SFqZ+2z8+1lOvhBWNMnILBfqWGqihjhY394J1Yb3zAcEo0lzc4BfzkHLALQ2E6Y5xDGMMijr6Cqdno0aBNo1hTQzsDf09+qOZPaYsMD0BbjbXREZzf9zhZshItnJBAgj11+n29+fQoGIdXG3EOn23Ub9ylTh4gBRVzle1RK7xVOgnp+RlGMmZkiP5OqmzbUUwqQbcgEcVEhn1/bwbX0sycRyaqEBQM/C2qBOXI3oW+uAbMp01HTLXYkBP0L7A5mbuTHane0jnmWynhgA1gt6v5xi46TFj9R2W43HG0ErW001h0YVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWOFHiP+NMtIgVsAL862cVXLQKnbC9xQ/haJxziiTDw=;
 b=NHXkyen00m3rUZka/1BZk8985BWAW5YMqmWSuN3XDWqdRf13XxSx0Dp05v3wMJZzxG9Xt0VG4whp1xBtHt9/dXw9ooZGIs1AYBZKmixss8YZAiwNn/KzuhtYZO0/vKvmiBMImp+m0ofr07jAPF3TtD211X2TbSiT5WjidN0s+C8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8632.jpnprd01.prod.outlook.com (2603:1096:604:16c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:01:18 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:01:18 +0000
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
Subject: [PATCH v4 20/20] arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1
 and DSI support
Date: Mon,  2 Feb 2026 12:57:51 +0100
Message-ID: <c675387c866ae08304fd4db3706ff6ebde19164e.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ae4612-9b89-4344-aeec-08de6252c5b6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YkYHqepo7nrm6ydJWi1CQ3/rtW2HtKvu+rUyxgvPaSgYZpSwZxeJR2ZT6H/Y?=
 =?us-ascii?Q?3zYOvANSFLLsDxsBZAV1ANRomICGZVVTl9U33TetrNCMJrg7QQjMwGT6REzk?=
 =?us-ascii?Q?ZVBhmqW0yEtUlsaaDsFAsMX9WKZhOppqjeC97hIB8Fv6OVQZVIiggdVBjsbP?=
 =?us-ascii?Q?CsfRmMG1mPvc9vkxsMp8IWZ65EP241igFHYlf9ugIMP/NsKCKM26y5OhZcPr?=
 =?us-ascii?Q?MRgqr/CBFqbTD2tJRInFiryNWYSGdOAXzVe4IYw2BwwufWvJSuzNtFu9YEp+?=
 =?us-ascii?Q?6Fnoux2TJpIffZb/R9rMvfWJliP3fcufsw21gaalZZYSPedRjhgAXzBghaVm?=
 =?us-ascii?Q?WV/ZDP4bd4zO+4KL3UJa6qDlwCaHG2XEfwnoW8zBk58spndU/OkVkMNhmFUE?=
 =?us-ascii?Q?meq4uo1mzIO96QqCw95l1nfK8ovmZofUJW9PcOSX8f72W75OoYPwbpOPxCQO?=
 =?us-ascii?Q?0QVPXmncEk/YwmFmP+8Wyi6vQKcYXowEe6c/PWAo/Ctqgh0PH2PmbvgazjKa?=
 =?us-ascii?Q?3bvqYQkzi3mu5GWbFNaiZ3DK35Lb5ji7WP33PNNEbqFmfa8Yge/KaZgVmPOE?=
 =?us-ascii?Q?aNg8DTT3AvRPnaGTNoB2GUtkLPZZtSTw8x3HZpR1QVc1UhhL1E2fJ+9bqYl0?=
 =?us-ascii?Q?hbPN76dQV3BUfZalYwwQo+WjKdZLjpz7qmk3JnlLf3pgJPHRwgo3xE1O/Nsl?=
 =?us-ascii?Q?NphSLYst8q7BKa5mc0k+g/qNWugdhpOMbpMPFRrY1rJ5XS7HJ3VCr6DtoMhP?=
 =?us-ascii?Q?Fb3Ml+5Ti6X2595lOCqPowNkpC6uH5NsjsAmsxcLzmoxwfyEvlLoEfh6t4PW?=
 =?us-ascii?Q?NKAQHeR+UVoEwTc6/a9Ws2wnEpB3mZg0N6OLVHeUwkgWdqyBQxo9EUBaip9x?=
 =?us-ascii?Q?YXuN8pct6ZRReyxOS4y/d3CiwGTPQ+dFJadw1oBgDDsBsHJMHwIRYt8BuKdG?=
 =?us-ascii?Q?Q+rDatJuPqxJkKqBQFLLWzX5tf+WSGQCg1txU1g62lZyszgzDDXhxmORfydg?=
 =?us-ascii?Q?uhogMJehkgvcG1WIYSvRcvfyU6Fnspo8SsEm8DDwKBdWtS313o6t0/UL3cPu?=
 =?us-ascii?Q?cXfgMKkTVMQqXJfykyEl0NjaIcZ47kawMqM4Zzll3i27Spe8EsnMnzQ81sbJ?=
 =?us-ascii?Q?WBbz4aw2oPUzerI6qU9pFDku7nMiNCYkxuzd95zC3VnEthrBaSqTdpVKquus?=
 =?us-ascii?Q?+DSr2bsLDPP/oWjOaWAYBT5ym/lUpa5WkDeKGre7aTWypgkAQNBoilRkMdu2?=
 =?us-ascii?Q?PAGpd/ENpryhUif8TTu0SBfUYj2PSy1G0NZupcoX+yCJV5D/nYiwS7aWa8FK?=
 =?us-ascii?Q?gVlPr0T/HZTgKi8Flulu6Dq80qrtUcw6NxAispK8c+LVYwcInm+dfX9aZUD7?=
 =?us-ascii?Q?Nkl/glqFrjEHJftKwVTOMcZCXjHPC1eZk036x2vryZOaRk2ZZGYLc0KXqiBB?=
 =?us-ascii?Q?9WXP7HYQlFsBrKhag45h1VQ2UvG0Qn8A6vFkdYoN/CIE5uexFrDtnyrwhlnX?=
 =?us-ascii?Q?tkw1z3hoSyvM0u9qJfFcyLX6BNH2FVYxl9tcc0ucpXZipwXetJZ/Ig51sEGy?=
 =?us-ascii?Q?Tp1p0YzZd/P6oZfyS8clN6pD2O5pBr97swzj4A/89L6tx2tVNKPCm9Lhlzdx?=
 =?us-ascii?Q?QiDhh60QQgET0fF2S1OQNY4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/m3PaECEcNTcZ9/LXkGgB5x7VjNSAP8X0dsu+umf7aDgBSldPBZNOyuuYRE5?=
 =?us-ascii?Q?zJHuQsdt/H9Xx5WucXqbArVi4JH/oRBeOk5vMBvT/8NXaZYDhzvQjGJbg1ma?=
 =?us-ascii?Q?ZQcdcBhsk3xtWSPcNVh1S28dmLtqwW/8fIE8C5T0rh5e13sSSFPkVGjTtBUv?=
 =?us-ascii?Q?UVuyunnumCMEOJn+TdTREYXXi7PZIRgezvwZW1HnoHt5AUgfFdcJfWEPsGa9?=
 =?us-ascii?Q?Xet7xiOJZQn05Mtc1+vGam/BIJsL0JmKjTX/BSggY6jwBbkd1VPDnXjWpFih?=
 =?us-ascii?Q?MDOtSfPwkAijdTxIQe9oSuhzwc199ZNYGDYRhf/nym4VlZFxKn1j3CNcv20R?=
 =?us-ascii?Q?+RZxFFO9Lb1ASQm9x6okdTNCHLwuTps5BHadL8meXQsLLTfiuwPjP57USY80?=
 =?us-ascii?Q?ZFLYXyLHq6BbgUZkRz2TPZr69ZY3CXlX7/HLmF8BO357xvWtzqYyn27d+ddn?=
 =?us-ascii?Q?8/XbbpCEtwDF8ZVr4H7S42rpt4WLUsswi8faCx9rg/+lzRuza2UJTBdaogWA?=
 =?us-ascii?Q?okeXsNUbsi5N08Ckg6l8yAoXDQzbw2DYCNO5i1BGwUWXoGzPA9SfwEXdYdMk?=
 =?us-ascii?Q?DrZ6XFUAme35qtwWF/8VO0SAl/aQw9Y39N1Rfj0T6y594EKe4AWNOkpnAAPj?=
 =?us-ascii?Q?CAhRzHSPjRnvGxRTSefzO6Zw9wMe5Jguhzayk7eUqdB1JtdO2H/M0Sr+hUIB?=
 =?us-ascii?Q?o4MeRRBCDrc+vmHXOAr0HFfQI9f/3KtvhBjy5zRaP4853Czog7yT73gAKUnK?=
 =?us-ascii?Q?7NAiLlDtJ1bD/uld0deKFyYMqiuvUIpc5jFlN8wcpqdwlBBBbaIoOgg+oKwS?=
 =?us-ascii?Q?zdhozyfvu2cLE0mtyiWrdaMgKaUcvk9shgYnk/LZgsvIJK9u/4ktHwL7Fv8W?=
 =?us-ascii?Q?H3Rtd39Z8AdG8jzAkpBvKCixi/FE0wgtHYj7cFoMWUBMJavBYjItmvcuLg8F?=
 =?us-ascii?Q?EKpZqoivoaXdcFvP7fI4jT4KxHDBLqH2nl0KpMZT55beSt/I+6uBrq0VN2O0?=
 =?us-ascii?Q?1ZCd65asJ0IcAezDkW30BrKwUH+Phs8ZiBPIyAKapT98cYm576t/lPB6wm/a?=
 =?us-ascii?Q?OexszXoNmwikGpZOltzFNNJy6ip2GUjtjoHu/2TBwQrlPY3h10bH/tGg0Paz?=
 =?us-ascii?Q?ZGNnQgv3lLuehHzVt2pI98cUTDUbqob4Ng70/N4TfIBlF9O6fwRB24oOfQzX?=
 =?us-ascii?Q?gn338gfn/1a7SiQXHUIOJ06DwTV7nQS74QyzYVmIFNOuV/RDke7GMm0vciE5?=
 =?us-ascii?Q?LGEr4MCnth6XVofns/OtmCftWua9EUCfSc8UhAUkvAha7mboIbU3tuNc5bdQ?=
 =?us-ascii?Q?tf603gGhfVeyx9aa+BNRmpCd8DX1O4MHiNr/kzDiqd3iVcfX9iROoIj5JCGW?=
 =?us-ascii?Q?vzpipFwOln1YGHnE0GOqPKutCrpr8YFUAm/RRhKMxEFiO8N+X5LWIQC5zSpv?=
 =?us-ascii?Q?znzB2M/GHgr+2ie75hAdJCRrUNtn2embh24A4leSsszPHQkheG4pPnX7Hl2T?=
 =?us-ascii?Q?Ys5xKcfKNOU+agVNRDFq0JROZX/TIuKxyGeI//jZbDntPGhVjLJB5mNUpbej?=
 =?us-ascii?Q?Lq0AVjaFscnkuvYieXYod73kYaqo6pSM5Vx6gcjltzpoRxmJpkyh4A6uCRXc?=
 =?us-ascii?Q?w1x+6qZ6eSQm9i6U9dW+K2cLSH98a7yZWFDRaPpkNGscFbb7AY9Db4Kg8NcI?=
 =?us-ascii?Q?gZzKw/jXrThLtvwzWFR8nimjoiSR8PrgnBdk3JhIMQrih491QaIQJ5Kc/5Fe?=
 =?us-ascii?Q?t+UXFqoN68VCKEc63L1hkL/A1ISE/QTA31Zu7Ug3H+OtHoDKntv2?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ae4612-9b89-4344-aeec-08de6252c5b6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:01:18.0609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPqFHrKGK0qyYYPU+IEN8XDPSZaOkB2d+Zf/vA2AYbrCbHT4PCZ6WX4sfvUKQioqz0vi2Sgt4MQ4DHkdtJm5iFO2oQ1HOL35MauXt0LIWrGVmJ7tVmV08oJMKdi9qgdf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8632
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RSPAMD_URIBL_FAIL(0.00)[3d:query timed out];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[port.0.0.0.0:query timed out];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.1:email,0.0.0.12:email]
X-Rspamd-Queue-Id: 769C4CC0A9
X-Rspamd-Action: no action

Enable DU1, DSI and ADV7535 on RZ/G3E SMARC EVK.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Fixed: dsi, du and adv7535 are part of the the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 3b571c096752..fa45e001f706 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -33,6 +33,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
+		i2c7 = &i2c7;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -71,12 +72,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	reg_1p8v_adv: regulator-1p8v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v_adv: regulator-3p3v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
 };
 
 &audio_extal_clk {
@@ -101,6 +137,37 @@ &eth1 {
 	status = "okay";
 };
 
+&dsi {
+	status = "okay";
+
+	ports {
+		port@1 {
+			dsi_in1: endpoint {
+				remote-endpoint = <&du1_out_dsi0>;
+			};
+		};
+
+		port@2 {
+			dsi_out: endpoint {
+				remote-endpoint = <&adv7535_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du1 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			du1_out_dsi0: endpoint {
+				remote-endpoint = <&dsi_in1>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
@@ -126,6 +193,48 @@ raa215300: pmic@12 {
 	};
 };
 
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	clock-frequency = <400000>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v_adv>;
+		dvdd-supply = <&reg_1p8v_adv>;
+		pvdd-supply = <&reg_1p8v_adv>;
+		a2vdd-supply = <&reg_1p8v_adv>;
+		v3p3-supply = <&reg_3p3v_adv>;
+		v1p2-supply = <&reg_1p8v_adv>;
+		adi,dsi-lanes = <4>;
+		interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_out>;
+				};
+			};
+		};
+	};
+};
+
 &i3c {
 	pinctrl-0 = <&i3c_pins>;
 	pinctrl-names = "default";
@@ -231,6 +340,11 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	i2c7_pins: i2c7 {
+		pinmux = <RZG3E_PORT_PINMUX(A, 4, 4)>, /* SCL7 */
+			 <RZG3E_PORT_PINMUX(A, 5, 4)>; /* SDA7 */
+	};
+
 	i3c_pins: i3c {
 		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
 			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
-- 
2.43.0

