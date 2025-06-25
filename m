Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF583AE756C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 05:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8F310E051;
	Wed, 25 Jun 2025 03:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="nvkH16hW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AFA10E051
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 03:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVPbt+EFD7j1Qh7/OuCoBlv/HzrcicUKrrdXH2F/LKmp5MhzFOz8rO+u66JIhuFDMe9L0C1STxWgFZnuVC7VnLiNwnTVdVJUb8gjbHZujSSwkArYDln+DQYW8b+9o0isDACblebeRUQT1+TSTS12D4H0DDmkf3fEkKK2meyqvXmXS9eKpwT8wwVaOAUMs4XY9rTyahDhoAB5r4GU6UErikKfKhS81UYbBGexpqaW3LAa73cdEeTn6KmSRefaNvuQJSa1LJinuOo2YBP19GCamdWWhusA+zXsy6xmKQ4iPsrcL4MGpfskxqBoCmRrCyvynsX/evq6XcBNzM7CzVlzpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dINjA/iRuXx+shZQnVVOEWyuiJ5XcgSDlITSSvhVfEo=;
 b=FsKGdqXT+eLZQrEsJISATiLTJk2XZcPT9D0z8EHF6CVHuPxSo+Akyi/UVzBqwPKJfWB0+yEjvSKYJPsOBl/BHOXtr1C1519QF0gA5tvGjdlWBhe5JNVsfxvbuqQURhX2vxa/ZNmiMY7Y/QUYL3uzqhL0O70EDSD3dcbxkmDM2qVqZ43C52jpgVADAgwq4KyWkpBS9GR0qhBNmzxqOw2shyaOku8eH4CY3RpH3Gq8+EcS/P9auU/ReV2bm6+5lKVICbz1xw4MQ9YRQsHYfv7F4YTA+s4tjILaqoBE7tAw/ABPyJAywsfzC7G4QoyjfCx6SwnEKn/IIoYPrG3TBwJWGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dINjA/iRuXx+shZQnVVOEWyuiJ5XcgSDlITSSvhVfEo=;
 b=nvkH16hWRY5gxkeuwIRZUnN3pK2E878+uW26dFFiyTszHH10pFBdrwX2DOIBt5F2rVVGSw1VBNWmHeGCL6Sl4h+rOUZDnznqhuN+bTO6rREqEgYnDp23klJsd6Me0oReoBUy1b86M+2/BOABXFVcOvMMHITLF+KEuU2dfek/NOAWrSPl/7y8G4fNg9eX2Bdf/reR1Bz6WnEhR1Ra75p6pc7DMA+2/kqCFYEBZuIozfQX9mf8sRWYK7G5w02EZskx7da+D/T+z+TOqcbTSnreY/cH2XSY85Rf1RoXgjgX3FPVx2FVqsRKLNxWJkF+6pTLvK4soruOss9+dsAn0ajYGA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 03:42:32 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%5]) with mapi id 15.20.8857.022; Wed, 25 Jun 2025
 03:42:32 +0000
From: <Dharma.B@microchip.com>
To: <mripard@kernel.org>
CC: <Manikandan.M@microchip.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] drm/bridge: microchip-lvds: switch to use atomic
 variants
Thread-Topic: [PATCH v4 2/3] drm/bridge: microchip-lvds: switch to use atomic
 variants
Thread-Index: AQHb5OnRj+ugbWFlN0yfN/M1L+xAq7QSJP0AgAEXiQA=
Date: Wed, 25 Jun 2025 03:42:32 +0000
Message-ID: <13f93095-c339-4238-843b-1f92ea83018b@microchip.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
 <20250624-microchip-lvds-v4-2-937d42a420e9@microchip.com>
 <20250624-beautiful-goose-of-penetration-c4ffde@houat>
