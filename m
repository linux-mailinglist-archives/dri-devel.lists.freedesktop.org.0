Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07DB26513
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 14:11:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450A910E870;
	Thu, 14 Aug 2025 12:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="a4V3D00m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1669F10E870
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 12:11:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcTE603Accp2BwZ6o50Z9FXibhj8nLoeKcOZDXLHY0lMXGBwsZHzrUdSSy5cNZoK+eFZHYo2ikP+Nuxn8yRS2zp6Ml5cwhkMpmpWFbEfCwwurGpZavISvmt1vSnKQqKGNTUcXG6iiBAVg0fGHQqXoEQgUqyEA+8t0J5zAZ86jg3trd5p67CoSfM4PTQMi7GvfnPh4WcziJXEiyfhUwsXEbl9PUcsyHXIQFhgza8pUNq3l1Hb4pW801zpFrrOcGMIpZXd0Xc/FRJM02LG/sR0mgigSZQVOVNjYGtuGGAnYyxmrqrvGeAjYQP+x0odQLXEpbZnB7LP4ZdBnt74CUOAkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vnmKoSJbsHifaHgBH4TzYBQYavo2/W2P5qTCUd7xanI=;
 b=N9jgdG0sJ4knTdx2zLQsZw+b9HIfWN1obTrreISSa+fAdJk03rBh15z7Gdc7ooouzm3MxKlPCY9h1PY4tuef1vcskpg8G+yLC0hx17HtZY3H+XH2K82GxhBugMTyJL+43tpNp4pDa1UrXGVTFxaSS0CK12OvwiXkHvoYomnRFDYjP4sJH1J3NHzg5Fj/uRoqtGqI1iZ5pOfQaOox4dz96EGBtxbl4Ywy0WVCK0npevdbWbwjElCaqt2Q8ZbDwSp7uNrcD0LS6TJBqGb9jgLJ9cu/P2K4OCp9uCxSUeOv6cXPO21KCbWdmWqsqIDXHCq10bgFA7IClQc0da/08cxa6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnmKoSJbsHifaHgBH4TzYBQYavo2/W2P5qTCUd7xanI=;
 b=a4V3D00mp1mP4uWqf8py3wWm+aI7vgvgboDpGXnO+wE7DCH+zQwJDsDDbOIxw7vHJ+AhCYvjnZKKgBFgZVkOpSuZCtc6LPZUzLXWDeT+2O+CxBAckWmX1FeyMVSUf8hBLxiEn4iQTL5diiWuqHhOFDuhDx/NJbLCE84fA9FG9O0=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OS3PR01MB6070.jpnprd01.prod.outlook.com (2603:1096:604:d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Thu, 14 Aug
 2025 12:11:43 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%3]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 12:11:39 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: geert <geert@linux-m68k.org>, Biju Das <biju.das.jz@bp.renesas.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Hien Huynh
 <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHb8RPtwZ8i4xlUvk2VQsSahgwNBLQrIIkAgAAw8rCANo/tAIAAGWgAgABJ+TA=
Date: Thu, 14 Aug 2025 12:11:39 +0000
Message-ID: <OS3PR01MB8319C2E2E295E18B82C6BAE08A35A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-2-chris.brandt@renesas.com>
 <TY3PR01MB1134628601112EF2B32F3358D8648A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <OS3PR01MB8319CD026C1E27CD7FB736F28A48A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <TY3PR01MB113468C7F195036B28A70E9508635A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdVEJO1rNACo_LMLUC=NFAZJzsY5zwR0a6to=sf2QBNw9g@mail.gmail.com>
