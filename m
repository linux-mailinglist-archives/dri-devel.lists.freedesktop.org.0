Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEF0A20388
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 05:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B01E10E104;
	Tue, 28 Jan 2025 04:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="om+Rl9OQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B70D10E104
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 04:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlTN9fbKD+wnEf7OlwLDoO5xaRDsfCVl9qpaoqdCbTYwe/XnBPF/J7ASYfzC9E3jkwhZNaJUWzAQOO5KjhRVU/0srC51XUivSJmoRpkutMJFGpR5b1//qQTQvHQ0mMmj1rVk5dhaWYBsCTSgFCCsNFP9V4c/5LjWe4TqkrlBzNGAACqTcB/f36VKBXnvb6npymqe4rz2g/IsYqp7N8s9x+5EXUpXgCitqlqikdyj39SCuBUmh3n/e6qtqoaUGkA+Ulm0nKIY6MiY5K6//ILiwC4X9wkBznY+xwmOrhl+0bBAEMW3pDWIlNDF3IOdH91gb12Fa7xlL2U/Gn9qCm6fBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUTjXg9ksBrJHRDnrg+L4mBy4oTU2r7V6Ls0UnGtS1c=;
 b=tSSKRANuEcz3qSlsDD44kBs29fSQCsfYwWESNGlymFuBFZ83o3i7bsu+mjbW6giYyzO3Q/Ap3Ja5QA/+PK0UbbTqkil8XG7uTw84ZQ73ow8Fi6Te6LQPt0+G2flYAOe7V9sqINtrYwoRx0nhgzsxjIQDrFyKFziXyUZJ03EBKmi0j/Tvkt4KPrr5+5DCbvOOlczZlC5F6ic+CyCKFuY1tZyV2NREMA0ZGSjeHBuTyH482XHn5QwlgJI9/6n+qp7OyqLi8fWjSZSDN7jNagAeyZ670E98lT9ybWF59awaEPvqYPX71G/8yQGdiEY82wlvkl3XNBv+Lv2/6MgkYajZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUTjXg9ksBrJHRDnrg+L4mBy4oTU2r7V6Ls0UnGtS1c=;
 b=om+Rl9OQaXo39kUr32rWjBmTeSRiQgekj4GttpNrU2A6rzxBm2z9OJ7X/jEAhUn3wW94GdumnrrIH9srR2GkPQquXwS7t4qs5w4MVBFmyhrOrPVTIDcv9d4Kg1nkFWu5ISXbISrIK7Mv1GBxJc6gB6kObek/kZB+q+w6eNVmCTE1tIUmRXpKbqGnkMtk/5BdCS3Iklnvz/Wa32pRko+nitgtVScbPItoyoGNd0FAAFwqwy00kvooxHeStFa9GqTng5xshXMIVHljKEQEGAZAd/4KKaGeR5Xw9rf/nyAWbd4WVSHr/29SfSbZW90lbts1qDPRBRUSDshnmpDaKfyzTg==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 04:44:08 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 04:44:07 +0000
From: <Manikandan.M@microchip.com>
To: <Nicolas.Ferre@microchip.com>, <sam@ravnborg.org>,
 <bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm: atmel-hlcdc: update the LCDC_ATTRE register in plane
 atomic_disable
Thread-Topic: [PATCH] drm: atmel-hlcdc: update the LCDC_ATTRE register in
 plane atomic_disable
Thread-Index: AQHbHgTz9/mtuBPRlkitZBG568Zv/rKF/zMAgKZDSoA=
Date: Tue, 28 Jan 2025 04:44:07 +0000
Message-ID: <d711e970-2f55-46b0-9ff7-ed49dd885c26@microchip.com>
References: <20241014064644.292943-1-manikandan.m@microchip.com>
 <16e23ecd-24e3-4d6e-a336-da3c4308011d@microchip.com>
