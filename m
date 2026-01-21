Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFK+IZqUcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:55:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C723553EE7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4072810E718;
	Wed, 21 Jan 2026 08:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T6P+zCDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944E010E718;
 Wed, 21 Jan 2026 08:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzqfJD8xXtCZWpTobH3XhxOUtQ1x/WW63JCelHpXOD5LlChLjr/iQlcEvJbVLwH0XMsZzXXyiAo+F0Tk7cQZhnLLGUngoHoZ+q/aAkcFFUA/yP9gM5O7gKLWxMG1t+0+AiJ27rDW+kd27gUiqa5gbghkKz/GGrfYU+VNDmv7jiloDyWJilHNmEB+rxd6n0QNXfy4jDMpUKt8lnZ2kmqNYFYh5TMuELKsIbARb/Y7TXxm/6GNboUcQrHZQU2gxykRXGrF74wHc4rWjnRMWAqwy8Ln1snqs3rasBfXtj/MkgWLEPzThY4pLYO0LHLBQm3w5D5MtCYVjA+DaLYnG3VGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EaxahQurKMG7TRqOYo5QhmI7KQPc993qVH4FJr7qWY=;
 b=QVkJs7I0rEMkYs4aIAtMzfklt2gfmFHKXjtkkwOlAQ9vbSyt+xDLKnM6XcTONCQzqSH1qVpRHwKiqRtYUfrIp0FDBWIbQTWR2SEBgUoOeGMQOnwO7NXy5Xr0Y3dGxkkRv7F2CzKfuBirUGf+niuJQMpkqJcBRRNxllOH7wqK0xBzqlMJ29ROhZSqXImUR0PosSF0Q8M4TZ22E80Bd20zI858YqKdFGbcvah2Pk+OnOjn1WGebqMNtbjUcOShDEE+TC8aCU1xXNJdaKa2JVq2SsZxCVEdF6T4x5xUGKZKEhhiOmHUxzQ7ZsouK1I9VkBZxathlMblR/br9H6w4FlMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EaxahQurKMG7TRqOYo5QhmI7KQPc993qVH4FJr7qWY=;
 b=T6P+zCDxcBns3NLFMS8xQ+Krv1IV7/LxuLTJ3go55heQgHEacUP2qk4MOgkW3DzloRh6Y7oLz0HJjIY+IktmRUr152ptyFoy7olCtRuJX/1SGsBiByQjHUvT8nlUES7jV+bvkp+lRy6/eqSn+cP76DxMkPSqvhSwqUxomMxba+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6685.namprd12.prod.outlook.com (2603:10b6:a03:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:55:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 08:55:46 +0000
Message-ID: <24c7a7e6-b1bd-4407-b62d-4d9ea4cdeee4@amd.com>
Date: Wed, 21 Jan 2026 09:55:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dma-buf: Always build with DMABUF_MOVE_NOTIFY
To: Leon Romanovsky <leon@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
References: <20260120-dmabuf-revoke-v3-0-b7e0b07b8214@nvidia.com>
 <20260120-dmabuf-revoke-v3-2-b7e0b07b8214@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260120-dmabuf-revoke-v3-2-b7e0b07b8214@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6685:EE_
X-MS-Office365-Filtering-Correlation-Id: a173334c-7582-4858-f453-08de58cade0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFSbFdHenVpTHBJQkw3MC91R1FQZEpnUDEzM2czSWNHbldJaFQ2SSs1TWpm?=
 =?utf-8?B?cEpzaDJhd3ZySFdoWkQvRmU0QmVwY1B3ZTM3TFhsNzQ0YzdLMHQ1bjVJaUhO?=
 =?utf-8?B?bjBNYkJnRm9NL0FZRmx3VGpBQWg4T1BpaEpHaC9ld0RKRHRYNldJTzI4aUo5?=
 =?utf-8?B?SnNhR3RIUi9zS0VYakltcVQzMUdRUWg1L3pPWm9OUXVDMGJSNEpYZE1iWVhV?=
 =?utf-8?B?eThNN2dkTDROOGFFQWt5N254ZStyd0tmREwxbm1vMldBRGFuc0FFbTlCdWU0?=
 =?utf-8?B?ZVNpdERUSnVPa1o3ZHBFMUtyZi9RaVhTckxpd2cwMzZYeVZ3WjI4Ti9xRHh5?=
 =?utf-8?B?Wnl4b3dMcG1EWlZNb0xJdlRjelNtdWZNenJueWNHa3RHdnY3WllRdUxRU0lO?=
 =?utf-8?B?VjVxdE1HYm9xZWFjQjNXLytEemV1SThQRTlMb0RIZC80OHJzYjRLUXFZaGZi?=
 =?utf-8?B?RU5wMW5CS1VTSVoxb3ozZTZ1bnVXV1hZdXBrbU54cFR3dlpRS2VodEVFQjZN?=
 =?utf-8?B?REZ4citFR0tVNlhvNmdWNEFBckw1djhaTWZoZGRPYTZxUUtWS2t3Nzl6blFG?=
 =?utf-8?B?VjdYNkczMU1aSk9XaHlYeFdlcnRHVk5xeTdEV3dzSWt3OWozOFVhUVlvMG8v?=
 =?utf-8?B?Vml4TG9wNmdFa2ErOWYzUGNWMDNaVlhnK2JDREp4eFlqSGJicFNaYXplamc0?=
 =?utf-8?B?bWNpR2lRdHgxZTRIRll2bENQMU5CRzdEaDc3UXkyK2FLNWJrYlRFZlJoMUc4?=
 =?utf-8?B?cFB3NVd6NW1FTUJuK0NyNFNpbTNhdG8rVjAvczl5NHU4Mk5WdTdod3FhWCty?=
 =?utf-8?B?eVBKMmtKbnhCNzZibmNTY0phbGRmZFM0N1plNFlPRkJFNUtUOUpIeTVpaEZ2?=
 =?utf-8?B?Qk9PWmc3SUNFZlE0MC9UUkxHd21uOVlTYjVmcWUwdllPaEZWNk4yam80TDNP?=
 =?utf-8?B?cXRvK2RJN3ZCRkx0d1lvOUZocGFKdURZTXVTYVVhNVJQclhrQW9Zbmkyb0I2?=
 =?utf-8?B?Q1NLMlZCNWlZczZlRU9yd3AwblRFNHFkUGQ4MjArV3lVREpoVGEzS0VFZjhP?=
 =?utf-8?B?R3BaK1Bka2cvUGdMYjhlU3BKUER3bVhKRDVBU0ViUzloeEVtdHpBWGt1Rk9z?=
 =?utf-8?B?UXN2N1dvbjFOYlRuci84THBlY0x5V04vTWRWY3hqZzJ1TkZYMHBoQVdKeTVa?=
 =?utf-8?B?cVg0OXRDSllMY2lCYS9PSUtNZnVTV3JvK0xubFZsRS9oMEFXdWpxOWZkTTZj?=
 =?utf-8?B?d1M0d2ZkVFA1VFdjNDV4UXRzdlh5N3pDNEQ1L29TUHJHekJXdmZSN2cxeUVG?=
 =?utf-8?B?ZjN5c3FtQlF2K0phOW43bFpuWSsxd3FsTGdRWjAzdDkrdmJmODByT0RDVzhH?=
 =?utf-8?B?QTdDdklLZVZSOVd5VUJJSkNlZmpvWUdMMXpVc1RlcFozN2NUNWhFOGZnQ0VN?=
 =?utf-8?B?M1ZLUER4Y2Q3WGxuNmMwVStVV2JjdEJyU3ozS2dqNVJLbjZjMW1ITjR2dHhl?=
 =?utf-8?B?NG9Hb1o1ZnJ3Nzd4Z3pWWnEvdC9SN1J6TGg4ZS9DWnE2SnQwcHhHc21CUkRn?=
 =?utf-8?B?dlBkeGJLVWtSZjltaWNRWkZUMUljZ1FQSzVyU2k2Lzd5S2ZNaEZVUElPZGJx?=
 =?utf-8?B?YlgxQkFweDNDMzVESm9pTmQzekYwRTBybTFwMmVZZ1VZREZoMnNQYnYrU09j?=
 =?utf-8?B?Vm1oWWduc0J6RDd4bDR3Vy9NOEZ5MlZhUXh0ZmR5MmJhVFY2REdSd1RweGdL?=
 =?utf-8?B?aUFhakFYZGNHTU9qTmRUMUx6Si9LUSt5anVGQmJsVnBDK1FYWi82ZlBZN2hH?=
 =?utf-8?B?ZG5MZXBCbDJjK1BSd3lyajJQdGtDRkNSa0E4clV6ZVlKcUhMakk1MzRTY29t?=
 =?utf-8?B?Ry9acnRzUlJnUlM4clNYRHhjMjNIdnlwRjN1ZWFjZkdlL243bE1Zak5MMTVK?=
 =?utf-8?B?RTg1T09nN2p2aGk4eFhIRU90M0hWMmVKSzlUODE1ZEN6U2x3TzN0U2I3dVdP?=
 =?utf-8?B?T0lsckpNZVlvcTlsWEgweVhQTFdhRnZobkdiQW9hU3RINTVCbjh5T2dBY3pL?=
 =?utf-8?B?RlN0Y3p5eHNjR3BHL1dSUGI2MjVwRDV1cVlPVWtVU0xvWWV4TlhYWS9KVXZC?=
 =?utf-8?B?Rm5iRy9Td2RmUWpOM05yVDZCR0dBbWVBUEwrWmpxeGQ3Z2QyaVA2TGlJZU9z?=
 =?utf-8?B?V1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXVJSlpzWlN6MW8zeTZHbnhnMUwwVDBtWm9icFUxbnZkL3lSbGRPa21QdjBn?=
 =?utf-8?B?WTFyc0ljSWlnKzgvLytWV0dqZ1NBU1JUS0F2KytwMWFlemJMbm1kOGk2TzlI?=
 =?utf-8?B?dUlBUHJEWDRlRFFjVVJja2RZaThOMVV4aWlDWGtJcW56eGdkNjJSTkVodEpR?=
 =?utf-8?B?aHFqRjZLYlQrNkxkTjVibWhCdEZRS2NNT3BrcGZ0VnN1cXJnbGE3U204ZFdI?=
 =?utf-8?B?emZWbk90ZVY1N080VTYwd0tWc1IzbFg4WVJWa1g3UnRkaFlIN0V3cis2Z2hE?=
 =?utf-8?B?cUw0QVROR3RFazVnRjlNRmFTL0RzYlE2ZHVWUnVyUU82T0IzMkUzM2FJbk9Z?=
 =?utf-8?B?bFN4Yis3MVJXMFFjN05VY2ZmdDJzRU5uNGxDTS96bDJJUzQ5RmhGaldQSnRk?=
 =?utf-8?B?NlJ3SzNKZlhWOVI1czNVQmt4WUhLdTNtckdTU0Nxb3M0Um1CckJJY0VqQjEz?=
 =?utf-8?B?RSswaElmTGxkcUZOeG5MdEpsengvVkNqWTJDS2wzd1VFaTF1OURMOXBaNm1H?=
 =?utf-8?B?alI2cmcrcW5CNmVKaG12Z1g5blJGalBoYXpqTVh1dFVaZWdtdGxkMWxTelE0?=
 =?utf-8?B?TGc0dDQ1QkJDSHo1QzN6SGQzajF5WERPN1FTelFDK0pzNUZ4SU1vNnRRTGp1?=
 =?utf-8?B?S2sxZGdONDcwTGRyWlR3ZGRJR2E5WWUyWlhDbjJvQ2VXWXlIUjNuOFdnTGxF?=
 =?utf-8?B?Y01FMXdDbVhranc0THB2c3U3UjZ5Yi8vajZWWFhhYTY5R3ZvR2pZNFVoMUZk?=
 =?utf-8?B?M2ZTZ1ltakxqclJVZE5KaVBGRUZoR0dQbkxqZnRyTUtFUUFIMXNFWmYyNFlG?=
 =?utf-8?B?c1RSNWpLNWJrMnNSTXM1eXJEanI1VUhLdTJFTkY1Y0hWNmhkOWJEcGs0T3BX?=
 =?utf-8?B?TWJ0b1B0anAwOTRZamVtMDRnektyWVQxRlBqRUZ2REdDajgvZjRvbDJ3RGph?=
 =?utf-8?B?TjRCblRETjQyL2VXejJJV2JYcENIa0prRzBqbDJHYnJSc2o2YTNmSmNScTBM?=
 =?utf-8?B?RHVBZ1pGQ2gyRUpnZjRXZnZFMVF6UzlCUm16Q3pRSVFidm5KNXFLM3czTjZJ?=
 =?utf-8?B?L2h0WXpBWXhPbkxWdXpZNTY0M1h1Y1JYdjdSUDNqZ1FCMEd0U2xWS2hDa3Y0?=
 =?utf-8?B?Q21pOS9Yd3BKRUVSaEpibU9ZUFZ2Vm5PQTh4V04zSzAxb0FOSG5BVzJjelZM?=
 =?utf-8?B?NWk1a0FpNjVRMFZ2OHgxY2xKVVEwbWRQajJmcE9ZZ3kyaE5pS0tCcTJNdTJ0?=
 =?utf-8?B?V0l0TFF3bWdqUGFQTGZWYnB2ZTFiZTI2OU1ZNFdnU2NHL2NkUHlKVks4ZVdz?=
 =?utf-8?B?OGtnQm5oQUZIbHZudTRmZ2Fuemo1M3JnWmFZZTdHazYrUWxOTWtpN2ZqWGE4?=
 =?utf-8?B?RTl6UDN5WXdOSysybXYzUFRhOHdkWEhqbk9RVEk1QWFtMGhrZS9jOHdOVDVZ?=
 =?utf-8?B?WXZMeXZERG1ZWEE2ZGlRUGU0RktDM2R6bXplLzYvY2FJek5ZTmNYaXpuY2N2?=
 =?utf-8?B?Y0t1UUJrbWlKTmE1ZHgrVXJwa0NzZUNQU2IzL3Rnb21pWUd2MVlqU2tvVENp?=
 =?utf-8?B?L3FhVFNvSnZsNWpKeE9NeVNpZGZBZFk4K042ZTJ2eWRhRmR6LzFXTzBxRGRm?=
 =?utf-8?B?Wmo2dUNkdW1SdFVrR2pmay8yTW5BanA1VFk0bGJqcEhDaWRndU5Pbk1ONzFM?=
 =?utf-8?B?ckEzd3pNNVJ1TUo2cmdvdlNLbCtIMFUxTTllanpFb2FBOGZrMVczTnhJM3ZS?=
 =?utf-8?B?QmtLL0syMUxyaHVxN29JK29KSnpLYVFTcExrSXp6RDV1MWpLbTVuSXFKdjdP?=
 =?utf-8?B?bFNicXZMNU1wQ1JxTFkxL3RwNTBpRzZ2cU9CSlo0bS9KaTB2b2dWb05ONG1I?=
 =?utf-8?B?MC85N0syNVIxNzFheUFsQmFIZUQzdjNDTkFFaXIwR0pxcTdQejY1azVSay83?=
 =?utf-8?B?S1FlK0U1cFNNbGZRL1R0N256YTRiSDhkZmdhM2pNQ0xxbUUzckZmc2ZlWGFD?=
 =?utf-8?B?NHQxelZQVXZXSFYzTFJLalNIbFR4S2dHMzRHbXRYcklxbFJzakczWXM4TlNZ?=
 =?utf-8?B?SVdFcGprcnA5cVBkTllNbm1aaTlxbWZYVG8ycXBnYUFJV29IbWtnc045aDVF?=
 =?utf-8?B?MGdCbUJlbHQ2dnB3aDdBNGJMR3lBbXppT05seG5pQVF5VzVZdGs4ZHpmVjJl?=
 =?utf-8?B?cTZUN2Urd1RHZUM2b2gyMEl6aVJ4Z3c1UkhzWTQxWDBrTHJHSFVqbjkwdjQ5?=
 =?utf-8?B?cUFibXJXU1I2ZVRucVVhWTBTMEhtbWZkVVZUT2pncGZNRERSVmxwS1p4Q0VQ?=
 =?utf-8?Q?XbMw05TrSfccRE26jb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a173334c-7582-4858-f453-08de58cade0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:55:46.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iqNt9p/TBCzzOs0cssuYyFlvFxomLytu6JVZiSrssvGp6+N4s+1BkihF24hA1UfS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6685
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,ziepe.ca,8bytes.org,arm.com,shazbot.org,nvidia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: C723553EE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 15:07, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> DMABUF_MOVE_NOTIFY was introduced in 2018 and has been marked as
> experimental and disabled by default ever since. Six years later,
> all new importers implement this callback.
> 
> It is therefore reasonable to drop CONFIG_DMABUF_MOVE_NOTIFY and
> always build DMABUF with support for it enabled.
> 
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/dma-buf/Kconfig                     | 12 ------------
>  drivers/dma-buf/dma-buf.c                   | 12 ++----------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 10 +++-------
>  drivers/gpu/drm/amd/amdkfd/Kconfig          |  2 +-
>  drivers/gpu/drm/xe/tests/xe_dma_buf.c       |  3 +--
>  drivers/gpu/drm/xe/xe_dma_buf.c             | 12 ++++--------
>  6 files changed, 11 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index b46eb8a552d7..84d5e9b24e20 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -40,18 +40,6 @@ config UDMABUF
>  	  A driver to let userspace turn memfd regions into dma-bufs.
>  	  Qemu can use this to create host dmabufs for guest framebuffers.
>  
> -config DMABUF_MOVE_NOTIFY
> -	bool "Move notify between drivers (EXPERIMENTAL)"
> -	default n
> -	depends on DMA_SHARED_BUFFER
> -	help
> -	  Don't pin buffers if the dynamic DMA-buf interface is available on
> -	  both the exporter as well as the importer. This fixes a security
> -	  problem where userspace is able to pin unrestricted amounts of memory
> -	  through DMA-buf.
> -	  This is marked experimental because we don't yet have a consistent
> -	  execution context and memory management between drivers.
> -
>  config DMABUF_DEBUG
>  	bool "DMA-BUF debug checks"
>  	depends on DMA_SHARED_BUFFER
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 59cc647bf40e..cd3b60ce4863 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -837,18 +837,10 @@ static void mangle_sg_table(struct sg_table *sg_table)
>  
>  }
>  
> -static inline bool
> -dma_buf_attachment_is_dynamic(struct dma_buf_attachment *attach)

