Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KwlEnnljWms8QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:36:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBF12E48E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:36:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A9A10E74D;
	Thu, 12 Feb 2026 14:36:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I6SO2k2d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FCD10E74D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 14:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVAhrhHN+XQDCEptdUiEUqsKu5+6PX0lVb13uaCzi5URQgHDlp8Kjr+LulDEy94wuAzEohDRh+3QDwm/VXsMqRo0V3WVgq7vmXwLOalM+9f2aEc2idbdd8uH5a8KBk+3MalHeypcbAKynyxwILeQol0PmNqWgruFX62rGhSL649zDpJix9rZb0bMzAP4aqdHRyxxucoKy+Gex0YFbHXUEiPWXxHQcsEr0KArC9+h4Nh2eWQHpehGFnPh/gl5AJIeLPwm8aKkbCRta0ysZITUVauglzfJgn1vAtw5rivWMzudaDjcE6Iv99hWtgHJ0pwTcfWnMS0wR+9idohwhb3iSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmMUk2KrqGNBWPwSm3dTuekcZi1KgKzvah4ozo6+UtY=;
 b=JgQjUdypxR99loHKfpqC+zCiOihmqh5MO3mQDT1gqH2xxOEm2fAZ3iseHYaLpc+oNYG578GrzzKYtcXHojfoySIS+D0J7bwdcu3/owLCBncwL0jS/18ppj8hQP4k6PnYTkoFxWOGCzupz3vDkim+eZmjnmsogzIpt6HXXF9VqXEvyx3QpXBXqViZtCWAEwsS/qIGhfcFaddsc5GMQ8HgKYDdNYhmdCOB/Qfzd4Qsm1jH4Ewj3AzMkKIrxueBu/PAqYZsXewGJT5JboSEygDPDtFan4fQ4qsXQ/1LwYJWLhxbUdphWsL3stkMN6qQ7tmwfq1791mAFX53vn5rtJZX8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmMUk2KrqGNBWPwSm3dTuekcZi1KgKzvah4ozo6+UtY=;
 b=I6SO2k2dTp1iYKg9lvaNyeUg9nubgG+O8I6SeCTJjoUnVXyMBoVlTF4MYSjb9Xt5ArGRM99zi//78bbwU8gXln2qXxd1h4BB55VXf3u8eiDxxbbLwvVGE3yiWl+vCbwSqbVPmSOi7wa4E0KaRXAd4xg5EkZS+GBEKod/HREy9nI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB9918.jpnprd01.prod.outlook.com (2603:1096:400:229::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 14:36:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 14:36:28 +0000
Date: Thu, 12 Feb 2026 15:36:09 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
Cc: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 09/20] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <aY3lWbxr08F8kGxS@tom-desktop>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
 <4986c5a3c5cda9e754ed1f9f7121b32e9bf4499f.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
 <20260210001108.GA2165386-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210001108.GA2165386-robh@kernel.org>
