Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE44B517FF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 15:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C7710E91E;
	Wed, 10 Sep 2025 13:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dm5RiJu5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B2110E91E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:34:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+k8+zmvqXg1jN4/36FrAlp2ub6lLBUVNzUnrUVvI3uMKxYE3ET+Frz7vLV7zGOQkrbgEZWl74qcc7SPCmt9jAbSyf2HYukvppUIRO+wXpOiXbrYWr9kb2G745ha1S4h7qTvIEMoGXFFRnVtM8UKHFsiqGtYGK4UM6KJQoWiN4MMqcLliQ/BMLYw8Oqf4O8DB5bQE6v04+hdbzJmTjh6nL7jm7zRaV4+zpCaEEKhp+l8tCBFf74ngFtYT2dHy6fMCqLmOE19CMi9j7V7IMDeNupskdemYOfQu5UGZNmbH9+bRhrc98otyiMVNX01x4b9IFRlMP3unMhhe3Wew1BEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhgVw/gq+8JHNm6RuZ600k3erndaLKHO64EIabLHGr0=;
 b=CEj7Pcpo+vQAkPr/QXBj5BcS/YYHdPZ+4q0cvWhOtCDKo4gKi/v01maMGYa2gzfPOEzGZShPTaMVyS4KXbrr67oaqPXhFYwrlGmCClc6tHE1r9RPk9xYfN22m+tZQnxw9YqVRxqWv3BLkw/p4NU96XvgGtjICIKlTPCCXjlw5F1Qe8CS0Lu2SPUTl8llPKD0L9OEYiNWgnTwBj408zNm7PvbDwdZJ7jkhVaDRogu/ZPD1rujuQR1salKEkNval985ivu8cZSvDR3z/na1DuWBl3tyxiZlknpkfg0494w0RfQOBxt96wUw7NbrA2KlWWJxEhOpdqZdMZKedvEUOWiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qhgVw/gq+8JHNm6RuZ600k3erndaLKHO64EIabLHGr0=;
 b=Dm5RiJu5WU85xYx4EMvWF2ifvjVaQr3tgUvH6ozpXcfobfxSQMtAReeJLi1jwWS/LESz9j8lpHpKvsq+o4dhaAukuSnf8HbX84kiDjAjx7I9auLg/gSGrTH5tGLNeBIgHY4wol2G2Owu/xD5Mk+FiU0dWSlzcakLKKEm1cB+LTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 13:34:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 13:34:47 +0000
