Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0ADA7EA4A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 20:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AF610E540;
	Mon,  7 Apr 2025 18:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mdWXXBKI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC0510E45C;
 Mon,  7 Apr 2025 18:31:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXO1tA3a3aY1I6oTuBmnO35TbTnNTs/j8X/GMcL5hoQI+hVsJ+2HyyYXIyRw7zkZ15YYIphYHNtCR604WvyARIDJ8rwczn19mIxvupfEwwab26xtBRc6V4HdR71DrThvsZ7VFq/2m9d6rizngK1XlYbXCZzUTfni8TGn/7iUsl2YODmx6UUiN6F36vj5cXqsoLVI/TGz64gWoEM4fKVfz6Ho/nvzsZnuQZ/wcdMZRU9eUAzu5MgjPJufuuQjChIrRaRD2mKvKy1a0ZzrT1O6M1WzTA+moWPHorhCWnAoGi1pnSJFq7TLTY2LLtPZcbQ3WS2lBlMgABNBwqpC4oaIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uMIPyrkDV9b5AZcZfUkoAqB8CePtoAQFRwTilkxkL8=;
 b=dZ8Y3cZAteR6yIOAeT9jxsU6ntE2HpiwJn2hRevyTivVk+aawjYjG5JR45YigM+k7vSRJxBKgZvQeAbD1X2b0fv2zn99mXxRO9SJnGKsnO7EhbZj9tuJRbVynbEfYx29nS+6zEfhH3YSVDF07kDJiXq6GwlDB3fAR2ttNjQDd/cX+9pR4q0/aPdSkR82oA5SbeyX7W8K+Flux/5Lf5yv7Y4jG8tKSRhc/EsvNzCpHLOJw5GASmncYtUp+T4ZCBcZfUEsbJbwjZ6A4H0ggbe9tYzgcyEwDFU07bVq9DoWXCI+QewMJGEUdYcL7LV1Q731eW5QGRmDvvHwtVmn/VwReQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uMIPyrkDV9b5AZcZfUkoAqB8CePtoAQFRwTilkxkL8=;
 b=mdWXXBKIB/Dn2E+UZaHr2+hhEfIeCggR4G6zz8vch4XJ1ZsIlNaGPooTQG8d0DWCsnY6j3X8a6dy9GD/Nez6KmWionpDVq3z/ojWJYMr1uCI9fjWjhod1/6tufQper0lDGEp35+84u4IlnRKVW2Urrbly56oj4nQfiMumKQEhCkmXi8dqP/zY1CuMakdRByJMba1Jy3eDaXMiP+IMgUEBXWHcH6l22MWq423djn34qvvkCBHLbQlsCpNs0SvZAenhcy3CQbhCyGi84jxfO6FFhcL5t/3HE7mmzYc5OVyhqP9KAuURh8ueDjzht9dpXLswSPix1UX4NaF3PTuTCgUFA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 18:30:56 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 18:30:56 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs
 <bskeggs@nvidia.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Topic: [6.13.6 stable regression?] Nouveau reboot failure in
 r535_gsp_msg_recv()
Thread-Index: AQHbp9G0LmhXfQe7vUujDTTQzzqtibOYZIwAgAAJR4CAAAOaAIAAFVWA
Date: Mon, 7 Apr 2025 18:30:56 +0000
Message-ID: <7acb91aac7e7e720e735b5271e4938f866a476ac.camel@nvidia.com>
References: <69997152cb8688a63b50fd8d3f189cc0e2668225.camel@infradead.org>
 <71e3db014ae5bf84048313197ec08abb271ce757.camel@nvidia.com>
 <5a0a20cddbc13d3f9eb96067491034a22830620e.camel@infradead.org>
 <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
