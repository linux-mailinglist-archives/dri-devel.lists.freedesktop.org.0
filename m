Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED664BE4EDB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5960010E239;
	Thu, 16 Oct 2025 17:55:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="PennBpr7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6100510E239
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sie9lRTFBHq7BM9a29k7QLdZqGDv9/Jh4B3vqxS+z/XO+LMpAAfNoyBsbgRB9+PZGnEyUuxAo+gknLEJXNa8pLt2sAfDHI79NRB5n0+f4UpLAph4rnm/tvWw2ZfHTHTRKzGoWg9VudA0Luet1PKqIWdXLVbQEb3XBS9lJfs1od6oxeSAApZAP6qm69l//x5BUvf/A9KxNhmEK9kI1zH/s4vQ7FiuzrR9GFJWJObvpL/hgYc7BfFhgBu+618cpSofZwo3sNOLdriKB7gf2XW5Slzly8AeTqZ21GNYL8+AGb4jUs1p55DSjWKpT4cj6HSbt1YPVWC4qBZMvhklO3Wg5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8AXIa44LzCAOOKPnmV3SBPEKem7zcDvmNp7G1jtdys=;
 b=IZA+Hp2xt71mct4SzCyGQBSpXeB9EVddlf5YJE2PiW98GRvBG0oKldnOv2/B9qjRj4Z+vsnHB1DD/b1lUhv51oWn80stsHLZWLKLn7R/7K+zHq8eNCRvOZtMA81bh5MpfwqEMqerrfuL6jEiHQN1MoncfxJoouDQxtIHi9Ungp/r9GX1/IZRUNoH2PL9D8CVoopfUaaT28/yz9KTwZPSP66n5CS6Ejwx7gX2tlSz+5UpJ6Pg5DDesMHihcdvsEyoXVX9K7e66LSzBFP4XEBXgZ50kE4FhShr8tu0lwyoEBWCR1dvw8Swu/ifhQcVipm45dGCuKyUJ+Ii3Hq/dsg9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8AXIa44LzCAOOKPnmV3SBPEKem7zcDvmNp7G1jtdys=;
 b=PennBpr7AT0lcDdfEMkdbnW7EEFk/P6XTEanBLEHd1t+0z/uwxZqkKxOVDXPb1sBz8apIouXk5rSnd4zjjNYVChbuWGghPfTFtG4Sz5lX3nexpuAsjIdpA1702JUt6YCYP+hNktU3Ncx51IjCjQOWJBFODuNCOjS5TkUlBIkP/k=