Message-ID: <bcad0da8-a7c9-44b6-97f8-8dfc01acfc73@amd.com>
Date: Wed, 10 Sep 2025 15:34:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: ttm: do not direct reclaim when allocating high
 order pages
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com>
 <e79a134b-89de-4da1-b64b-b890227fce8a@amd.com>
 <aMF0fe7CIVD-8zVo@quatroqueijos.cascardo.eti.br>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aMF0fe7CIVD-8zVo@quatroqueijos.cascardo.eti.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ba64d9-576b-4e5a-26f4-08ddf06ecf55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFNJVWVvZElPQnJRSkZFQ25BS1Fkc2czUHJFQUdJL3BCTmtwN3lMdmh2TlBQ?=
 =?utf-8?B?YTYvazZ1dmJESDdWZUZTTG5Ic21Ja1ZQMkhZNE1BUTYrN09VNXV3aWdxN1Fo?=
 =?utf-8?B?TVpKM0Q3Q2N2a0x6OFJ1bU5meUhaYzlhU1owMW9VbDRVOVN5Q0hSZXhlUHRp?=
 =?utf-8?B?N2FOSUFScEpkdDI3YXEyOExPdnc2OVVKdnl3a3JyMHB3eXJ4TTJEZkNPQ2Yv?=
 =?utf-8?B?RUVsQ1pwamZ0YWxpWnZvWkpob0haQkp0eHEwMEQ5M1pqNUVmV21vSHY5UEVm?=
 =?utf-8?B?VkFpOU10M2UxenJ1VzJ3N2w0eGh0c1dVdjJOenJ0cWNKdjNrYjJVSEthVHpq?=
 =?utf-8?B?c1FBQTRuVXpOTENjb3gwTnVDM0RKYVJsL3U4NDh4TzA4QnRwaHZQSld5czRN?=
 =?utf-8?B?bTZWZ0RRUmtkUUJreTZTd1Zwdlo0dTQ0TEczdXU4azliY2YwRDhLdDBleWxJ?=
 =?utf-8?B?VHhIUmxTaER1cGNmK1UyaXJvT25YS0twVW15Q09hamN0R0FRajNaRXQzaTBj?=
 =?utf-8?B?bS9yVjY2M1dPSFdIK0xFVVBjMlo3ZlFjMzVDVFNpc1hLU3JUSFM1ODd0NDZs?=
 =?utf-8?B?NUtwaHYvQ2ZObW5ITUR6TWpsNC9zQW9LRVdvdlNNQmdNTi9BLzZXMDRUTCtz?=
 =?utf-8?B?cVpQeG9ndVRzcHRCczVnbzQxK213VVNtd0lLaExzNTRZeldHQUZhZ2tYeklX?=
 =?utf-8?B?Q3ZGWkZuQ2dNMGxSb3BjU1c0RUtUaTNkSGxzSFlvY0dYL3RGbEoxWmR1Uks0?=
 =?utf-8?B?RU4zY2ZNTDRoY0pnY1pjT0NhWVplWTlpbkFKSms4U2xhRnUzRVFiTWhqWmJn?=
 =?utf-8?B?bEQ2eE5PaVEzcUg2UWpxMytiYU0wWlRHNVoxVERqY2lnbittS2Z3eEdoOS9N?=
 =?utf-8?B?cDRZNUlWcEdTTENLcGQwcThVY2U3OU1MZFE4M2lUM0UwQ2kzb0ZCd1BkNC9k?=
 =?utf-8?B?NE1PQVJCYUtjN2R6NFRmTWpNZS9IVTVwSHAzLzFURTYyVzZTZUJIZ1k4MTR0?=
 =?utf-8?B?cUtKM1djejFKYXByWTRCQjlDdXNnNG5oSCtXNDFsTGMxS1UzTEFncEw5NHNk?=
 =?utf-8?B?Qy9VZFFLeDJXUysrWEM1WXlxWEcrTnpHaXIvUUFoVTNuRTZPem9NVnRPeHIr?=
 =?utf-8?B?WklXSnAyUld1a2VwWlBUenNYY00rYmxKOUJweDZwbWozMlpoMmZTaUlPSjJw?=
 =?utf-8?B?NTViMUZFc1p4TmJsNHU5ZTdsblFKZ2NRZC9GMG9iZFNnWHNpMHpYZHdxdHJp?=
 =?utf-8?B?WERteUJMT1dCc3BKS2gzMkhBSWE3Z3BXYm5uaDdzbDlBUTluZkl4NnprMDhS?=
 =?utf-8?B?VC9mcG1vQ0N2YVBOclpRR0wvSnNuckFJQ0ViOHhzVC8vRmJqVXB3WldicWxE?=
 =?utf-8?B?SlFaQnFYbW9zVWNON1k2a3JxekhBRTh3TGduM2RSWW5hUnBONklXc01jUFFn?=
 =?utf-8?B?UzRVckZ5TFBZY2hWSkR4Sk9OdWNtMTBkRGtndkhXK0xuZDRxdHBZckpkUFBC?=
 =?utf-8?B?MFlmWXhPem16U29Kb1lmMStBQ0VpY2Jxa1ZxSXBtUVJvZzMwSDBBUzAxZU9G?=
 =?utf-8?B?dGlNc2grV1RuN2VCNXp5SzJKMmUwdHZZSnBtZVI2a1ZGTThzMmRKT01ybGNF?=
 =?utf-8?B?dGtQdDVhcFRSbjhaL1dyamNXWGtOZFozMVVhdklRTnM1bkEyVm5QVEhCd25N?=
 =?utf-8?B?cDhIclFSejFCeGppZVBxZVV2a0lQVmNhTEpzb2tPdUdTR3FMT3lTdDhtdnBB?=
 =?utf-8?B?dlNndFYxcVFQSktWSTJseGlJeWwyM0Exd0xocXdsbjZDZjJ3ck9ENC9KejFS?=
 =?utf-8?B?M3ZsVGNNVUcvWDhuL1dtRFF6V0xnRkRORTZwRDhkbDE0cDFKaXZhbDU1WkJM?=
 =?utf-8?B?cXJaakl3L3FDRVJUZWRSeUhCMlNWc1ljalRoZmwrU3hJR0xwNFpKbDFCRXNv?=
 =?utf-8?Q?7q7CzWDh17o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2xMUkl6SnVvNHpadlpGeVgyQXc1TENTcWJWa3IrcTd3WGJ3ZWRTQTlDWGpU?=
 =?utf-8?B?VlcvaTNzU2NTd09haVNGalpPaFVWVTVraVFsLzBPVDJ0Q2lpaUIwTEVUeWFO?=
 =?utf-8?B?K3hZSmkwNXZ2REx6R2JpS2NQTlptWlVUMmc3aDlsNWVyamJhVzFVdVN0b0FR?=
 =?utf-8?B?b2xvcHhUclp0R0lHUnlQRmI1dzM3M3l0QlUzZENCY3pqTnBaVmdQc0JYRExJ?=
 =?utf-8?B?aFF4VlhaeUxCZFhPZWpBdkFLMkpwbXo2dC8zYWN4elduaEl3aDdXNXFTQUZs?=
 =?utf-8?B?WFAycWNER2hycnFYS1ZZRElqTWFGVTdLVWl2MWd2NzE3dG5xbHNrVG9ob1ZP?=
 =?utf-8?B?YzRuNTU0ZnFYUk5aZFhGcjdCK2tyejN0NVlxZm9wWEFwbUMzRThzSVZNRjZ4?=
 =?utf-8?B?ZjV6SjVCZkxUZzN6dmJrTU5ZUzhqdkNjU2Z5TDhvVWl3a2YweHpGdGhXVGY3?=
 =?utf-8?B?SFpBTEVOeElvT043b0R3ZEZBL005WHpwUTYvZkx5dTRlS0pqVmtLUWxPcVRF?=
 =?utf-8?B?eEFxZmU0SUtNYkNKaGJ5YXAwc1plQnprL0Z6dldlM1Evd0F4Tk94TlBFN3po?=
 =?utf-8?B?Z2VEY1pZeGdmck1oQ3NPZDhkZGk2REFVOHgzZ0xiY0l4MlpGZ2JpcGtrMkp1?=
 =?utf-8?B?MzVualh4N1M4QzNqUm5KUVVZcHR2Uk5sMmpUSDU2L1BTcm14Yk9uQ05yaHRE?=
 =?utf-8?B?aHdDOG44akIwZTRqaVExZjNqTGU5QmgyeDBJK0lRazlxWERDTzJTbk90NC92?=
 =?utf-8?B?SHBHUlBMcGp6alBCR0JRSll5QXZjbDJ0ajM3dDJqVzFKWDBtUWtLdFg4aGxh?=
 =?utf-8?B?RVJWSTNTS2l6RDE5RVhmbWRucFZ6NUpLakUzMzRudXlIMlZrTXQ2anBJWkVY?=
 =?utf-8?B?djQzUWhxcFdTZi8yM0F4b3FWRjlzK2ZsdCsxck14UXp1Tm53VXcwaW5nUnhR?=
 =?utf-8?B?UVo4amwxWlA1Y2hrY0QzL0t4ZExOR3B0R29wRlUvaDJ1V3Y2V0gwRnU3S2pi?=
 =?utf-8?B?dW5tb2I5VDFPZ05XSjhVN29DWEhBNGRianJLWTRMdFU0VmZ2bG45UGdDMlkr?=
 =?utf-8?B?bmhKaFVBN2Y0eXQ5K3l0WVFKNllWVTAvY0xPcWpubU9PMUJjSUZpeG5MMC9q?=
 =?utf-8?B?aXd6cVVKVnJRbHUybGYyci93WG9vbXVhZDJyVnpTTlpPQzNHamhxVzJuNXlH?=
 =?utf-8?B?dGtwRHZhS204MmZLSExodlJTb3JrclFhK01tZlp0OUJrc3hpaXJqbGJPRnRY?=
 =?utf-8?B?VWYzOWRaQVNtSk9PYW5sbWVPOGFCUFI5bmVOVExwNUhyc0N5YzdqdEdXbkVX?=
 =?utf-8?B?Z25OUDFZNDQ1UXB6MHhCTHpVQVBneXhtM0ZFdGlIRk1xZUMxSHJ0bUhQRWk1?=
 =?utf-8?B?azB5TTVhSjIrSlJZeEoyQVhvb056bmY0OFVpeGt5S1pCN1pMenVMcTNNbG1h?=
 =?utf-8?B?VWlVODNOZGhCZE50UHowdWEyYWh5VXltV3MrcnNveUhZeWUvOGtYQTUvZHA2?=
 =?utf-8?B?aVFKY1kyYjdOb2pUVkpxYjlkZ0FCeVcwZ2h2MDBzTExvN2lOV3BwNDJkcTdK?=
 =?utf-8?B?VHYyNVBEOWpoemFxVjVhSWhrSzRyWFViTktuNkc0akpYc2hRcjJ3U08xV20r?=
 =?utf-8?B?Q3BlVTZ5bTc0ODFnZVFzNVhBT2llL29xMDJ5VkRaRnlxMm42WUdaTmFIZ014?=
 =?utf-8?B?S3BiaE0veE1FOUNzVTBheWp3VWF3OHIrbEIxVkoxS05kdGFKYWx5aEFDcWd6?=
 =?utf-8?B?c2ppQldMQ1c4NjFtbTdUVExBMEl1UnZmM3Z1YnU4UXd6QTMrMXhKS0dRMmtK?=
 =?utf-8?B?QVdJbWx4NU1GWlNkZXNNS3dlTUZPMWNGYlZNMEtpd25jdmRrMzNaNHJMcXFY?=
 =?utf-8?B?N3duY1BzNEZEMXkrc3dvT2VmZExtVWFVKzNtMmpXaEFKTTRNaVBGOEFRVHRu?=
 =?utf-8?B?bG0wQ1JCVVdUV2V4bmdVZ25xK2grY0pwMnJOdG54bkpMdExVVmlEMjZja1Rq?=
 =?utf-8?B?OTd4R1VxUGVzUXVzcTNhNjVRdG82MVl1R3dUODdteHlkd1V0RDEwMXJjTzcr?=
 =?utf-8?B?TmVvUTBLZ1daMVB0S3Myck5zd3EwNmdlcmV5Tmc0ZGtCQUF6UG50K3dMWkRY?=
 =?utf-8?Q?TWF2J5S/a6vrxeBc3mazVqFTI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ba64d9-576b-4e5a-26f4-08ddf06ecf55
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:34:47.3996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTgsXeTHVShHNjI2uq0+DRuZwFil+YZl8vZWTCChCP3W99WYN6gb9ydKEt9cErmn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

