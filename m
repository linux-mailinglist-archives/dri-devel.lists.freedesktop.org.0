Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD415B406D2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB4210E75B;
	Tue,  2 Sep 2025 14:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EyYjIxhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0005E10E759;
 Tue,  2 Sep 2025 14:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRphi/C6dn9kSqXhZIg0sr66R7SyH3ERbukvfp2pzCURoe2SLV8OCQbY0PsuvpWsW9ZPAuF2vDcIxWShx6vYU27sjf2iG1S3iomW6UGSypTrF+utyAUyS8GkAM3A6eEv9CGzBwLayYSs5Ow9K1F9bzLzPV1E0jDkg7bLTZ8SFi5Jmvu+y66y1SeX5RA14+skdmJ2ZFWXYB0mGZw2vF5eznC8jlHoqf7MB7RhnAMlceNAnmqH21P37CMBE+16xUzbRBs7OLnPw9RpqmA02QxZYQzxEJfhcYbXw0GOOGqIphS21RI/bkhpRYmldTUJqXe5r0oYutMV3vguwcrxOdkKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2d63LG8e2ZcWmT2bM4Svd/GwEaJezhRK71UIDwrTMUo=;
 b=VzI9a8atQLEbR9CtH6zUlR4ax5KwIW1Ns5yQxEK03Dw4peNN2mUHDu3mfsorL4fO2r9W84TcTB2NB3xu5lLdyzna2no8cM8snmnNcMdPoRIXHAAo6QXRed6DJfqYvd+GSYVwV6s2hsB3ZHBrNoas96G/E+LLtP1CIrJTPjMhB4joChg1bqzecWqFNij0AEf9pM3x1bkolEkFAhPAZ72x3Ba0AFiNB0Q383tCvn111u3iyg3e3I3sTFy4ESulD7HLJH+yittiNdNOgBp8pI7mfdLk5tljjL6e9IT6PpLKRuHInh69kGzNuwV+N6NVYv8wmh1K0wYkznoICq4EzGo/kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d63LG8e2ZcWmT2bM4Svd/GwEaJezhRK71UIDwrTMUo=;
 b=EyYjIxhKBUscy8bnxkk9OqKjVxzxDaXSlmUFen+5VNUCp5ftqaPjEUNBuGi+wfX6z7On5rWfJticcB5qeHtOTexdOqkOhcjaq4kEBY2tL6bit9pdExXdREGXAN1s578WGerkxGJCFQpYGOqRi8ZjHt0J89D5M78b0r5n+hxlt1EgTWt0N9Iy7cMeaQgDuPdePFQU7xGqjq5u4k5mwRF95WkSdIf6dYYKA5DO03qHOiRKKbap+k+Ro/iCmBWC/YsVGhbcqvc9hLqCZRQudIFfx+KxjafrPJQxl4IRkpQnnhy34i4gbSzxIv65kU2IXWrdCRwFR3kmSWv8w2I13CgaWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 00/11] gpu: nova-core: process and prepare more
 firmwares to boot GSP
Date: Tue, 02 Sep 2025 23:31:54 +0900
Message-Id: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANv/tmgC/5WRXUvDMBSG/0rJtSnJyVdbRPY/ROQ0TbawNdWkq
 8rYfzfrRFTYhZdv4HnOyXtOJLsUXCZddSLJLSGHKZYg7ipidxi3joahZAIMFGsAaJwWfPYhjW+
 YHHXM+1620KNQpDAvyfnwvvoen645uddj0c7XR9JjdtRO4xjmMkZwC9Jp6xou0QN6I3u0WjYDR
 8sNaxojXGsv6tHljOs+XXX/tQ7jUkkh61YaqSinA+7TZu9SdId6StuHW5ziApRoaw4gOfwDlMA
 FLwPBMNMWzu5SyHPAmDHOUz6EEYFvtiOGQ10+uXq+e+yq1aKB0XgcaStLbLhlYE23SHLpa1dsU
 /pYz7HwtbAbzS+cMuq90kJo00rNNnEJQ8DL2FW1wE9c/8Wh4K1QWoMC7wT+ws/n8ydHA/uqGgI
 AAA==
