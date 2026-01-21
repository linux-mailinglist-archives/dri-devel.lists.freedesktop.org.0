Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E/SAGlOcGnXXAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 04:56:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99350AAF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 04:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9997410E02C;
	Wed, 21 Jan 2026 03:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="XXZmuBPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012022.outbound.protection.outlook.com
 [40.107.200.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A954310E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 03:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bkwdb0J22j/bze/Lze0rS4In5vfrNbbya2GMkBX/VCap/AzWoHY9KunvVGth5nB88zi92D++UQQy8PiObq8CIrOew5IHrdrLnaA+F29v1+jK9TaCHlngfLOOMjKpovr0JL6ZWPQrPlzyZf2LMRFWhs1j5mgKTieNP8rc9ZpO5Hy2VxL6AbnvlKIyeyJYDu0jQL73rM2rqwMlyx4koVZsIXRABBiL2salBLd13Uvf9NxVwLLfn7XVATgM9KtqTJS6GIouKsSKUegJywsWVghAlWVutGa+xwJuoBMbryzDylHWBW1P6qHsCf9CJtfByQ9aN9ohFzUNt4hZCoNim9JnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o27HM7u3tvfuVgE4XaBN7/ravGQQseR9DmU5fZIVddY=;
 b=iVFz2GcdK/AfriRoNNtsLn32jPMAnS1U5FMGoyO3wpXPtN9lMG3fmEgqbBcK7nOe1h32gWW+RNXCflUuNW2c146HRLbhJiu+7bnnHm3bQnYKPsUYyaQkcwZW3VT37kfbHpPPBRnXRLriHUw5JYknugDv65KeT+Eu1bUDqPCFylIenbLJpNiAcAhYq91PoZ99f2lBJr7G/Lxm5jo3cBGzlR0M+ar7427ShqocIdCBIeejVqwI87KOJA3qq6mxOMtqYqo8lqlbvO0VBx0Up4H1+0p4Ip8JQhFEcYO70FhLjBpmLB2am+MObMagZELK17zHK4SznMcdie+FZvwRGsC/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o27HM7u3tvfuVgE4XaBN7/ravGQQseR9DmU5fZIVddY=;
 b=XXZmuBPtutcWIJIgyP2BK4eShTs0VoZdTq4TQUp2m3O+rB43nHtRylX+7/+ln0qY+XktZZ633e4QmUTjMC2H9ru4Xpy85X2aJQqXTJh/NGlQE6vylgsax4yy3Hk3gW0EsoN8zrUl3IxUUtRkOMW1hXCffnWy/Z7xLFlO5NsUqz07ASNvC23by8CMsu9uYWmaWyPevyNt/Khxy5qvilMqzwOwQtnJzJaG/eHx7YHoJhbiUtZSFRuohX4HRDDDb+gYH/Y7JgiMszjvSbXEBHih3UU9xDK5jzRrD9dTN/NUvHM87qi9JXUQu+kiVU2YwUFBInQzlEs5QomGeeZ4RmEfew==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by IA1PR11MB7944.namprd11.prod.outlook.com
 (2603:10b6:208:3d8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 03:56:16 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1%2]) with mapi id 15.20.9456.008; Wed, 21 Jan 2026
 03:56:16 +0000