I would rather like to keep the wrapper and even add some explanation what it means when true is returned.

Apart from that looks good to me.

Regards,
Christian.

> -{
> -	return !!attach->importer_ops;
> -}
> -
>  static bool
>  dma_buf_pin_on_map(struct dma_buf_attachment *attach)
>  {
> -	return attach->dmabuf->ops->pin &&
> -		(!dma_buf_attachment_is_dynamic(attach) ||
> -		 !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY));
> +	return attach->dmabuf->ops->pin && !attach->importer_ops;
>  }
>  
>  /**
> @@ -1124,7 +1116,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>  	/*
>  	 * Importers with static attachments don't wait for fences.
>  	 */
> -	if (!dma_buf_attachment_is_dynamic(attach)) {
> +	if (!attach->importer_ops) {
>  		ret = dma_resv_wait_timeout(attach->dmabuf->resv,
>  					    DMA_RESV_USAGE_KERNEL, true,
>  					    MAX_SCHEDULE_TIMEOUT);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 863454148b28..349215549e8f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -145,13 +145,9 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
>  	 * notifiers are disabled, only allow pinning in VRAM when move
>  	 * notiers are enabled.
>  	 */
> -	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> -		domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
> -	} else {
> -		list_for_each_entry(attach, &dmabuf->attachments, node)
> -			if (!attach->peer2peer)
> -				domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
> -	}
> +	list_for_each_entry(attach, &dmabuf->attachments, node)
> +		if (!attach->peer2peer)
> +			domains &= ~AMDGPU_GEM_DOMAIN_VRAM;
>  
>  	if (domains & AMDGPU_GEM_DOMAIN_VRAM)
>  		bo->flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index 16e12c9913f9..a5d7467c2f34 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -27,7 +27,7 @@ config HSA_AMD_SVM
>  
>  config HSA_AMD_P2P
>  	bool "HSA kernel driver support for peer-to-peer for AMD GPU devices"
> -	depends on HSA_AMD && PCI_P2PDMA && DMABUF_MOVE_NOTIFY
> +	depends on HSA_AMD && PCI_P2PDMA
>  	help
>  	  Enable peer-to-peer (P2P) communication between AMD GPUs over
>  	  the PCIe bus. This can improve performance of multi-GPU compute
> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> index 1f2cca5c2f81..c107687ef3c0 100644
> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
> @@ -22,8 +22,7 @@ static bool p2p_enabled(struct dma_buf_test_params *params)
>  
>  static bool is_dynamic(struct dma_buf_test_params *params)
>  {
> -	return IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY) && params->attach_ops &&
> -		params->attach_ops->invalidate_mappings;
> +	return params->attach_ops && params->attach_ops->invalidate_mappings;
>  }
>  
>  static void check_residency(struct kunit *test, struct xe_bo *exported,
> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
> index 1b9cd043e517..ea370cd373e9 100644
> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
> @@ -56,14 +56,10 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
>  	bool allow_vram = true;
>  	int ret;
>  
> -	if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
> -		allow_vram = false;
> -	} else {
> -		list_for_each_entry(attach, &dmabuf->attachments, node) {
> -			if (!attach->peer2peer) {
> -				allow_vram = false;
> -				break;
> -			}
> +	list_for_each_entry(attach, &dmabuf->attachments, node) {
> +		if (!attach->peer2peer) {
> +			allow_vram = false;
> +			break;
>  		}
>  	}
>  
> 