Received: from OSZPR01MB8322.jpnprd01.prod.outlook.com (2603:1096:604:182::14)
 by TYCPR01MB9879.jpnprd01.prod.outlook.com (2603:1096:400:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 17:55:42 +0000
Received: from OSZPR01MB8322.jpnprd01.prod.outlook.com
 ([fe80::512d:4974:655:dc93]) by OSZPR01MB8322.jpnprd01.prod.outlook.com
 ([fe80::512d:4974:655:dc93%5]) with mapi id 15.20.9253.005; Thu, 16 Oct 2025
 17:55:42 +0000
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
Thread-Index: AQHcI/CddGcOsGm90U+5rF/LOSoPC7TE/WSAgABFmdA=
Date: Thu, 16 Oct 2025 17:55:42 +0000
Message-ID: <OSZPR01MB8322101A9EF081EA3D405D908AE9A@OSZPR01MB8322.jpnprd01.prod.outlook.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-2-chris.brandt@renesas.com>
 <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
In-Reply-To: <CAMuHMdWEjUzpu_-pukUxHBFDqw_+xjE9gy4MTKz-39bwDGCuTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8322:EE_|TYCPR01MB9879:EE_
x-ms-office365-filtering-correlation-id: 2bf832aa-f9f3-49a5-2398-08de0cdd3963
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N1lqVWlmelpOZkhwUXF6SkExNVkrUkRMVFpkbEdTSWwvWHNFd0FBUW1JeGRr?=
 =?utf-8?B?N09PSVQxRkc0czBOZ1lrNEE5Y25KZ0hWNTZxbXhkRTNwb1ZrV2p2OEZKYTlj?=
 =?utf-8?B?MXBUTlhOZ0s1UkRGRzFjZVpvVXhtN3cwQzVpdTJmZURrMmc0dEQrK2xGOWxL?=
 =?utf-8?B?VTRIYmFEcWlPV1ViWkVoRGY1cDVvNER2Z2hHKzQ0VjBaNVZMOEJaWXlTd0px?=
 =?utf-8?B?dTc4RkdDTlVadkFuNjVnaDltOGpCMVdYRnNGRHlLOHlmYlR1YzJTSzhGQUlm?=
 =?utf-8?B?K3dINmJKNTRXM09SKzNaWFJnZmMrblZDRVREK2tGRkxDeUV3WHhCQmdpV05q?=
 =?utf-8?B?MU1kZHJ0TWNMc3BlMjBoRm9vdVlQYStrSFBBY0F3VmlpdStuODlPQllhS1d6?=
 =?utf-8?B?OG54VndGcWI3ajc2eXRoN2xBdkhnYzhhY0MrSUIyQUtvNHQ1elU0VWQ2blk1?=
 =?utf-8?B?WUtHUWY4YTdzbkhiaXZrTmc2SEZKOFRhYkZhZUJjSEhSZ3U1MEV4NjBWbWVl?=
 =?utf-8?B?NGhxUVdLT3p6bUhmQ1NsWXEybmpmVG80S0Z4M00xWEt6VHllS05INUl2c2px?=
 =?utf-8?B?SGJmOXU0U0FqWlpjOXFKcDVWZVdheVgzSStueHRkblpNMWFnUyt6eVhnNVNn?=
 =?utf-8?B?Ym9LRFpBMTJESUZBUm9wWk0zby9mRDlvd3Q2RXZHdkFDNUM5cG9NMXhiRkNq?=
 =?utf-8?B?OXRRYWZXdG5ZZWgrb3hVbTJ5bWRtOGNYTVV6SGllNVRuM25EWFAyUSt4RFRu?=
 =?utf-8?B?YS9mTGMyOEliNG1BU3BTVUdMQUw4QTZ1eVRFQnRNa2QxNXJ0eWpZT0xqZThE?=
 =?utf-8?B?Z3JSMmJpY1FLRWtLZ1lKdm1kUTdtMGNDanZrNnMvTVBXanJIQnAzRkVmVWhS?=
 =?utf-8?B?L0V4RUVOWkRmRTJTalFFSWNibmlBclRaZnFsQzRzZ29BMmM5ZFhtZFJmaCtp?=
 =?utf-8?B?ME56eDZaVDJ2c1Z4SzVFdUZaK0tLU0JaUWR4WlRvWVFPOCtQbW5GcS9zSTF4?=
 =?utf-8?B?YS9qN0xCNzg4OEhTUS9Ea003S0ljRzFiZ1k4bHVleFRGbjE5WGxjRVIzeGNM?=
 =?utf-8?B?eGpyOUEyYU1aa3BNZDBKeWk3eVJjZEErbHJIOTNXRFRTTVdib1Y4N1VqMktQ?=
 =?utf-8?B?eUxhVGlVd0VWcVFYZHRpc0NvRk8vY2RYellVUEIwanVTeWt5MkVJOGsrUkFG?=
 =?utf-8?B?SnFycVQ5MVlaZ1A3UE9YWHVDVWUvOEVDSCtvamxwckJnZzFOUXRJTWU2QU5t?=
 =?utf-8?B?WWdsQ01hY2NtU1JvcjdhYVAvWHhtZklrZ3Yzc3k0ZllZRkx5M1RRdUVnQzZH?=
 =?utf-8?B?UUlBd3ZKZ1hFSWo0WlpQcGRBS1I2emxHV2ZXZzZMOXNoM3RNOEpIcmFZV2Fi?=
 =?utf-8?B?NEdkNVNETEszUE1GQUhLaGJwdDZJTWxnc0R0RWVCSy8vV2E0a1dyT29Ycm9X?=
 =?utf-8?B?cis3M0xjRC91NUh4aDA0SndtbDZEQVhrMTNadTJnU2JOeVkvWU4rYytTazJM?=
 =?utf-8?B?bGs0YUt3UXMxNEI0ZldsTHhVa0dpZ1IzeE5IQnJSZlcxNjJOUEVUYkxERU1M?=
 =?utf-8?B?THNaeWx3WFJTcUpmOXhMNTc3WnpmOVd6bWdPWFFTSm1waVJ4Q3Bkb3ozOS8v?=
 =?utf-8?B?K1UrYVdXVzN5WlFTTEZJY3E1R3grajQxNXlLT1JMQTRPRzVWWDNjMjVmUVB0?=
 =?utf-8?B?S0ZwQTh1cnZYTGhydzl2R2xERCtHTDlEWFNZSTJqT2dSNHFqYXFYQnJkbWJL?=
 =?utf-8?B?dnFackkvT3F0c3lYSFM2U0VqNUh6ekx3OXhYeFphS0VNZ0pxL3hrSmtYSTdE?=
 =?utf-8?B?STJybVhqVlFqSmM2SlV2SXpIcjJKNjNzR0VjTnQ2L1k2V3haNlRyQTEzRjBW?=
 =?utf-8?B?Wkh2Y0dqdi9Uc0RycGZUV2dhdEswVmU4NnN3RGRYZ3o2bkNicEFFMHIycm51?=
 =?utf-8?B?RnMwWlpIdHN2MDJIQlJmMUlVK0NjS0dydkN4b05XNEU2L3VyQlYvYjgzQlp3?=
 =?utf-8?B?cXZKZkNucUhEN2Q2aW5LampJZXYwWTQ3MHV1VEw1V3ZKVGlPL0xNNFM4UGlZ?=
 =?utf-8?Q?wzyBz/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OSZPR01MB8322.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXloSk1VTHFnV2dGeEdYQXhwWWtIamJwekI0cEk1b2Yxd0ljYS9mYnhITi9p?=
 =?utf-8?B?YlhadCt5UGV0bnBOSENsUW4vN3lCTHdCMHVpM3AzdDc4ZFlLZjJ2YnFJSFY0?=
 =?utf-8?B?aFRzMDNRSGtGQ0llMnEyYitmNDJ1VFNRRmxvYWVVTm5jWjFpQ3VpMXZlUWMv?=
 =?utf-8?B?SmxzQ01LVEZVcFJlMnNUWmVUdFRyNE93eU5EOCtpTEI1NHpMa2tJeURwTFE4?=
 =?utf-8?B?OFFLQUtRaWpLVjIxUG0wOUl3blBrbzUrT3VEbUZLQUk4ampuWEt4eHhJejRr?=
 =?utf-8?B?c2M4eDJaVjJ6R3FJRUs1c09BYjdJVDk0Z3p0ckdpRkM4WlRuWUorbDBpOWRC?=
 =?utf-8?B?R3hsT0dSRThSWnF3anc0amt1WndkMFFqNW0zRHhpL2JkSTJPMDB3UUE1VUc1?=
 =?utf-8?B?cXdPdkF3bWErWHArcCtTNDh3R0VtdkxZOHVzZkljKzhHSk5NQ3dlZjR1OEts?=
 =?utf-8?B?Ykp1bC8xV0d3Y2lrSzNnSVA4YnlzNE5NalVjbmgzNG1LYXBDWkRCUXFQVGVP?=
 =?utf-8?B?NHpLNk01a2Z3dnFyd3IrUkVEMmdQcHZQOTZla1R4OS83TUhSc3hJWTZuTnNF?=
 =?utf-8?B?M0ZWMU5BUkdMUFNYZVhWMTVQa2h1dkVqNFBMa1JVejQrcDQwTmN2T01ocE95?=
 =?utf-8?B?VFVyV1lGUHVHaGh6VndxSy9IZm5LcExPWmx1a3g2YnNLTzQ4c0RIWnJ5bitE?=
 =?utf-8?B?V24xcW1OanR1bndSSXhwYTVMUUNhR1h6UmRVV2w1UWhaUWFzd2I3RjFQNlVa?=
 =?utf-8?B?S3YwVXJNK0ptK2JmZFVxYmJsVDJmOU9DRWFLTk8zTHowdElvcmJZWTlWdExD?=
 =?utf-8?B?NTdiSnZJa21KbndBUjU0b1FTclRMajU1N1BaYmJ4ajBoWG1jaGRKQXNNV1Jl?=
 =?utf-8?B?U3VmTTRWeUt6Rm1qYW10dkVPd0dEYUpxV2pHUUhiM2wxejE3ZnJCMFB0VXhj?=
 =?utf-8?B?ZXNPL3lJV3lXWWZoaW1TOTNTUFQySUErRWFldThuNVYwdVRIekF4bTBUV1l2?=
 =?utf-8?B?aE1EemN2eVdNa0hsQThXNTVWVDdvOVBuYjZ5eTVZN0NqNVh4SzE0Z2paZGsy?=
 =?utf-8?B?RWdFNlJHc1ZLMjJGajVLTFJqelgrWlNGL3pzT2VwdUNoUnc3dzZ5MThoazdH?=
 =?utf-8?B?WGg2bTAreXdQZXVKR3RZN1F0YngwTDdQakR5YjhCVklZdzBmM0ROMzUwNzdN?=
 =?utf-8?B?NHRCdXRBUWV0a3dkZUZKNGpDQjN1bFB6MFlVL1pMRXZaNy92dXdMbkE5TkNB?=
 =?utf-8?B?MmhNTW9ucFFycG5JbXluK2dVSUNYS0l0cXFTY2UrSDFwekdJdi9OcjkxZ05B?=
 =?utf-8?B?dkVsdXp5REJQSWsrUG9QN1lyYmpnczhjeWJYQTVZd3ovNXBJMHBQZVBCeWp4?=
 =?utf-8?B?cHpXL2QzbnhXRkZ5M0FtRFhoRytDOG94SXg3YkRsd0dTOVZDNnMzRUtWWGQ1?=
 =?utf-8?B?ZW0zeDZOTDBlSXJqdFUycUtMVkN1KzY2blladjg2VVFzVFNuTG9oeXh4S2k2?=
 =?utf-8?B?RStlLzdUdVBORjMwOWFhdis1YUozSzIrYmVENlZlbDNHYlkrVE5jejZGOHRr?=
 =?utf-8?B?MnpNeE96cUIrT0MxZTUrY05nQndQS1JGSXRvOHZHaHlmUnNhbVA4OUlPall3?=
 =?utf-8?B?SEdwMHJGWU84RnRLcnNzQ0wzZDkwUVRJUHhGbmFqVC9NSStLdTdRTGlSVEt6?=
 =?utf-8?B?YysrdzBvMlRaaHpabGVGZlhmNWZVQ2VLbUhLY2ZLSEFPRVFRNVpZOEVNcWYx?=
 =?utf-8?B?VlZ2STdDNVNOVi84UlhwbHFTVFA5SnB5U3lsa1lzZ2MzZmJkV3Q2czFqUStB?=
 =?utf-8?B?SC94ditNamphL0NBWDVUckd6Mi9QZDhrUHVMRCtuRUh6ZVRnWTZLTEFzUTd4?=
 =?utf-8?B?Mmczbkc3Sk1LVVNGc3F2bDRMOGowQkx2bWgrMnhCMmQ5QS8yODJTemNHOC9B?=
 =?utf-8?B?VExoeXRSVDh4V0dTSTMyYnJzVVJlejJMQ3g5SlZ3MDhwSmRqWHJsbER1U3Z1?=
 =?utf-8?B?S2pyR2RqWXQ5bmFpdVU4VWxNYk1oaUZaR1FkeGJaR0NxZ2Z3TVBaYmdmTVNR?=
 =?utf-8?B?SzluZmcvZHorOEVKVlJVSWhlenNISDZVdWRIWE5ZdXp1YzhpcXgzSW5Uc3Bk?=
 =?utf-8?Q?+UT0CUkr80e0EhxRaCBE+r+jT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8322.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bf832aa-f9f3-49a5-2398-08de0cdd3963
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 17:55:42.3025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fIZvrqyPCX2ryKcDqXP+0dS66uVSiHj3Yi5MU4bJ+86BivgAyr+i8ih984AUf5EUg7LKWMD0CeL65orzjkMJALh9NcUN9kfWDopayDh/lE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9879
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

SGkgR2VlcnQsDQoNCj4gVGhpcyBuZWVkcyBhIGR1bW15IGZvciBjb21waWxlLXRlc3RpbmcgdGhl
IENPTkZJR19DTEtfUlpHMkw9biBjYXNlLg0KDQpPSywgdGhhbmsgeW91Lg0KDQpJIHdpbGwgYWRk
IG9uZSBhbmQgcG9zdCB2My4NCg0KVGhhbmsgeW91LA0KQ2hyaXMNCg0KDQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPiANClNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDE2LCAyMDI1IDk6NDIgQU0NClRvOiBD
aHJpcyBCcmFuZHQgPENocmlzLkJyYW5kdEByZW5lc2FzLmNvbT4NCkNjOiBNaWNoYWVsIFR1cnF1
ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5l
bC5vcmc+OyBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBNYWFydGVuIExh
bmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFy
ZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8
c2ltb25hQGZmd2xsLmNoPjsgSGllbiBIdXluaCA8aGllbi5odXluaC5weEByZW5lc2FzLmNvbT47
IE5naGlhIFZvIDxuZ2hpYS52by56bkByZW5lc2FzLmNvbT47IEh1Z28gVmlsbGVuZXV2ZSA8aHVn
b0BodWdvdmlsLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgbGludXgt
Y2xrQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAxLzJdIGNsazogcmVuZXNhczogcnpnMmw6IFJlbW92ZSBEU0kg
Y2xvY2sgcmF0ZSByZXN0cmljdGlvbnMNCg0KSGkgQ2hyaXMsDQoNCk9uIEZyaSwgMTIgU2VwdCAy
MDI1IGF0IDE2OjIyLCBDaHJpcyBCcmFuZHQgPGNocmlzLmJyYW5kdEByZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+IENvbnZlcnQgdGhlIGxpbWl0ZWQgTUlQSSBjbG9jayBjYWxjdWxhdGlvbnMgdG8gYSBm
dWxsIHJhbmdlIG9mIA0KPiBzZXR0aW5ncyBiYXNlZCBvbiBtYXRoIGluY2x1ZGluZyBIL1cgbGlt
aXRhdGlvbiB2YWxpZGF0aW9uLg0KPiBTaW5jZSB0aGUgcmVxdWlyZWQgRFNJIGRpdmlzaW9uIHNl
dHRpbmcgbXVzdCBiZSBzcGVjaWZpZWQgZnJvbSANCj4gZXh0ZXJuYWwgc291cmNlcyBiZWZvcmUg
Y2FsY3VsYXRpb25zLCBleHBvc2UgYSBuZXcgQVBJIHRvIHNldCBpdC4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXMgQnJhbmR0IDxjaHJpcy5icmFuZHRAcmVuZXNhcy5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IGhpZW5odXluaCA8aGllbi5odXluaC5weEByZW5lc2FzLmNvbT4NCj4gU2lnbmVkLW9m
Zi1ieTogTmdoaWEgVm8gPG5naGlhLnZvLnpuQHJlbmVzYXMuY29tPg0KDQpUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghDQoNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9jbGsvcmVuZXNhcy5oDQo+ICsrKyBi
L2luY2x1ZGUvbGludXgvY2xrL3JlbmVzYXMuaA0KPiBAQCAtMzMsMyArMzMsNyBAQCB2b2lkIGNw
Z19tc3NyX2RldGFjaF9kZXYoc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICp1bnVzZWQsIHN0cnVj
dCBkZXZpY2UgKmRldik7DQo+ICAjZGVmaW5lIGNwZ19tc3NyX2RldGFjaF9kZXYgICAgTlVMTA0K
PiAgI2VuZGlmDQo+ICAjZW5kaWYNCj4gKw0KPiArI2lmZGVmIENPTkZJR19DTEtfUlpHMkwNCj4g
K3ZvaWQgcnpnMmxfY3BnX2RzaV9kaXZfc2V0X2RpdmlkZXIoaW50IGRpdmlkZXIsIGludCB0YXJn
ZXQpOyAjZW5kaWYNCg0KVGhpcyBuZWVkcyBhIGR1bW15IGZvciBjb21waWxlLXRlc3RpbmcgdGhl
IENPTkZJR19DTEtfUlpHMkw9biBjYXNlLg0KDQpHcntvZXRqZSxlZXRpbmd9cywNCg0KICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCg0KLS0NCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCg0K
SW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBt
eXNlbGYgYSBoYWNrZXIuIEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVz
dCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCg==
