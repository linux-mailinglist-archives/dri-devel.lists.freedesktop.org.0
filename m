Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63FD23D67
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 11:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBE810E1BA;
	Thu, 15 Jan 2026 10:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="J3frrNa3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B93010E1BA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 10:10:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0Bgi2baOO6pGA0AXcG/+3ovXhuPga1ja4eSW4bb7MbA+BcgcEXF9/FGAaUhT7EXCNl/5sje1gzRC5UWOC1uyWV9I+XY9LSAZ7tGefGbca69Tj686c/rnYTMNWyKXM2tALg6RtbJJ0NWS+eCod1jh5cNE6n4ZrLRiu+IjhAdQcFqX79n91Dw2faFuWYAELg6RnD5+scFhTQxXwyrRV3uktAjzth+/8VcB0BbbKyXsjHksNwz4xXenmDIFvDU80s0hKuA83DaKBcFwb+18GMM9zQ64vg8uxiObQT5cMv6RXMbng6LWetLCgD+pcHJMnG2IpJGKEl5u3HBS7aYwtd+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqcX7Qt6iy82roh3V1v7AMlcXkXFsYK67SJoJ1mgQdo=;
 b=XHhjDARWBvWiasyfT0H2ilOKQCZ5MIy7HT9u7rv+8uMBBUY7pCYUBQ+3Fx9qPE9ashhoUlA5tsGkcRkDu5Jwd6Y/geu9rYsS8rHP1a+VpFExHlUQtkMiTH/RnIFB/3NppWatb2VIaBFJYFnC8Ld/gff/quXvc9edP1JNgc6GE/zBU80kOvXoSEKPqMd52q4pO2+T0gvwUUu4kqtcAhLpb9hG6iM5itfaqu1XetuunIq9JsZqKin3gfljlZFOIyHiJb+pxYIAhrF+jUGzdCf0j/xUVp8k8mHSJMQKa/7H+EyM8AyU2cWRTo20CjZaGr9SBbkRpMBkSqdxriFvB2ZRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqcX7Qt6iy82roh3V1v7AMlcXkXFsYK67SJoJ1mgQdo=;
 b=J3frrNa35IZemMhJrFMMDt+vTjXEZQI3DOR0MVxC6cS7eYUn/PbNQ+Nhm8FdzkUcOqATuYeFeHkTAll/NZLU7jujdL3HwWKnX8aLQn3Rhx18OYwg+5uw9bDGDTUcbzWEN7IM0AipF4lITOYN2m6fIAiP+IEWSShv0iaaPunyOg0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB6845.jpnprd01.prod.outlook.com (2603:1096:604:137::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:10:22 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 10:10:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>
CC: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Tommaso Merciai <tomm.merciai@gmail.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 magnus.damm <magnus.damm@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 10/22] dt-bindings: display: renesas, rzg2l-du: Add support
 for RZ/G3E SoC
Thread-Topic: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Thread-Index: AQHcXt5Sr0mFHG5nfkaeppwNYIyqH7UPnpSAgABY1gCAQfATAIABPySwgAAMWgCAABDyMA==
Date: Thu, 15 Jan 2026 10:10:21 +0000
Message-ID: <TY3PR01MB113463EE3F22A0E0E6C97DC40868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
 <aTA-Hj6DvjN4zeK6@tom-desktop>
 <CAMuHMdW=UkZxhf-pbtp6OBFd_3jPcjUaKFmH4piuc+P=kgxzGA@mail.gmail.com>
 <TY3PR01MB11346DF85F8F7EA9ADDED16EB868CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