X-Change-ID: 20250822-nova_firmware-e0ffb492ba35
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0238.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4043fa-4674-48bd-7f4d-08ddea2d7abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjhDeCtMYWZXY0Z1enZRTmMxN21MSW4vcitoc3UxYk92RVdEWHQ2cXZRZVU0?=
 =?utf-8?B?WUF5Q1VZQy94aGorZTJnWWc2TFJDSG8reU1OVGtXUW9GS0RkN2kvK1VhcXc1?=
 =?utf-8?B?WFpZdmNaSzVqTCsrOVFNQ2t5d2N3TXA3YVN1dEV3dFVtR1FKcEJoejEyeTFB?=
 =?utf-8?B?OVhPckJkd1JobVZacHdYdXk1QVF6S2pTekdENFRLQ2dBKzdPVEg4eWxtdHRU?=
 =?utf-8?B?dWQxWW0xWjZmZEl1SlNnQ2h3cXhpYVA0SXo0WG1ieFg0ditFRitHeHA2TzJX?=
 =?utf-8?B?bmdBRUZLL1ZLN3FXUXpsOGdsTlU5R0ZjS3E5Y0lmWWQxNUhpaERycTkxL1ps?=
 =?utf-8?B?OFNiV2RwSU0vTndGWEh5OWlZWXRCT3ZNME9KMFc0dUEzSlFRVWtwZnZBb1da?=
 =?utf-8?B?aGlmNkJjTjUwc1hOOVliQTRXUXdoazZqQzVLeHd0QVE5ZHlMK2xUaTdVZkZv?=
 =?utf-8?B?QjR0Z251bFB2R2tkaW0zN1ZZNk1SKzVkSzM1UlN6MVVoN2JRZDJ0VFlTZGxR?=
 =?utf-8?B?SHNBTzJuZXRrMnRZOURPeUp2WUlIcm5Pc0EzMGZYcUUxbTJyem5jOXdnaENh?=
 =?utf-8?B?NjQ5WnVFaXVvQWVzL1ZWQlVxNTJTTXhJQVRKSDJsanJiMjdLdys5b1pjdVBj?=
 =?utf-8?B?QVprOGM5NDduQkRHZmNUQmNTakVrTHRObllsZTNGYWduODEzZUhMTnBkQzZx?=
 =?utf-8?B?RWVrWmUxWG5neHlxSnNIOHRlUFR1UGZWbEpwMW1WRTU3dTcyVXVFSVJvSDRr?=
 =?utf-8?B?TDI0NXR6QWpPekhnbS9iSmkydkhRYU91bDBaemNoSWgrckIzS2QxSWdJTmwy?=
 =?utf-8?B?d3kzTVFkWXBYbnZqN3FBMDVxSmN1Zng4UGI0cmR4N0pJL1lIOWtnNGRmM1Za?=
 =?utf-8?B?dGtrVmlHVEx0S0hHck53dW1neWRaVExJc2RFcFJqNTE5RDA4ZHVRNUZIcENH?=
 =?utf-8?B?QzlJRFEySVM0M0JYMU9ESHVzWmh3WXFycmVOUlAwWHVnMHdFZGRFMW9GenJQ?=
 =?utf-8?B?NWdkRmpRU1pBTThub0Zvai9uVVdzUk50ck1pdDJudFZvWDBCaTZ5blJpam1k?=
 =?utf-8?B?T3ZWckl3UVVVRGlXZWNES0NLQ1M5TndEajcvQmZsU0paWkJvNVQzNmU4VmFQ?=
 =?utf-8?B?WmlqRHZmdVhhSE01YXE0RUxMQmtYaTRFSWl2RVNEVU1ZYlpUa1gvK2Vzb2xF?=
 =?utf-8?B?RUFNQkhCL1NnU1JJL1JqaVJTSkZSZGpFWktYa0lpQjFabXpzWjA0cnNqTXFL?=
 =?utf-8?B?N2l3SE5TaTBObWxlMFIrVDVMOEtZLzMraGxzRHI0TXc3clcxUGpWMzFJVWNk?=
 =?utf-8?B?N1k4YytqYXZIQ1ZsTmd0Z25lNlVwek5wQzUrWWQ5ejEyaFNaSlNrMTZadTh3?=
 =?utf-8?B?T1VvZDVzdzYyemNkSFhMWWNjY0JpZjF5dlVHQkdZZVJjaFZiVXFJUTZjM3BZ?=
 =?utf-8?B?NG9TRXBGbkF0amg0L0dzU09hNGV5SDJBb2xleUFLUkdzOXhDV0FlTWt3OStY?=
 =?utf-8?B?TnFMamc0d0h0QTBHMCs4cnJ2bDNSWXVvMFMzKzhncnJoQWtFZ2ZTOExNbUNS?=
 =?utf-8?B?aUxzK0kvRld4c2Q5QWI5K1d3NVpueXZ6V2FXa0ZGeTdhNElQbmNiTDV1MFBV?=
 =?utf-8?B?S0NTYWFtaE9QWlhINDdVZmF5eVAyR0dKbFNqNmJ5QmNCU2N5Ymp0dHBaRC9Q?=
 =?utf-8?B?Vm9oQ2V1ck90V2VSNEtLVzdoZEpMWVdXenNZem5Pa2hGSmZpdXNWMnNrNWt3?=
 =?utf-8?B?M1R0Y0NkdjZHVk5rR0ZzM3RSTy9GR3B4My9aWXV1bHJ5T3JJUVh2S2JnRXFD?=
 =?utf-8?B?Wk1wWHhuRG8rQ0duaG92L3pRSFlnR0xlTjlGTHZZVFJmVjc1aENNTWNRUVNw?=
 =?utf-8?B?blg5anJmVXVxUVUvVFQ5Snl4UXpkZU4zd0JXV05mNW5FaTNWTHkrTmVkTVlp?=
 =?utf-8?B?TDU1ZzFNOE9CdUswTnFuQ3FuUkdmcjIwWENZY2JEWnMrWWttL1NPc0dWM1lL?=
 =?utf-8?Q?LpmMLfdmnUG33YIwuD5gyJ9CKvID40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVZaTJvdmh6Y3doeVlpcy95TFBpTFhIcm5aLzdaeFN4b3FqRWJ0ZGtuNWVj?=
 =?utf-8?B?OENRWm0rdFVkRC91OGZmMEVxQ3RFKzFDZ2xLZzVScHhMZnlFOXNBN1dMYnpP?=
 =?utf-8?B?Z0FiaUZ5eXhkMDBPdE9LSXNIZjJKUlE3OUw3RVQwb09DamljV09FYmVGd0pw?=
 =?utf-8?B?SlA5em0yZVNrOTJFTUVaa1FXdWcxRkdTQkNRclppa2piMFBJQStEK0Y2R0gz?=
 =?utf-8?B?U0NYTGc5ZC95V3cxY09nOXk0TlRWaWxiY1d5SXY2M09laUFCM3JtVmZDSS9v?=
 =?utf-8?B?ZHdEZXBRR0lmc24yMlpGMVRkZEZFcEFpUFBsN0M0bFJLUHNRM3RhMFVJTXdI?=
 =?utf-8?B?TGVjQWs0WWRqOHJHZXV0S2tIZTR1SHNOTlc0c1lXUXk1TysrTW9yUWtUV0Z2?=
 =?utf-8?B?MTlCbzVPb0FFeEd0V053aDQyb2dpdVE1SXZEZ2R1NWczOHREdTM2NDZZNk5K?=
 =?utf-8?B?VFdHZlZRNm0xZnN3MDFQd2EyT1ZnblpwcGhCSkRxWFVLcWVDY2hHTis4cjlu?=
 =?utf-8?B?bEc4K2pMT1M3Sk9QU0ZaaWdhWG1wb3QzZ3IrY0dpaVFPNkNvVGhHei9nQzM2?=
 =?utf-8?B?NC9xTW1Zeklwbm9EczBmV3dwUXNYK1luczJoTzlSTDdJSG5wUHV4OWoraXFU?=
 =?utf-8?B?aEZneXp4bGlkcTh3VmN1WEsyWFhPY3U5dDk2N0hObVo5VGJjYnRsamZ3ME8v?=
 =?utf-8?B?a0VJN1BzeUNuaUphemZSSjB4cVdDcE1JdlRSajJ2bWdyQjVoeEE4ZTJ4bW9U?=
 =?utf-8?B?OTYxUjlDN3hOQXU2cUJkY3ZPZk52c1VFVmk1ZVNXdVVoK2ppQXRsbDJXWUNm?=
 =?utf-8?B?VUZobVFSN0VBdnJqY1UxK1JsdW9PaE5EamZreDdpeEVqd05tV21BZU9VUG1r?=
 =?utf-8?B?bS8wd0hreGttK21FVDN1MVZaamJJNmxNcVZUWkhoUGE1OWZtYzFnWVFZWjk3?=
 =?utf-8?B?NGNvWDFSRlpiQmV5NzF1WFcvc1FXbFJ4ZEpXUEw3Y0h1UzB5TjV1OGpZbmIw?=
 =?utf-8?B?Y1d0ZHR3R3hMNmdFN3ZBdzkrUFRNUmtqQXVqdmJ5SGo1YUZTakwvR09VLzBK?=
 =?utf-8?B?NitmUTZDeCtPYUsydVE4VGFuRkRMUGZZOERaZS8vOFlXcFVqMEwxalBadmQ1?=
 =?utf-8?B?U2FRZ3ZZV1RManBLSlpvNGlnYzBzc0pPMEdDTW5OcCtOUGRqby9GREd3RkN6?=
 =?utf-8?B?YWR3ajVTOGkyUEJLaHQxWFZjUzRrU3M5MnNyMi9SeU1kZndvUUdMMWZxcEYw?=
 =?utf-8?B?ZDJ0d1ZUQmpxUFNBWUFzMktFWmZ6ZG5LR2lkczNISjJXYWFKRkV2Y0d6eFJC?=
 =?utf-8?B?YnVLcCtTNTZqY1MzRDZPcEdIWUduS2FjYW5GOHZCSllxSEhtaDlmZ1R1VUFx?=
 =?utf-8?B?ZGdhQkI0YmkvbE44UHRKdktSVFk2L0tOT3lrMFZZM2swQm1pREpUaXdaaGVE?=
 =?utf-8?B?clRYa3g3YWl0amdPUHpnZUp5OC9LbTFvMHczVklwT2trUk1meFgra2d3Y2ZV?=
 =?utf-8?B?bFRtcHZxdDFUOTVsMnNoYjlOZzRYYmwyYUZKemZTKzhJWnlpRDRsWUVESDFW?=
 =?utf-8?B?OG4xVnV1WXdNYkdXZkZXNkxUK0NadlFTckxHK3h0SGZQbjJweVpkMVhnWkN6?=
 =?utf-8?B?aGNCaFpjOHhvZXArVVZscldmUUVxd2gxTU81WmdoeTVXVWNaeWNaWWtzSTFF?=
 =?utf-8?B?bVZ1TDFWdjZJUXhEenFNWmpiTU81Z0ZuMHR3NFhkaE1yL2RGWjgyY2lhcExa?=
 =?utf-8?B?VnRQRGkvT2JWZXp1aURObXJrbE9MbElqZHdZN0QvNTVoSUtBQlpieE1PUm9C?=
 =?utf-8?B?em41RTJMWjhBYndPcVYzU1RvY0g0a1dLYUloSTd2SThmbncyTmtsQks4Zjhp?=
 =?utf-8?B?djZVK3dGRVMzVGh0MjV1cVJnNCtuRFJjSnNSalFSaXc0SHBPUXNQY1pLcEJJ?=
 =?utf-8?B?YnVCSEhSNEV6eFJuY0hIdVhNblRxOUEzM1hWUXY5V0JzNkN4c2tKa1dDTnZP?=
 =?utf-8?B?V0hOQXZkLzhIdjQyaUN3V1pEbmRaNGUvblBsUkVYaEp6NnJKSTY0QTY0T2Qv?=
 =?utf-8?B?azl5UHIvUUtSWGJaWGFhamVVQzhMTGUrOEZDSWdoU1ZocFlQSWNHM1R4dDZI?=
 =?utf-8?B?bmpCRnBuTGtBUWwxZTVuN05qUTFoc0sxUGVPbXNiUFIrbmpTY2JYY1k2S09N?=
 =?utf-8?Q?hiVKbAZ0Mz2D+9JojcIwCz/I1nB8ADjo/FcrSIFRIp2e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4043fa-4674-48bd-7f4d-08ddea2d7abc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:01.5428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UWpgHxf7B1dT44IJ71KMiQzGDZDGaWtSG/g8ZO40rhf1o8Z//4Gof35PkmeU92vsm1w5BcLYc4D2hRel/f0qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

