Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F374BFE9E1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 01:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0927910E15A;
	Wed, 22 Oct 2025 23:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="BpaqJ6iB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132DB10E15A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 23:56:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6/0bloE1LLDdaFiiho7I/0kBlDAayCd8w2jcq6W+IHYLDyuXOzj3/H+ACCYIaV2ThE1RxupaL4LgVcFcEfuF9RQ8/7UBRF4hgukae2rvsXXgvajqmEM7jNq+IJBkj10ZAVPOuwCOTv5L1Z7drtjTLXni7N2jcvcTIOp0kPd7K6RAN0k1/UYKa1lGtUDGO1s+6QKAAgUINluZBdtE2ZZL7lZkEf4wpgZkMCX+5ev0CP9FZaDNNRh1tu+XAyh3F07w2HfNk16MKH+x10WRWnh80zWtILb9JYt+hI5aFprsKQj5OA5cnx0e7sqPsMc6IqTdgayM2c6WcwqeHLTuBITiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkZCCycwLtfoJi0WdoRLDfcgPA3MNZ/tadwLL8GOiYA=;
 b=c7mV34oW9Hh4YhDE3IPmGU6QhabiVk/jY6iF0pVUY+RNJ7YORkHrZ9qOpAisjFxUOe1nOZ+KBgqvJcjtYR8BuMHv3/xOYfhN3gPAsNux8XmOYDiuXrOHPT1BhflFwcRwHgSa1d+VqbUqqIERR8gTk38Y/uR6JQTklEumxnPzAlYTQbvK0E1bmX90ox8JjdefZ+UfOtcE+PTuqXvGFUtT36cNnG3rfmvPu4GjUrzqa22EPNrnstvcBYURzmkJwf9MDbacpRoHRtwAYsX8eHwgN3pssKvn/ecERy7PLOJbnknTkCcJlGGyYjN0bA0rYRAGgI8ty8IbL9weoKshVJTHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkZCCycwLtfoJi0WdoRLDfcgPA3MNZ/tadwLL8GOiYA=;
 b=BpaqJ6iBvZIdVuGWTo0j6fH24Wn7SPQtL+4iadGrOC1xHEaQonKJKPlUJx8y8oQ42pvS6ecZOGAy8mNLF8EGOv3+8y/tyR2wltJgpdHYEiFSfz7S6tWg+rGpfkXzbb7QnhWLWRuAfmgsrzbapwnC0AzmmRKojQ5rNYgRcFeu5zc=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by OS3PR01MB10170.jpnprd01.prod.outlook.com (2603:1096:604:1e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.10; Wed, 22 Oct
 2025 23:56:17 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 23:56:17 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v2 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcI/CddGcOsGm90U+5rF/LOSoPC7TM3qgAgAI0jvA=
Date: Wed, 22 Oct 2025 23:56:17 +0000
Message-ID: <OS3PR01MB8319FC10A848B0945FECB3018AF3A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-2-chris.brandt@renesas.com>
 <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
In-Reply-To: <CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|OS3PR01MB10170:EE_
x-ms-office365-filtering-correlation-id: 23525986-2ddd-4aca-0e6a-08de11c69788
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SlQycXdjUmVWMlprTzJ5RzlaRWRRQmNEYVUzZTIrdnMyRjB4UGdxZ0F1QWdh?=
 =?utf-8?B?cjdFMm02eUliOTV5WklYVWlNNXZLcFhaUTNkV2xCMTB1dWxkc0FaNUwwcjlN?=
 =?utf-8?B?SytDU203eDhpR3lCTmMvNWFRQU53bE53V0VDQkg3TGFyZkl5dExOdDdoNm5R?=
 =?utf-8?B?dkh2Wks5REtOZ1g5ZEczMXN0WDNtRjBPUXBmbnJCRjFnTEpYOGVtT3ZaSmFR?=
 =?utf-8?B?SjQ3dE1zUFQvK3pRMXNHVUJXZG1leVNSNEZNUnh6K2Y5K2lWUGFzdFZGTE50?=
 =?utf-8?B?cmhiVGJZVmdrRk5LZkZFVjVqUkh2WDQwT05PVmhHREdrb2JJTjdndTcxbHls?=
 =?utf-8?B?ejVxT3dOK3FiSkdoUWVsUTRmZzY5ZXZsRHNnSzBCRVZ4Wm5HK2F6V2c1bWhJ?=
 =?utf-8?B?dDBuOXhXbDhCMkx4cC9ERFZWRXFkNk82eEs0NkhieUhKSXlQb3FSenFESURV?=
 =?utf-8?B?b3BGUlJSTEZUT3c2bWQ2WkJwVHBNaHF4eU1iSHJRUmdYaXRhWWVwamFYaS9U?=
 =?utf-8?B?QXpFUktFbWhzaVVNeUZUTU0rTDY0T2ViMmlYdEZaeFdTZWFXY3ovYi90RkJP?=
 =?utf-8?B?MVhFaU5IYXp0V3J1dGJBUFUzQ24wTlc3UUFyUVZxbkV6RHY2bVpjTVBKOEtS?=
 =?utf-8?B?RmlscEJwb2VtNmRDT3ZDbEI4VkF1eFZZa2hNYVV4bG8zZkVTaWVaZUorTzdY?=
 =?utf-8?B?RnFYWVM3Tlp4cW1JR0FKdGtldEdmWFNHb3plZForS3pvVzY5WkpESTh0MVZt?=
 =?utf-8?B?cGMyZW5xZjVsN254NTA1amtQblF5QkM5a0c2OTc1dXBvQnYvc2J3UllZa0tz?=
 =?utf-8?B?THBrZjI0Q3VVdjFueFhBZEdLN3RYUDBqSlliWlZ3K3YzNkRUQ2Y3aHMrNUs5?=
 =?utf-8?B?OENXRTNqeGx4T0N3V2tJeDZjUW9ETmhLWmJ1NjdXekNQQUdiODhHNTcyZkhh?=
 =?utf-8?B?emVEanFjblp1L2R0UVU3L2VrY0pzSUprOFA4Q3ZZZERxM0pSWGw4cjJWWnBJ?=
 =?utf-8?B?TzAvd0dBWE1WT201Z2l2L2EwQkVjdEdlSHRHODNSQzgrN1ovQzlrZzFnY3dx?=
 =?utf-8?B?SHg1Y0hHZzl3Qm9GT2p4VmxrVmVLZ0FKRWUvaDBNbUx3ZkNyM2NGU21mcmt3?=
 =?utf-8?B?SWcrclpjVmV1RXFVTlU0aHI3L2VNNWUzSDN4YzFCa0dtRnY3MmhTQ1FuYUph?=
 =?utf-8?B?bXp1TkE1YXZqOTE3RFNjK0t4Mmo4N3lveWorYk9BTWt0Y0kra0p2VXZiQ0s1?=
 =?utf-8?B?dmpycmNVNS94U1lTNlVVUGpCcWpGaW0yb0FwZ1dyMVF1VEFyc2ZkK1BhdGlr?=
 =?utf-8?B?NC9FWTRuaU9WMm81dFBDcVVZcVRqVzBPbkhITUFhd2J1Sk80eEFrdGd1Y1Qw?=
 =?utf-8?B?NG5Gd2ZUeGpHSlhxTTloZGQrQ25IY1c5QnMxNVFwVlY5U1U5Y0VsV2pmRk9s?=
 =?utf-8?B?Q21kVXNuV0hIbkp0TEJJMWJETjZwWEROWDV4eG9adGVaMWt3S2dHNUFna3Nl?=
 =?utf-8?B?bDZEMllkM0g0T3g1Z01WZHZ4TVY5N2N6ekN3RUVCL0crQ3JYZDgvKzRUbHY2?=
 =?utf-8?B?akUvZDY4MHpnYWV4OFNQZzVhRXFOR3RVL0VlV1hQem9hYzhCZnU2ZGlKMmdW?=
 =?utf-8?B?RHk5Sy9jM2NUS045aXN1N25RWnh6SzlWZk1aNTgxaU5JaHNtcXVYb0lMYkxv?=
 =?utf-8?B?ZG5HZ0YrUEFqUzZxdk5SeXNjYU9ER21HVElpaGx0OXZOcldoN1VJTml1TDBk?=
 =?utf-8?B?LzE2K1c5T2hLK1h5SU9jSGtPL1REbDhhOHhpVFhTNlhYbUM1c2xHWnhUZFVO?=
 =?utf-8?B?NisvMHIzZ3lvNW81U1Y1dm5pVXRsZHpyajRrbXJlUEVyZ0JWL2VMblcrQ1BQ?=
 =?utf-8?B?UkkrWGtlL2tOVXBoM0pZTStSZFZTMTh6bUIvQU5KLzFadW1ScVVSeFJSTzB0?=
 =?utf-8?B?NEt5cDZhVDg0TnNxSDVCKy9ZMmM4WWJ2b3BNb0luODdkSE1WTldmVG5USk0w?=
 =?utf-8?B?cXhwdTlhVThIUG5NUy92VzhpNmJiWHVWRk9EVEF1dFUyNEduN00zUmMwSnpW?=
 =?utf-8?Q?4MF9qw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzhvNTZhRDBhU1hIMjBsVlVKdElzR3AwUGtGckl4U28wMk1UUXBFbUpESXNq?=
 =?utf-8?B?c1Byb3l5MGdvY0c4Qmp6WFlITTVxeUV6dVRJL1Z2dTkvbVRDOHZiMDk1aldt?=
 =?utf-8?B?WXUxUHZXV2JQK3ZvWERiVmtLU0tvSFpFN2djUFF3L0VjN1pYU1NFSWkrMGZP?=
 =?utf-8?B?NFZIZGZNYVZhUHRvaDIyMGZERVhMQ3RNLy9DTlFnc1Q1a1VUVGNQYVYycEVN?=
 =?utf-8?B?S0dEek5DVmpTK0Z2aEQydjBWM2JicEQ0eEpUVURESXdkZ0Nqcm55MFd5NEkw?=
 =?utf-8?B?QW5pN3FlT2RaajBPWEFUN2M3UnQyeVFWejJCeTVuV0crRlJTVCtwdmV1MUdi?=
 =?utf-8?B?aE5SS3hoaEFmUlRyUy9qMDhqK0ZQYjV1clFPT1diNVlQaDduMGcxQUlHeHRJ?=
 =?utf-8?B?b2NjZzZmZGdMVUdkOEJtc3J1ZzJkYXhZbFBqL1lPVVpQaGVrUFo5UFNVZ05L?=
 =?utf-8?B?K29zSGxVdDVzZzJNRERob21NR3VmallHYlBVK1ZIL2lFQTE3Q3FUcE1xbjZS?=
 =?utf-8?B?NldQTkN0ZDlQb1pUTXlrMVlCbGpFTSsxSGZsV04rRUdGQ2JsWE1MMGhYcHR1?=
 =?utf-8?B?aDhmNnhGWlhpRXpvM1dVRHpCK2ZqZURaNDJ5WC9FZHh2a2VMeGZna0E0SUd6?=
 =?utf-8?B?S0tjTXdvUVoxdzBEYWdVVFFxM0NybkpDcEVzZXpaaDVzZ1UwalpXVkxLSGpJ?=
 =?utf-8?B?a2lXK3BMY052czZzOTBrSUxuWFUxSXpVRmZ4NExGaStJMTloUWk4UWdqanNK?=
 =?utf-8?B?LzJtNmVVakRRRjJ1MUNnd0ZXRmQzWS9UTHVkbDhzU292MVNXOWNhcVVtMjNO?=
 =?utf-8?B?bkRtY1NZbVN4czliVjBxbllZSExONGhrRVJOYWdRenJ1L3RDa3J0ZTFqbWxC?=
 =?utf-8?B?dTVwWDBGWDhHSFRmakViKytBTE9UUXJKT2NuRHBDUDhoM09Gc2xzelNzanh1?=
 =?utf-8?B?SUxxcTJnQXNRZlRXL0I3WGZFZEZCVGxnTkRuOExxMHFyWkE4UnlveHBDdkRI?=
 =?utf-8?B?MnVlZm44b1dVTGJFTjExRkJ4U25PcVFjUWxzK0NlVU1WVHN5Tmw5UUl0alFY?=
 =?utf-8?B?RElVUk1DZ1B0ZjF5OCtaVGdKV1d4Z0JucWJXUjRLQjFkSW5tSGpQL1NsVHpF?=
 =?utf-8?B?NDloQTYyNkgwSkRjVUt5R09xa0F4TmFZZE1LVHdDU1oxMWVnU2pBbzZBOXVP?=
 =?utf-8?B?WHJvUjJvdU5OUEpEb1F2T2J5QmRUbDN0OUpwK09WNVFZZlAzby8vTWZRMzg3?=
 =?utf-8?B?dzVvd0hoN0F4ZVJXRWFtZWRISUlicXBVbmdlN004aDBydWZGMVdvRDlTZDJx?=
 =?utf-8?B?MVl2THFXZFkvN2t6ZDJvVHhSN01KM1I0QTllK1UwRUdUK0FFZm9uN2lVUzVz?=
 =?utf-8?B?Sm1wNys3cjNVVTgwQkdRS2hvQUJsZkY4WTNndGQwUElTRDE5ZTdBSGFMaDln?=
 =?utf-8?B?MVQwejdodlhadHFVTFlWSWhWWjVoMGJtV2dMdHpERXJWK0MrdExyNTgrcUZr?=
 =?utf-8?B?Z09XUlZueGVlSDdaTHdOanJNNDhDN0UrSlY4UDhrQjd2V3gzMDY3WVBZSzlI?=
 =?utf-8?B?QllCNUxDUnhWbmQ0ZTU0VXJSSjg1LzNQNDIyWjJZbDhqUlJiYmhPaUVNdzFE?=
 =?utf-8?B?UEdURkFpUUQzQS85NGpQcDFnZUlOV1A3bElrRktVdTVqMlZMb2ltVHdIRHk5?=
 =?utf-8?B?TVA0QTMyVjEva2RuNVFrSCtUaTg5dU15OEJpVkVlMXlwOFFyYUx2QzY1bnQz?=
 =?utf-8?B?RldNcHhRdHpYT0RzVk9zMHNvQ3QwR2ZJRHdYQ0ZOQlNQWFBWRXpBQ2h4NXVV?=
 =?utf-8?B?QWdqakl2V2x0V3h3RkdTZ0VmK0ZydFA1ZGpFNXVDWTRtd2VONjIvTEQ5Ky9m?=
 =?utf-8?B?QzRzMkpTUEc1RnZjTWdhWHB3WW9TNW1mOG1sc2VhMll0UmNzMG9pdUVIbDlv?=
 =?utf-8?B?V3hKa25mVEF2SzdsMTFJVHgvZnVFcjN1VjFXOWk4UC93NDBVb1ZmelUyWFRq?=
 =?utf-8?B?ZEorOS9jRmNFcE1PWHFkT3REaVJRdHN4NUtOZDQ3OW5HSU16K1k5SmRjak9l?=
 =?utf-8?B?U0pnMTFqWi9TMGNWSVFIRUQ5UkdTY1ltVjRQczBBZHJYR0p4QXQzVG4vWUUv?=
 =?utf-8?Q?H/a5GFZWfqCudWKcOxr6+K30l?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23525986-2ddd-4aca-0e6a-08de11c69788
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 23:56:17.6244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7PZRVDe1qL0ECwafisEQyUoXDz4BSpCPh19sZXjyBbfT5l5k0DQkfwbg46Lc4BPDmDunwd61/Qk0uqav0PtIKL661W3ehMQyltpfB63p98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10170
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

SGkgR2VlcnQsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiANClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIg
MjEsIDIwMjUgMTA6MDIgQU0NCg0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQoNCkkgaW1wbGVt
ZW50ZWQgYWxsIHlvdXIgc3VnZ2VzdGlvbnMgY2hhbmdlcyBhbmQgcmUtdGVzdGVkIGFuZCBldmVy
eXRoaW5nIHN0aWxsIHNlZW1zIHRvIHdvcmsgdGhlIHNhbWUuDQo6KQ0KDQpIb3dldmVyLi4uLg0K
DQo+ID4gKyNkZWZpbmUgUExMNV9SRUZESVZfTUlOICAgICAgICAgICAgICAgIDENCj4gPiArI2Rl
ZmluZSBQTEw1X1JFRkRJVl9NQVggICAgICAgICAgICAgICAgMg0KPg0KPiBEb2N1bWVudGF0aW9u
IHNheXMgMS4uNjM/DQoNClllcywgZm9yIHRoZSAncG9zc2libGUnIHJlZ2lzdGVyIGJpdCB2YWx1
ZXMsIGJ1dCB0aGVuIGxhdGVyIG9uIHRoZXkgc2F5IG9ubHkgc2V0IGl0IHRvICcxIHRvIDInIGlu
IHRoZSB0YWJsZSBpbiBzZWN0aW9uIDcuMi40LjE0IG9mIFJaL0cyTCBIYXJkd2FyZSBNYW51YWwu
DQoNCkkgYWxzbyBoZWFyZCB0aGlzIGZyb20gdGhlIHRlYW0gYmFjayBpbiBKYXBhbiwgc28gdGhh
dCBpcyB3aHkgd2UgaGF2ZSBhIE1BWCBvZiAnMicuDQoNCkNoZWVycw0KDQpDaHJpcw0KDQo=
