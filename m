Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B382CF20F7
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 07:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2023610E272;
	Mon,  5 Jan 2026 06:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="CqmGkEXC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012041.outbound.protection.outlook.com
 [40.107.200.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2373110E272
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 06:24:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cM767ZUJIkaStW4hygovR/FYplS1rBNRRKHU/6UnPtjkGgU7kJBFTSzBiGqYbUWxtJpVhVVKaQVPb4xZJUNHIfl1MOtUIJSmdC99Jj75qY62zndcHaEB1+RbQ+H1jaAQ+MOtdINCrYqawfJQXe1sUY2v8IlLgN0prZn4BTRfTEgkCzebqy/Mo377NEpXtrzFH0q61h9hc3AJWElI7ApAHI3SPphHReQhcxqVj6r+7DY3Lvi0bEmQtApPc5QVoy6CkMCETwkGJtUeaWH4Os+T4KFJgSi5jpwFiPRb/zaVokApGdBGFWXj1pffSA4sah9BJshPWziKAoko98+MIJrbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epGxmRcjtXnUoTAzpyQjNJgyPEB/k4wXT92S9jX49s0=;
 b=Jc7FL4vuB7iuvmsXB8+xz1IpbIEJQK0Vc1DTLHPUyQfnwrx9PJdOLCPMZLzSx3r+AIweKyvPZFVCo8xH8xHQ9vsMhuBYRotMabFNLkYWVW58InMBukKMsK/hU6xa2hykRav8rYbPdCj/MDgydrKEG3PH/RqOKno9+bhGKR8H5YBrJ06j2XG3q3P6vX0naeAAKZ2ruzWZmTbSggKaLdTsDSJrrcq0vM8XzQgbBXRuADQMtCYjaucQ+NWYPg4WADCaZb4nJceA7BTW1VGdXZUebp4qSbiE5b4ty9CHOmih79BSuxgPZdhgBPQDq3TEq0GPl2Tg7stvSSGbcjeEqKuSeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epGxmRcjtXnUoTAzpyQjNJgyPEB/k4wXT92S9jX49s0=;
 b=CqmGkEXC8LPlCeZU2o4hC9W0YnIDRYy+8jiNv1w/rbsXT3GZB69hDScH7T6il5lnUbzaJESk8CKyVVALli3tB0dX+ijOAAZT/xbq2oEDXRIMp/FnTd8v46Z40yPGz1DeavwJI3IZKAmyux0FaiKCXdiSz0Tko8SxO+HgFByQKtwiiPLdKd0FglFiVTOt3ltkyJjkUliNjgGV8hsqU840YMXrZoC92+bDEFM9GFkpO54kGa2kJr/WNeuIV0ShPtHC318ecTgZQQjRMLIkfsO9acg1vaHZN6VKqwiThMlXT95hys7spG63HASnnDY2xYpLZ4wM6iJCquYPWFP2f0Qf7g==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by SJ0PR11MB5118.namprd11.prod.outlook.com
 (2603:10b6:a03:2dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 06:24:33 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1%2]) with mapi id 15.20.9456.008; Mon, 5 Jan 2026
 06:24:33 +0000
From: <Manikandan.M@microchip.com>
To: <Ludovic.Desroches@microchip.com>, <Dharma.B@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 8/8] drm/atmel-hlcdc: destroy properly the plane state
 in the reset callback
Thread-Topic: [PATCH v2 8/8] drm/atmel-hlcdc: destroy properly the plane state
 in the reset callback
Thread-Index: AQHccCIAWYLYF+CWq0SS8hhv7em3OrVDN6QA
Date: Mon, 5 Jan 2026 06:24:33 +0000
Message-ID: <5c7b089a-6e6c-4624-b5d4-e3363318801c@microchip.com>
References: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
 <20251218-lcd_cleanup_mainline-v2-8-df837aba878f@microchip.com>
