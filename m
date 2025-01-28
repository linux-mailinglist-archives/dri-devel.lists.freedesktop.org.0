Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3FA203B7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 06:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FB810E26D;
	Tue, 28 Jan 2025 05:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="xE8n54nn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F4010E26D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 05:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnbDFaN8jUi0vs6/fmf5j9pWw5uHa9ZVLUZ17EddPaf0XMoWq4MdQuHQN4ynkMmxAZR4C8rs+2XNgTVW7uDCJtElpN+/023hkJT2syTa/fCh55Q0qyiKLEzCWQcRiaWF/FnpYuvTPw3JA388mTk5cH1t8AVzyXZ2/h5QhGv6nTIYgfzzpVcEzQBuXnLO0VQO3k/nFJi0wp6/MiVlUqBxF6nZC2KfOUrQfxJEutGGJ2rVcImSyEVOSQmYTKGx8o22HHwvl05XLNaZF4FPGvkb10H4wo0IgCEiXV5YD09WsSUsosFSQkawypNzBS4FitZPV3BoWjzII36LGJn0NCSK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=glR+aYSR8O3qfngYWRHiB0OzZqYGUR/eqFlYyCTkBa8=;
 b=vn+MH8MfiY3ZJZ59wu2xppuyHd3FyW7UQ2wT7MzIX1kHTwOT+7Kc3+9y0dIc0PS4U4rxR3nrCz50Kbg6JEJnUolKrjiemcYEDxSYO3c4f+YorJRlkImrom87bUmOmaZ3eUH7yY47S5jB3joEjIA6uDPuhcklazdeOZRx4zoNmeilaZvxPEnz/Myi6oudSflMKOtIYUFfTzyEUJGZwZnrGHJfs9zeNonGTMyu3z8jZfgMwaktdoPCFeJeZvu9grsKAEA9dIfMZe1QazntnxUYIRTbCGGYv97aCgfIG7HYa+kC30OeAv3Cs8YRoJ4n4VFaremf1wEK5i6yjxgxihd6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glR+aYSR8O3qfngYWRHiB0OzZqYGUR/eqFlYyCTkBa8=;
 b=xE8n54nn6z8qCex8NUvSOSUMehe9tZFADQbg57lZ3jHpSjXoiHjlQQuzSLAq+MaA+ub65E2kWkxgva65NNfIxKqPXiCRJZjfSQHZ1Kf/YJfa2QwDkxC0HpLi4dJcqMJxN7m9hdjWzIh6ORp6QN6zLhFkP3xQVZx4fAgNJIluhT9aij3hEuRZBCFl8/4iloWFvuYDgs2MBU5mYz7yqbAtLEkSiKoWA0nelUgs8dn6IBIEe91fOVrcZLE/gpWq07bYxJE9hQhnEx6bmHv0+Z6xrt2bbq6RNCK+RNa2k0FptCbLZg+AGNBui1KdG9zlXazjv3a6iAUCIixlwWJ6e9is+w==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 05:03:45 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 05:03:45 +0000