This series makes more progress on the GSP boot process for Ampere GPUs.

At the end of the previous series [1], we were left with a WPR memory
region created by the FRTS firmware, but still far from the GSP running.
This series brings us closer to that goal by preparing 2 new firmware
packages:

* The Booter firmware, which the driver loads and runs on the SEC2
  falcon;
* The GSP bootloader, which is loaded by Booter onto the GSP RISC-V
  core;
* The GSP firmware itself, which is verified and loaded by the GSP
  bootloader.

There 3 firmwares are involved in a rather complex dance that is made
necessary by limitations related to the level of privilege required to
load code onto the GSP (doing so requires a Heavy Secured signed
firmware, which is the role fulfilled by Booter).

The first 5 patches do some cleanup and preparatory work for the
remainder of the series. Notably, the GSP boot is moved to a new method
of `Gpu` that is called after the `Gpu` object is created. We also
simplify chipset name generation a bit and move the code requesting a
firmware file into a dedicated function in prevision of the removal of
the `Firmware` structure.

Patch 6 parses the Booter firmware file, queries the hardware for the
right signature to use, and patch it into the firmware blob. This makes
Booter ready to load and run.

Patches 7 and 8 prepare the GSP firmware and its bootloader, and keep
them into a single structure as they are closely related.

Patches 9 and 10 switch to the 570.144 firmware and introduce the layout
for its bindings. The raw bindings are stored in a private module, and
abstracted by the parent module as needed. This allows consumer
modules to access a safer/nicer form of the bindings than the raw one,
and also makes it easier to switch to a different (and potentially
incompatible) firmware version in the future.