In-Reply-To: <20251218-lcd_cleanup_mainline-v2-8-df837aba878f@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|SJ0PR11MB5118:EE_
x-ms-office365-filtering-correlation-id: 8e67895d-6754-4d65-28b1-08de4c2317b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?ekdxNjB4dUZlUVRyNElMVmtKcTdmNVpaUTR6VW1VQzVsZURUQnNETnNya09E?=
 =?utf-8?B?UTEvNURWa3FVeHl3MTVOdkxGYUhDYmp0eHRFd21Qa3lqMGVEaGQrV3FOZUdI?=
 =?utf-8?B?TnZoNVhKc2s5eTVtRGtCVnUxZlFmcGxZOEtxZGNTKzBwVGhqM0FqaDhUZ0NH?=
 =?utf-8?B?Y2lmNHp1MXMrU3h5eE9HM0VEOGQ5MzI0OWxkV1Z4ODVQTHg2L3ZvRjdQWmhw?=
 =?utf-8?B?cU1JWWRqZW9HS3hlSFkyeWxSVm5Fa0o5OGl2L2Eydm9Ja3Jjd0l4K0ZkdzRE?=
 =?utf-8?B?VHc3T3doWlducklSdytEbW5kSEFxRExGekhSKzJtUWtGVUJHQUsydkUwaGU4?=
 =?utf-8?B?NlJMOGRMMlBpdTFvcU5ybmtnbHNtVkE3L3FOZUE1SVJVbi9uT21xTHVFVXZG?=
 =?utf-8?B?UkR0Tis4YkRVeC9VZVNnb2MzcFB2dGk0ekZFa3lZNjZtWU1LcEZHd3FhaXJl?=
 =?utf-8?B?ay9BeXNodHZKSHc1T0ZwWXBVREJvRjBGckhWbVJLUGpxYXhCNlgvdzBGcC9l?=
 =?utf-8?B?K3g5ZGszUTI2WDU2UXZGcURFSUlpa2RHTVlVOFYxaHRTKzBKL0d5MkdGbTZv?=
 =?utf-8?B?ME9TYnF3YkQxNk1kaWU1Rm5BbEhDdC9xanRSV05SazhLRmY5eUxIcm9ja1Zi?=
 =?utf-8?B?REd6VWFtK0syRjVYOTF1b2NObXkwKy9GK05ZNjByeWlPTStPajJGUUF1QS9Q?=
 =?utf-8?B?VXhvYjAzcmpJSXFuQzNGQUh5V2hTRVlNWWpadTUrMklhc2hsNm1ydS9DM255?=
 =?utf-8?B?OERCcThjVkY4ek5JaVUyeGlYc2ZpdEo5VVAzb3daNTNqTnFtZVg0dU9XZy9W?=
 =?utf-8?B?L2RBS0grbzVtL25oV0JSN3RjMk16M3pBcWg3SFdwNkNFV0JmMTE0dEgwNXVB?=
 =?utf-8?B?NDl3M0Y3d2pkbnBzZHQ3VzRkdFppejh2K2NIRklDWEVmN2Njb09CSm1QTUwx?=
 =?utf-8?B?Z3N3RlJqTVBUWGR5STdSc2M4cjdOekZDQmVvT2tUZXAxTUVrdlJpOThnQlFX?=
 =?utf-8?B?Z0dvTmQ4ZmU0Z0Y4a29CRUlib0lKUnVVOG04TTJOMXloaSszNGFSWHFLaHN0?=
 =?utf-8?B?Zk5sNVl2YXVzU2VSVkRqWGtDMWRBSlg1M1kybmxtaWt4YWtCdEtCbDlBbVEz?=
 =?utf-8?B?MlgwUjdXT3QrMUFrbnA2WnZvTFdtbTFNRUVNS2VUbmxBMGk5bC9GWDM1WTBl?=
 =?utf-8?B?TXZtVHBSQWlUNDhlaXFUUmMxRlFzTlFoODlDS01RaEFtVElQZW1CUmxKejB2?=
 =?utf-8?B?WmhQVFVaV0UrVStCanUvY2c1ZHNKVDg4cG1DMVFXOGViak5CbFVlaGlEVGpQ?=
 =?utf-8?B?ZjBVVUlWZWlZdWNHbXh5Z3ZDelFzVWRwUndHWFFPUHcwSXZWNHBjOGhRNE1p?=
 =?utf-8?B?NlJGZmRwT25BUVBVVjBXTW13QlRiUWYvK3pacWpCRy95NG1GZk5jY05nZFcz?=
 =?utf-8?B?TlBPajJZZlprNDlFcmFRSnlVOHNJQnZyR1pYNDh0Q0ZOb3BLVHk0aVduYzlr?=
 =?utf-8?B?b05ORWVlUnNXVWxQQjB4T2VNeUdLVTBmNXBKNDFHNGJIaHBJMzVsYlE1aVRV?=
 =?utf-8?B?WWhIR0dDUlA5c2tjV3NDcytnV2hmNWcrNWQzVDAvK1NmY2xVQmRtTzVMOThL?=
 =?utf-8?B?aVFQcjFJK3pwNFFPd3dGQ2VPNFRDK0tjdGIvN2hJanJYZWk0TnowN29pOExq?=
 =?utf-8?B?QkxKQjJDcXRZeWdUd3JQUGZGcXlDSXRtTkZjUjBOTm9iRDVFbmZQOXRnb3d4?=
 =?utf-8?B?b1BGZzhXMlUzVE9OWkwrQ3dHVENHbW1QQ1FyL2Fyb2NIdm93MW4zdDJrRU1D?=
 =?utf-8?B?SjZZYjdpTEZBR0JSNFRId3pEQ3d1a3RtaUc0VVhIVkNEeGYwdUMxS0xTRG9V?=
 =?utf-8?B?OWowdXVqMDdMY1pKUHhpYitTQmJITkY0VmRrcEFjSmgzSGYya2gwNmlIbmVi?=
 =?utf-8?B?WHArMjV2bHptcmp2bWFvMWs3MHRjM05ZQ3lzKzRjN1FldnVQekJFTVZ6U0da?=
 =?utf-8?B?T2pSUFlsMmtTT3RET3VpbHpJY3F5NzlKZkFzcWd5WHFXaVQwdXhxRVFwMkhO?=
 =?utf-8?B?dlJzTS9CZ0sweTBTYml4TUhxQnN4OW5vc2Fqdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y2pQS1NEY3BIMmJkWVNXTjFhalpxUWlSOS9zUlpLaStJRldWSTVtMit3TmR1?=
 =?utf-8?B?dkUrZnVoVnI3VDNXR1NJNEhxZ0VOYWRtTU9XM05BZ01YNDR2NVlJNHZOVTFa?=
 =?utf-8?B?V0VOd0xXWXNVRUpnYlZrWGU4Vk8vSDQzZnl5TW1ERTBRK2NySnZFQ1JVczhZ?=
 =?utf-8?B?RitqaFRMVlBObVBicnN6QlFEL3ZYN1hYdmViWk9rcUJJcU8vMjYyOHZWSSty?=
 =?utf-8?B?c01YM0RWVm9DVG5raGg4YzY4blc1dlByZ1J0QXRwUHN4aCsrTDlQeXduSmd3?=
 =?utf-8?B?T2lBMHgxdWVZc0pKWUJON2drdC9DQjBTZnNuQVBCN05ycEhzMXlBMnJzOWM3?=
 =?utf-8?B?RXN1dmZUdUxVV0c3TmZVUCtLcEE4Z3RZeEV0cWJPVFFIYmhwQnFsd0FDTWNM?=
 =?utf-8?B?cFpCRDJCeUZHQk8zOTBQcWZsTjJZV3NyTmliMlE2aEE1dFdYRTRDNjE3OWNh?=
 =?utf-8?B?bGdwaldBTC8zZWM0VE9wK1BVUTZuZkI0Z3BkU1laUjlLVnQwRytva2M1ME5E?=
 =?utf-8?B?WGpDbFV6L0tDSjYvSzdNc1lEa25LQjAwMFV5eHh6NERmWCtSM1A5Z21ZbHYw?=
 =?utf-8?B?ZFpZcGhRb2MxU0tnWHdwZGNUcEE2LzlWS1hpYndjOFlUcytubEprK0hyZ1BJ?=
 =?utf-8?B?Z3UyUVBIUmpkK0NVNm5Vb1ZyT1AyODFkOGZ2Ukp5bnFTa21sMTZpMVJERmVB?=
 =?utf-8?B?blNWTkU0SmZaRnp2bjlFcCs2SXc3bk1UNmVYMHpwNXd4ZTUvLzYrVFF4cjF1?=
 =?utf-8?B?WEc2c0JIOFJlWnBWZlpZTGFpTFJTMGFpclI3YjVtd3VxeEpJRCswWit1SDNO?=
 =?utf-8?B?cE9SMDduSlJzNFRVQjJsUmNZWnVockUxSHdvUEJ6K0JOS29DOVNDdEVwTkJ6?=
 =?utf-8?B?SllsU1cza3o5c3o1WDRRZkFOR2ZOcTdmNkRhSnlHUGlNeEgvQ3NFbFRlamgw?=
 =?utf-8?B?RTFUam00czJ3emhub0VqNWd2TjBYMFBDaUFyaE9USEpWT2x1ZW96ZjV3WjUw?=
 =?utf-8?B?eXVKQ2Z6ZkNJRDZDakZpMFBMNFB3R1dyaGowL3pLVXl4bFpWcjN2WGJLRTJN?=
 =?utf-8?B?VmtMdS9HNzE4TVJkd3hIeFMrbk0yMU5YUmtKSUNvU3hsZ2RqUXBYSlBaTStv?=
 =?utf-8?B?Q3Z5SjdxUHhRMWtUM21jVzRMYm9rcDdaS09hVDdzVTVpcHV4WnNPdGNIbXI0?=
 =?utf-8?B?dDJmZEFxVldUa3Z6SVorc0pnSHhwUUFLQ2lmNTVtOUYvKzVkYWUrL1ZHUzg0?=
 =?utf-8?B?NGtsbDdkN2M1QklQekxCd0g4dms1VENjNGJWdEE1U3M2c2ljeVhiTjY3aUxZ?=
 =?utf-8?B?akY4VW0yVFBwaEhYbnNTdFhUM2EwemwySVRiTmRqbFh0UGJMem9ndjFlNU12?=
 =?utf-8?B?ZDlmdFBiSDY1T2xlZWV1d1BNMnJyVCsxdFJISTVKMkNadG1ZdXdTa01OYmhD?=
 =?utf-8?B?N1R3TXdaQ2FkN0VGMnFNMk9wRmhSOUFNV05lRWNLdU0zeGhzWTZuMmM0cENt?=
 =?utf-8?B?b28vWUVpQ0YwcXBKWXdYQkxDcGZBV1RLdE5WVUdVQ0NMQ3B5czlhbWVYbVQy?=
 =?utf-8?B?WXhqakwrTSsyRnpxUWkxeEpVRUZDclZmdnMrL2xQa3FhQldQNkpMN3p0TVhi?=
 =?utf-8?B?ZzV5RjFMcWw1aGN2cEs1Rk1oWENXVldIaUhwY2pHYWM3MjduZWl1TTZMbG1C?=
 =?utf-8?B?UnpFSjZhQ2JidDFuTXBGQ3FRYkw5QXI3a1h6NE1Wb3pETTFqbTBvZlFWeUJ4?=
 =?utf-8?B?YlJrbXAzRi9ObEtGUkhtUW5ySzBkV3o3eXNreHlHVWJjcm5KWEpYeklPbjdF?=
 =?utf-8?B?WFk4VzNyYVF2dGJaclZ5MTNNTERJSDhFcUN0dGxaMVlWSGs3ckVIN1Y0QnFS?=
 =?utf-8?B?ZTl5ZWE2S1BNY3NkY2JReEZnQjhQR0plcWJvQ2ZsZUV5WWRYdE5HSFlMbVcw?=
 =?utf-8?B?dlM0OS9TeUtzN3ZYTjRpTVpNM1h6YkcyUmlwT1ptbkp1b0hsRFVYQkErNStk?=
 =?utf-8?B?ckNLS1cwS0pBWWdNR1ROcWJXMlYrTUpIY0V3OENwYzY2bVA0cmRqbU05ZFZt?=
 =?utf-8?B?ZnJCV1lXbHFQbDFKL0dGZmd1d0ROMmluVndGQjNXdXVHZW9oQnZvRElZMVg5?=
 =?utf-8?B?K09TRUcxbW03bzU2UlZTV0MrUi9ZWm5rbWdGcXFSOHIxWGhNUk5aS0czRXcr?=
 =?utf-8?B?d1QyK0hGWTJqM1dRSGVKaXFOY04yMEpUVkFiTkt4eENpU2p5V01mdlAzMjB6?=
 =?utf-8?B?RlJwYjd4SGRHMStJc3BIckx1TDU1enBrckhnZWZyUU9WWDJCcXkvaW1XUVMw?=
 =?utf-8?B?S3FFL0FSSFAraHNadE95OGFHNDFMdzNoOEJSM1JWT3dITnIwVThGZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC9AE1F33491D442950BA29EBD515228@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e67895d-6754-4d65-28b1-08de4c2317b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 06:24:33.7723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oa6eXM2naSAs+7Sa6rhWlYxZuBpd9BOyW0sgWfhDhcB1854t4sN7XRDtYRMoVMfXkTt5NNedZd1ZGSZ4Zgl0Q0FQ4Wb6iWekkjRoRPOEQ78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
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