In-Reply-To: <9890af80b576c61bd503134c13ee866a105a89fa.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN0PR12MB5979:EE_
x-ms-office365-filtering-correlation-id: da5ba2f0-b16b-4120-2c1d-08dd76025630
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Wm9MZUI2VVpvcEY4VEEvdThqTEwrK1ZRbmxmOWdOT2tBNHRpbWRmMDRWQTk1?=
 =?utf-8?B?MTFwVG44NkpvN0RnSXEzZXE2MFkxRHpBdHUwWU95cU5jNzBZQU1oRDVYUkdv?=
 =?utf-8?B?NVJScmFCaHFXNWhZeitHS0dzejVHQndPNHV2K2pRZEFJRTZxVVI0T3FhTW5r?=
 =?utf-8?B?N1V4OTlsQzNCZHcxTTJJN3BvMVJyYkZWQ09uZ0FCRDluK0gyTGlPeWxxN09a?=
 =?utf-8?B?OCtkbnpJUk1xRDJCRVU4OUsyc2hBNnZOZkNUTFVZVGx5ejFJa3c3Vkt4S0Ev?=
 =?utf-8?B?Ui9vb0lXM0VyNjNpRlVSeWlwbWZxdGJYTDdaeDJ4alNzMGZLbzY4ZlExNzRq?=
 =?utf-8?B?ZXFPdlhRM1Y5Wi9MSWREK215NlNSSHJyYUIvYk5iYmc5akFUMDhIZHcrdEJQ?=
 =?utf-8?B?d2hUWGhQeWVaekI1Q2N6UWsxaHMzQ3NhbkV2VmlxRmhHZ2ZSZ25XUVBWa3Ni?=
 =?utf-8?B?enc1d1h5ZzJySk82YzJyQUVBSWI3QkJsZjBzSUtNQWRNaFh3cmx6bHRna0tD?=
 =?utf-8?B?alVCRzdPVU45cTlRdzlMZ1lEWlI2M2dYaElyVnQrd3BTQmp1N1hqZlhKbTE0?=
 =?utf-8?B?NDBzM1owVnhFUTVkSTFqcWowRkZNd2lNZlQvbTVKMjFpWlVhNGFqekE3aGdl?=
 =?utf-8?B?bkIrUDNaTEVhM1hvMStUWVc5cDdUZUJ4S3pmdW5PMmNpcHZ3bllSd0tuUko0?=
 =?utf-8?B?cW1yQWZ3c0VpdWRUbEdYTXV0NlhZSEZmU1ZhbU5GQ0t0dDVTejJNNmlueEky?=
 =?utf-8?B?Wm9YZHlSQ1l0UmFpdXlnMG5OWG9laFdKSWk2UUk2TzRtc05kUlNRT0Q4V2hC?=
 =?utf-8?B?OWU5a0p1V0dPemE1cXNIUDRWOEh2VjNDNHgxQmdWS3c5c2J6TzhyMGxrbVlG?=
 =?utf-8?B?NzMzblpXR1N6dEJHdWtta3ltaFlmeDRVQkRqeDlrOHJ4KzFwU3NONGUxS0xt?=
 =?utf-8?B?WElCKy9oRVVadXJRSzZERTJNSWF3UFFTM0tPLzMzT0ZnSE5ESjR5ODBGWWVk?=
 =?utf-8?B?WXRYQWhIUTlmK2R5WUJQQ2k1WnkwTDZPVGtJbExOZWFzTGxwY1lkYXk2bDJu?=
 =?utf-8?B?VDZyQ2xKOEVVZ0p4ZnBoV25vZmttL1k3L1BzR1ZsaFV5ODVORjY2bU5lTUlq?=
 =?utf-8?B?dFU0RlZNSHRQT2dFVWFXT3Z2U2RvRU1hbE5EZjAzM1JNU3JZb0J3ZzkyOFdq?=
 =?utf-8?B?cXBNdzA5UzJ3a2ZQKzNMZzluK2VkVGlSSDJSazQydko3L2VBVEJiWVlOT0tV?=
 =?utf-8?B?K3F1dzFZbWs5VjducFFhakRjT2F4VGdEZzRWSGVJUUpCQ1puU25peWhlMmpv?=
 =?utf-8?B?TWY2OEt4MCtZa3NTNDkzSGxoRjRMaXpkOFViZHBZWXJ1a09ac2lHUzBGZi9H?=
 =?utf-8?B?VGVwSXI4ZHh5Z2Y2MFZZT0tNOXFRbDQ2Z0JWZ01lSTJMU1hJakFxMnFzMHNp?=
 =?utf-8?B?WExyUFZYY0UrVFhJMnBxcjhCYVVBVXJDQXlyYnU3Y3RscHJZWDhuejVheDVh?=
 =?utf-8?B?clZBYzAySjBtSnI5SjNnQUNDRUpCVDVZUnNsWmQ5UmgxVFN5UkFmbkxlN2VE?=
 =?utf-8?B?THNkMVl4Ty9JSllVOExtNklYM3h2ZzhudzJmWGlMUFE4NWtqZTVsL1FhWWVP?=
 =?utf-8?B?ZEczcS9rSmowSDZFcWQwS25HSEhsMTJ1STFlbG5mSXdzOUZRQ091SlNNZFJO?=
 =?utf-8?B?aHloc3JYK3cvQ2dzSnVIRnVlRTJaODRGM1BrZGhJTGhvb3dMWTlLVHNmQlVN?=
 =?utf-8?B?VHN6d3ozd1Zqa0FPcUVxUHduemF5a3lBbTRwTnBSU0FTeGJnQzlWWjlsemVV?=
 =?utf-8?B?TVY0T0pyUExPY0c3K0wyWlZheTExU3I4TndwbE90YWlQdDFEcytvcTd3QlZ5?=
 =?utf-8?B?UEFMZUgrS0ZnRURsS2FyMExHMURYanN4cE1GbTg1RjdxRHpwdVF2aERoUUhU?=
 =?utf-8?Q?3qEdg/iGr3oB5ndBA+O3zlydPQPBwcob?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEhZWDBuK0hFTW1EQ01pTzhBSFZ6NUNKU014TDdVeGxoalMzQnozdCtUcFB3?=
 =?utf-8?B?WTFMSDRPYjdhUWQ4aUhwRGNNWnFxNVhocFR5RG5RMGJNSUw2ZnFjdzQ2bktl?=
 =?utf-8?B?OW5sU09XcWtiUnNhYkJncUppYy9hWUowNWtwc3c5MnR2WWlnZXlOa0tTeWtk?=
 =?utf-8?B?dkZIWjFzN3hBSmhXTk8rL01zRGpQUTdOU3BIRnlaWWFUSW15Slllb1QyQXVE?=
 =?utf-8?B?NjNZWHFtRnM0d0x0MUphQmxXNWQvZm1uZHhsZUVJRjJvaHV6VGtqNWQvcXRa?=
 =?utf-8?B?bWVqT2ZXVE9WZVFrWFlFaWQ2VERNNHhoaUNRUVNLSGVmUWFHbnh2Wi9OWHlI?=
 =?utf-8?B?UVJGYXA5U01OZTNxOGJJM2EwZmRlRGlWNlVyVzBNblZGMUFTRWI3dlhRTXRl?=
 =?utf-8?B?bXhDYlI1Y2tHMW5MMkh4S2ZrQ3A5VU0zU01NNEwvcFhwZ0MwWW9DeTllQVAz?=
 =?utf-8?B?d0IyRjBEQi9TbjA0TFlYMDdJd3ZzTFlKZmFHbXpNaU1vdUl1Sk51TVlXM0JL?=
 =?utf-8?B?cGpKWnRBS0llTjZndXV3S1ViV3lFUHlZWk5GcDZmZVdtK2FZaDhOYVdpOE1a?=
 =?utf-8?B?V2ZMc0lRZkxxYXR0c3lzbjdURnR6L1ZzdnR1YUJ3YjZXUVpXZGtjZ2FnYUMv?=
 =?utf-8?B?Mk9tWU14VDdpSFlkTTVNVGFIcUEvaWVhVW5MVW4rdnRjMzgwYlRtOWdZOVVo?=
 =?utf-8?B?Vk5LNzRTV2VnWG5YWDhwNzl1TEVwT0hoWlNBaklIQmRKaHJyQ294MlVMTGJR?=
 =?utf-8?B?TGQ0NTFiQVV0VEJLRGx0K2p0cDJaRFR4WENnaGNvUEJEOU5jaUtXTDdCT3p0?=
 =?utf-8?B?L1hPZ0pJZlV1NFNpeVZ5dVlybGxhSU95bWo4MDNJUkJtMEVPeXcwb3A4Zy9F?=
 =?utf-8?B?TjJlZWlLR1RSanEwQ0JxQUFJMjl5cEQ2bzUyT1hGeGhhbk1aeVVNNzFCVHBt?=
 =?utf-8?B?Z0FOUEsybmRpMW84VzBxbGhLSDR5ekFSQlFjMjZ1ZEJtYnU2amZaditjS0l2?=
 =?utf-8?B?dXJ1UUNRT2o3ZXVadDBKbGZJc1JlZldhTjVTdEhjNzEzYjNsaE13WEc2U3RZ?=
 =?utf-8?B?R3RuV21NRWtmaitjelVUZHM1dWZuc05FSVBHYm1CSnlyOC9aS3l2SjY3LzNH?=
 =?utf-8?B?RGlIQ3F1U2tpU1ZLYzVIcDBNTi9ud1Bvb0pQOFRtc2NwMG50bnBlNEJrUzgw?=
 =?utf-8?B?NFhTYkJkNSt1ZWV6YmQ4N3VpbG81YXEzWXo2U2JtNEtESk9Ca29tRzY4ZEFW?=
 =?utf-8?B?NEQ5dEtPMkxSbCt6VVM2UzJlRFNxTE5UWUIxaDY2MVBtUU5wWEdDd01WcUpH?=
 =?utf-8?B?dFZFbWNiT3ZSR3M4Q05XUkhra29XcXU0YTNDOFkwRUl6NXlzUXlMRjNtY1pJ?=
 =?utf-8?B?ajBmZy9lR001NkkwdlBoR2t6di9zejQ1VmMyeWF2YTM0Q3NGeHU0azdjTGZk?=
 =?utf-8?B?ajMyL0x5SEt5WlM3dk93SUFwR3Bkam1Ma2FNc0VTaURUTnd5MDI4NXUrbFFG?=
 =?utf-8?B?aVBVbTBZaytGR3UyMlVCOEhTMUtEM2M5cG1qOVl3bmFFSkJmdHRFSlR4TzZI?=
 =?utf-8?B?eW1nMmlLaUorYnhOSlBJeTlZMG5OZGVmUjZ4SGFFaTFOYU5RbWswZWo4dDZC?=
 =?utf-8?B?SWZKZHFuR3BsaDlZMTZaM2ltOThNSHpEdEQ5VFc0cDVJN3hKckxvTEpMOVdM?=
 =?utf-8?B?RlRIaXBnRWQrVEtKTGJ2bHFRSllPSVNITTJBTlFhbWJmT1A1cFErZHJ1MkZB?=
 =?utf-8?B?aFlqYWNnR3dXUzJLdGZuSVNud0c4T3BCNDhROVBJUkpjMXBmQ3ZzWGpreDNl?=
 =?utf-8?B?WFQ4SW9sQVptMTNSbTdDMTAvMFNwT3JEYVQ3UU1RTVRzWmk1M2J1US9ZMDRG?=
 =?utf-8?B?ZWFycVZOU296cVpuVUNOZWwwd3ExYnNSM3NqSTlqYlJHazZkV3QrOVZTSyt2?=
 =?utf-8?B?Wngrb292d1BkdDRKTzlRajZ5eW4yOTQ1ckZ3TUZqQ3l5M08rYmRHVUk4eUgz?=
 =?utf-8?B?QlZUajg4TUZCNmVzYXJpN0pCS2I0MmhCT2RDdEhjQnBVNmZuVmZsZzNQdGxM?=
 =?utf-8?B?dDdRbG1xWFJRdU1VV3k0dUtsa1Z6VzRHZEkxMzByelF1ajVsYWtGWitaeEov?=
 =?utf-8?Q?5mQrvcr5DCzKIDcV4JFjUKmMA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81B1A8AC4AEBFA46A1510E5AE934AA0D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5ba2f0-b16b-4120-2c1d-08dd76025630
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 18:30:56.4029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIgUsIf5/82JoCEvOeXEZTUG9x6wwFjgf5MBkdxGpCmUTzhZyzE1qOgcaZXTrZUjFySwOueTryBnjbr1LJccsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979
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

