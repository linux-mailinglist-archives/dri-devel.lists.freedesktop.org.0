Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKx7Mz28fGlVOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:12:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 838BDBB7A4
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:12:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF2910E359;
	Fri, 30 Jan 2026 14:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZFc1cG9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012037.outbound.protection.outlook.com
 [40.107.200.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFA310E11C;
 Fri, 30 Jan 2026 14:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oor5f8EBwFwBqPf9ZWqmChBuKGv2FnmJl2pA90bkD+oqLISSngqqViIfNriwtYx7te54q3q9rvRqOORiKoqZNSPaVWFsZzax1MnoMqXQasotzvUg2cDWgb9/69uRYxdNtgIhEa34Ae3I4zTc3q9iFWz9MnYCBec8zOJ/hG2cuxBqTU/zPUOfAylH+gu0QvbFcRtNtP1KUul5Fssm9do4673aY5cGIFYmcRXWv6gqKdOW9cFuXGgYCvgS7psMiNVYoalzDeJkrWPlwZ/QEMprnlOn6eE3fLX9c30H0GsJNfNJVWH/FoqxYilzf0IuXlQj5sFTe6qvDja7aX5JH5e0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0Vrv3AkvdMZ29eLPpXU8HyjBJFGxu7rqwWne1gOrJs=;
 b=qlOkhlbQ+HSKWYDuP55HwgeBWQ+Id8UYYyOMEe/6Cg/IQl10bsXf2y6BKjfcpm7glaM9SMtvhNq/PnUUA4cOCcjAvkbBXs75mh4SQDm9DE/CzEnWF57BpcdHen5NQp+2In73lBCz9QPGLtWyMd6Cp8n961sDwxoJMn6hLPoYImlx3LMnng0GVwpBjcI1ImcTQtKsAB4IQcdUaYDlPlXhebzcLXQxL4uxvJ2ifJIOZrakh/OtlfSTgZH2w0YEq++3Z+Ew5whlXEOEJ2eWAIuufOY1az7OGYpZR1XPvsqkQIm2ERl8Tdhg2Mq/8P+5OKIEKlcytYGkw5L7789e0FS44A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0Vrv3AkvdMZ29eLPpXU8HyjBJFGxu7rqwWne1gOrJs=;
 b=ZFc1cG9cdGXJgkiaDkrplqj9L9XNAkPiJTxZWYoTVHxjLm8yLBssfSZtPZiETxswUaVLOtYOJUMVjPx5mPPMduFHVg3r0T24jiCRonvEvER0H3nUrUAfD8sPbPL1S87yNs9lPEz+6hZGxx80+Vul8dCKqs8JDiG46nsp//+0fiQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6199.namprd12.prod.outlook.com (2603:10b6:208:3c4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 14:12:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:12:02 +0000
Message-ID: <d1dce6c1-9a89-4ae4-90eb-7b6d8cdcdd91@amd.com>
Date: Fri, 30 Jan 2026 15:11:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Felix Kuehling
 <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <31872c87-5cba-4081-8196-72cc839c6122@amd.com>
 <20260130130131.GO10992@unreal>
 <d25bead8-8372-4791-a741-3371342f4698@amd.com>
 <20260130135618.GC2328995@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260130135618.GC2328995@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0971.namprd03.prod.outlook.com
 (2603:10b6:408:109::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6199:EE_
X-MS-Office365-Filtering-Correlation-Id: 74e2b3be-7c51-4e28-2d33-08de60098a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0ptTG1VRUVwK2ZNU2pkdkZXdjVyNmY4MFlLUU5kVDBWUk1neWZnS04xeTl0?=
 =?utf-8?B?R3pMR0VONllEbmtzVjFZNTlWamZIbnlzb3grdk0rcE82T0t3UVVXSWF2V3Aw?=
 =?utf-8?B?TXJ0aWZpbkpYZ0hZL3dDb3J0ZnRhM3ZxUUEwek44YzlhQWJoUTNwRDR6YW1i?=
 =?utf-8?B?c2JlNElNV2ZjYXJrZHJvNkNzZHdmSkxyY1BUbFo1OXYyODRIem5Odm5PNmV2?=
 =?utf-8?B?cU1ET0xMNUJNMGtueDZLSWxHQ01RMDBaUE5XVVZJVWtoRUlPSXpuM3RXWjEx?=
 =?utf-8?B?QTA3VUZESGsrdkFHQzRaa2ExMGcwaVJEVWZJdTJuUlo1ZTV3OHVaVk1RSmI4?=
 =?utf-8?B?Y3RiZWUrUERybGJFL1ZIUWNUa3pFNzVkcHNDZXVwUjRiUEJocFRaeWNUZVpC?=
 =?utf-8?B?NE5VWGJxaEhJc2lGeHQyZ1lYU25IalNibmphRDE1Nk9UL0pHV1hqR3hseHEz?=
 =?utf-8?B?djM0b3VlMFB6Z0h3VytuOHZ6MEdWTWZHa2pXQnF2WEJJTkZJYjl2bzZwRVVu?=
 =?utf-8?B?MEdYQ3BaUERkWWdTb0ZORVl5cDVZQnYxZ1Bna05VUk1obXZuTGkzVS8rYUVz?=
 =?utf-8?B?cWNpc1cvdm8rZnoyem4zeHhxU0p2SWxtcGU3ZmR0ZEVNRlc1blNVc0FmSGRD?=
 =?utf-8?B?RGJORTRVTFBBSVNsSVFsaE9sdFd5bWl6SXNwTHBWbFBlRHdMcnhaZXkrb3Fq?=
 =?utf-8?B?Ymo2ME1QVHp1aS9oN2IrR1pMTzdwdlcwdHpCaXBCWU4weHpBSDFWc2VUOEhJ?=
 =?utf-8?B?WDBabW1Nd2ZUYjdkNXNmQVJ2b3RUNXJsaGhrVEpEM3ZqTlBaaThNbkZjUDJI?=
 =?utf-8?B?eGZkWE94TmRWZEZaUXU5WFlxL0pRd2FLZ3FoSlREQnJnY1lTZmY5Y1B0ZVhh?=
 =?utf-8?B?MnFZczZIRWo2bDhPT1NwYnU0Z2tqQkQ3YzJpVmtGaUd2bUtqd1VnaGJObGFm?=
 =?utf-8?B?ZTA1SVVOM3dTeHdyTmIyUjZ2MHRkem5BUC9BZ0dLalhvSzNQNE04bnFtbUJt?=
 =?utf-8?B?aWtuaEhMVFFFamRGb1UzTzNKelkveTI3RERzbGNvZ0FkRE9zM2FLV3hpR1Vv?=
 =?utf-8?B?dTh3WjdQUnRSZ1Rla1FjbERwMHpxN0xrSVpod25ZSEM1WkxKS2IyNFZ0YVp3?=
 =?utf-8?B?aVV1K3V2dUJMMEtLUTdoaGFwVzVxT0ViUlRRckZXbUJ0dmt0LzBBT1gxdWxD?=
 =?utf-8?B?MndvZlEwWUk0SW9VY1hneDBrZVlLdmZPN2s4N2tWM01XNExWb1pVK2poT0h3?=
 =?utf-8?B?ekc1U0tIaTdySVluUENTTy9vZy81dHUxbkxvQ3VqU2J3bmM0eWw1S0JJNWlN?=
 =?utf-8?B?SUhoZldFVXZXVFBtQjZCRk8yUDRBdUs3U1RkRW81MGxGL1BobkJ6S2txSGtQ?=
 =?utf-8?B?VnZGdS9VL2ZKMjJLNHBJMGgxTndqZnM5bm1JdE52cFcwcTc0UHA2ZHhWWWM0?=
 =?utf-8?B?bUxUdXlyWG43QURNMlpjeXFGYlcrRjNKZUwvb2Z1NERuSjFhZG9rOEpIcjlD?=
 =?utf-8?B?NzBYeEtOcWNWeEliRmdtMnNCWXZEa29KeldMV0RhU2FVUTZ4Z0t6SjBGR015?=
 =?utf-8?B?Qy9QZ2xRTEh5cElMRFM5NjVVRlhFM3RsVjBEc1JDWGhrQXp1WjB3bkRmc1RG?=
 =?utf-8?B?VHdoL3JzRVZoMnRMMnhqZ0RZNkdRTzdDVDJoK2U4Y3RUQ1Z0S0dHZ0FFYnBh?=
 =?utf-8?B?dW5UMFNsQ0xLTTUyL1h2TWdTZEw0c2tRWUo1Q2tMdzBCanJBQWlpbDF2SEky?=
 =?utf-8?B?Sm0vdURlbnpzQ1czbHlyZkQrR3dPdGFFcU81Q01ud0lRN2tMU0FQUWtaWDVK?=
 =?utf-8?B?ZUNpdzV4WC9zTHlKc0EvRFg5L1Z4UllqdVl0amcwRERsK1l2NDhKWHRRdXZC?=
 =?utf-8?B?NlVtb1U1V0prSzRTc2tBSisxWWRlRzlJS054SVc0azFMdytkazY5c2FqWnVq?=
 =?utf-8?B?aFVEQVdTYW9IMW53R29HQXJrRlJCaTJzaytDdXpHQzY0TkMwSHlDRGhBcnhM?=
 =?utf-8?B?Y0gwNWtuNzFsZFFRVmgzeEZSaHI4UGF2NUNNZjByMTc1OXpVY3FUYWhXbDlH?=
 =?utf-8?B?TnlVbmpWTEV1Ti91R1JNUDdnWW5iQ3BCUmhweThsS0o0UG81YVB2NDd5WnN6?=
 =?utf-8?Q?qlcU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXcvRWFUaVRSREZobjNWbjZIaGxlVjZ2THlQU0tHZXhWNmwraWRtN2JUbzVq?=
 =?utf-8?B?Sk1WQk1GQ2Q5VVhUMm5LSkFzMFZTMkFYVHA5RzFwMnEySnNmUmdLQlVoTXJW?=
 =?utf-8?B?SjRhN1dhQVd0SHVTNHVnZDFRSWFUMURlTTdoZHh0K3V1Mi9NQlluRmN1cmVm?=
 =?utf-8?B?Q0pzQWEwN2o1bzFHenRGRFhWclhtRVZ6S3RvZ3hBQmFETUQvNUYyWXRhMnFy?=
 =?utf-8?B?RVByRHFzeDZHdjUxTWR1Z3hod3ZHTmhaZXVQVXVlNzZtYWd6dHVWVkF4eFF2?=
 =?utf-8?B?K3RQS0R3eGh0YTF0N3M4azJvZXN0MGdEaTdkTGhWWm5ZYVlmd0kzL25LRDAv?=
 =?utf-8?B?VkZRTjJJOG5zTVRjZTVDTU5hMjlseWMzRG16S0ROQlBQS3FUYWNSQ3p3S28x?=
 =?utf-8?B?WEllbEF4Y3g2YzdpRUt4VXBWNHRQVHNyMFBPNnJSOXNIYXE4MmJVbmUyMS9s?=
 =?utf-8?B?YnQ3ZVA3WHBTdFlESEozSlBKQXBzanhtTnV1Ti9YWkdGYzJ4bWRPeS94cHc5?=
 =?utf-8?B?d2FOYVR3Ni9tSlRDbkRNRmdkVkJ2SkVRQlBIdmdNb2hoMEZHQnV1VFJSWUZK?=
 =?utf-8?B?NUt3a2V4cXlieVVtdVBqcFg0Q2s2R3lmL0o2MHEzeUpVeTNzM3lkalBESStw?=
 =?utf-8?B?UHRwRnRxRjhxa25RbGQ5RUNoSUhwR0tvYkduVmErT29TQWZLUGpYMWwwL01x?=
 =?utf-8?B?Mmc4NzJEVS9uRVdFWCtDd2puK2MyVUFmNGhmVjdsUWxabm5kV05mRGZuV0NC?=
 =?utf-8?B?bE5sZDlZU1lPK253ajlsaks5Z2RxaktkeVlkY1hzejVPZ1hyMWlaWW03UW14?=
 =?utf-8?B?OVBIQU8zcUtlQ3ZqS0VtcENWRXp5dnhYZ3I5SVMzb2VYcmM4SkVQK056N01G?=
 =?utf-8?B?bGV6U3VkQWdaN3BTMWxiRWFiNFZLWDJIblkrb1QxbGdWaG9MOWh1VGI3a2lV?=
 =?utf-8?B?ZXRRNXJhbXc0V0RJcVgrWklvOGx0NlgyZEdweEhFSHlEN2ZDTHdmUmMzM1lW?=
 =?utf-8?B?M1YxWS9DM1k4cGZJMTVFcHlxV3RuNzZCVHgwT1g3aWh4ZGI5MFNLdW50eTkx?=
 =?utf-8?B?NHZ0cG16YitwWnZrUHNiNE96elZMSUljcXlOVkdGQVBqejZhbUZ0RW1OeThQ?=
 =?utf-8?B?Znh3RFVpalk4cW9QV0ViNCtwMFVQOGF6aE5RUkRydlQ2Sk1kTWdVQ1Vpcy9F?=
 =?utf-8?B?ei9LKzQyYnhrYlhNaENwZlJTek5kY09lZUhhR2dhNkRJNElva25BcHBHWEJG?=
 =?utf-8?B?NVNGbFFQemVJQml4eWREZWFxRW9Wc3J5b0xzUjZQa0JZU1g4WUxsR2JNVFVN?=
 =?utf-8?B?Qm9CY3V6WW5nUkZqT3RJeFBBUXNCNHh3WUcrTEdONjJMNG9hbEpLMWM4ZTdx?=
 =?utf-8?B?elN1U0VmYmovTzBKNWRoZHRBMHBlUVZ1K01QM0ZCSGEwYzloSCs1SGN5UWVj?=
 =?utf-8?B?L0FKa2F6dXhWVmhjeERhTlBtMnk5SUR0bW9HKzRJOEg2dGFrRytyWXJXblNF?=
 =?utf-8?B?ZWJOdkN4dzdGSEFwR2ZRVzZoNVBLbUNnRkNjaHhlVHJFSGtlS0ZoWTA0Q0E1?=
 =?utf-8?B?dG5tVGUwK0JyaVZxT3lwNjV5eDZkcEtqSUtFZ2EzSVhGa2RHcXNjODNrbTZG?=
 =?utf-8?B?dkNIV2JhbE9oYmVLTkd3UWUvY1hyOE02VlNiVnR6SzBLek5PZkRKbnR5T0Jt?=
 =?utf-8?B?MDJJQmRxL0tESmZHeGRsekdvTU1hMG4xc1huMUNMS1BWTmMyMkhMZm0rU2V6?=
 =?utf-8?B?YUhNYSt5eGhPNWM1ZlNGbC9JNzRCQzZDMlhEMGFiWnUraVNGYWdQY0kyeDZU?=
 =?utf-8?B?c0hCZDNPb3Y5RnhmWW0zMlFSZlFZdEx5NmgwVEpjUnFyNlQraEFkanBSaW13?=
 =?utf-8?B?YjM4N201aVlmb0JZMEJ1d29QdmpjTmxwRDJ0YUdndkw4NDBUR28zQnV3NnN4?=
 =?utf-8?B?WjZhOTZBUG9OblJDQjFoT0FGVndQRHZpSHJQRFcwbHZCSHBJYUU2TWlXOHFq?=
 =?utf-8?B?N2FreVhWTVg1RWw4Y25CeGxXUWxUajdCRzlBVUZ3cnkvd2J6SWlsbURKc2RZ?=
 =?utf-8?B?enRFMkppMEpkQnJBS1hGb2RDUTJuN243bEMrdk1PYzM2Mi95RmVFTFYyRkRz?=
 =?utf-8?B?QzJXblR5bWdBcmhWblpjOW1mamZwdzhZVWVSMlhLaFFkQ1YzVm9memNGWElu?=
 =?utf-8?B?b2hucEtPclNtbXAreVZ0S2pvRVZGR2t1TzUvYjZBQkdWdGcwSkhzbkl6c3Bm?=
 =?utf-8?B?OFFJRWUwYWJNdGVER25LczM2RW5wTXFRbHNFVW5TWWdjblFuMkJEcTJhdmVX?=
 =?utf-8?Q?jdBa0HcQC1pRHCXXuU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e2b3be-7c51-4e28-2d33-08de60098a59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:12:02.7441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4Y4bhxlfVZ4Fp/ZZOb6v5+AzY2boOyWPzNPe08LEF1qW2PnQ22E8jCZo1OgbKa9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6199
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 838BDBB7A4
X-Rspamd-Action: no action

On 1/30/26 14:56, Jason Gunthorpe wrote:
> On Fri, Jan 30, 2026 at 02:21:08PM +0100, Christian König wrote:
> 
>> That would work for me.
>>
>> Question is if you really want to do it this way? See usually
>> exporters try to avoid blocking such functions.
> 
> Yes, it has to be this way, revoke is a synchronous user space
> triggered operation around things like FLR or device close. We can't
> defer it into some background operation like pm.

Yeah, but you only need that in a couple of use cases and not all.

Especially when the device is idle exporters usually don't want runtime PM to kick in and try to suspend the device while importers are still using it.

> 
>>>>>  		}
>>>>>  		fput(priv->dmabuf->file);
>>>>
>>>> This is also extremely questionable. Why doesn't the dmabuf have
>>>> a reference while on the linked list?
> 
> If we hold a refcount while on the list then the FD can never be
> closed.
> 
> There is locking protecting the list so that it is safe and close
> continues to work right.

Ah! You use get_file_active(), yeah that should work.

Thanks,
Christian.


> 
> Jason