X-ClientProxiedBy: FR4P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: de031b71-564b-4f85-00db-08de6a441b57
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mzmFss0MOX6B22Suv3MxUtMZnjmCvURZWqWUkDHm4CY3kptUxyRjG/nMW7e7?=
 =?us-ascii?Q?cS4UcAAfhUWCSnV7RHQEuemd0itw9rx13CQjFuLLdPrKsVPirGzpQI12TdZX?=
 =?us-ascii?Q?ByG+nIUfHXe3iqRilTI73ONrSAEzjhQC49seuws9dJkiH1bAco4SP66iC+1U?=
 =?us-ascii?Q?r/Zbcv1XNS5t7f0xbRC4OuQYjdlVImBEgi5sjlLaVAjVcXgJ43drIRVIbQxI?=
 =?us-ascii?Q?1IELzrIesT1ZazaCccojQ5W6ojfYnGoeM9v7GwBJC4LxeOEwgG4j2PgIwLYe?=
 =?us-ascii?Q?LZCtfCjmCknFSlb99RcVGC2yODSN75Ho01Naguuwau4hkjzPJpBLgu6TgzKH?=
 =?us-ascii?Q?gsdW4AvtuzIXqQtlvAFBrlpg71Py9690Jyae0WIAan5Z2vem5nBdcvqxkc0H?=
 =?us-ascii?Q?R9dcoVZcDVV5OuE0yYN35Je5BhphnU0gQt/FyYOmboSs4aIF5AsMnAjdUT8L?=
 =?us-ascii?Q?WacD8edEWEjrovecHn9T+RHO3Cg5SYIErvJJa+qmKoCMruUqf6rg0TawFArZ?=
 =?us-ascii?Q?Jb89r4Dez9HjzXHFs4Bn73pIEn7egL1uIs06AdP+o4ObeeeUmUDPXShOO7W6?=
 =?us-ascii?Q?OiTKuzYxintB27ngNu4itTgkeevT72GTp3i3V4JYhulkW0dVjYux8TNgLYBy?=
 =?us-ascii?Q?GADjC0QCB+UpFAFGD52LA3WlCFgs0x2u2wfBumb23IQpI64fSv5T4fT5NbbE?=
 =?us-ascii?Q?3ty2jc3yOCVelar/9ltRHYCqrKCI4GYlX4TI5G4lA5v0xbCDm+pY7t64oKvX?=
 =?us-ascii?Q?ais24pFkyH4oWeSw+KmBzJWBFXzXNxR7nNmR01rrYdN8S+EHEHLu4YNenCKf?=
 =?us-ascii?Q?NUV7xLRb05WAI8mGNwuWBZrAq9J/m3owAB58/758CqPR2L83BZSrZAh+SMlj?=
 =?us-ascii?Q?xoQlKMqKDYgsStk+uDEakzveBaEM7C3lmj+EL6LXcuX55pwtX9kTmIUnyJB3?=
 =?us-ascii?Q?IvjNI0zJ1sq8+bKCpXG0kC/iPqEWn5ho+lgnnfSOhE3l0CaGkHE+IsRd45rW?=
 =?us-ascii?Q?POJCYV8mhqg8+KIzY9JkMWJX4jzo2x0nBAwjdGCs5r19i87Y2wYj1o2J06KX?=
 =?us-ascii?Q?pDcZLdzrQFoYL6dZ+dnw4Y0xhio5021e3sRQtudhV3GupsV/go77u3f3MuXA?=
 =?us-ascii?Q?/EcgZFPX45nkg5QPDG+1Yy5LQpWdJFwqhg3Wc8ywo3SlsgSKQJ5KFDU1vmYy?=
 =?us-ascii?Q?9QYZXAopyydJZTG1Pknh0BrPLr7RG4LC6zRU9c/emEszUtVBwNy6+fls6QGX?=
 =?us-ascii?Q?Lo57qE/2KW3G5qP0GDLgmWR6JvkesdKzC1sCPtDAwz6bX3M2zNjFfQRunxnk?=
 =?us-ascii?Q?HYpDEIb/4qnhZfoIMPgaKGkSiZczAnF9CIed05DFG8pCH3a9zsZNJY2TkIw6?=
 =?us-ascii?Q?fRELzeLiVLAK/+yD8vMZ7ruXPeeLbq+KOzumsBOQYx/GYJJEMm5tWhYrDhPM?=
 =?us-ascii?Q?sakUNbR0Mi+NFNJoVFnws95hsgVz5kVQ7n7nFbTZc1AplMAHvWnejYR2xHXR?=
 =?us-ascii?Q?rnhEbZCdb8HkdRhcDzRU5bKZ7ejGqjIZTSIqb6mFI4GkaM+1ECIMO+QJ72VD?=
 =?us-ascii?Q?X/JDYZ2SSjDDzOmoTJMgQHSmgkPvAYfM4GvlK7hwCKi680IIUStwQFiDdQKF?=
 =?us-ascii?Q?vg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IoCojwHYqgY0T0Ujb1Ud3mkQMSQY0umyDFziDKUHISJYy+aOwR1kJk3FFdte?=
 =?us-ascii?Q?Fcjdi4BNNbEPCgNT74o+YLd0gqjPKRjbWMdeB9rjO+OahEfQ1ZPqAa/PLM59?=
 =?us-ascii?Q?AEjz0oaXs8KxKL464YfvNV36Fmxvt1wnuiG0/0417ic8koGtLiUyynfZiL3n?=
 =?us-ascii?Q?O2u+epizt1zYwZBrqvthCYni2LuqyJvmPGQ8oQrTNKmZljryK+HeBIt4KjAD?=
 =?us-ascii?Q?NsTqAqYE49CIsgc+mG0mthfsY4/j+pfO76epk/LQRzLsU/uMkDLk6c7RdaWZ?=
 =?us-ascii?Q?DR/qzyY0J6eDGQHl/6WOHib3L1HYCad8A+v8vQl7jI/A/qYXgkFDF/Pmhh+8?=
 =?us-ascii?Q?n65P2qr2fVXASwVIuZxsVD+mIWZYvIVVEP3PD1IAXTytrrIT+0VczVXChCHN?=
 =?us-ascii?Q?Ovzx0a3pPFbJmvNN09aL5kiuKIdtPvmTOXTWrBCVbUHlFGfB5mkUwV+ZxkfN?=
 =?us-ascii?Q?VrHjuCY9qy/fhXUQlEB4/ANn66YhztMbReQ80k8qoZV12iXSx5rUpWK2GODH?=
 =?us-ascii?Q?jouJIH8gUHbix/PVoHU3p4MJihncB7sAWYhknHyhieQ9dT4S3A73QYSUSwES?=
 =?us-ascii?Q?gW8VnkvNJwf6jV7TDZsZcN35Z+5TTOrSLHzx1+88sMKg4LrdD9jTm3TeJhqU?=
 =?us-ascii?Q?iEjzr0dIVjHin+8lzKZSOQqcszPbtFYvu/vO3eHtYF+Y7KaZXhuu6VY2ijxX?=
 =?us-ascii?Q?k+X0BGQ6b9ZS8l+rgydvEupMW6WGh3sjIzqaE7iQg+Vn0SwTmQBuE70kBOWA?=
 =?us-ascii?Q?itC23KBckDX/LEQWM6DiRASPihXxZEEoA6DxEnRw3dleB1mVwHdZHXExloLN?=
 =?us-ascii?Q?IFXgXrrFaTawqRacmecX9HpzH+EBL/AX+TM3Ls4XMJwOPe36mucFl4aLPjUY?=
 =?us-ascii?Q?yiVDCYzZVl4pGvWJQ5myxARJIciXMqKnqIE/CNbG7KlKS5azEWdpjZmFsXqZ?=
 =?us-ascii?Q?RlOAJTqJn+r3YAjdsTPXzbgB6H9l4VeP4fmXBcZz6mUap4uhF3ulTf22tq/g?=
 =?us-ascii?Q?Z5+lXAwbMVCpmsU48f6nHm4rDRUsmAqh9CN+5LO30dq/nheXgxXpA5kIVTqk?=
 =?us-ascii?Q?teQ/e6bHKRVhfkWXXBV7kJTN/MLrF7rMZeQzaMZIaq3H0N3gZunacz4Ubrm5?=
 =?us-ascii?Q?y/tr1wycusx8eHpSRkStv3BkoqJxi76y8Cd1FVextTXY4ci2u7zww/Bumpbc?=
 =?us-ascii?Q?m1Ne2z3pkLRbRZHho+efe5vhI/q0KiMrKTAC0cMQEHgGEoBYEIQ9vWzoEIbZ?=
 =?us-ascii?Q?daruL1sZ7XMK2tpTimO+7dD0qBI0QudK0HblU8zW5xW/jNAQC+0DzzrXnNf9?=
 =?us-ascii?Q?kn2Oeral+VJSzhGsQKeD7zYWB/NHF6VTCECH5YyQ/o/NhNt39iXP/AsCZp/Q?=
 =?us-ascii?Q?OskZb849xYXVDvmDtxsAWAorzmwwskgQo7ANsO5o9Bmq+nj59WTqseObbdwn?=
 =?us-ascii?Q?yBTYb9a4NNHI6kwMu6Y7f3gj6rmW3RJYGaMMIqxD4W0h1kSwU9sfC6ugJROg?=
 =?us-ascii?Q?iunkpkVPESJGpZXRHTMSUvgTZet+1jp7W9HlUlQeZpfZg9ATeaETevT7oOP/?=
 =?us-ascii?Q?Jwx/1O3qUQP1rqjrdxjh2kN5zmAMBE9YcxVxcEoql+85oxNIDJoLd0hARnj8?=
 =?us-ascii?Q?h6EJUQ3g6aenMMVHWxpv9AGihcbYyv9GZLwWpN0YMd/Wxt6iLEvBaJoWrYoV?=
 =?us-ascii?Q?B5NZ+e7FONfQnICF6DVlU0yEXqSfCWOBNRTIxy6uPmgUwenWrxMsFp6BVJbM?=
 =?us-ascii?Q?AsLXLrVXYVnVwX4rPW/cG7Twtd1Cet3FJlCoVLtRkCkc9wOYJc9x?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de031b71-564b-4f85-00db-08de6a441b57
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 14:36:28.5294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wv/KObZPjH6Gxl8jYSksfCdvbEAGl2I8gSOZtUKbwPllTaPBf57fVBSmqtXGxCEOPHYcpnslHkaRv+vlgE6RRyDctQN6TXgBua/5PX533okg7t8jxwSFjjj74DlGZVUS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9918
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,linux-m68k.org,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 37EBF12E48E
X-Rspamd-Action: no action