On 10.09.25 14:52, Thadeu Lima de Souza Cascardo wrote:
> On Wed, Sep 10, 2025 at 02:11:58PM +0200, Christian König wrote:
>> On 10.09.25 13:59, Thadeu Lima de Souza Cascardo wrote:
>>> When the TTM pool tries to allocate new pages, it stats with max order. If
>>> there are no pages ready in the system, the page allocator will start
>>> reclaim. If direct reclaim fails, the allocator will reduce the order until
>>> it gets all the pages it wants with whatever order the allocator succeeds
>>> to reclaim.
>>>
>>> However, while the allocator is reclaiming, lower order pages might be
>>> available, which would work just fine for the pool allocator. Doing direct
>>> reclaim just introduces latency in allocating memory.
>>>
>>> The system should still start reclaiming in the background with kswapd, but
>>> the pool allocator should try to allocate a lower order page instead of
>>> directly reclaiming.
>>>
>>> If not even a order-1 page is available, the TTM pool allocator will
>>> eventually get to start allocating order-0 pages, at which point it should
>>> and will directly reclaim.
>>
>> Yeah that was discussed before quite a bit but at least for AMD GPUs that is absolutely not something we should do.
>>
>> The performance difference between using high and low order pages can be up to 30%. So the added extra latency is just vital for good performance.
>>
>> We could of course make that depend on the HW you use if it isn't necessary for some other GPU, but at least both NVidia and Intel seem to have pretty much the same HW restrictions.
>>
>> NVidia has been working on extending this to even use 1GiB pages to reduce the TLB overhead even further.
>>
>> Regards,
>> Christian.
>>
> 
> But if the system cannot reclaim or is working hard on reclaiming, it will
> not allocate that page and the pool allocator will resort to lower order
> pages anyway.
> 
> In case the system has pages available, it will use them. I think there is
> a balance here and I find this one is reasonable. If the system is not
> under pressure, it will allocate those higher order pages, as expected.

