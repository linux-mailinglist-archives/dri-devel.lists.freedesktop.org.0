Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEM4O68Ai2nJPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:55:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A414C11938B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C7010E532;
	Tue, 10 Feb 2026 09:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j5wvhXyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013006.outbound.protection.outlook.com
 [40.107.201.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444D910E531;
 Tue, 10 Feb 2026 09:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDkpFHZmZzIPz8WFUjuc1+q30KdouaJjgHoFgd64MkxLzELRY1lNXyAGy8qL84BFGEmS+7+Pdzj4DdKZVUplktXdB6fC317SfLuXnxIGaa1T7raNBoa6SEeubL2pKtCfG3+7sltWoW7XrIMa2lrk7X4o9UsEZrcRs0ZaqJRPL7DiJ2FLi4VrLoR4ZHow9zPI64kUa47vymrcuSV1C4XK+mUmm7vpvzVHkBzOklsnrf+h40K6/uB/3jGnQLc6wn+bZGZP+HHKlZqRWB3vKQtAjdGXUPB+szThP6GNvorU2vkWCV1KEfTtLElsp/DzZob3BsA9M+XO/TfnfFhYz4/kGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mesJpBfEm+FhQyDxhR92x5iEOsTCi4b8Z/V9K/E41Ys=;
 b=KJUlKwTS25xWj6Nev5Dsi04JTi0jwhDPtH8TyYJFHhJsd9Y8Qf7S8gkhdYG3QYrJlAMh3YnOVX+wGtlwKCslP4KWAGIX9l9HmPvGSQkejhTg63iSCCnD8iuHtBL8znqVMuKJzdu4GeOMKsLUF4cwEWtvz0ewYYlCH4jOIvPFiedzZ6G7gimfQfQXyVkruxGF7FZpqZmbhtayKidkG972TgoHwOw6wRGTB+ZXlQGUcbVucz4owERjkvkOU0+N7fda9AY9FsohYy1CAzC95sqO09voAf2a4TUwOnEvONVB2D9S21m3EPszMAA/38cCUkqZAd+0f5dYSran5DPvW2pyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mesJpBfEm+FhQyDxhR92x5iEOsTCi4b8Z/V9K/E41Ys=;
 b=j5wvhXyHOyXfwlaT2EvSvrUoZ5b+LbdfEa1OtinsHHCuSVDTl5Z+Xbp6oHOafEWulj2UpoCsaxFzXtuUVI3dyk3JhHthFtd3iKPh9qnASt1b9gqwDaANKfi5YL0gb9BoVCsb48QZqgwd6wWzvpa4XCUPXKpX+N6b56dQFSPponw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6896.namprd12.prod.outlook.com (2603:10b6:806:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 10 Feb
 2026 09:55:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 09:55:52 +0000
Message-ID: <42fb0f83-bdc5-4d5a-8ee8-a1d12edea1fc@amd.com>
Date: Tue, 10 Feb 2026 10:55:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: fix sync handling in
 amdgpu_dma_buf_move_notify
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260210091417.1133-1-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260210091417.1133-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0340.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6896:EE_
X-MS-Office365-Filtering-Correlation-Id: f70f23b0-cff8-4a06-554a-08de688a935e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S01XU3VFemdUUFdtZHNjb3YvQnUrT2xzV0tqWXNXNDg1VjdIMUJESndLRjRB?=
 =?utf-8?B?Rkd3d1hIcDhZQjdFeUtmWVJ0SFNqTXVZSDN5czRMcHpWUWQrczNjemFZOUl6?=
 =?utf-8?B?ZE9jbk84cXZSVFRxSU40bHRoVjZ0K1JXSHBTNXViWVJOMXNncVpIdWRXVUJz?=
 =?utf-8?B?OFZSQlNvVmZzbXBRUjhMRFdnVExvSUNVa0pEdk4wZ2E3Z2h5a0hUbHE4UXVT?=
 =?utf-8?B?RUE4aHkyTURaaGtQVmRGYTVvUG5SL3B5R0FzY1pZcm94LzdyQXV5R0hwZ25T?=
 =?utf-8?B?MCtaRjdCenNwWVl2OE5qTmViMHBveHdKZTZ6aFYyYTc2K2Q1Q0x2dDZWWC9B?=
 =?utf-8?B?SjNyYTFJcGFRZmRUT3Y5K1p6RjFUbS9HeEthQmNrSVF5QmExdzJSazd4R25k?=
 =?utf-8?B?QjZ2N1JWTWVLT2RNNTEwYUdXcFF5REZxMGxPQmtKTDhoVERnNkFrM0xwaG9X?=
 =?utf-8?B?R0FRbTdZMWplak91bVpTQnIvdldiUCt0K05ETlRLbzc5Uk9MTVNDZC95bjJr?=
 =?utf-8?B?ZkNsM1A2aHc5VzZ6eFU5ZCtSTGV6dVBGMUtpdnBlQW1PdDlSLzlWS3o3Z2to?=
 =?utf-8?B?QU1sS0V4WHo3TC9JVWxtMW1UeDBGUHoxemMwTHJraStacG1pbkR3dkJ4ODNB?=
 =?utf-8?B?SVE5cjFoS1ZWMkg5dGVmVlBiSlRDejU3YkV3eGF5WkFwVDMrUGhlVTFnbHE3?=
 =?utf-8?B?VGoyQ2h6RXBHWlJiZ29uZCtUbUc1UXZGYnk1Y0IrWUk3K0lvWXlLY2RpczBB?=
 =?utf-8?B?TkIwbWRHY1pSZksxeUVGOWhZR1I1U0F3eVg2N3NyRlphckszN1NsQk5QN1gw?=
 =?utf-8?B?aFpCNW5yWWdoVngvbFdsY2dyMHlMZWlPNHUyS29iazhqTWRuNE1zSHN4NEha?=
 =?utf-8?B?VThiSlRKeTRoZzRyOENCRE5wMnhzUmlYSHgrZkhtc3BiRk1BVktaQ1B1YlBR?=
 =?utf-8?B?MFBqV1BWVE1iMURLVHc2YjA0WTdMTHJTQWo3Nm1PbERDMmJwSm90dEFEYTRx?=
 =?utf-8?B?V3NKdlBOYmFnKzg4OHBUcU90cFpTMll6SHAwV0s0RklRdWdrelJFUGtOY21X?=
 =?utf-8?B?eEs3ODhjMDJ3dUZrdlhZTU5ING1SVmgwR3FjdXdUZXViMy91Z0JRTFNGNkEx?=
 =?utf-8?B?SlBzeVZwWG9vdWt0V0Z0aCtOZE52MjB3VmZBVnhEMmRhUWI0RGNDbFVKSFV0?=
 =?utf-8?B?U0FKZVh1VUJrSWpCZFpxNEdidER3WWhlWFFDYWxSSy9SWlBLS1RFUnJrVjhQ?=
 =?utf-8?B?eG9MN2VoLy9tUWw5SDVDalVsVUFWS3pveEVGK1hDUWJydVdORzluQVRKM2JM?=
 =?utf-8?B?NW9IRlo0aVlZS05kT3Y0YTlwc2xZMlZ6eTVpWE83R0tQeDNpSzBOV1hpUmFI?=
 =?utf-8?B?aEtaalMzOGNYakV6UytCOEkvd0loeW44cmZiM3MzakRCOHU3S0NkVlBiMnFS?=
 =?utf-8?B?ek5uRFp6YWh3ZDNNWEZDSjJWcysxUDdiMG4wMEJCcTduTysvdWN6dU9jMTFu?=
 =?utf-8?B?R09XbkgxMFN1M3k5NGs3RWhlRHQ3VmtYM1NVODExc0xEdFZneUpEaHRJNjJj?=
 =?utf-8?B?b0VkTGwvL2ZkRGoyY1hnYVk0dWhURm1JbTN3V0VoT0NyZmgyTEs5SjVsM0NN?=
 =?utf-8?B?V0pkcktQVjVZa1dEZzVEWGJLZm1BWUVKeHRuUklNVCswZUZTQ2V0c0MvVVE2?=
 =?utf-8?B?L0w3elAzKzJMMXVpRUY4aWxJZjhNVTZsYmxwTE5DbnMrWlo3bG44YUpGNC9R?=
 =?utf-8?B?amkwNXcwSUhJNlJ0SVMzR1ZYeG03bHVpTGIwQ1k1dlBTeUdnSkpYZzd5cXNC?=
 =?utf-8?B?Z3JQTEpXK3gwMVYwTWY4UlVMZ3VuUkREQk9qckFHWUNmS0V3MXViNEpuK2Jr?=
 =?utf-8?B?Y2ttbURSdjJnbThYbnF6UHJ0RWxNMDJvaTN3cUxLR3o2emlVekh0TXFkR0F1?=
 =?utf-8?B?d210VTB6d0tqUzhjSkFEUHltUWJXcFZZaUFoeTdHY0pxbjJpVG92L0tqU2dP?=
 =?utf-8?B?ZDQ3WlJyV2h1dlovZVdGMmprZC9ZcGhOcjhyT0x5bjc2Z1VBeFNPSEloK3Rh?=
 =?utf-8?B?d2k3OWxITVRzNUJhY0NHSTdQbWhwVXRnWFhBLzdDMFd5QUZUR0dtcElnK0o0?=
 =?utf-8?Q?QbOI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3QrdGNmcm1uUTh2WHRpZStaWkk2N25zUHp4by8wTzVLMWpIWkFaNVpLakVY?=
 =?utf-8?B?VTR4QUtyalRwSktER2dJSXhsUDNBb0ZFSkF3Q040TlpkeHFzYWtIcGJFYUQ5?=
 =?utf-8?B?eEVydlI5cElHTHRyM1FtSDJaVUlRK2F3MmdvTi9oQnd5Q1RpWE1MU1NQV3da?=
 =?utf-8?B?YTNBVDhXS24ycnBibGdVMzc1N3Z6ang4MEZyTUI0YWV0cUtPZTl6VWZoYmFl?=
 =?utf-8?B?Z2Jyc2pQVmJucHM0NjdQSzczNXBTaUdmMUxVTXRwcFlnWHhtTFZsZVNQUXYy?=
 =?utf-8?B?MFVFRUpaQWxEQjJjTkFkcW1ic28rTnR4dHZMdDUzTTJxc3ptc1F3Q0NRUGdS?=
 =?utf-8?B?TEV3UkhTN0RtRHoreEd0WXJEYUJFNzNXcGdTejd6WnZlajBDd1FaaFg2WVRk?=
 =?utf-8?B?R0xaY0RmWDdNK09FQzZkazkxR04zZDNvbVpPK214TEoxZDU3bEwyUVlwaVdT?=
 =?utf-8?B?ZFNzUjlaZDhpTDdST3N6Tk5RcW1jYU53bTdXdEYrMlMvZmx2cjNoS2s1M0wx?=
 =?utf-8?B?OXIxMnJtcHB0bVIrTmlSTDVDZ1d5R1BvalMzajRSbTNqYzJnVlJqMXJ2UzF1?=
 =?utf-8?B?OEZXbWYxZXRzTmVuTVlUUzhSZHh6dGhPbnlDb1JwTGFIRmxGZVQrc3ZqTjhj?=
 =?utf-8?B?TVF5cEFkMGx4aVF5Y2lmUXF4R1NBWDhDYkh4MEk1V2FJU0dmaGpVVk9DNFdW?=
 =?utf-8?B?bmQ5c0g2dE1ZdzQ4NkxkYzdUbzdveTIra3pad01QNmRlMTAyQmNPUDV6Y0dP?=
 =?utf-8?B?STdjZUtBSFV4ZndjT3IvaUNzVVV1WDN4ZmFSOHg0Yksrcnk2VUpLSnJVakhq?=
 =?utf-8?B?Q0MrcWdVaUJvYnN1cHhvZnB5ODF6aHErTlJYS0lRUk1rRWJtSThFUENHVTZz?=
 =?utf-8?B?SnV5WDNLWjNVWE9SdWIvdWRDeThxUjRjSEMxZ1FJc2xLVm1uQk9CMk95b2ZH?=
 =?utf-8?B?cjBkNk9aQy9uLzd3V2pjNklPaU8xRzRKM2c3RFRNNXUzT3NkSGR3UzlUVEhr?=
 =?utf-8?B?YmtDTkY5dFhvdjNSeVF0NXppZVkvdUQ4czFJemlkUTBzc0hwVUxsK3I2T2lq?=
 =?utf-8?B?ZlBtZDVBN2hubTR2TTVYTlB0NmRrdzMyNDgwVzNEd1RSQXEvenJhQ3AyWjdQ?=
 =?utf-8?B?VlducFRlVGRpalk2bzh5dEJra0R0c0NyUlA3dDV4dStZb2hvTDRBUDVQVVhE?=
 =?utf-8?B?aWdqczlNT3ZVSC9RWm5tb2xCNTBhQUZ3OFVSWlllOW5yODJPN2tBT0kxN21l?=
 =?utf-8?B?UFpOai9oSkQ3Q090ekdRQlZvL0s5TlpGdytOeW10REh5OE96Z2pMYmMxTm9K?=
 =?utf-8?B?Y3pqOXNVbkdobCtEbllOWXg5UzZRV0hpTDV2Umx5V0RhZEZteCt4NDA2Rld6?=
 =?utf-8?B?cFIzTURLUDFRTWlWOGpoWFlMM0F4NnNHSW5UN2oxb2YrVUxCVmxNYm5nVjVP?=
 =?utf-8?B?dGE0SFBmMHRlNFgrTExKQnEzTFhKb1RPR29SMnJBcmVxRWVCQkdDMVFWTklN?=
 =?utf-8?B?WXVDRVRwRmdtK3Z4M0pkWFVkdk13eDJCRVJnM1kyK1dlNE1INkd4dWJ0aHVl?=
 =?utf-8?B?bTR3NFNyRnIwU01RbFBiZHFYSDZ1SDJSSWFtMWVoRS9xUzUxbWxNUU4vWFR4?=
 =?utf-8?B?OElUR2JmRm1IdVFjcytZK0x4ODQ1Ym50cVQzM3A1SktMV0x4MTE4NENOcnkx?=
 =?utf-8?B?eG9hNGx4bmR1dzFpR1BadHFvTHlmS3dJaHJrRk5QcWZXMkdiSi83c2JXWHhX?=
 =?utf-8?B?enFEZ1NDZzVtTkNpeFE4NHRyRjlRMVM2VVY4TEJDaHFjb05sTkgxeld4R3Fp?=
 =?utf-8?B?ZlpkMzFaNE1kdVNPUXdKbEVSL21OMDF4N1B1YzJKdURIT0JicTlzck9WTTlF?=
 =?utf-8?B?RHhpdmlDd2J1RG1tMWhIMzdUMkRRNFJvSzIvK1FHUHA4WWpoVVBvQjFzYklW?=
 =?utf-8?B?djFmQnZ3U2dGUC9RZjBDSjVGeHllNjlKc0o4WEFEbTFISGR3UXpWQVZKM3BR?=
 =?utf-8?B?a3dzVDdLeGhNTDRSSTFrYklESVJ1K21sb1hubm1ZRmVqUE1DdXI2YmY4cHZF?=
 =?utf-8?B?aEpWZU1xaUd6RFVYMS84aVZuRVFpZ2RoQitiOE1jS3dBcjBKbGh4cEhaYnR2?=
 =?utf-8?B?U1NuNFh0bnY3cWdGWnZOM0dSWDdvZzliUHYvOS9SVThiNTQxYzFIc2NISUpr?=
 =?utf-8?B?am1Jb3hnODlLeHhWa1BQUVo1ZkVBcFh3azdIdlpvc3p6ejFkTUp6RGF3NEw3?=
 =?utf-8?B?emtFdGZIRDU0cFU3ZnJ1SnQvYnUwZ3YyeGJNY0x4MG9OSzVRTkdqa1pCbkVK?=
 =?utf-8?Q?c4x8sFb2ibmSBXIM+B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70f23b0-cff8-4a06-554a-08de688a935e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:55:52.2683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ae7LrNEanCKWQD9ZrI06DO7FIYC0CRUEcDPRWvFuFW0FDq2aKdfi44PIsacCTcwT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6896
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: A414C11938B
X-Rspamd-Action: no action

On 2/10/26 10:14, Pierre-Eric Pelloux-Prayer wrote:
> Invalidating a dmabuf will impact other users of the shared BO.
> In the scenario where process A moves the BO, it needs to inform
> process B about the move and process B will need to update its
> page table.
> 
> The commit fixes a synchronisation bug caused by the use of the
> ticket: it made amdgpu_vm_handle_moved behave as if updating
> the page table immediately was correct but in this case it's not.
> 
> An example is the following scenario, with 2 GPUs and glxgears
> running on GPU0 and Xorg running on GPU1, on a system where P2P
> PCI isn't supported:
> 
> glxgears:
>   export linear buffer from GPU0 and import using GPU1
>   submit frame rendering to GPU0
>   submit tiled->linear blit
> Xorg:
>   copy of linear buffer
> 
> The sequence of jobs would be:
>   drm_sched_job_run                       # GPU0, frame rendering
>   drm_sched_job_queue                     # GPU0, blit
>   drm_sched_job_done                      # GPU0, frame rendering
>   drm_sched_job_run                       # GPU0, blit
>   move linear buffer for GPU1 access      #
>   amdgpu_dma_buf_move_notify -> update pt # GPU0
> 
> It this point the blit job on GPU0 is still running and would
> likely produce a page fault.
> 
> Fixes: a448cb003edc ("drm/amdgpu: implement amdgpu_gem_prime_move_notify v2")

CC: stable?

> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index b9c38a4fe546..656c267dbe58 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -514,8 +514,15 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>  		r = dma_resv_reserve_fences(resv, 2);
>  		if (!r)
>  			r = amdgpu_vm_clear_freed(adev, vm, NULL);
> +
> +		/* Don't pass 'ticket' to amdgpu_vm_handle_moved: we want the clear=true
> +		 * path to be used otherwise we might update the PT of another process
> +		 * while it's using the BO.
> +		 * With clear=true, amdgpu_vm_bo_update will sync to command submission
> +		 * from the same VM.
> +		 */
>  		if (!r)
> -			r = amdgpu_vm_handle_moved(adev, vm, ticket);
> +			r = amdgpu_vm_handle_moved(adev, vm, NULL);
>  
>  		if (r && r != -EBUSY)
>  			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",