570.144 has been picked because it is the latest firmware currently in
linux-firmware, but as development progresses the plan is to switch to a
newer one that is designed with the constraint of upstream in mind. So
support for 570.144 will be dropped in the future. Support for multiple
firmware versions is not considered at the moment: there is no immediate
need for it as the driver is still unstable, and we can think about this
point once we approach stability (and have better visibility about the
shape of the firmware at that point).

The last patch introduces the first bindings and uses them to compute
more framebuffer layout information needed for booting the GSP. A
separate patch series will pick up from there to use this information
and finally run these firmware blobs.

The base of this series is today's nova-next, but there a few more
unmerged dependencies required:

- BorrowedPage, AsPageIter and VmallocPageIter [2]
- Rust infrastructure for sg_table and scatterlist [3]
- The Alignment series [4]

A tree with all these dependencies and the patches of this series is
available at [5].

[1] https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/20250820145434.94745-1-dakr@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20250825132539.122412-1-dakr@kernel.org/
[4] https://lore.kernel.org/rust-for-linux/20250821-num-v4-0-1f3a425d7244@nvidia.com/
[5] https://github.com/Gnurou/linux/tree/b4/nova_firmware

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v3:
- Move the GSP boot process out of the Gpu constructor.
- Get rid of the `Firmware` struct and discard loaded firmware blobs
  after the GSP is booted.