Well that is not even remotely correct.

We have seen all kind of problems with this, especially on Fedora were automatic de-fragmentation is disabled by default.

The result is that an use case which causes strong memory fragmentation massively affects the performance of later running GPU based applications even when reclaim is enabled.

Disabling this would massively worsen the problem. Falling back to lower order pages is basically just a workaround to avoid the OOM killer under heavy memory fragmentation.

> I can look into the behavior when the system might be fragmented, but I
> still believe that the pool is offering such a protection by keeping those
> higher order pages around. It is when the system is under memory presure
> that we need to resort to lower order pages.
>
> What we are seeing here is on a low memory (4GiB) single node system with
> an APU, that it will have lots of latencies trying to allocate memory by
> doing direct reclaim trying to allocate order-10 pages, which will fail and
> down it goes until it gets to order-4 or order-3. With this change, we
> don't see those latencies anymore and memory pressure goes down as well.

Yeah and that you see memory pressure going down is a clear indicator that something is going wrong here.

If this is for an AMD based GPU then that is an absolutely clear no-go from my side.

Regards,
Christian.

> 
> Cascardo.
> 
>>
>>>
>>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>> ---
>>>  drivers/gpu/drm/ttm/ttm_pool.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>> index baf27c70a4193a121fbc8b4e67cd6feb4c612b85..6124a53cd15634c833bce379093b557d2a2660fd 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>> @@ -144,9 +144,11 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
>>>  	 * Mapping pages directly into an userspace process and calling
>>>  	 * put_page() on a TTM allocated page is illegal.
>>>  	 */
>>> -	if (order)
>>> +	if (order) {
>>>  		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
>>>  			__GFP_THISNODE;
>>> +		gfp_flags &= ~__GFP_DIRECT_RECLAIM;
>>> +	}
>>>  
>>>  	if (!pool->use_dma_alloc) {
>>>  		p = alloc_pages_node(pool->nid, gfp_flags, order);
>>>
>>> ---
>>> base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
>>> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
>>>
>>> Best regards,
>>

