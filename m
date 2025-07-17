Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D50FB0925F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB35210E85E;
	Thu, 17 Jul 2025 16:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gO2gH+XH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA1B10E85D;
 Thu, 17 Jul 2025 16:58:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTLbr8QYxzNfif4R2q5KfFz0rJBBPR8Sd6wuOaWEM4rTSYZBg2LmR/hIzBNpa4EcK1bZScS+geTFohaxOUizXjFQ7Zrz2sb9UMgJOpU8MYEoR3f4Wxig7t88kEzY+cSb/kIeqS0ALQmzEhjPRuDezoJU7iX4rZbI68t3sisxwQa1Jn715f005oRM3DI3r8uEsX7KtTdyRNq8KaWbiKR/IeDUqtg1sfCEXUhGdVGMEXRHE9kDIQYX4dMd1fdFakJZpnbEw7iY19Pg1Q3z3MRaCuhdiylMW6Q383ivApBpsb4wO4EbYaOBt9M2wUr10LUAnjYypGHRsRCHRPsab+1wUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NAuKjFNIINdq8V3CjQekC2Jt7yiOG/UJ29MdpVFwEA=;
 b=I+Y9CtS8Or8NGdTIeEDpvmbWABM2ih6MvXLNiGXR39yBgeXQ6QCyn2TRdzHHJOFTD352HRlr91O5SpKMtL66eM/zFgqRS6+6L0nihWJo3/2VCJlV1Lm0d8vshLWJHoUwcwWnKM8NCQ3sjLC+ChntxBNhaIlGArqoWKqjLcuqZ62VlCiCf6QCoZabJQpdZ57I85eYa75UFZvnqeNzDGMckpLzkh6TRRwK8IXta6Mckd+fyozXmSyI0x2WqB4zgOOGMHMsOz7dmZmL1mnv3TjfV+E+o4DCs+3lo7dKJwo53av/29zlLRgL220YAhiso3Eh91WVWvbv5K50QmI5L4A4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NAuKjFNIINdq8V3CjQekC2Jt7yiOG/UJ29MdpVFwEA=;
 b=gO2gH+XH/G6KJLhCX7FxBBMitDIdSIW5qFt6b0EEO3Pvwt1X46Il14F5JwJXbTWqyXAfbNytfjSvRLcoIfGBKXx1W3ZakU54ZkJRq//PU938kVazwkQdoAJhnV9N/naUYf4HLtqWP6LLAZSJi/A3LzIH4ekbtkoPpCtgP3rXgqQ=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 16:58:09 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.036; Thu, 17 Jul 2025
 16:58:08 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Melissa Wen <mwen@igalia.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "Hung, Alex"
 <Alex.Hung@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
Thread-Topic: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
Thread-Index: AQHb9yhimdXJd2sAV0ekpQZXo91gObQ2iQGXgAAAnwA=
Date: Thu, 17 Jul 2025 16:58:08 +0000
Message-ID: <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
References: <20250717143738.84722-1-mwen@igalia.com>
 <70ac7b1e-9a28-45ff-b7b2-ab0f4fe9030a@amd.com>
 <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
