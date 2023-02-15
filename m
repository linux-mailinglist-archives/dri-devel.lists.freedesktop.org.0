Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE586981EB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 18:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E184810E072;
	Wed, 15 Feb 2023 17:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F70010E072;
 Wed, 15 Feb 2023 17:26:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlROcSBLhrDzeWTGAgQbDzC+F7+TiPfKK5D9OjPOLxdSNgx5gT8qRDqVF64WqVFIYNY4GC3rHPtFA9ZzKIuX43gXa3pRxiP4Gna56LXwJ7Y0F0tRetf5spW6fONdUKHGKzOr86miw+qzK/0R1c25EvgRroLM/BT4cNi10F98K7D0V/IWL1r0wFU8/zvQuEQlLoIRkjGPkH4w+68RYWmEOCcbTL1vh25Q4M5XnQGRyvoPKPL8trQBqgRMhEEVAk490x5ah+eET+5Qs2Vzhiz6whFfg7onEYV4p6JC536Xm6cTqlYvYS75yqH4TmStugP+YUNceA2kuZqvxX4oGlTeLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSP1DYpAdbRDalPo6c2a0OkOsakrR/SGZIHIWoqYFYU=;
 b=ab5xhqysmX64ZtnK/XjJTKgDIhu3g/ANUoGxqIBij/H4v/Q2107IfZcRSk3kqfB0EDvo1L8wPKdMc2dIizvNN8TAGT8t4P2M+qehbPHXWjK0h6USMSObqk8BrOC8GHCyNtbeNlBvJvY5Xg2rK/Q0gYAxqo2ZitecapmXbh+yRhqXNqioEVa0hXQcNoSuFKXY0EiRiqqEQNCbLxO3CRCZTaif9BhuwDq2VXT9xfdYn2HbQDU5pwtCiplD3PyxtUh3GzTuKMRONuPeNBbEPZn7Tt+79Z5vZubH8MgKt9NUnMcmZ93eWZa/OyNhKjNuIfY7WSW56/J42nxZ/h9fDav8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSP1DYpAdbRDalPo6c2a0OkOsakrR/SGZIHIWoqYFYU=;
 b=0Tg7gQNeoRmvKXwTat1+LjnsA8at4xaWDfvhg8J5exsHx0groKhLKGVv3fatkAN2XhlY3btbG1JxyBu8Zsn1wTP8YQdAEj9i/9yM2qEnvFkCX+0228c/pHdDErdX7z4snCmLaxznoD9/LGT5B62zNjdgRK2Dy9YwAQD8GoR2R0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5266.namprd12.prod.outlook.com (2603:10b6:610:d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 17:25:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 17:25:59 +0000
Message-ID: <d1f9bd54-c608-2051-7ae9-e0029646d38c@amd.com>
Date: Wed, 15 Feb 2023 18:25:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 01/16] drm/ttm: Fix a NULL pointer dereference
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230215161405.187368-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: b0685ca9-9a56-438e-cddc-08db0f79b3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tc9JWEFZgz2kNWfc5t4G6W4WGE5kGWIap1VWrTRwzBzs8fMUldxSLATX46HGlWmD0Dt+kTiWKhdh2NkaEu4I+Y17zN9DgO3G7fhv0+l9ubq55MBrUx7wBE9NksLz2O1pfR0h5+jxsSJdIC0peTC35rJhaSoStXfmYEs8r+vEzGq6GfYnuLiu8QeI6Aq3itSBVrau8tEptjuGPfO8fBZO+wFX4H9XBFCae/bPlsKoPVZldQltC7NBfBoMPVWLSMEo1rEJqOBCdrAqRHe0yyAVtpUA951+t9gu6cHM3L2SdgtzuQvACIqCubbMggFMJn9GWxVezrvZ4/WOJRbixTKFxFWtnQ/ObswQ2AxZTnPH5T94NfLTosn3A8B96d32nD7O+vTCFU/kCYc7Jh8CV7wbeNsCp9brJN6lZqMm+mEnQb6/qo77L/VK3k2uACM6zTup4NTlqPtldW2sTdOl3X1synDO+FtzWKBpoC7YeWU57P2GvTbH0ok72ogcy2yDjf8cpXiyvRQPr/Sdk3xgr9FAYb0N9t2xTLtTfYB5E8RVvufRhUKw1Aj179i6m3DpIocU0XB/Uw+kV0TOY00nvZ8B//IQAMrQqMEx3ykLNVFI//jbWAApqhgb9OIn+lxdbAE/E4LDvANXqItNbuD+wP5PUaHREcUDizNGJhbWg46VnGkGnA5lwl1FoEQ3RFsIv2OGVhyLzsVGTh4/7IZWGgRuqo/P6araaqlLNZHuyZ6QdE0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199018)(38100700002)(7416002)(5660300002)(8936002)(6486002)(478600001)(41300700001)(2906002)(36756003)(186003)(6512007)(6666004)(2616005)(6506007)(31686004)(316002)(4326008)(66476007)(66946007)(66556008)(86362001)(31696002)(8676002)(54906003)(83380400001)(66574015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG9Oam12Yys5b0xDN0tISzAzODJzZHRscUxZcGxVdTdubG1sK1U4eHVVTmpH?=
 =?utf-8?B?Q3ZqWkhVb1I1OXRja2F1dmpySEZxZmVwczNFL3VJdVRnbGFWdS81RzlrQlZH?=
 =?utf-8?B?T1ArSldtRStHWkhYejl1QzhCU3pIRnFmdGRUZEtBRTB2STJYZkgxN3hzenNJ?=
 =?utf-8?B?MVA1OVVzZEhnemJPY0VzQU9aVHZWL2gyZGllMy9yUlFaNFBIT3pzdVFUd3lU?=
 =?utf-8?B?OTFGSk5JWDkzYzJPa3ZyUDIvS0xEYWV4VzlGb0I1MVhNbi9VM0x6NEFnK3hJ?=
 =?utf-8?B?RkN2TE9KMUJtYkcwUzFEMi9JazRxRjJ0SC9Dbm5UYjRkbTA1ZUtIQ0gwNHNL?=
 =?utf-8?B?RmlQUFpVZzZ5b3Z3eU0vNWZVWkhJdzJrVitaaXNMYzVtRlRIYnZENnk3eEVC?=
 =?utf-8?B?cEpVRExJUWV0ODFmbGVyTGhObEZ6NTg3RmIxd01tZ0xpRTE3NE1jU09XVzhp?=
 =?utf-8?B?amZnaFdwTUJJdVg0dnpSM011bEVZRU5yeUdvTnNJRjNZSksvdlRkMEV5MzY5?=
 =?utf-8?B?TlRKM21pbmJlTTVybFd5c25nTzNNOW5RV25VQTdjUlozOGJpRkIycDVmaWFW?=
 =?utf-8?B?VFpUcHFzaEwrVzd2a1RkZ1NPQjFwMjZ6MFlCT2xBT0FwVWZPMFFvdjFNdmtm?=
 =?utf-8?B?cDBHV2k5a3FiK2hvbW1wbTBMbStpZUNuQXFlN2NWcDR4MEV2ZmJnWXE1ZWhT?=
 =?utf-8?B?cmxUMnRhZDFKbWJWbnhrbCtzTFZpeEZaRU5OYWY2SmcyWi9ucCtTQmtRb2g2?=
 =?utf-8?B?aGlCc0JQaEpXYUxPcllFS3M1eW85SHNpcTN2YkdCa0psWjdrdS9MeFVldnBE?=
 =?utf-8?B?RHgyN0hxWEdoT1EyMFlmekpPVlB1TXBleGN3YjhKcndkb1lCY3poT3Z0TWRH?=
 =?utf-8?B?eUcxbkVDVkVEa2dpZXByZXhMalBYWHowWHZnWTZHKzdNdnBpZjRuanR2M1BU?=
 =?utf-8?B?NVpnYlA2VmZBYTFJRzd4ZVgzNjhtSU5VVWF6cEp0bS9IUE10OWV4YUo1cjJy?=
 =?utf-8?B?K3J6QjF0dElidGN3bi9CZkdTMzd0N1RpeVNGc2I3bElJcEZtNklGT1NXS2xo?=
 =?utf-8?B?MG82czN4K1YxVzEzSTdaRFJtNWNUVDJKcTBpUzRwbmRnYkpvc2JKRFl4eEF3?=
 =?utf-8?B?bUF1L0pPV0c0ZkJ6bHpRZERidEErUXBiTGZHL1oyM1pLNVJHWVNUQ0tmTzZP?=
 =?utf-8?B?V0xVYlozdW9SMkJDSjl5WjM3WHRKOS9hazg2Z3NmcUg3bDlZV1JpUW1HckJl?=
 =?utf-8?B?bHVQK3NzMzVRdjlpVG9TTFhqS1NJUmViSzFyeWVpOXI3TFJ5alh0c040L1Ax?=
 =?utf-8?B?TnkvNzhrbG1wV0swakV5YVQ5UTF3cjlLa3pUT2p0aHBaT3Nwb0dQa3Jqb3JB?=
 =?utf-8?B?ZXFpZTBmcUVZTXZSQTlNdEQ3YlVDb241aFZlVHdJNkFaL01ZRXd6cDNVSEpF?=
 =?utf-8?B?dmFhek5XRHhGSEJuTUFzVVo0TXl1RmdnYk55SXFxTm1wZFYzRGF3Y043Rmpi?=
 =?utf-8?B?dlZHdG1tUDF5d3J5bmtycXk5bnhSdXkxVG9IZ0d4b1VVeUs0ajVLT1J3MENN?=
 =?utf-8?B?Wkx4VmFsdC9FTEhiNVBLT3ZXdnpRVmZWcENoWS9FbmtKaEZkYlV2aFBUUS9a?=
 =?utf-8?B?OGVnS0dTcHYwQXZrNTZoRlFnamEyS2tvZ0UzbW1pRXJKWHRiOStCcmRVWEc1?=
 =?utf-8?B?a2pmeEZ4b0kxbS9BMnBUZldqQTMwbUJsUTIwMmRTOWhXdkszdWJ2WmdpRVdN?=
 =?utf-8?B?RjdqcWEwS0VESkxCVzEwWFQ2bjkrKy9EVVV5eE4zTmFFdWFEQzBRaGd0RTJs?=
 =?utf-8?B?dUJtOFNtS3JQb2tLSERiYnFWMUgrUW1INUt4VDJQMzk4MTVOdmFOK0lEWS9E?=
 =?utf-8?B?cFFPSGl0N3lhUU1aWmhnWVJpS0poVWl0aVpPeXpkcUpKTGd0cVpKd2VmRDdp?=
 =?utf-8?B?bWFIZU9QN1BtckhjaHF3K05ESzYvMnIwb3VNanQ0OWVUTTFROUtjaTRySkNO?=
 =?utf-8?B?UElwR1oxNTQ4aUF0SzJCT29Eeitiam1hdmZXNTRXM2xpYm1ZY01jSWo1SzVO?=
 =?utf-8?B?NW0wSGdrcHdWWit3dEdWK1FRNGRTUEpnMVo1Ti8xa3ZVWTBhdWtSU2dSNkU3?=
 =?utf-8?B?b2d6cC9KWXZlQy9SSk1Tb2tZaDVGT1lIUzFtVmhMK2RNRDBESXdsRHRLZWs5?=
 =?utf-8?Q?NDQaEYyyQA2zE1kaqq0nhj6QEKKVG6RF4/V4z9fxve0W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0685ca9-9a56-438e-cddc-08db0f79b3c1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:25:58.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oaJuXQqS7gtOdJI7nPxuZ2c7YoTWCmbD8vOnfKv1/7EHNWj71cwwxZBFsJpHcti
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5266
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>,
 NeilBrown <neilb@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, Huang Rui <ray.huang@amd.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-graphics-maintainer@vmware.com, Matthew Auld <matthew.auld@intel.com>,
 Ramalingam C <ramalingam.c@intel.com>, Dave Airlie <airlied@redhat.com>,
 Philip Yang <Philip.Yang@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 Qiang Yu <qiang.yu@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 17:13 schrieb Thomas Hellström:
> The LRU mechanism may look up a resource in the process of being removed
> from an object. The locking rules here are a bit unclear but it looks
> currently like res->bo assignment is protected by the LRU lock, whereas
> bo->resource is protected by the object lock, while *clearing* of
> bo->resource is also protected by the LRU lock. This means that if
> we check that bo->resource points to the LRU resource under the LRU
> lock we should be safe.
> So perform that check before deciding to swap out a bo. That avoids
> dereferencing a NULL bo->resource in ttm_bo_swapout().
>
> Fixes: 6a9b02899402 ("drm/ttm: move the LRU into resource handling v4")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Qiang Yu <qiang.yu@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index c7a1862f322a..ae2f19dc9f81 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -158,7 +158,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   			struct ttm_buffer_object *bo = res->bo;
>   			uint32_t num_pages;
>   
> -			if (!bo)
> +			if (!bo || bo->resource != res)
>   				continue;
>   
>   			num_pages = PFN_UP(bo->base.size);

