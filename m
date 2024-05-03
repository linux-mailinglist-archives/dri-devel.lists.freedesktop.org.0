Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CB8BA7DF
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 09:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7351010F8EF;
	Fri,  3 May 2024 07:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=asem.it header.i=@asem.it header.b="nbnFHRok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DAB112873
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 07:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyCZ9O+3W/RmATRso27X5+PMp/6JI0WmB41BRtuf7Tl3aS3fyRNlpK5BGMZCxbWLEt/bW/qMnjtbGv8oPGBz6gzTje9pY5IKs1iyHul/t/gg0O+eJvXubrM8Xg5TpXbTuLfj6QAeZvFx6POmXmsW7sFOImjita6WOUNBKijpnAhaC9UnxG7C0VjFzKfg056rnb6nHjFmxQPior9izJsPzZecPlqSE+HGo3/ZfFwwyr2jWcGTUzQ0rT1HQgohNrSUs80In5G9uITHmzP4GQOoSHMy/br1sEx61nRu1eRXBu/A8eC/mkZDg3r5Y1ZnXScLjXeVZMmCUs4ARQyUlDwtJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQylMQ5kggv+G89EPV933Kzwm9ZadfbHkyTtUADdB38=;
 b=bvspqSN39aHc+6axD5G/j0+fjpvymKa58LqLOQcXTfhS6vqqP5m3ne+PTOd6mZd/XxUuMMJrlj9ZK8MUXUaPqxrifP3AZqy0PJkBvXHNni8LCiZCfzgNS/UdatvfbR0RQs2az2M2qoKsNob1NPMdZ05VnFR7EQy5kqeiCfl7inJ1z2UN7ffAf3vqalXnrMuRCHLy0/EkpvcPJojIWwjWFLMfpBpbG9nsP3VucHtgI2wEnxTYtZVxaUGMOrxQyqGFQZG0Ovob+UJT4xO0JNLf62aSEVxgcJupt5I23ASDSmgqgSQirnehUJA6voS1mqxe9apcV1WB800GcdjMm4fthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQylMQ5kggv+G89EPV933Kzwm9ZadfbHkyTtUADdB38=;
 b=nbnFHRokMxJq4/FAfXueUtT5dFLUeY87wDwufIbzR2H7fSIUfBVu4ynWqzheobeybWSEKS57IU9Z2aJuYCy3dIKsx589hFZnVo65f7T2ZcEQBn/Rk69cV4TaINFiLPrbin4CGp7jPBpGy3TlWF7yHFczvEnY+EzJ745JF01j1agujx3yoqVNfv3aTUr8qu0165CrTB2dmnpeh81PaEoubL/awGzSeL6x/ZzlEclxMlIbuvM0b20zm+p8XfxUGzDNhiVSU8UeXc99vwSMXVS9St1O+M95GQMASU3k5A/6mb5CxBtZQdfuMpYzE64RvJZt8BNdZYnzjDdCBK9ch2rshg==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by EA2PR22MB5329.namprd22.prod.outlook.com (2603:10b6:303:25d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Fri, 3 May
 2024 07:35:44 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::e21a:e0c7:aff:b839%4]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 07:35:44 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: 'Lee Jones' <lee@kernel.org>
CC: Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han
 <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, Dan Carpenter
 <dan.carpenter@linaro.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: EXTERNAL: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix
 leds flickering in pwm mode
Thread-Topic: EXTERNAL: Re: (subset) [PATCH v1 1/1] backlight: mp3309c: fix
 leds flickering in pwm mode
Thread-Index: AQHanLCP5TSeO9WjhUOCMksauhdR0bGEJ9mAgADpMWCAAAalgIAAB4lg
Date: Fri, 3 May 2024 07:35:44 +0000
Message-ID: <PH0PR22MB3789923F70E128DB14DCD073FA1F2@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <20240417153105.1794134-1-f.suligoi@asem.it>
 <20240417153105.1794134-2-f.suligoi@asem.it>
 <171466849494.1206441.17324969195592920195.b4-ty@kernel.org>
 <20240502164853.GB1200070@google.com>
 <PH0PR22MB37891FE6DC843E8EF05BDF7DFA1F2@PH0PR22MB3789.namprd22.prod.outlook.com>
 <20240503070717.GB1227636@google.com>