- Consolidate the GSP firmware, bootloader and signatures into a single
  type.
- Make firmware bindings completely opaque to the driver.
- Improve firmware abstractions related to framebuffer carveout.
- Improve comments and naming throughout the series. (thanks John!)
- Use alias for bindings module in `nvfw` to avoid repeated version
  numbers everywhere. (thanks John!)
- Fix inconsistency in naming of members of Booter header. (thanks
  Timur!)
- Link to v2: https://lore.kernel.org/r/20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com

Changes in v2:
- Add some GSP bindings and use them to compute more FB layout info
  needed to boot GSP,
- Use PinInit in GspFirmware to avoid several heap allocations,
- Rename `bootloader` to `gsp_bootloader` in `Firmware` to avoid
  confusion with the future Turing falcon bootloader,
- Link to v1: https://lore.kernel.org/r/20250822-nova_firmware-v1-0-ff5633679460@nvidia.com

---
Alexandre Courbot (10):
      gpu: nova-core: require `Send` on `FalconEngine` and `FalconHal`
      gpu: nova-core: move GSP boot code out of `Gpu` constructor
      gpu: nova-core: add Chipset::name() method
      gpu: nova-core: firmware: move firmware request code into a function
      gpu: nova-core: firmware: add support for common firmware header
      gpu: nova-core: firmware: process Booter and patch its signature
      gpu: nova-core: firmware: process and prepare the GSP firmware
      gpu: nova-core: firmware: process the GSP bootloader
      gpu: nova-core: firmware: use 570.144 firmware
      gpu: nova-core: compute layout of more framebuffer regions required for GSP