In-Reply-To: <16e23ecd-24e3-4d6e-a336-da3c4308011d@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|CY8PR11MB7846:EE_
x-ms-office365-filtering-correlation-id: 3ac3186a-37e7-4fa8-1c37-08dd3f566685
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U0Y0czlxVklxSEN4WTBIclg2aVgwSHoraVBsRGxFUzUvYnBKOXRucWhKaVQz?=
 =?utf-8?B?dzF5VGtyRm9JelZOQWxWZ1JQQnlBbEZIRUxLaXZ0NUc4cnVaekZyWTVGNUZZ?=
 =?utf-8?B?eHRsTDhIMkh1b2lvc2gyQi9uR2dqUVVIRG96UlFPRUprTHlWQlBESlpVNE53?=
 =?utf-8?B?cVNEeEttUGd6TU1xNXJBVjdPaEEvWEVGQzVtSzN3cGhWRGlteFdHUVRXQnJN?=
 =?utf-8?B?UFJZWTdpRm1JTk9SRGFLUHgyUEhhSmRHZWtTaVpyQUpOREt0YWdhVFplWVk0?=
 =?utf-8?B?RXo4TWZ1OTAyUTY1UVBOUFpjTmR5YUVlMEpWKzZIN0Q0azdxcGsvVzlrVldV?=
 =?utf-8?B?T0Jzbm9WQXptSUZjV1ZhNi9uR2NaZFhINTBhSk5rWDEzRFJtZWl1bUt4OXJi?=
 =?utf-8?B?VFNUN0s5ajFhczA5UjJhSDdFcEwyNkgvOUxta3lzQUVRTkJkejlwdUJidkZY?=
 =?utf-8?B?RnN6elZhRFV2dXlIcXNMeFdtZUk3Snc2RkVuMWlmRzlWR0UzVGlHSTM1Rjdx?=
 =?utf-8?B?Q1dxOVJQWG5GdWhnbzk1WXg2SzY5VTVLTFJpV0xOR2hhUlBicDR3TStQTXJu?=
 =?utf-8?B?UFJkSjRkc3RBMUNsQzBEUEQ0VnpRSmtNMmhTb1JEL3JOcFc5eXM0MElXY3Q4?=
 =?utf-8?B?aWdQMVhRbjNVa2FmNnFrTGx0Vm5JSnJnZ2s1VWFOTUNXU05KUnppbW5kUDF5?=
 =?utf-8?B?TlFMaThQaUxrb3JxSWtqNnNmNkloR1lyV213WHdON3o2em9MV01EUHJkanQ5?=
 =?utf-8?B?dnpKcDFxUGNuYmVUSXdVOXN2ZVJyV1hYQ25NZ2hwWUFBRUlmQWhlNWowUmRv?=
 =?utf-8?B?MnR6dkhTMWpjZHVNWjB3T1ZRd2tYRC9Gdld0a2FlejIyUXFzbmtLeWtzYU0v?=
 =?utf-8?B?RzdzOFJla0tjZGc3Q0piY3lid3dRTSs5RnJQNjNLK1NmVi9QWW9tdWlQM0FR?=
 =?utf-8?B?emhFRTdGVFZ5TWRCOEwwL0xUNXVMZ3NXWVAvVm4ybFkyc0JuSnF0bVFGOHZ4?=
 =?utf-8?B?Qm5WN01aUFpwSzl5SXZvUVhGRHptWDZBL0FOSTNKVEdPdG1MVFhGbndQallw?=
 =?utf-8?B?dW5pUmJzU1NjQjZpWEc2d3FqZm1zdFBXd2I4OUlsMzkrdDdDUEZweGVyTGE3?=
 =?utf-8?B?RTFqeTVsQWJhc3lMSXRuRllCMGhkaHcwSlZJSmxlcUhRdzFVN1E4MTIwU1VZ?=
 =?utf-8?B?VW10MXlZWnBQRSs0TmFvQTRSM1F3azVqcmpRMUNGR2RKOEtpT2dDTit6R09x?=
 =?utf-8?B?eWhxK01uSW92SE9Td3NIVnptTTg2UWxkWnlscThETHhVZWtsWWlZTE1PYmRm?=
 =?utf-8?B?c2c4alIxMytJUzNYdUZOOGZjUmhwbWgyejFYem1uSmIrZi8ycU52KzFsdFpB?=
 =?utf-8?B?SFR6K1dEM3NXSndZSFJxbXc2K1FYVy9KWHZSOVo1VW9ObkpudHVnNmp5QW1l?=
 =?utf-8?B?dVN1WmkyWXZqYlM1L011VXhJbnNLc3ZpbnFIbk1nR1lZSWpIQW84bkdqVGpu?=
 =?utf-8?B?d1JEcjBKL1ZvM3FqQkV3MWVDUE5XKzFlb1h2ekliaXJpSDJ6VjBmTkhuRWVM?=
 =?utf-8?B?Vko3SFo2elM4b1FucDIwbWNJcEFnaUQwOXdJTUJuNEFaVVUxdExrcXN0ajcv?=
 =?utf-8?B?V09LaUcwanpvNnA0d0JQeThhc2FpVHVmUU95eGNwVENRaHBJWE8rTU92ZHRN?=
 =?utf-8?B?L1FsaDhEa3cxWkNhbG5hdTRGTmFTdm53ci8vT29TUXhpd2FOSEtkeWpDbFpO?=
 =?utf-8?B?TmpoOVV0dW5SM3pDSEl5U0sxeVhVUjJXYzI2Z3pSamhTd3l4enpUQkJwcUVr?=
 =?utf-8?B?Zzc5V1h0VFFPaVF6LzR1QkowWWgvbmNrUUV4WktnWGVteEx3aFZ6WCtXNVBB?=
 =?utf-8?B?ZEdldnBaRlNkTXZCNWdLcmRiU2dUNzNpSU9DcHl2VW8xMWlNcWpzMTErNklP?=
 =?utf-8?B?SEprMEYwSEVma1pCWWNQb0pkR0c0Z0xKVS9YdUpaREptaEkzS28xcHErY0Np?=
 =?utf-8?B?RTN1VlNrYTBnPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVI1bkN2OWNnbCtRNFBmMm1WSCtwOXJLb09JY2IrT1gyZVNnMUZ4b08ya0lT?=
 =?utf-8?B?Uk5xcERLSCsrcFZEZlU4SmErSmRXVEg2RGxnKzJkOFZRYkJCNXZLMDRCa1lm?=
 =?utf-8?B?SnVpZUtrNzNhZkxZSDJDVmpCLysvWGEvUyt6SmNXaVBoSFk1TE01MVVHU2lp?=
 =?utf-8?B?Mmh1RkNoSW0vdkhZemFOb25GSDV5RXN4UmxIVGJpWFJzZk5VeGdsQytBZFph?=
 =?utf-8?B?TldwVTFab3I2VHFVYWhqWXFMU3ZTUlVvUzZyb3FsZEZ2SGc4dGdEQTJSTkRP?=
 =?utf-8?B?ZEZEdFFzNHRxVG4rdlZxVEw5aFR3dnEzT3dRRERUWmZLN1NlMWZJd0FxRFYy?=
 =?utf-8?B?OHQ4QVgrdkZtZnhIYXY1bXRNMFc4b3RpWEVCcG9kWUtxYUNOSW93Y0hQUkRj?=
 =?utf-8?B?M3M1cFdJNXlpMVppS0lZMzl6M3hORFhUQkFlK0ZaSVNBSXZNWERJQWZuYXZE?=
 =?utf-8?B?bVNLLzEyUHByMFkzODhrWkk4Uk9INC91a1pxMEliUFgyR1hpcHNQY1B0T1Ay?=
 =?utf-8?B?cy8vK1NxazE2Skhia0xCUU80TTRZVHpnYzNNSlB1cEozbC9JZU5wUy9BOEN6?=
 =?utf-8?B?cWFEQmpOdlpyZUxZcGtWOU5RdjVMK2RjT2Z6OWZmYS92OGJZTk91NTZROVVM?=
 =?utf-8?B?RU50V0VheTdZSUVacm5JUlNsemgwdGkvZ1htaFdRT2lKZ3RjYTQ5cG5DREtx?=
 =?utf-8?B?TXhGTWJRYnJlczh3VjhVVW82MHl0LzFhUzdSVE9GTSsxUG9UVC84UzRrUVdx?=
 =?utf-8?B?c3lEdzYvTkNFR0Jrb2FkWDNBYUtqZmZremdCazNVam1JZmN1cGpFSmIyZDdX?=
 =?utf-8?B?MHhoK1FxdzNSZWIveWtGMjVWamJJUVZEYk9zN2F4TEsxS3ZDUW1ZOWpnRkha?=
 =?utf-8?B?RWtsVk9TN1paTUVTMXJ6V3ptbjRUZTBaZUdxMzFPSm9scEFwRlFkeWVkRGN3?=
 =?utf-8?B?SlRWT0MrUks5MGp4S2w1ZkVXZWdmMGNmZ2FxS3ZkajlwNElsQ0dYNUlmVDM2?=
 =?utf-8?B?NEZ5aUZuWmJSeVlWRGdabVJlUkYySmRaQXRKaWMxNTV1OE5PNnhUeWsxMDJV?=
 =?utf-8?B?WmJieHR1WGlTK0ZqeHFzVDUxMzRwOGt6dXZ1d3FtQmgxbWR1QW5kc3RzYk8w?=
 =?utf-8?B?ME45b0x3NlQvVFM1ekY0dmJINGpsQlJlM3dFdWQ5dXRBNjFSWXRleUdGNDg0?=
 =?utf-8?B?OUJVanUzUnNFb1lJVnZVcHVDL3JmaVB0MmpUU3d4NzUvcjhUMUR0bjJmV0dk?=
 =?utf-8?B?ZVdreDFpUytqZHQ1QmxPQXBneGpHb0VwUklKOHhPd1BGcnVHdGZYVTkvRWl4?=
 =?utf-8?B?TWJEbDZkOGZkSnZ3cmoxTGZFcm1WOVBpM1VFUnNzbzM0eVFyVGpFSnpEQldG?=
 =?utf-8?B?Vk1jQ0F2bDY4RmVxRGhjOFd4M1M2TVJ3ZmlVNk9OcjdabGljaEJiZSs4Nk1F?=
 =?utf-8?B?SkRHQmJUdTFOQ3FCYmtaUldzOEZKODNCVGg3U0JhaC95Q1dXc0hwais3Q2ty?=
 =?utf-8?B?MG5vYWFSRHNpSHh1R3ZWMmxyQTM4NDJyaUx2SVp1YUxnd2hZTkJZTytPbm0y?=
 =?utf-8?B?SVFqNkhFd05sd0hKcG03ZUZjU21iTWVheHR2QWRrMjlxeDdYL0t4K1U0VWI0?=
 =?utf-8?B?TUg0NURyRDUwM216NnRjeERWMHhnV0E4Yjd4aWdsS2l6ZVZWOEc1NXMyYXha?=
 =?utf-8?B?MUtsaFpXT3JzVSthMnhRWEFscHZWMkRBZ3VpckhnK2JURFFOa1g4NjhGUFE3?=
 =?utf-8?B?OXlBaGRmR29CSE9ac3ZKVzRlWm0wT2ZOekw3Ri9wbVVWUjZIK3V6Y01RTFhi?=
 =?utf-8?B?QjJFeXJ6OTlMWEdJWlN0bU51anlaakk0ZlRheUNvaHQxUS83S1FpeW9UeUZH?=
 =?utf-8?B?VkxYNVFjQTk5amtuSXpRaDJiU09xOFZuTUYzZUU3bG90NjVtb21UMm8ydWZh?=
 =?utf-8?B?YjRDeDNEMWhqTkQ5S0tvajIxVHBjZGYreHorbjdzQktCS1ZVekZhdDNGR3BR?=
 =?utf-8?B?WnJaWWUvQkNheTRHQzdQRVJodTVYSXZybG9DN3RRL0luZ0hHQXd4elZmL3cz?=
 =?utf-8?B?RlBZeGM5cHRxdmhteVZPNlV5blNqbk40cDhxMlBtY1JkZjBoemRlMmY1S3ow?=
 =?utf-8?Q?aunYXy43+E0w7eOoMRwM44tQx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D5F34CDA8B395647A810B677945DC404@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac3186a-37e7-4fa8-1c37-08dd3f566685
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 04:44:07.5985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0UL/55UNiLub0gGdaE/wIGQTPowL2+z9ZuewwcLg8olRvJl+FIqcp7+juYbQTTF8gYyoctKsVuRcGAzD3ueHn8oSpBP5JB1MhWyzVcPKuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7846
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