In-Reply-To: <CAMuHMdVEJO1rNACo_LMLUC=NFAZJzsY5zwR0a6to=sf2QBNw9g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OS3PR01MB6070:EE_
x-ms-office365-filtering-correlation-id: 32e5bd85-2eb2-442b-cf11-08dddb2bb968
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZG1uaVR3S0lSSnVXYTA1dHUyNXRqWlIzQngrMjZCenp2UzdoeW05dVlPRjR4?=
 =?utf-8?B?WFk1L1MvSkExMW1lZ1NYdCtPY3V0WHZCQ2JYUkZhclJMb0h6OVJDMjdFYjZF?=
 =?utf-8?B?bDJuUWljcjc2d1pUSXJXOEJoTGJwNzRRRDNnK3JHblN1VmtwQlZQNWg0YUsx?=
 =?utf-8?B?M2twR2NGM3puMVNVcGZyQ0tuL21NUFlYV1JLU0k0d0dUT1ZtSXBSaTZKMGJj?=
 =?utf-8?B?TTN1MWd6Q2lyamFDaWIrRXU0dUlkVVdISGRCUkk4VGQvVWNZR1NuNy9UN3Nk?=
 =?utf-8?B?VmNqd3RIclVBdjVCREoyd01OdDVZaXIyT2wrMWI5TGpUTUFqTnJ1RVk4N3hq?=
 =?utf-8?B?WTlSR0pNYVBvejdIVW9aV0FWRVZPbVZxWjlOYnRnWlJ4eVNtWTk3MURNOGNH?=
 =?utf-8?B?NjREL3VDQ3dLdy9hc25nMlV3RHVjWEZhZjJucHNkaTYrMkQwS1dkSDQxZkxG?=
 =?utf-8?B?Zm53clQwaS9YYW9CSWdTT2pyY1B0RVRPUzhYTXBRekczTWowdnZ4MGZsamd6?=
 =?utf-8?B?VmhkcW5wb1lCMHB2TmpCVlJHM0ZzOFNPellYR3V3aVVGY2o2bmZydkhQYWdT?=
 =?utf-8?B?MHN4M3FMOHkrT0k1MWVMV2tKSkNpeFlFU2xrcHlSeWhEaStieHNPWFFxaE9z?=
 =?utf-8?B?ZzY2b01OL1pZTWIvazdIb0o4amNzYy9xK2lzQXFTMCtOU2N2MDZUblpsQytm?=
 =?utf-8?B?ZU0zYklqWCtnLzVNTEtJZy9mWWdGR2dIcXdaUkRQL3U1UHArOFJpWFYzdDc1?=
 =?utf-8?B?M0FudGljUkJWYk40azl5M2F2bjIzTjRQOFRyamtyK1BLMFVLWHExRXVNR1A4?=
 =?utf-8?B?T3hpcVJlbC9GVFVlRGkvaGFaeVI2cnhqNUkrbmVIZmQydFU1UGxDUWhBQkZi?=
 =?utf-8?B?OXgvS2tvUlpBSjdqYVJkVkZaLzVCbHdCVnI0cUlHWm0xVDc0T1dsbGpoaHBS?=
 =?utf-8?B?dXRPL2ZTUDFNM0QyeXZVT01kem00cDhCMktrZGxpMnpVd1JqMDhkWWl2dnNM?=
 =?utf-8?B?aFJNdFVhK2hxSDBqcUdnTkRtK1pLLzQ1T1FuQnIwYWg5QjUxUFd1MnNmemdF?=
 =?utf-8?B?ajg4SmRVa1ZHMzVzM3dSQlNRbVlKeFpPRXJyZStkbFc0S3dNSFJmc2tUQk9J?=
 =?utf-8?B?TDIvZ0s4K3U3UDczY2l2aDNUU1NrQ1JURjFMdFJjVG8yL3ZML2tKWGRtc05D?=
 =?utf-8?B?Q2RoYm1ndTBMSzBMK25OU2pMdWQxTU9FMnoxcVpKL2Nna0VMR2VOTGx2aVZj?=
 =?utf-8?B?aTdkSFZIbFhHMytxYTJXdmdsenpucG5tZVE5eWViV1JTN3dXSFVMdWtKNER4?=
 =?utf-8?B?SWNwNUhPS3hsTnlEdDB6WStlRjNBRURLOXgza01od2g5SEZTTDlYL2FyRXNu?=
 =?utf-8?B?NzVBZWc3enlIdHI2QkxVR29rTnhVWHZRc2pSY3ZYUVA2ZTNTRUNQSjBQSCtk?=
 =?utf-8?B?WnF2WEluNjdjdnNMWVNrQ3lzeTd0bk1YcS91ODJBbFZ4c29MT0lSZGkwUlJE?=
 =?utf-8?B?N0JTRU5YZGUwYWJWRzU2aHFwTGRLWjhZSkIyUmJuOXpQUXVDczl5TFIvV3lI?=
 =?utf-8?B?T1VMeXVGZnFtMERpZVhHL0w4TjNPdEtIQ2loa1dvUnNXdG5MZEQ2cnRhRDM4?=
 =?utf-8?B?cHVYU3JKWGV6OWtJeC9sZ3V5amN5U2JIRHlIUkN6WDhDblN6Y3JaMnJ5M01o?=
 =?utf-8?B?Sk45VVBWQzgraXQ5bWdTZUxVM1VmaXlORno0TTRSVzdCek84K215cjU2RmM2?=
 =?utf-8?B?WFk3cENmaGI2ZUwvSjFGQ3MxbFFxYVhad0xSQUtzTllMSkZxaXN0K1lXdUlp?=
 =?utf-8?B?aTVXbHBpaUxsTTJVV1paMjZPb1oxMjgwZ3cxeDBNdnFwTjRKUVo0NkZ0T2da?=
 =?utf-8?B?S2xFNFg2WkhYY3A0bnEzbUJFRDZJbFFhbm53akFadXhKMEphckdrTDlrZzJ0?=
 =?utf-8?B?VzVjVXRxU051TkQ4MitpZTlVYm9sTkdTOVR0MUZuN01GaDBiK29jZXhyeDNP?=
 =?utf-8?Q?bB4J5Ts6GdKVWlWMiPXtDYl/XNpdoo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0lXcDFCaCt4S0tNU25jUTg5THM5VC9LcjQvaW1wbVZ3NXZ2bmR2bEZxNTJF?=
 =?utf-8?B?cVdDbXVJekk0UGRwTmtrUi9lK08yMFRFRmU4WUovVmtlVnVHTHh4N3Ixbk9Q?=
 =?utf-8?B?Zzh5TGE0aGRYODJIK1A5L1JCTXNRcVpvd1YrSHRVM3hqZGRZeTRKUUNEcExx?=
 =?utf-8?B?OEpXazJqZlQrWk9ldUZzVGNqYWtNd3RlVGpYZHVCay80d2llT0JyVjJNZVlu?=
 =?utf-8?B?MmQza1d6Z0h4bHVlNVRxU3pNdDVDSlY4WURvZ1JtUVpWQTRrajZFekh6bXBD?=
 =?utf-8?B?TG1ReHczV3g3aUloQUY0MG05MDM2K1dSeDdHcFBxR3JYd3FMRERKR1hxOHJU?=
 =?utf-8?B?M0NBd1FhZkRDZElOenhDZUhoVVlsTTFURUFQNVJUVUowQ3k2bmYyQ3lkZGdE?=
 =?utf-8?B?ZUsrRmsyTzlKNUl4cGMrS3ZtSFMvRmZ5VjF4QStJaVNKUEJOZTBnZ2diYjc3?=
 =?utf-8?B?QzNmYzBhd3JxdHFEaC9qaTROeDhzN2dWSGVSeVYzTG1JZUYwVGliZmhYbllG?=
 =?utf-8?B?Q0JiSkk0aFRONUdlUXBmVUowaFFSTllBdEIwR1NqVkw5amU0d3ZJdXY4Q0d5?=
 =?utf-8?B?VFZzWjRpc0QwaXFTL0FTcUJrNVZkVk1YSnBhSjZIL3k2NUtNSEtIK0VKa0VH?=
 =?utf-8?B?MisyUmxnaGVVZ3lTNzJ5TVZ1UzAvT1NiaHNuOW9YOFJxV3pMK0ZQWEZ3R3RD?=
 =?utf-8?B?N0tpUEtSWEthekFMUTBHK2NUOVlCWUh3VmwwWTRuaS9pK09oMXZ3aTRpK0dH?=
 =?utf-8?B?RGE1MC9ySE1RbjFpcDRxTzk0alM4TGtDM0lhN2sxM2RUK1k4RDIydkc5ZWQ3?=
 =?utf-8?B?bHpmN3VHQXY1TGpkV01TZDVmK2hPM1R0ZG5wWXJrM0NCNEt3QTE2cUtwUG85?=
 =?utf-8?B?T2gxa0g5TlFzSHdUb2VJVEZ6WmFEeU9FYTZNZDlDeWZOdHdVeTlDbzk4Wi82?=
 =?utf-8?B?anNBYUhxWmlucmJnY0t3czdwQk1GZ0ZtV2QvTEZNWGdQQkprSS8xd3duODk5?=
 =?utf-8?B?R0JKTWQxL0h2c0p0UmN5d2FaK1MzL3VsYW1nL3QzTWphVWVPYTBFZ2pNNVdK?=
 =?utf-8?B?STVPVjcyRGpLYmJTbzFzQVJSYUtrL1NGc3gvYUNWWlhhUlRrdis5K09QRElH?=
 =?utf-8?B?eUJ5ODZTLzh3Y01DK1YrUlJFUnJtUEZoYjdtM1U3UE5ZUDlwUjNPTzl6aWF4?=
 =?utf-8?B?cEY5WExXbUY1TWQyVk8yRHVmZnliWERiSVQ4Q0hxZVN2SHBibGxXTDJZaVJx?=
 =?utf-8?B?aTBHOW9DTHM1TnJwdjE3ZWZNQ3k4cU51TW5vL0NoWEZmUVg1SWk0SldKM1VO?=
 =?utf-8?B?eG12dllRRlVJYWFnNnh5T0F5RzRJVmJGc0RZWldaTlJhYXhiSXpDeERrbklL?=
 =?utf-8?B?UE1XcE90NWF3UjZVcDNQck5Vb2tCdVdJQXpadlhZWnNyUGxKdzI0TUJWVnJM?=
 =?utf-8?B?Z3NQcldlWVJXWTRjYVBHSmNnOWd4UTBtYUxqY3ZVNW5jSWtoYWhzWFFVTjM2?=
 =?utf-8?B?aHpSNERpUG5vbnRuc0JpdDZLUDh1eDZLaTZsbUw1bzB1Ump4cTRLaVQ0MDJ6?=
 =?utf-8?B?TmxCRGJyL1ZnZXJLZ2ZKaEdnZ3RLSUdHcFI0dXlGSENDeUJWdkpUMXZValpu?=
 =?utf-8?B?Rit2VitCcXNpUFk4SnhtcmVqYW9ZdzNaYVZqajd5VUlScW5kd3FpeEQ0VmQx?=
 =?utf-8?B?d0RzSlNBdGNYTzJodEVxZmp1R3lWdWJTY2FYdkIwdXF3YVJ4RllGRzdFNUsy?=
 =?utf-8?B?a21IR2dNOTFRNSs5LzJpNTNWYUFsTDl0VzZoQnVGT0ZVLzhJWFdOVzJnQmdz?=
 =?utf-8?B?RmZMdEFiV2hoWWZrdVpwUWU0czh1NDkvcE5TRkYyNlhtVS9NT1ViNHNwUTMw?=
 =?utf-8?B?b0kybEZxUW94UGRHRjV5SHhvNVlhT0JFZnE2UXZOSkVrbGdFVHBDUk9nUjJy?=
 =?utf-8?B?MzhhdVZ5cUpFbkt1b29hODFMMG80WGxsVWxRdW9ldk9USk11MForQjRscUtD?=
 =?utf-8?B?cDNwcnFMbWY0QmdTaTAxQjZCSjQ4VXczVUM3QWdlQ2g2amloZ3IyMStFMTVO?=
 =?utf-8?B?MXRYM3FMckVqZXVGM1RLb0NhUlFIbjhLbVA5cmlna1owSVA0WkNsb3ljR3BH?=
 =?utf-8?Q?IgvoPk4Baae1yGVwUmTpVxZUa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e5bd85-2eb2-442b-cf11-08dddb2bb968
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 12:11:39.6600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4xFGXMkaggVBo5WCdgjNu9lpI0S+wK8J1cAVlt+zJhtQyAuE4pBcFfh8dycX6B0LaWO/WInG+7q2fP13mKLjQNV7/CKjKvBlxseUg2aUZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6070
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