In-Reply-To: <20250624-beautiful-goose-of-penetration-c4ffde@houat>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|PH7PR11MB5958:EE_
x-ms-office365-filtering-correlation-id: bc434dd4-0249-4a1f-f570-08ddb39a50ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SUVtVUFZK3ZUZktoVzE3djdIcW5IZHN6RHFUNmtkMmhvSDlicytjTkZCczlN?=
 =?utf-8?B?VWt0bUNlQ0pLeXg0QStrKzJUOWRwRm5BL2JJWFl6ZmRNQ0p6cUFFOGVUTVA1?=
 =?utf-8?B?cU9lKzQ0TVJ2M29UMFdGZmlVUnBHKy9XOTlkc1FiSkdyWU80N25qVlljbnlv?=
 =?utf-8?B?ZW5LcUFUZ2g5L0V0UEc0aDRuUzl4cmFMbTA4OUpnVXZjYVprMkxzSUtjTXFS?=
 =?utf-8?B?MitZZ3NXWmc1S0VZbEZTMUtQSzlOVC8xL2lzTGdVd3g1V043SkNTNFYzSzZx?=
 =?utf-8?B?UzM4cThWVGJjN3dycUZDZFhldlBPR28yN0ZYMnFYR2ZWWkNDQXIwQkNUcmti?=
 =?utf-8?B?RDAydWtoMHdQUWZ3VWV6Y0pNMms2N1ljQW1IdGlvQ216T2JUVkFPSEw5djBV?=
 =?utf-8?B?eGc3M01KNE1uQmZhaXlqR0llNDF3a1NxOGlxOWFXUjdNR2JBTUdDUUUyeDYv?=
 =?utf-8?B?K01SNVJ2NkZiWDlEUGpIREhjZGdaSVRYSksxSnZXZk5nWC9RSTNwQkE2K05x?=
 =?utf-8?B?bk5CeU4vQXcwUzdOcWhMeVBPTnhZWXJDSm15RFlaTkgwYTdkbFRpb250Z3h2?=
 =?utf-8?B?MUYrd1NqMmQzTlM3dzZ5T01MUU0wakgxNmxJWHpJV2ZVRkdlanp1bUovaHVB?=
 =?utf-8?B?UE1EN0h3OUdCaUVMbC92R3hZKzhIdnZyazJCS1N0c2QvaThpOVQzWmJGeXE3?=
 =?utf-8?B?ZFJ6R3RlWDBpS1FyZUpjWEt4cU1qaVJycjl5eW9aRFlHSFNOY3pJTlpNM0lE?=
 =?utf-8?B?UDRsaUh6bWFRcW5WS05jOHQ2ank5elNiOTRGWFhaUWdhYTBQVm1HT1oxZ2l3?=
 =?utf-8?B?bHRVemRNZzVmOVNYRkJLWTk3czd1eWUxYzQ3bHVpY2haWjVBWjFOSGFxOS8x?=
 =?utf-8?B?N3FEVmpDNEVzb3RsdlVBaUpNNzVwYzExNGsrcGpxY213UXNvM1V4R28yemRV?=
 =?utf-8?B?UTVkdGk3bmFRUExyR3F0VFhZeXNJWk0zUUxEbU5qdGpOeEFxMENwM3REWWZD?=
 =?utf-8?B?UStpQ254MnNsS05KcDNmdU01Znd3Vk1DVzdVYVlFWlRvemJ5L0N6ZUIvRmw3?=
 =?utf-8?B?c082WndEQnFMdEJMWUFScE5RbmVCdzY2NG5DMlBhZExWNmRERmVKWThmVTg3?=
 =?utf-8?B?ckNXcjZGV3ljWkpIV0FqOU0xUTdTNlE0QUsxVWMxV01qaEZFbVVlbXY5SkpO?=
 =?utf-8?B?OS9BNFRNdTFTK2plSnlEQk8rMUw1bEwyV0QvNCtYNUN5MGtlUVRaT2w4bHFn?=
 =?utf-8?B?bkNBaVVBSTRXK2xoVkJyUGZoZm8zcFR6TlVpUzI2TVVyWndFclNhamNYcWhj?=
 =?utf-8?B?QldtQlNBSkphWmVzbEZVU0NZU0hjNE55RTV1UlhlNGZwM3lMbG5sYkQ4M2U4?=
 =?utf-8?B?aXZmSEd6TU12cE1VTUhCZlFiNDZBNmI0TjA1dkdQd3p5ZGtROVh6M1pDNEhM?=
 =?utf-8?B?cUNzVFBCMk5lVFBaUlBNZTQyUUlvTjBVQkpJeHhrUXBGOGhDNmFUZVRCL3NZ?=
 =?utf-8?B?cytTWXBjYXdHTlJBd1YrMXZjYkNqS2hONDYvRER5eGlueHlsK3diajNPZ3lD?=
 =?utf-8?B?aTFCWjhwaWdUMDEwVlZ1VHVHeVQyN2xOVW1pQW9qZzRyMXNQekJjQjdGVEgx?=
 =?utf-8?B?VWNrUGt3amlUczJMcGVudnBoZm9NTHFZU0ZXRDM2RVJ6UjNCL0lSMm0rSlph?=
 =?utf-8?B?MzVmRW0vNDdpUWJ2ZUhPaFo5dTV3QXJNQTVWUDdaNHhReStmQUNnUENET0hY?=
 =?utf-8?B?MjlPZ2lndDFLck5ieU5oV1Nia25GZTFsR1o1RXpKUE14aWJlOHZIVDBLNzhW?=
 =?utf-8?B?WTZsMW9IZk5nYjdiN2hPMW85aERvMHBQUHBWSkZQOWVsWFRuTVdaeVY4QnQw?=
 =?utf-8?B?SkR6THdCQUtEb1U0NDA5UHNBSmZOY2MraTRURTM1a0lrS2VzYVpwTVhrS1gx?=
 =?utf-8?B?NUNVUU5QNlVtV2ZsOGlScDEyL2ljU0xyMXFHOGppZ2FhOUFlQ3dydGhYT0xW?=
 =?utf-8?B?MHhkdWdrelJ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3RHWlNSbndRczhZUGNvRVBDaXhsWmF5RGsyTDRwN0ZZeHFzU3gwK3FxK1d2?=
 =?utf-8?B?MFRYdG1tNXBEYmVlemRMcE5JYkpEUmVXUllHNjB0ZFNFZGZhNUhKWGZQWHA2?=
 =?utf-8?B?K0xub1NoeHoxRkVrdEcxUW45ZXpuZFA1NmFEY0oydURTdWgvRllzYXlyaTZ4?=
 =?utf-8?B?TDlVVERLSEpac2tETDE4T3ZPdzVQN3hPa3ZuTnRnOHArc2RXWG9ZYkxZZzdW?=
 =?utf-8?B?NjFxRnJKcWh4TC8vdXBjU0RKeUZqNUkrTWlJN2FpMWY0TXV4bTBmQmFWaXlu?=
 =?utf-8?B?SG5VWHdUZ3JjZlk5Tk9rYnoybGdtaW41bk9Pa1RSQ2lLQ1RiTWJoRmVZNkNN?=
 =?utf-8?B?WnA0M3lNZ1hxRUJZRVV0K1FZVkw4OEp2ZmVuWkFjM1B4VHN0ZU13MWg4a0xQ?=
 =?utf-8?B?T0k4QVdBSjlLdk40cWMvaUhYb0J0T1dhMlhyZE9oU3NDb2ZHZ2FJZVVRZWZ4?=
 =?utf-8?B?WjVxSmJFSWlON0J6OGVFcDlmamtWWVQ0ZFN2RkxjTUJqbGVTVU9EUkl0NDJa?=
 =?utf-8?B?UW4wUGpuekkwc0V2cnhiSDJZZlU5eUhBaFNkQWdQSkNUK3B1aTBJbE9xQUZK?=
 =?utf-8?B?aXFyak9QaVZ3UzZseWxoMjFOd0xOM0NYZnF2L1k1YklQRDNUa0lPUFNQUThi?=
 =?utf-8?B?Qm9mOWxRRkxDY0FJUy9KYmlSOGJnOHVEMTY2SlRTMzJCMlVNZEpMRVAwSzRI?=
 =?utf-8?B?cVRpWDUvTVpuSmtiVzlsZldoSDBFeVE4VzVMOGhIRURSa2tmc05XVk1GRXVY?=
 =?utf-8?B?RkI1NE1kbVlUWWlhR1dHMXFJRDJEUHl3TExTTnVlQzJyWndqK2xpOFdSUzA4?=
 =?utf-8?B?UThEdUR4NGxPZk9LUmNoNUczWXYzcS93UXpab0xpeGJyU2txWXZ2a1o5bDRk?=
 =?utf-8?B?TEZodkx6cFF2UVplcDR6dktpcENaRlZkYlJobVFhaktsMzlnU1NjZU5WdzVI?=
 =?utf-8?B?ZG5XV2JETWRmKzNoeSswb1BYbXFSNlI0eUNVY2ZhOUd3MElOK20xeTBQL3pB?=
 =?utf-8?B?Qjc2c1RiVHZkUlV3SUFUeVJrYUUxd0duRUNNbTNkNk05TE5HWEx2aFJPZ24z?=
 =?utf-8?B?THRKdkVhTXZPaTlUbi9XQi83S3NpdjVEaEFNMW9XTW5lN0MvckIyeUFVWU1l?=
 =?utf-8?B?b1JhK0x6dWphMXpoeGM1ZklaeXJuUFEzaFdDYWF6UVRidXFLZlJZQXNFa3FG?=
 =?utf-8?B?bVd0eFlSRWNNVmh3NzFBNEJkMG1uYzhxR2QxSEVEbzlLYUlrbHRKZ0FwYTIy?=
 =?utf-8?B?azBVN2kxaG8yaFd1aEVCUzNrV3VISTBWMlorU2ROY2hpbE9BRWx6SFpDV3NB?=
 =?utf-8?B?eGxyTDBJWm51MTB4dWFhNjM5dTk1b0ZXQlM0YS9aNzc4ZEZEZ0o4ZEEvTVdM?=
 =?utf-8?B?TDEvTkRwOE9MSkpDZVRmSmJlM3Vta0dnUlhyLys1cVI4YzFKNEZkM0pocm5k?=
 =?utf-8?B?N2YxWEVRNDVWVzR0VS8xZFFMVndJeVBwL2c3M0REN0RPVFIyTkF3ODJyUUkv?=
 =?utf-8?B?dHR5NVBIelQ0Skd0VWlnK3gvNHYxd0t5Mm43L04xTG5IU0ZWK29IMGh6Slp4?=
 =?utf-8?B?bHBCcUx6Nk1Ibm16MUw2YjZvcVNzNWxmRE9oQlN0a1VQajhHazdLUlFuRVB1?=
 =?utf-8?B?NGlmaVFBcStnS1NjT3ZXU1o2RW5LdjViS1dWWjMwOTJXYkptaEJJU2ZjekhG?=
 =?utf-8?B?MkdaT3cyY1EyTzZmR1FCVVRQSE5BekNNdUZrL2RORzZ4RG5sYXhDLzhLRkZw?=
 =?utf-8?B?dnFIcDllTVlrb0RlZzFDVUlrUkZMT0gwSnhCL2lpTVdRUm0xVUVLWlR1WW5Z?=
 =?utf-8?B?Q1NQSC9FaEpVY05aR01MMmFFODBMZE5obythQVpMMGo0S0hlWnp6N2JicGdh?=
 =?utf-8?B?cmxsR21sdHdVYk9lb25ZYmlBUURkS2lNMTVvZkFWUVdxYThKUlpwSGV2ZlpU?=
 =?utf-8?B?YUY5VWhqOVdpZzZvSTI3OHB2TXpEUFpwdGtkUnNyUFZzSFpGZEJHaFVjbGIx?=
 =?utf-8?B?MGNzbFc4LzlBU3FDc0xWeDkrREpYcjNEdHVTNXZsc0wvK0pSKzVFdk1JbXlU?=
 =?utf-8?B?ck00T1QrbFRxYTh5bVZXczZWcHVubkwwVlVrckxnNTM1ZGJuenBXV1BOeGRW?=
 =?utf-8?Q?IezKBDkuY4nbtXw8C1V+nzfok?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56BCA3547AD909488E69BF40EC4E778C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc434dd4-0249-4a1f-f570-08ddb39a50ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 03:42:32.0423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4cHoMwHwi/6m3YfInRGWn9wlpszcuLYhh3lqDzlb0UJQHxlvoLrIFOWPFkGefRR1UbMvuV9AXCQZnw1ow6ANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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

