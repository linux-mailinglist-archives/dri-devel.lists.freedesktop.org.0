Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9E89DA253
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 07:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EF410E07E;
	Wed, 27 Nov 2024 06:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fH7CZKkF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2409F10E07E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 06:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732689032; x=1764225032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+8gPBH1u2DNx5ua99orLh+8ZtCq9nVqQ8lM+CajVV3s=;
 b=fH7CZKkFqh1WdYLa+cfBEqc6wb5c/J06wRqGbzr7b0LTZtXwZAQQrTn1
 ROKx5uHU853sSWF8beJbQjKSUsjPBz9LLVALbsyv+yUz2ovDl9GKnv+dI
 PglswfjcYTHouHkjDvH2of+ZaMeO/WRgMtxIXcC3XzB4T51KeWMeUQBtn
 fIObGVNd4xgHx9njD5MtZKyt7Zkf674OwIQXCm9efEfNY/AdW9eq4drHF
 z+776NeGY9ABlXpNMD/Hfq5OdaBVr1AbTfaDEDahbhGz1F+ICGLOPjyxY
 rMYqyiLGT5+nD2QjgqgA5/IqfPLQjBXzXGKAY1Ye+qAtlmSd1Nke5BeKb A==;
X-CSE-ConnectionGUID: kjJbprNXSc6LefvoFoVBMw==
X-CSE-MsgGUID: 5C7ynpgIRxyRUgEF+5NQkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33008162"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="33008162"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 22:30:31 -0800
X-CSE-ConnectionGUID: HvHfFQ6yQDqQsCs5f0yvcQ==
X-CSE-MsgGUID: s1FW31THT/y2wx7t1oxahA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; d="scan'208";a="92664449"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 22:30:32 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 22:30:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 22:30:30 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 22:30:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PdMG16E+LZin9vhxlBNuDzFDuzd75QmLE3gSHug31h/7srulJ/MmM5HPueXldLXmK8I+IqUEgCCQf14Ke3jcSYUylUEjsp2cNTHnrHY2IbAWLHCSuOh49PLvpEjZkh2hHQrUIcna5RvTnf/PGO1OJTxsMalfoWkWi31yHwDhxYzkn3VmzO1gB9G/oicz5tAh7fjFO7vuTss6Sbx1veX6g+R5LbFpKhpg9yLX3NaNB8w73TqSbsDuyfSyMea4KASc2O5xPG/YVMGZdTe8iBZtX053bQYJpXQIG+j/xQRz09CPHiR14/6x86UwAym7lxWNpkmT7hHrOuFbC3WMkXXi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+8gPBH1u2DNx5ua99orLh+8ZtCq9nVqQ8lM+CajVV3s=;
 b=GR9K4NaOhOAjMveX0W1zjjKLN6rXtk1ldd0/NDyjS99XOj8r1Xoq4sRK6t02LlszjD/v24SwRjUXarWScSESjeVr9EWB7H3VeM056Ah/mLqk6N41EECAftlevSGWAX2iOuaS8aZMcKc3yhvcG63ANhI9pFOgq8m4wSek32S6gQXDwjjiuvgc/fSF1CvMb4Ej4QMr8swJn/KwsDI/jIAb8JRMhkk0MaCkPp589rIP5DI527qMrg3B1XmGt+CX6SEQiu7AmV7lSNiD+cFwV6nXED/76DRV/sJ/o6GVXiphvO0E28XD8ysx93LyavGiZgAPTd+K8EfMhi94rH9QQKnj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CY8PR11MB7800.namprd11.prod.outlook.com (2603:10b6:930:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Wed, 27 Nov
 2024 06:30:28 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 06:30:28 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Christian Koenig <christian.koenig@amd.com>, 
 Rob Clark <robdclark@gmail.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v5 0/5] drm/virtio: Import scanout buffers from other
 devices
Thread-Topic: [PATCH v5 0/5] drm/virtio: Import scanout buffers from other
 devices
Thread-Index: AQHbP7TcEOTi8ReBgkC0tG4OnxCM8rLJZf6AgAEJ7EA=
Date: Wed, 27 Nov 2024 06:30:28 +0000
Message-ID: <IA0PR11MB7185DFC580227B5B7164BED8F8282@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
 <658bff3c-2cda-4a8a-94fb-9a1737d71d68@collabora.com>
