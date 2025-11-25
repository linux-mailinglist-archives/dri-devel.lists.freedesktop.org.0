Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4014DC8574B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 15:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2916C10E417;
	Tue, 25 Nov 2025 14:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="LkS+MGQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012045.outbound.protection.outlook.com
 [40.93.195.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA4BE10E416;
 Tue, 25 Nov 2025 14:40:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/OHW75ZCh7XJPOOKrV1qC3lyqDPLCqLDzMsjRnWWXYCGEF0StVED2ZAkldcj1iVqK2wpRjXmZ5MwjBcznu3F75yodaPbTwznAloK0O1veybqrVtFuxEy+xGAhpEa+imYzk9cLk/FUhkoB2IGlWRuGK6yiLQxCCqDEUi1eWBW4KwHtTmQKx6ZZYOhPQbru0laLUV2PqQRqJCsiuUutcvMfcxdbZnLV3qvk//krqNd4+elyDukFbS+btoWClLStH/PTwoX7c09cXS6+kqeMeYnV6WlfbvhcueTgyYUt4CwYQ69uIG29EZvLyJqzSNcIoHv2iVwQVS9WOKKhzcvt+G1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGw0YM9hM/jLJXsJD1UaOhjehWwIFFjSTD+900g9YGc=;
 b=CPJaqTyIs/rntktAXpUgaGsAl/4jIrjKrc72pjwN71nMB86obUdRmrCaT54DYE9uyIl86HQyKP1IBrdc9D65NG9ftgv2OtH8k/cZyPwqVqu8XI9wE1B1OyL7bLGUgicV5lk6ZLlX8BFGcG9ycX/Zta5N3jgWBrIdJ8V8KDoSObyEuQsYX8uo5VBdAlXwFeK+jg4xk98WFRFvd1Xi7AH/os0J9eUMGbog6ITiZ1r7tvjWnYrtS2D1jZNWrrL3mKaJqJ/Pe6OLRA0nC+ykOyEpK1S/pQSraJs8AsC72Zg1cRlHq+Hzg8+1+NwE4nfwQde9QxtauOHUiC+otcJYQ14vOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGw0YM9hM/jLJXsJD1UaOhjehWwIFFjSTD+900g9YGc=;
 b=LkS+MGQG9jgtF4/ZLbvhfhiBOcRjoI2k14irtjWfRH2Ixz97VlCOoEnneVPZw/6eAUzsJaMyFbeLlpej/ijSZu74K1oN/u6F4TeQX6m0kggk+VB1jqZf5wWFICtkCrf/2dRCidlAAkdglenJVfiZsnBx0tV5aJ2V3/7DnI0IVvM8DV7p0+kmLlhSsDv4vIn8jT59y3GIdNEquh9nob9GR5YeetetPD0NtPJQPnQPpOZibqkmRAIS1vtxTclvGVdpeZe7mjw93uyZFw06/1lVpyIFORgtVRaaK5JpSBesfSBlIVlq0BeM3TJd8SdN9l+Py6fy2dSHIAxrKhj6OMC6eg==
Received: from IA0PR11MB7257.namprd11.prod.outlook.com (2603:10b6:208:43e::21)
 by CH3PR11MB7371.namprd11.prod.outlook.com (2603:10b6:610:151::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 14:39:58 +0000
Received: from IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3]) by IA0PR11MB7257.namprd11.prod.outlook.com
 ([fe80::a3f:c748:c7a6:d2e3%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:39:58 +0000
From: <Ludovic.Desroches@microchip.com>
To: <tzimmermann@suse.de>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <geert@linux-m68k.org>, <tomi.valkeinen@ideasonboard.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-samsung-soc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <virtualization@lists.linux.dev>,
 <spice-devel@lists.freedesktop.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Thread-Topic: [PATCH v6 03/25] drm/gem-dma: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Thread-Index: AQHcEnS8fucA3LjqjkuGZw8r9BxHgrUEDdaA
Date: Tue, 25 Nov 2025 14:39:58 +0000
Message-ID: <52600bf4-2c1c-49a6-82c5-b31818141a43@microchip.com>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-4-tzimmermann@suse.de>
In-Reply-To: <20250821081918.79786-4-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7257:EE_|CH3PR11MB7371:EE_
x-ms-office365-filtering-correlation-id: 48f997f5-7c45-4fcd-f08e-08de2c3081ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SXYvRG9uMmpBZ3BpWjNaYXpldmhPZWpQZEhUVTlURjg2MytCdEpnNkwxTGZv?=
 =?utf-8?B?NXora3J6QjBEOENqbzFrZ2RkQzRMbTNjV3dlYjg0cU1uSDgvZnhoOUUvbnVI?=
 =?utf-8?B?bVhJRHdWbXZ6STc4T3oxOHNiREw2OFJNRnEvREpPVEFNOW9BZ1dMRlE4aHRP?=
 =?utf-8?B?RHROQW5kWElZMWg5enF3aEhsK09odG9oZTN2Y01vaFVRUDc0MlRKaWpjL1ZH?=
 =?utf-8?B?Q2MxdVFRaEI4Yk5LRmxVMlgzSjJPNytaUmI0UGVuMy8yeHpvcWpYdDdLL0VI?=
 =?utf-8?B?aGl4K0hVZXBwNy8vM1lkWENXSmVzVGZTalVLWmJmMlhVUlRUd1o1YmZqMG1z?=
 =?utf-8?B?cnVadCsxd2RyWllWL2R1QWVBODhIVWtvalEzSHA4VDl0NnFZb2pKeFJhRlpX?=
 =?utf-8?B?c0pCOE1EcUpQdnp5eWtmS1IzRXRJZnRreFlncWtjZG13eHdvRHhHZGNCbGR1?=
 =?utf-8?B?S2FHWVpEQ3VKcXV1WDJxWHdOM09ibk13YVJYN2w1OTZYUzBuY0RNNlFMMWxZ?=
 =?utf-8?B?UXVKTGJGWWpld0d5cHpJQ0tRRlNyS0tzaUo3ODlTVVNnS256eTFCZUJOSytZ?=
 =?utf-8?B?eDVKbEZCRnQ3NGRIT2UwSUFSNDZXN0JGQjZWYkhXR2RCQ2UwOEo5dHJFc3VN?=
 =?utf-8?B?d3lvMXl0NW11M1VxTmxmMy9GeVl6Y1Z2NEt1c2txZXMrSms5bGdwM0hVa3Bw?=
 =?utf-8?B?NEZLbGNrVjBqV1hNZmRXN2NTRXVWc0l5WGk1RVN1Z0laNTFmTXlTT1NQZDh1?=
 =?utf-8?B?UW5GL2t5T2g3UnBORk1KUkUwSnh1Mk9wZmdaZi9Uc2NFRlVjdzVSQmlaeGRG?=
 =?utf-8?B?OWNLaEk2QzE5aDN1bUU3Ry9RdmtHUVNlQW9wRGgxN2FFd2JPa04rZ2x0bzRB?=
 =?utf-8?B?QjFabTZYZ0F2QmIzSUNaZjR3TmJnWFFkaE11cXZBNHFUeWtKZjVlZDFDRGN5?=
 =?utf-8?B?L09wRVA5NjJkMUE0Tkl5M2N1YUxuTmp5MDJnWlNLM3YxY1Z4YThaV3pldGk0?=
 =?utf-8?B?dUlkaWd5Z2V5di9jemxEOTV4dEFxVEpad3N6U2t5RUlTR281L2tZVkVobTJN?=
 =?utf-8?B?RWNqdGcvbzFaNVk5STF3TkxuWStKVDNISFVHTzZSN1R1Rzg0TnZseThpamg5?=
 =?utf-8?B?cW9KQTJRdjJzZE5EMVBTbDJjQVovMXdvQmt2RENnbkpUWnB4QWo1M3dncHJ4?=
 =?utf-8?B?SHc4aUlFQzh2RUZtWWhjWEdHMy9PbVVpK0lXam1PaFdwdERBY0hmVXdLOGE2?=
 =?utf-8?B?U3pYY0VQV3ViaExhUHhpaTlCaGtwbmxyMXVoRE50RVF4Ykg4eDh4UTl3NGpT?=
 =?utf-8?B?Zkh3THpWTjJvbGY2dTVUUDdkdDBWVGNlU1VUUUlqUnA0NURyQldOODBCRVJD?=
 =?utf-8?B?b29ya1QvK1JvNGtmbFU0aytnK1BBSExneUxTdDVPQlFrS00xeUJtcExOOGxq?=
 =?utf-8?B?c2FOTU1LSG9VcFlNQm9RQTJTSmUzWU1TTittcmg2bEozNGVXWmhuVHkzMSt6?=
 =?utf-8?B?bUlRSWQ0Kzk3bnlMUS8zMkhFb1ZiSDBwZWdKcHp1MVZ3ZmF3ZGs3cDF2OEFS?=
 =?utf-8?B?cVcvZW1jVm5qYmNqZmZVWTJBcy9jMWh6ZXA1cDQ0a1ZhcUx5a3h3azJvZy9o?=
 =?utf-8?B?KzdzZmhGdE9UVEVlTDhXYy9WQjVydG5oSEkyZTJ6WFo4dC9ZbU1EZXBKam8w?=
 =?utf-8?B?YzAyNjZZdU92U1p0YmRKekxJUEt0OEdKV0JieEFJY1YxQzR0NVdmRnBDKy9O?=
 =?utf-8?B?cHZWNWcxL3pydGtUM1JQWFVYb0pxdFFpb1lRR0xRVThTbWlCVXNnRThSY1dp?=
 =?utf-8?B?MlhVYVdFM0U4LzVBTXBlZkUrRitQQjNnbm5wNnQ1cnN0T3JMWFFBSDZUand1?=
 =?utf-8?B?bDBNaG5GMlhRNy92WHJXeFRNVitDUDZnTnJ3RGhaZ0MxMDl0OFRLcjRYRk5h?=
 =?utf-8?B?VUo2L0k1dU45U0xtaURKQWtyc1RVWTRGNUZmaFdXc3hhYUY0bnpwS2V1a2VM?=
 =?utf-8?B?RHl0ZmpjQ09OV0JqcHQ1WGFJcTZRdFRVTEdaUmVRcGtNRThEeUVrcitaRFRm?=
 =?utf-8?Q?NuV5sa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjkxdStDOTZzZkxtZDRGRzNTcnZBNXdRcTJ1SHRLYVp1R3dyUEpZU1JFZnFZ?=
 =?utf-8?B?RVFDckFwUk5wZnBuZUg3MFlhY283TWlmencyMjZZYTFtMjZwdmsvdWR3cEp6?=
 =?utf-8?B?dHhLbzYva0p4bngwLytlTHo1bmRkOHdoek1QeEg3aTYyOUdWdkJhTFNWSDVx?=
 =?utf-8?B?QWxCMUNYeEhCcFd0NmdmRzFWK1cvSjdvdVo1aWp0ci8rK2hHd0pYbVFLaW1x?=
 =?utf-8?B?TVM0NHJHMVlyUjM3VlJJQnBlcGxRSjhsYWhaOHRML09KYkgzWnFHajBCSWhR?=
 =?utf-8?B?ekluUmZmQnVPVjBzejFZSW1UaS9WRFNMdDRkeUN0VkVFU0t3K1NISHlZTzg3?=
 =?utf-8?B?aWVZblVNaXc2U0hPNTJsQkJYVUJaTktrR0MveWsrZURTOGRudGMrc2dnT2VT?=
 =?utf-8?B?b0hHa2VXbWxJWmFWb2pxQkxwQWN4blJnNkVDQlYzejlXVTdSMlQxY1l5THgy?=
 =?utf-8?B?WjVpTmFhcVMwV1h3d2cycHlaaFJxaUZBYlgrMjNJUytoRDZTUWFmMzFwQkdQ?=
 =?utf-8?B?V0hhN3pQam04OHErTmRLbUZwUUM3NWVWZWU0OExLTzdJcFVCdFU5ci9vamdn?=
 =?utf-8?B?elA3ZmhlM2hpNVY1MlI1NGpDYUhtakMwRzdXa3h0MHlWUjgzMm5uNmh5Ly9r?=
 =?utf-8?B?dE51WXozNGJQSlFhcEJpK2VFdVl6Y0kxd1I1ODMwQS91Q25JTGVpQ1g5bFVZ?=
 =?utf-8?B?RlVCbkFKSks5S0ZZdVZQd0d0OVNSUlV2bitEdzIzR21kUzI4T1FUcHhwcndF?=
 =?utf-8?B?dThPOG9pbjFpQVdEZ3pOVEphdGVpMitpbXVmNGE2YVJyVVZ1Z2N0bDRXcisy?=
 =?utf-8?B?Mk92QzZHWjFiQU5oODJrVDdTR2FqY0dheGc4QUZsTXBWaEk3dHVVNjJ2aS9Q?=
 =?utf-8?B?M0dRb05sRW5OUERsdlJ1Y25oK0FzOTFSM2RDNEh6MjI0VVdqNEJqY3ZrN3Z1?=
 =?utf-8?B?bXMzY1dYU3ZaVS9LQVFuZUhVMmN6a2k1MTZTSDhjUldRUThPVUtWT0lpMmhP?=
 =?utf-8?B?VzMrdklPRUZaUjJZaDg0U3dNSkg1WUtyc1dXTGdxcUJkZytoR2VTVUx5VnZy?=
 =?utf-8?B?QTJCMWYvNWZ2WDU5VU5rVTYrd01udktLcUg4VGdqV2ZnbkNPVHhQTEFvSXVG?=
 =?utf-8?B?R0x3c2Zvc2xBRjBocFVwYWU0Q0hJcXBOdFZFYTFVeXM1aHlhTDdFb0NxY3g1?=
 =?utf-8?B?Z2cwQ1BiZEtINVRic3EybjRvaHg0Wk9aN0xUSUNBMVQ2SEVvQm44ejVxMjBV?=
 =?utf-8?B?SWY5bzBWSkxmZnZMaXppaFNFWnVsS3BPYys5OHRMbHZXRUJzNGxDbzVCcWU0?=
 =?utf-8?B?OWJmN0xYR0JpU2piNUF3TFhiS0ttWVdTSThXUlJHK0RFVWRZK05FaFVPdUpi?=
 =?utf-8?B?SW1pM2NLZERsaERnVjZ4Wnl2SElwRVVpNHViQUJoUTJGM1V1WlFzK1FzSFhH?=
 =?utf-8?B?ZmhPK1Z0cXNWNHBXRjVHUXdJUTdpcThjYlRJRzVhRjV3S1lQcXZrajB6ZytP?=
 =?utf-8?B?VFhFMElOZC9KWjZxYXRuWW12Q0JTU0tSVXFCOWt0OXBmN2RXZW9CVUxRTlNr?=
 =?utf-8?B?TUwwa2Fpd0RZQnJySW5rRU01RWcwQSt6YTdaNU9vczl5NXJxdlI5TDAxaE9E?=
 =?utf-8?B?UDdUa241MnlKSW9GR2MrYzBhWnB5SzU3N2hCNU45amlVek00UVVuSEhYRmVo?=
 =?utf-8?B?bEtFRzJYN3BqZ3MvYktxSzRuRzZwNDg0MFlLWkNiN0NaM0t4RHlCRmdTOFZC?=
 =?utf-8?B?Wk11aDl3Y0xLWmFFUFBLa0REZ2wwWVIraTNWeXRkVWlYZUE2azMrQ0NvblJu?=
 =?utf-8?B?RHI2N20zTm05MXFIVDJBM2pCSHB1OWFCSWNFK1hsUzVscC9kWmFEMmdqSUhn?=
 =?utf-8?B?RjlFdUJwTW1CM2tBVHcwZGFEWG9TcTc5ci9RM05LOGxlcE42elFnZStaRG9r?=
 =?utf-8?B?eE8rVjNFVmcwM2xWNnRIZlcvZGtJSHpteEVFZDRuaUlram4vRGVKSG43M1VT?=
 =?utf-8?B?UnhhYVg5TnB3ZjBnc1ZiKytTeGNZNmcvbE5jb0wxWnlMT3N6aDI2amFELytC?=
 =?utf-8?B?L21mNXc3aHJMRExYeGJ5U2RjOGQrWlptZzREcGVaVStnQ2tmYjd2Wlgwbldo?=
 =?utf-8?B?UzJ5RFNUTFZGTzJoKytHTEVqNndUYTUwZUJNSWhTaVdUdGwxRWR5RThwWXhr?=
 =?utf-8?B?Zmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1225C8DB122F84E996CE2ADFFD3FB82@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f997f5-7c45-4fcd-f08e-08de2c3081ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 14:39:58.2539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cx2s+SPf/j2msCeUM9cu467XqGi68+SNY6IAHv6ABVWEV+NggxwGmiqvHv3jlZWBTS+DdctCGtaXQHkmGIa/gOsRzhqXFe3+7P6wJ+LpUOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7371
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

T24gOC8yMS8yNSAxMDoxNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+IENhbGwgZHJtX21v
ZGVfc2l6ZV9kdW1iKCkgdG8gY29tcHV0ZSBkdW1iLWJ1ZmZlciBzY2FubGluZSBwaXRjaCBhbmQN
Cj4gYnVmZmVyIHNpemUuIEFsaWduIHRoZSBwaXRjaCB0byBhIG11bHRpcGxlIG9mIDguDQo+IA0K
PiBQdXNoIHRoZSBjdXJyZW50IGNhbGN1bGF0aW9uIGludG8gdGhlIG9ubHkgZGlyZWN0IGNhbGxl
ciBpbXguIElteCdzDQo+IGhhcmR3YXJlIHJlcXVpcmVzIHRoZSBmcmFtZWJ1ZmZlciB3aWR0aCB0
byBiZSBhbGlnbmVkIHRvIDguIFRoZQ0KPiBkcml2ZXIncyBjdXJyZW50IGFwcHJvYWNoIGlzIGFj
dHVhbGx5IGluY29ycmVjdCwgYXMgaXQgb25seSBndWFyYW50ZWVzDQo+IHRoaXMgaW1wbGljaXRs
eSBhbmQgcmVxdWlyZXMgYnBwIHRvIGJlIGEgbXVsdGlwbGUgb2YgOCBhbHJlYWR5LiBBDQo+IGxh
dGVyIGNvbW1pdCB3aWxsIGZpeCB0aGlzIHByb2JsZW0gYnkgYWxpZ25pbmcgdGhlIHNjYW5saW5l
IHBpdGNoDQo+IHN1Y2ggdGhhdCBhbiBhbGlnbmVkIHdpZHRoIHN0aWxsIGZpdHMgaW50byBlYWNo
IHNjYW5saW5lJ3MgbWVtb3J5Lg0KPiANCj4gQSBudW1iZXIgb2Ygb3RoZXIgZHJpdmVycyBhcmUg
YnVpbGQgb24gdG9wIG9mIGdlbS1kbWEgaGVscGVycyBhbmQNCj4gaW1wbGVtZW50IHRoZWlyIG93
biBkdW1iLWJ1ZmZlciBhbGxvY2F0aW9uLiBUaGVzZSBkcml2ZXJzIGludm9rZQ0KPiBkcm1fZ2Vt
X2RtYV9kdW1iX2NyZWF0ZV9pbnRlcm5hbCgpLCB3aGljaCBpcyBub3QgYWZmZWN0ZWQgYnkgdGhp
cw0KPiBjb21taXQuDQo+IA0KPiB2NToNCj4gLSBhdm9pZCByZXNldCBvZiBhcmd1bWVudHMgKFRv
bWkpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4gUmV2aWV3ZWQtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkBp
ZGVhc29uYm9hcmQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9kbWFf
aGVscGVyLmMgICAgIHwgNyArKysrKy0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My9p
bXgtZHJtLWNvcmUuYyB8IDQgKysrLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX2RtYV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2RtYV9oZWxwZXIu
Yw0KPiBpbmRleCA0ZjAzMjBkZjg1OGYuLmFiMWE3MGIxZDZmMSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fZG1hX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX2RtYV9oZWxwZXIuYw0KPiBAQCAtMjAsNiArMjAsNyBAQA0KPiAgICNpbmNsdWRl
IDxkcm0vZHJtLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+DQo+ICAgI2luY2x1
ZGUgPGRybS9kcm1fZHJ2Lmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2RybV9kdW1iX2J1ZmZlcnMuaD4N
Cj4gICAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZG1hX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxk
cm0vZHJtX3ZtYV9tYW5hZ2VyLmg+DQo+ICAgDQo+IEBAIC0zMDQsOSArMzA1LDExIEBAIGludCBk
cm1fZ2VtX2RtYV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdiwNCj4gICAJ
CQkgICAgc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdzKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGRybV9nZW1fZG1hX29iamVjdCAqZG1hX29iajsNCj4gKwlpbnQgcmV0Ow0KPiAgIA0KPiAt
CWFyZ3MtPnBpdGNoID0gRElWX1JPVU5EX1VQKGFyZ3MtPndpZHRoICogYXJncy0+YnBwLCA4KTsN
Cj4gLQlhcmdzLT5zaXplID0gYXJncy0+cGl0Y2ggKiBhcmdzLT5oZWlnaHQ7DQo+ICsJcmV0ID0g
ZHJtX21vZGVfc2l6ZV9kdW1iKGRybSwgYXJncywgU1pfOCwgMCk7DQo+ICsJaWYgKHJldCkNCj4g
KwkJcmV0dXJuIHJldDsNCg0KSGksDQoNCldhcyBpdCBpbnRlbnRpb25hbCBmb3IgdGhpcyBjaGFu
Z2UgdG8gYWx0ZXIgdGhlIHBpdGNoPw0KDQpUaGUgYWxpZ25tZW50IHJlcXVpcmVtZW50IGhhcyBi
ZWVuIHVwZGF0ZWTigJRmcm9tIDgtYml0IGFsaWdubWVudCB0byANCjY0LWJpdCBhbGlnbm1lbnQu
IFNpbmNlIHRoZSBwaXRjaCBpcyBleHByZXNzZWQgaW4gYnl0ZXMsIHdlIHNob3VsZCBwYXNzIA0K
U1pfMSBpbnN0ZWFkIG9mIFNaXzggZm9yIGh3X3BhdGNoX2FsaWduLg0KDQpGb3IgZXhhbXBsZSwg
Zm9yIGFuIDg1MMOXNDgwIGZyYW1lYnVmZmVyIGF0IDE2IGJwcCwgdGhlIHBpdGNoIHNob3VsZCBi
ZSANCjE3MDAgYnl0ZXMuIFdpdGggdGhlIG5ldyBhbGlnbm1lbnQsIHRoZSBwaXRjaCBiZWNvbWVz
IDE3MDQgYnl0ZXMuDQoNClBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3XigJlkIGxpa2UgbWUgdG8g
c3VibWl0IGEgZml4Lg0KDQpSZWdhcmRzLA0KTHVkb3ZpYw0KDQoNCj4gICANCj4gICAJZG1hX29i
aiA9IGRybV9nZW1fZG1hX2NyZWF0ZV93aXRoX2hhbmRsZShmaWxlX3ByaXYsIGRybSwgYXJncy0+
c2l6ZSwNCj4gICAJCQkJCQkgJmFyZ3MtPmhhbmRsZSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaW14L2lwdXYzL2lteC1kcm0tY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9p
cHV2My9pbXgtZHJtLWNvcmUuYw0KPiBpbmRleCBlYzVmZDlhMDFmMWUuLmFmNGEzMDMxMWUxOCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My9pbXgtZHJtLWNvcmUuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzL2lteC1kcm0tY29yZS5jDQo+IEBAIC0x
NDUsOCArMTQ1LDEwIEBAIHN0YXRpYyBpbnQgaW14X2RybV9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGVfcHJpdiwNCj4gICAJaW50IHJldDsNCj4gICANCj4gICAJYXJncy0+d2lkdGgg
PSBBTElHTih3aWR0aCwgOCk7DQo+ICsJYXJncy0+cGl0Y2ggPSBESVZfUk9VTkRfVVAoYXJncy0+
d2lkdGggKiBhcmdzLT5icHAsIDgpOw0KPiArCWFyZ3MtPnNpemUgPSBhcmdzLT5waXRjaCAqIGFy
Z3MtPmhlaWdodDsNCj4gICANCj4gLQlyZXQgPSBkcm1fZ2VtX2RtYV9kdW1iX2NyZWF0ZShmaWxl
X3ByaXYsIGRybSwgYXJncyk7DQo+ICsJcmV0ID0gZHJtX2dlbV9kbWFfZHVtYl9jcmVhdGVfaW50
ZXJuYWwoZmlsZV9wcml2LCBkcm0sIGFyZ3MpOw0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0dXJu
IHJldDsNCj4gICANCg0K