In-Reply-To: <CAMuHMdUhke83ZVXxDQE_Dt1HRwyGeoMq1pYmEP47WOgR_vYNtA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB6845:EE_
x-ms-office365-filtering-correlation-id: c5d3958a-b849-46b2-fe05-08de541e4b1e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dkV4QmQvR1c5VURoNWJPNTk0bXlHY202YUNrczVRR0Fwdk01aWVNUHpPVDR2?=
 =?utf-8?B?NjJ6dkhNUkRpOE5LZHE4MEwrNS9PTkg0NFNQUVAwdGlSZCtEbUxsV1c1Uzhh?=
 =?utf-8?B?MitZTWdXRUtFNlhwcVhoV1JLTURmY3lRWnZYTlZESkROK0JiNzdndEVCUHNi?=
 =?utf-8?B?c25ScklSVC8yV2UxWHdQK2JkNUVwT1R2ZEp4bUhxN2dEVDVwL3RVTnNJZ1Rl?=
 =?utf-8?B?ZHBsNFZodVVVVGhHL2dObU1iUXFTNlQvUkxlWlJ1WmNnUnY4MEttNUlGaHB5?=
 =?utf-8?B?bU5GMWRLYkZKOGFXV3FtOHMzT0FKMGhnWDdLd1FLamZrTnZjOEhPVE55Y2Ns?=
 =?utf-8?B?cXBKUTI3SUQzQ2gvdzV0OTZ2bS9BbDBCMVJXeUQvNTJsYnM4QUR5MG5YV0Ja?=
 =?utf-8?B?MjBxdWQ5N3FIdmtzaE1aYVRMVEd5M1VNTXhPOTllWlpnb253ZnpRZGs0QTF2?=
 =?utf-8?B?V0d6VGNMUEM0bmJYRzByUFl0ME03UDJVM0RHMlZNNjMwZktqZkk5SEROWVcw?=
 =?utf-8?B?cm1lN0JIR0JENXU4cEs2ZUcyeEZlSmRYZ1pHbEdvaGxDWnA0OXlad1VUVGtG?=
 =?utf-8?B?dWFkMkR1L2JBZ2hFRFdhYXpFNFZnRlVndVRtWEpsR0hkdzR0QnRnQy9QV1Nt?=
 =?utf-8?B?a1o3MVRUMjI0UGp0TGVZQ25lV21YQ1FkS3l2UmVqL3R0NEE5RDB3NWdjcXJs?=
 =?utf-8?B?TkdEOHZiWWRYRG5TZEtpc0ZvZjNqbE1HYWJhMWJVcXhmMk9ZeStWZHV0UEg1?=
 =?utf-8?B?ZVExN2F6TDIxbVJQZlV3dTFzc0diQWx3ajA4WmVMKzFBTURnZDVUTUx5MHYr?=
 =?utf-8?B?dGp2eFdLVDRMWDB3elF1WGpPSHZtM1lacjZFMWR6UXg5bkE4NVJYRitEc1pZ?=
 =?utf-8?B?WDAwYXE4MkczaWlmUTlBUjMyZk1wWUJEMkg4dyt1a29XUnBWUzQ2SC9UWWJ3?=
 =?utf-8?B?Wm1aT1RiRTAyVGNWL3VqdGVzRmszVmJoTlh2dWYwM1JkOU5JQ1JDVVVDTHha?=
 =?utf-8?B?dTJvQ1Z2WXdoNXlGRXhra1Vta1FLYS95MG9Rdkcxa0FSbm4zVzYrL0x2WXVv?=
 =?utf-8?B?TG5yQVFQcDl5VHpuVmpSNnNOSUZ1L3JNSzJ5Y09iY2RoUVFQT0htN21kbDFH?=
 =?utf-8?B?RUF2WERSVVdDM0dwVHlzS0hJcWdNWUllQmJxeUIrRHhDSnBsNzZnaEtjR2lw?=
 =?utf-8?B?ZXYxWnZOdHR3alNRT3doVW41NEZleDUvODhBbTFRNFJ6eElvR01nVlBoUU5J?=
 =?utf-8?B?QllZOVNYcDRCaW1XS1R4ZXVKSnYzOHZzZjFSeUVHRGhaSUhCWGdXMktsZDBE?=
 =?utf-8?B?SVpEc080NmRWOWtZNkROMjdnR0NXb0d5S3NhNlVtUXlONHBtV2FDRndVQzdS?=
 =?utf-8?B?VUNvcVJPVFFFYm5MZmJ2dU1hTGVWcFV5akVUaG5MZHFjVm9hcVJNZTNZSEZs?=
 =?utf-8?B?RGlSRTFaN0ZkMW05UzFrSktjcUpONXR1ZGFubzZlckNWb3JqTitXNnpncU5D?=
 =?utf-8?B?TzRYclpTVVJJeDhVckoxTmErUDJ5WXRrdzM5YlEvK1J3RFh2aWtpakI1M1pY?=
 =?utf-8?B?bTBxUmNmQS9YbmFNVDFLbmlZY1lidktsK2F6bmxzL242YW1NV2ZXMVFUYnJp?=
 =?utf-8?B?ZDI1SGkxS2pIeURiTW5ZbE5uOHBWa0NkaEhMTk9OTi9IMmI1VWhxSU8vcGFI?=
 =?utf-8?B?Z1RQTkJ2QWZWSFB1Wm45TkFJYjE5Y1NDVzlGdmR6VlJDR1p4TDl2d2doRFJT?=
 =?utf-8?B?QmJuSllPV0h1ZHJMbU9FWXFVVmxFMk1yMEQvTjQ1SGVwSWtJZUI5N0MrcExa?=
 =?utf-8?B?R3pTc0tQOWdyRTdsd05Nb1d3clF2Q3B5ZXgvSWhMVEYxR2hzZi84SEVNNitj?=
 =?utf-8?B?b2N3ZnNoUFR1RGU4RHdHTWVmWE1UaUI2YWpEb0Y0Q3JxMmpyOGZoajRod0RN?=
 =?utf-8?B?K1cvTnZWN01oODRqekFyY2ZrbHVPTFYzVWNvTmZEczFmK1NIL0pzd25IdlVx?=
 =?utf-8?B?ME1wV21ySDA4MmE5V2VNTGJNaTJTVm42bWRjZndsUTluUFdNMjc1NXowVmVT?=
 =?utf-8?B?TGt5MzBDRXRrVWF1QjlUKzJ0NjNMdjFkL0ZQQ2E5dFJhZ0orbERWTTJ6aW1Y?=
 =?utf-8?B?UWFqRnBQVmx2aG9nVW03bjZlUjZYVldvQXZGdm1pVysxRmwySDhuOHh1N2tz?=
 =?utf-8?Q?o+AZKNqEXnzjZwa4TQwbb/Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmpndXZmaWxDd3BTSGVYdUxic1l5TXI0TE8vTGVRRUNNaTlMYUkvTVFSSDMv?=
 =?utf-8?B?TmdwM09LaEJXcVNXSUkxOW82dDJXcnRJRk1EMFhQN055c0hvUk1aeis1RXll?=
 =?utf-8?B?b1RkYWgrQmtVOHMyRytqQ05Pa1RGWVFreUE1MStYRW9oazFHdVFQeXd4eWJr?=
 =?utf-8?B?NWxkTWt3dUYvL2dGMTQ1VmJyazVMTkdsS1RPVWJsRmZmOC9BR21ISStzcGFT?=
 =?utf-8?B?VjUvQjQ0eE5uc2tCWW1HS1M2ekR5azdIRXA0dk5QaVpHMzJZelNwNXdqenpB?=
 =?utf-8?B?RU55dGU0Ti9ZSWNmUytMaHJYM2xEZ21xZGRTTEtKaE0yUklON09hL3N2MTVV?=
 =?utf-8?B?L0JqVGJEMlBKbFY1c085TjI3UklGTEZCNXY3ZmZMa2l3dUhNY0N0UG1Nd1F1?=
 =?utf-8?B?K2FUR0Q5anRxejFkNU5GZEVqelp1bVltY3UvZHBQR3hEaU9aamIxZ3EyMXZw?=
 =?utf-8?B?ekE4SGx3dmJpdmRmeU1SbW5VV2NUU25tTXVLN21pR1ZxdjRjRExNYXUrT2tm?=
 =?utf-8?B?Zm45V09MM1RId1pweXF6RlhBY3pwUllaYWNwTlM1aWZHZVhaRnZLb1M2aWJR?=
 =?utf-8?B?Q0t2U24xcjBIMThDM3dRcVRGU1ZicWhPNndGbWFuV2RlMndxUFVoSHE0S2li?=
 =?utf-8?B?bytvWExCOXhuMk0vQ2c5dmxzNHk2Y1lKOXRkQkpiZjNYak9kdHBRakxrMWYz?=
 =?utf-8?B?Nmh6ZVR5TVR2bUdVOThGRFZKYVFSczB6QTRrMXFGTXlLbi9BaGxod1RvaDMv?=
 =?utf-8?B?UWFPa0c1SFgyN1hOa09YemFVVmhrRG9jUE5BSjMzcTZFWXNEN3dpT29xVFp2?=
 =?utf-8?B?R2dxY1lGU0YyNys1V05IdkFldlNYcGhWLy90ekk4WVhPelBPQkl6UDdVVzlo?=
 =?utf-8?B?dGduUnZGVDJVRENNU2dTM3VXcEs2WnJ5Z3N3bGtaWW9PeTd2WEJOVXlpS1hN?=
 =?utf-8?B?K0M4amx0aUZVOE9hL0hObFo3bUNURGlXWVY2NVlTaXhDQnprdmdJSk9iaE9K?=
 =?utf-8?B?UitTSkhKNFA1Vll0VUpkMkJUZVdGZThtUGl0V2R5RXNEWk9sZ21BdGhTaTJY?=
 =?utf-8?B?amFwdXRUN2pZeVowZDR6TE9YKytpVW52ZVdaaGg0N2tieGFnQUluMGkrTE9C?=
 =?utf-8?B?M2E2cW5GcFA1RnRNU2ZvUXpSWW5keXdqdkhCQlowQkdtRDcvKytMQmdRQTVU?=
 =?utf-8?B?d3FIV1A4eVVTRmlpdGJtUDZMbFBRSDB0RSttdXJtdXlLSFBCQldRRWU1V2Iy?=
 =?utf-8?B?ZXBIMVFmRHpOeHMxcGl1SXRmZnV3SlhyQmYyUFVMNHVVMDVGdXU1VVZZWVNY?=
 =?utf-8?B?RUtocjRWVzJJMVlXTEUzUVJRVklrU0taUjN5WDFJNWEvS2NLS0hmemkra0NZ?=
 =?utf-8?B?Y0QwYUFYUUxEOXRXT1RUaE04T3U3Nm1yaTNTTjNrMnR2aWRIL1NRTnIreWp2?=
 =?utf-8?B?OUpKYXIwVW1jSTAyOWxBV0xBR1hPUzIzK0Uvb0VHVFRKWE1iLzJkaWJUSFFh?=
 =?utf-8?B?Q0pPZGxuaDI0eVFRa09HNUZjVGdwOVZ5QnJ2R1A3Mmg4L3UxMkdacGw3TkRT?=
 =?utf-8?B?cmR4QlJuVGdqV1VjT3NmcUVWbkhGcFFpd2hqYXp2NERWM3B0aEtiSDg0Zllp?=
 =?utf-8?B?ZkV0WHBVNjZyWUVJVGFuTjRUc3l5SEFGSFArTzcyTWRoZUF5V3RyY2NCZHc4?=
 =?utf-8?B?R3FqMENjc3k1S25jUWxIbHNEU0FpcHBxWVNKRWRRa2FWb2tWOGtSNEdCS2pS?=
 =?utf-8?B?Y05JeU9sNTJkcGFUNThralYraUNjNmI3YmJuR0FnTUdzN1hKb3RQSGNYeDRx?=
 =?utf-8?B?d3BNSGhiaC9nWHlaSHBlSXFBNmZDb3d5UHBZVE5wWW1XUkZ4RTZJUXBPZTZo?=
 =?utf-8?B?Qlhlb0UrZjgrcjlkclMxaVZWVHY2R25pRmxoTzc4OTY2bk9FMDQ0R0pYNjRO?=
 =?utf-8?B?ajVzRU5vT1lhZXBkT0hkV29qK1ZSRXN1dGsvVkR3TmVJRTRBZVRFRjkyNHNN?=
 =?utf-8?B?bVVuaURTMWVxUkhGbzIrQVZSUHh5RHJBazIrUE5xRkJFcGdTZzJwQU42OWlK?=
 =?utf-8?B?a0dYUkU5aWwrVEJXeUcreGliSzZhTXJFdDA4bDhLU0I2RmJQU2RYMFZYd3Ew?=
 =?utf-8?B?NllONWlWUGhPYlhHYXI0ZkJOOXdCZXJYaGhmblQ1YzlsY0VtQm9IVUswUnFT?=
 =?utf-8?B?OThUREErbEp1MGhYdVl2am1hZ1VoN0oyVGdRWmladVVOcjlxWDBzRWxOeGtl?=
 =?utf-8?B?NDRsK0NRZkJtbHcvL1RwSnFWaVZIbnhwQ3dhWGlDUXpXUm43R1oxZFNnVnhq?=
 =?utf-8?B?RmdTTkpIYmc3WVY5OHZ0QWVGMTBaWVFCckY3cGFBQ3RsNHR5bml1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d3958a-b849-46b2-fe05-08de541e4b1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2026 10:10:21.8694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4oRuTkDaWoXr2BnNDHAwBvkIZaV5mcoNIVjroyJPeoWPKaKgcR5qe/CC048zNoCKYcepLSm9Z7Y1xNu8r+z5Deildd+RxjrOIC9qMQ6eU7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6845
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
ay5vcmc+DQo+IFNlbnQ6IDE1IEphbnVhcnkgMjAyNiAwODoyNA0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDEwLzIyXSBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhcyxyemcybC1kdTogQWRkIHN1
cHBvcnQgZm9yIFJaL0czRSBTb0MNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDE1IEph
biAyMDI2IGF0IDA4OjQ4LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdy
b3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4gT24gV2VkLCAzIERlYyAyMDI1DQo+ID4gPiBhdCAxNDo0MiwgVG9tbWFzbyBNZXJjaWFpIDx0
b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gPiBPbiBXZWQs
IERlYyAwMywgMjAyNSBhdCAwOToyMzo1M0FNICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiA+ID4gPiA+IE9uIFdlZCwgTm92IDI2LCAyMDI1IGF0IDAzOjA3OjIyUE0gKzAxMDAs
IFRvbW1hc28gTWVyY2lhaSB3cm90ZToNCj4gPiA+ID4gPiA+IFRoZSBSWi9HM0UgU29jIGhhcyAy
IExDRCBjb250cm9sbGVyIChMQ0RDKSwgY29udGFpbiBhIEZyYW1lDQo+ID4gPiA+ID4gPiBDb21w
cmVzc2lvbiBQcm9jZXNzb3IgKEZDUFZEKSwgYSBWaWRlbyBTaWduYWwgUHJvY2Vzc29yDQo+ID4g
PiA+ID4gPiAoVlNQRCksIFZpZGVvIFNpZ25hbCBQcm9jZXNzb3IgKFZTUEQpLCBhbmQgRGlzcGxh
eSBVbml0IChEVSkuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gIC0gTENEQzAgc3VwcG9ydHMg
RFNJIGFuZCBMVkRTIChzaW5nbGUgb3IgZHVhbC1jaGFubmVsKSBvdXRwdXRzLg0KPiA+ID4gPiA+
ID4gIC0gTENEQzEgc3VwcG9ydHMgRFNJLCBMVkRTIChzaW5nbGUtY2hhbm5lbCksIGFuZCBSR0Ig
b3V0cHV0cy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBZGQgdGhlbiB0d28gbmV3IFNvQy1z
cGVjaWZpYyBjb21wYXRpYmxlIHN0cmluZ3MgJ3JlbmVzYXMscjlhMDlnMDQ3LWR1MCcNCj4gPiA+
ID4gPiA+IGFuZCAncmVuZXNhcyxyOWEwOWcwNDctZHUxJy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IExDREMwLzEgYnV0IGNvbXBhdGlibGVzIGR1MC9kdTEuLi4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+
IFdoYXQgYXJlIHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVuIERVMCBhbmQgRFUxPyBKdXN0IGRpZmZl
cmVudA0KPiA+ID4gPiA+IG91dHB1dHM/IElzIHRoZSBwcm9ncmFtbWluZyBtb2RlbCB0aGUgc2Ft
ZT8NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb25zIGFyZSBkaWZm
ZXJlbnQ6IHRoZXNlIGFyZSB0d28gZGlzdGluY3QgaGFyZHdhcmUgYmxvY2tzLg0KPiA+ID4gPg0K
PiA+ID4gPiBCYXNlZCBvbiB0aGUgYmxvY2sgZGlhZ3JhbXMgc2hvd24gaW4gRmlndXJlcyA5LjQt
MiAoTENEQzEpIGFuZA0KPiA+ID4gPiA5LjQtMSAoTENEQzApLCB0aGUgb25seSBkaWZmZXJlbmNl
IGNvbmNlcm5zIHRoZSBvdXRwdXQsIGJ1dCB0aGlzDQo+ID4gPiA+IHZhcmlhdGlvbiBpcyBpbnRl
cm5hbCB0byB0aGUgaGFyZHdhcmUgYmxvY2tzIHRoZW1zZWx2ZXMuDQo+ID4gPiA+IFRoZXJlZm9y
ZSwgTENEQzAgYW5kIExDREMxIGFyZSBub3QgaWRlbnRpY2FsIGJsb2NrcywgYW5kIHRoZWlyDQo+
ID4gPiA+IHByb2dyYW1taW5nIG1vZGVscyBkaWZmZXIgYXMgYSByZXN1bHQuDQo+ID4gPiA+DQo+
ID4gPiA+IEluIHN1bW1hcnksIGFsdGhvdWdoIG1vc3Qgb2YgdGhlIGludGVybmFsIGZ1bmN0aW9u
cyBhcmUgdGhlIHNhbWUsDQo+ID4gPiA+IHRoZSB0d28gYmxvY2tzIGhhdmUgb3V0cHV0IHNpZ25h
bHMgY29ubmVjdGVkIHRvIGRpZmZlcmVudCBjb21wb25lbnRzIHdpdGhpbiB0aGUgU29DLg0KPiA+
ID4gPiBUaGlzIHJlcXVpcmVzIGRpZmZlcmVudCBoYXJkd2FyZSBjb25maWd1cmF0aW9ucyBhbmQg
aW5ldml0YWJseQ0KPiA+ID4gPiBsZWFkcyB0byBkaWZmZXJlbnQgcHJvZ3JhbW1pbmcgbW9kZWxz
IGZvciBMQ0RDMCBhbmQgTENEQzEuDQo+ID4gPg0KPiA+ID4gSXNuJ3QgdGhhdCBtZXJlbHkgYW4g
U29DIGludGVncmF0aW9uIGlzc3VlPw0KPiA+ID4gQXJlIHRoZXJlIGFueSBkaWZmZXJlbmNlcyBp
biBwcm9ncmFtbWluZyBMQ0RDMCBvciBMQ0RDMSBmb3IgdGhlDQo+ID4gPiBjb21tb24gb3V0cHV0
IHR5cGVzIHN1cHBvcnRlZCBieSBib3RoIChzaW5nbGUgY2hhbm5lbCBMVkRTIGFuZCA0LWxhbmUg
TUlQSS1EU0kpPw0KPiA+DQo+ID4gRHVhbCBMVkRTIGNhc2UsIGRvdCBjbG9jayBmcm9tIExDREMw
IGlzIHVzZWQgaW4gYm90aCBMQ0RDJ3MuDQo+IA0KPiBGb3IgdGhlIHNpbmdsZSBkdWFsLWNoYW5u
ZWwgTFZEUyBvdXRwdXQgb24gTENEQzAsIG9yIGZvciB1c2luZyB0d28gaW5kZXBlbmRlbnQgTFZE
UyBvdXRwdXRzIG9uIGJvdGgNCj4gaW5zdGFuY2VzPyBIb3cgaXMgdGhpcyBoYW5kbGVkPw0KDQpE
dWFsLWNoYW5uZWwgTFZEUyBvdXRwdXQgb24gTENEQzAsIHdlIHVzZSB0aGUgZGF0YSBmcm9tIExD
REMwLg0KDQpXZSBoYXZlIHRoZSBmb2xsb3dpbmcgdXNlIGNhc2VzOg0KDQpTaW5nbGUtbGluayhj
aDAgb25seSk6DQogIFRoaXMgbW9kZSBvdXRwdXRzIHRoZSBpbWFnZSBkYXRhIG9mIExDREMwIHRv
IExWRFMgKGNoMCkuIEluIHRoaXMgbW9kZSwNCiAgTFZEUyAoY2gxKSBpcyBub3QgdXNlZC4NCg0K
U2luZ2xlLWxpbmsoY2gxIG9ubHkpOg0KICBUaGlzIG1vZGUgb3V0cHV0cyB0aGUgaW1hZ2UgZGF0
YSBvZiBMQ0RDMSB0byBMVkRTIChjaDEpLg0KICBJbiB0aGlzIG1vZGUsIExWRFMgKGNoMCkgaXMg
bm90IHVzZWQuDQoNClNpbmdsZS1saW5rKDJjaCk6DQogIEluIHRoaXMgbW9kZSwgdGhlIGltYWdl
IGRhdGEgb2YgTENEQzAgaXMgb3V0cHV0IHRvIExWRFMgKGNoMCkgYW5kIHRoZQ0KICBpbWFnZSBk
YXRhIG9mIExDREMxIGlzIG91dHB1dCB0byBMVkRTIChjaDEpLg0KICBTaW5jZSBMVkRTIChjaDAp
IGFuZCBMVkRTIChjaDEpIGFyZSBub3Qgc3luY2hyb25vdXNseSByZWxhdGVkLCB0aGV5DQogIGNh
biBiZSBvdXRwdXQgaW4gZGlmZmVyZW50IGltYWdlIGZvcm1hdHMgYW5kIGNhbiBiZSBvcGVyYXRl
ZCBhc3luY2hyb25vdXNseS4NCg0KU2luZ2xlLWxpbmsoTXVsdGkpDQogIEluIHRoaXMgbW9kZSwg
dGhlIGltYWdlIGRhdGEgb2YgTENEQzAgaXMgb3V0cHV0IHRvIGJvdGggTFZEUyAoY2gwKSBhbmQN
CiAgTFZEUyAoY2gxKS4gTFZEUyAoY2gwKSBhbmQgTFZEUyAoY2gxKSBvcGVyYXRlIHN5bmNocm9u
b3VzbHkuDQoNCkR1YWwtbGluazoNCiAgSW4gdGhpcyBtb2RlLCB0aGUgaW5wdXQgaW1hZ2UgZGF0
YSBmcm9tIExDREMwIGlzIHNlcGFyYXRlZCBpbnRvIEV2ZW4gcGl4ZWxzIGFuZA0KICBPZGQgcGl4
ZWxzLCBhbmQgdGhlIG91dHB1dCBpcyBkaXN0cmlidXRlZCB0byBMVkRTIGNoMCBhbmQgY2gxLg0K
DQoNCj4gRG9uJ3QgeW91IG5lZWQgYSBjb21wYW5pb24gcHJvcGVydHkgdG8gbGluayB0aGVtIHRv
Z2V0aGVyPw0KDQpZZXMsIFdlIHVzZSBjb21wYW5pb24gcHJvcGVydHkgZm9yIER1YWwgY2hhbm5l
bCBMVkRTKER1YWwtTGluaykgdXNlIGNhc2UuDQoNCj4gDQo+IElzIHRoaXMgc2ltaWxhciB0byBk
dWFsLWNoYW5uZWwgTFZEUyBvbiBSLUNhciBFMyBhbmQgUlovRzJFPw0KDQpZZXMuDQoNCj4gT24g
dGhlc2UgU29DcyB3ZSBoYXZlIGEgc2luZ2xlIGNvbWJpbmVkIGRldmljZSBub2RlIGZvciBhbGwg
RFUgaW5zdGFuY2VzICh3aGljaCBjb21lcyB3aXRoIGl0cyBvd24gc2V0DQo+IG9mIGlzc3Vlcywg
ZS5nLiBSdW50aW1lIFBNIGFuZCBDbG9jayBEb21haW4gaGFuZGxpbmcpLg0KDQpCdXQgaW4gb3Vy
IGNhc2UsIGl0IGhhcyAyIHNlcGFyYXRlIGluZGVwZW5kZW50IExDREMgSVAncyB0byBhbGxvdyBh
bGwgdGhlIHBvc3NpYmxlIG91dHB1dHMgYXMgbWVudGlvbmVkIGFib3ZlLg0KDQo+IA0KPiA+IFN0
YW5kYWxvbmUgTFZEUyBhbmQgRFNJIHRoZSBwcm9ncmFtbWluZyBmbG93IGlzIHNhbWUuDQo+IA0K
PiBPSy4NCj4gDQo+ID4gPiBPZiB0aGVyZSBhcmUgbm8gc3VjaCBkaWZmZXJlbmNlcywgYm90aCBp
bnN0YW5jZXMgc2hvdWxkIHVzZSB0aGUgc2FtZSBjb21wYXRpYmxlIHZhbHVlLg0KPiA+DQo+ID4g
VGhlbiB3ZSBuZWVkIHRvIHVzZSBhIHByb3BlcnR5IGNhbGxlZCBkaXNwbGF5LWlkLCB0byBkZXNj
cmliZSB0aGUNCj4gPiBzdXBwb3J0ZWQgb3V0cHV0IHR5cGVzIGluIGJpbmRpbmdzLCByaWdodD8/
DQo+ID4NCj4gPiBEaXNwbGF5LWlkPTAge0xWRFMsIERTSSkNCj4gDQo+IExWRFMgdHdpY2U/DQoN
CkxDREMwIHN1cHBvcnRzIERTSSBhbmQgTFZEUyAoc2luZ2xlIG9yIGR1YWwtY2hhbm5lbCkgb3V0
cHV0cy4NCg0KPiANCj4gPiBEaXNwbGF5LWlkPTEge0xWRFMsIERTSSwgRFBJKQ0KDQpMQ0RDMSBz
dXBwb3J0cyBEU0ksIExWRFMgKHNpbmdsZS1jaGFubmVsKSwgYW5kIFJHQiBvdXRwdXRzLg0KDQo+
IA0KPiBOb3QgbmVjZXNzYXJpbHk6IGlmIHRoaXMgaXMgcHVyZWx5IGRpZmZlcmVudCBTb0MgaW50
ZWdyYXRpb24gcGVyIGluc3RhbmNlLCBkZXNjcmliaW5nIGFsbCBwb3NzaWJsZQ0KPiBvcHRpb25z
IGlzIGZpbmUuDQo+IA0KPiBCdXQgSSdkIGxpa2UgdG8gZGVmZXIgdG8gTGF1cmVudCBmb3IgdGhl
IGRldGFpbHMuLi4NCg0KT0suIEdsYWQgdG8gaGVhciBmcm9tIExhdXJlbnQncyBpbnB1dCBmb3Ig
dGhpcyBhbmQgWzFdDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW5lc2Fz
LXNvYy9jb3Zlci4xNzY0MTY1NzgzLmdpdC50b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5j
b20vVC8jbTI5MWYwMmEwZWUwNzRkNTE1OTcwNWIxOWQyZDI5ZmZhNDFlZjRlYWENCg0KDQpDaGVl
cnMsDQpCaWp1DQo=
