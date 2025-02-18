Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A053A3A9E7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293FC10E767;
	Tue, 18 Feb 2025 20:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CZ68BP3e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA89210E762;
 Tue, 18 Feb 2025 20:51:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqlBK9uzJtWh+1U0q60LFItWc91CocH76kzPXm7Xyi2BGm6CVRFauhWSQZ7EMG6tHwpJD0elYjzUNXPkXBjh4aeZIxYl6ZG7216+UEfm7QjRY/yUSLsT9e2ahP9gPbka2wnqu2i4Rc3vNQbjWYfwUcuUYlZgTPfAUEEivdYjHwZIYz9qH5XqGeQ1aJI52hHHOHfoAWZZacUEYuMZgJypGAUVd3RoGBPhcvExzr30UUcP94ViimHj/h9IelWHrEkg4cvHdJiRLJaM7VmrX+etzNdnPQXb7hVikf3/Nc1RhFcTKUJmvKUPTZcU0DK2w4W8cSj0NqfsR/Ryw2O+KN28ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CpujxghQcFznccsZ6l2RwaqKmvcZSB0PKcw78vL8ko=;
 b=S3ctX4q1+UcdhTC4//v3t1+tnVMaLDtzMjiXOkHiDvrQSvAttSjJQaTd1TWs7pa2NXX75V9Xnc5LyCYSnXwtKept7CmvwcFAYmBbTQcTGdwiOBeTj1ZjGmvPsHFz8Iqj/bqU9XqjpwWQ5pi3kdUfBFBd5VrdsDJrNJ8HaZeWAFceeHzqx1K6jvSIH61tTw/mP47ceNN2pDpMWF7ZWSxgnloVWSJb3TiN1ez65hynI9xqJftvdZi05TxG4IZ0Wyld5UfF7EuxUJNtbo9PxASmAUJsS0K9n/4+OE7n+3bad1SsurESMoS/PlkTVFnNp1Z3Uj4UVcsPA0RnhQilTmbbtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CpujxghQcFznccsZ6l2RwaqKmvcZSB0PKcw78vL8ko=;
 b=CZ68BP3eNO0SIyexun07akogY8xrS/0RRWU8AcnAEuA8wUnlffzWQPkff478cfo1AFUMyPzhlm4jUI9xAsX0TKi7M+DeK5Vv8N6hRyM1YmmmMPnZfuQyuF05wg0q153Wr5lxArRRpOjRsp+V4E3Vt3tz3bARm81B9QXFeBFpAPSsoQvq37MGk34XD1RdxMjMg0SomVPMXvrfbIcgy06DyC8S6O2j5gZl0ysuImROox7hRRR69OiPpm9hKfs8HjjgQ+7AeVb2w1GfaNfyerq0y1dZO1jSAUGbOkvhz8gnjdw4qI660VX4Tn5oaJdLX5sF7xJlxGf1kvvIjbmbn80C2Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ2PR12MB9139.namprd12.prod.outlook.com (2603:10b6:a03:564::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 20:51:06 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 20:51:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "daniel.almeida@collabora.com"
 <daniel.almeida@collabora.com>
CC: John Hubbard <jhubbard@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
Thread-Topic: [PATCH RFC 1/3] rust: add useful ops for u64
Thread-Index: AQHbgUTyB1B+bm2LdUO9ulCDmdfk5bNL/kmAgAEN7YCAAH7ngA==
Date: Tue, 18 Feb 2025 20:51:06 +0000
Message-ID: <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
In-Reply-To: <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ2PR12MB9139:EE_
x-ms-office365-filtering-correlation-id: 70c138e3-8cc5-4972-3bda-08dd505df72b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N1BUc3RZSGt0ZjFvUDBDTWp4cEllQ1FueGNaVHFCTm9pT2J2Y3RpUk1MVUp6?=
 =?utf-8?B?RlNsNXpJOG1rayt2YWEyZXZ2THVCblIxSFhyTE03Kzh2RllKUEhVWWNPS0lw?=
 =?utf-8?B?ZHc4eW43S0pSZEJkWlZWbTdPdVFhMmVTZmFSN0g3cytodUlzSDBXckFyeUpD?=
 =?utf-8?B?cktoSGNna3M2bk5FMHNsZi8yMXEySkdxakZPQTgrNm5YYjdzKzgrYmNEQStN?=
 =?utf-8?B?WGUwT2tYZ1VLV3RzY2luWnQ5TDRSRXF6eGFmQ1E5RjNZYlBhRjJSSUViNTFv?=
 =?utf-8?B?bGJrbi9DREZZaVprNCsxcWZ2VVZuQjlVWnl0blhZbmJxbEJyNVRRT25qNnpm?=
 =?utf-8?B?QmRZZkVEMWpkTjVhWmVKeUtIbXhTYkNvcHF3aFR2cTNscFZiWjBqQXJrU1hP?=
 =?utf-8?B?NllrdWRhelFLV2ppWjJ1eGVIRW5EYjF6REFuNFRCV2dlTEU0MFJVNURWQVpV?=
 =?utf-8?B?VjVWMHJlMWpHa2ZEeG82Y1BNL25uM1JqRElSQVovVVAwOXJKTVZ5V2J6bWNH?=
 =?utf-8?B?VjFGdklLNUMzK0JuaFBUbUIxK1ExeDVHbHdPcDVJYnJyeVlLckNkUmNFOVJs?=
 =?utf-8?B?L2JpYXp6bHZDdlcyZ0JoVGlYc2hrQmxQZ2IwTHhreWRFYnVTQjd0Q2VtOUZo?=
 =?utf-8?B?TjI4T1RSZUtXajk0czdmSEt4ckVGSTVwcTdLalRZOTBWU2dnZ0dJZzcyT29P?=
 =?utf-8?B?eE0vd1pMeVFRZDdDSHdOWWtPQ1pycmhJdnhiMlFDczJrUVc5VkNjdExXYzht?=
 =?utf-8?B?djV2WnVkZW9nZWc5ZjRaRU1wUHMvVFk1bURXRytYSHZIUTJxU0dGekc0NG82?=
 =?utf-8?B?SnkzUEtTTW9XQVdiTTVJM2xMOUh2bEwrcHo0TEVBNlpZUkt4T0U1d1hBN2Z0?=
 =?utf-8?B?SXNtMlk2dk4vdC9EejNPaDIzdnNGcGxBazd4QUZ6S09PaW5uZjRHaEhXQ3lG?=
 =?utf-8?B?NlhkbjdyRUp3bTBZNVNXT1NSSHFHVjBjdnhLVDlrdE04ZXN1UXovTThxOTdh?=
 =?utf-8?B?Z3ExblRXZ3NSOGxKTjhKdFV6U015NENDZ1RIZG1xL1B2c3hJVTNYck4vRnFG?=
 =?utf-8?B?bC9CYXNBUlFaTFJPZkJGUmtBc2ZvUFEwVzc0R0t3RjNKaVptQUZDN0U5R1pq?=
 =?utf-8?B?S2tjVDhyQjZxNzVDZHBnTVJ3QVYyRmtUY21yOUJlanpsZElnb1lQbjNWWmt3?=
 =?utf-8?B?cC9JZEhsM25qejV6dWZHdXhDbmJKUXR5bFk3UG1ucDg1Q2tGeDBjSm8wRTl3?=
 =?utf-8?B?L0hIUUt4aUI3SDQyT3ZiMzVzbnJaeVlIYTJmS2Y3a0wzb1IvRVlpbS9MVnNU?=
 =?utf-8?B?OXBaUVdCSG5xVEZtL09XUVlMb1lycVFnMzJCZ29kWUg5VXdRQTZ3bDNvTVVG?=
 =?utf-8?B?RHZDMkh2cVdiSUFJUXRlTkQzQ2F2RENpa1dJN0FRY3BQZjlzaE1pcy93VzEz?=
 =?utf-8?B?eVZzc3hzY0ZOV1l3TkVlVm43WlhtV09nZk9sakdhb3c2RFlKU3NpWjBoQnlq?=
 =?utf-8?B?ZSt6WEFXU3VHTkRVMTlYbkIzWUlobVlPVlBoOTZlenAwWlpDZkYxTHNOZ0p3?=
 =?utf-8?B?OGE3VXFTaEttdW1SU3ErMGFsOWJueTM5Nzh6aUhOMHBrdHZVMlZ6WEt2TFZL?=
 =?utf-8?B?S3RIME9tL1N4OG81czN0d2hNdjZOcERVY3B3cDNtMW9zM2Zvbkh0MjQ2Qk85?=
 =?utf-8?B?N1pkZFZUS283N2hvN0JpN1VKbHl0TW1Uc2xwQ2RoWWQzb0w5S1BTVUJ3d1I3?=
 =?utf-8?B?ZTVINTVWblc0TDU2a1V6enhqdmRKMnY4bk1HMkFFSVZDNmtNSnJpY25TdEw2?=
 =?utf-8?B?bURXSUREdVRrdW1WQU9WQUJSRGFVWUlnRDNYUmZGN0FmS2NvMVFsR2g5czJy?=
 =?utf-8?B?R1I3OVVTMHcyK2VpMU1pV2Q2b0RjMmR6WW5vM29wTTVOeTJsUE1WWG9aTkNO?=
 =?utf-8?Q?+XUuTKn8Bj4F568t61tMN1hMpzJbEUYV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alhEL0txQll2bm13a1plR21KZGY0ekxCSFA4S1pYTElUcUI2ZFdlSTVSRHh2?=
 =?utf-8?B?bzJTMjVkOTB4YVJxVXdFL2JEUDlNVndOUzhaRjQ1SGhiN2F2ME9LM0pPai8x?=
 =?utf-8?B?T1B4UzNXUmx0bEpqNDljTFFGS3gvYlZGVFl3dnBhMFUzbXJ6YTl5bnh3Y2Np?=
 =?utf-8?B?QXViYUQwT3p4cHE3SDFzcUczYVA5YXAybkxPb3JDNy9Qbklzb1F2UjA5SmM5?=
 =?utf-8?B?NWJPaDRLditrRTQ0U0k1ZC9JMmpNZzY4anUvRndqMUEzQlNQa3Azc1VMMUd4?=
 =?utf-8?B?Q1UzcitKamljREE2SXBoOEM0L0kvcnJ5dWNRZkJoNHZxYklwVStlUENHY0xY?=
 =?utf-8?B?Z2w3c05YazF0QnlmR3FnbittRWJCVjhCRGZGRFZDakt2OHZkcCtaRC91b0h5?=
 =?utf-8?B?TE9xUDBjQlNvaU16SU81MEhaK1BwV01LUkloZFI4Nm9LenF1REpUc0podGRj?=
 =?utf-8?B?b2F1WGpGNzhkTjdEcTRJNWNSUDVYQ2hpeGhNYVdCZzFxWkdvTG5acUNpOWFy?=
 =?utf-8?B?RnVqZjdkcEFsTmtmMzhzcjBJd3Zra2VJVG9xWjZrNXJGSGROaVdMK1V5MGtW?=
 =?utf-8?B?ZW5DUmY1WXIxVXhaZTMvVHVjVHBDVUIwQ0hDUlNHNkI4Z0FKOVBRYlIxY0N5?=
 =?utf-8?B?S0F1WnlnZG91OXhnSDh1Y1J1UFVOSnBFK0ZpbmtGQ1VMeU01VmtEQ3ZITC9l?=
 =?utf-8?B?SzZ2ZTBFamQzS1k4a1kxbjV0cGc0Z1RweC9LeWRLcWNOTWdwTjM0MnBqRGx6?=
 =?utf-8?B?dUpQWEgyVlFjQlp2TzI1QVd3b0N1ZmNXVUV5dVZLOG84eUd5TllWb3BmRTll?=
 =?utf-8?B?akxhcmx6RHQzOTRKZ1VVSitKM1RrbHBzOWI2c0pSSFdnL0xzY2lpRVRRVUxN?=
 =?utf-8?B?VTZReTVJbnYrU0JxQXhHQ01VV1RRN0djellGYkljbVF0Wk5nS2RYZDhGZFl5?=
 =?utf-8?B?a0t4THRWNmVBdHNNSjJCdnVCakw5c0RxSnAyUUNsQ0p2aFZFT01MNVBLZlY2?=
 =?utf-8?B?dHJ0L1dKOFhPei90bGx3V3pIYVE2RlVUaFdlVW1lRC9qT0tGc3pSNG9TT3lz?=
 =?utf-8?B?aHViUnpmSFM0U3UyWXNHRERiY1BaY2lKWkxkdlNwV25HQVhIRWFydVl0cXlM?=
 =?utf-8?B?bG12bWp4dEJJL3NEZ3haQXpNNW9OMURwZXNEaGdZdVVwWi9sOU4xcFQ0Sm9u?=
 =?utf-8?B?OHREOGNFZDBCRVloTTdsNjhUMU9aUFNxMzA4ZTNxQlluaEZBcmlwaWhRTE9O?=
 =?utf-8?B?YjFuRDBkTXdndUxSejFOSHZOL2htM0MrWHdFT1NnS2JVbSs4YWVBRHI4dWh2?=
 =?utf-8?B?VXdlK2M4YlJrY3pCY3grM01wbXA2cXBPdkhWUDNETkFyb1hQdjhId1BQM29P?=
 =?utf-8?B?azNSVXZNZHpXYUxGVkc3cUhrd0h2d3E3UXhHRndoYTl2Q3l5S2ozZ0VHYkVP?=
 =?utf-8?B?bk4yQjl3ZmxBdGZZdDdSTmNRYXVQUndZeWpnUTVkcVBqbnlHK1J0SUtoOW1y?=
 =?utf-8?B?QjBJZVp3eE5XUE1JQlFjVFczZnRDNHYrVUJDc3QzbElXbTRucWVtTkNSM2VK?=
 =?utf-8?B?bzBVc2w3QWErNm1QVXc5d2V5K1ZzTlFIbmYwWEMzaG5hU0tvMWR2K3hoU29C?=
 =?utf-8?B?UkYyVG0wRGlRWjUxWEd1K0lWa3NUK3JyM1Y3eVRWUDF0M0VpOXQybW1xc0pv?=
 =?utf-8?B?ZUExVUoxeStFQ2cxUGZVZHJiSEsySmc3VkMwM05oZFBKTUZ0aXAxQnhneS9k?=
 =?utf-8?B?Y0ZDUFBqZEdseTlnckU3YTRtWkpjT2JPVUpqRlNpTy9pS0lKTlJFeUh5bkFV?=
 =?utf-8?B?SzhGNm9nVks5TGtRaHRaNmlOY1c4VzZMcGFLdGM0ZzNkVU5PelFzSG45WXJI?=
 =?utf-8?B?VGI3S1lXNnUxZ0hTcm0rOS9pdm0ybHhNY3c1TWlCbHM0YUFzekdTa0lSeEFW?=
 =?utf-8?B?dnFINmlOTFd3QWwxOG9VR0oxalhLWGl6azZkS3FvVjhrbXh0RXI1SjcyYXZB?=
 =?utf-8?B?TlNjeHcrZWxRMmNOR3dJNU1YaU9HdFo2cUxtTDBWWm1TekpHblArNUYrNDlF?=
 =?utf-8?B?ejVtMVZweWJ2MmwxL2VNTDN3dng3RStTZjF1d3JtNUtYZkJHY2FiV280MU9O?=
 =?utf-8?Q?BtywoeV2T1k5Js588PM2vwNZr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D01C7061C30F4B4EA6A7B41C73D9785D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c138e3-8cc5-4972-3bda-08dd505df72b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 20:51:06.5111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KiA6z90HaugWkbNA19yBvsajwvOXTJUw5cUGAcNqcpVTfXLURETynnciUSy4S25ACRvGfsy3csfNsmkqvFHIsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9139
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

T24gVHVlLCAyMDI1LTAyLTE4IGF0IDIyOjE2ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBBIHByb3BlciBzdHJ1Y3Qgd2l0aCBgaGlnaGAgYW5kIGBsb3dgIG1pZ2h0IGJlIG1v
cmUgdmVyYm9zZSwgYnV0DQo+ID4gaXQgcnVsZXMgb3V0IHRoaXMgaXNzdWUuDQo+IA0KPiBNbW0g
aW5kZWVkLCBzbyB3ZSB3b3VsZCBoYXZlIGNsaWVudCBjb2RlIGxvb2tpbmcgbGlrZToNCj4gDQo+
IMKgIGxldCBTcGxpdFU2NCB7IGhpZ2gsIGxvdyB9ID0gc29tZV91NjQuaW50b191MzIoKTsNCj4g
DQo+IGluc3RlYWQgb2YgDQo+IA0KPiDCoCBsZXQgKGhpZ2gsIGxvdykgPSBzb21lX3U2NC5pbnRv
X3UzMigpOw0KPiANCj4gd2hpY2ggaXMgY29ycmVjdCwgYW5kDQo+IA0KPiDCoCBsZXQgKGxvdywg
aGlnaCkgPSBzb21lX3U2NC5pbnRvX3UzMigpOw0KPiANCj4gd2hpY2ggaXMgaW5jb3JyZWN0LCBi
dXQgaXMgbGlrZWx5IHRvIG5vdCBiZSBjYXVnaHQuDQoNCkknbSBuZXcgdG8gUnVzdCwgc28gbGV0
IG1lIHNlZSBpZiBJIGdldCB0aGlzIHJpZ2h0Lg0KDQpzdHJ1Y3QgU3BsaXRVNjQgew0KICBoaWdo
OiB1MzIsDQogIGxvdzogdTMyDQp9DQoNClNvIGlmIHlvdSB3YW50IHRvIGV4dHJhY3QgdGhlIHVw
cGVyIDMyIGJpdHMgb2YgYSB1NjQsIHlvdSBoYXZlIHRvIGRvIHRoaXM6DQoNCmxldCBzcGxpdCA9
IHNvbWVfdTY0LmludG9fdTMycygpOw0KbGV0IHNvbWVfdTMyID0gc3BsaXQuaGlnaDsNCg0KYXMg
b3Bwb3NlZCB0byB5b3VyIG9yaWdpbmFsIGRlc2lnbjoNCg0KbGV0IChzb21lX3UzMiwgXykgPSBz
b21lX3U2NC5pbnRvX3UzMnMoKTsNCg0KUGVyc29uYWxseSwgSSBwcmVmZXIgdGhlIGxhdHRlci4g
IFRoZSBvdGhlciBhZHZhbnRhZ2UgaXMgdGhhdCBpbnRvX3UzMnMgYW5kDQpmcm9tX3UzMnMgYXJl
IHJlY2lwcm9jYWw6DQoNCmFzc2VydF9lcSEodTY0Ojpmcm9tX3UzMnModTY0OjppbnRvX3UzMnMo
c29tZV91NjQpKSwgc29tZV91NjQpOw0KDQoob3Igc29tZXRoaW5nIGxpa2UgdGhhdCkNCg0K