In-Reply-To: <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB6633:EE_
x-ms-office365-filtering-correlation-id: b924ab24-d0e7-4970-50fd-08ddc5531b36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YlFjeWRmSDhTSm40d0RNZ0NORDVQZmhGTVk5Ym5tRS96cGZOUDlLQXVra3Bm?=
 =?utf-8?B?UDg3M3BYRlJaOGtidXVTaWs3ZEV3NlI0KzZqZHR6NU1sV3YrSmZOTFUzVWVG?=
 =?utf-8?B?T3BjWFJwcTQxV1VJak5CMWN0WlAwOGtLUzAzYXhiV2NXTEsvSHY1NWk3MzU5?=
 =?utf-8?B?NnV4MnQ3bllueFBScUtmc08vRkNjckhYNjBEK2VpSE9qaUhRc21adHpPZnRo?=
 =?utf-8?B?Y0YwR0FsV0tOelk0ZHE0ZVJXM3pXMVpZQWVwZ21ZNjdYODN3dm04WHZPKzlu?=
 =?utf-8?B?MFdpRUJERHBRQ2d4SG5PTEFHaTBVOFVBMzlIcDhpVmdyNTY1TDNNMVZNbUFn?=
 =?utf-8?B?TXg1T2RPcHJYV1pmQWs5Sit3VzI4ZmZXYkM4Qm5odUk1MGVXN3F4VGR0aEp2?=
 =?utf-8?B?U0tNQnBKWGZ2eUNwbTRSZzdSRWtjWHY1WkRuZSszZXhYZlZ5eDBiZ0F2aWNv?=
 =?utf-8?B?WWtxczVXdGpSalpGekk2WElIZFhVcmZkS2IyU3NlVU5OT29Wcy9EV0YvRHdi?=
 =?utf-8?B?RjhQVXU2alV4bjRSK0trbE5sNVAzME5mV2lRUE42SDZ6TzBPdTJDbmliamg3?=
 =?utf-8?B?TzBJNDZ0TXM4dHMyK01NM1RqUmRyVDRGNmRFZnRITkpwTXhxaVBMSGhzb1cz?=
 =?utf-8?B?M0FVVndhNG13VXZWUmNlRTdyMDlHeWN1Z2FlR2ZaSEVzaUFIbEtmcGFMUWI4?=
 =?utf-8?B?UFRpeTRBekFCQ1BQc1pWdi9kZ3dYTytyRW9SdVU4WVVMS0NPYUdoUTZSQVVU?=
 =?utf-8?B?MWh4UUQyUUozUEVSUU5DdUE1MjBVeWFvTFZ5akRWU1g3SlM4c3hmVUxuSVRN?=
 =?utf-8?B?ZGxFS1YzaGNyQkJiN0lRclk5dUpEeFhaNG9zcmw2RmsxMFZ5b3RvOXEzUFZH?=
 =?utf-8?B?MGtqeWRXaDY2dmNDeUpreXZQL0FYV2g1cFZOK2VNUGdyOU1pU3dvbWJsRTJv?=
 =?utf-8?B?dW9KWlBzbnptK2o3dllpb0VoM3Bwak0yZGJuOVBtcUZwa2pzaStRUm9xSnRl?=
 =?utf-8?B?bkpYUWxMRytGQUpvUS8vSFRZcnNwNHlGc0tnMDdiR2JPdXlQekk0ZzZMZkFV?=
 =?utf-8?B?OWlJNkRyM0d0K2NCU0ZhSldieSt5bklxMVc5TXhadWVtK1FKdURKM09oNklK?=
 =?utf-8?B?MUU0TTRnSjhFdzc2Y2FFRkpabnY2L3JxY1JwZm5LMHlIdU15bzhWTHpXZHNL?=
 =?utf-8?B?OHREQzA2Y2JPNk52NXZySDFlbTJ5dUYyaStoc2JVS1Q1RjdOblliVzk4M1ZV?=
 =?utf-8?B?eGVZSWlPUTZuekNtTlFSMEJBeWU0UEZESEptYk9maFhiWDFTbW1XeStQdmN3?=
 =?utf-8?B?cjcrSlNMdTlScThieWovSy9ZOFlMUmxqNVJTVWh0cnc5bHFKajZGUjR0STJv?=
 =?utf-8?B?elBaNHZuaUk5T1hCNHArYUF2YUlXRWcwZHQxNksrOXEzbndMdnFlcTE1WVI1?=
 =?utf-8?B?cXJSK1dPVkhYbkJHUDJESytEM1VmT2VIVmpMTFBuaVpDc2xDa0xiMGFDV1g4?=
 =?utf-8?B?dEFHZnB4OE5xUkI0R2xwdVV0cHRTajN3RFpUNnVselVVZ3FNNjBoZkZVQnZl?=
 =?utf-8?B?ZU1uTW14bzRhWFRDNGZnd29MVGVIMCszV0dqREVCeThrNjA2NTloRTM2clhB?=
 =?utf-8?B?R09XU0NxVjJscGpDUUJGNDVoNS9vcXhISHcrSlhUdURBZDRTVEpNZFM3dE1x?=
 =?utf-8?B?dUgwaUpTNW05R2R5SklzWGdIK3dHOXZSMlhSajlaVkpXVlBQbUE4cEpoR2ta?=
 =?utf-8?B?Qlo4SzI4djltcElUVytTekxacnUrS0FVZGQ5SnFaY2ovOU10Qnk2SDh3MGdw?=
 =?utf-8?B?b3ZpZU0wOE1OUm1VTUtZMmQrekNYeDZqMUNiaWQ1VlVHV2JyRTgwUmcraEhu?=
 =?utf-8?B?TkVtVWYvZGUzUmhsUVhrVkVUTmRneXY3dUoxVEhGc0pJMFpXaStNL1FJMXFv?=
 =?utf-8?Q?m4ot35N1cDc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ny9zR1VGb1ZqQ1oxQ3loY0VEaWMzeVZhaGVGZ1VBSlZSV01BTWpDektHbTRV?=
 =?utf-8?B?bW1KQzN4bkNBbStZcmcwa3FKakNnb2UxNU5VckVYZXdlYVJTWEd6M2ZzSXNX?=
 =?utf-8?B?ME1uKzFLMlRtTG10NDlGNlgvVDJ3RW5mOVJOblQ4OW1vd0UzVUUrKzYzQ0Fx?=
 =?utf-8?B?azM4Z1dWeUsyZUdNSnRYR0FPLzNQYkFCNXdmSmJIQURpbDJiK2JLdjRBWCtt?=
 =?utf-8?B?T3hmUERIcTZMR3dsblFNSzVwbHFKeHhwREkraHdFZ2I5OTNqVjNqcHlGUDdH?=
 =?utf-8?B?cVBkcy9KZUVEdjFvMWlXY2Q0N3BPdTd0eENhU25rUE1yTmlieTZ1Qi9tV0lm?=
 =?utf-8?B?Vk1aSlE0VElwNDRVRXJjSDRrWVNCazgvaFovYjBmT0ZWY29oUWZ3clc3S3FV?=
 =?utf-8?B?NkFueTRua3BvYlZ6bVoyZWpJSnVReFNRdHcxUS9nNTVGQzNKaU1Kb0lweVdK?=
 =?utf-8?B?dW9xSDhRRThrRDltZGI0MEtIMTMzVmZRYW43LytCdFo0YmJuaE9RQWlwOGMw?=
 =?utf-8?B?dnFIVEoxRjdHWVlHYWJnZjNOa2dIMlFXZEZvNFF6Y2JyakdJTDRXeGY3YlNs?=
 =?utf-8?B?ekY1bEpjZTlldkFJeUVGWE1lcDFKQ0xUdlNSKzNhQUo4WldqV3haS1NDUmQ4?=
 =?utf-8?B?d3YrbSsyL1plcitRRDYyRVNLM3IrWXBlZy96b1Y5MUVuRUtJQmdvNkNpL0dH?=
 =?utf-8?B?RE0xZS85Z3N1MlNZUVB2VEtLUUZSY21pUmo5UkVDNE83YlpwNXpGSDZtR0pO?=
 =?utf-8?B?a0crbitTRnVUUlA1SGVOcFVNejNWV1lmWEYvR2QrWjhqK3dqbk1oMGhWYUxZ?=
 =?utf-8?B?TDVzSEJMM2xuS005aWxDdlhRZldDYkJUcTdvRERJRjhJNlR4ZEJsRVJCQ2Nu?=
 =?utf-8?B?NFlIY1JBZDRJSnZDS3RTNUNzM2tBSGk2VmppdUE0Q2tRYTN5WldJWlVEcVhy?=
 =?utf-8?B?MkZpdlJwNGtVQThIZGVsVW02Q2g4MFhyNk5ua3FCQkNETXMwcE9TT2xtamND?=
 =?utf-8?B?ZlNUVWlaK2tHd1QzVURPMWpnWHA4KytwNDZIUHpUditzQ01zUjRMMVdhK3pw?=
 =?utf-8?B?MjRoVy81SGk0Zy9SSXkyeThQUmlqanQ1RWplZTVKR2tJbjhxaC9MdDBoa3NE?=
 =?utf-8?B?QUR1QUVlbGVtWmNFcVd4UHVubGxXYXpnNEZXUi94VTdESTA4OXVSTzN3K0tL?=
 =?utf-8?B?aEFqZ1ZQSUQ2K0VYVjJtNHNRQmV4NjJmNHp5c1NlZGk5SXlDWUY2UzUxZVVh?=
 =?utf-8?B?blJ5d2loSFF6MWxqdUQxRTgwYW1qLy8weXJrN3JLamp3dWFSRHExVmkydjFO?=
 =?utf-8?B?bHRERUVLclp4RXNnQllSWEt5WjM5SlNLWjg2b1I5M1FBZXdkN1ZXSVZiQ21T?=
 =?utf-8?B?am5KdWlZTEtDbEhLZytYRHphS1FBRkVpcXcrdTM1RTlaZVZnTGd5K0V3RHI2?=
 =?utf-8?B?U1BtRUk0NjdqVysvRTVxWjdJYmtCTjFST3Z5Rm9xVHZROTh3azd6ZEpLS0Rv?=
 =?utf-8?B?TlRZOWdRWkNFdEo2RFZnN09JUDQrYnc2eDFFejdOTjg4eCtKL0VVSVZSSUsv?=
 =?utf-8?B?U2NadmVzL3owVU1xQXF5Rko5UW1YNzE2YWtOWnNnajBBbEk4QzJjK084OVZq?=
 =?utf-8?B?QnJLVVVJUThsdXFQWXdkektFNEVLV21sMWJqVDcrUGtiUWhaenFtTVlzeEJt?=
 =?utf-8?B?MmRHSDVpdWRGMThTam14dVJQSnV3UGZFVWs0RFhiZFEwMnZrSXZBZU4xbzRO?=
 =?utf-8?B?TlJqRTlNTmRyOC9CVGZtOHdpUXRxcytQOWJRSEdWVGw3VXZXS0tBRkR2SHdB?=
 =?utf-8?B?SlUwUmJtVkVaTTJtcGhQRW9VOEQvQzZjdHVDOUJPV3Z3MVF1RGZvN2ZmOXU4?=
 =?utf-8?B?aHlkWGNsNjhpRFpzdHNlcFNvbkYva0VVYXQ5QW5oRzJvcTlIYjVGZmkyMWtS?=
 =?utf-8?B?Lyt1UTZxaE53S1l1M290dlBPUVp4ekh2ZWE0RGlJUmEyOS8reE1pMVhaZ3I4?=
 =?utf-8?B?VkFuK09BNVFpL2o5YlYvRVlrTWNDTHAwemdTM1FZbXMzMmxlWVN5dTBiZmdT?=
 =?utf-8?B?UGlGTEZJQWl6SVdpSFpnaHlaOENPdkZrdU1ZU2hSYnZ0c2UrWDJiZjZMOGha?=
 =?utf-8?Q?pkco=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8156EE734229E244B3EFAF487294E9DF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b924ab24-d0e7-4970-50fd-08ddc5531b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 16:58:08.5844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkfpxJX5KtA0tMpE+ZznuUwfgb3iWsghuMxuuRDz7pvuWjzPcMhPF9WLCF1FDL+Y+CApsCt9OGx+CAV69Silsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6633
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