From: <Manikandan.M@microchip.com>
To: <Ludovic.Desroches@microchip.com>, <Dharma.B@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] drm/atmel-hlcdc: fix memory bugs
Thread-Topic: [PATCH 0/2] drm/atmel-hlcdc: fix memory bugs
Thread-Index: AQHcRQFeQJRKPVfW2Eqh1yNSJs0dQLVcicMA
Date: Wed, 21 Jan 2026 03:56:16 +0000
Message-ID: <a69dade2-1502-426b-9b3c-01d1f3f39a0e@microchip.com>
References: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
In-Reply-To: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|IA1PR11MB7944:EE_
x-ms-office365-filtering-correlation-id: 8b91b10b-3e26-4306-4931-08de58a1073a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?dVExOU44N2tIZVBjK29hOGFjcGtpd1FlZWR1bzJyZUFmSkMvOGRLbk1NS2hS?=
 =?utf-8?B?NGg0S2lvNkRJb3lUbDB5RkVveHB1S05sQXlDVGVrU3Bmd3YvRnBrOG82R1Mw?=
 =?utf-8?B?UkxTZlFVZS9kNjRkSTQreXh5SUJrMU1TRjE0WXgzYTJLc3I1UjVFcldPTDJj?=
 =?utf-8?B?NlJmdzJycUVubHF1b2lXOFU1RVhrTEgydHJPeWVTRjF2YkZzZWI4em1neHNr?=
 =?utf-8?B?M3dzcTJYTzlUbWpaeVBNZjhZc3ovTmdYTm5qbTNDemJuU2taRTRpTi9yVFpF?=
 =?utf-8?B?TFhJbUdDc3UzRWlZMXlMRmpWc1gybmJzVDVjbWNUOU5UMFp6V1NNK1c3d2Er?=
 =?utf-8?B?b2JtS1dYSk91KzB3SkN3MklMbDA2T0RMeERzMjJ1a2ppbUxRemVvZXg1VWJl?=
 =?utf-8?B?Z2VPdWNxS2cwNlhveVJSRUhUdHZ4QmNZMnM2bVh1d050bUxGUXM3aUg5cGQ1?=
 =?utf-8?B?Y0N6N2diOE9TT1dBdlJJUkYyN0dnUHhoUTNSZ1hGbTdTTkFPdzc5aWphbm1J?=
 =?utf-8?B?eFJGNDdQb2ZSa2prSmZpNEVBL2xRTU9ZZFJiM2V5WmhiYWhmN3JQVVpQb2hZ?=
 =?utf-8?B?YzVKbDl3VXZMN3RSQmxkM0xmejhCS2lDQ3phbkJKNWJoQU5weFNBd0NsaXFl?=
 =?utf-8?B?M21ja0RPVHdQcVowR25yOVROMmRhcGRkcGVEMDZxU0xwMHA0RTVoYUU2enJp?=
 =?utf-8?B?YTN3U0NJdlpaQUZPUVpoU0ljTmYwUW9yZGtXZjhrMkRwZ002RkIxZlBXZEdO?=
 =?utf-8?B?WStRVFVteVZ4emFKSCt5Vk5tOTV3ajBnaGdEWVNvR1dUVFVlVzE1QXlwNFQ1?=
 =?utf-8?B?MDdXZkhsTHRSblREQ2gvSUYwdHBDaklJRlhRdFl1VThvZzNEcUlpeGNodnBi?=
 =?utf-8?B?ZFVZek90YVk0T3dueVZHbnBoRjNYQjNrdG90NTQwRzVvdmZGaDE2RzBXelN0?=
 =?utf-8?B?VFA4c09DWEYyMjFPcXI1eHBURmhJMDN2VFRNbjFJNlpiN3I2TlRvZDExLzQx?=
 =?utf-8?B?Y3dCc2l2dkZpRndTSzVha09HSG4xODZMK1RZaVRXRG1jaUZtNXdrVUNqNGt4?=
 =?utf-8?B?NEsxb0FvTjRrWnZ6SStxOWpuUnF0Z3pxMnNqdTJ2VDlhNk1KSFRkUGVlbnFM?=
 =?utf-8?B?M0Jrd1BDd0tOS2cyYnl4bnJLRnY3UGljWUhQSFVPTUp4a2pEWEt1d2pnWnVI?=
 =?utf-8?B?V1VuZ2U1QTZCdDZNOVlaYWRpY3FDY0FvbThENnFZWlQvU0kyeVdSWk5DL3Ro?=
 =?utf-8?B?eXIzNnp4emJrL1BwRnlmSnF3KzdBeDZDRGFFa0ovQk5BWDN0SmhYcElYbmVG?=
 =?utf-8?B?WEt1MjU2MFd3MVVMOHJxaHFRQTJWTzBNQ0k5cjdadGhEa0QyNkhmc1h5WmxR?=
 =?utf-8?B?bnIrQ05KK2hlRnAxRnM1aVlCcjJaWnVvZHpLaEtrWTlTQlNmQk1ITUdmRXVm?=
 =?utf-8?B?V05GUEZIR2ZMRllhNmdCcFlmWjZnUGFEbVpiT2d3eHhKYlQ1MDZQQkpjcnF2?=
 =?utf-8?B?U0kwbDdyUGRRTUI3aTE4YVJEVVQ1SDdMRjFqYjVERHVxMnc2NVB6RjVEdDZC?=
 =?utf-8?B?a3laVGs4MmpoZUtRMmdneHV1dENReXhEdmpTc3JqdTRDZUFVMHNQZGxCQUVK?=
 =?utf-8?B?SWpzam5relRXb3I2UTUwTWY3MTNDQkpGckpXcS90ZDFmajR5N2V5Z3FNeFRl?=
 =?utf-8?B?TGg0K0dkMTV5dWlFN3ZnNVJtUFpuVTFrNjJGWTB3V2lyOEFWT2dVWUNIRkYr?=
 =?utf-8?B?eG82Slh1VUtSZlh3cEFFN2FBVnYycjQrbmlCOG5ZaE5nUUl6dFlLcldTYzVp?=
 =?utf-8?B?SFFrbG00SXhicWVjNU1WRDh4TnBGanR6bmR1di9nMlVORTFCY0FhSnI0bU12?=
 =?utf-8?B?K2tOZGFXRXBPMEJ0UjRHekp1MmRoOUUwNTRsYTFWRUlMZU9Rd2FXRUV5d2RI?=
 =?utf-8?B?MVpVUUZrTGVlc1hIY2V3dDNkbk0rRjZXQnpqMTVsZHdkYTVMTEo4TnBld3ZC?=
 =?utf-8?B?UmNTa2FNeE1talpCM0JiaG0wbW5pN3MvVHFNTkxpRUYraVB2VnJjc2dxYU9Q?=
 =?utf-8?B?S0xLUGRMMDBQbklnaVBOZ2ZXVm5aZk9NSXhSSzBpS05ndHVoeWNNd1FkOFV1?=
 =?utf-8?B?aGErYlZjVUlRb0tNVzBPU2hoMzZrQXlLRk40V0V0bXdBQmZWcld0U1hxNWR6?=
 =?utf-8?Q?fxYHi1gCO28vuWhFE8O7YzpIY+q+2OidrnaXyVGiP+DD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUh4YXl2QlJjUXp3aHlnRHptQ3VJZ3hZVHFNc1BhYlc1Nkp0bzRkWkdqSklQ?=
 =?utf-8?B?TVZpRXVhMG9lcVNYM2F3ZGxnM09sV09nSDBIWHRXL0ZZQytSTVV6QU9wTDNl?=
 =?utf-8?B?MkQvNFkzYWFxdFVjNk9nRURNNDg5S1BaQ3R6dzhBUE1IcllUbTJybGwrb08z?=
 =?utf-8?B?ODUyZk9KOU1ZSHhCekRFOGJRclNVdG4wR1cyc0xkRnZ6bWdCRDVHNmpmdVhx?=
 =?utf-8?B?bUVyTG5wZmhpNFM2QWtUQmg0cU45UkJhbWZCbWRWYlJvMVZVTzdNRm94M1lL?=
 =?utf-8?B?WkIxaUJBT1ZjblZ3eGRIQjZzQnRKRzVWT2NPY3pwQTRKNnFsNjZhVkFkV3U3?=
 =?utf-8?B?MHpJOWN0VHNFVDJWNkkrSE5mRUFBTElzQk5UbWdwK2NxMmdTckk2V1NDT1Bm?=
 =?utf-8?B?clZzWjZnU1hSRjhuNmlpUDk0WkZlUEJoNWhzcHpqU1UvU1pzQ0JYTGdET2No?=
 =?utf-8?B?M3J1dmhtbXQ3Z1lKbktoSExsWFJPOWZydDhnQ3haTTBNRHZaMDEvS0dxbHBF?=
 =?utf-8?B?WlJNN1prUVo3c3IxRWNVb2N5V0xPbDJabHZ2RFhQSUNSZlpaUUl4UytoTHY4?=
 =?utf-8?B?SWh0Um52dXZUKy80UFc0ZUVjekFLdXpuTjlsRG9RODN4ZVhOeG5jZUhJOXM2?=
 =?utf-8?B?ZGFJYzJ6YWVveVRVQUx0MXFtUGxSYjVDM2k0VCtXUWRPMDJvWEJYNVJDVUNh?=
 =?utf-8?B?Tk41OVpLMUdLMFcrNlZsWEh4d3Z5akx3M0RUS1Z3ZXd4bEdrZ0ROTXpYQk5M?=
 =?utf-8?B?QUx1cnZXaWJsVFpYR3Vta0NjdXhnYjkrbmp4alhId0hmVjBydEUzNzlVUFYy?=
 =?utf-8?B?TThXSWFGTFNUbzUzVWZ0Wkhic2NUTEZrUWorMU9LaThLZ1ZSVmNMUGRLdUlj?=
 =?utf-8?B?V3JyQWgxNDF0RmxhRGZhcVIxRmxmVHlzNVZXK0R5bklkb0NPUFo3Vi9mcTdV?=
 =?utf-8?B?SlJNVHlMQUhPVkhsNjM0TGs0YXpOUVEzYXFCaktXODlIQWx4VTRlWW9aUGJa?=
 =?utf-8?B?T0s0QTIrQlRMQUVyMmtFdFFpS0s3Qld2bGcvd28xaE55SWdZbklDRHNMcVkx?=
 =?utf-8?B?Z2I3eUdoRGI4MWRwOGpzWFZvMnZZTkVra1J1Nm1hUlZ0S1QwTEJTdG1BSExX?=
 =?utf-8?B?aExmK0drVVBzVkJScVQ1UXlHb2lta044Nit5VnMwNjdkNVV5UWN0aGNNYUNS?=
 =?utf-8?B?dllTTWlnbUcrZzl1Ylp6YzBGTGFBTENYVkdWRjFiWDNlVGJka1cwZWl1TzAy?=
 =?utf-8?B?S0hWaCtoWEZVcEpjdlFmK0taNy9qSzdyQTZRM3V0Nk9jS1A2Ty91SHVsWWxC?=
 =?utf-8?B?YURVNjlxU3ErNHhuN3ZMTFcycXNyUnQzSWVUUFl3OFkvdDh4aWhqSHJSZ2t0?=
 =?utf-8?B?ejFOS2lUM25KOHhkK1BsVHZuZlVnUmwzV1BHUS9UaktqUE1SM2Ixcmx5cDJE?=
 =?utf-8?B?MldoMXQ5YitYQTFud2x3Q2pmMzNEWlpOZ2NuWnBWL1JFdFRjYlRlUlJLT0xI?=
 =?utf-8?B?T09Ed0ZHQ29WRlc1S0NWSmhDQnZ0TmNOQUsrNXhmL1kvY2JBaHRpOEl3QmFr?=
 =?utf-8?B?YXp3SEdEUHBGM2Z1SWxiRlMxdmhDQnNRKzJ3aUZSaHljK0NJZFpoUDBpeVdv?=
 =?utf-8?B?cUtqOXJnTzluYkl0cS9KczZJcE41eW5XcWRuMzNyN1djbWJsNUxBR29URStW?=
 =?utf-8?B?endOWitrNy8xS1NYdzBmR2tvejNTZTd1ZklBWjMrTHpSR3UvVVVqdGcrVlRv?=
 =?utf-8?B?T0dIY0hjYWFFbXE2S0FIZ3M3S1ZEZ3hUOWRmS2Z0bU55K2NPb1EwUWhxVThC?=
 =?utf-8?B?N2RBZUFqdHFaczRpaUo0MzA2aU9tdmxaanNHeWxxN1M5bUhwTDRjWFZTd09F?=
 =?utf-8?B?Z2tjY1QyWVJEeFBucDdzSms2NlJhaXlEcXcrN096b2RkZytUbWI3ZVlzYm9j?=
 =?utf-8?B?U25waVdweVNHTFVVeFhxMDlNOS9PZkVLTC9WMmF1cFhmZmNnMU1XS1NnbDcw?=
 =?utf-8?B?N0puUGNlVjJyUnU3S0F6NnBSOTVraXFHQ0NudlF6L2IvMjJsU3JuUU8yZFlK?=
 =?utf-8?B?bXd4Z0RGVjgrUHNkY09nU3pKaEd6NUl3WG80MDBxV0dRUHJqOEJUT2xnQ0dK?=
 =?utf-8?B?Qm9LUzFrZmR5cHFJVFNjZWF5S1gzV0M0Umw5bW5KWmJoMEtRUCtZVEEvZysw?=
 =?utf-8?B?eWVTNGtKTFBzTi8vRWIyYTRsWUFuQTdhODE3RCtpL1NvR290ZGhqUTV1cUJK?=
 =?utf-8?B?NWhBbjJNT0dOaElZb2JLNy9IclZKVmFyRjRaMCtnV0FzQ2h4cGx1N1BXTHlN?=
 =?utf-8?B?TENlWHU4TkVVbGo0NmhHZWhXN3BHMGwvVjF5UXlWak5vQmo5VnpVdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BC95A1E2979E2428B39947AFDB547FD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b91b10b-3e26-4306-4931-08de58a1073a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 03:56:16.6922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuTijG0adhPI91j4uUmcePBOcvGSULv+zXhF/rhY60q0m5HxgrUle2/KahpshJ31IAKzVXWrEs/i87nZnFvWOfl2KY04yfgXEucuk/OJSEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7944
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Ludovic.Desroches@microchip.com,m:Dharma.B@microchip.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:Nicolas.Ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[microchip.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,tuxon.dev];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,microchip.com:dkim,microchip.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 5C99350AAF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjQvMTAvMjUgOTo0NCBwbSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IFRoZXNlIHR3
byBwYXRjaGVzIGZpeCBhIG1lbW9yeSBsZWFrIGFuZCBhIHVzZSBhZnRlciBmcmVlIGJ1Z3MuDQo+
IA0KPiBUaGUgbWVtb3J5IGxlYWsgYnVnIGhhZCBiZWVuIHJlcG9ydGVkIGJ5IHNldmVyYWwgdXNl
cnMuIFRoZXJlIHdlcmUgc29tZQ0KPiBhdHRlbXB0cyB0byBmaXggaXQgaW4gdGhlIHBhc3QsIGJ1
dCB0aGUgcmVzb2x1dGlvbnMgcHJvcG9zZWQgY2F1c2VkDQo+IG90aGVyIGJyZWFrYWdlcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0Bt
aWNyb2NoaXAuY29tPg0KDQpBcHBsaWVkIHRvIGRybS1taXNjLW5leHQuDQoNClRoYW5rcyENCj4g
LS0tDQo+IEx1ZG92aWMgRGVzcm9jaGVzICgyKToNCj4gICAgICAgIGRybS9hdG1lbC1obGNkYzog
Zml4IG1lbW9yeSBsZWFrIGZyb20gdGhlIGF0b21pY19kZXN0cm95X3N0YXRlIGNhbGxiYWNrDQo+
ICAgICAgICBkcm0vYXRtZWwtaGxjZGM6IGZpeCB1c2UtYWZ0ZXItZnJlZSBvZiBkcm1fY3J0Y19j
b21taXQgYWZ0ZXIgcmVsZWFzZQ0KPiANCj4gICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMv
YXRtZWxfaGxjZGNfcGxhbmUuYyB8IDYgKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA3MmZiMDE3
MGVmMWY0NWFkZGY3MjYzMTljNTJhMDU2MmI2OTEzNzA3DQo+IGNoYW5nZS1pZDogMjAyNTEwMjQt
bGNkX2ZpeGVzX21haW5saW5pbmctYTEyMzRkODFhNzY4DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQoN
Ci0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=