SGkgR2VlcnQgYW5kIEJpanUNCg0KPiBZb3UgYXJlIG5vdCByZXF1aXJlZCB0byBmaXggY2hlY2tw
YXRjaCB3YXJuaW5ncyBvciBlcnJvcnMgaWYgeW91IGhhdmUgYSBnb29kIHJlYXNvbiB0byBkbyBz
by4gIEluIHRoaXMgY2FzZSwgSSBzZWUgbm8gcmVhc29uIGZvcg0KPiB0aGUgcGFyZW50aGVzZXMg
KGl0IGlzIG5vdCBhIHZlcnkgY29tcGxleCBleHByZXNzaW9uKSwgc28gcGxlYXNlIGRyb3AgdGhl
bS4NCg0KT0suIEdvb2QgdG8ga25vdyENCg0KSSB3YXMgd29ya2luZyBvbiBhbm90aGVyIHByb2pl
Y3QsIGJ1dCBzdGFydGluZyBuZXh0IHdlZWsgSSdtIGdvaW5nIHRvIGJhY2sgdG8gd29ya2luZyBv
biBmaXhpbmcgdXAgdGhpcyBkcml2ZXIuDQoNCkFzIEJpanUgbWVudGlvbmVkLCB0aGUgUExMIHNl
dHRpbmdzIGhhdmUgZGlmZmVyZW50IHJlc3RyaWN0aW9ucyBkZXBlbmRpbmcgb24gaWYgTUlQSSBv
ciBEUEkgaXMgYmVpbmcgdXNlZC4NClNvLCBzb21laG93IHRoYXQgYWxsIGhhcyB0byBiZSBzb3J0
ZWQgb3V0ICh0aGUgY29ycmVjdCB3YXkpLg0KDQpBcyB1c3VhbCwgdGhlIGNoaXAgZGVzaWduZXJz
IG1ha2UgYSBzaW1wbGUgdGFibGUgaW4gdGhlIGhhcmR3YXJlIG1hbnVhbCB0aGF0IGJlY29tZXMg
ZGlmZmljdWx0IHRvIHNhdGlzZnkgaW4gc29mdHdhcmUuDQoNCg0KQ2hyaXMNCg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51
eC1tNjhrLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDE0LCAyMDI1IDM6MzkgQU0NClRv
OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQpDYzogQ2hyaXMgQnJhbmR0
IDxDaHJpcy5CcmFuZHRAcmVuZXNhcy5jb20+OyBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0
ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJp
cGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRl
ciA8c2ltb25hQGZmd2xsLmNoPjsgSGllbiBIdXluaCA8aGllbi5odXluaC5weEByZW5lc2FzLmNv
bT47IE5naGlhIFZvIDxuZ2hpYS52by56bkByZW5lc2FzLmNvbT47IEh1Z28gVmlsbGVuZXV2ZSA8
aHVnb0BodWdvdmlsLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtY2xrQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
U3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGNsazogcmVuZXNhczogcnpnMmw6IFJlbW92ZSBEU0kg
Y2xvY2sgcmF0ZSByZXN0cmljdGlvbnMNCg0KSGkgQmlqdSwNCg0KT24gVGh1LCAxNCBBdWcgMjAy
NSBhdCAwODowOCwgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPiBGcm9tOiBDaHJpcyBCcmFuZHQgPENocmlzLkJyYW5kdEByZW5lc2FzLmNvbT4NCg0KPiA+
ID4gPiArIC8qIElmIGZvdXR2Y28gaXMgYWJvdmUgMS41R0h6LCBjaGFuZ2UgcGFyZW50IGFuZCBy
ZWNhbGN1bGF0ZSANCj4gPiA+ID4gKyovICBpZiAocHJpdi0+bXV4X2RzaV9kaXZfcGFyYW1zLmNs
a3NyYyAmJiAoZm91dHZjb19yYXRlID4NCj4gPiA+ID4gKzE1MDAwMDAwMDApKSB7DQo+ID4gPg0K
PiA+ID4gQ2hlY2sgcGF0Y2ggaXMgY29tcGxhaW5pbmc6DQo+ID4gPg0KPiA+ID4gQ0hFQ0s6IFVu
bmVjZXNzYXJ5IHBhcmVudGhlc2VzIGFyb3VuZCAnZm91dHZjb19yYXRlID4gMTUwMDAwMDAwMCcN
Cj4gPiA+ICMxNDY6IEZJTEU6IGRyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmM6NjQ4Og0K
PiA+ID4gKyAgIGlmIChwcml2LT5tdXhfZHNpX2Rpdl9wYXJhbXMuY2xrc3JjICYmIChmb3V0dmNv
X3JhdGUgPiANCj4gPiA+ICsxNTAwMDAwMDAwKSkgew0KPiA+DQo+ID4gSSBzYXcgdGhhdC4uLmJ1
dCBJIHRob3VnaHQgdGhlICggKSBtYWtlcyBpdCBhIGxpdHRsZSBlYXNpZXIgdG8gcmVhZC4NCj4g
Pg0KPiA+IEJ1dCwgd2hhdCdzIHRoZSBnZW5lcmFsIHJ1bGUgaGVyZT8gTWFrZSBjaGVja3BhdGNo
IGNvbWUgb3V0IHBlcmZlY3Q/DQo+ID4gV2hhdCdzIHlvdXIgdGhvdWdodHM/DQo+DQo+IEkganVz
dCByYW4gY2hlY2sgcGF0Y2ggYW5kIGl0IGNvbXBsYWluZWQgdGhpcy4NCj4gSSBhbSBsZWF2aW5n
IEdlZXJ0IHRvIGNvbW1lbnQgb24gdGhpcy4NCg0KL21lIGNoaW1lcyBpbiA7LSkNCg0KWW91IGFy
ZSBub3QgcmVxdWlyZWQgdG8gZml4IGNoZWNrcGF0Y2ggd2FybmluZ3Mgb3IgZXJyb3JzIGlmIHlv
dSBoYXZlIGEgZ29vZCByZWFzb24gdG8gZG8gc28uICBJbiB0aGlzIGNhc2UsIEkgc2VlIG5vIHJl
YXNvbiBmb3IgdGhlIHBhcmVudGhlc2VzIChpdCBpcyBub3QgYSB2ZXJ5IGNvbXBsZXggZXhwcmVz
c2lvbiksIHNvIHBsZWFzZSBkcm9wIHRoZW0uDQpUaGFua3MhDQoNCkdye29ldGplLGVldGluZ31z
LA0KDQogICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KDQotLQ0KR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZw0KDQpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