T24gNy8xNy8yNSAxMTo1NSBBTSwgTWVsaXNzYSBXZW4gd3JvdGU6DQo+IE9uIDE3LTA3LTIwMjUg
MTM6MzksIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToNCj4+IE9uIDcvMTcvMjUgOTozNiBBTSwg
TWVsaXNzYSBXZW4gd3JvdGU6DQo+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCBlMWJkNWUwYmI0Y2Ew
ZDYzM2FkNjk4YWJkMzY1OGY4MjY1MDA5YjgxLg0KPj4+DQo+Pj4gVGhlIGNvbW1pdCBjYXVzZXMg
YSByZWdyZXNzaW9uIGluIFN0ZWFtIERlY2sgKERDTiAzLjAxKSwgcmVpbnRyb2R1Y2luZyBhDQo+
Pj4gZnVuY3Rpb25hbCBpc3N1ZSByZXBvcnRlZCBpbiBbMV0gdGhhdCB3YXMgZml4ZWQgYnkgY2Fs
bGluZyB0aGUNCj4+PiBjbGVhcl91cGRhdGVfZmxhZ3MoKSBmcm9tIGNvbW1pdCA3NjcxZjYyYzEw
ZjJhLg0KPj4+DQo+Pj4gT24gU3RlYW0gRGVjaywgd2UgdXNlIG11bHRpcGxlIGh3IHBsYW5lIGNv
bG9yIGNhcHMgYW5kIHVwIHRvIHR3byBvdmVybGF5DQo+Pj4gcGxhbmVzIHdpdGggZHluYW1pYyBw
aXBlIHNwbGl0IHBvbGljeS4gSS5lLiB3aXRoIDEgcHJpbWFyeSArIDEgb3ZlcmxheSwNCj4+PiB0
aGUgZHJpdmVyIHNwbGl0IHBsYW5lcyBpbnRvIHR3byAod2l0aCA0IHBpcGVzKSwgYnV0IHdpdGgg
MSBwcmltYXJ5ICsgMg0KPj4+IG92ZXJsYXlzLCB3ZSBkb24ndCBoYXZlIGVub3VnaCBwaXBlIGZv
ciBzcGxpdHRpbmcuIEdsaXRjaGVzIGFwcGVhciBpbg0KPj4+IHRoaXMgcGlwZS1zcGxpdCB0cmFu
c2l0aW9uIG9mIDEtMiBvdmVybGF5IHBsYW5lcywgaWYgdGhlIGRyaXZlciBkb2Vzbid0DQo+Pj4g
Y2xlYXIgdXBkYXRlIGZsYWdzLg0KPj4+DQo+Pj4gQmVzaWRlcyB0aGF0LCB0aGUgaXNzdWUgdGhl
IGNvbW1pdCBlMWJkNWUwYmI0Y2EgdHJpZXMgdG8gYWRkcmVzcyBbMl0NCj4+PiBpc24ndCBmdW5j
dGlvbmFsLg0KPj4+DQo+Pj4gTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2Ry
bS9hbWQvLS9pc3N1ZXMvMzQ0MSBbMV0NCj4+PiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy80MTI5IFsyXQ0KPj4+IFNpZ25lZC1vZmYtYnk6IE1l
bGlzc2EgV2VuIDxtd2VuQGlnYWxpYS5jb20+DQo+Pg0KPj4gQ2FuIHlvdSBwbGVhc2UgZG91Ymxl
IGNoZWNrIHRoZSB1c2UgY2FzZSB0aGF0IHByb21wdGVkDQo+PiBlMWJkNWUwYmI0Y2EwZDYzM2Fk
Njk4YWJkMzY1OGY4MjY1MDA5YjgxIGluIHRoZSBmaXJzdCBwbGFjZT8gIElFIFdpdGgNCj4+IHRo
aXMgcmV2ZXJ0IHlvdSBwcm9wb3NlZCBkbyB5b3Ugc2VlIGEgdHJhY2ViYWNrIG9uIHVucGx1ZyBv
ZiBleHRlcm5hbA0KPj4gZGlzcGxheT8NCj4gDQo+IEhpIE1hcmlvLA0KPiANCj4gSSBkb24ndCBz
ZWUgZWl0aGVyIHRyYWNlYmFjayBvciBSRUdfV0FJVCB0aW1lb3V0IHdoZW4gdW5wbHVnZ2luZyBh
bg0KPiBleHRlcm5hbCBIRE1JLWNvbm5lY3RlZCBkaXNwbGF5Lg0KPiBJIHRyaWVkIHdpdGggdGhl
IERlY2sgRG9jayBhbmQgVVNCLUMgdG8gSERNSSBhZGFwdGVyLiBOb3Qgc3VyZSBpZiB0aGVyZQ0K
PiBpcyBhIHZlcnkgc3BlY2lmaWMgc2NlbmFyaW8gdGhhdCB0cmlnZ2VycyB0aGlzIHRoYXQgSSBk
aWRuJ3QgY292ZXIuDQoNCk5vOyBpdCdzIHF1aXRlIGEgZ2VuZXJhbCBwcm9ibGVtIGFuZCBlYXN5
IHRvIHJlcHJvZHVjZS4gIFRoaXMgbWFrZXMgbWUgDQp3b25kZXIgaWYgdGhlcmUgc2hvdWxkIGJl
IGFuIGV4Y2VwdGlvbiBjYXJ2ZWQgb3V0IGZvciBTdGVhbSBEZWNrIGluc3RlYWQuDQoNCj4gDQo+
IFRoZSBvbmx5IG1lc3NhZ2Ugb24gZG1lc2cgZnJvbSB0aGlzIGFjdGlvbiBpczoNCj4gYW1kZ3B1
IDAwMDA6MDQ6MDAuMDogYW1kZ3B1OiBwcF9vZF9jbGtfdm9sdGFnZSBpcyBub3QgYWNjZXNzaWJs
ZSBpZg0KPiBwb3dlcl9kcG1fZm9yY2VfcGVyZm9ybWFuY2VfbGV2ZWwgaXMgbm90IGluIG1hbnVh
bCBtb2RlIQ0KPiANCj4gTW9yZW92ZXIsIGlmIEkgbW92ZSB0byB0aGUgRGVza3RvcCBtb2RlIChL
REUpLCB0aGVyZSBpcyBubyBtZXNzYWdlLg0KPiANCj4gTWVsaXNzYQ0KPiANCj4+DQo+Pj4gLS0t
DQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDUgKysr
LS0NCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jDQo+Pj4g
aW5kZXggYzMxZjdmOGU0MDlmLi43YzQ4ZjcyZTU5MTcgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4+PiBAQCAtNTQ0Myw3ICs1NDQzLDggQEAg
Ym9vbCBkY191cGRhdGVfcGxhbmVzX2FuZF9zdHJlYW0oc3RydWN0IGRjICpkYywNCj4+PiAgICAJ
ZWxzZQ0KPj4+ICAgIAkJcmV0ID0gdXBkYXRlX3BsYW5lc19hbmRfc3RyZWFtX3YyKGRjLCBzcmZf
dXBkYXRlcywNCj4+PiAgICAJCQlzdXJmYWNlX2NvdW50LCBzdHJlYW0sIHN0cmVhbV91cGRhdGUp
Ow0KPj4+IC0JaWYgKHJldCAmJiBkYy0+Y3R4LT5kY2VfdmVyc2lvbiA+PSBEQ05fVkVSU0lPTl8z
XzIpDQo+Pj4gKw0KPj4+ICsJaWYgKHJldCkNCj4+PiAgICAJCWNsZWFyX3VwZGF0ZV9mbGFncyhz
cmZfdXBkYXRlcywgc3VyZmFjZV9jb3VudCwgc3RyZWFtKTsNCj4+PiAgICANCj4+PiAgICAJcmV0
dXJuIHJldDsNCj4+PiBAQCAtNTQ3NCw3ICs1NDc1LDcgQEAgdm9pZCBkY19jb21taXRfdXBkYXRl
c19mb3Jfc3RyZWFtKHN0cnVjdCBkYyAqZGMsDQo+Pj4gICAgCQlyZXQgPSB1cGRhdGVfcGxhbmVz
X2FuZF9zdHJlYW1fdjEoZGMsIHNyZl91cGRhdGVzLCBzdXJmYWNlX2NvdW50LCBzdHJlYW0sDQo+
Pj4gICAgCQkJCXN0cmVhbV91cGRhdGUsIHN0YXRlKTsNCj4+PiAgICANCj4+PiAtCWlmIChyZXQg
JiYgZGMtPmN0eC0+ZGNlX3ZlcnNpb24gPj0gRENOX1ZFUlNJT05fM18yKQ0KPj4+ICsJaWYgKHJl
dCkNCj4+PiAgICAJCWNsZWFyX3VwZGF0ZV9mbGFncyhzcmZfdXBkYXRlcywgc3VyZmFjZV9jb3Vu
dCwgc3RyZWFtKTsNCj4+PiAgICB9DQo+Pj4NCg0K
