Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852F9D22EB5
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 08:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCB710E6C5;
	Thu, 15 Jan 2026 07:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZMobKn/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B5210E6CD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 07:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bijUZx4v3hAPxlDnckeIPZ9JEHi+szazt6R1ujNwWh7xK9bySJflEI4dsT/lJzH1GF3ii7tOnl5Gr6Ooyr3aexrlKajQaFRclDUpPr0QXGmP+jUBrMLmwLUhVB0KYFJJMqUiZ7FAa7dvJKapC1gpYRbwseMrHiGxDdRhnWwIIYFMm4rrM2XscumH2Ll9FRnSGimwRm5qsIs76iFRg+/9BF6W0dhsT0LjSFodfFe/RvmOYb/c0Ix8YKqyfMLDXSwMwOBRTvXT2nfarLnKVshN5s7MK/onfQN7o3LMvkeFqVluSLJ8hnc3fmddI73zW20pUrTS23wN5cRAbs2E1zxC8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrPwhJag25LQ4eH+JauWQUBXhNXxe0PqTNcJktSgLfM=;
 b=AtBkiZ0typDa8UZUXB5QBTFGXIt9QfXI8NNTU2gCBfR1GcWoGk4Wpk5WzNdBMF4QM6pSmfaYqpR4UAXBKnhllVLZBmJYm9XhPQSxrpcBDOm6Y70bYYdHmQrtFH1ZNQzW+r1n7l5MPrB2ZTJWT2cKCiDF47so9TkeIdenfIBxo+KGs+wGFpWp5j2djBFDqLKHLNnoMaZKBZNU59j/mqAqgSUTPfBkWtmjXocNAbznaJPgsX4V6RzUArW/i3CHeJKTMpZHNh/TtYTfTSuT4Ahk4HpFQozidSWQK43HkJWzJs9Ud6l5lBn4GG0YhIFIkaan5b6zsvo8PcpBDW58pbH3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrPwhJag25LQ4eH+JauWQUBXhNXxe0PqTNcJktSgLfM=;
 b=ZMobKn/bQb+dwrGT7V0sj96rZ7glu8zUy82qj1cDkWmI2yfk9yf1zzusQKip1yUTej/aVqPv4MbWEkBr3lRgMcFa30So6iYKcw4GkHwrTG2zu+cMyXb9onmrhCCHpYBPAqwX7GeToEIh+mc+7NhNJJMf7RQvrUhUS71FBWUJTn4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13807.jpnprd01.prod.outlook.com (2603:1096:405:215::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:48:31 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 07:48:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Tommaso Merciai
 <tomm.merciai@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, magnus.damm
 <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 10/22] dt-bindings: display: renesas, rzg2l-du: Add support
 for RZ/G3E SoC
Thread-Topic: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Index: AQHcXt5Sr0mFHG5nfkaeppwNYIyqH7UPnpSAgABY1gCAQfATAIABPySw
Date: Thu, 15 Jan 2026 07:48:31 +0000
Message-ID: <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
 <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