In-Reply-To: <658bff3c-2cda-4a8a-94fb-9a1737d71d68@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CY8PR11MB7800:EE_
x-ms-office365-filtering-correlation-id: bd487ed5-3d0a-48f0-743d-08dd0eacfc14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K3RsSENPVlEzbjdjeDQ1YjBha0h5d2hvRmtqcEZQb01UMC9USEllQytFVTVF?=
 =?utf-8?B?RXNIMFdTWElscXRBaTZCTTJVeTZ0TE9HN3VmWWNUQXZtRG1UV3d1TWVTYjg2?=
 =?utf-8?B?bFRoWlIvZmkrNFBQdjRXd3c1bzVwTE9KUk5RdDJIS2VwYklYQlBqQ1FVN3Fr?=
 =?utf-8?B?WmVjL1p2cGNIakhJUERCUTVsTVFReFRjL3VvQkdTc00xa0tMUmdGdHFDTzJu?=
 =?utf-8?B?MDUrem9zYldpbEplZCtvQnZRL1VyN0toTlU4NXhsUENhZmtlazV0RTNQZ2dV?=
 =?utf-8?B?cC9GTlVnQVd0TTVpMW5rNWF0MmFPbS9hNXFzMzRTbVo2RHphZkhoaU1TNmJY?=
 =?utf-8?B?cG42Ti9FaFU2UExOOVlOSE8zb0tKMlMrM1JCTjdtTzM1QzRyZ1ZiU3hnQlN2?=
 =?utf-8?B?QlVSWnlpM2JPcGZBd2hQZituM3R3cklKQ0V6T2xob0hrSDdKUFJQTUhtR3F3?=
 =?utf-8?B?NDkzdTdJVFoxalhDT3NQa3A3NXpZZzhtTDAxQ1lnNEhTeW9uVENLcUJhYlJU?=
 =?utf-8?B?ZElHR2FMWjFuemIvYmNLaFQ3U0hPYXJBb21ySFJ5MW5ISjUvUzFWOUQvTy9J?=
 =?utf-8?B?N0NOVzNETWZ2SmNHNUdpbkFPZVVySWZJdThEZitlY2I1Y3FaV05FYlBydW96?=
 =?utf-8?B?MFRwOGJHOTNYTzVzcGUyMzE5U1pDNXFwQkFRbVFlS1NnQU5Ud1BxUEFUUGpC?=
 =?utf-8?B?OHRGb3BFcGFUamVkWGdCb3RCT2NuQ2Qxa0ZFbS81M1dXRUJKRkVNemI0SFpP?=
 =?utf-8?B?MDMxTC8xOXZ4OWIwS1ZkMGR5akdDYWRjME52VDE4ZmQvUFZSRHdrQ2t4SFd1?=
 =?utf-8?B?bnNVNTZQQkhoVDYySnM1U1pxMjB5K2pza1NiWXFCZE51RXY4dXJmdkJGakNS?=
 =?utf-8?B?c1RFWkhLaDV0OGF2MFdvUjhZUW9XUlRGT2tHbFpweXZkSVk0UVFCejB2eUtv?=
 =?utf-8?B?TVVoNGRFZkNhRVJrbmJLTlFCOGpCNkg3TGxqQTlsUkZmdU9mZGptWkhpYWNy?=
 =?utf-8?B?bzI5cWtWWXYweVVTa1Mzb3o3QU9YRUxwd29sWWo3eGFoMDJOSWhuWi9iYTRX?=
 =?utf-8?B?eHVGbDlQSWxGUnowT2tKVjFWSTZOdTlSRkt1ZkcrM3NwWi9oWjJwV2dCV3JL?=
 =?utf-8?B?cHUvUlN6cldsN2V6UE9tSmV6WXFKQVdIZjRHa3BEWVFSNUsrQWNkc1p0RkF2?=
 =?utf-8?B?OHBSZnIrZTRRVTZjdDhjZmMrUnVyNjRzekErbHRJcXFvMXJ6OHV1WHJTR1FM?=
 =?utf-8?B?MDFvZWhQbGkwRTkvejlhTjM0MWNBR2hJUDRabHpIczFzVGJ6SHNOVHlnYXdH?=
 =?utf-8?B?OHlaUDYyQlN4L0pIRFZ5c0hudG9wdlB5T1NqR2ZMbnJXT2tEMUtGbWNETm1H?=
 =?utf-8?B?emJocXRxbGY0QlNSdjVvUkUxR2ttN2ZBbDFoMzZlbkxOcFJrUUt2RVAwMmM5?=
 =?utf-8?B?d291MjR4RzF4MzBnUlcxUlVtd1QwSHR2WGt4YnhOdCtTckxaLy9FVk5PSnZa?=
 =?utf-8?B?dThER0hObjRkTmh0UmFCeDNaSDhOdkh6YW9uenh6a2p0NUsvRlNTb2JYYnJR?=
 =?utf-8?B?Y2V5bWlldXJzQ2ZBeWNwUXZlbWwxcyt6Y3QzSlNCNXYwTEFIY2J4M3UwVXZP?=
 =?utf-8?B?TzlqZkVFSG1QQStxNkFpVU5OL1ZxZDJjOWxQTE96UjdYdmdweE9uZ1NMb2o3?=
 =?utf-8?B?NW90WDFMRmVzOTYwUE9ydGVrbTRnaXcvZDA5aFB3TFFYbXlwaStROWpvbjNj?=
 =?utf-8?B?UEJRbVdydVJaTXZMT0J5RzJBbFVveWdMbER5QUxwaFpiaWFyaEg1bkw1K2h3?=
 =?utf-8?B?QVYzMEZaUE5rODBaRGtjSHVQdU5CWGlkVDNyT1hIVSs5YlhFaDBhUDZuUFVk?=
 =?utf-8?B?ZWQvMjAxdEVDaHcvQklVaGNaSVhQRURhSjBKUy9HYjRNclZMbUVqWThMSmM4?=
 =?utf-8?Q?eVJ8BLRZib0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0htdGxmYndEeFRCL2RMOUNraUtSekRQKzlYWGJLTzEwQVcwS3FuVDJsN0Ex?=
 =?utf-8?B?Q0ZqN2RjRExHcDRnTm04bTc5eUNSN0lvYTVsK2taQStkRUk2cGRZWXNTWnpW?=
 =?utf-8?B?aVIwOTZsV0ZEeXJKVUN5b2tQcUdDOHNpOFI4eGtZQnhsKzFuZit5azVKRUE4?=
 =?utf-8?B?dXNDUzZyZEErZ2tRRThaQUR3L09PSURKbkJRdDU0SUhPWkdYWVBVeGsrQUtV?=
 =?utf-8?B?MzhVR3dMMnF5YXZaS1drekJWSmJUQSsxMHQzc3R4WDMrenhCWUNValJaazFF?=
 =?utf-8?B?SkxiWEVZZFJtN1M1TzQ3TThYRjlGaVl6WVhiUjhaM2paNjZiOU5XeHFUY1cv?=
 =?utf-8?B?ZDJEdkZiSllNekx1YVlKUnJ5bXpQcWhudVlQUXUzcmpnQktkakNncmZrYko3?=
 =?utf-8?B?NTRxZFljcWNYa1dnNVlvRWY0MHlyZTA1WVgxZWxrS1BBWkowblRsRU95LzlQ?=
 =?utf-8?B?Q2RXQXFIU3FqM1JVb2RqenFyeFVpdkc5TkVpRkZpcnNtZmZiQ1Z2Ym04N3Fr?=
 =?utf-8?B?WmVqT0QzOGMzUFUzWW5RWkU5ZHN2eWNaUnhzNVhIMWxLcjBHN1V5aE5yOWlV?=
 =?utf-8?B?anlBMTBWS29VUWx3MVZrcHl4RU94SmlWTm5xN29neHNmQk5jcEJhSU5PM29J?=
 =?utf-8?B?Uk0rbEFhSDZudnVxMktJY0VrR2VKbUlWZXRtVFVqc0h3MzZWd1lUNkhxWkN2?=
 =?utf-8?B?dzVlMEwxV2VNNkMzRGNiYktYemVIT2c1V1hNQStiNUQ0OXlvdk9jMXNKN2JL?=
 =?utf-8?B?NVE1RGk4UXlLbERzdUFEeUhUUThFY2ZwdmhlRjhTQ3NLYm9XU045eDcxNUV0?=
 =?utf-8?B?ZG9ic2dYNXMwU3R4MzVDeWZIa3RMaUNQZncyRzlRN2ROR0YzVkNFMFBVOHdX?=
 =?utf-8?B?MTNaNkVWWDZXTEtpaXd1YU5sYzcyUUtsbThCVE9ZQmNNeXRmd0NZV0VSQ1JE?=
 =?utf-8?B?T0dIMkxjMWJuWGtNTzdwNDhHWlNELzR1YkNKb0s0dUxTcTB5MFY1dmY5QWdu?=
 =?utf-8?B?aUNrbXM1YXk5U3N1cWNTdkZaU0FrR2xsMGJBSWFoU09tbzFmK0JTOTBQS2Jq?=
 =?utf-8?B?dXBRTXRiU1NmWVhEQ1padUVQMTBqZWJHTFd4T2d2OW8xczFHRDFrYXhLSWZp?=
 =?utf-8?B?R2EzcG12bEx1N09rcVVDVjFnY1kwcjZBajNoUCtNRWFtQW1WRmRtd3dNWGZT?=
 =?utf-8?B?WlpTSWtJdEFSK1BsUC9wY3NjU21mWXlzdmF1TC9mdzBuV0U4LytWc1dVQSsw?=
 =?utf-8?B?TWdTclRQTEFyejMwdDJBNWd5bkVQUmhqMXkxU2VoV2hEYjB6Tm9PaW1JSmZs?=
 =?utf-8?B?djc3ZUVKSWg2N0R5eEwxRlk1WHBYak5wc0tHdVE1N3JrM3RnSGxtb0FpbGZt?=
 =?utf-8?B?NXhteEtRUHFFMkE1NGxCdnk4Z1hXYW1WOVVadTRGVDhSaHk4bG9LUVJsd2Fh?=
 =?utf-8?B?d1BZck95RVRJaFVNOUFCNnNHc3cvN1ZqL3NTT1hJbm9Nb0RCdFhRVlBIK3lm?=
 =?utf-8?B?blVSckdUbGtQUE4rWXhjQ2o1TGduWTRjQUkrQ1NmdUZUSE01aGhzZnV0cWU2?=
 =?utf-8?B?QnMvUVZTMDEzZlgxRFRaSU9BOWFCdCtIckJWYnB1UjBrbGkyQjZiZC9Fengx?=
 =?utf-8?B?WW40WmFnOXRSTjFhTXF1R050aGxtazFkSS84c0NwVzIrdldXMm5STitnYVpX?=
 =?utf-8?B?aUZDY2NValozTWRLVTJ3ZkVnZWJVZW1MZlppMXhpK0dYZFNtTUZYWmFxditD?=
 =?utf-8?B?SktrSFlYL0xHalh3WENjMUkwYnYvcW53blBnMVZGdEVvU2dTc2x5ZTZwN1N3?=
 =?utf-8?B?cGVZWkdlWFNrdFBhWGZNOTMyY1lxY000RHJxUWU4ZXhTYXo4a3h1M3hXT3ZT?=
 =?utf-8?B?ellpa0dYWWl6SUo4RHVzMjM4eFloUytCelE0aTRtS0cyNW5YM2dwNjB2V0wr?=
 =?utf-8?B?OW0wdStWNlhyR3dPYnlSTGxsU2tML3dEUzhRTHlEUk8rN1dxcVFIalA4SDNT?=
 =?utf-8?B?d0FsOHJNbS9IZlBJeEdETHYxbkM5MVRGT0p0a0NOVVRDN3lEUS95QklFb2V3?=
 =?utf-8?B?c0hKOXRZUDdRQXU5clFzb0Uxbm5TcWsrdnEzazBjOEVZdFkwSUJ4MUtOQWxO?=
 =?utf-8?Q?nMn015iHlJmwMzxPlbrQjNZ+v?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd487ed5-3d0a-48f0-743d-08dd0eacfc14
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 06:30:28.2309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7nBEhXnxrzAN+IpvQzUT4tVKikyi6uaL5TktJpE/cWbUhw6Q1/bp4s1INfDcXoKTe56X8Up14S+GZVb2SXuEcaHvQ5Cgac2u2D1B7ER3et8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMC81XSBkcm0vdmlydGlvOiBJ
bXBvcnQgc2Nhbm91dCBidWZmZXJzIGZyb20gb3RoZXINCj4gZGV2aWNlcw0KPiANCj4gSGVsbG8s
IFZpdmVrDQo+IA0KPiBBbGwgcGF0Y2hlcyBhcHBsaWVkIHRvIG1pc2MtbmV4dCB3aXRoIGEgc21h
bGwgbW9kaWZpY2F0aW9uLCB0aGFua3MhDQpUaGFuayB5b3Ugc28gbXVjaCBmb3IgdGFraW5nIHRo
ZSB0aW1lIHRvIHRlc3QsIHJldmlldyBhbmQgbWVyZ2UgdGhpcyBzZXJpZXMhIQ0KDQo+IA0KPiBO
b3RlOiBXaGlsZSB2ZXJpZnlpbmcgbW92ZV9ub3RpZnkoKSwgSSBub3RpY2VkIHRoYXQgQU1EL1RU
TSBkcml2ZXIgbW92ZXMNCj4gc2FtZSBzaGFyZWQgRkIgR0VNcyBhZnRlciBlYWNoIGZyYW1lYnVm
ZmVyIHVwZGF0ZSB3aGVuIGl0IHJlbmRlcnMgaW50bw0KPiBGQiwgZGVzcGl0ZSBvZiB0aGUgMzJH
QiBCQVIuIFRoaXMgc2hvdWxkIGJlIHJhdGhlciBpbmVmZmljaWVudC4gSSdkDQo+IGV4cGVjdCBk
bWEtYnVmIHN0YXlpbmcgc3RhdGljIGlmIHRoZXJlIGlzIG5vIG5lZWQgdG8gZXZpY3QgaXQuIFNv
bWV0aGluZw0KPiB0byBjaGVjayBob3cgaXQgd29ya3Mgd2l0aCBERzIuDQpJSVVDLCBJIHRoaW5r
IHRoZSBleHBvcnRpbmcgZHJpdmVyIChBTUQgR1BVIGRyaXZlcikgaW4gdGhlIEd1ZXN0IFZNIG1p
Z3JhdGVzIHRoZQ0KRkIgdG8gU3lzdGVtIFJBTSBiZWNhdXNlIGR1cmluZyBleHBvcnQgaXQgZGV0
ZXJtaW5lcyB0aGF0IHZpcnRpby1ncHUgaXMgbm90IFAyUA0KY29tcGF0aWJsZS4gVGhpcyBiZWhh
dmlvciBpcyBleHBlY3RlZCBhbmQgc2VlbiB3aXRoIG90aGVyIGRHUFUgZHJpdmVycyAoaTkxNS9Y
ZSkNCmFzIHdlbGwuIEhvd2V2ZXIsIEkgYW0gdHJ5aW5nIHRvIGZpeCB0aGlzIGluIFhlIGRyaXZl
ciBmb3Igc3BlY2lmaWMgdXNlLWNhc2VzIChTUklPVikNCndoZXJlIHdlIGtub3cgZm9yIHN1cmUg
dGhhdCB0aGUgaW1wb3J0ZXIgb24gdGhlIEhvc3QgaXMgYW5vdGhlciBkR1BVOg0KaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2RyaS1kZXZlbC9jb3Zlci8yMDI0MTAxMjAyNDUy
NC4xMzc3ODM2LTEtdml2ZWsua2FzaXJlZGR5QGludGVsLmNvbS8NCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9kcmktZGV2ZWwvY292ZXIvMjAyNDA2MjQwNjU1NTIuMTU3MjU4
MC0xLXZpdmVrLmthc2lyZWRkeUBpbnRlbC5jb20vDQoNCj4gDQo+IEZpeDogSSBtYWRlIHRoaXMg
Y2hhbmdlIHRvIHRoZSAiSW1wb3J0IHByaW1lIGJ1ZmZlcnMiIHBhdGNoIGFmdGVyDQo+IHNwb3R0
aW5nIHBvc3NpYmlsaXR5IG9mIGhhdmluZyByYWNlIGNvbmRpdGlvbiBiZXR3ZWVuIG1vdmVfbm90
aWZ5KCkgYW5kDQo+IGZyZWVpbmcgR0VNOg0KVGhpcyBmaXggTEdUTS4NCg0KVGhhbmtzLA0KVml2
ZWsNCg0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9w
cmltZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMNCj4gaW5k
ZXggODY0NGI4N2Q0NzNkLi42ODg4MTBkMWI2MTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9wcmltZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9wcmltZS5jDQo+IEBAIC0xODksMTMgKzE4OSwxOCBAQCBzdGF0aWMgdm9pZCB2
aXJ0Z3B1X2RtYV9idWZfZnJlZV9vYmooc3RydWN0DQo+IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+
ICAJc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibyA9IGdlbV90b192aXJ0aW9fZ3B1X29iaihv
YmopOw0KPiAgCXN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYgPSBvYmotPmRldi0+ZGV2
X3ByaXZhdGU7DQo+ICAJc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoID0gb2JqLT5p
bXBvcnRfYXR0YWNoOw0KPiArCXN0cnVjdCBkbWFfcmVzdiAqcmVzdiA9IGF0dGFjaC0+ZG1hYnVm
LT5yZXN2Ow0KPiANCj4gIAlpZiAoYXR0YWNoKSB7DQo+ICsJCWRtYV9yZXN2X2xvY2socmVzdiwg
TlVMTCk7DQo+ICsNCj4gIAkJdmlydGlvX2dwdV9kZXRhY2hfb2JqZWN0X2ZlbmNlZChibyk7DQo+
IA0KPiAgCQlpZiAoYm8tPnNndCkNCj4gLQkJCWRtYV9idWZfdW5tYXBfYXR0YWNobWVudF91bmxv
Y2tlZChhdHRhY2gsIGJvLQ0KPiA+c2d0LA0KPiAtDQo+IERNQV9CSURJUkVDVElPTkFMKTsNCj4g
KwkJCWRtYV9idWZfdW5tYXBfYXR0YWNobWVudChhdHRhY2gsIGJvLT5zZ3QsDQo+ICsJCQkJCQkg
RE1BX0JJRElSRUNUSU9OQUwpOw0KPiArDQo+ICsJCWRtYV9yZXN2X3VubG9jayhyZXN2KTsNCj4g
DQo+ICAJCWRtYV9idWZfZGV0YWNoKGF0dGFjaC0+ZG1hYnVmLCBhdHRhY2gpOw0KPiAgCQlkbWFf
YnVmX3B1dChhdHRhY2gtPmRtYWJ1Zik7DQo+IEBAIC0yNjgsNyArMjczLDcgQEAgc3RhdGljIHZv
aWQgdmlydGdwdV9kbWFfYnVmX21vdmVfbm90aWZ5KHN0cnVjdA0KPiBkbWFfYnVmX2F0dGFjaG1l
bnQgKmF0dGFjaCkNCj4gIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9IGF0dGFjaC0+aW1w
b3J0ZXJfcHJpdjsNCj4gIAlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvID0gZ2VtX3RvX3Zp
cnRpb19ncHVfb2JqKG9iaik7DQo+IA0KPiAtCWlmIChiby0+Y3JlYXRlZCkgew0KPiArCWlmIChi
by0+Y3JlYXRlZCAmJiBrcmVmX3JlYWQoJm9iai0+cmVmY291bnQpKSB7DQo+ICAJCXZpcnRpb19n
cHVfZGV0YWNoX29iamVjdF9mZW5jZWQoYm8pOw0KPiANCj4gIAkJaWYgKGJvLT5zZ3QpDQo+IA0K
PiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
