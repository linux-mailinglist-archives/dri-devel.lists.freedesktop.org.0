Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C2AAD372
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 04:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821CA10E35C;
	Wed,  7 May 2025 02:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iL9XvYk0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A2610E35C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 02:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746585744; x=1778121744;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jWHjqygjRLdPdFDiQ3swacwcJEwbuvtPFyG47WlhLms=;
 b=iL9XvYk0VQNB3JNCCO++PTG4A/p0e+4h/xidSx1xiFQ9mB7cN5ByI8kI
 4tiLSS39beUn/Nk4w6AZW15Mtt2a8ZkoFaInUMdmOAXF0VVjVawHtrHb8
 suAXGAV1E9/b/KDF0gbEH74t28SdNY9YJz+CKtBwmyF5KpiwKyxnRlMcr
 HQR9iola91lSqNTZ8U4Bjg32q9A6RSEVmAUawCYMF4rkwc9694UhmczXd
 TWTCeDWYIdrDZ5GPPzrJJfJTetNgIlnGZ3F+8KvmLIqiyTbAkPOYR08Cl
 NH5CTlbFEiHwOgDqJbCjc3O+TFKJx1OPPLmWkoDl+Q8LefahvCbO1Tv0C Q==;
X-CSE-ConnectionGUID: TStBpffGSfauACxSVZ450A==
X-CSE-MsgGUID: /uAb4gdFQQOBQP+s0DChuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58948965"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58948965"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 19:42:24 -0700
X-CSE-ConnectionGUID: rJ6LDg40QniLbTQgLzExXg==
X-CSE-MsgGUID: V99CDPSdRFO3L3DIH0TweQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="173004198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 19:42:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 19:42:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 19:42:23 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 19:42:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zbk+fEspj2VXIwoQj0BiLg5V0T7cXRGtQWmEPcKQ4P1dPt0LKZBjCIM72Abrf2XkvZgKjsxCtAvsYMRmC//JwBGWdeiYRWwhWLnbS3Mwvr851y8mtKuXupsSzJIJBV3nAPHx2N28Wra92808oqYtUKt/eGuSD+5OLptItdqXZAxeFfTDrORCIVbqAv+bKldAnqm+FmhrqV6ugsydJxs9ext7/ulDPhkNBXyxxFpcc2tj+fnTi7c+gRczXdUxioKR5oDHpFMrIxoF7IJGSqr+9BNlRIYcsAsqHxWhnBqpJeix7zBCzFftocTP+m5/MI9Du7jbKhNklymUuBhBd0b0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWHjqygjRLdPdFDiQ3swacwcJEwbuvtPFyG47WlhLms=;
 b=YXocdQGE7MNogvfCm8i7DM79EOybPv3y6RxI64uG2orIna9onaDfjCTHJgCSVuIewPDi0l8GIoy6yKCE7NON7ItPqAL9VXxWdAj66O/ItR+j/szQOmlzcDazKmDG7HlLE6thstBRzNd9vcMmaQ0wVRy9Isx6eOyUpKh9RmBmafeMlP1DY6J+5CXsfpPrl1gNSWZmob2ra6Rwg6dzdj4F1DI6RQxS24Z5OyReEW5QBSp/DwiuRgOynx3+aZZTtFMJcNAVZzkdEf1wpD0Vgdu1YO/G9hMZOCtiJqaC/pUEBLtW2hWCNmSLTUfwOVXUk5Pu/3IG8mml1cT87NCjHEuZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by LV8PR11MB8678.namprd11.prod.outlook.com (2603:10b6:408:20b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 02:41:37 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 02:41:37 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>
CC: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Gurchetan
 Singh" <gurchetansingh@chromium.org>, Robin Murphy <robin.murphy@arm.com>
Subject: RE: [PATCH 2/3] udmabuf: use sgtable-based scatterlist wrappers
Thread-Topic: [PATCH 2/3] udmabuf: use sgtable-based scatterlist wrappers
Thread-Index: AQHbvqH0TJC/Bbiw9U+jgn/deJ50fbPF6g4Q
Date: Wed, 7 May 2025 02:41:36 +0000
Message-ID: <IA0PR11MB7185CA4A3048AE68B1BBE00CF888A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250506161346.1211105-1-m.szyprowski@samsung.com>
 <CGME20250506161421eucas1p1e51a0891fe56863c1e927609b842d6de@eucas1p1.samsung.com>
 <20250506161346.1211105-3-m.szyprowski@samsung.com>
In-Reply-To: <20250506161346.1211105-3-m.szyprowski@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|LV8PR11MB8678:EE_
x-ms-office365-filtering-correlation-id: 70bfc1d8-4f8e-404a-f59a-08dd8d10b01d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VGNHOHlWQkFhbXJtZklpQUpabm5TdHVTRmRiTmhiMFNmRlJ2c0pVd0FzYUxi?=
 =?utf-8?B?ZlNNa1c4bHk0YURYaE0zbXdINi9idGNPYkh0V0JkdXVzNVYwMk1LQ09CT0J2?=
 =?utf-8?B?MndmZ2pPN2ZGTHB6bmM3UE5vQm9lUkxQWEs4SHNSeHJLRlE0K0pteFgyVExs?=
 =?utf-8?B?SDJYeXJhdEwrSk13bFdIUDI3Z1hXVFM2M0RteFBFc1Fka3FqNUw0M3RYM0xL?=
 =?utf-8?B?eXFhMS9KSWl1TmlOcGhtdVFRaFdzWmxJTWJOL2dlTURNcCtHYnd3RnZmWnM1?=
 =?utf-8?B?aVF0cmxjM09UaE5zWXJ3bkFDUXJkRXFZVHBaU1ZNaE93emdQS3preEVOQkNU?=
 =?utf-8?B?VlB2UnRzSHhjY25TU0dIMU5NNDJHdEZkcXQ0TlBJdHNUOVMzN3NBbUpyOXI2?=
 =?utf-8?B?S1dEVzF3UXNXcnY0Y0FXVnNrcU9YcS83V2NPSm5DcERjVll1QUlKMmpNZTVa?=
 =?utf-8?B?VmtsWWRtZnk5aWIrZ1ZqRWl5V0pZVEZ5a2E1RE5RWmI3VWJ2ejd3T0FFK1pp?=
 =?utf-8?B?V2lrY3JSNnlpOGJQN0ZNdW91enVQRFZQcGNZWTN6UjliczAyeG5NUURjOGpM?=
 =?utf-8?B?N1M4dDBac2NXUWZBanRlS1VvVkJOUzVyUTlCMDgvbUFUUXJQUEdnSERsSURM?=
 =?utf-8?B?QytYSGNYUk9QNm1sa29uU0xENmtVMnBTbnhmQXZPL0xaWmFZMXB3enc4Yml5?=
 =?utf-8?B?OTF5K2pGV3NMZk9DaGNnUW5QQlEvRDFIYWFFQjh3M3VkL0lJdDI4S2Jodngw?=
 =?utf-8?B?b3NkVVBrUStFbGhqcFN0ZEt3cFp4QmsrU0I1Q1pXOUdFOFQ2UE5TTkRhejFR?=
 =?utf-8?B?cURieWhHYzVERVFJY1V5dnYvTW9zdFVKZDQxaDYyWC9EWGcvbXFGQUJ6WWd3?=
 =?utf-8?B?VllvMkZ5M3M4czV4djlPMWthL3FBSklGSFJCcSt5anBCeWZmTVRMckFmZTNI?=
 =?utf-8?B?czVGd3Z4VjZPYXk2VURKbnlRWUo3aHVEUzI0WmUxK3dCZ0NRUk44a1R1b29u?=
 =?utf-8?B?cVVSc1NjY1BUbnhKamlnMDVUQ0lxS2xyTXQzeGZIZVZDcVRXblhsdkF3M05t?=
 =?utf-8?B?MHd0bFFPMW16YWF2dFVJYVhLb0Zub09OdlVkK1dMT3FZMTlNeTRNbFlQYThj?=
 =?utf-8?B?UUVaVE10eTUzdlhsR0RFNEVRVnRmZ2xHSTU1WWNCQlRaTTQvVU90dWVvc0Qv?=
 =?utf-8?B?akJZdThwTnNvRm5aaXJjb0pCMlprQjlTcUNvQ2M1SlVoZkZiejFOUHdvUmti?=
 =?utf-8?B?czhtWlJpVUFYd09CdnpZbjY3UWVMVkJtek84QSt3RlQzN1RPajEvMVFvNlA4?=
 =?utf-8?B?YVBndytYUWd5SVdhaU4vSEV2aW1uSEdrZzdibWQ4MXFrakRsZzdmVm1NbGQy?=
 =?utf-8?B?VFoyN2ZuS1QrN3o1RmxQN2ZwR1VSSE5aZzRwZHBLRHhYd1ArYjNQRnRLZUtx?=
 =?utf-8?B?Ymw5bWJ6WXEyUnNxQ2V6TVNkMVlNbGdYUDByS3pOdkZaQlNaQStsSG9wanVB?=
 =?utf-8?B?TjREZkNRQzlQd29uYnYrcUZpaFV5OUQ1bXZyL1djdXFsTFcxbWZsSG1xY2Yv?=
 =?utf-8?B?bXVKY0hXdm1KaTRINkJKWitQT2ZSaVlzRU5SajU5N1BnaHBCSnZsZmxTaWh4?=
 =?utf-8?B?MzBNNFdqUDkveHorWnJsNFFodDBmYUd5RE51QTh4Rno2UGxMMXN0YmVzNW9n?=
 =?utf-8?B?NkNJZ09pUi9qck9CNG5YOWo1TVFlNW9jejM5UW4xNExjeDE5Z2lzVllTVnN4?=
 =?utf-8?B?eGZFdWJ4aHFuMG5pZzYrVllkY1NHMFVqejlpVVhqNjh1TXhuVGJhQmxMRnJv?=
 =?utf-8?B?ZENhUWhTcURhbHVXa2RNZDVxbE0yTExsTGIwTW5XV3M3RHBxMVdiMSs5SkRu?=
 =?utf-8?B?Y1dQRGZ0NFJIWjVybEZiM0lyNU5PWU5rWmY1c3FIWlJSclU2NlVvQjMzUW9p?=
 =?utf-8?B?S2NPaFFFTW5WYThsUHBvTDZ3Vy9aelZ3SEJXZDUzNjJHdkZqSmQyUjk0amVo?=
 =?utf-8?Q?YK10o2AlRvsLVWIP6iPHLcXYKWA4Qw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXUrMVE2V284UEdML3I2QkU5cjdBbzJ5QTJXczJmZzl2Z1RaaVZWYStPb2FD?=
 =?utf-8?B?UDFjNjR6dEN6OVlReDNMWEMwSFZtNGhBUWpxUHZnL0tMMEM3UVdaUzgxNjd4?=
 =?utf-8?B?KzM5dDg2cjBxdURFRHl1dGtKZmJzWFZPN0JQNG5iK2d1WHlBbVMvY2VFZUd6?=
 =?utf-8?B?bXJGZlpqaHI1M1FZVlFRRktHWGppNHJwNGwyTnJyQ1ZqOUFPTnNTN3g0b1l2?=
 =?utf-8?B?bUE3a0JWRDZ2b0F6dVJVRjZIWXFQVlBXRjBSRlcwR1NvQklIY2dxRWVsMGJs?=
 =?utf-8?B?cmFLOUc5R3JpQmt5M3ZXN210TnFPRCt6SmRBTHdVVXhYZ0p6a0RPeEJMd01J?=
 =?utf-8?B?Z2gzRGNoU3JwSk1wVndtVEsyL2JGWWpjUmVFTTZYSm1KOUx4NzhGVjZNL25O?=
 =?utf-8?B?bW9PTnZGOElwNHIxT0xBTmQxek5TSUw2aUlOaGM4akFqbDRRQmJ6dlB3a3ph?=
 =?utf-8?B?T2g5bHlCTzRPamMvWXdJUldTbndmdUtxNzZGUjhod3NtRHNVNG5rSkVDNk8w?=
 =?utf-8?B?djZxVmV1bWs0U2haWmVETkRqVFpDbUY5ei84dE9LYjVPMCtwRlRlcng1STA5?=
 =?utf-8?B?Y2NHR3BQNXcxSXc0bWxBK2VzWGFtSSsvQ29uS2U5bVdkbUlsYTRzUEZwMHph?=
 =?utf-8?B?aEtkcllTY0thWXlCemMvSGtvaWY0dFdMaWNGcnJBOUFtNmpSTG5JT3pNYzZR?=
 =?utf-8?B?THFxazRSeHFVcTNXekVnVC9HZGhuOXVicnJyYkdMbzZFNEFHbUN6bzZIMkZJ?=
 =?utf-8?B?UmZGcVNTOVpGaWtqWHZoTkhRQ2JiZnQ0b1oybmlxUmdzd25yRGNRa3hhZzVP?=
 =?utf-8?B?ejAzTzRhQUpWUnQwMGtTb3pPVlB3d25KZHBJWHExcFNqeEtYU0xhaDRMcTV1?=
 =?utf-8?B?VkRHNVYyc0o3QmtyMkN0ak5qVjZ5VVBpdi9mZTVMaENpMkwveG0vdlhLUVVt?=
 =?utf-8?B?dllIVmxtMUZSY2hxSUZtTjFDbkRKYWR1czRwQS9qUHNjS05FcVdMdWlvdWQr?=
 =?utf-8?B?MGRDb25IdnZ0YlQ2TmlvM1ExeVpWUFpIWG5tSWczSXFEVlo0K0svQnFWdEVy?=
 =?utf-8?B?Y2hGY0JTeDlQSTY5bVdHdk1EaFdhMndTRGRkaHdWKzd5REVqbytmTE9rejRI?=
 =?utf-8?B?c1daaXdyQnQrTjR1V2RNU3VBT3JXZzZ2dDhoc0N4YWo0d1B3VmdTT2h2NHFq?=
 =?utf-8?B?VlB3ck5jOUgwM0c2T0pIVEpDWVkwQ1RuRkp5SmdPMXNiRFErMUVITXFKa3o0?=
 =?utf-8?B?bnJHemMxTEVndmo4aTRmK1R2MFo5UEZWNnVDdk5MYjE4LzV0THNBY1lRalBE?=
 =?utf-8?B?V0psVGdaREd2OFBVaG1BbEFjUjUwY2RTVEo5VUszT3QrSTd2NVRrdFU0TldM?=
 =?utf-8?B?QVhFUElqeGFFaFVteU5DeklERmkyOGF3cDJuUDM5TG5uR2p4UXZaL253QTl0?=
 =?utf-8?B?RHZxTW1KbDV4S1p3a2kwUEJycHZzZDUrbjV6TytqQkF4MkhQZE5HQmpoOVB3?=
 =?utf-8?B?WHk2NmorSFV6WldIM0M3Q2h3dEJBY0ZleFhDcHZ6ck5HZm1QNGllM2o4OE1t?=
 =?utf-8?B?MXltcWFUTTYwL1M5NGxKSDFwS0lONkVRTzJqUXFOaEJndUpCOW5wQysyQlhK?=
 =?utf-8?B?MTMxMk5rRFhGSWsrMSt1MDU0RnhONnJEMFVFMDF0b2piQjArUlZyK3NKTXRQ?=
 =?utf-8?B?VFF2d3o3SEJSSW8rY0ZpblQyNnY1NllIQ2UvTEpsczdiQnZyQzVieDJJekdk?=
 =?utf-8?B?clErY0FJMUw0d1BBdXF3U1l2dURCZDRxV1hpdFQrYklSZkkzQTF5bGcxcHpX?=
 =?utf-8?B?OEtBZzJFQTkvVTFCcDB6REszd1FpL1hOeGphcXMxMzJqaXBYZ1VCUVlHb3Rh?=
 =?utf-8?B?Q3lZTDRmaDVYRy9DcGZWZ1dqUithZHpqQVZ4WWp4ZFNWMitRTnQ0VE1PNG9i?=
 =?utf-8?B?Qm9OcVNQRVlFMHVOdVB0Z3R5dFpXSEhjcDJRNGNLNXAzRmZXVkxaK3JrVkVp?=
 =?utf-8?B?ZEljcUZ6MC9RSFN5cHgvQzhkbnN3dGFjbzZIVFVJUHVKcmlFM3FLcnRmNG9B?=
 =?utf-8?B?akZndzBaN2ZHNnl1RE5LY21VNVdHVHlGK09MVmpNVzNzcE9nYzNzSXpiZUsy?=
 =?utf-8?Q?P4mbDRXlCJDefpHC6nDz5fA5J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70bfc1d8-4f8e-404a-f59a-08dd8d10b01d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 02:41:37.0143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l0OyFRmV70BmM5WOyrF/mmoqs6CPVo4kUN0G/RNVvvPk5HX0h4AQcmgPrQQMNTVFDnF4oMVRGr+DxOqk7AOXln6M4UaddQnFbts/Wdfr5m8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8678
X-OriginatorOrg: intel.com
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

PiBTdWJqZWN0OiBbUEFUQ0ggMi8zXSB1ZG1hYnVmOiB1c2Ugc2d0YWJsZS1iYXNlZCBzY2F0dGVy
bGlzdCB3cmFwcGVycw0KPiANCj4gVXNlIGNvbW1vbiB3cmFwcGVycyBvcGVyYXRpbmcgZGlyZWN0
bHkgb24gdGhlIHN0cnVjdCBzZ190YWJsZSBvYmplY3RzIHRvDQo+IGZpeCBpbmNvcnJlY3QgdXNl
IG9mIHN0YXR0ZXJsaXN0cyBzeW5jIGNhbGxzLiBkbWFfc3luY19zZ19mb3JfKigpDQo+IGZ1bmN0
aW9ucyBoYXZlIHRvIGJlIGNhbGxlZCB3aXRoIHRoZSBudW1iZXIgb2YgZWxlbWVudHMgb3JpZ2lu
YWxseSBwYXNzZWQNCj4gdG8gZG1hX21hcF9zZ18qKCkgZnVuY3Rpb24sIG5vdCB0aGUgb25lIHJl
dHVybmVkIGluIHNndGFibGUncyBuZW50cy4NCj4gDQo+IEZpeGVzOiAxZmZlMDk1OTAxMjEgKCJ1
ZG1hYnVmOiBmaXggZG1hLWJ1ZiBjcHUgYWNjZXNzIikNCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsg
U3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
ZG1hLWJ1Zi91ZG1hYnVmLmMgfCA1ICsrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi91ZG1hYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jDQo+IGluZGV4IDdlZWUzZWI0
N2E4ZS4uYzlkMGM2OGQyZmNiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1
Zi5jDQo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMNCj4gQEAgLTI2NCw4ICsyNjQs
NyBAQCBzdGF0aWMgaW50IGJlZ2luX2NwdV91ZG1hYnVmKHN0cnVjdCBkbWFfYnVmICpidWYsDQo+
ICAJCQl1YnVmLT5zZyA9IE5VTEw7DQo+ICAJCX0NCj4gIAl9IGVsc2Ugew0KPiAtCQlkbWFfc3lu
Y19zZ19mb3JfY3B1KGRldiwgdWJ1Zi0+c2ctPnNnbCwgdWJ1Zi0+c2ctPm5lbnRzLA0KPiAtCQkJ
CSAgICBkaXJlY3Rpb24pOw0KPiArCQlkbWFfc3luY19zZ3RhYmxlX2Zvcl9jcHUoZGV2LCB1YnVm
LT5zZywgZGlyZWN0aW9uKTsNCj4gIAl9DQo+IA0KPiAgCXJldHVybiByZXQ7DQo+IEBAIC0yODAs
NyArMjc5LDcgQEAgc3RhdGljIGludCBlbmRfY3B1X3VkbWFidWYoc3RydWN0IGRtYV9idWYgKmJ1
ZiwNCj4gIAlpZiAoIXVidWYtPnNnKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gDQo+IC0JZG1h
X3N5bmNfc2dfZm9yX2RldmljZShkZXYsIHVidWYtPnNnLT5zZ2wsIHVidWYtPnNnLT5uZW50cywN
Cj4gZGlyZWN0aW9uKTsNCj4gKwlkbWFfc3luY19zZ3RhYmxlX2Zvcl9kZXZpY2UoZGV2LCB1YnVm
LT5zZywgZGlyZWN0aW9uKTsNCkFja2VkLWJ5OiBWaXZlayBLYXNpcmVkZHkgPHZpdmVrLmthc2ly
ZWRkeUBpbnRlbC5jb20+DQoNClRoYW5rcywNClZpdmVrDQoNCj4gIAlyZXR1cm4gMDsNCj4gIH0N
Cj4gDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
