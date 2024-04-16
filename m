Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B1E8A6AB5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F4112C21;
	Tue, 16 Apr 2024 12:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GhB4A7Ux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2053.outbound.protection.outlook.com [40.107.102.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 024F3112C1F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnCPkYC5pikVvDTKa0TcAXvFspNLXLTtl+42h6Z+ff5UNQnUI1tY8pZpzem75od4d0HhmUQxawx6z+YbwDcflxmtnwvmabV7Admlh1c8RhvdkRjWkPc7PaNfXy2DyRN4/3Ui8ZZebq1aDFkAGUuNmU7G9C2ji32lp9aapY1g1I5iinF/CZfygvWAX3MmZWs3pYA7iWgRRFleJh/yAK0ZW3pQiENxaAwL/vBFR//q1ldbYRzGzffsSrZZmL2z2RTYucO1SAPCPd9FKrDJ9nXBStHFpNWn3/2ZqetvipNqkkhq5qiVabkdtSfRO4T5PI+Nr9x4bMIhEe/rU0f3kSNqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7RlGShnul4ac/ohL/d5R3+rT4u+66CRON+GKKsoF7Y=;
 b=gak/NY3LEOPzUrVPdmVg7i5Hi8eC3oN50e/8t58qxjyiYt6/TKnLmcqBw/7SPESYWRIW/qsNFqDabvJRj+joOs0zQRQaMmh+Mtu0Pn2MFkgWm7LrMGW+697wF11ahuhDuV2ktrvc3425gbdVlJyWM6XdxiNOz7Wa4cPTQVrVNu2x1AmNFat4+C30JwVQ3VDR2M7zvmMR74uchV3B66/Kr8caq8+oD0O7g+AaDYZcvPC3dWG3gcO0o3fyHg3ohOjPiJTaAdvEWlvHkgVw5I3fQpUVx2P5pxtJzZuy0I9zJFY75JAI6gZ2Ct9r2wq0IWLn2jQlf0MaIizUFID+vwdYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7RlGShnul4ac/ohL/d5R3+rT4u+66CRON+GKKsoF7Y=;
 b=GhB4A7UxuWpYbJD3kWhq1oeG184wsIOfqChO4MHziJ6i1Mc5Bz0ltQTca4PY6mZAroyRxnbHiraz+0K3Od1C61nSRsKG+lv9Dev0+4crJr2YUhiasTVURgTFCDvz5tSBVpht91ORYAby3sU9M2PabszJ2RQkYEMZ2f5DKg/tzOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:20:42 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:20:42 +0000
Message-ID: <7663f175-ae3f-399f-99fe-89ee6f8f20f9@amd.com>
Date: Tue, 16 Apr 2024 17:50:34 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v10 3/9] drm/ttm/tests: Test simple BO creation and
 validation
