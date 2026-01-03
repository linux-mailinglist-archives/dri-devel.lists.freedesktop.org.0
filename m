Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0338CF021B
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 16:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFCAF10E36B;
	Sat,  3 Jan 2026 15:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Svx1HfeP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D776E10E369;
 Sat,  3 Jan 2026 15:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE5Fwb0cidIxbfk4BxmabnXkBdT+KuXIyV2TtvXGIhdMO4b5bTOH/glePZT3X+2Do+zIBcbP4tB6wjAT+tG5Ux8Zl/cYaIbBNPM3liRCKJTkEMADLV+1JEJuqLpzhQUaWsWtGLU1fa6IL/gaT3NNht9vSz+DlMa2CikfqULjrDH0FQR3KtHuMqzL6pkGVy3ZQ4FStrl9BBJyc4V841GjOps3FwGLx1GlHEk373MrZazsVqAQimzHBGzvGvVwaOrKfqUb/zcmWL+WF4UC4oMRpT65247vzIA8ykfyH4An4ihQWQgP81DGkL1LX7XfQP2FX9vagJ7f0jzR056F+R/u6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TJJ2Oo1E67fGXqqURHTCu0X2+m6IcWgfGW5ZlFjVU/Q=;
 b=o4QcIkXdJGtP7mVZ8aPhZ+ctjMugv71m2wMm43Hx2dsPHryQJtpccUq0alqh6iupQiva2Wdrx7xs/cbDFJTP4GjbS34TaE/eUD5MM21nFhxXFsmS2Xe541v5Elgl5y6hre5cD3VEwTXp40DJjd8+1hmIkYWooArmXlSGq0/TjzEzVi1+iuSJ8DUHE7fpeogpA/3M7GbUmxiyTJAc5MWdNac1Uc6DylWlVC7WEzCETQvdwHUGP40CJfjc9iEzLoFRYE6XaVP8hRd0uWhcv9k1oBDLpouBP9ZX8kMv2jqZwx3In39xLGfugWL5+87Hpo9m+5XPAVR2gwz/ltXUvtG7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJJ2Oo1E67fGXqqURHTCu0X2+m6IcWgfGW5ZlFjVU/Q=;
 b=Svx1HfePn8UIax02EMJd5lR76/GlQc7cx9JDGat4hSH20tfjv/7Wl3MYrxzyUys89K8lUOYuDX9UGQHzbzY222hKMwDo9X7bjiA/KmTlz3RGrOxn3SVJt6fmMZKbqmw7LD5JAOVQm5N19WUMTp0MMAvXf9GdZ3dFdR2PnkTFOKQAXnj6JJRbAbpT9LV6LfDMIrK2tQYW/5H0YWWm0wLz4Dg2QVOzesAW7VwWvlIsoS73Eawr72Zd6pEhFN5pyklXURsLDv9r2zRHu2PjLHdKDaPbdIhMi+jD4/0SqK1BJCTCiMFbpvl/dRV7HIuzmIQp0ZUUfhBQNvsgMFEbtCMepg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB6077.namprd12.prod.outlook.com (2603:10b6:208:3cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 15:36:44 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 15:36:44 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Steven Rostedt <rostedt@goodmis.org>, Andrew Morton
 <akpm@linux-foundation.org>, Yury Norov <yury.norov@gmail.com>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, David Laight <david.laight@runbox.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti <andi.shyti@kernel.org>, Vivi
 Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Daniel Gomez <da.gomez@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo
 Krummrich <dakr@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-modules@vger.kernel.org"
 <linux-modules@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Thread-Topic: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Thread-Index: AQHceEGDwsWUaTYnLUexc9hV+3IP7rVAcKgAgAAsXHE=
Date: Sat, 3 Jan 2026 15:36:44 +0000
Message-ID: <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2> <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
In-Reply-To: <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|MN0PR12MB6077:EE_
x-ms-office365-filtering-correlation-id: d3f67d60-753e-4f09-28ca-08de4adde620
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ZnFiZWpkMFp2MUtvTVE1NnVyTXpHYjNIa2cyeFZGcmcrUHZuTHNrdG0vVkZs?=
 =?utf-8?B?VEZ2dTdES29vN3BoM1pCYTl6V0dGdTNMZzFIVVpvYjVKZFVTazY2QmY4TmZo?=
 =?utf-8?B?R24zdEdiR3JtQVZiaWMzTElSVXc4Tlp1Z0lPZHNWS3dQRG9mMnFOK09sR2Nh?=
 =?utf-8?B?V2EyK2lwbzAvV01SM2t2UlFYMjRzK01SR3NDNy9yZy9vc1NBamtkbE5ObnRu?=
 =?utf-8?B?VU1Ya1hJK1lTSXBrb3BUODVFYXJFQnpVL2t5ZVUvYm9tWWVNalhKdGt6OUsz?=
 =?utf-8?B?QnZzZXFrWlk3cmhZZjhwWnlKZ1hGOFAvd3lGRXUvLzZ5TjFORms3M2JjWVln?=
 =?utf-8?B?dHhjOHgwVStkcWpURVR3RGhwRE5DeiszVXRuVEIvTTAxcnJINk1aeGFSc0VW?=
 =?utf-8?B?TythNTgyVmt5STQyUW5aeHhJcllkRHE3THJWQVJwS2UwdFp6L2l5UUE5UHBj?=
 =?utf-8?B?c05lWjcveE5VR0s0a1FHUUxZQTFPeUlISDl2VTcwZ3BBYzQ3bGxaYy9sTHFs?=
 =?utf-8?B?VEt1UVBwY0EycytDcVZ4ZGQwYWtlOERMK3VuVVQ0R2xSK2Z4bUxQLzlWUUdY?=
 =?utf-8?B?OUlDMzZGYjgrRzA0QnRJMFl3amMrWG5nbXpqMUtKZjVCY0c1bDE0alExQkRH?=
 =?utf-8?B?dVE0SkpkN3NQZ0NOSUpGYm5OeVlUeHkxczNwTitjcGx6SGVlSFdlYmhhMC9K?=
 =?utf-8?B?S1hqSEF3ZVJzMkNpaFlDeVhsQ3BhQ3ZraEx2d3hpYmlLZEduR1dRYUNXZVpY?=
 =?utf-8?B?RWFoM3ZrQjBKZEI5THZrZHRzS296Q0lMVk9PdlYxT1JqZVp4QzdLem5TVCtD?=
 =?utf-8?B?Qmxzb1o5bExsdVQ4V0pJdTY3L0ZOQnVzWTNjMlQ2TG9SdnBXMDRLTVpJVlVS?=
 =?utf-8?B?UnRyN3JmSWZFRlJVZlpqZzQ1UFg2Qzh0c3RIN00zSFlydTVHci9IdU9mQjIx?=
 =?utf-8?B?em1hQkJNVlZoMlVITk1YQlJUMnBUT01MNXIyV3ExTktmemVHaU5vTmYyVkFY?=
 =?utf-8?B?bUxDY3JaUGdvUDFpcDFJZktaeXh3SkdEU016cHNWd2tqSUFiT2QvYmxzQWFH?=
 =?utf-8?B?bCsyL2JzZnlmSExxcmo5MGpvR3JNVjU1RHZxWDYwL3N4d1o5TFh4VVJSWTQ0?=
 =?utf-8?B?dmhyTlNFZlBNenpqeWRxQVh2ZnJadnlENW9Cc3BRQ081ZU5FVzFwOUx3eVdB?=
 =?utf-8?B?NjEvS0JjNnQ3b1FJYys3NysrMU5CTm94UXJjWEVmMnRyUG5RTkFObEs3aXpJ?=
 =?utf-8?B?emJJeVpOb2J6aUNBL1FZWTNxd3VESEhqanZrNnlwZUV2bnZvWXY1WmFkTVg2?=
 =?utf-8?B?UFU0SGdHeHJVdjVEZ1QvNFlpU1VyMHhlYmozR1hRakJKZ0FncHM3d0dLZzAx?=
 =?utf-8?B?SitZWWx1Tng0SExMUVdpMHIrSlVBSkJ0YUpiMDdtemx6bldwN3Y4bkNwNXNU?=
 =?utf-8?B?NFV5MjJUWVBNb0g4Y0d1ek9KelBZMEFVSmxOenBEcyt1MUV2V3BjY3J0K2Rj?=
 =?utf-8?B?Sm5rNHBNUGNyUUNHbll6M25oTjVESXpZeVBjbVlwcktySU5QUW5xeUIwVWFX?=
 =?utf-8?B?VkY5M3l4aFUwM0xyYXlxczBEdUsyKzVVM0N4ZFB5a3JuWEc5UklRUGw2SDRl?=
 =?utf-8?B?WFdubHIzejNzdFc0K2RGeUNzSEtMVEw0TmdQbzJ1cjRLdk9JcGdTN1Bqenk4?=
 =?utf-8?B?OFg1cmxnRWVtVjA0d1FHbnMyeUNoa3NYVTA5alVEVGtTRmtJL2hzTGUzYjM2?=
 =?utf-8?B?Y3hRdEZZd3NITVkzYktiRXdZQTJldGZVeml6YjJYUFVWY29PSWp5akRLckRT?=
 =?utf-8?B?Vy9vdXJ1TWdLV0w1a1o1d0toQm05K1BZb0FETEtIeVVvQ3FaL2hqUkluSlNR?=
 =?utf-8?B?a0lLVkE4VFJ3TnlzWTJYbHFiV2NHVnlSVlJnVE50Y2xIbG9DdHBJeDJNRllD?=
 =?utf-8?B?YWNFckhEcVNsS3BmL2tDeWZnYjdBUi9xdXdtWEE0SlgzbjYzNmtyZkZTUXJl?=
 =?utf-8?B?WGJYbXdJZy9YNFhkM1pqWjdNejBLNzhyMWRLd2tHZVIxNHc1emkvTVB3Vmp5?=
 =?utf-8?Q?C1DjH/?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NE1qbFNpSkJrcUJVeWkvbjRmSEhGWVhMQnVsZ1oyYXhMUDJlKysyTHliTTFi?=
 =?utf-8?B?U05yMEdEem1GcnJDM2xHVU9ZbXdxdW9NUm4wZWNTNmppeEZENDlLcExycUQw?=
 =?utf-8?B?TVNsS3hROXR4bU5aRjl5R25aK1VMNGlpM0NpNG1vakJMcDhSOFZhaXE5OXB4?=
 =?utf-8?B?Y0hrdDl1UllUMmlPdVFTa3RaWlBmbGpUZCtsYmExSVh5SmpMYjUxY1JSa1hX?=
 =?utf-8?B?UHFBMDhXQ2N4cDJCRVlyTWxNbmFmWjUyci82VjRFcFBIR29GZGk0aHYvT3Fv?=
 =?utf-8?B?elpwWDlLWGdTeGtBQ1NCVGJRSE51bHAvK2hMaEJqcDV1Njg2NnRFcXpTOEJ3?=
 =?utf-8?B?UXltVTMwaUsyQnBIOHBEZG1kOUg4bkRPM0FIaVNyMWhkM1pkNng2d0lTd2RS?=
 =?utf-8?B?d2hlTU85VHF5eFpSTDlhWVl6MGcwT0tnMVRmb1pacHJ4ZWpuQkJHZzdoU2hz?=
 =?utf-8?B?K29NQmlydWtNemZ0Qm0xVDd6czZxNzA5UGNzZUQ4T3VkQmNzS1lZVlNiUHcx?=
 =?utf-8?B?RTRFMUhNN1Z2ZWQwbHk1L082MkY5MksvdmRBWVVYeUZuS29EUCswd0JMZWZ0?=
 =?utf-8?B?VDhXeGZKdFozcGR6Vk1KK2NiaFFQTHlJdVlBREVlRFdRRVJuVXloZHAwNFVu?=
 =?utf-8?B?YldBM3FrV1VlWjc3TVJ4V25jajlyUlVtVDZLcll0NXZTOUxvd21JTkNXTW11?=
 =?utf-8?B?VnU0N3VFN3JxMmhiVTZDalFrbHoxeGVnMEI2SGpONmZKNFBkTHJuVitnVHZh?=
 =?utf-8?B?WGZmL1QwQzdiVkg4cjBJMURaUUhFaFFzbDdsMmZ3OTlFT2Y3ZWsyUWlPcXhE?=
 =?utf-8?B?dWYvenlIdnBGbXVlY0kxZFFrWG54SVlvdlRTajRCcGJmb290aHhDRDMxWUVT?=
 =?utf-8?B?QWM0SEFUQUp0bXgweHptWUdhdFBVN0xLaGNSMTVKT0p2T1piUkJQSCtIdmdq?=
 =?utf-8?B?SXNqa2NVMnVEdEZIb3JrVzlKcTVSQlNYL1pnck5tM1E3N2I5UkxkWGRRTjNE?=
 =?utf-8?B?bW5BOWxZWCtBeW0xdi9mN2R5UytsQnBCaGpkb21RR0ZhU2ZNMWhOQUh1MnBN?=
 =?utf-8?B?WENjQkxXbmExNTNyUEN3WjczeUpPRXE1Q2ZHaGpUUnNXSk5IRTJudmwrMUdv?=
 =?utf-8?B?a3RYN0x1aG9NVTN0ekxvYXpqN0lPTkhDUUZ2YXFGNGtnRlRtM3gwZVM1M1RE?=
 =?utf-8?B?dDBMZmVRQlVSSUUwWHB4M1pLRUhIL2trNVFsKzFRdGJtOFo3S2lEQ2wvWGJx?=
 =?utf-8?B?V2Y2SzNwZWxqdFhGWGxyYjFid0lCWkJLK3gzMHUwVkNTRkpWSkFwcU5nWm9T?=
 =?utf-8?B?cUJqa3Y2aG5aSEk5ME9jeWJSQ1dKWGZpY3g5UE45c25YMFBRb3V6dlNvdndM?=
 =?utf-8?B?QllPWlJ1SkhKU2FJc0dNTUJyS1p6ZG5NUmx0YXBOR0JxNUtFTTZvT1YzQTNJ?=
 =?utf-8?B?a0g2eUlHdTFzZGtWVDV1U2JsYk9hTVBJd0EzYTZvRVp6dHpwMW93ejFPRFJv?=
 =?utf-8?B?TGkxb0UwbiswUFVpTGdUWFFZTE9IS1BwN2h4OFdTRWJ2NC81YzM2S2kxMkNy?=
 =?utf-8?B?MC8zMEsydlBnRWxmWml2bi8wVzNsM09OV3d0eFNxWGVNS3ByWlhkVzBvUzE2?=
 =?utf-8?B?VFhFbTVaV01md1RiOFZLM2xEQ0tNR0JjOC9Jd04zdGdnYVo3Q0YrZlBUOTlE?=
 =?utf-8?B?ZHBlRlVwVENXNjl4dEVHZU5mMzNwTWtTWk9IdTFWZ2tyeGdRdXV3MXdpZGgx?=
 =?utf-8?B?T3BhUlZEMlNENVh0eHI4a2hjb0gxVUdGbFk2RUNlT04zVDlwR3NVMmNJaDBP?=
 =?utf-8?B?dkZmUFBHWkllUHROUG4vZVhac3ZCN0c5bGdaTFZUeEJ4NE5DdnJ2NXhOMzdF?=
 =?utf-8?B?ZHAyV2JTcU9aL3Z2L29xKzFhR1VwbFM5TFFUTVMzSVJYNnBZbnV3STBTS0Rm?=
 =?utf-8?B?bVVNTG5CM21jdHNuU3o1cWgxRThzYlJTYmp6bmNZSEFCZFBVaW5RbWtiYnFn?=
 =?utf-8?B?MGFqRUw3KzNVMC9ud3JKRGhDeTQzMTVFMGpDQWpqOWhVOFJvbmFFbCthV2U0?=
 =?utf-8?B?aEY0dGZyMzhxTzJRT0RGNUJLZ0ltNzdWL0VwaEs3QnF1ZzRRRUJhTXF0RFNR?=
 =?utf-8?B?dGZhU1o4dDJnY2JKNzNkbUtUUVpBMjAzbUNmMjhVTlNTNTlxWXh5VEhaOXBr?=
 =?utf-8?B?cDJ4b0FXYW1rQ1dvOEJraHlxQ3A5OTgrTisvZFYvWTVvZEg2YmNOamt5ajUz?=
 =?utf-8?B?WGpVSjhnRHBRS3ZDeHdkRzNxMzdJSFRVTnk0QjRGUitmNlNPRVhOZ3FjRkY3?=
 =?utf-8?B?bmxzSzl2R2tPd01iVU5ZRGZHMC8xN2Y2VS9FN3FxdWlPSG1ZTFBIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f67d60-753e-4f09-28ca-08de4adde620
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2026 15:36:44.2173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4BYAq1VmUAM3HhbCxVsNz9YmPUlTdJOVjlX34gU2JRZ5J313YnZzqobYCV034OrXfUmgBfzMFbkg8WgH8Qds2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6077
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

DQoNCj4gT24gSmFuIDMsIDIwMjYsIGF0IDc6NTjigK9BTSwgQW5keSBTaGV2Y2hlbmtvIDxhbmRy
aXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gRnJpLCBK
YW4gMDIsIDIwMjYgYXQgMDc6NTA6NTlQTSAtMDUwMCwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6DQo+
PiBPbiBNb24sIERlYyAyOSwgMjAyNSBhdCAxMToxNzo0OEFNIC0wNTAwLCBTdGV2ZW4gUm9zdGVk
dCB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4+IEkgdXNlIHRyYWNlX3ByaW50aygpIGFsbCB0aGUg
dGltZSBmb3Iga2VybmVsLCBwYXJ0aWN1bGFybHkgUkNVIGRldmVsb3BtZW50Lg0KPj4gT25lIG9m
IHRoZSBrZXkgdXNlY2FzZXMgSSBoYXZlIGlzIGR1bXBpbmcgdHJhY2VzIG9uIHBhbmljICh3aXRo
IHBhbmljIG9uIHdhcm4NCj4+IGFuZCBzdG9wIHRyYWNpbmcgb24gd2FybiBlbmFibGVkKS4gVGhp
cyBpcyBleHRyZW1lbHkgdXNlZnVsIHNpbmNlIEkgY2FuIGFkZA0KPj4gY3VzdG9tIHRyYWNpbmcg
YW5kIGR1bXAgdHJhY2VzIHdoZW4gcmFyZSBjb25kaXRpb25zIG9jY3VyLiBJIGZpeGVkIHNldmVy
YWwNCj4+IGJ1Z3Mgd2l0aCB0aGlzIHRlY2huaXF1ZS4NCj4+IA0KPj4gSSBhbHNvIHJlY29tbWVu
ZCBrZWVwaW5nIGl0IGNvbnZlbmllbnQgdG8gdXNlLg0KPiANCj4gT2theSwgeW91IGtub3cgQywg
cGxlYXNlIHNoYXJlIHlvdXIgb3BpbmlvbiB3aGF0IGhlYWRlciBpcyB0aGUgYmVzdCB0byBob2xk
IHRoZQ0KPiB0cmFjZV9wcmludGsuaCB0byBiZSBpbmNsdWRlZC4NCg0KSSBkbyBub3QgdGhpbmsg
aXQgaXMgbmVjZXNzYXJ5IHRvIG1vdmUgaXQuDQoNCiAtIEpvZWwNCg0KDQoNCj4gDQo+IC0tDQo+
IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4gDQo+IA0K
