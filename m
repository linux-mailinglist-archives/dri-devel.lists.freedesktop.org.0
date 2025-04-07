Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD7A7E7EC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 19:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E2510E530;
	Mon,  7 Apr 2025 17:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fS9TzfhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2044.outbound.protection.outlook.com [40.107.96.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DFF10E52D;
 Mon,  7 Apr 2025 17:14:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zr+F0lQLF9rVzaD4a24VVIoRXoFSBl771zV6cQHsSczxN2NwYP+L17ajCrfqfeSPT9Go2V6I3TKNn1xLM9A4yKDdJEGQAoxZ6pCnoJI8pmNddkez4h6J95VmjWf4TPPX33C3uE58tbWFy+vRHxEk5DcvpSkut51BNHYROX1UL2hKVlXU4kzvV0LC2mahxD5MbgGvY53cSn6qBT6GoMa455+sGW+Qx0i2eL2Mm4aA9V9+4LXmivhlh52dn+Sha2PhnTQKloU9TZu4V/jDG6FnVjNz2Dto2a9M0tuiYzoVmXI9MV1Ki6IQlHhOEwNP/rvOGg+NqZ6mxoPhWQYoB5VvQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ntKI1ehTIA5/dkzwCPT1ijoEtoHR+E8twL/X+cCKu0=;
 b=CD6/35S3lan/JxT2Olat6uNnsCnbP+GjhLiSZ+Sr2UMgHwj6Kfr/p5aVx+R4l3kFIKVjnv5hbYxBBxPnSZYVPqz7XikJq4D6kI7Z+dpUl1YCaNDVsu/4ZuNU+ebFX/Fm0kI5DQOBxRuKiOBuE3ep4JzIT97uioxSv/O+VT0uHGOHlq5bFM3+LjQwfawvVHcm0czXR5Ie2XYOmmLh/sciHWKiwtJI308a7H983Jb/0nAf+iHM2iaQSohyosSI4QLtXI28ucH3t9RjPQd4kmdmZH8UcRC84GPNezi0tZiTodBwPOHBMhcbi/+jxuPD0mI1RCAR5MLq8+atECHdvbz2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ntKI1ehTIA5/dkzwCPT1ijoEtoHR+E8twL/X+cCKu0=;
 b=fS9TzfhAfbn1TYGeTlhhtI92WBRooD2SpcPdcOb4j4emJoFGj15tnC2BslRl/2mzmnWe9XbjnA/Cx3OgExqfJDd5mwSKadhzCZ+7GA5nGxFb6XXG/FpSgM9avRWMqx3mup+sYBr0GxRk5/EuPCtQF1L8uhCBxLhzbPeD/dP+0SYpMK38nYXZT/Ej60j03auiC9tfG0ypJBvXFIhL4HD/CneuJG/pRVNP2oCDz9k7N1OvV/C3nEiQVRcKvFueFXCiAd5zhRXATAUzPDbOrz2laYtzdz9Fz8vjw17/XuLPEn8ULMGRL869oZSejxOiz3D7+VBWObpT1ag20gi9vGyxNA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM4PR12MB6542.namprd12.prod.outlook.com (2603:10b6:8:89::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.31; Mon, 7 Apr 2025 17:14:36 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 17:14:36 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@nvidia.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwAgAAJR4CAAAOaAA==
Date: Mon, 7 Apr 2025 17:14:35 +0000
Message-ID: <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
In-Reply-To: <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM4PR12MB6542:EE_
x-ms-office365-filtering-correlation-id: e338e63b-de07-43fc-14fb-08dd75f7ac0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NHlId3RtZXZ1N0FTY0VGYVJsZEtwRmdvWWZ4bDdaMXVuc05WcGRiL2YvTzR4?=
 =?utf-8?B?dDNQcldNSmVMVy9EUkgvYUxWakRGcm1QMC9OQ3R2OFlnU2J5SmY5TW4wYmt2?=
 =?utf-8?B?elRDeHJlQTZQMm9vZ09IN1Q4MEtOaE0wVGdFbk9GNHFrSGhiUFh0bTBxYVJL?=
 =?utf-8?B?aGVrMG1HeHdUc1ArSFBBL2YxVG02cy92STVvRFpXTm5FMGUweDZOYW82Smh5?=
 =?utf-8?B?VHhYUEtDSGpheHJ3WCtlTGhnV0F6cTlwVk1iaFBvQWx4RWRtQjVyb0tDbHFr?=
 =?utf-8?B?dU43M3NkNDhWKy9HSEVxamlpSzFXMk9XbjhPNEhJWnVPV3BjemFaeXZEdGNv?=
 =?utf-8?B?dXVoNWV1aGJRK2NxSVpJejYzOWN1R0xlaWZQaVM3eGdXRUJQelR4MDgrVnNq?=
 =?utf-8?B?R2VQMFQ2MitwMzJ2WlQ2bGZXWEF1U1h6N3NzTXhScmg4RlJZNHZiNW9TNElB?=
 =?utf-8?B?SHRyK3BZajk3MlM4S0hzeDBqdytsL3NILzhmOVI2YzZYTzNnZk52Zm0yQWpy?=
 =?utf-8?B?UHpHKzlPWE9CcjkxcHZqN2NtUDMyTnNiUjFsS2VtVUpoVWRPejl3ekpTbHkv?=
 =?utf-8?B?QXRtU3g5VHRhS2FHU0w0ZDY0NVoyRVlPcWlVOFpKdVJ1WmxZVTFRNlNYclZZ?=
 =?utf-8?B?NGRGaVFaTDU4R25WaFRRMjRtbVlSajB6VVAzSXIrV0xmbUN3VmtPbUZhakxY?=
 =?utf-8?B?QXI5RjBSdVFuTkwwZ0p6Uzd6U292WTExUTBjTmo0WE0vL0d6VUtVcVkyalgw?=
 =?utf-8?B?S2hiK1FuQVVZV1JZWmFHQ1dtRWhGWjB0VHppNk1Uck1mMUtIOSszcU1TSlhQ?=
 =?utf-8?B?c1B4UjdTcmFCVEE4dFFFNVRiY2YzdHVveVFHdmRTRnJzcVJQMmNhMFJCS0th?=
 =?utf-8?B?a0VZbGI0OEJYY09NYjJlZmlvYkVQem1SL0hnRUYxd3RBYlp3cC9ZQllXZmVW?=
 =?utf-8?B?RUY3c2E4d2R2QVVUR01rTnBRL0JFM1FneUlySkJNSXVqazJQNldpd2NOVklV?=
 =?utf-8?B?MUp1M0lRN0ZkTVhBWU9BK3h3cFVuQ214NHYyWVNOUTF2bDJFUjJJYmFaMGw2?=
 =?utf-8?B?TTJrNmsvSFY3dlVibEpaRWE0YURPcHlqMnF5VTBqYUVGNWZLdHN1M2VBOHJw?=
 =?utf-8?B?K0EvaUlNNk5Wd25nRVo1ZFpDTVhYbmpvT2Rrbk1KYSttN3FhRE9JVFNKS3hj?=
 =?utf-8?B?d0FHcHBOUkdXYWZyUWNSeVRDSENWYnRwdWY0UExQL0VaRmZTNDBOalBhdS8v?=
 =?utf-8?B?YVBEU2txOE9TSFZyZ1djLzBrV2w5VjlpUWNMYWhEVE5oZ3p1U2xOcHB4Zk1R?=
 =?utf-8?B?c3hLNVlwTFV0TXhBeXJUVk1hUk9tcmUxSGl6U1dkazJYN3ZmUFNFc3lPU2xV?=
 =?utf-8?B?V1h5NlVJa2dFM3lQNUpGOFhxV3pCWmdaM1dRVFpPNk1WVkphbHRmbkhvQ3hU?=
 =?utf-8?B?UDBjMDduczdKTU45ZUpHR200OXFNVFdFaWg1WjRTaVlTK1VxRXBoZUZFN0gr?=
 =?utf-8?B?eGp4ZkZQNmxNMEFTVGpnc3U1clFUdUlvZDVpV3FGUWU0Ly9GT0pKQlU3cEZJ?=
 =?utf-8?B?VkJ3SkR3MFBGQkZsRGdXZ1pmN0JBMlRMVlhCbW9SMXFsVS80d2tiREVCYWhq?=
 =?utf-8?B?QzRscThyWkFpYnFYRmxUZUhLQVVpVGNsckVGTXVMYUVrL3lKeXYwSXJVOU8x?=
 =?utf-8?B?RVF1UHhFd1JRV1p5aVA4K1FWVStJbWY4U0xyV054RWRPK2l2WXF1QmF4VTI1?=
 =?utf-8?B?NFdjYnRPOVovaWx0NW9Jak9CaEswWTMyS0NJMzJ0ZE9ndHV5YW0rSjcveTNx?=
 =?utf-8?B?SkNjcXZlSVV0SlhkaFJxdEUraEN3R3Q3dit3OWJiOXBHVTl1dkNPWHFFeU5m?=
 =?utf-8?B?VnQzRUE4eGFRcklsazlXemZMbXFlVU5ld21DbVFNUHMzUE00V0liMUZtRVFN?=
 =?utf-8?Q?gaMm2onKmk0gX8VcOk6Wg7oiIw+PUm45?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzF4eGs5b2VuY2E4MXVKODdINGRQMnM3R0FsS0JLNG5wdmRZM0JrcTV5ZDJG?=
 =?utf-8?B?WEhyVGQ2T29tbEo1Y1lxeC83WXZQMk5mbG52aGl6bkFOMWFFeDJlQ09Ic2Mr?=
 =?utf-8?B?SDFSaXBPVDQ1OHA4TXRwSXZpTFVBK3Fza1dVczRRcDM4OU1WaTBkRk1ZcE5k?=
 =?utf-8?B?Nmd3T2Rvc2Y1MHhmek5menAwazJQTzc5RVlvdGEzZXV2dnNNM040RUpaeStx?=
 =?utf-8?B?OUxLK0FLMmdsSXpnZ0ZrTzY1dHRwTGVaZjREQzlzVVJGTGhzWi9HaStFMzIz?=
 =?utf-8?B?QlpVVkVWWk8rdk95YmY1RlVXdUFuYWlpMnkvSXNCL2dmZ3pRMjFxTmp6VHY3?=
 =?utf-8?B?OW1ZUk1TL2crSEgzV2N5SU9HbzlEc1VaQUowTXZxc3FNRjhYcWRTTEE3YmE4?=
 =?utf-8?B?UHR4T3BpK25GcjlwQkJHZzc5eGY5OTRDT054SmpJaUY0YUJFZUNBcnVhZ1pC?=
 =?utf-8?B?ZzFCbVhTdUozbzJpQnhCc3VsUm5ZZUJNcmtkWElCK2gxK0loeTZXTm13Rytp?=
 =?utf-8?B?cmhpVjZpZFBRUDZyUk5Kb282dkg3aTlaZkh4elhDT0VHazdDUEpRL2JvNWhs?=
 =?utf-8?B?WUZsdS9iRStXREd3TUpjbmdRanlmMS9BQndVMGZYWGRTdXd0YjlBWS91cCtj?=
 =?utf-8?B?SDMycTgxTm9qUzhzMWw4cktEUUFBeXg0cmIrREFnd25rZmZHaW93L2JzcW5w?=
 =?utf-8?B?TU8yemJDNFN6Z1EwUmxwZG5zOGMyMHZqZENRdHFyZnIxdXovaitKOEZLTG5v?=
 =?utf-8?B?di85NzhHVUxtQ1FVQ1ZDZWJ1VWtYQ2JDYkprMloxbVp5WmJDQ2xnRVBENlZz?=
 =?utf-8?B?U0Z2bXNteWpzTkhiQUxiRGxEQVo5eWZJek9FY09YSUE5b2lmNXh2UnV2cWV1?=
 =?utf-8?B?blVUKzc0ektvTE1jTW5SN203eVpUMUI1b1dYK0F0YnBkQnhxa3V0M0JkWGV2?=
 =?utf-8?B?akh6eWk2NDFwWlZhV25HTkFObFJrdyt6akR3aWEwRnNva0I0N2JXVkRPcW9I?=
 =?utf-8?B?YVZodEEzUXFYV1E5UjlZRGdqUFhFeUdvYXFPSUFRZ1BiUlJPcFBjeFlrZ1Iz?=
 =?utf-8?B?SUp1VXVjeUZVTzlTUlhRa283RUltVTBwMXZCWE10dFhKaGFiS3VHV01EVkxj?=
 =?utf-8?B?TGJwcFZPL3d6Zno3RXoxT1NCaHVnbUpNSjFxR0lRLzZtdzNMY2xENk4zcjhP?=
 =?utf-8?B?SE8yTlhBQTdVZytVNjhXT0s3NnpzK0hYZGZ5N2xpRUo5ZjhyYm5GVG5sQ0gx?=
 =?utf-8?B?N0lsV0x2OE9iSE1QaWV4cnBNeVYzQ3pSUXlCdkgwbmFkYjNJMDRJYlRHSkN6?=
 =?utf-8?B?ZVJJNndoSE9XL1M2U1pXTDRBTVl5RXNMdk5KeEFXWEtYR2JBZHVOckNFS1B4?=
 =?utf-8?B?OWludTUwQnI4SE1TWUVVY0NYQm80RVd3bHh3UTlHMEdFb1RJbDlzU1g4NUh3?=
 =?utf-8?B?c2xkSXpxU0NiRFZyNXoxbWJyNHg1UXB0Yko5Z2ZQZ2tPdDRXS29LRHhaZVhK?=
 =?utf-8?B?MXhVczdDM2JPTmdnUWxQcGpYeURsYlZLMUZIa213NlVQQUpHMk1VeHRwZTFx?=
 =?utf-8?B?MDJRcFRYWGQ0ZWMrOGFadHBlbDJwdHFCaEhIQjQwNnFMSk1BRFZ1TDV2YWRn?=
 =?utf-8?B?WnpEYjhoRzJJdFcxV1dtbXdkcHEydVd2WkNKZnd1QUswWlBYTjE0MjFtOGlo?=
 =?utf-8?B?MTlHTmVsS016VWdUQy9ubDBnN2Y5dEZPK283dUR6UktMd1lpYkI0WExCZ3ky?=
 =?utf-8?B?Z1lncGN3OU9lb0szOHJxWGNlUlJ5WTRtZGJiZXJENCtxcUJlZEY3TlU3dzd3?=
 =?utf-8?B?bm40ZXBEVjB2WGMwUTdGdzRrbGJCaHI3R3pROFBrZHZJRDROMTJwM016emNY?=
 =?utf-8?B?SURzTnZ3dURnZDBVa29OVDN1elRMc2FpaHVHaTlsUzJpM2lRM09EdU9XSGVn?=
 =?utf-8?B?a2h3MjlFTzMrUFdxV3d2bmtpejdQZkZjMEdtVU1ybWlkaGFzRzlaQjZURHBR?=
 =?utf-8?B?aHI1ekoycjVoNFBpR0p6bFRHTDU5cTJwK0FlQzdGNVgvZXFlWDhCTGhZdzEw?=
 =?utf-8?B?cUV6dlNYWUIwZlB3L1MrZ1JTTUl4UHpRcngremJ5RlpPTldwM3BmNW5BV29G?=
 =?utf-8?Q?vMMzXWGgUhE0VEsmApTcy+Dx5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E47B40929595749BC187141D567C82F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e338e63b-de07-43fc-14fb-08dd75f7ac0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 17:14:36.0064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vqh5FcN2bXPGwF0VPc/jTzaQQbmeT6/APJ7SRaA6eZV5lV63oKcBtY59AbTNQyEMjbdRUazGBlZ1UqjXoj2eYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6542
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

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDE4OjAxICswMTAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
DQoNCj4gPiANCj4gDQo+IE5vdCBleGFjdGx5IHRoZSBzYW1lIGJ1aWxkIChJJ20gb24gNi4xNCBu
b3cpIGJ1dDoNCj4gDQo+IChnZGIpIGxpc3QgKihyNTM1X2dzcF9tc2dxX3dhaXQrMHgxYzQpDQo+
IDB4ZDI0IGlzIGluIHI1MzVfZ3NwX21zZ3Ffd2FpdA0KPiAoZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvZ3NwL3I1MzUuYzoxMTcpLg0KPiAxMTIJCQkJYnJlYWs7DQo+IDExMwkN
Cj4gMTE0CQkJdXNsZWVwX3JhbmdlKDEsIDIpOw0KPiAxMTUJCX0gd2hpbGUgKC0tKCpwdGltZSkp
Ow0KPiAxMTYJDQo+IDExNwkJaWYgKFdBUk5fT04oISpwdGltZSkpDQo+IDExOAkJCXJldHVybiBF
UlJfUFRSKC1FVElNRURPVVQpOw0KDQpUaGlzIHRlbGxzIG1lIHRoYXQgR1NQLVJNIGhhcyBjcmFz
aGVkLCB3aGljaCBleHBsYWlucyBhIGxvdCBvZiB0aGUgYmVoYXZpb3INCnlvdSdyZSBzZWVpbmcu
DQoNCldoYXQgSSBuZWVkIG5vdyBhcmUgdGhlIEdTUC1STSBsb2dzLiDCoEluIHlvdXIgL2V0Yy9t
b2Rwcm9iZS5kLCBzZWUgaWYgdGhlcmUNCmlzIGEgZmlsZSB3aXRoICJvcHRpb25zIG5vdXZlYXUi
LiAgSWYgdGhlcmUgaXNuJ3QsIGNyZWF0ZSBvbmUsIGFuZCB0aGVuIGFkZA0KdGhlICJrZWVwLWdz
cC1sb2dnaW5nPTEiIHBhcmFtZXRlciwgc28gaXQgbG9va3Mgc29tZXRoaW5nIGxpa2UgdGhpczoN
Cg0KCW9wdGlvbnMgbm91dmVhdSBrZWVwLWdzcC1sb2dnaW5nPTENCg0KUmVib290IGFuZCB0aGVu
IHRlbGwgbWUgaWYgeW91IHNlZSBhbnl0aGluZyBsaWtlIHRoaXM6DQoNCiMgbHMgLWxSIC9zeXMv
a2VybmVsL2RlYnVnL25vdXZlYXUvICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIA0KL3N5cy9rZXJuZWwvZGVidWcvbm91dmVhdS86ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgDQp0b3RhbCAwICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCmRyd3hyLXhyLXgg
MiByb290IHJvb3QgMCBBcHIgIDcgMTI6MDYgMDAwMDo2NTowMC4wICAgICAgICAgICAgICAgICAg
ICAgICAgIA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgDQonL3N5cy9rZXJuZWwvZGVidWcvbm91dmVhdS8wMDAw
OjY1OjAwLjAnOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCnRvdGFsIDAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIA0KLXItLXItLXItLSAxIHJvb3Qgcm9vdCA2NTUzNiBBcHIgIDcgMTI6MDYgbG9naW5p
dCAgICAgICAgICAgICAgICAgICAgICAgICAgDQotci0tci0tci0tIDEgcm9vdCByb290IDY1NTM2
IEFwciAgNyAxMjowNiBsb2dpbnRyICAgICAgICAgICAgICAgICAgICAgICAgICANCi1yLS1yLS1y
LS0gMSByb290IHJvb3QgIDQwOTYgQXByICA3IDEyOjA2IGxvZ3BtdSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIA0KLXItLXItLXItLSAxIHJvb3Qgcm9vdCA2NTUzNiBBcHIgIDcgMTI6MDYgbG9n
cm0gICAgICAgICAgICAgICAgICAgICAgICAgICAgDQoNCklmIHlvdSBkbywgSSBuZWVkIHRoZSBj
b250ZW50cyBvZiB0aGVzZSBmaWxlcy4gIFNvIGUuZy46DQoNCmNwIC9zeXMva2VybmVsL2RlYnVn
L25vdXZlYXUvMDAwMDo2NTowMC4wL2xvZ2luaXQgbG9naW5pdA0KY3AgL3N5cy9rZXJuZWwvZGVi
dWcvbm91dmVhdS8wMDAwOjY1OjAwLjAvbG9ncm0gbG9ncm0NCmNwIC9zeXMva2VybmVsL2RlYnVn
L25vdXZlYXUvMDAwMDo2NTowMC4wL2xvZ3BtdSBsb2dwbXUNCmNwIC9zeXMva2VybmVsL2RlYnVn
L25vdXZlYXUvMDAwMDo2NTowMC4wL2xvZ2ludHIgbG9naW50cg0KDQpZb3UgbWF5IG9ubHkgc2Vl
IHNvbWUgb2YgdGhlc2UgZmlsZXMsIHRoYXQncyBva2F5Lg0KDQpaaXAgdGhlbSB1cCBhbmQgZW1h
aWwgdGhlbSB0byBtZS4NCg0KDQo+IEFueSBjbHVlcyBvbiBob3cgdG8gZGVidWcgdGhlIFVTQi1D
IG91dHB1dCwgYW5kIHdoZXJlIHRvIHJlcG9ydCB0aGF0PyANCg0KTm8sIEkgY2FuJ3QgaGVscCB3
aXRoIHRoYXQuDQoNCg0K