SGksDQoNCkEgZ2VudGxlIHJlbWluZGVyIHRvIG1lcmdlIHRoaXMgcGF0Y2guIExldCBtZSBrbm93
IGlmIGFueSBmdXJ0aGVyIA0KY2hhbmdlcyBhcmUgbmVlZGVkLg0KDQpPbiAxNC8xMC8yNCAzOjE0
IHBtLCBOaWNvbGFzIEZlcnJlIHdyb3RlOg0KPiBPbiAxNC8xMC8yMDI0IGF0IDA4OjQ2LCBNYW5p
a2FuZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+IHVwZGF0ZSB0aGUgTENEQ19BVFRSRSByZWdp
c3RlciBpbiBkcm0gcGxhbmUgYXRvbWljX2Rpc2FibGUgdG8gaGFuZGxlDQo+PiB0aGUgY29uZmln
dXJhdGlvbiBjaGFuZ2VzIG9mIGVhY2ggbGF5ZXIgd2hlbiBhIHBsYW5lIGlzIGRpc2FibGVkLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFu
Lm1AbWljcm9jaGlwLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBOaWNvbGFzIEZlcnJlIDxuaWNv
bGFzLmZlcnJlQG1pY3JvY2hpcC5jb20+DQo+IA0KPiBUaGFua3MgTWFuaS4gQmVzdCByZWdhcmRz
LA0KPiAgwqAgTmljb2xhcw0KPiANCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2F0bWVs
LWhsY2RjL2F0bWVsX2hsY2RjX2RjLmjCoMKgwqAgfMKgIDMgKystDQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyB8IDE3ICsrKysrKysrKysrKysr
LS0tDQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1l
bF9obGNkY19kYy5oIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxj
ZGNfZGMuaA0KPj4gaW5kZXggZTFhMGJiMjRiNTExLi41M2Q0N2YwMWRiMGIgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfZGMuaA0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmgNCj4+IEBAIC0z
NzgsNyArMzc4LDggQEAgc3RydWN0IGF0bWVsX2xjZGNfZGNfb3BzIHsNCj4+IMKgwqDCoMKgwqAg
dm9pZCAoKmxjZGNfdXBkYXRlX2J1ZmZlcnMpKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxh
bmUsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGF0bWVsX2hsY2RjX3BsYW5lX3N0YXRlICpzdGF0ZSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIgc3IsIGludCBpKTsNCj4+IC3CoMKgwqAgdm9pZCAo
KmxjZGNfYXRvbWljX2Rpc2FibGUpKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxhbmUpOw0K
Pj4gK8KgwqDCoCB2b2lkICgqbGNkY19hdG9taWNfZGlzYWJsZSkoc3RydWN0IGF0bWVsX2hsY2Rj
X3BsYW5lICpwbGFuZSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgYXRtZWxfaGxjZGNfZGMgKmRjKTsNCj4+IMKgwqDCoMKgwqAgdm9pZCAoKmxjZGNf
dXBkYXRlX2dlbmVyYWxfc2V0dGluZ3MpKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSANCj4+ICpw
bGFuZSwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lX3N0YXRlICpzdGF0ZSk7DQo+PiDCoMKgwqDC
oMKgIHZvaWQgKCpsY2RjX2F0b21pY191cGRhdGUpKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAq
cGxhbmUsDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX3BsYW5lLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9o
bGNkY19wbGFuZS5jDQo+PiBpbmRleCA0YTdiYTA5MThlY2EuLjRiY2FmMmNkNzY3MiAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUu
Yw0KPj4gQEAgLTgxNiw3ICs4MTYsOCBAQCBzdGF0aWMgaW50IGF0bWVsX2hsY2RjX3BsYW5lX2F0
b21pY19jaGVjayhzdHJ1Y3QgDQo+PiBkcm1fcGxhbmUgKnAsDQo+PiDCoMKgwqDCoMKgIHJldHVy
biAwOw0KPj4gwqAgfQ0KPj4gLXN0YXRpYyB2b2lkIGF0bWVsX2hsY2RjX2F0b21pY19kaXNhYmxl
KHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxhbmUpDQo+PiArc3RhdGljIHZvaWQgYXRtZWxf
aGxjZGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYXRt
ZWxfaGxjZGNfZGMgKmRjKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCAvKiBEaXNhYmxlIGludGVy
cnVwdHMgKi8NCj4+IMKgwqDCoMKgwqAgYXRtZWxfaGxjZGNfbGF5ZXJfd3JpdGVfcmVnKCZwbGFu
ZS0+bGF5ZXIsIEFUTUVMX0hMQ0RDX0xBWUVSX0lEUiwNCj4+IEBAIC04MzIsNyArODMzLDggQEAg
c3RhdGljIHZvaWQgYXRtZWxfaGxjZGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IA0KPj4gYXRtZWxf
aGxjZGNfcGxhbmUgKnBsYW5lKQ0KPj4gwqDCoMKgwqDCoCBhdG1lbF9obGNkY19sYXllcl9yZWFk
X3JlZygmcGxhbmUtPmxheWVyLCBBVE1FTF9ITENEQ19MQVlFUl9JU1IpOw0KPj4gwqAgfQ0KPj4g
LXN0YXRpYyB2b2lkIGF0bWVsX3hsY2RjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBhdG1lbF9obGNk
Y19wbGFuZSAqcGxhbmUpDQo+PiArc3RhdGljIHZvaWQgYXRtZWxfeGxjZGNfYXRvbWljX2Rpc2Fi
bGUoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYXRtZWxfaGxjZGNfZGMgKmRjKQ0K
Pj4gwqAgew0KPj4gwqDCoMKgwqDCoCAvKiBEaXNhYmxlIGludGVycnVwdHMgKi8NCj4+IMKgwqDC
oMKgwqAgYXRtZWxfaGxjZGNfbGF5ZXJfd3JpdGVfcmVnKCZwbGFuZS0+bGF5ZXIsIEFUTUVMX1hM
Q0RDX0xBWUVSX0lEUiwNCj4+IEBAIC04NDIsNiArODQ0LDE1IEBAIHN0YXRpYyB2b2lkIGF0bWVs
X3hsY2RjX2F0b21pY19kaXNhYmxlKHN0cnVjdCANCj4+IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFu
ZSkNCj4+IMKgwqDCoMKgwqAgYXRtZWxfaGxjZGNfbGF5ZXJfd3JpdGVfcmVnKCZwbGFuZS0+bGF5
ZXIsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQVRNRUxf
WExDRENfTEFZRVJfRU5SLCAwKTsNCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoCAqIFVwZGF0
aW5nIFhMQ0RDX3h4eENGR3gsIFhMQ0RDX3h4eEZCQSBhbmQgWExDRENfeHh4RU4sDQo+PiArwqDC
oMKgwqAgKiAod2hlcmUgeHh4IGluZGljYXRlcyBlYWNoIGxheWVyKSByZXF1aXJlcyB3cml0aW5n
IG9uZSB0byB0aGUNCj4+ICvCoMKgwqDCoCAqIFVwZGF0ZSBBdHRyaWJ1dGUgZmllbGQgZm9yIGVh
Y2ggbGF5ZXIgaW4gTENEQ19BVFRSRSByZWdpc3RlciANCj4+IGZvciBTQU05WDcuDQo+PiArwqDC
oMKgwqAgKi8NCj4+ICvCoMKgwqAgcmVnbWFwX3dyaXRlKGRjLT5obGNkYy0+cmVnbWFwLCBBVE1F
TF9YTENEQ19BVFRSRSwgDQo+PiBBVE1FTF9YTENEQ19CQVNFX1VQREFURSB8DQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIEFUTUVMX1hMQ0RDX09WUjFfVVBEQVRFIHwgQVRNRUxfWExDRENf
T1ZSM19VUERBVEUgfA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBBVE1FTF9YTENEQ19I
RU9fVVBEQVRFKTsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgLyogQ2xlYXIgYWxsIHBlbmRpbmcgaW50
ZXJydXB0cyAqLw0KPj4gwqDCoMKgwqDCoCBhdG1lbF9obGNkY19sYXllcl9yZWFkX3JlZygmcGxh
bmUtPmxheWVyLCBBVE1FTF9YTENEQ19MQVlFUl9JU1IpOw0KPj4gwqAgfQ0KPj4gQEAgLTg1Miw3
ICs4NjMsNyBAQCBzdGF0aWMgdm9pZCANCj4+IGF0bWVsX2hsY2RjX3BsYW5lX2F0b21pY19kaXNh
YmxlKHN0cnVjdCBkcm1fcGxhbmUgKnAsDQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhdG1lbF9obGNk
Y19wbGFuZSAqcGxhbmUgPSANCj4+IGRybV9wbGFuZV90b19hdG1lbF9obGNkY19wbGFuZShwKTsN
Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGF0bWVsX2hsY2RjX2RjICpkYyA9IHBsYW5lLT5iYXNlLmRl
di0+ZGV2X3ByaXZhdGU7DQo+PiAtwqDCoMKgIGRjLT5kZXNjLT5vcHMtPmxjZGNfYXRvbWljX2Rp
c2FibGUocGxhbmUpOw0KPj4gK8KgwqDCoCBkYy0+ZGVzYy0+b3BzLT5sY2RjX2F0b21pY19kaXNh
YmxlKHBsYW5lLCBkYyk7DQo+PiDCoCB9DQo+PiDCoCBzdGF0aWMgdm9pZCBhdG1lbF9obGNkY19h
dG9taWNfdXBkYXRlKHN0cnVjdCBhdG1lbF9obGNkY19wbGFuZSAqcGxhbmUsDQo+IA0KDQotLSAN
ClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
