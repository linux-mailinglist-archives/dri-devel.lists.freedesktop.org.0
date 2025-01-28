Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDFAA20391
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 05:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E567310E147;
	Tue, 28 Jan 2025 04:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="HaQXiJGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E4210E147
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 04:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDqBb/JLtwvbuz4kJPqo0QOZnLZg31U2cVJTgWm5wY2VecENhWPJ9gd36SlSDtzTCvht3W3K4ltfERiljAGTIhkJ7VFzBI4N2xUuvbz1tORz1egTVmT0TByOLrQjGoURsFLqxgPrIOg8Mf1iOo4fDj4yDRP9bPOXFivHbNYZx8iXW446U/A3Hl9HVEgQd7fnV5ELp06OJLQJV96iTo3okpjlq+Fkyg8zLJ+J0L2cTTMFdTko6d68qUjsHHz+mxPY7dbb8rsxzj6VtOi/QSTv+7/EbJx0DXtZn6QpyCNzsWvtIG1HserdvCBqinSH4muJ9stSkVCxg02AJxuITZJ8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy9TtSkwRMJ94tsULD9zZMqW4Zkt/NKq5YYH+81X2s4=;
 b=ue4ND+Ft6ibXN/fniWP5qG0YbgFA7/b3iJLASdpY7EDOIjquLSPJgP54SSDh8YVUuPQ6isaEWRoLOJBjieeUkEY9bciisWoZiBSDzS0v4TNAOEXs/79XxLcRPv3nvu6zHAehq3WRKAJj4G1Ax1YrZBRD0+nfCFc3Zg6H30SOINCED7i1cNRRrMOzA8mtv1z7Aip9IN3iHbDNxOikxV4QP44Ghh8bgJxmHMnKCUMBGOic5gCIbU9YMVd7THV6k5GkAhQxzx+WbDrmhJrTTMORG637O+tHK0fXksynfjdOQ4gQBewKCzDK2hdYUjflRyko+wtWiSx6CcRXPaFPv/XmjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy9TtSkwRMJ94tsULD9zZMqW4Zkt/NKq5YYH+81X2s4=;
 b=HaQXiJGm6ZVfM6tJVy4IRM5BlROMNJHLyUOG/hmyAWanLr033b/p5GdyT5gVUDJgcO2gg+vzRgV+qmkDJAcguu3OIs0b7+bBwThVJs+DOczHzNSpl16PX2Gs1Jq62I13Th4QLZetGLBxS5tORCInOZ5o4bVWjCHdIW7xzILrpiCeu4zjQUv/nOB/KQ6moUD457KDDB/6IoeQzvI05MkI8Awl3L3nd/hM7x3ieaJcaZSYkTCEYkhetKXVO5wWcLEA1Ql26FuHQUElukTAcyIwAUrhpUa0WDa1Sjwn7sCQWt07yJ02TpfTEhoZsD2yjn+yo3uZky72/k42n+qwZFvdhw==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SJ0PR11MB5054.namprd11.prod.outlook.com (2603:10b6:a03:2d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 04:59:31 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 04:59:31 +0000
From: <Manikandan.M@microchip.com>
To: <Nicolas.Ferre@microchip.com>, <sam@ravnborg.org>,
 <bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <Hari.PrasathGE@microchip.com>,
 <Durai.ManickamKR@microchip.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Cyrille.Pitchen@microchip.com>
Subject: Re: [PATCH] drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
Thread-Topic: [PATCH] drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
Thread-Index: AQHbHh59279+5UqHm0OU3/RlZr0vyrKQ4T6AgJtlWYA=
Date: Tue, 28 Jan 2025 04:59:31 +0000
Message-ID: <b98d709f-f6c5-4be0-8fac-000d46dd261c@microchip.com>
References: <20241014094942.325211-1-manikandan.m@microchip.com>
 <7106870f-6452-47b1-9251-ce2a69366fe7@microchip.com>
In-Reply-To: <7106870f-6452-47b1-9251-ce2a69366fe7@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SJ0PR11MB5054:EE_
x-ms-office365-filtering-correlation-id: 0cd83ec9-7516-422c-e3b3-08dd3f588cfb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MmhvYStONW5hYVhDQkl4dmVOZmU1Nmw0TFA5aTJRZG5mL0IrNnBNY2hWS3lu?=
 =?utf-8?B?UFp5UGFCVlZTOFpia3VLYXBlVHpHdXlaRHNReWFpZXhzSDduMHU5MTV1d3dX?=
 =?utf-8?B?QXp2aVlxblRuOXp0dEVmUVBHaytia2hVbjdPVGNxUXNZMlJZODZWazcxUW1R?=
 =?utf-8?B?ejhDc1V6aHh6clVPVnpGZW41WTFlVGhVZkJUaWpWYk5lWGxxblJYSFFxSmx0?=
 =?utf-8?B?VGp1dlFDWWprT2ZnMngzK2I0bmNjQ1ltQVJaUlRrbGVUZWRVSjl6WDZpbFh3?=
 =?utf-8?B?RGk1bHBrNTBlQnp5L3g0NXNkOFdtTFJTV29XMkR5eTFoZ2dmK25aZmhlbGJq?=
 =?utf-8?B?U3ZxTGcrMW50SkY5NkJVZDI5Q21IUVNwcm90SUNXa0U1ZTduVEYvSjJXSHp6?=
 =?utf-8?B?WU1vNUwxRFJjYXlUenBGZWQybFdNKzlXQTNBbUhndnBSS1h3RkhpbFM0Z213?=
 =?utf-8?B?UzFTd1F2YzRkY0xHNUF3c2NzWDg2RE4xZWFOVUQ0ZG82cW42VU9IcC9hSkxy?=
 =?utf-8?B?L1BBbUF1TFRVQklRTXVtaEpoYm1wRWU2RDN1emRuK1R1TnByUFNkVGUwdHRL?=
 =?utf-8?B?RlRZbnZ2T2cxWGswV3VHMmx6aDFiUklYaSsrM1dqUDNxRk1FTG93TGh5NTMw?=
 =?utf-8?B?aHpDK0VlYmRtVVkxR3o3ZmZLZzlTMktkY3h0bmVPMFdyQlptVjNyT3MwblMr?=
 =?utf-8?B?aU4yTlBMSEZtZ1ZmYzYyRkJWUTNKU1lDazFMSzVtNFhUNnE4RFVacTd0UmEr?=
 =?utf-8?B?TXp5TEo2a1JadDFuZWdhdWFmWEx1UTJxMm9GR2xZWTkwNnkxd1hJVUtsYmxO?=
 =?utf-8?B?WTNJOU1rUHgyNmEvS1l6Nmw2WjRlYXBKOEo3bXpTa2QrdnJCY2ZDV2ZKNlo5?=
 =?utf-8?B?UkhFODBPenZ6UzFUc2dORUpKWnJhQWRZUnNXdjZlS2NTcmdsZDVwQzBJQ3o4?=
 =?utf-8?B?SGJ0ajB5SGdSQmNBQTE0WUlMTDFVWkFmSTM3Ymwya0ZNREQrcW5JSTZxTXVl?=
 =?utf-8?B?SW9tc0NTQTFaa09LNDBjUmIrSXZmQkx5OXpBb0FnRVByMDhUWFJrZXJiU1hH?=
 =?utf-8?B?OFlPOHVUeWVEOFBTdmJtYXRzbGxLZURGOXptQ1pKSlBGandMRU56Q21pK05u?=
 =?utf-8?B?Nkd0dGRtOHo4VDcwblpXbURWRytZNkZYRU5VZXJDQjYzTVk5bjBZb0RGZm5v?=
 =?utf-8?B?WTljTU96aGZsMDZpQjlLdWN1TGFWZWx1ckVQR0lFKzlSNWxybHNUclRzUFJo?=
 =?utf-8?B?MTBIa2c1NUgyaEE5bnVxeHRGV2RnZkZPbWRUWTJXR3owUGlESUJPYnlJTDhj?=
 =?utf-8?B?ZGFoN3ZJWXJ3R29ZMjhubXRib0FGeU45RGYrSGlqbHBLanVWYTAreHUyZjdM?=
 =?utf-8?B?aUZjUVBsaExHcUNpaVdqT0N5VTZ1T3FVcDd2VTMyZ0VXUlUwaVZqMHk3UmJO?=
 =?utf-8?B?ajNYeWVldldDMVJUQmZTdGo0WCs4MEs2SnB0M0xiY3N5RnpFYWdCckZ5d3Ew?=
 =?utf-8?B?WlE3ZkJxU0VQa1VFVjVnaDZxQVE0aDA0T0k1WktNeUVScC95Q050Nmx0Y014?=
 =?utf-8?B?ditKbERvd3AxekY0WEYyTEMySXJuclRtWGl4QmFDQk1ZakI1UFBNQmlxYWN3?=
 =?utf-8?B?dGNzaUtVL2pucUNDd25OVDI0YS8rMXIvNlNSaWJlZWc4aVpqcUVMMU1TdmNR?=
 =?utf-8?B?L3ZOTld4MC9zNmQ1Z1dSUHNXemtXUGdhWS94QnQxek5LNXo4ZDFUVUlDcW02?=
 =?utf-8?B?YlZmQThVMUtaY2E4RXlkTWRlcVpRTjhRcStnS0t0VnNlTnltNlJCZ29DZzBw?=
 =?utf-8?B?TGFqV1BhdjJYSm9MdDJsdXVvRmhsT2JlbC8vVjYrUll4UjFkYzV1ZGdyWGNh?=
 =?utf-8?B?UGh2UUNNY0grcXpBc3djUUExaTVoTnNXeW02S2pXU0dsblVYTUtFSStSNnpo?=
 =?utf-8?B?bjR4THRFLzdweWUvK1hxdkkrU0lPbTFkTk1tbnM0ZDI4WUk0WWo1Z01Ka3ND?=
 =?utf-8?B?UEFzVjgwdDl3PT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0lKUnBNUWx5djJIYmd5Wmc2cmM4VXlBblY4UC96aUloL3NvVkJ4Z2d5bUdY?=
 =?utf-8?B?V3Y3dkQwT2RhY0MwMWZDK2VsMTRuMkx4bW5zVWlFS3RVQ2hNd2dlOTcvRlJO?=
 =?utf-8?B?TkNwenpvV1M2V2VLQ25MK001eGJKZGluWlpRNXljLzJVditjUFVIZjY1VTUr?=
 =?utf-8?B?TEhrdC9ZblFUU01qeENMZTI5MmlqTDRqNUVvNTNmbUJUY0lrcWUyOEpkckdJ?=
 =?utf-8?B?b240WmtSaW1WTEtjVThIcGsrc2RRRHRmOFEyMDRQdnlXMTRERUtzR01hdkVl?=
 =?utf-8?B?K0N6ZG10WURDSEVzcTYreTM5aDQzcW1HODN4ZnU3TUxZTTBzOElqelNIcFdS?=
 =?utf-8?B?MExPSjY3NDlUV01hNXp2T0xMRTFqTHNRQmc3UjN0b01KWkxaaGdDb1htYzRp?=
 =?utf-8?B?UHh3ajNJZkdncjY4bEhhWUZ1VGRyenlrZlBWOEJENTV6VWRMUGtnQ04rUmUv?=
 =?utf-8?B?bVZuaGk2ajBFbVEzVjhJUkpiQStka0M2YVRqQU9CQkVQR0VaZ3M3UmJTN0Ew?=
 =?utf-8?B?UFRiT0xDZDFwOGtSWnRxckNONngzeGRVcHplZHluQTRydnAxUXllNU91Z2Np?=
 =?utf-8?B?TE9ha3JyYWw4NFhsaW5tdWFQNzI5QTBXK3U0U3NZOXZCYTNuZmxRT29FYnZ1?=
 =?utf-8?B?S0NHSllMektOUzlQNkVBb2RVWktQMkpwUWhIbVEvTmpLSTliVElzWjZIMFhV?=
 =?utf-8?B?Nm1ZS3pnNnlkTjVxcVp6c3R1RXIrZUsvcC9rY1BxeTRlYmpjWmhUa2ZadW1C?=
 =?utf-8?B?Ymw2SFdza1A5d0tQcmlNWWxRcFl2VzhybEtrandxdkt5WDgrTVZRTWxIM0dU?=
 =?utf-8?B?MkErQ3JMWFpOS0gyeUQ2RDVaaHQ0dlNvdEFFK3ZodzNML3YwTTFUVWVjYmVN?=
 =?utf-8?B?N1Y1UXJEZnZiSHdSOTFTZVphZnVMdVRTZzRuc3pxUGUrdExKdk9zV3N3cFBV?=
 =?utf-8?B?bEY0NW9aekR6VTM1Zko5V0ZzOGVwelpoK2c4aWk5OHFuWDNwOFpYbzFxd3po?=
 =?utf-8?B?R3pNRGNab05xRkp4SlR4NWVuOXRCVGd2SzV4bHhnckdqYnArZGtsRjU0NTBE?=
 =?utf-8?B?OXdHdUhhQmk2Q2ttUVIwd2gxSEZMQWZibnptRVBwR0lJdlpvenNHVko2YUI4?=
 =?utf-8?B?T0dCcXdwcWVpU2tsa3Uzekx1QTNDbEljZ05CTG54UVYxK3BWSFVaSTNVd2lD?=
 =?utf-8?B?anZTQ0dIMXBWQ3VMYWFyaEFKdGVWWGx1T0hIZ1lwS2dQRkN6MmRRRE5SaEYr?=
 =?utf-8?B?UnNLSmZDZkF2bUdpaTJ4Q2Fpb0FtZ01iYURDOUNkMXVNek4yU0w4ejQ3bSsw?=
 =?utf-8?B?emtwN2hFSkV5VU5yeC8zOWtLTHNpTWtmWSs1VUhJTkRuU3BZM2gwdkF1M0ww?=
 =?utf-8?B?dlIyRjhGTXpNYzE0Q2hjNU9rYzBkcHBXVVJzME1pTHExU2tFWi81Y2ZBdm1x?=
 =?utf-8?B?dVpEQjZ0YnlHREw1N1lMWXhkeWpzaHhwazVyWE44REtmSkVVMkdBa0xmR1Nx?=
 =?utf-8?B?TXFiTFZWazg3QzRidHA2Ukx6bi8wcHpjOW9GbHhTSVVYRlE5RlpGK2pGa2Z2?=
 =?utf-8?B?UVNzTUZHd251TEMzWGVQdVFKUnFSSzdXV0hDYkNZUTUyUnNnSGtxdm9TR3o3?=
 =?utf-8?B?cGZVQzFpelVSQlh1dDJJa3Y5NTRFWFF1N0Zvdk9ydHEyYWI1UTNLR3Y5Qkhs?=
 =?utf-8?B?L25qMlNVMnZQN2FGaFl5MjhWc1dpR21zMXVBZGJaNlBqU3pJa1ZuUzdyN0NG?=
 =?utf-8?B?bmxGa0NUUHQyOFNuY3pYV3JyZm9tdnZBL1lweURSQXp4Z0hja1FubG5oc1NJ?=
 =?utf-8?B?TFhrWGZoOUNaYWFuTTAzYk9zSEJaRndTczM3OHNVejZ4OEYvQ01zNzhKZUVS?=
 =?utf-8?B?bmVhZEN3N3lPKzg0cEQ5U2hEa08vV0xoeitmZkgzNXpZZWprYTBPZm5xeEtk?=
 =?utf-8?B?a3RoR3ZQc3pubEdWNURGWDJEbURwdW50U0N3MmJ0S08wY0FMNVZweU4yRXdN?=
 =?utf-8?B?M1pucmZiRnVza0Zvb09Id1p6Z3M2d2taamZTRlZuVk15NXo4Yk9oVW15LzU5?=
 =?utf-8?B?clFQOGl0N0I0RmgySkM2dFVvdFN1Zkgwc1JlU0duWXNlaEJRWmxrQld4c2Q1?=
 =?utf-8?Q?5/ZuUdSEgdJ8+BPGF8Voxc+gS?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A11DE22D96B3D458070950D02624BFE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd83ec9-7516-422c-e3b3-08dd3f588cfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2025 04:59:31.1435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uPvObR7xLFeloK3Ug3QKdxL9U6ZLbbu6Bg/FFSCNec3qBGshs5Az7e5/JgDhM0c8XZTOcAv71HAX0oR8LW01qaFb3YoSOvAemP044xSJRrM=
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

SGksDQoNCkEgZ2VudGxlIHJlbWluZGVyIHRvIG1lcmdlIHRoaXMgcGF0Y2guDQoNCk9uIDIxLzEw
LzI0IDE6MjYgcG0sIE5pY29sYXMgRmVycmUgd3JvdGU6DQo+IE9uIDE0LzEwLzIwMjQgYXQgMTE6
NDksIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0KPj4gRnJvbTogQ3lyaWxsZSBQaXRj
aGVuIDxjeXJpbGxlLnBpdGNoZW5AbWljcm9jaGlwLmNvbT4NCj4+DQo+PiBPbiBTb0NzLCBsaWtl
IHRoZSBTQU05WDc1LCB3aGljaCBlbWJlZCB0aGUgWExDREMgaXAsIHRoZSByZWdpc3RlcnMgdGhh
dA0KPj4gY29uZmlndXJlIHRoZSB1bmlmaWVkIHNjYWxpbmcgZW5naW5lIHdlcmUgbm90IGZpbGxl
ZCB3aXRoIHByb3BlciB2YWx1ZXMuDQo+Pg0KPj4gSW5kZWVkLCBmb3IgWUNiQ3IgZm9ybWF0cywg
dGhlIFZYU0NGQUNUIGJpdGZpZWxkIG9mIHRoZSBIRU9DRkcyNQ0KPj4gcmVnaXN0ZXIgYW5kIHRo
ZSBIWFNDRkFDVCBiaXRmaWVsZCBvZiB0aGUgSEVPQ0ZHMjcgcmVnaXN0ZXIgd2VyZQ0KPj4gaW5j
b3JyZWN0Lg0KPj4NCj4+IEZvciA0OjI6MCBmb3JtYXRzLCBib3RoIHZlcnRpY2FsIGFuZCBob3Jp
em9udGFsIGZhY3RvcnMgZm9yDQo+PiBjaHJvbWEgY2hhbmVscyBzaG91bGQgYmUgZGl2aWRlZCBi
eSAyIGZyb20gdGhlIGZhY3RvcnMgZm9yIHRoZSBsdW1hDQo+PiBjaGFubmVsLiBIZW5jZToNCj4+
DQo+PiBIRU9DRkcyNC5WWFNZRkFDVCA9IFZGQUNUT1INCj4+IEhFT0NGRzI1LlZTWENGQUNUID0g
VkZBQ1RPUiAvIDINCj4+IEhFT0NGRzI2LkhYU1lGQUNUID0gSEZBQ1RPUg0KPj4gSEVPQ0ZHMjcu
SFhTQ0ZBQ1QgPSBIRkFDVE9SIC8gMg0KPj4NCj4+IEhvd2V2ZXIsIGZvciA0OjI6MiBmb3JtYXRz
LCBvbmx5IHRoZSBob3Jpem9udGFsIGZhY3RvciBmb3IgY2hyb21hDQo+PiBjaGFuZWxzIHNob3Vs
ZCBiZSBkaXZpZGVkIGJ5IDIgZnJvbSB0aGUgZmFjdG9yIGZvciB0aGUgbHVtYSBjaGFubmVsOw0K
Pj4gdGhlIHZlcnRpY2FsIGZhY3RvciBpcyB0aGUgc2FtZSBmb3IgYWxsIHRoZSBsdW1hIGFuZCBj
aHJvbWEgY2hhbm5lbHMuDQo+PiBIZW5jZToNCj4+DQo+PiBIRU9DRkcyNC5WWFNZRkFDVCA9IFZG
QUNUT1INCj4+IEhFT0NGRzI1LlZYU0NGQUNUID0gVkZBQ1RPUg0KPj4gSEVPQ0ZHMjYuSFhTWUZB
Q1QgPSBIRkFDVE9SDQo+PiBIRU9DRkcyNy5IWFNDRkFDVCA9IEhGQUNUT1IgLyAyDQo+Pg0KPj4g
Rml4ZXM6IGQ0OTg3NzFiMGI4MyAoImRybTogYXRtZWxfaGxjZGM6IEFkZCBzdXBwb3J0IGZvciBY
TENEQyB1c2luZyBJUCANCj4+IHNwZWNpZmljIGRyaXZlciBvcHMiKQ0KPj4gU2lnbmVkLW9mZi1i
eTogQ3lyaWxsZSBQaXRjaGVuIDxjeXJpbGxlLnBpdGNoZW5AbWljcm9jaGlwLmNvbT4NCj4gDQo+
IFRoYW5rcyBNYW5pIGFuZCBDeXJpbGxlOg0KPiBBY2tlZC1ieTogTmljb2xhcyBGZXJyZSA8bmlj
b2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAgwqBOaWNv
bGFzDQo+IA0KPj4gLS0tDQo+PiDCoCAuLi4vZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNk
Y19wbGFuZS5jwqDCoCB8IDI3ICsrKysrKysrKysrKysrKystLS0NCj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyANCj4+IGIv
ZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMNCj4+IGluZGV4
IDRiY2FmMmNkNzY3Mi4uNDFjNzM1MWFlODExIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jDQo+PiBAQCAtMzY1LDEzICszNjUs
MzQgQEAgdm9pZCBhdG1lbF94bGNkY19wbGFuZV9zZXR1cF9zY2FsZXIoc3RydWN0IA0KPj4gYXRt
ZWxfaGxjZGNfcGxhbmUgKnBsYW5lLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHhmYWN0b3IpOw0KPj4gwqDCoMKgwqDCoCAvKg0KPj4gLcKgwqDCoMKgICog
V2l0aCBZQ2JDciA0OjI6MiBhbmQgWUNiWWNyIDQ6MjowIHdpbmRvdyByZXNhbXBsaW5nLCANCj4+
IGNvbmZpZ3VyYXRpb24NCj4+IC3CoMKgwqDCoCAqIHJlZ2lzdGVyIExDRENfSEVPQ0ZHMjUuVlhT
Q0ZBQ1QgYW5kIExDRENfSEVPQ0ZHMjcuSFhTQ0ZBQ1QgaXMgDQo+PiBoYWxmDQo+PiArwqDCoMKg
wqAgKiBXaXRoIFlDYkNyIDQ6MjowIHdpbmRvdyByZXNhbXBsaW5nLCBjb25maWd1cmF0aW9uIHJl
Z2lzdGVyDQo+PiArwqDCoMKgwqAgKiBMQ0RDX0hFT0NGRzI1LlZYU0NGQUNUIGFuZCBMQ0RDX0hF
T0NGRzI3LkhYU0NGQUNUIHZhbHVlcyBhcmUgaGFsZg0KPj4gwqDCoMKgwqDCoMKgICogdGhlIHZh
bHVlIG9mIHlmYWN0b3IgYW5kIHhmYWN0b3IuDQo+PiArwqDCoMKgwqAgKg0KPj4gK8KgwqDCoMKg
ICogT24gdGhlIG90aGVyIGhhbmQsIHdpdGggWUNiQ3IgNDoyOjIgd2luZG93IHJlc2FtcGxpbmcs
IG9ubHkgdGhlDQo+PiArwqDCoMKgwqAgKiBjb25maWd1cmF0aW9uIHJlZ2lzdGVyIExDRENfSEVP
Q0ZHMjcuSFhTQ0ZBQ1QgdmFsdWUgaXMgaGFsZiANCj4+IHRoZSB2YWx1ZQ0KPj4gK8KgwqDCoMKg
ICogb2YgdGhlIHhmYWN0b3I7IHRoZSB2YWx1ZSBvZiBMQ0RDX0hFT0NGRzI1LlZYU0NGQUNUIGlz
IHlmYWN0b3IgDQo+PiAobm8NCj4+ICvCoMKgwqDCoCAqIGRpdmlzaW9uIGJ5IDIpLg0KPj4gwqDC
oMKgwqDCoMKgICovDQo+PiAtwqDCoMKgIGlmIChzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5mb3Jt
YXQgPT0gRFJNX0ZPUk1BVF9ZVVY0MjApIHsNCj4+ICvCoMKgwqAgc3dpdGNoIChzdGF0ZS0+YmFz
ZS5mYi0+Zm9ybWF0LT5mb3JtYXQpIHsNCj4+ICvCoMKgwqAgLyogWUNiQ3IgNDoyOjIgKi8NCj4+
ICvCoMKgwqAgY2FzZSBEUk1fRk9STUFUX1lVWVY6DQo+PiArwqDCoMKgIGNhc2UgRFJNX0ZPUk1B
VF9VWVZZOg0KPj4gK8KgwqDCoCBjYXNlIERSTV9GT1JNQVRfWVZZVToNCj4+ICvCoMKgwqAgY2Fz
ZSBEUk1fRk9STUFUX1ZZVVk6DQo+PiArwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9ZVVY0MjI6DQo+
PiArwqDCoMKgIGNhc2UgRFJNX0ZPUk1BVF9OVjYxOg0KPj4gK8KgwqDCoMKgwqDCoMKgIHhmYWN0
b3IgLz0gMjsNCj4+ICvCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICsNCj4+ICvCoMKgwqAgLyog
WUNiQ3IgNDoyOjAgKi8NCj4+ICvCoMKgwqAgY2FzZSBEUk1fRk9STUFUX1lVVjQyMDoNCj4+ICvC
oMKgwqAgY2FzZSBEUk1fRk9STUFUX05WMjE6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgeWZhY3Rv
ciAvPSAyOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHhmYWN0b3IgLz0gMjsNCj4+ICvCoMKgwqDC
oMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqAgZGVmYXVsdDoNCj4+ICvCoMKgwqDCoMKgwqDCoCBi
cmVhazsNCj4+IMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCBhdG1lbF9obGNkY19sYXllcl93
cml0ZV9jZmcoJnBsYW5lLT5sYXllciwgDQo+PiBkZXNjLT5sYXlvdXQuc2NhbGVyX2NvbmZpZyAr
IDIsDQo+IA0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