T24gMjQvMDYvMjUgNDozMiBwbSwgTWF4aW1lIFJpcGFyZCB3cm90ZToNCj4gT24gVHVlLCBKdW4g
MjQsIDIwMjUgYXQgMDI6NTQ6MTVQTSArMDUzMCwgRGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3Rl
Og0KPj4gTW9kZXJuaXplIHRoZSBicmlkZ2Ugb3BzIHRvIHVzZSBhdG9taWNfZW5hYmxlL2Rpc2Fi
bGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJhbGFzdWJpcmFtYW5pIDxkaGFybWEu
YkBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWlj
cm9jaGlwLWx2ZHMuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysrKystLS0tDQo+PiAgIDEgZmls
ZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMNCj4+IGluZGV4IDQyNzUxMTI0Yjg2OC4u
ZTRmZjQ2YjAzZDU0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9taWNy
b2NoaXAtbHZkcy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21pY3JvY2hpcC1s
dmRzLmMNCj4+IEBAIC0xMTEsNyArMTExLDggQEAgc3RhdGljIGludCBtY2hwX2x2ZHNfYXR0YWNo
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+PiAgIAkJCQkgYnJpZGdlLCBmbGFncyk7DQo+
PiAgIH0NCj4+ICAgDQo+PiAtc3RhdGljIHZvaWQgbWNocF9sdmRzX2VuYWJsZShzdHJ1Y3QgZHJt
X2JyaWRnZSAqYnJpZGdlKQ0KPj4gK3N0YXRpYyB2b2lkIG1jaHBfbHZkc19hdG9taWNfcHJlX2Vu
YWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPj4gKwkJCQkJc3RydWN0IGRybV9hdG9t
aWNfc3RhdGUgKnN0YXRlKQ0KPj4gICB7DQo+PiAgIAlzdHJ1Y3QgbWNocF9sdmRzICpsdmRzID0g
YnJpZGdlX3RvX2x2ZHMoYnJpZGdlKTsNCj4+ICAgCWludCByZXQ7DQo+PiBAQCAtMTI3LDExICsx
MjgsMjYgQEAgc3RhdGljIHZvaWQgbWNocF9sdmRzX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlKQ0KPj4gICAJCWRldl9lcnIobHZkcy0+ZGV2LCAiZmFpbGVkIHRvIGdldCBwbSBydW50
aW1lOiAlZFxuIiwgcmV0KTsNCj4+ICAgCQlyZXR1cm47DQo+PiAgIAl9DQo+PiArfQ0KPj4gICAN
Cj4+ICtzdGF0aWMgdm9pZCBtY2hwX2x2ZHNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRn
ZSAqYnJpZGdlLA0KPj4gKwkJCQkgICAgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0K
Pj4gK3sNCj4+ICsJc3RydWN0IG1jaHBfbHZkcyAqbHZkcyA9IGJyaWRnZV90b19sdmRzKGJyaWRn
ZSk7DQo+PiAgIAlsdmRzX3NlcmlhbGlzZXJfb24obHZkcyk7DQo+PiAgIH0NCj4+DQo+PiAtc3Rh
dGljIHZvaWQgbWNocF9sdmRzX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkNCj4+
ICtzdGF0aWMgdm9pZCBtY2hwX2x2ZHNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSwNCj4+ICsJCQkJICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+
PiArew0KPj4gKwlzdHJ1Y3QgbWNocF9sdmRzICpsdmRzID0gYnJpZGdlX3RvX2x2ZHMoYnJpZGdl
KTsNCj4+ICsNCj4+ICsJLyogVHVybiBvZmYgdGhlIHNlcmlhbGlzZXIgKi8NCj4+ICsJbHZkc193
cml0ZWwobHZkcywgTFZEU0NfQ1IsIDApOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBt
Y2hwX2x2ZHNfYXRvbWljX3Bvc3RfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0K
Pj4gKwkJCQkJICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpDQo+PiAgIHsNCj4+ICAg
CXN0cnVjdCBtY2hwX2x2ZHMgKmx2ZHMgPSBicmlkZ2VfdG9fbHZkcyhicmlkZ2UpOw0KPj4gICAN
Cj4+IEBAIC0xNDEsOCArMTU3LDEwIEBAIHN0YXRpYyB2b2lkIG1jaHBfbHZkc19kaXNhYmxlKHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpDQo+PiAgIA0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9icmlkZ2VfZnVuY3MgbWNocF9sdmRzX2JyaWRnZV9mdW5jcyA9IHsNCj4+ICAgCS5hdHRh
Y2ggPSBtY2hwX2x2ZHNfYXR0YWNoLA0KPj4gLQkuZW5hYmxlID0gbWNocF9sdmRzX2VuYWJsZSwN
Cj4+IC0JLmRpc2FibGUgPSBtY2hwX2x2ZHNfZGlzYWJsZSwNCj4+ICsJLmF0b21pY19wcmVfZW5h
YmxlID0gbWNocF9sdmRzX2F0b21pY19wcmVfZW5hYmxlLA0KPj4gKwkuYXRvbWljX2VuYWJsZSA9
IG1jaHBfbHZkc19hdG9taWNfZW5hYmxlLA0KPj4gKwkuYXRvbWljX2Rpc2FibGUgPSBtY2hwX2x2
ZHNfYXRvbWljX2Rpc2FibGUsDQo+PiArCS5hdG9taWNfcG9zdF9kaXNhYmxlID0gbWNocF9sdmRz
X2F0b21pY19wb3N0X2Rpc2FibGUsDQo+PiAgIH07DQo+IA0KPiBMaWtlIEkgc2FpZCB0byB5b3Ug
ZWFybGllciB0b2RheSwgaXQncyBub3QganVzdCB3aGF0IHlvdSBjbGFpbSBpdCBpcy4NCj4gWW91
J3JlIHNwbGl0dGluZyBlbmFibGUgaW50byBhdG9taWNfcHJlX2VuYWJsZSBhbmQgYXRvbWljX2Vu
YWJsZSwgYW5kDQo+IGRpc2FibGUgaW50byBhdG9taWNfZGlzYWJsZSBhbmQgYXRvbWljX3Bvc3Rf
ZGlzYWJsZS4NCj4gDQo+IEF0IHRoZSAqdmVyeSogbGVhc3QgdGhpcyBzaG91bGQgYmUgZXhwbGFp
bmVkIGluIHlvdXIgY29tbWl0IGxvZywgYW5kIGl0DQo+IHdvdWxkIGJlIG11Y2ggYmV0dGVyIGlm
IGl0IHdhcyBkb25lIGluIGFub3RoZXIgcGF0Y2guDQoNClN1cmUsIEnigJlsbCBzcGxpdCB0aGUg
Y2hhbmdlcyBpbnRvIHR3byBjb21taXRzOg0KDQoxLiBDb252ZXJ0IC5lbmFibGUg4oaSIGF0b21p
Y19lbmFibGUoKSBhbmQgLmRpc2FibGUg4oaSIGF0b21pY19kaXNhYmxlKCkNCg0KMi4gSW50cm9k
dWNlIGF0b21pY19wcmVfZW5hYmxlKCkgYW5kIGF0b21pY19wb3N0X2Rpc2FibGUoKSwgbW92aW5n
IHRoZSANCnNsZWVwYWJsZSBvcGVyYXRpb25zIGFjY29yZGluZ2x5Lg0KDQoNCj4gDQo+IE1heGlt
ZQ0KDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg==