T24gMTgvMTIvMjUgNjo1NiBwbSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IElmIHRoZXJl
IGlzIGEgcGxhbmUgc3RhdGUgdG8gZGVzdHJveSB3aGVuIGRvaW5nIGEgcGxhbmUgcmVzZXQsIGRl
c3Ryb3kNCj4gaXQgdXNpbmcgdGhlIGF0bWVsX2hsY2RjX3BsYW5lX2Rlc3Ryb3lfc3RhdGUoKSBm
dW5jdGlvbi4gU28gd2UgY2FsbA0KPiBfX2RybV9hdG9taWNfaGVscGVyX3BsYW5lX2Rlc3Ryb3lf
c3RhdGUoKSBhbmQgYXZvaWQgY29kZSBkdXBsaWNhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0BtaWNyb2NoaXAuY29tPg0KDQpS
ZXZpZXdlZC1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2No
aXAuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9o
bGNkY19wbGFuZS5jIHwgNTIgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jDQo+IGluZGV4IGMx
ZjNhYWFlMjlmYjlmNmI5NDdmODFlMmZiNGU3YTYxZTEwYWM1ZDkuLjgxZGM3MzAzNjIzMjJhNGJh
ZTliNDhkY2E5N2IwNmJhYTFlMzMxZTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
dG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
dG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jDQo+IEBAIC0xMTU1LDMyICsxMTU1LDYgQEAg
c3RhdGljIGludCBhdG1lbF9obGNkY19wbGFuZV9hbGxvY19kc2NycyhzdHJ1Y3QgZHJtX3BsYW5l
ICpwLA0KPiAgIAlyZXR1cm4gLUVOT01FTTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCBh
dG1lbF9obGNkY19wbGFuZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwKQ0KPiAtew0KPiAtCXN0
cnVjdCBhdG1lbF9obGNkY19wbGFuZV9zdGF0ZSAqc3RhdGU7DQo+IC0NCj4gLQlpZiAocC0+c3Rh
dGUpIHsNCj4gLQkJc3RhdGUgPSBkcm1fcGxhbmVfc3RhdGVfdG9fYXRtZWxfaGxjZGNfcGxhbmVf
c3RhdGUocC0+c3RhdGUpOw0KPiAtDQo+IC0JCWlmIChzdGF0ZS0+YmFzZS5mYikNCj4gLQkJCWRy
bV9mcmFtZWJ1ZmZlcl9wdXQoc3RhdGUtPmJhc2UuZmIpOw0KPiAtDQo+IC0JCWtmcmVlKHN0YXRl
KTsNCj4gLQkJcC0+c3RhdGUgPSBOVUxMOw0KPiAtCX0NCj4gLQ0KPiAtCXN0YXRlID0ga3phbGxv
YyhzaXplb2YoKnN0YXRlKSwgR0ZQX0tFUk5FTCk7DQo+IC0JaWYgKHN0YXRlKSB7DQo+IC0JCWlm
IChhdG1lbF9obGNkY19wbGFuZV9hbGxvY19kc2NycyhwLCBzdGF0ZSkpIHsNCj4gLQkJCWtmcmVl
KHN0YXRlKTsNCj4gLQkJCWRybV9lcnIocC0+ZGV2LA0KPiAtCQkJCSJGYWlsZWQgdG8gYWxsb2Nh
dGUgaW5pdGlhbCBwbGFuZSBzdGF0ZVxuIik7DQo+IC0JCQlyZXR1cm47DQo+IC0JCX0NCj4gLQkJ
X19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwLCAmc3RhdGUtPmJhc2UpOw0KPiAtCX0N
Cj4gLX0NCj4gLQ0KPiAgIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICoNCj4gICBhdG1l
bF9obGNkY19wbGFuZV9hdG9taWNfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnAp
DQo+ICAgew0KPiBAQCAtMTIyMiw2ICsxMTk2LDMyIEBAIHN0YXRpYyB2b2lkIGF0bWVsX2hsY2Rj
X3BsYW5lX2F0b21pY19kZXN0cm95X3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnAsDQo+ICAgCWtm
cmVlKHN0YXRlKTsNCj4gICB9DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCBhdG1lbF9obGNkY19wbGFu
ZV9yZXNldChzdHJ1Y3QgZHJtX3BsYW5lICpwKQ0KPiArew0KPiArCXN0cnVjdCBhdG1lbF9obGNk
Y19wbGFuZV9zdGF0ZSAqc3RhdGU7DQo+ICsJc3RydWN0IGF0bWVsX2hsY2RjX2RjICpkYyA9IHAt
PmRldi0+ZGV2X3ByaXZhdGU7DQo+ICsJc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSA9
IGRybV9wbGFuZV90b19hdG1lbF9obGNkY19wbGFuZShwKTsNCj4gKw0KPiArCWlmIChwLT5zdGF0
ZSkgew0KPiArCQlhdG1lbF9obGNkY19wbGFuZV9hdG9taWNfZGVzdHJveV9zdGF0ZShwLCBwLT5z
dGF0ZSk7DQo+ICsJCXAtPnN0YXRlID0gTlVMTDsNCj4gKwl9DQo+ICsNCj4gKwlzdGF0ZSA9IGt6
YWxsb2Moc2l6ZW9mKCpzdGF0ZSksIEdGUF9LRVJORUwpOw0KPiArCWlmIChzdGF0ZSkgew0KPiAr
CQlpZiAoYXRtZWxfaGxjZGNfcGxhbmVfYWxsb2NfZHNjcnMocCwgc3RhdGUpKSB7DQo+ICsJCQlr
ZnJlZShzdGF0ZSk7DQo+ICsJCQlkcm1fZXJyKHAtPmRldiwNCj4gKwkJCQkiRmFpbGVkIHRvIGFs
bG9jYXRlIGluaXRpYWwgcGxhbmUgc3RhdGVcbiIpOw0KPiArCQkJcmV0dXJuOw0KPiArCQl9DQo+
ICsJCV9fZHJtX2F0b21pY19oZWxwZXJfcGxhbmVfcmVzZXQocCwgJnN0YXRlLT5iYXNlKTsNCj4g
Kwl9DQo+ICsNCj4gKwlpZiAocGxhbmUtPmxheWVyLmRlc2MtPmxheW91dC5jc2MpDQo+ICsJCWRj
LT5kZXNjLT5vcHMtPmxjZGNfY3NjX2luaXQocGxhbmUsIHBsYW5lLT5sYXllci5kZXNjKTsNCj4g
K30NCj4gKw0KPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzIGxheWVyX3Bs
YW5lX2Z1bmNzID0gew0KPiAgIAkudXBkYXRlX3BsYW5lID0gZHJtX2F0b21pY19oZWxwZXJfdXBk
YXRlX3BsYW5lLA0KPiAgIAkuZGlzYWJsZV9wbGFuZSA9IGRybV9hdG9taWNfaGVscGVyX2Rpc2Fi
bGVfcGxhbmUsDQo+IA0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4N
Cg0K