In-Reply-To: <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13807:EE_
x-ms-office365-filtering-correlation-id: 1ef4a712-2ef5-4db1-05f4-08de540a7a81
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TUJTTmhRZ1p5cG1xR2ltcU0vL2VROE5pRU1QSVpsZVM0aXVmbjBhWTBCTnFm?=
 =?utf-8?B?NUZwV2xuRmU1Qkl5UkQ1aWdkdUdYS3JEd3hTbk1sbitKVjI0Y0pEYWt4cG5R?=
 =?utf-8?B?TkZPN0djQVlET1N3UDBhSEJVY3czY2JiY0g3WmdTb0VZS3pLQ294TFZ3Y2E1?=
 =?utf-8?B?c0lOamtUSHNyU1FDZmYvTndlejJqaE13WHVxVU5MTHRlSUxxaUFmbitwTS9J?=
 =?utf-8?B?S3l1eEpYVVR1N3FYWUhhVm45TDhxeVRscTE0OWxhRzRhSGhEdkQwbDlKbGlM?=
 =?utf-8?B?cC9QQjYvTUgyV2poWXlna1NoOWxYckpVMzh1WlNuNlNWRzZEZ01vbkhxbHo2?=
 =?utf-8?B?R2ZlUFMyYzZ2M3lWN3AzQllQdFFOODBsWEVLZzh4SmVzeGJKL0JlOTgvS1Zn?=
 =?utf-8?B?VEVSc0ZlWTlLOHNIR0hVb0JnZkR6N2FELy9YRWNJU2Y5M0ZnUHNXbGJlR0lL?=
 =?utf-8?B?Ymhvd2x5eGV4Y0pNUUo1cTBCWE5rWTg3Y3Vmd0EzQU4rSVc1aXk5ZXhoNzQr?=
 =?utf-8?B?ZExuaWxqL3k5bDk2cmpDODRhYmpVTHF0cm1LZkQ2NHV1UjJSdElCMmhyaUtN?=
 =?utf-8?B?a0NqOUNYbHgvY2R4d1UvU0x3S0o1bUN6bU4wd3lIOFJFSWkyMmNsNWdvYXZB?=
 =?utf-8?B?N2VOYVdsUWNWenM3c0tmKzZML09OMXdkby82YWs4L1NHbDBCWUFiYklOSkpz?=
 =?utf-8?B?dGZYekpMcFNEU0dveDVxaGZHWWo3eXZWVnM2U3NVazQ3K1FocHFyNEwrc0Q4?=
 =?utf-8?B?QjhNV2l6c3p1MEV2RnlSem5wZlRlRzVwdmFmZzUvOFZHU0JGN1dDOGpFSW5J?=
 =?utf-8?B?MktUb1lvdEIrSXd3bWtXYy9QTWJLT0tEOWxaUmdYRGlwNDZVSndPclpoRDYz?=
 =?utf-8?B?eEVFdzRFUnRvTDBPWWc4cmFZQ3J2dkd6WmVVT0ViLzczQ253YXArZW41Tm1P?=
 =?utf-8?B?am91eUorRytNbDBKSDJTWFhTVyttVmdaRTE0VHpESC9xMWZtQnkvY3JzOTJm?=
 =?utf-8?B?MCtPTlEzZEpYZmxab3ovcWpCQ093bVg5c29RTkVJVjQrLytJbkRNNFNHRzZT?=
 =?utf-8?B?TU1NUFpWOEt4MUwxdDcrZlY3OTZRbWgzci9BQW1LZ1kvNStYU2lUTlN3b3lU?=
 =?utf-8?B?dU9pbFIxVzlEak5nVjJmOE0vS1NvZXF1K2RIa2xYTUd1Qk1TSTZpb2lDSldM?=
 =?utf-8?B?cFZvRExTdXlQR0R3dWJ3ZHZEQVJnRzNoMjZuQS9LendOb2p2Z3p0WnJLOWc2?=
 =?utf-8?B?OVg4bncwcklJMnhseGw1WEEvVzFtUmJWSy9zVlVWU1FzMFZrYjlnditBdTZY?=
 =?utf-8?B?bkRsaWUrQ0pRSDdyM3Z3ZUhSNTRTYWJaTkgxSEhBT3NOTCsvcnRSbmxreFNq?=
 =?utf-8?B?aFBFRThYcjF0YnFGeGtSaUQxbW13V254bDhqbXhZbEY3VmhsaTAxaU1jYnZC?=
 =?utf-8?B?Ujdjdm5Ib2tVemdvVkFZd2U1L1J4bHpkbE5OTFk3TEt2a2tuSTdscGV4K3lF?=
 =?utf-8?B?d3YzWW9uSXY5c0lMYjhmeVArRDBhQTBHRkJpcFAvMEI4dTZDVGp4aDJQaDFh?=
 =?utf-8?B?a1krUFY1NDhPdG5OMkZhaWxHaFhMSHJHNEk4TmZ0VFd2MWtpVXVPelNPR2ly?=
 =?utf-8?B?TldHZFRvUEFYVmprUTdwc3ZyK1ZnQ0RoU21ENHQyL1dSQW51NHdYRlllSVR2?=
 =?utf-8?B?b2VkK1FKenpuOERFdkZmM01pTVRGSmV2VDk5WEJBSngvRlJpbndMbWNaSVJp?=
 =?utf-8?B?RWdHTWpLUWlCdzhuTnlhMktyNFRWOWZsUDVUZHdUV3grRVpSMzhsTHdzZWNO?=
 =?utf-8?B?WGFvbGlWcmRCTGhPSkZJTndFbk5QMkdHM3pMSkptRHh5bjkrbVBaTEx4VXdZ?=
 =?utf-8?B?b2hDOGpCcitPZGtNSDhwRTZyRGsxeFZOTGlBM2hFU3NlZWVmN2lWM1NpazNB?=
 =?utf-8?B?c044UUFObmdWcXh5bmhvMEx3aThzZGlFTWp0S1BBV0Vkb1FZekgwVXNpMmJB?=
 =?utf-8?B?ZGc2OVhETlFUd3NlZHhIYzRwZDZJdG01Sll2MGtEU1BkanNLYjVIZXRXZHZF?=
 =?utf-8?B?SitOUG5pNmM4SWt6UlZNQkUwZVA4cnBxdGJhQ2g4UjRIVjBHYU9acXlDUm9j?=
 =?utf-8?B?NHp6N09JcjNhcUZIa3U1bE92clFtaEZXUDNaNDdjY2xsc0wvTVA2ZmVBZE4x?=
 =?utf-8?Q?Ru3usSrZjP79mzS7vn7cBTQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NFJUU2hrNDFFMUg4UEJJVm5RUDhDSzZOb1FRS3RUaUpjTG9DWkFtM0VxMzAz?=
 =?utf-8?B?SmdPa1c5VmpuakFzZGdjZngrajNQa0M2M213TGFXUGdNNmxBSDY2UnpYMTNC?=
 =?utf-8?B?MnhEN21jMzJOdlZha3BWTG51cTgrRXBpam9OeHZXK3pnQWJIV2hJcUhzbkJ0?=
 =?utf-8?B?emduU3I4RHRmMHJRYVN1Q1VnQmtWQWNXZmtISm9pQzdPTC9mYjgvOWIvODBi?=
 =?utf-8?B?VE5XMEhrZ0hDTzN5V0lXVGtMNDM3OEV3V0lkM3N1bEpwUWR6WFJQR09PMlVr?=
 =?utf-8?B?R0F2RDRYK3cwdXZ4UEE3ckdIVlZkVTNzNjFTYyszc0NPd1kvRTJ2b3d6azU3?=
 =?utf-8?B?aGoyb0ZRT3M0UWNRQ1RtSittaDkxUDJ1MEhYK2JMY3o2bWJEdzRMM2tIcE5W?=
 =?utf-8?B?UURuanVzNFFXRVBnaWhKUmcrZ0dRblIxbVhBSEJTWENWbEZKQVpnUTRia0l0?=
 =?utf-8?B?QTEwR3NCZlNITUFmUk4vNEwzcGlLTUYvYi9GbGJXZzRUeWg2em0ycDhERnZN?=
 =?utf-8?B?TE5MdDVyNENKMVFuV1BzRWpHSkpaVlB3OUdwd05BYUtnM3ZqS2hGREhFNnJo?=
 =?utf-8?B?eDI3VFFBdW5MS25zZVVvcEpxcDB5WXpaT1F0QU96U2JzZHNPVEhReURWNVJr?=
 =?utf-8?B?bExXMjdJOVIrZ2VNL3pJQ0lMK3h1WlNaanFmMnNQM0paZG5qMjkzRUZlMFZP?=
 =?utf-8?B?UlNvbmkyMU5BTFpWYXZCSVlYL3ZRZ1daNld0MUVzT2ppOG8yZW9ZNE9NTjRT?=
 =?utf-8?B?cThHano0KzB2eUdXOFhKNjZMUmliM29jZmdNenZBR2lpZURmRVFjdzF6Smgz?=
 =?utf-8?B?WWJic0RSVUZpUXFqaXFwN1k2TVNTSEFxTFNSZ2RPeUM0QVdzb0U5RXhScm5Q?=
 =?utf-8?B?TjZCS1RSTUJISmtzT2pUTG56VFJvdzJOMFJuQi9BRWhzUHdKQmhJd1ZvakZ4?=
 =?utf-8?B?NXFJRFl6SFNrbFVZQXlSUGtyZjNINDJWTThtMUtoYUFjYmRtUTAxZjlWZTND?=
 =?utf-8?B?TWozRTZ6S3BucVJVbU5uRWsxTndKdGVER2Jjb0pQQXA1OWY0STl2eUNqWVlG?=
 =?utf-8?B?TENWVGNSWC9XMm1IdFp1LzBWV0M0VWliMjE5ZXRPYlozSElLQmYvay90ZFpW?=
 =?utf-8?B?NGVYeDFJMTBoc2ppUHVtNVRKdkhsVGhtQzY1TitZLzlQVU80U0l6ZzJjWlBa?=
 =?utf-8?B?OGVFb0FoOGI1S2k2Vkg4d2JqUm1ETkI1NzJDY01wWHQ4MzdObXE3R3ZBODFt?=
 =?utf-8?B?UXc1MnQ5M3h2U0Q1ZnZZQ0RGOEQvdHRaOUZMRjBmS01FMVhKbHVMSTh0ZEJF?=
 =?utf-8?B?UHZudHhrb3c1c3hqWDFibU0xaGI2ZlJCNmNTMlRsVmxEbW5MMHdZVHNnS1Ra?=
 =?utf-8?B?WUZWWTNQbmp4TDVTTERDWXJzZGhUSTAwQ05NQXpOWUhxaFp1akJtVmRES2ND?=
 =?utf-8?B?eCtvSTJ3bXkyWmcrdXlhTjc5RVc4QTBSY1JpZ3lWYU5pZURKMm9XM01FZXFC?=
 =?utf-8?B?UlhZQTUxbVIvZ1lpOTBzQjZ2dFB6ZTdxTEEvY2R5MlkzOFlrOE5BT0Zlbldz?=
 =?utf-8?B?ZHdES04zVjE1K3BTQitEV2VnWUhzRFN6WUJHU3lpRFpZNnBUQ0xNUFpsYytz?=
 =?utf-8?B?aW5adFZnRUM2Mms0SDNHRWcvc2tTL3NPZXBSZHJnSVlRYVQ5ZW9lUExxNno4?=
 =?utf-8?B?ank2WnRheDJzaE5jTEZjaFc0SEc3bHJOSTJtSnVMckplTEw4b3BIUDVTTVZO?=
 =?utf-8?B?UUI1SEhDOENVRDROTEh2cGZBYUFQTGxDU2Q0SERac1dCU2NXcDhyeWhwbWJn?=
 =?utf-8?B?c3JETGVFRDltR1o5YVNVbDhDMHU5OUZQRGprYXNjajNxdVdjU0VVekRDZFBu?=
 =?utf-8?B?NUd3QlVoL0x4RzJlQ0hmWFFucloxNjlrOXZhSWJsbGsvamNLQ3lTMXhubnhh?=
 =?utf-8?B?R1VYYlF3QU9Tdlo4aUkyMWtJQUlUaVllU0srNkZMY1Q0aWVvVHhTMEwvZzVy?=
 =?utf-8?B?dE1qM2hhNjd3Nys4Vms4cGdKTnFGNW1uVlQvdkk3Q2JoRmxhSzJ5cDBjN1dC?=
 =?utf-8?B?dzBZWGN0c2xMSjNKUVRrN0gwek02djUvWXd3SkhOSlZkbG15dW9jSkQ3MGJG?=
 =?utf-8?B?c1pyUmg4RUpVM0dMYlFpWktnOWhXbjZGUFM4Wk0rM096K0l2QTFMZ0NYZjVC?=
 =?utf-8?B?QU9sQVZ3aDBnWEVsYi9MYXlnQVUybS9Ield3U1MxYWRlaWsxSktkMEF3LzVh?=
 =?utf-8?B?TzQrNTNlc3k3emRYKy80OEVLQ1VPeWxYS09CWTJoNGViY2hwbm5rcFpHcEpC?=
 =?utf-8?B?dU9MRGIrZFhGWHM2anJnZ1NwQU10eVJjdFpUN2UxbjNEdVFBWU1UZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef4a712-2ef5-4db1-05f4-08de540a7a81
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 07:48:31.4759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Xhql6/MG8kl4ZmO2CO5hOhzl110+GrXqlRp2cddsSB2UsqJlIVsU/msvDPhKKBap75n/Rw/ryVCH5uLskXqGu0t/CRCqX8s9Lgw23zb234=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13807
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

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IEphbnVhcnkgMjAyNiAxMjozOA0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEwLzIyXSBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhcyxyemcybC1kdTogQWRkIHN1
cHBvcnQgZm9yIFJaL0czRSBTb0MNCj4gDQo+IEhpIFRvbW1hc28sDQo+IA0KPiBPbiBXZWQsIDMg
RGVjIDIwMjUgYXQgMTQ6NDIsIFRvbW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBPbiBXZWQsIERlYyAwMywgMjAyNSBhdCAwOToyMzo1
M0FNICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+ID4gT24gV2VkLCBOb3Yg
MjYsIDIwMjUgYXQgMDM6MDc6MjJQTSArMDEwMCwgVG9tbWFzbyBNZXJjaWFpIHdyb3RlOg0KPiA+
ID4gPiBUaGUgUlovRzNFIFNvYyBoYXMgMiBMQ0QgY29udHJvbGxlciAoTENEQyksIGNvbnRhaW4g
YSBGcmFtZQ0KPiA+ID4gPiBDb21wcmVzc2lvbiBQcm9jZXNzb3IgKEZDUFZEKSwgYSBWaWRlbyBT
aWduYWwgUHJvY2Vzc29yIChWU1BEKSwNCj4gPiA+ID4gVmlkZW8gU2lnbmFsIFByb2Nlc3NvciAo
VlNQRCksIGFuZCBEaXNwbGF5IFVuaXQgKERVKS4NCj4gPiA+ID4NCj4gPiA+ID4gIC0gTENEQzAg
c3VwcG9ydHMgRFNJIGFuZCBMVkRTIChzaW5nbGUgb3IgZHVhbC1jaGFubmVsKSBvdXRwdXRzLg0K
PiA+ID4gPiAgLSBMQ0RDMSBzdXBwb3J0cyBEU0ksIExWRFMgKHNpbmdsZS1jaGFubmVsKSwgYW5k
IFJHQiBvdXRwdXRzLg0KPiA+ID4gPg0KPiA+ID4gPiBBZGQgdGhlbiB0d28gbmV3IFNvQy1zcGVj
aWZpYyBjb21wYXRpYmxlIHN0cmluZ3MgJ3JlbmVzYXMscjlhMDlnMDQ3LWR1MCcNCj4gPiA+ID4g
YW5kICdyZW5lc2FzLHI5YTA5ZzA0Ny1kdTEnLg0KPiA+ID4NCj4gPiA+IExDREMwLzEgYnV0IGNv
bXBhdGlibGVzIGR1MC9kdTEuLi4NCj4gPiA+DQo+ID4gPiBXaGF0IGFyZSB0aGUgZGlmZmVyZW5j
ZXMgYmV0d2VlbiBEVTAgYW5kIERVMT8gSnVzdCBkaWZmZXJlbnQNCj4gPiA+IG91dHB1dHM/IElz
IHRoZSBwcm9ncmFtbWluZyBtb2RlbCB0aGUgc2FtZT8NCj4gPg0KPiA+IFRoZSBoYXJkd2FyZSBj
b25maWd1cmF0aW9ucyBhcmUgZGlmZmVyZW50OiB0aGVzZSBhcmUgdHdvIGRpc3RpbmN0IGhhcmR3
YXJlIGJsb2Nrcy4NCj4gPg0KPiA+IEJhc2VkIG9uIHRoZSBibG9jayBkaWFncmFtcyBzaG93biBp
biBGaWd1cmVzIDkuNC0yIChMQ0RDMSkgYW5kIDkuNC0xDQo+ID4gKExDREMwKSwgdGhlIG9ubHkg
ZGlmZmVyZW5jZSBjb25jZXJucyB0aGUgb3V0cHV0LCBidXQgdGhpcyB2YXJpYXRpb24NCj4gPiBp
cyBpbnRlcm5hbCB0byB0aGUgaGFyZHdhcmUgYmxvY2tzIHRoZW1zZWx2ZXMuDQo+ID4gVGhlcmVm
b3JlLCBMQ0RDMCBhbmQgTENEQzEgYXJlIG5vdCBpZGVudGljYWwgYmxvY2tzLCBhbmQgdGhlaXIN
Cj4gPiBwcm9ncmFtbWluZyBtb2RlbHMgZGlmZmVyIGFzIGEgcmVzdWx0Lg0KPiA+DQo+ID4gSW4g
c3VtbWFyeSwgYWx0aG91Z2ggbW9zdCBvZiB0aGUgaW50ZXJuYWwgZnVuY3Rpb25zIGFyZSB0aGUg
c2FtZSwgdGhlDQo+ID4gdHdvIGJsb2NrcyBoYXZlIG91dHB1dCBzaWduYWxzIGNvbm5lY3RlZCB0
byBkaWZmZXJlbnQgY29tcG9uZW50cyB3aXRoaW4gdGhlIFNvQy4NCj4gPiBUaGlzIHJlcXVpcmVz
IGRpZmZlcmVudCBoYXJkd2FyZSBjb25maWd1cmF0aW9ucyBhbmQgaW5ldml0YWJseSBsZWFkcw0K
PiA+IHRvIGRpZmZlcmVudCBwcm9ncmFtbWluZyBtb2RlbHMgZm9yIExDREMwIGFuZCBMQ0RDMS4N
Cj4gDQo+IElzbid0IHRoYXQgbWVyZWx5IGFuIFNvQyBpbnRlZ3JhdGlvbiBpc3N1ZT8NCj4gQXJl
IHRoZXJlIGFueSBkaWZmZXJlbmNlcyBpbiBwcm9ncmFtbWluZyBMQ0RDMCBvciBMQ0RDMSBmb3Ig
dGhlIGNvbW1vbiBvdXRwdXQgdHlwZXMgc3VwcG9ydGVkIGJ5IGJvdGgNCj4gKHNpbmdsZSBjaGFu
bmVsIExWRFMgYW5kIDQtbGFuZSBNSVBJLURTSSk/DQoNCkR1YWwgTFZEUyBjYXNlLCBkb3QgY2xv
Y2sgZnJvbSBMQ0RDMCBpcyB1c2VkIGluIGJvdGggTENEQydzLg0KU3RhbmRhbG9uZSBMVkRTIGFu
ZCBEU0kgdGhlIHByb2dyYW1taW5nIGZsb3cgaXMgc2FtZS4NCg0KPiANCj4gT2YgdGhlcmUgYXJl
IG5vIHN1Y2ggZGlmZmVyZW5jZXMsIGJvdGggaW5zdGFuY2VzIHNob3VsZCB1c2UgdGhlIHNhbWUg
Y29tcGF0aWJsZSB2YWx1ZS4NCg0KVGhlbiB3ZSBuZWVkIHRvIHVzZSBhIHByb3BlcnR5IGNhbGxl
ZCBkaXNwbGF5LWlkLCB0byBkZXNjcmliZSB0aGUgc3VwcG9ydGVkDQpvdXRwdXQgdHlwZXMgaW4g
YmluZGluZ3MsIHJpZ2h0Pz8NCg0KRGlzcGxheS1pZD0wIHtMVkRTLCBEU0kpDQpEaXNwbGF5LWlk
PTEge0xWRFMsIERTSSwgRFBJKQ0KDQpDaGVlcnMsDQpCaWp1DQo=