In-Reply-To: <20240503070717.GB1227636@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asem.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|EA2PR22MB5329:EE_
x-ms-office365-filtering-correlation-id: 3a4156c3-9b4f-4e1b-14dd-08dc6b43a439
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NkJQOUY2OTA3QnQrWHJ3WmhHRUZsNTBoQVZXTEwwWktmVWlqdnQwK2VOYWVS?=
 =?utf-8?B?S3NXN21nK0JqYmVHQld6NitRd2RZb2hkbzB1WWxyRFJMcjNueVZpelgwdkZj?=
 =?utf-8?B?YXdUdkFDektCdU1vT0o3bzB6cm96dno0WVhaUjRuTGhqTTN6cU5sZXhwbjNt?=
 =?utf-8?B?MW95aTE5dFVpWUN2R2NQVFVaRHRscnFBc01TZGE1VVVIWVppbk1oLzF1dGc5?=
 =?utf-8?B?Zk1jYXRKU1NQQUNJSnp6aWkrYWR6QndSS09aVUNEYWdUU0pPY1N6ZTRZdWdy?=
 =?utf-8?B?VVJmeVAySUs4VG1lN0tEWjhpOGdJWTBqMEl0N1UwYWlWTEFleUFYMVIvS2xO?=
 =?utf-8?B?Z0N5QjR4bVk3T0hSa1NHMGhpemxIbkZra1FzOW5yQXM0ZktpZDJiOGxsT1Nu?=
 =?utf-8?B?RUMrQ3FBTjI0S0VIYkU3dXFGbmI3MWFSWDJBMkRydk1JRVM2TG0xTTYzS2sr?=
 =?utf-8?B?VkJCTHA1ZGd2OG1KZ3BQWThiQTBRb2lXRDVTMnJoNStoMVBzekNadHRQRnFP?=
 =?utf-8?B?TEtGYTVvaGZOQkZUWU5VVUJvTUNHRkdaWWxqL1BGM1hFem5DY1p1TktsRERG?=
 =?utf-8?B?MFpVNnkwaUYxQW1MM1h3Z0tDTXhqMlpLWFlza3VxQW5GaEc0Q1NKclNZQWNu?=
 =?utf-8?B?allEWW0vUmx5T2JLVXMvVmp2amJRN0k2MzhSd3oyYy9kUldYclkvZDROR21R?=
 =?utf-8?B?SnRhc1lSZnZSSVhEeE10b0NmN0hNTnRKb2VtbC93SzUvMkpRUlFaUGxISSs4?=
 =?utf-8?B?b0h5UWpUVlhNRTZYSTczcmt1S0x1Sk5qbnYzOCtSeHQ1bjRXcnhvZDJvazNw?=
 =?utf-8?B?TFpyenhqcEowQWhQT2lmdExSNVllWjJCWDQ0c3ZXMjVIL3psTUhkODJDM3Rv?=
 =?utf-8?B?ZnlKR0o3L0lqRHVjWXpGdkhtQWJ6TmdyZ0t2QjZEdVZQRVdBaVBSTTdwRFBa?=
 =?utf-8?B?dkJ3MHB6cUZ4TFdtWHJSNzcwa3cyU1RHWHVQL2tNVFZoaHVKVldrQTBkcWJS?=
 =?utf-8?B?RDdSQ0pKRHBUSTBwcEhCMHk0VzlFeXpMb3pFUDRJNGpka1EwSHphU0FIVXhR?=
 =?utf-8?B?VlF5UlpoWnJJYXdLbGtHVkpPSFlmWTcyZUhVT1BWQ1ZXbUxpL1ZGYTVmQ2dt?=
 =?utf-8?B?WUU1aW5aVGlIeGpGYlJmQkUxVkhCbkRTNVErTk5QZVREZmtHSFFxK29mK1JW?=
 =?utf-8?B?M2JuRTVtOVdNQ0IxNi8yOHBLRHZza3AzdmoxRUZWTHMyVmVlUFF1azhlZlps?=
 =?utf-8?B?TGIrSG9NR2dRUHVZZVlaOHVScHNvZmdsSHpOL09hdnJldHNJS0JLWmZZZVFM?=
 =?utf-8?B?V3BFYmpJTE0vZjlBT0d3NVRjUkZnOUZKaUZSTnExWFl3a3ZDTStTeDBNSlB4?=
 =?utf-8?B?ZVROVm13MUJTbnk2TTJNa2ViMTlaaUpQdTlJR2N5Nm5ENFVrTS9RK1FUM3dM?=
 =?utf-8?B?Z0xVQTJ4d21FZk5KTWo0R1ZTcVdiR01Eei9ONUQ2eGxDRWIwTGFiV2w5Yndj?=
 =?utf-8?B?YnRTaUZYWjUxOFkwMlllc2RVNGU2Rzd0cFBVSEVzK0p5TUxvVmFkYU45SGlM?=
 =?utf-8?B?bXpOSHh4WFNJR2luOGxpaVhBcnZsUGpFOE1nSHFscnVIZ1o2bklsVlNseGRp?=
 =?utf-8?B?V2dyeHoza2ZaWDRhdThDVGVKNkJ0eUkxdFBxa2hGRUJIbFVSVitGTW5PRCtE?=
 =?utf-8?B?R3NJYkFIZ1MzU05VcFMvckZwcVAvRWk5QnhNTGZPT0kxOW9menVidER3anU2?=
 =?utf-8?Q?ObhPIb+B7/MXkINLsShUNdDXVQz0MwTv8F/IjBX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR22MB3789.namprd22.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmhMTDNBeDhTUnB3MGl0a0xTUkxFUkJWR0V3U2RpS2hneVVJZnlkdmxNWm8y?=
 =?utf-8?B?R090TE5kZDJGdkpQZW8xY0JKWEtxS3Vwc01zTEZlV3ZJb1F6RDJCUzYydVd4?=
 =?utf-8?B?eFZTRWVZZk9FaEVDTDFCYldvOWNFeXF4N0crRXlrdklHdEYram9DcmxtZWJO?=
 =?utf-8?B?SkFhMUZCMS9Sa05BanZNYWU5WU5wdlQ4aXFPVDg2d0IwckZOa2lyVlBsUFF2?=
 =?utf-8?B?VkVGRUxJU281WTdiSi9rZlAxTkhWelM2UXV6d1F5TXMzWUxTd0lpSGMvVTdy?=
 =?utf-8?B?b0tRZVBCdStoWVhyYVpFaEdGeHlXWTZ1NmxPUjVTbGJITWhVOUw5VUEzdFFJ?=
 =?utf-8?B?SmtWSzAvUWsrc1Y5SysxcjdYYU83akdPb2FCcnMzaW5EWTY2UHAvZzB4YVpp?=
 =?utf-8?B?OE9oOStGSENaY20weGxnWlk0ZnhQOHZ0VU54V3dFRUNtbUpQVWR0b2JPNnBB?=
 =?utf-8?B?anpxMTZQOVlIQVNONFR3aVF6U21YeEJxd05KNW1qVFJHdFV2UXRQd1VnU0Fq?=
 =?utf-8?B?Q1NIaWYwMEVQYVlLNHZCS0pGNVV2ZEhaQ1JxK1haQmFtaGNHK0VYMjhUcUFq?=
 =?utf-8?B?Wm1pazY3RDcrWDN0U0NzTE1aeU11MlhCSnE2eXI3dUR3WGRyekpUWjZmQmhL?=
 =?utf-8?B?THRMNHhoR2hMZW1qbDRFRytydHV2cktFUm5WS2NMQU8wZ2lCMFdXdTcrNno3?=
 =?utf-8?B?RitGaGFybGhWMk5nYm9JRm5xRFFnWG1wZ2VsWUVYMFpYRUFZQnZ4VUsvR21J?=
 =?utf-8?B?aTl0bUh1RTJkM2RUUnlvVUROTllrcGxuVzdGM3hla3V2Ym9ZZk9GSE52MXNv?=
 =?utf-8?B?T2RZWHJQcTlZc2ZoV0RPWGxuQlFFMTZ5aGc2TmlaR2tBWGk4RXVEZG45MDdW?=
 =?utf-8?B?UDNaemYvcmQvNzRCejFWQ3I3REJTdCtHMVNEbFFZdVE5cTNtakVzUTZwNWxx?=
 =?utf-8?B?aEVZOWc4ZTVHYzA4aE9lM0phUFdaWkFJZ3hab3R4alp5NWZIemM3YkVvTlVJ?=
 =?utf-8?B?R2dGTXFvTkpldGl2a2x1WU5XdHdCS25kN0hYV09EWUNhTWRHR2t0azN6V3E3?=
 =?utf-8?B?TENxbEdHL2V2K29zQmNxcHlqYzJOU1VYeDh5R0xGOWdVNlNrOXBLdGg0dGx5?=
 =?utf-8?B?QkVLUTN3VTgzZDd1cUx6VXp5UklPZ3lHY1BkNW00YS9SUzFaS2RqbzdMT2I3?=
 =?utf-8?B?ZHFOalFncWJldnBhajhqTk1kN1BwNGFrZ0lYbndMZHVYT2FMdlM3dXF2eS9B?=
 =?utf-8?B?QWRzeVNZcjlOTS9JZ2FEWVlyK2xHSVdSSHl5U1FsUG9aWjZQNzBEUUIzQlF3?=
 =?utf-8?B?ZjZuRHR3M1VRZEI1eDVkSWRXMS9IZlg1NlU1dWRzVWFab3U0cnZWNE85ZkFP?=
 =?utf-8?B?RWxVZUhUM3VYYVEyN3ZYTzJnZk9UUFFNTjR6UVJiT1V2eGFaYU84SkFPVW9K?=
 =?utf-8?B?bU9hNHR4TkNPREs0RTRJR1BqZXFaNUhWSEJ3Mlp0TUxQSnd3c2kvbStqRTVj?=
 =?utf-8?B?UjRwakVuNjh6bnNXTk9QYUFhNXZyK3JSdnJqNU90c25obnR6QldDcUgyMW5L?=
 =?utf-8?B?Ykt1YWNMMXpKcFJPU1Fab0lWTmlVUU9LeEZNaXpyQnJUQVRCMjdzWXJCancv?=
 =?utf-8?B?UjN1ZkphRGhlZDA3QTlkMDV1OXhnSFFTdVB4RzhQeTlWTDhUK2FmblZIbXZ4?=
 =?utf-8?B?YWNiTm9VUkNRTmRBUFNEZGR5RVJqTFBxT25RKzB5cHJpUGJOcFlHTDFrbi80?=
 =?utf-8?B?UlhvRzlPVllGSC9kVndQT3JJcU8yYjFPMm8xZ2gveVFSU3FOaDNaTW05czh0?=
 =?utf-8?B?ZitXNWwvVmhzOGdkd0xxTlg4Qms1d3p4WDVCMHNseW1pMGZ6bWhWSnJTbFlI?=
 =?utf-8?B?REo2OXc3dnNUWDNqMTloRGNHNFdOcFhINVBieWpBeEpNbmJPOXJTeXNoSTZl?=
 =?utf-8?B?WlJxREJCS0trVmwwUy9BZlFiN2N2QVZmS05aM2FxOU5wTzV1a2F6ZHhUb3U4?=
 =?utf-8?B?TGI4QnowMmhHK3plTXhxWXBLSWFBU1E0M2o3ak5ST3Y4UUFhTkg2MzVhaDFH?=
 =?utf-8?B?UzVIcW5KUTFZMTNvYlp2dW9DQlIraWxYY0FnOWNwZm9lWkNMSFJvalVaSE9Z?=
 =?utf-8?B?QUJMOGZyYzhhMXlWbm1FSlRBemlpZUlvSVJEKzZqK2gxMFpXMzBHNU1Cakxw?=
 =?utf-8?Q?lGmZ7gBDWVGVVUC0h7T7Qp8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4156c3-9b4f-4e1b-14dd-08dc6b43a439
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 07:35:44.1606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVKj6AOaQTMua7gUKBVjDoi83q1G8R+VvbMYgEWSm7WP/f78VVxYgrVmWPAu0LEwhAwhWAFiTIhN9CcP2WesYCUyiMlMJEmeu1vR0Vhn0KLOJKeDOsKEAiFaEEOBcJzP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2PR22MB5329
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