Content-Language: en-US
To: Karolina Stolarek <karolina.stolarek@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Amaranath Somalapuram <Amaranath.Somalapuram@amd.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
References: <cover.1711117249.git.karolina.stolarek@intel.com>
 <7c1f626ac0423ee43e0e7602a063e7f9a4e163b9.1711117249.git.karolina.stolarek@intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <7c1f626ac0423ee43e0e7602a063e7f9a4e163b9.1711117249.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::17) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7fe0b1-b0da-4f7e-f3df-08dc5e0fa26c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0j44AO5TPuCbjmOzCk/VfBnBzRzyT7HaeW0Oy0kxABmVn8em40qR8GLYEYIkdqLzWXWBm+JwO4rV7sWdcbZmbczW/S+r2ctkL2jaA3xu/qLHmk29BrCw2+QcQ1tgvUyEJGqkqBxpvFwZIhTTE/PIZByUCPO6zF2sRrplRQaAwyr5twhV1O8KGHC4YRDOwYD5jIfie4lB19vdBQVpsq7OasD16lp6V0BFG9WlimfcjARMsrvhgrtGuK2GNfZU456+5QHMqIOoHBh8LrnurK/IH9te8aZVl0cDk8dGpuOwn1g0ZJlo/AqiLu2oOCTe3zpiH5J66kLgi6xHnCqJboh2PpbJnGSll73ZAjp0a9L3yTfpIm/8m9w4nhsBCHaCq3A7g4j2icd/jcPGXeCFLRfnGRA1wzXVMPNJp1c8aa9vJWxTzd0njuSFTYHkyS/UY8RszhDvB/ojE72ZeDOpi2BzyptomIkUiaqOG5wiATNRvQNmq51x3NMtaIb0BzIjx70qX6rnLC3rpQ9IzKF61aq4Yn4vb7xbLPnOTWpIdmGcojKE+MSlQil+VHHdGf8vgOQ9O7XglJXwJcx/ebyC5aDfDAf149pE0ITAVjBnT1KuOE91kmFHKYlJhFqUM0b6qVDpvON/b2WOA/MbQbt6u0u7Wd+6jw23lkq35+S/zYPvI2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjU2VzFFaXJrWldHQXRTcTV4UDZ1QkFURU9aZkRteFV6a2xZQXVDWENSUGV3?=
 =?utf-8?B?aWJXUzB3NU9oNlJuSlhYT3hjTXgwZUF1bnBkQzZiZHRqQVpicjA5WU9jZW03?=
 =?utf-8?B?Z2lNUUxOSXoydHQveTROWlFUay8vTXIyKzJiSkR5M2ljYlNTQjl2bUI2M0ZU?=
 =?utf-8?B?WnQwMzJOUXdnYW1RZHZYUE1nN1ozWUI0MmpLL1hMZ2kxbVgyZUxmZTNJVklC?=
 =?utf-8?B?VnI4Wi9IY1Y4QTJkN0VvQk9TeVZ5eVhpbUV0Q0xKMTA0VWZnRnlZNXZ0WFdl?=
 =?utf-8?B?anEyVlFVWmllNThXa1ZKRk44bEFEa1JYa29WOG5lZU1yVDdCWUxiU21MbXRZ?=
 =?utf-8?B?NzRYcVV0c25kdGFpMlFDemJZL2N0dXVwY2V5OVdUM3AvazR0WDR2bG1JcERM?=
 =?utf-8?B?eHM4VDJNemxGbjVITkpSb3dkK01QK1BhNWNpZThkelliZVowZTlVYTJOd2tF?=
 =?utf-8?B?VW5DL3pUcGxaSjRoQ2g0MGdpV3g4RGV6MmhkeWgzaVkxbkpMTjN5MFp4VkVv?=
 =?utf-8?B?MEdqc3d4b0JhdnFhK2NTZUxZS0Mwc3hXVTdSTFZHVWR4NSswMC9jdXYyZmx6?=
 =?utf-8?B?QWlsR2dUOERrWnRyL3NoSzVlWGl5dVFtNURhTlFiWDc0bzNSLzRkY1hiQnJ0?=
 =?utf-8?B?THFUNUVLeUpjOEFvcVVjbC9RSjFiblBCUW1QNDVBdXpYV25xVDN3dEkwNEw1?=
 =?utf-8?B?ckQ4WUc1cHNnUHloZ3VjVHBzaWhLZHZpRm56QkVLWnVzRlF2R0xxRlFIQVYy?=
 =?utf-8?B?K2xqMVVqclIvemovKytkT284M2lrU2FPdXY3U2FFblQzNUk0aTljNERvb2Vi?=
 =?utf-8?B?ZmJCU3VzZUQ2S1I1aC8rNzN6WitycXRrUEU4YmJCR091SXhJZmRaUGVEeUR1?=
 =?utf-8?B?R1dBT1hUS2FoY1E4UkdlUFVpdE5sTDc4Q0hNWHFrZDBocXpncGdIbU5SM3ph?=
 =?utf-8?B?ckJySUJvTXJVaThZOFdTWXpTVysySitNU3JDc0lBSXJOQy9UVlNCSWJJVnRD?=
 =?utf-8?B?cUxLN09wVzFpREdqWmZYemhmbGc5aUh4Y1dtZWRzTVE2bHlIclBHdEFyVG42?=
 =?utf-8?B?dDloN3pGR1hJWDcya25GK2FrdkdLdUl2NkxIQlRwaGprcE1VM1BSeTE1Z2pM?=
 =?utf-8?B?cnJsZXovY29uZzJ4TlhBbU5kdU9xN2Ura0R5ZEQ1V0Z3R2p3WXlwS0hGeFlr?=
 =?utf-8?B?Y1hUd2ZhbmE1YTM2OGxod0FVZmpsamJOMm4yM0ZVcUIxOEJiUkVKSnhrM2Ez?=
 =?utf-8?B?dzV4OUp1SFJuc0hYWmk2dndHQnNUSjVKRWJETCt5N3hIWkdUMmdPRnA3aHRV?=
 =?utf-8?B?WnIwendrbTBTZ3VFNEJCcGlFZlhlb3FkbFYvaVhrOWNja25WcVVKQzlZQk9Q?=
 =?utf-8?B?K2dFTzRPcTl4cmN2YmkrQkxpWmluMmwrb3cwNlppeDlKM0V1WE9vcnRweEY3?=
 =?utf-8?B?VVdRN0VTbW9YS3FaLzdXeGR0TmVDa3RmbXZ3U0ZSdGJJZDJubUZ2M2FlcytB?=
 =?utf-8?B?VHkxTEQ5MVRRZVd2ODkyM3MrMmVBZlRsL0ZqUUw2clA2SHMycDQ2emtnNzE3?=
 =?utf-8?B?VUU2RFY1NXJ3azBnZG1IV20yRmFZMDgxUjgrR0JGd1dVc2E3RE51a3ZSVEZx?=
 =?utf-8?B?N3NockJua3lRK2cxRmRrK0RPZWZUUVdXTWJmZnBZeFdLRkxORTRQSThpUVdt?=
 =?utf-8?B?aUpyejJHTGRjUi9oZDZFL0xmWGZFMXVYNWZleldWRHZxMmdkVWUyNndVdzZM?=
 =?utf-8?B?eTJscnc4ZTdyS1FtM1hTMzZxcFlDNDVrR0JrUk82djE4WCtSdk4wSitBTEVV?=
 =?utf-8?B?WTJxSERYKzBEOElDV3FicGVZN1FtazI3bnpMOGk3M0xwRWZQRDgxMElLcmxK?=
 =?utf-8?B?djJkRDJ1WC96QWE1Z1RHM2IvRWV4eE1aYkpFNzBIVXpnbWo1L1JLa0ROTTEz?=
 =?utf-8?B?NkZhemxrSllJZ09sZ3I4UE9nQTRRZVZmQ0VGVWRGcFVhSVB4NDJ0dmw1M012?=
 =?utf-8?B?b1F2d1ppWVdDUHppcmd6MjVyWU13c0xPb3pDcXAwRE5NZzFSQzhqWjhNVXFI?=
 =?utf-8?B?YTNFSmdmVDdFZU90Q2duVkNIaTVjc3JaQ1Joa1VKR25haUVMM0tCU0pYY3FP?=
 =?utf-8?Q?nCqTv+Y7eehdB8Rx4xu63hust?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7fe0b1-b0da-4f7e-f3df-08dc5e0fa26c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 12:20:42.7844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zHLsPzj8o+2laHME0mgnVcdEU5R4EXKBtGOJc2dBPSsCRcmx8KtZ+R0waGp/F791JvDEEPtgMV9NN7DD7kXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506
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


On 3/22/2024 7:59 PM, Karolina Stolarek wrote:
> Add tests for ttm_bo_init_reserved() and ttm_bo_validate() that use
> sys manager. Define a simple move function in ttm_device_funcs. Expose
> destroy callback of the buffer object to make testing of
> ttm_bo_init_reserved() behaviour easier.
>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
Reviewed-by: Somalapuram, Amaranath <asomalap@amd.com>