From: <Manikandan.M@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Dharma.B@microchip.com>
Subject: Re: [PATCH 1/3] drm: atmel-hlcdc: add support for LVDS encoder type
Thread-Topic: [PATCH 1/3] drm: atmel-hlcdc: add support for LVDS encoder type
Thread-Index: AQHbO/b9HC03SUPkaEeNy1fxmxjEmLMsDBQA
Date: Tue, 28 Jan 2025 05:03:45 +0000
Message-ID: <f2749762-3113-4647-9f40-096cc6ee3414@microchip.com>
References: <20241121092308.130328-1-manikandan.m@microchip.com>
In-Reply-To: <20241121092308.130328-1-manikandan.m@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SJ0PR11MB5054:EE_
x-ms-office365-filtering-correlation-id: 3b695400-90f3-45fd-d625-08dd3f59245f
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Zkx6Umo5YkVyQ0k3VCtkZDFKSGFRUHVsK0h4ZWJvR0hFLzVUSThsY1JHVXFI?=
 =?utf-8?B?RU1QYU9aUW5WSGFDNmRWSTVIdVQydVEwREZvQnFNVWQxcE5mY29icDhma3lo?=
 =?utf-8?B?R0lyREVPNGw1OVhIcWJabkx3WmoxdTlWSHhyeTZFeHcrUURFRS9VaHVwN0VQ?=
 =?utf-8?B?R1Ywc0RCNzA5QjBLM2gvT1puSjdOY09HQ0JpL0V4MEJGa0N5SUM1NjZOQmF1?=
 =?utf-8?B?Q2ErUk5yeVJIOHJZakpWcTdhSUhjM2dRalJlaEVKb0pEQzJJdTBMYzFOTzRO?=
 =?utf-8?B?L3ZRaUJodnFaVUR2eFM5ZTFmN1IvZVA5di9RMjJvd2s2MGxRaC9CUDllNWoy?=
 =?utf-8?B?a3RvaVVWNHZKV0xWb0Y5S29wVGtFYTVRWVRDeG5UdHRrUWFFVFpGN1VaZFpv?=
 =?utf-8?B?RGR4dzdHZ1dSVlJpNHdDOFVwQlBCdmxwcjhGMTVPSUlDOVQ5MWhkS1NBb3VC?=
 =?utf-8?B?MGtBYkhEM0Z6NU0rLzR1TDBTMjZ2cURERHM2Yk9wWFN2bS94SU9rOFJjOUUy?=
 =?utf-8?B?c1MxeGdzVHN3a3czSnVWVkV5R2xweVU5bUVUQmdoOFRIUEpSYnFqdXliUkFG?=
 =?utf-8?B?MEtoQVdKWjg5VTFPczRkc3MxZ0J4blBZOWhXdDhCaXltUVB0cnhRV3NHNERH?=
 =?utf-8?B?K0taUG44b2dwUTBjeExsekdBUXlHZ2tlNjBkYStVZ0U1QThZQnlYM1VORndm?=
 =?utf-8?B?YjRtYS80RU9IRjMzSmIybTlnTnVRL091RDhGQTRKSkFNRzN2cmUwbE5TOUdh?=
 =?utf-8?B?Z1hiODh0NVpvMVNvbUtRMWlEVmlKZDNEcFAxN1pLN2V0eld1bGFkQURGSlpG?=
 =?utf-8?B?bGZSTndvME52UU4xaEduaGltNjJxUzRId1A5UU93RkFGVXZydmtuS05XR1BN?=
 =?utf-8?B?RnhRRWcvOU4vdzFGRHdSditOSjZUUzA4dzk3SVVVVEgrRGFFT3V1NTdaY2I0?=
 =?utf-8?B?eEMySC9NOE5kNVgvcTBxY1Yvb1B4aVdUU0FnRHdMcHNJbVZVUHN5bHR6cVNa?=
 =?utf-8?B?SkVWenhpWUo1QS91SE5SMUZPMDdEM3hQVUp1R3FoTzcyb3pRZnBlSWh2ZXpN?=
 =?utf-8?B?ZmJqQWZZUlh6aU1mTUR1WnBRNHg1alpwSWkrSnhGejlqTUJScDYxYXNGVVRZ?=
 =?utf-8?B?T1RmRnZWVWltZ0hvc3F3ZGtoL3A1TWdJaWc3RHBZdjVmQysrTGNkelN4OU00?=
 =?utf-8?B?QW9KODZha3pxNGJPQTZaQ3NRdkh1M0xZcTM1UzRUdi84SFBMdzEvOXVlSkZG?=
 =?utf-8?B?UmVMTkRsRk1EY0gvc3U1U3BTUFhZbUlDUHdkMTAzL1NyVzNXMTJTVGFOajNQ?=
 =?utf-8?B?bGpIMko3aWtoeE02L2tUVDJEWmFjZkVucTRXYUJTMFFvelovaThDM0Q2ck92?=
 =?utf-8?B?RTBhUU50Si9KN0IvYWxDSVMyQnR5NE9GYjNKVHFqNlJDY0ZwbHR4ekZIKzI4?=
 =?utf-8?B?bFRXMFNtWHo5T1NZejNyQmVUM1BXYlpoMnBQOUpGSnZQank5Q1ZXK1FRaWY0?=
 =?utf-8?B?angwemlpaFppRUJrdys2a2xMNlc3L0tENzZma2d2QkRiVXVmNURtdVlhSkoy?=
 =?utf-8?B?c3RvL0hzQWN3WmlxcThpVXAxUnpMOHlDOEpOYTFUMndjQWcyZkpOVW5rWFRQ?=
 =?utf-8?B?QlRMTkF4T1NvTVZJNjd6MGtISG5wZm1OcG1tMWRSUzlDamZ0OUt4MEd4MWlr?=
 =?utf-8?B?aDd4eEhFSW81VGZ3R1VvV3p3Yk9Zam9SWUk1dkhTNWhyREE0WnVOOThYSGgw?=
 =?utf-8?B?QXRyTS9PSGZQT3dLTmcwL1BjeE9wQitJT2l3YTR1QmJSOXVSK1JIaDh3dWMv?=
 =?utf-8?B?MUpPMHZwcXQ5YTdpckZiaDNUOG5OTW5rZW9kWUxqbVNiVHBqRk5Ha3NjZlpi?=
 =?utf-8?B?T3VreFVkSTVaNkpWSVg1emlVdHV2d1JIMFE4NzBhMUQ0MUh4YzFBRk1GdjNj?=
 =?utf-8?B?cnZzMFFNVUpPY3VkZmY5NW5SQjUxd3lsWTNtdG1TMWwraC8rMk5TNHNqcHBL?=
 =?utf-8?B?czF3blFKclFBPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTNhUTNCRWtsWmViWHl5TGtJR2Y4M1d2YWVQaThvenF2ZnhoNXJ6R3lKcHJT?=
 =?utf-8?B?YWxYWnZPZFNOVmJVZ3BudGMvaloyVWRtOWx4Q3I5TjRwWWdkWUVMYUd5bS9P?=
 =?utf-8?B?TFNyTUNxanN2RmJhYmJ3dHMzalF4TTFWSXNTaksveUQwN0M2ZStDNVQveXpt?=
 =?utf-8?B?TkdZS2kyYnpnalRXNjBuZUxiY2RmS3ROWmdHN1RtZ05HMGduU0toeUZSRVpW?=
 =?utf-8?B?QWREM3pva2pOS01IUmNnbjNmOG5EejNpT0daYVdWWnRmOWxkUm92R1FIM1ZI?=
 =?utf-8?B?dTFoclVhR0xrRzFybG9UTUZmOTZoYmx1YjRTR2RKU1VEU0prcVo3ejdEdjB1?=
 =?utf-8?B?ZHFwdDNPS09RcmVPYnRpeFN1a3hCNGVHOWRNeC84cm9GeXdDZ1UwdjJKR0Ft?=
 =?utf-8?B?OWIyR1liaURSNU1yelY1eGR6RTArQWdpUUM1WC95YjV2d3RZeEdvbGZZeXc0?=
 =?utf-8?B?MlV2S3lrR3FwL1NtL1dQUXJpZVJTbDZHekNSbjljUWJlWUMvd2xPNnJUU1NM?=
 =?utf-8?B?Yzl6SlpDLy9Bc2dzWUhOd3RjWTM3V2MrTDNVVmg4RWszcHZuNVpZOUhhTTd1?=
 =?utf-8?B?QXUzUmtpZ3BYM2dub2RDUmx2U0xhMGdvRmFVVFVwOGtwYWRsU2xYbFdPbG91?=
 =?utf-8?B?RlJLNWE5bCtwdFYxSGUyWDdmMUdBeWQ5UjN2OHg2aFdsN3JOV3RVWHhSQTdW?=
 =?utf-8?B?MEtJNlpFbGJ4MEJXaGJhei9JT1JrT0xtbGRmYS9zeG1TT2tib3ZYZmM2TExn?=
 =?utf-8?B?Y2NGNGZPV241am1hSVBzUFdmU1p1ZVNMYjlPOGdSQk5UeVduYTdLZWVXZ1lo?=
 =?utf-8?B?OVdLYklZbFVCbXVTQmNLN2FsZXdMYkRPTGJ4aVcwTEtHR1N6MFBZRCt2cnZM?=
 =?utf-8?B?b1pYeGpSK3k3Z0dhQVl1eG11VUlKQVc5YjllNGtWRG1FR21NUzhON2h5dHI1?=
 =?utf-8?B?UXAvZGFFWWhJNnhiMlhXYVphcGdQS3JFV2twZmxqQ1NTeFJ0THZ3UExkbVVO?=
 =?utf-8?B?a3l4dFNIdm9hMHpybjZ2azd0M290MTZtMGppNnFwRXpKSGk4c3d2cU1yR1lX?=
 =?utf-8?B?aTJyU0V4ZG03Zy9sRjZQaSszMkU2R2Q3SStRSDFWOUJlaXA0bTExaGZ5dktI?=
 =?utf-8?B?N1Q0R0lFcXBZa1lTM1JpMGg2ZUM1djR1N21ZMHV3SGxCMjZNSWZuSEpKWXVW?=
 =?utf-8?B?NXZzZGpaWEtxRmVqMFlTbjlRTVNVNGE3SCs4NGdRNnE0MlU0YVdhWUt1U3V1?=
 =?utf-8?B?WlFTRUZrM2NtVW81c0ZydVJnVGtPUno0QjdBNGNPUFlRMXB1YmFmcU02Yk85?=
 =?utf-8?B?dXpnYkg0VUNjVGc4Ym4yZFhHRGJjUUJRRVo1c0w2SmhuN2phNGUyblVab0NT?=
 =?utf-8?B?Z0FkV2F4VWdqWXJpY2pPUHA2L3A5YW5sWW1RRVdhY1Y1bTZsMUVrNEJUZENa?=
 =?utf-8?B?OGczbVZjdzR3UnNuTDg5Q2c2R1U5N09BeXREcllaUndRMlV6S0h6NUVVSXRT?=
 =?utf-8?B?YUxEL0loUGRTUzdkUCthNElJalA3ek45ZGtVb2dvWXNsODQ2RHNna1ltcEE2?=
 =?utf-8?B?U2FNbm5VL21kU2pIbVZZTTRaT2ZOQTVmRWlTVThJOEFUSjVmQ1ZDVEtkMjdL?=
 =?utf-8?B?WmM5bml6V0tXMDdDYktwd2tES0Vvakt0SWxHZDNxRHNaU0NLS2I3ZVozVHVJ?=
 =?utf-8?B?dU5xdFdZVkhVdFNCQ0lpbGtaamhrd3BmREcxWlM2ZElqMDNTaE5rbmd0cEl5?=
 =?utf-8?B?ck5HTUhEc1AycWZWclNDSVZpTVd5bEU3b0NRN0YwUFhEdnVvU3J3cmFjUmJJ?=
 =?utf-8?B?V252MTJrbi8xYkd6dEQ5c0JEbWZ1eE9JM0JjZ01KOVVxM1FXN2J6bnZ6NCs5?=
 =?utf-8?B?ZVgxbXhCOXlvTXNMbXdUTzB2clV2MlUyamFZOENxaUYvbFV1V0RkOTB2bFJm?=
 =?utf-8?B?eVBMMmZaZlZVTkxJT3FyN0I5aklzeXBtYXR5NXhhNTR2NFVnMlp0eUVRVWQ5?=
 =?utf-8?B?YXhLWnFVZkJyNlVGQ0lkV3Z0UXJLb3RFR1FMKzFVczZwRDRTdWYxa2pibE5v?=
 =?utf-8?B?UFEwS0lYL0dMUGIvYmFkT3VqZ2NJZDJtckd3cmJyYVJIRnMxR01rclFMdkJn?=
 =?utf-8?Q?hOigrqFFq9vRWiHixplpMQiBP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DA6410356BFAE4588E93BECC9BFC115@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b695400-90f3-45fd-d625-08dd3f59245f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 05:03:45.1175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heBBclJ7YBa9mfn4bwNwD+HsySrv7gpYY1K1WTrxFww7lugOnk3eSYLtxbFdhn7odDDxSmMdPQ4Oy5eYHGh5lmPz1NnTnto6Fzx6d3cZAvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5054
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