SGkgTGVlLA0KDQouLi4NCg0KPiBTdWJqZWN0OiBSZTogRVhURVJOQUw6IFJlOiAoc3Vic2V0KSBb
UEFUQ0ggdjEgMS8xXSBiYWNrbGlnaHQ6IG1wMzMwOWM6DQo+IGZpeCBsZWRzIGZsaWNrZXJpbmcg
aW4gcHdtIG1vZGUNCj4gDQo+IE9uIEZyaSwgMDMgTWF5IDIwMjQsIEZMQVZJTyBTVUxJR09JIHdy
b3RlOg0KPiANCj4gPiBIaSBMZWUsDQo+ID4NCj4gPiAuLi4NCj4gPg0KPiA+ID4gU3ViamVjdDog
RVhURVJOQUw6IFJlOiAoc3Vic2V0KSBbUEFUQ0ggdjEgMS8xXSBiYWNrbGlnaHQ6IG1wMzMwOWM6
DQo+ID4gPiBmaXggbGVkcyBmbGlja2VyaW5nIGluIHB3bSBtb2RlDQo+ID4gPg0KPiA+ID4gW1Vz
ZSBjYXV0aW9uIHdpdGggbGlua3MgJiBhdHRhY2htZW50c10NCj4gPiA+DQo+ID4gPg0KPiA+ID4N
Cj4gPiA+IE9uIFRodSwgMDIgTWF5IDIwMjQsIExlZSBKb25lcyB3cm90ZToNCj4gPiA+DQo+ID4g
PiA+IE9uIFdlZCwgMTcgQXByIDIwMjQgMTc6MzE6MDUgKzAyMDAsIEZsYXZpbyBTdWxpZ29pIHdy
b3RlOg0KPiA+ID4gPiA+IFRoZSBtcDMzMDkgaGFzIHR3byBjb25maWd1cmF0aW9uIHJlZ2lzdGVy
cywgbmFtZWQgYWNjb3JkaW5nIHRvDQo+ID4gPiA+ID4gdGhlaXIgYWRkcmVzcyAoMHgwMCBhbmQg
MHgwMSkuDQo+ID4gPiA+ID4gSW4gdGhlIHNlY29uZCByZWdpc3RlciAoMHgwMSksIHRoZSBiaXQg
RElNUyAoRGltbWluZyBNb2RlDQo+ID4gPiA+ID4gU2VsZWN0KSBtdXN0IGJlIGFsd2F5cyAwICh6
ZXJvKSwgaW4gYm90aCBhbmFsb2cgKHZpYSBpMmMNCj4gPiA+ID4gPiBjb21tYW5kcykgYW5kIHB3
bSBkaW1taW5nIG1vZGUuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJbiB0aGUgaW5pdGlhbCBkcml2
ZXIgdmVyc2lvbiwgdGhlIERJTVMgYml0IHdhcyBzZXQgaW4gcHdtIG1vZGUNCj4gPiA+ID4gPiBh
bmQgcmVzZXQgaW4gYW5hbG9nIG1vZGUuDQo+ID4gPiA+ID4gQnV0IGlmIHRoZSBESU1TIGJpdCBp
cyBzZXQgaW4gcHdtIGRpbW1pbmcgbW9kZSBhbmQgb3RoZXIgZGV2aWNlcw0KPiA+ID4gPiA+IGFy
ZSBjb25uZWN0ZWQgb24gdGhlIHNhbWUgaTJjIGJ1cywgZXZlcnkgaTJjIGNvbW1hbmRzIG9uIHRo
ZSBidXMNCj4gPiA+ID4gPiBnZW5lcmF0ZXMgYSBmbGlja2VyaW5nIG9uIHRoZSBMRURzIHBvd2Vy
ZWQgYnkgdGhlIG1wMzMwOWMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBbLi4uXQ0KPiA+ID4gPg0K
PiA+ID4gPiBBcHBsaWVkLCB0aGFua3MhDQo+ID4gPiA+DQo+ID4gPiA+IFsxLzFdIGJhY2tsaWdo
dDogbXAzMzA5YzogZml4IGxlZHMgZmxpY2tlcmluZyBpbiBwd20gbW9kZQ0KPiA+ID4gPiAgICAg
ICBjb21taXQ6IGNlNjBjZGRjMmFiZjYxOTAyZGZjYTcxZDYzMDYyNGRiOTUzMTUxMjQNCj4gPiA+
DQo+ID4gPiBBcHBsaWVkLCBidXQgaW4gZnV0dXJlIGl0J3M7IEkyQywgUFdNIGFuZCBMRUQsIHRo
YW5rcy4NCj4gPg0KPiA+IFNvcnJ5IGZvciBteSBxdWVzdGlvbiwgYnV0IGRvIHlvdSBtZWFuIHRo
YXQgSSBhbHNvIGhhdmUgdG8gYWRkIHRoZQ0KPiA+IEkyQywgUFdNIGFuZCBMRUQgbWFpbGluZyBs
aXN0cyBpbiBteSBtZXNzYWdlcyByZWxhdGVkIHRvIHRoZSBtcDMzMzA5Yw0KPiBwYXRjaGVzPw0K
PiANCj4gSnVzdCB1c2UgcHJvcGVyIGNhcGl0YWxpc2F0aW9uIHdoZW4geW91IGFiYnJldmlhdGUg
dGhlIG5hbWVzIHRoZXNlDQo+IHN1YnN5c3RlbXMgcGxlYXNlLg0KDQpBaCwgb2ssIEkgZ290IGl0
IQ0KDQo+IA0KPiAtLQ0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10NCg0KVGhhbmtzIGZvciB5b3Vy
IGV4cGxhbmF0aW9uLA0KRmxhdmlvDQo=
