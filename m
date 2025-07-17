Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC44EB094C4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072910E894;
	Thu, 17 Jul 2025 19:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bqyypIcj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B2F10E892;
 Thu, 17 Jul 2025 19:17:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dANS6yjnP1AOQ3BGN6sE9P3VddcIZFPl81mjZ/5HD4buxMCInrbusR9MgbJ6wfvJ5PhCfvXJa+UxCSqq9BC/Qzic005rJV5owR7DPzMkSKU6vkrvsQVIBCbGQs4l2k6+srV6Ylz6CNa17b83iIOjkiWjqE6mutAv7s32N9LfVp9vo1wbdahDSGwRh8KVbQnEriFXM7U57KWhAzVlZrefLiP7ljR/QzXVtl/ScjGk67peYm+POeYJus02IfoKAtkFkN1O6nS+8Hld/tEWhdtlW4qFB57N7JFboEJHJwv82PdCG8NmYa8wsLKghASg7fKD2WnGambTQCyisO3lnXn3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVbrzJVvuOvzX2ug8wEVqoYRHnlEXWxZtHN9HIPPQNU=;
 b=Cozc8G/LXj5Gvak24Bz46X8VYBP2HF//CSH8I/dIwnwf51EvsR9DC4nINNCsrROMOjXuIUiVCl9eVpNenfhVuMNroOfInJKXQ3HwNaivnvhV37ILoqyzV3US9Ngt/Ez2WFXh85fzeixrilrCwVcABfTmcHY51gqVzlAV9D1tQ3bYHsk9PytQbqqGTOc5kqLMyo7g825FgGdsO1GG/e1OHTaG1CtNtmYTf+pjte3FMQz0R2aYVHrFiVUvRE0+HFlqMNvsK/O2A6ir09nLTZp+FiBu7vOLzAdumJ6cvH/YXHvbeakjfd5IcDNwpIMraTIEIUnCRVw4w5HJ6ukuiNrgDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVbrzJVvuOvzX2ug8wEVqoYRHnlEXWxZtHN9HIPPQNU=;
 b=bqyypIcj8XHgFJkr1HfPKAV+evrqLNEvSxNiW1PGstSbAdB7pm8X66OfISC6XJ12Ptv2O9gjP8ow1XJ48Iz+o7vcXfsjDF06eONS6XnALHjl2mxoxLajJGMTGzUpcZ1UQ0/0TvO5Re1g4TJgw1H+4ouEmNMQS1hB6r565ZShUP4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6758.namprd12.prod.outlook.com (2603:10b6:a03:44a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Thu, 17 Jul
 2025 19:17:43 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.036; Thu, 17 Jul 2025
 19:17:43 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>, "Liu, Charlene"
 <Charlene.Liu@amd.com>, Melissa Wen <mwen@igalia.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "Hung, Alex"
 <Alex.Hung@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
Thread-Topic: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
Thread-Index: AQHb9yhimdXJd2sAV0ekpQZXo91gObQ2iQGXgAAiL3+AAAVvgA==
Date: Thu, 17 Jul 2025 19:17:43 +0000
Message-ID: <c35a9a52-3d75-450e-b9ba-350b9308f446@amd.com>
References: <20250717143738.84722-1-mwen@igalia.com>
 <70ac7b1e-9a28-45ff-b7b2-ab0f4fe9030a@amd.com>
 <bb4099a70c2a8c78ef07d5fb6a8f0d3b@igalia.com>
 <55467ebe-42c8-4387-9a61-aa60b3a84053@amd.com>
 <BA28247C-9779-4C4C-A8E3-ACF57BEF1521@gwmail.gwu.edu>
In-Reply-To: <BA28247C-9779-4C4C-A8E3-ACF57BEF1521@gwmail.gwu.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6758:EE_
x-ms-office365-filtering-correlation-id: 84aca6ba-3eb5-4310-b386-08ddc5669b39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VlgvdDdWcTgzTElJVnBMRHU5V2ZMZW13eWNKUExWRDh6WGtYT2xrZ0RmYkRi?=
 =?utf-8?B?MmU3RWFtYmxnTytJQ05aTW1kVXdaTmM4RnpDc1RBbUZoMFRjZDZSK29WZVNl?=
 =?utf-8?B?ZjhRcWYrQTQxd1dUNjZzcit4TVRWOE9wNURlYnpJUDlXU1ZTSVZ6QkNydGhV?=
 =?utf-8?B?bkg3KzZ5MFNVOFJ2ODBUWnNxdXNCM3dMS1FmU2kyaDYrcGxPMldwcGwxYVhs?=
 =?utf-8?B?dmRpemdyZVplYktGRllwTXA0QU9tS0NGb3krM2lnOXB3V0t4TS84MWQ3cWdm?=
 =?utf-8?B?a2Y5UDRzc2duTU9oZFJGWEd3d1JOUGE0ZFRjZHlqWHpKV1kydkJxSFVHR1Y0?=
 =?utf-8?B?ZDN2UHhlZTBNTWtlRGpWeEhpaHdvYmJFT1ptYSt1Vy9qYnd1RUJ5RjdsOFJw?=
 =?utf-8?B?RXdJbVpweWRjMnZhWFZwNGlSYXluaEZsdTF1dGpnZzdiRGdVVnVQUnBvQnF0?=
 =?utf-8?B?aUlZa2RjeFhRdnlwS0JmcWFEbWpZY2dRWTgyNWNYUzZBWTJaVnI1ZmppbGlZ?=
 =?utf-8?B?b0xBbmlvWlNWVm1KMkFQV0FXV0M0UUdmWHhBWXhUSHNoSTBndGtjdXAxQkVp?=
 =?utf-8?B?MXVXM1RnQm5VYkFtNGp4eHpnQm9DWStqUXlsUTJVRHIxYXRVdTRrQkpsUVNK?=
 =?utf-8?B?alFtNHExMXNGZjZ6eHh4S0lWZjB0SXhJYTdrTDZLazVPVHIyOWFFTzNXenNT?=
 =?utf-8?B?b2N2ZTdPZk1Beng1MTdnWmJHUktuYTcvOWN3Z0g4SHlvL0d0WmhMWWw2Tk9T?=
 =?utf-8?B?VWloN2wwaE1XU21BSWJ1YTIrY3cvWW41NWdzYTFIQ2pFRHF4elZjS0NUNHd4?=
 =?utf-8?B?NkNyUC81MjlRT3lUNko2R2kvLzJoNmJWRm8ydWQyc1NrVHEyS0F2Zmw3Y1dq?=
 =?utf-8?B?TE8vbk4rMkN4VFRPV1pldU1lRXJzakRrNnhCRlZiVm9PUUNsMUJYSS9MNi9N?=
 =?utf-8?B?NmUyb2xabEQxS1d4OU43R29jeW9xWm5EaGtNYlM5U3BqUnRuZmV2c0pUNWwx?=
 =?utf-8?B?bktvWU16TldVbzRxRTZ1UWs3UkQ5QVh5RGx0dklONTdGcWZpaHVLdnVOSnRt?=
 =?utf-8?B?cnUxOFpWSWsrRW1HY0JicTI0T1JJQko2WS95U09QekRqa28zMlh3SFMrV2Y3?=
 =?utf-8?B?b1dMNWJRY1llaFpTajBVcy9LNEtoK0NBcUVySjhvV0ZWZXIvczQzS0ZZRm5Z?=
 =?utf-8?B?MVlhR2VMR3ZlN2MyRTZ3ZzFTVUxIYXBRYkRrZjR4VXBxbjdWODVDcmV3Q2pu?=
 =?utf-8?B?bGgwY05FaDBYb28vOUoxeXNZT1FqbGJ3STJoNHkrTUx1eG5QUEhPVHV4TFdt?=
 =?utf-8?B?Q3NPWUdxTzllbVlHZ2RvZllRQVcyQTVmL3JwUHoydm5nS1BkNU1ER284YkNC?=
 =?utf-8?B?cXI1SE5UZnZ4cG9NMXRZd25BbTFCaHlsU0ZjaCtadUF6MllRRTdvbjJUaFpu?=
 =?utf-8?B?aUxENWphbDdNVDlwRHlMMEZ5TWdpcjBnenEwbm9KZmI1OWtsOWlVU2U3ZjJI?=
 =?utf-8?B?TllycHY0K1I3VnlNdCtudVdKMWdwbUNUODh6VEZQcTNzRWlsa0tHZngzQjZz?=
 =?utf-8?B?a1cvc3FKM2Y4YUlDTTBtcExHUSs0eXV6S2NRY0U2dWVlMjdvN2JKY09vTDhK?=
 =?utf-8?B?Nnhla0htR3ZVeWkrd2MxcHA3RzhiRE9nQ3FqRHdQNnJXRERIVUtaUnJjK3Bi?=
 =?utf-8?B?TzZBZjNWem1QVXlsU2NJOFZtRGE4aWZXMmRPQzdUaUlaMyt1azgwaS80NHd0?=
 =?utf-8?B?S1doL1BHUExuU3dxOG9hTngrcHJaT0Uxb0Rzb0NkR25mSDVhUW1qT2tnZm81?=
 =?utf-8?B?R1A3WXMyL3M1d2F2MGkxTWZ1U2lpZk41ajBRdWsybXovdWU4YlFMSWZYaEdz?=
 =?utf-8?B?WWVPc0kzZWNOakQ4aDdDQ25JMitaOGNGZEFCdTh6Ylc2azRqV1ZDamlOVUZn?=
 =?utf-8?Q?3W8hsqnAbOs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTUyMXlRTUJNRm5ndnk4ZGdVa3FWM1dUK2FwYkpVLzNucFRCK1c2aHNCVzRE?=
 =?utf-8?B?WXhlc0MxcDJoOFp5eUFZODlia3BHZytLNStQSlJtdnB1OHRYNkd6QVNTcXV6?=
 =?utf-8?B?RUczbjB3SDJEbGRpYjdtNXg3aFdLdGdRNEk5RkJPZExFOC9GTFBpajl4RlNZ?=
 =?utf-8?B?aENDMFZwSit5QXAvUXV1bnBXMG96K01HT1B5cnA5R1hUUlI5RnlwWElFTi9F?=
 =?utf-8?B?dnJXcGMrZnhRTGVYN0FyazlVU0tmbTY0MkZMZGFvWDEwbE9pYXZSV0duUWFz?=
 =?utf-8?B?d0FyUVJOcitBczlTdEFXcG16bjhuRGdFRk1ubklQUFJCcDZYRTRtOHhhd3A0?=
 =?utf-8?B?RC85SHhFL1ArQXVQTHh4bklMaDI3Nm1lNE1weHpTZ1NaT296RWZ2Mzdsa0Nw?=
 =?utf-8?B?N0NKM3pCdjVnRmwzRUROUEtJeUZOYlUwUzRXVEpLQks2d0pTQ0daWG40SmZX?=
 =?utf-8?B?bFd1S2hLZjQ1U09wYVB2UGxvL1pWeW4rUnI0UG1HTDZnTGcwWjhtbXRiYmhF?=
 =?utf-8?B?QzF1SjRlQ1M1T0VtZjZVSHlFOXlKVXJxRGZyWXFKcUtrc1dLU2JSdWltQTJh?=
 =?utf-8?B?cXc2ZENGT2hKekxrWk8vK3VjUS9FTi9hcUU3cHg2KzBBa0V0TnFuTVc2VFdK?=
 =?utf-8?B?L21BSm9YbWRrenNtbW9Wd1ZsTFJuUHBZU3BOVWJ4eCs5cTVHZjdYRHhqcVF4?=
 =?utf-8?B?Q2pnN2VGWml1WUwvTnZZclV5Qko0ZDNmOGpVSEpZUEU2OUgyTFdBd2RQTkZi?=
 =?utf-8?B?bGM3TGRVY2wvdTFobmt3TVE2VytoanBxZ2JNTm0zSVFJZ0hXaGZrYTU3OWpj?=
 =?utf-8?B?NnVsbXZvUFNnWFY0U2twNWVFclA5V2dyYXgzUHFRdmFJTnEva0RyVGsvU21a?=
 =?utf-8?B?MVZKV1BvNlJsNmV4eG9iOXNRNGZ1T0t0N2lzZkJBRXRRbWNyZ2FzSzJqSkU1?=
 =?utf-8?B?ZE5EcDB2SkZLcERlbTJuY0FsOWVGYVBXZXJCeUdWK2hISEVKMzR6T25kZ0xv?=
 =?utf-8?B?NG9oVTRpQk9JUFhHTDNGTVJ0N2xOUWlVcjJRdXhIS3FabHVoZGRQNGEwU3ZX?=
 =?utf-8?B?VVJST3FIUk9BNzh3a2pSV3l6SExYWE9wM001RHUwd3Y3Nmx4KzFzQmZoN2xk?=
 =?utf-8?B?bEY5WDY4Q2NqN0VTeGhVQ0RDdW1LdE53eERtQzdVMXJaQ3hWa3Y0Q0p6TWx2?=
 =?utf-8?B?cmFaN3NNRnNTdS8xYXZtY3M2RmVRMGlQNVorQ2hKS1VPVGhyd1N4aGVLVVdE?=
 =?utf-8?B?RUtxeDdVZi95K0lxUjVSV0dTWnYvVjRuTGZlTW1RRjFOSkEwZzFISU1VaGlZ?=
 =?utf-8?B?M2hIS2RhQktjOHNHK0JGMGE2VjF6UVdEQkxnN1NOcFVqZHBGaW9nRkwxdUVz?=
 =?utf-8?B?MkltUGN3d2xhQ2VhU2dPdnAwU0RvT3ZDSTU0ekM2Z1U2UkNYVTNlRzZxVXlp?=
 =?utf-8?B?ZFJHbDhxeUdyMFRCSkc5em5wZVRGRnR5eWhzWkFiaGg3MGg0UGEzbUFSZVUv?=
 =?utf-8?B?ZGRhNW42WEY1R09JMFJTWVdsTkxqOVo1K0pUTjExcTdNSkE5anQ0WmlWU1BL?=
 =?utf-8?B?eEF5b0JFUFhOcE9XZjlhVkh4OE1vRFd5ZytOUGpXZDM2NFpxdm92dWZ6TS9H?=
 =?utf-8?B?NTI3UFkzWFlhWldRV1ZNay9uMERmNlVHM0NpL3N0Q0tGdTY4clFoeEZtR05D?=
 =?utf-8?B?a3RmUGs1TndEVjliNUxkbDI4djNLVUdDcHFJaWdFY1pscGprOUY2SXh2S050?=
 =?utf-8?B?U2NEN3BTNnVpajh3dXJnU0tIWXNMTnV3YVFLMjNCUzZBbnlPRmhMV2FhK1ZZ?=
 =?utf-8?B?T0ppYlN4N0JoK3pZQkZGMkRnZUU2UnlQS2lySGkxWjlSVkJWejRWaVFWUnZE?=
 =?utf-8?B?c3p0VDVKSlhKU0JwSFh0aUJJT0ZmYzRUTTRsUmFFTTVyQkVvcTRqWk1RbFVz?=
 =?utf-8?B?d2svZ0FOcEl2ZmhMdy9CWXpmb3BFaGVxeXBXZ1N3czhud0lWN1doNkExb2NY?=
 =?utf-8?B?ZW1rY01BdisybWZVaUI2Vm5BOW9wTCsyZURnY05qakFOa0FmUUt1RHhMdlRC?=
 =?utf-8?B?ZDFVREt6eWt4U3lKREJlN3BuTTdUWFR3VTVtc3Q3RlA1SUEwSDZuNngyNEY4?=
 =?utf-8?Q?huEA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CA8644983879E49B717CB635F95DB7F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84aca6ba-3eb5-4310-b386-08ddc5669b39
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 19:17:43.7475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k+T28Ax4YHHbEs+0gOn58mQY4Gr6SL6V0Byxmhetkjnkvs60BfplITkTy5uFOmRfyb60WEAaegQ0p2FPKn2xKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6758
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

T24gNy8xNy8yNSAxOjU3IFBNLCBNYXR0aGV3IFNjaHdhcnR6IHdyb3RlOg0KPiANCj4gDQo+PiBP
biBKdWwgMTcsIDIwMjUsIGF0IDk6NTjigK9BTSwgTGltb25jaWVsbG8sIE1hcmlvIDxNYXJpby5M
aW1vbmNpZWxsb0BhbWQuY29tPiB3cm90ZToNCj4+DQo+PiBPbiA3LzE3LzI1IDExOjU1IEFNLCBN
ZWxpc3NhIFdlbiB3cm90ZToNCj4+PiBPbiAxNy0wNy0yMDI1IDEzOjM5LCBMaW1vbmNpZWxsbywg
TWFyaW8gd3JvdGU6DQo+Pj4+IE9uIDcvMTcvMjUgOTozNiBBTSwgTWVsaXNzYSBXZW4gd3JvdGU6
DQo+Pj4+PiBUaGlzIHJldmVydHMgY29tbWl0IGUxYmQ1ZTBiYjRjYTBkNjMzYWQ2OThhYmQzNjU4
ZjgyNjUwMDliODEuDQo+Pj4+Pg0KPj4+Pj4gVGhlIGNvbW1pdCBjYXVzZXMgYSByZWdyZXNzaW9u
IGluIFN0ZWFtIERlY2sgKERDTiAzLjAxKSwgcmVpbnRyb2R1Y2luZyBhDQo+Pj4+PiBmdW5jdGlv
bmFsIGlzc3VlIHJlcG9ydGVkIGluIFsxXSB0aGF0IHdhcyBmaXhlZCBieSBjYWxsaW5nIHRoZQ0K
Pj4+Pj4gY2xlYXJfdXBkYXRlX2ZsYWdzKCkgZnJvbSBjb21taXQgNzY3MWY2MmMxMGYyYS4NCj4+
Pj4+DQo+Pj4+PiBPbiBTdGVhbSBEZWNrLCB3ZSB1c2UgbXVsdGlwbGUgaHcgcGxhbmUgY29sb3Ig
Y2FwcyBhbmQgdXAgdG8gdHdvIG92ZXJsYXkNCj4+Pj4+IHBsYW5lcyB3aXRoIGR5bmFtaWMgcGlw
ZSBzcGxpdCBwb2xpY3kuIEkuZS4gd2l0aCAxIHByaW1hcnkgKyAxIG92ZXJsYXksDQo+Pj4+PiB0
aGUgZHJpdmVyIHNwbGl0IHBsYW5lcyBpbnRvIHR3byAod2l0aCA0IHBpcGVzKSwgYnV0IHdpdGgg
MSBwcmltYXJ5ICsgMg0KPj4+Pj4gb3ZlcmxheXMsIHdlIGRvbid0IGhhdmUgZW5vdWdoIHBpcGUg
Zm9yIHNwbGl0dGluZy4gR2xpdGNoZXMgYXBwZWFyIGluDQo+Pj4+PiB0aGlzIHBpcGUtc3BsaXQg
dHJhbnNpdGlvbiBvZiAxLTIgb3ZlcmxheSBwbGFuZXMsIGlmIHRoZSBkcml2ZXIgZG9lc24ndA0K
Pj4+Pj4gY2xlYXIgdXBkYXRlIGZsYWdzLg0KPj4+Pj4NCj4+Pj4+IEJlc2lkZXMgdGhhdCwgdGhl
IGlzc3VlIHRoZSBjb21taXQgZTFiZDVlMGJiNGNhIHRyaWVzIHRvIGFkZHJlc3MgWzJdDQo+Pj4+
PiBpc24ndCBmdW5jdGlvbmFsLg0KPj4+Pj4NCj4+Pj4+IExpbms6IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzM0NDEgWzFdDQo+Pj4+PiBMaW5rOiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy80MTI5IFsyXQ0KPj4+
Pj4gU2lnbmVkLW9mZi1ieTogTWVsaXNzYSBXZW4gPG13ZW5AaWdhbGlhLmNvbT4NCj4+Pj4NCj4+
Pj4gQ2FuIHlvdSBwbGVhc2UgZG91YmxlIGNoZWNrIHRoZSB1c2UgY2FzZSB0aGF0IHByb21wdGVk
DQo+Pj4+IGUxYmQ1ZTBiYjRjYTBkNjMzYWQ2OThhYmQzNjU4ZjgyNjUwMDliODEgaW4gdGhlIGZp
cnN0IHBsYWNlPyAgSUUgV2l0aA0KPj4+PiB0aGlzIHJldmVydCB5b3UgcHJvcG9zZWQgZG8geW91
IHNlZSBhIHRyYWNlYmFjayBvbiB1bnBsdWcgb2YgZXh0ZXJuYWwNCj4+Pj4gZGlzcGxheT8NCj4+
Pg0KPj4+IEhpIE1hcmlvLA0KPj4+DQo+Pj4gSSBkb24ndCBzZWUgZWl0aGVyIHRyYWNlYmFjayBv
ciBSRUdfV0FJVCB0aW1lb3V0IHdoZW4gdW5wbHVnZ2luZyBhbg0KPj4+IGV4dGVybmFsIEhETUkt
Y29ubmVjdGVkIGRpc3BsYXkuDQo+Pj4gSSB0cmllZCB3aXRoIHRoZSBEZWNrIERvY2sgYW5kIFVT
Qi1DIHRvIEhETUkgYWRhcHRlci4gTm90IHN1cmUgaWYgdGhlcmUNCj4+PiBpcyBhIHZlcnkgc3Bl
Y2lmaWMgc2NlbmFyaW8gdGhhdCB0cmlnZ2VycyB0aGlzIHRoYXQgSSBkaWRuJ3QgY292ZXIuDQo+
Pg0KPj4gTm87IGl0J3MgcXVpdGUgYSBnZW5lcmFsIHByb2JsZW0gYW5kIGVhc3kgdG8gcmVwcm9k
dWNlLiAgVGhpcyBtYWtlcyBtZQ0KPj4gd29uZGVyIGlmIHRoZXJlIHNob3VsZCBiZSBhbiBleGNl
cHRpb24gY2FydmVkIG91dCBmb3IgU3RlYW0gRGVjayBpbnN0ZWFkLg0KPiANCj4gSSBqdXN0IHRl
c3RlZCBEQ04gMy4xLjIgKFoyIEdvKSBhbmQgRENOIDMuMS40IChMZWdpb24gR28vUk9HIEFsbHkp
IGFuZA0KPiBJIHdhcyBub3QgYWJsZSB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHNvIGEgU3RlYW0g
RGVjayBjYXJ2ZW91dCBtaWdodCBtYWtlDQo+IHNlbnNlIGhlcmUuDQoNClRoYW5rcyBhIGxvdCBN
YXR0IQ0KDQpVbmxlc3MgQ2hhcmxlbmUgZGlzYWdyZWVzLCBJICp0aGluayogZm9yIG5vdyBhIGNh
cnZlb3V0IHdpdGggYSBjb21tZW50IA0KZXhwbGFpbmluZyB3aHkgaXMgdGhlIHdheSB0byBnby4N
Cg0KPiANCj4gTWF0dA0KPiANCj4+DQo+Pj4NCj4+PiBUaGUgb25seSBtZXNzYWdlIG9uIGRtZXNn
IGZyb20gdGhpcyBhY3Rpb24gaXM6DQo+Pj4gYW1kZ3B1IDAwMDA6MDQ6MDAuMDogYW1kZ3B1OiBw
cF9vZF9jbGtfdm9sdGFnZSBpcyBub3QgYWNjZXNzaWJsZSBpZg0KPj4+IHBvd2VyX2RwbV9mb3Jj
ZV9wZXJmb3JtYW5jZV9sZXZlbCBpcyBub3QgaW4gbWFudWFsIG1vZGUhDQo+Pj4NCj4+PiBNb3Jl
b3ZlciwgaWYgSSBtb3ZlIHRvIHRoZSBEZXNrdG9wIG1vZGUgKEtERSksIHRoZXJlIGlzIG5vIG1l
c3NhZ2UuDQo+Pj4NCj4+PiBNZWxpc3NhDQo+Pj4NCj4+Pj4NCj4+Pj4+IC0tLQ0KPj4+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyB8IDUgKysrLS0NCj4+Pj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4+
Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jDQo+Pj4+PiBp
bmRleCBjMzFmN2Y4ZTQwOWYuLjdjNDhmNzJlNTkxNyAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMNCj4+Pj4+IEBAIC01NDQzLDcgKzU0NDMs
OCBAQCBib29sIGRjX3VwZGF0ZV9wbGFuZXNfYW5kX3N0cmVhbShzdHJ1Y3QgZGMgKmRjLA0KPj4+
Pj4gICAgIGVsc2UNCj4+Pj4+ICAgICByZXQgPSB1cGRhdGVfcGxhbmVzX2FuZF9zdHJlYW1fdjIo
ZGMsIHNyZl91cGRhdGVzLA0KPj4+Pj4gICAgIHN1cmZhY2VfY291bnQsIHN0cmVhbSwgc3RyZWFt
X3VwZGF0ZSk7DQo+Pj4+PiAtIGlmIChyZXQgJiYgZGMtPmN0eC0+ZGNlX3ZlcnNpb24gPj0gRENO
X1ZFUlNJT05fM18yKQ0KPj4+Pj4gKw0KPj4+Pj4gKyBpZiAocmV0KQ0KPj4+Pj4gICAgIGNsZWFy
X3VwZGF0ZV9mbGFncyhzcmZfdXBkYXRlcywgc3VyZmFjZV9jb3VudCwgc3RyZWFtKTsNCj4+Pj4+
DQo+Pj4+PiAgICAgcmV0dXJuIHJldDsNCj4+Pj4+IEBAIC01NDc0LDcgKzU0NzUsNyBAQCB2b2lk
IGRjX2NvbW1pdF91cGRhdGVzX2Zvcl9zdHJlYW0oc3RydWN0IGRjICpkYywNCj4+Pj4+ICAgICBy
ZXQgPSB1cGRhdGVfcGxhbmVzX2FuZF9zdHJlYW1fdjEoZGMsIHNyZl91cGRhdGVzLCBzdXJmYWNl
X2NvdW50LCBzdHJlYW0sDQo+Pj4+PiAgICAgc3RyZWFtX3VwZGF0ZSwgc3RhdGUpOw0KPj4+Pj4N
Cj4+Pj4+IC0gaWYgKHJldCAmJiBkYy0+Y3R4LT5kY2VfdmVyc2lvbiA+PSBEQ05fVkVSU0lPTl8z
XzIpDQo+Pj4+PiArIGlmIChyZXQpDQo+Pj4+PiAgICAgY2xlYXJfdXBkYXRlX2ZsYWdzKHNyZl91
cGRhdGVzLCBzdXJmYWNlX2NvdW50LCBzdHJlYW0pOw0KPj4+Pj4gICAgfQ0KPiANCj4gDQoNCg==