T24gTW9uLCAyMDI1LTA0LTA3IGF0IDE3OjE0ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBX
aGF0IEkgbmVlZCBub3cgYXJlIHRoZSBHU1AtUk0gbG9ncy4gwqBJbiB5b3VyIC9ldGMvbW9kcHJv
YmUuZCwgc2VlIGlmDQo+IHRoZXJlDQo+IGlzIGEgZmlsZSB3aXRoICJvcHRpb25zIG5vdXZlYXUi
LsKgIElmIHRoZXJlIGlzbid0LCBjcmVhdGUgb25lLCBhbmQgdGhlbg0KPiBhZGQNCj4gdGhlICJr
ZWVwLWdzcC1sb2dnaW5nPTEiIHBhcmFtZXRlciwgc28gaXQgbG9va3Mgc29tZXRoaW5nIGxpa2Ug
dGhpczoNCj4gDQo+IAlvcHRpb25zIG5vdXZlYXUga2VlcC1nc3AtbG9nZ2luZz0xDQo+IA0KPiBS
ZWJvb3QgYW5kIHRoZW4gdGVsbCBtZSBpZiB5b3Ugc2VlIGFueXRoaW5nIGxpa2UgdGhpczoNCg0K
VWdoLCBJIGp1c3Qgbm90aWNlZCB0aGF0IHRoaXMgZmVhdHVyZSBpcyBwcm9iYWJseSBub3QgaW4g
Ni4xMy4gIEl0IHdhcyBhZGRlZA0KaW4gNi4xNCwgc28gdW5sZXNzIHlvdSdyZSB3aWxsaW5nIHRv
IHVwZ3JhZGUgdG8gNi4xNCwgdGhpcyBtaWdodCBiZSBhIGRlYWQNCmVuZC4gIFNvcnJ5Lg0KDQo=