Hi Rob,
Thanks for your review.


On Mon, Feb 09, 2026 at 06:11:08PM -0600, Rob Herring wrote:
> On Mon, Feb 02, 2026 at 12:57:40PM +0100, Tommaso Merciai wrote:
> > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > Processor (VSPD), and Display Unit (DU).
> > 
> >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > 
> > Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v1->v2:
> >  - Use single compatible string instead of multiple compatible strings
> >    for the two DU instances, leveraging a 'renesas,id' property to
> >    differentiate between DU0 and DU1.
> >  - Updated commit message accordingly.
> > 
> > v2->v3:
> >  - No changes.
> > 
> > v3->v4:
> >  - No changes.
> > 
> >  .../bindings/display/renesas,rzg2l-du.yaml    | 54 +++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > index 2cc66dcef870..55e3fcff7030 100644
> > --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > @@ -20,6 +20,7 @@ properties:
> >        - enum:
> >            - renesas,r9a07g043u-du # RZ/G2UL
> >            - renesas,r9a07g044-du # RZ/G2{L,LC}
> > +          - renesas,r9a09g047-du # RZ/G3E
> >            - renesas,r9a09g057-du # RZ/V2H(P)
> >        - items:
> >            - enum:
> > @@ -53,6 +54,12 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  renesas,id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    description: |
> > +      DU instance number.
> 
> If we wanted instance numbers, there would be a common property. So why 
> is this needed? What's the difference between instances besides the 
> ports?

renesas,id was introduce because:

 - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
 - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

I will model the hardware without renesas,id.
I just used renesas,id because of the above reason.

Kind Regards,
Tommaso

> 
> Rob