Alistair Popple (1):
      gpu: nova-core: Add base files for r570.144 firmware bindings

 Documentation/gpu/nova/core/todo.rst            |  17 --
 drivers/gpu/nova-core/driver.rs                 |  10 +-
 drivers/gpu/nova-core/falcon.rs                 |   6 +-
 drivers/gpu/nova-core/falcon/hal.rs             |   2 +-
 drivers/gpu/nova-core/fb.rs                     |  64 +++-
 drivers/gpu/nova-core/fb/hal.rs                 |   4 +
 drivers/gpu/nova-core/fb/hal/ga100.rs           |   5 +
 drivers/gpu/nova-core/fb/hal/ga102.rs           |  10 +
 drivers/gpu/nova-core/fb/hal/tu102.rs           |  11 +
 drivers/gpu/nova-core/firmware.rs               | 107 +++++--
 drivers/gpu/nova-core/firmware/booter.rs        | 375 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware/gsp.rs           | 244 +++++++++++++++
 drivers/gpu/nova-core/firmware/riscv.rs         |  89 ++++++
 drivers/gpu/nova-core/gpu.rs                    |  87 ++++--
 drivers/gpu/nova-core/gsp.rs                    |   7 +
 drivers/gpu/nova-core/nova_core.rs              |   2 +
 drivers/gpu/nova-core/nvfw.rs                   |  92 ++++++
 drivers/gpu/nova-core/nvfw/r570_144.rs          |  28 ++
 drivers/gpu/nova-core/nvfw/r570_144_bindings.rs | 126 ++++++++
 drivers/gpu/nova-core/util.rs                   |  20 --
 20 files changed, 1209 insertions(+), 97 deletions(-)