SGksDQoNCkEgZ2VudGxlIHJlbWluZGVyIHRvIHJldmlldyB0aGlzIHNlcmllcy4NCg0KT24gMjEv
MTEvMjQgMjo1MyBwbSwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+IEZyb206IERo
YXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4gDQo+IEFkZCBz
dXBwb3J0IGZvciBlbmNvZGVyIHR5cGUgIkRSTV9NT0RFX0VOQ09ERVJfTFZEUyIgd2l0aCB0aGUg
Zm9sbG93aW5nDQo+IGJ1cyBmb3JtYXRzOg0KPiAJLSBSR0I4ODhfMVg3WDRfU1BXRw0KPiAJLSBS
R0I4ODhfMVg3WDRfSkVJREENCj4gCS0gUkdCNjY2XzFYN1gzX1NQV0cNCj4gCS0gUkdCNjY2XzFY
MTgNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJA
bWljcm9jaGlwLmNvbT4NCj4gW21hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tOiBtb3ZlIG1vZGlm
aWNhdGlvbnMgaW5zaWRlIHRoZQ0KPiBhdG1lbF94bGNkY19jb25uZWN0b3Jfb3V0cHV0X2x2ZHMg
Zm5dDQo+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFu
Lm1AbWljcm9jaGlwLmNvbT4NCj4gLS0tDQo+ICAgLi4uL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRt
ZWxfaGxjZGNfY3J0Yy5jICAgIHwgMzggKysrKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1l
bC1obGNkYy9hdG1lbF9obGNkY19jcnRjLmMNCj4gaW5kZXggMGY3ZmZiM2NlZDIwLi4wZTcwOTA0
NzM2OWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9o
bGNkY19jcnRjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hs
Y2RjX2NydGMuYw0KPiBAQCAtMzU2LDYgKzM1Niw0MiBAQCBzdGF0aWMgaW50IGF0bWVsX3hsY2Rj
X2Nvbm5lY3Rvcl9vdXRwdXRfZHNpKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwNCj4gICAJ
cmV0dXJuIHN1cHBvcnRlZF9mbXRzOw0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbnQgYXRtZWxf
eGxjZGNfY29ubmVjdG9yX291dHB1dF9sdmRzKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwN
Cj4gKwkJCQkJICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfaW5mbyAqaW5mbykNCj4gK3sNCj4gKwlp
bnQgajsNCj4gKwl1bnNpZ25lZCBpbnQgc3VwcG9ydGVkX2ZtdHMgPSAwOw0KPiArDQo+ICsJc3dp
dGNoIChhdG1lbF9obGNkY19lbmNvZGVyX2dldF9idXNfZm10KGVuY29kZXIpKSB7DQo+ICsJY2Fz
ZSAwOg0KPiArCQlicmVhazsNCj4gKwljYXNlIE1FRElBX0JVU19GTVRfUkdCNjY2XzFYN1gzX1NQ
V0c6DQo+ICsJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDE4Og0KPiArCQlyZXR1cm4gQVRN
RUxfSExDRENfUkdCNjY2X09VVFBVVDsNCj4gKwljYXNlIE1FRElBX0JVU19GTVRfUkdCODg4XzFY
N1g0X1NQV0c6DQo+ICsJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdYNF9KRUlEQToNCj4g
KwkJcmV0dXJuIEFUTUVMX0hMQ0RDX1JHQjg4OF9PVVRQVVQ7DQo+ICsJZGVmYXVsdDoNCj4gKwkJ
cmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICsJZm9yIChqID0gMDsgaiA8IGluZm8tPm51
bV9idXNfZm9ybWF0czsgaisrKSB7DQo+ICsJCXN3aXRjaCAoaW5mby0+YnVzX2Zvcm1hdHNbal0p
IHsNCj4gKwkJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDdYM19TUFdHOg0KPiArCQljYXNl
IE1FRElBX0JVU19GTVRfUkdCNjY2XzFYMTg6DQo+ICsJCQlzdXBwb3J0ZWRfZm10cyB8PSBBVE1F
TF9ITENEQ19SR0I2NjZfT1VUUFVUOw0KPiArCQkJYnJlYWs7DQo+ICsJCWNhc2UgTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMVg3WDRfU1BXRzoNCj4gKwkJY2FzZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8x
WDdYNF9KRUlEQToNCj4gKwkJCXN1cHBvcnRlZF9mbXRzIHw9IEFUTUVMX0hMQ0RDX1JHQjg4OF9P
VVRQVVQ7DQo+ICsJCQlicmVhazsNCj4gKwkJZGVmYXVsdDoNCj4gKwkJCWJyZWFrOw0KPiArCQl9
DQo+ICsJfQ0KPiArCXJldHVybiBzdXBwb3J0ZWRfZm10czsNCj4gK30NCj4gKw0KPiAgIHN0YXRp
YyBpbnQgYXRtZWxfaGxjZGNfY29ubmVjdG9yX291dHB1dF9tb2RlKHN0cnVjdCBkcm1fY29ubmVj
dG9yX3N0YXRlICpzdGF0ZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25u
ZWN0b3IgPSBzdGF0ZS0+Y29ubmVjdG9yOw0KPiBAQCAtMzc0LDYgKzQxMCw4IEBAIHN0YXRpYyBp
bnQgYXRtZWxfaGxjZGNfY29ubmVjdG9yX291dHB1dF9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlICpzdGF0ZSkNCj4gICAJICovDQo+ICAgCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUg
PT0gRFJNX01PREVfRU5DT0RFUl9EU0kpDQo+ICAgCQlyZXR1cm4gYXRtZWxfeGxjZGNfY29ubmVj
dG9yX291dHB1dF9kc2koZW5jb2RlciwgaW5mbyk7DQo+ICsJZWxzZSBpZiAoZW5jb2Rlci0+ZW5j
b2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfTFZEUykNCj4gKwkJcmV0dXJuIGF0bWVsX3hs
Y2RjX2Nvbm5lY3Rvcl9vdXRwdXRfbHZkcyhlbmNvZGVyLCBpbmZvKTsNCj4gICANCj4gICAJc3dp
dGNoIChhdG1lbF9obGNkY19lbmNvZGVyX2dldF9idXNfZm10KGVuY29kZXIpKSB7DQo+ICAgCWNh
c2UgMDoNCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
