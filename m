Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5327CEF397
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 20:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B72A10E200;
	Fri,  2 Jan 2026 19:17:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="hYAVucXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazolkn19013045.outbound.protection.outlook.com
 [52.103.14.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 972F410E200
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 19:17:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOOkEy9liL57AwfWc7hVhekk2UcGYmHPYH77B3ZzUdWJ83MNb4af4bkW8rtRvzFBerHz6omiUM2layhrUKqrmdWZEAJ/NLzJKi8uBaGhkZw7NPRgz0MEpPbPZ2A0KPBRxWRzh9cPvt1i+kp/ZW2DDUCfv4EnanG7Jjs+c5hc2mbtdv/7EA+PdoLu9wpjRV33gnb3C3egAamu83ybOptZGEQWEK3/BwwYSeYcZ3/8c3p+9wAQqfeZ2WFHJqv5YAHnos0KbKQiGBs5zN1G3BIvwpsXv3+tUlWrGF4qubGfoyvtckkYNdWRx9K2jr/4jgvprCJy2E2mb90/JxS8Sd63Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0dkQmJJVh8GuOu6ojbQoYwxgy97j5Gt1kKUlSTQxr4=;
 b=luVtgpDzkYOPMjMeRP9XLQMhJmtcTjAk/jzPYMNgRfyylXeOut26QYqLy6nxfOxMrYQNPytNsw7txFaD1p86H83dqNvV1uR0nf3Y7FRfGQYCmrPqVwd/QA1rzSQbTJRObQIjR4zzl4HCXcfii2wEa5lRJK2iC93/fjATPb4MXJGkFzgs6ozatOdk0PZElGesnrvREyespTw7vm6YA5aW+tnCo5Frwfav/gq6LC2cAReR5/x0xfpQP0QKGqZDMXtMg7iL5c0L9Hny7IwB9sTJST+VkzZggKy/2Ts01bLUjp6Mkve/WFTpGzxN56J04WU1CkY8uPdEI7+pNihmmtUNyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0dkQmJJVh8GuOu6ojbQoYwxgy97j5Gt1kKUlSTQxr4=;
 b=hYAVucXWBlOe8guFmJxLsqh/HVw9kN9kWBCsbRyOgYPZUVk0CiUcgVYfYMVOGBIQZ0xusRWccN7qMRVZYWtiLbqsGCsFYvYOAsy6m1jKRGSA9dMZOXnK7lOzCRgFZs22CpiGLYYYjBEK1I8bO66j6Guu4TEBLJBHGJxf0dSlXUcBozpZ8FomBOgtqCGtQCV0P+8/O+EOj+XKvbACvk1rvEdHZ2W2G90otg/IxcDdS9QojjpCs+rxNVzaGGthor5tKrUi5VT2C/uJ8Ywn3gpO6ap4wTmLMbnUG4HuyBEA8AdEoLZVF/aYYsbwuwL8Q5f2rS7WllQ847/1E1OewqUDiw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by SJ2PR02MB10124.namprd02.prod.outlook.com (2603:10b6:a03:563::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 19:17:47 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 19:17:47 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Helge Deller <deller@gmx.de>, Prasanna Kumar T S M
 <ptsm@linux.microsoft.com>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "ssengar@linux.microsoft.com"
 <ssengar@linux.microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "decui@microsoft.com" <decui@microsoft.com>, Thomas
 Zimmermann <tzimmermann@suse.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] drivers: video: fbdev: Remove hyperv_fb driver
Thread-Topic: [PATCH 1/3] drivers: video: fbdev: Remove hyperv_fb driver
Thread-Index: AQHcdui+KQXRjOIFVEuflSwlcErRcrU56WyAgAVGySCAABj9AIAAAakg
Date: Fri, 2 Jan 2026 19:17:47 +0000
Message-ID: <SN6PR02MB415706E623885B4173D238AFD4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
 <e37ef037-fb4f-418c-937b-b3deb632d0ca@gmx.de>
 <SN6PR02MB415700F34CA2A4296A542F73D4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <7d2fbfe3-eac9-421b-8e75-8d44b26fd2b3@gmx.de>
In-Reply-To: <7d2fbfe3-eac9-421b-8e75-8d44b26fd2b3@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|SJ2PR02MB10124:EE_
x-ms-office365-filtering-correlation-id: e93fe610-de4e-4fb3-5ca7-08de4a339d59
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799012|31061999003|13091999003|8062599012|8060799015|19110799012|51005399006|461199028|440099028|40105399003|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?YVpEOXFsaWFxbkZCYklQU0FqWnpJeUluS3JVR3Qxd0hKTDJEYWlsdjBZaHZv?=
 =?utf-8?B?dSt6U05yQlphdFZ3UmVxUTNEZDBpVC9MbGp4a3ZaTXdnZ05qZmVtaVJybVp0?=
 =?utf-8?B?eEVLZTQyejBJU2RudFhkbE83b1E2MldrRzRhRkhPSEpCN2wwcU93Z2t2Rmpo?=
 =?utf-8?B?WlBYNmhPSzVWLys2eFZodmtDWGM0bDJkTzNxejZPekZFUFlUQytlU3FkK1RI?=
 =?utf-8?B?RHNGNTZnaXowNVhXWG8zVmFrNkJkYUJob3hKSXlRdnZ3UWsyd1ovbnAwZVlQ?=
 =?utf-8?B?WWNZVUJnNjFERG1uc2dvVExXdVJmU09vMXVkK2Nrckt4T0F3M3VVSk9ZVlFi?=
 =?utf-8?B?WE15MHAwbU8wYzJYb2ZqTWpvaVVvbUR6MDRzTTdKS3Zaa0VzOElYdGtEWUxT?=
 =?utf-8?B?VlVkN2swMDlkRko4Q2o3S2FVb05aUFd3Sjk1QXplOE8wa0RMNDBMNXVYckpO?=
 =?utf-8?B?VGNyZEladHBZTGVYOVlySjUybWVGb1QyMjFZdWVFYXBZcVlJUHVvdUVXZVN6?=
 =?utf-8?B?UExPRGE2R21zamMrSTlVMng4VUwyeVFaNHJ2dXh1cm1mWVFZWGpwbzlZSEMv?=
 =?utf-8?B?bzJGWXJWaFNxaGVReFNOV1cvS0VrZlhCR1FIZmIwajZabVEwL3dIdnFOdzVH?=
 =?utf-8?B?UzJyZGxBemtONDRBd0svdkZ6YVNENEFlNEdkekp4NWNkeStkbWtjWGEvTUJH?=
 =?utf-8?B?Y1FMTXhJVGlqWWxJcTdPUFdyMGp3SWxzWTJaa3p6UFRpZmlCWHhqRTlERGxv?=
 =?utf-8?B?cXRMS0doTTZrTFlJYUZEdmFOV0gzZyt1a2VpUXhNNHptekNTcTQyNW9wQUsw?=
 =?utf-8?B?NnQ3cWxmV3hUbkdmMkhUT2grSzBxU0Z6TGNoRDhnTEo1alJPSHNXZTRCQzNa?=
 =?utf-8?B?UythRlc1dmMzbERJSDlGMWhFeVRUTlpEaU56QzB1QzR2cnRucWw0YzUxSXI3?=
 =?utf-8?B?SW80VkZnRDBmM2kyTm5URGQ0MnJhVkFsWG9zeGhwUnRKTll4ZjN2WXJjaUU2?=
 =?utf-8?B?VXlzWGdTSVEyMHJabjczQjlubGd0V3AwQmhGRzRKcGNBR01ucmpqWWdMandt?=
 =?utf-8?B?UzYySmhWZFlDS2RoUlRrV0pBTWlWR1FTSGlWQ2tiWm1zZ2xnQjlnNmxEVGJE?=
 =?utf-8?B?SjlLL3FWVTZnVlQ0MzBxblVxL1NsSEk0TXRwY0JHVlNMRUZTYTBlV2wyQ3F2?=
 =?utf-8?B?dXRYWTBhYTRpMHR5WnU4L21GY0RhSjJQV1k5SUx4WTVpTk0vZXJOR3cvVXFD?=
 =?utf-8?B?anRaa1ArejNVcWtLVFZiU2dvL2w5MDlNSHlQTnJLci9hQXJ6RnBuK3l6RWFx?=
 =?utf-8?B?VmgxS3AvS3o4NkF6dTdpTFZlbEdzRDBYa1QrL2NtNzFzR0ZZUmZpT2c3Y0Ew?=
 =?utf-8?B?MUZWZDdIMzFLMXVlTU05VlUwNEJ3Z1QyQ1NIU1c0WnNieUZhejFXdEFxMnY3?=
 =?utf-8?B?emhXaDNQdzl3VDdHL1F5cXpOOHZRbk8vZXF3eG5BKzRFZDFXOEd4ejVFQ3Zm?=
 =?utf-8?B?TkMrUFdIeTJoRThOZVAyU1R5ekZMd0picEo1UzVsaUZtVjNpSHVZSWwwS3ND?=
 =?utf-8?B?dGdKcnZ5L0pOUEd6ZUZKNEZCNzlndkxQRWJJVWpPUWh4MFhNRnpJeS81UG9v?=
 =?utf-8?B?TG1PSEdmNjBIb3h1ZlhCdFF1Nmtrd3c9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UC9jQ3FEbTdtdjI1ZUsxbW9FSC9OMUVmY1llcE92ejlZcnBuYmxyeTJpc2lz?=
 =?utf-8?B?bXVOT1hCTi80SXo5TlV5Q2J2d29GaFdiTHBORE9IVDRuUGpNZE9QU3Y3RnZT?=
 =?utf-8?B?ZExnY3I0eDZHYXVKcWVqaGpDbkU3clFpTHB4bTNwTEZ0K29wVExRZ1FEdERC?=
 =?utf-8?B?ZXB3Mm9ZaU5DNmRBV1RLUXNJREpKWlJkbFJxRXVVN25ZUmNGV1c5RnFzcXM5?=
 =?utf-8?B?dStKb25LQ21wZUVMR0dtMysyKzRNS1J6N2dPZzAwNzJ6YUsvSDAzV2FRSWJZ?=
 =?utf-8?B?MTdTb1BaWmhJNVp6amJncTRRNk9KRU1ic1Y2Zkd1bk5lekVZK3E2ZUJCN0ZP?=
 =?utf-8?B?UVBQbm9VYW54ZStOK3RHQktXVE5sK0U5QVYrU0EwaWpIOWVDTVU2RFJndGsx?=
 =?utf-8?B?Z3VvbFRxcUQ4eGlHRWwrd1pQNGowOVZVSnlsN1NodVZmU2hFMDlLTnp4dE5a?=
 =?utf-8?B?emk1TWpPbHo4eWlPK2MrekhSOXFuWjJiR01YaEQvTnpqb0NuZ2tzT3hsSjFD?=
 =?utf-8?B?REIrbEo0MnNkMGNWN0poY1hxRVJ3UHhUTk14eUduc2xZRmtaTm9lLyswYzNF?=
 =?utf-8?B?Z2ZrYTlTVS92UVR3MmhWVEhuRzdEazdhSFBRMlFLZE9UMEc3MGdGK2RMVVNB?=
 =?utf-8?B?YklNVzFxSHVOaExDamV6K2o5TWNMWlM3UHJkSXhjdG5lNnJ6Y0pRZXhLNVdG?=
 =?utf-8?B?bVdvM04rZWtZR3F5ckNtM0JDTzFubTJIVkYxMHZQdk44TVhUOWVpVnFLZjdG?=
 =?utf-8?B?ME9LSk1YWWo5cUp5L1BZUjRoOXJ5MkJ5ZUJoZWh2OUxZRkhBbzhoTElQREhH?=
 =?utf-8?B?TlIyd2l2OHRhNW5LNEkxNCtNOGlsNDJVRzFia0dwKzFzYjNqVDMyemRkaWNB?=
 =?utf-8?B?Z0hjN3dhc3YvMHJTdTVocGpkZUhhR2I5VCt4ZkF6eWxxb3ZkMTF2N280aTBD?=
 =?utf-8?B?TGR5TENwbjY5bVd5OVdRcEpLRmZOQTRicUtXVkR3QUd4WHgwa25MaEVyT29Q?=
 =?utf-8?B?RlRiL096c1dCQTNlbzhxaTRpZmhMTUNKcVFObzh4NmRNZVlDUHIrRGhDVlFN?=
 =?utf-8?B?T3YyZmh6QjBvTC80MU1QNlFrN2JUckQrVXFweGREYWpUWDM4NVZRSnkrS1h2?=
 =?utf-8?B?VGZQOG1OQ1FjRVZQNmNVTzViOUZlSUs0cEVlZ1FFbGNiYi9RWEVTdytzNEhh?=
 =?utf-8?B?TlhWT2p2cnpMejVJZDRqd2NpdW8vaFJYNE5meHdrbHJKREVGV2k4WWo0TldS?=
 =?utf-8?B?L0l6cmtpTm45VkM0NzNSVkJTZWhEMFduNzk2a3lzczN5bm95L1o0NjN1ajk4?=
 =?utf-8?B?YzRYcVREWFBUV2g4bmpIVDRuVGdKV0RMbzVZaUhPcTZORldPbzluRnFLRHpL?=
 =?utf-8?B?VjRnQUdaeS8zRzZYRjEwUXhpclQ0aWluMm45WXNyRVRlbGd0NFdtaiszQUFa?=
 =?utf-8?B?TllPbWlzSExlTURWUDNqVWpuZ2xDdktqMGhMRlpuZXlQV1RpZXVMNUR2T3R0?=
 =?utf-8?B?d21zNkNVdUNBRTk2S21WMlRJQ0tBeW4rM1k5VXVCN2hMYURac1FBWXZyeGNt?=
 =?utf-8?B?T0MyRWllU29jUWYzNXpOWXd5TkcvcHp5WnRMbG5VYm9nV3FJK1RNeTVaMHE2?=
 =?utf-8?B?ajhNV2NjRXU5ZjZOOTI5YnlNUFBJZUx2SHJndGp3eTYyS2pHaW1DUmswdnJM?=
 =?utf-8?B?bnQzT24rUXV3UnJSdGYwWVJKamhJWnZYUkpsMWJ4czJCRHFIZWU5VVZxNlFy?=
 =?utf-8?B?SzNDdzljVGFLM3E5TGd6OVZPWjllRmdMU3NJK1FKOWF6VUt0ZmZnTllxYWVs?=
 =?utf-8?Q?trRQLtC5M2vasMd3/yMEuz2OK58fo9vBy5+po=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e93fe610-de4e-4fb3-5ca7-08de4a339d59
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2026 19:17:47.6616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR02MB10124
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

RnJvbTogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPiBTZW50OiBGcmlkYXksIEphbnVhcnkg
MiwgMjAyNiAxMToxMSBBTQ0KPiANCj4gT24gMS8yLzI2IDE4OjQ1LCBNaWNoYWVsIEtlbGxleSB3
cm90ZToNCj4gPiBGcm9tOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+IFNlbnQ6IFR1ZXNk
YXksIERlY2VtYmVyIDMwLCAyMDI1IDE6MDcgQU0NCj4gPj4NCj4gPj4gT24gMTIvMjcvMjUgMDU6
MjQsIFByYXNhbm5hIEt1bWFyIFQgUyBNIHdyb3RlOg0KPiA+Pj4gVGhlIEh5cGVyViBEUk0gZHJp
dmVyIGlzIGF2YWlsYWJsZSBzaW5jZSA1LjE0LiBUaGlzIG1ha2VzIHRoZSBoeXBlcnZfZmINCj4g
Pj4+IGRyaXZlciByZWR1bmRhbnQsIHJlbW92ZSBpdC4NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBQcmFzYW5uYSBLdW1hciBUIFMgTSA8cHRzbUBsaW51eC5taWNyb3NvZnQuY29tPg0KPiA+
Pj4gLS0tDQo+ID4+PiAgICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgIHwgICAxMCAt
DQo+ID4+PiAgICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgICAgIHwgICAxMSAtDQo+ID4+
PiAgICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L01ha2VmaWxlICAgIHwgICAgMSAtDQo+ID4+PiAgICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jIHwgMTM4OCAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDE0MTAgZGVsZXRpb25zKC0p
DQo+ID4+PiAgICBkZWxldGUgbW9kZSAxMDA2NDQgZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZf
ZmIuYw0KPiA+Pg0KPiA+PiBhcHBsaWVkIHRvIGZiZGV2IGdpdCB0cmVlLg0KPiA+Pg0KPiA+DQo+
ID4gSGVsZ2UgLS0gaXQgbG9va3MgbGlrZSB5b3UgcGlja2VkIHVwIG9ubHkgdGhpcyBwYXRjaCBv
ZiB0aGUgdGhyZWUtcGF0Y2ggc2VyaWVzLg0KPiA+IFRoZSBvdGhlciB0d28gcGF0Y2hlcyBvZiB0
aGUgc2VyaWVzIGFyZSBmaXhpbmcgdXAgY29tbWVudHMgdGhhdCByZWZlcmVuYw0KPiA+IHRoZSBo
eXBlcnZfZmIgZHJpdmVyLCBhbmQgdGhleSBhZmZlY3QgdGhlIERSTSBhbmQgSHlwZXItViBzdWJz
eXN0ZW1zLiBKdXN0DQo+ID4gd2FudCB0byBtYWtlIHN1cmUgdGhvc2UgbWFpbnRhaW5lcnMgcGlj
ayB1cCB0aGUgb3RoZXIgdHdvIHBhdGNoZXMgaWYgdGhhdCdzDQo+ID4geW91ciBpbnRlbnQuDQo+
IA0KPiBTaW5jZSB0aGUgcGF0Y2hlcyAjMiBhbmQgIzMgb25seSBmaXggY29tbWVudHMsIEkndmUg
bm93IGFwcGxpZWQgYm90aCB0bw0KPiB0aGUgZmJkZXYgdHJlZSBhcyB3ZWxsLiBJZiB0aGVyZSB3
aWxsIGJlIGNvbmZsaWN0cyAoZS5nLiBpZiBtYWludGFpbmVycyBwaWNrIHVwIHRvbyksDQo+IEkg
Y2FuIGVhc2lseSBkcm9wIHRoZW0gYWdhaW4uDQo+IA0KPiBUaGFua3MhDQo+IEhlbGdlDQoNCkFu
eSBjaGFuY2UgeW91IGNhbiBmaXggdGhlIHR5cG8gaW4gdGhlIFN1YmplY3QgbGluZSBvZiB0aGUg
M3JkIHBhdGNoPw0KImRybS9oeXByZXYiIHNob3VsZCBiZSAiZHJtL2h5cGVydiIuDQoNClRoeCAu
Li4NCg0KTWljaGFlbA0KDQo=