---
base-commit: 331c24e6ce814af2af74bac648d1ac1708873e9c
change-id: 20250822-nova_firmware-e0ffb492ba35
prerequisite-message-id: <20250820145434.94745-1-dakr@kernel.org>
prerequisite-patch-id: 0e1b1f9a665317ff569a37df6ff49cd1880b04f8
prerequisite-patch-id: 178b864e6d1b88ee299dcc05d1a7a4c89ec7ed51
prerequisite-patch-id: 7f72c4bfd0e5f50b6d2f8ce96751782894a3ba81
prerequisite-patch-id: 62fa6de7d3ae99dc54c092087bd716e6749545fd
prerequisite-patch-id: 3d14d56ca93b0831837aa26b802100a250adeac6
prerequisite-patch-id: 7a12f4b0e7588874ce589b41b70671dc261b9468
prerequisite-patch-id: c44763ec35c4e4431e769df088b98424cbddf7df
prerequisite-message-id: <20250825132539.122412-1-dakr@kernel.org>
prerequisite-patch-id: a9e008c179b1c2fbe76654a191e5018880383d49
prerequisite-patch-id: 363279599349e5efc7069a63b3f0574639e25418
prerequisite-patch-id: 4dd34d858514b7b982f4ebc85103a756205c3219
prerequisite-patch-id: a747e05834cdb8b8f727e1f7c8b110c636cadab8
prerequisite-patch-id: 24833689bdecd3fc7a604e13bfe203ccd2fca6f0
prerequisite-message-id: <20250824213134.27079-1-christiansantoslima21@gmail.com>
prerequisite-patch-id: 3ddaa5300963f6c069411c6431965a7a48107a8b
prerequisite-change-id: 20250620-num-9420281c02c7:v4
prerequisite-patch-id: 50077433250cad1cf60eb8f85c78e532ac91852e
prerequisite-patch-id: 021a41cd35f09790ec383521ecc9b4c167868732
prerequisite-patch-id: a1ec5698a198d4aad45432b50d42f401e3db6452
prerequisite-patch-id: 8565b054c432bcc9a3a0d0121a934c74ef36d535
prerequisite-patch-id: 19d008deabb88beb441d2398f120ecb426fbdb43
prerequisite-patch-id: 3bc0d2be065a900d224ff8c1bc4450abfe9eb2cc
prerequisite-patch-id: 5b4eb0f71fa2ccf662594819fa79fd932f4f164f
prerequisite-patch-id: 9058ca08cd149444b5f910e4bb4494a890d1a733
prerequisite-patch-id: 8804806f7cc605feddded0804eec8b8362d7b965
prerequisite-patch-id: f999cabde51824432a1bf60817518d1ce189eb76
prerequisite-patch-id: 49e15538e142f2e7dd4f1ba0cf2fd891bd265d36
prerequisite-patch-id: 2ecf9b1e26b5203065bfac4ccf74301b3bb4fbe6
prerequisite-patch-id: 1af6ec7c2ce8503fe476985f59949dcd150ee6bf
prerequisite-patch-id: ac72e72b3affece504bff76b60b88769ff200a2f
prerequisite-patch-id: 7dc0a6da8c9727d27250cf730f8aaf6dd8b3d8c7
prerequisite-patch-id: 31a0a2469de9ac965186098072753dcc749b40fe
prerequisite-patch-id: 7e6d1fc7cf910decf481d135a19b0add38da2b2a
prerequisite-patch-id: c72ab11e9346de71eabfe0e6466636d5ab15a5ba
prerequisite-patch-id: 3f236fdea8c4b33620d0f863fea573b46ab0ded6
prerequisite-patch-id: a8ab42d0c9c3c837bb4cacb02cef585ef163a27e
prerequisite-patch-id: 930a1f26364ed67e0d6b85c96251028fda43c80a
prerequisite-patch-id: f1bc1fd46145a66235ab7475463584e1803882a3
prerequisite-patch-id: 4a2fd7bd8d13dc2feaf68e0dc681546ce2ab3e40
prerequisite-patch-id: dd0df8d299dc0615a88cc0019f38bc09cee31ed7
prerequisite-patch-id: 56a45978f7b956c94ec66eecd4b438706d5174ce
prerequisite-patch-id: e9bceff31bbf653d2641194b97eb1c4e5d8b93ee

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

