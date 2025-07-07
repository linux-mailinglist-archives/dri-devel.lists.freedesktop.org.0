Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A2AFB1DA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 12:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F2110E320;
	Mon,  7 Jul 2025 10:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZZhdpZAf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB22410E320;
 Mon,  7 Jul 2025 10:59:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSvPdvS75U70EXC9rrW2l4+KCrplip1LFWMptw08YyLR9BKyhxo4FnFQ9EZHLUr8zcwt21GHkpG2GnwKWbP9pOlCJDqIIBrYIB4kyE1Af4/PT6JpdtcwVjQRf2y6xntgKtk2/AfjWwiI6PmHO8YkFhO5zCsxMV4hQobpHhvrU0k0o13vZRm/xQcFnVZBH1TkRwtYH5hK/0sxl/kDVWgZUM60iFQP1dl4TNoHlAniwpJ67MjRYDYBIfT+Re3XI22oe2t0JCYBbMKMXpUIk4D4keLMYMHijK4/G2lptqa973nBvhUGcPQg7eoI+49e99EsVjw9eLAe5G4RZi4QH6mwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9K3Ya2vC21it3ScRs6tR82b/MjuJQWKLCLKBRmfjFBs=;
 b=wx2CiYnJNg/2DBbDtPEIo82KKRQENSbeubTeaPKP/nZA37Qg5t1LN+twzo+LVl5+7I8sg/Q/rFah3FWN6And1rxAIukj2QVwK0ow7JneHiaa88xSKytJ7IJULFv3qJmzNpQFIg/T6jhyumbUloTZKgn5fGdTrO9r033xTZaahGsScrERporW65MSXqOGIT5IK4YMM2Ve9V/WCcjW8KFYM+ILsny0uXxSFMFOti0cTdn1wLFBuxk1bfFqLFTDcihD4gV87Q5THz+Y/MMG5sS+8mFTeTOJGUvXOXcAiNhvFJ5UW0lKg3pRmlH1AFwUZM2B8I65ALFXGReHNkVATKtdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K3Ya2vC21it3ScRs6tR82b/MjuJQWKLCLKBRmfjFBs=;
 b=ZZhdpZAfyJqryvRbnM5Rf0HzL7Hc9GTksGeQFXqxvbPgvQXrI2ysSKBLzJ4VdPpO9+W93cWdRSVrwYaDuEGd/ac0rd4Io118RdEzmUo9K+hWL8VJYQL6fQQKKfGkrh+zSMcnCeT0ooec/YYCRKopGPa7cOZxUNo8C5v6Bm32DT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6592.namprd12.prod.outlook.com (2603:10b6:8:8a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Mon, 7 Jul 2025 10:59:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 10:59:18 +0000
Message-ID: <c1759ff2-e920-4cca-8dc2-e7de1abadf83@amd.com>
Date: Mon, 7 Jul 2025 12:59:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Switching TTM over to GEM refcounts v2
To: Matthew Brost <matthew.brost@intel.com>
Cc: thomas.hellstrom@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20250702110028.2521-1-christian.koenig@amd.com>
 <aGVbCnLV9fWNwPnS@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aGVbCnLV9fWNwPnS@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6592:EE_
X-MS-Office365-Filtering-Correlation-Id: 73cfe2f3-766d-48b9-b9ad-08ddbd45518f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXUxdFhkZjhBVzRadUp4dFJvZGk3UjUvOUlPYS9rRng1clg2ZjNXY3MxQytJ?=
 =?utf-8?B?QmZKMzlyK1JGZURUT0ZnbVNKbGtPbnhCUFRYNllMUVpXa25NVzdycjB2c24z?=
 =?utf-8?B?RStyRmgxWW9zU25sSXlXVk1JK3oraXB0TnlKYktSRjV2S2diaTNkeHF3aDFK?=
 =?utf-8?B?R0E1M2pkNnUrcEswNmpCdTdUbytwZEsrdklFUjRobjBQbGVuazYxOFFNbmda?=
 =?utf-8?B?Q0VOaHVFODdKUEtZSHkxVGJUb3U1YTRhNDdYSUhaSHhnS2ZOL2o5cG11aXFo?=
 =?utf-8?B?UVdWT1g0ckFxc09PNmphek9RMWtRUVd1Vm9ybldGclo2dXlHMDZHbnJmdnFZ?=
 =?utf-8?B?dW1uUW5mUUJKdUpxVm93b0pTeURrcC9wV0tmcTR1VnFyMVJxQ3FLd1pCRFJt?=
 =?utf-8?B?Qll5ekE0QlM0N0lhN21YWGtlNmpJZ1gydEIra3ozU2cvNDBNakswcEdPdWJH?=
 =?utf-8?B?c1FsTVIxNjlwWGRwa0w1bXdKaitBQnZKbHNueUE4alhPbzh2YTUzV0JEUHcv?=
 =?utf-8?B?RUJabE1ZY0c3akhoVm10eFBGa013MGVZZ0ZqU2lDNUJBbk1SOHkvOWJIM095?=
 =?utf-8?B?VHVyNjRQbXNwdTBEQlR0ZlI4MUo5VU5Nd0dZZ2NuL2NNYXZaV2x3aTZ0WTdJ?=
 =?utf-8?B?WHR6OFpvY2tteWtrS2tyQkVPSDBSVkNPRzN4V3preFVCS2s5KzUxbjcvUDB1?=
 =?utf-8?B?TVZDays1THB5NHJpUThDV1ZkNnZ2L0xBclFUcU1GVDNXSithS1dPRmwyOTlM?=
 =?utf-8?B?eVBNL1JmMktLNXpCRnQxWHlwR2FFbTlBSllDbXA5K0h5K0dRK2d4OWRkSDNv?=
 =?utf-8?B?enBBNEFGMmRNTE5RemJXWjFWY1E1N1RLMXB5NTFlWUNONVVFYmhrU0dzVVcw?=
 =?utf-8?B?ZjJOVy8zZ0I5NmJSUlZXcFhhYW1CQXAvSXBJWGtqdlBkV3hqdG5VTXhYS1Zw?=
 =?utf-8?B?YW5kMWFXRU1aZXZVd1doM242UDJZWU1jVEptWGMxYUpPVVVZSHZxRnhSM0g5?=
 =?utf-8?B?NUlWWXdZajY3VHg4dFEzVGFaYTlrV1o5S2EyazdPK3BxNXp2QnhXa3hQcHl6?=
 =?utf-8?B?TlJnNEVQM3FUL21ETk9KOG1MVS9vMzM2UzA1ZDBOVkpUbzJaNDZ6RHhUclIx?=
 =?utf-8?B?UXJ2OEJFM3pjdHJKMHUxUEVuS0VsWnVTa0JGT0dVcXFJT0JBeCtPd3ZVTlNF?=
 =?utf-8?B?MTRma3FSenNtbjBhY2Y5VzFIaWhFWm9pQlJsZTBGQ2pNRDZ6NGNPZE8vcGlk?=
 =?utf-8?B?eW1uRi9TUksyNzFtMC96ZnErRnBFczhxWk4wUVBDQW5raEc4cmR2K29NVTFq?=
 =?utf-8?B?aEN3QUhxSk15dGdLR25NM28vejY5YUpFZElTcnR0NU5YaW1hQkFITkhvbjdr?=
 =?utf-8?B?aFczc0QzUXJITkpKaUV4Z0tVUzJMZFZaZks1YklEY2JCbTEzMkI2OEg3NEIw?=
 =?utf-8?B?OWJvMkMwWkpxcFYwR1RBTzNpYlRFaXVTb2ZzLzdYakZhTnFobHFxQlpLWUZB?=
 =?utf-8?B?U216YkdncFR5VURpdi96RmlvVllwcGlobU96ckkzb2J1eThUc0RnbVorSUxq?=
 =?utf-8?B?T1RPZUt2OHZOcldOS3BTdS91d2ZvNXBNVDA4Z2Robk1pWXhrSjJ4Wk9XZWp2?=
 =?utf-8?B?S1VUWHNOYytGd29jV043Mi9GRHByd3FvSzV1UXkxMUxkclN0NGVvalc0Tlpw?=
 =?utf-8?B?bGhMbC9TREtrdjVrL2F5L013ZEZLaUtXdzFDU1pudVB0SmlEVmx2Vk9TSDYv?=
 =?utf-8?B?ZlBtWVRCSjlaMTBIdUQ0QVpIZVFmTi9aMGlzSEd4clc4OElIRmtBdmFQaVpP?=
 =?utf-8?B?ZlFUMmVXcWVQdzhEMlJadmJjTFc0SmFjOGJtbXN1RTlaQlg0VmRqSUN2TzIy?=
 =?utf-8?B?UUZuUWhCU1U5TndYTDMxdnl3VUZ4R21lL2pjTlhHL1RZMnZUUE11MnE3VnIr?=
 =?utf-8?Q?hmBB27NRjrQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2NFWHU0UWozL0kzWWlFVUZLZDJ5ZnRSTEtmdTNJbXg0RWxUaWZhMk1Nc3g1?=
 =?utf-8?B?cC9vUlBPU0tuQnc0Y2lWTk5HQ252aWsvNGJWdmRCbUhpRkNibG5ReFl2SGVa?=
 =?utf-8?B?bFJ1QVlIT0JtWlNicGNNVGQ2RjhzU3hKaVZhQVRaWk84ajQ4UzFHTzRrYmFa?=
 =?utf-8?B?aGUxTkRhNWJnMFIzTktHN1hpUFd1aFB0dzNudWRDWVhDR2UvTEdIclFsUzQz?=
 =?utf-8?B?Znk4RkMrY3V0bXo4a1ZnNGNTcjlGL3kyNTV1QU1XV2hmWFdKWVNGWWJZR004?=
 =?utf-8?B?ZWsxQ0dPWG9BQ1RuUm5PejJ0dEZoL2FUTVZKMzZpOXFEYW5OdnVXTWlQUWJW?=
 =?utf-8?B?V1R2ZWMxMklsZFpIRHFPWWo0cHRGT25BcmJ3QS9STTc4aTZvVGtDdldsWEE1?=
 =?utf-8?B?bDhZVFB5UTczTWp6MXphaG9Dd0NMM2ZCZm1GTEFzSUI3ejB1NWN4UzJza21y?=
 =?utf-8?B?azl5TXRWY3pEN2JDY3hMelpKMHJyV1NidnR3YWNwdlhNUU1ZVDFHWTk2TUVn?=
 =?utf-8?B?cCs4UStqdWlxdVVrU1lBOWgzblNVUGJacVVBSGpqcEpZYVJlajNLcjBnOHVF?=
 =?utf-8?B?OTZ1LzdPcUYrZDdwSmhWTXZmT2o3YkJkd0k2enQ2cUZ5VzltQXJGVUZ4aW9T?=
 =?utf-8?B?Ykh0Q2FHbTZUVXlpUWJId1ZqVzRPRTM3b3Iya3lja1FJdGlwT1VZSGdYMDdi?=
 =?utf-8?B?MjNUMnJvRmNUNXhvTERGVTRmdGpaTWtzckxCVllRa0txY0drQXRqNjJCNHdQ?=
 =?utf-8?B?Uk1EdUhxdVc2R2t6VWlDNXJPd1JzOGI0eEI4K0xjVy80SDFXbk1EWGZBSHZJ?=
 =?utf-8?B?ajRLUEsyUlVzd1d5bldCbEpwZVB3M3pidHFmV283MlMrYjY0Z05icHFWYUha?=
 =?utf-8?B?dEVZTjNvVXkrNTJzYzFRcFg3aWpEdzl6WmlUQUVSWEYrbXJUVURaVFcrS09E?=
 =?utf-8?B?dmxnRGF0NEhUUTlKU0JTbFM5QWlHMjNRdytjRnFjVlloOFk3K1RvV0Y4RUQx?=
 =?utf-8?B?c0l0MmdsZk1ISUsxa2NUMyszeEEwYk8zV3hlbWpjTi9WK2FOZ3U4SzJrQ2Q5?=
 =?utf-8?B?Mjh1WTNvVlFNUVhpRjV0MklQTVFGZ2dRNUVCT2NGeStlQWVPQ0QwZzRMa3ZD?=
 =?utf-8?B?Z3g2eHpsb3JFWVZhdEF4ZU5KSS81aU1rQWxQMzdzNmwxUEpEaGZHOGcrMVRy?=
 =?utf-8?B?c3NaUzVMa3BJSFRBU2VuakNMYkVLK0Q4bzRFQmVHTTJnVmNJTzMxQ1NOc0Rs?=
 =?utf-8?B?Q0JIbGJiUHRqTHpuUzRicXl2bUtyYXQrUmJnZVVNRU9ZM1phbHVtbWszcHk3?=
 =?utf-8?B?MFpjRERKeTlQaWRxT2lxY1A2cjV3Y0c1MGFPcFBuNjFoRzJkb1lRbEJNSHhv?=
 =?utf-8?B?V0g5OEE5ektOUk11MU12eXlOM3FPNzN4aUI0RFJ1MkRWelFIT0FCKzF3Zng2?=
 =?utf-8?B?N094VmNjYk4xUTBNaUdvSmQvbDdZdDVDazgvN0dTNFg5SHlIYlFDdjNDQVBM?=
 =?utf-8?B?K3k0OEgrL2NQQWhzOEtyZzA4OHRDY2pMQjVaQ1hhM2tXTmdaZlFwNUZPWENJ?=
 =?utf-8?B?SlBoQ1RyYkRPdnB1TVJSeWNQSlVTUUtET1dDVEExUUlJUkNjSHZBQ1ZMOGFh?=
 =?utf-8?B?ZHY1M3FtcDNQOHdnZVRLNHcxVlVXL0JFTEFaWmprVlEvUWpXRm9WdW9NOFJm?=
 =?utf-8?B?d0ZqbFdFS3pTdlI2ZFAxWU1WTDJ1MU12MTRwZjREUjFVbmp0dWhKSGNwdGtO?=
 =?utf-8?B?cHFNS3lhOWRGcnlqcDFyUkYyL25zN1RIemJVVVQ1aUxBRm5GcUNiSkZDVVRE?=
 =?utf-8?B?eVdGRVVjcER4NzVGT1R0VndOTDdQZWYyUS9vZEx3NEhCRTNWUDl4MlhKSUMz?=
 =?utf-8?B?emxBN0tYKzBySXNXcmptV2oyWGdYK2Y4Y2xXd2loOTAyRHRFUjcxVEFMaVJp?=
 =?utf-8?B?S0t2VVIwUitIWE1Oa2FXOGNYOEdTZXZvQ3VvVW9GeGg3VytkZlplTExzTCtJ?=
 =?utf-8?B?L081NklpSEo3emdXQkIxOEFRbWtVWUJVV01ka2I2Nmk3dnJ5ZkJpT2hNQWV6?=
 =?utf-8?B?ODludkMwV0hxRGN1VGorREVBcEEyVklJWDRTUTFaM3ZEYTZZYTByQzUyQ3NB?=
 =?utf-8?Q?rV6Z4vPB5uWPPl2/CvUxdObOR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73cfe2f3-766d-48b9-b9ad-08ddbd45518f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 10:59:17.9186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uxS4Ex/ra6HGQhK+5pbbAqStdJI+LZMKa+bnQ5VxPignirtn3AwrZnlndjlWYI+r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6592
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

On 02.07.25 18:15, Matthew Brost wrote:
> On Wed, Jul 02, 2025 at 01:00:26PM +0200, Christian König wrote:
>> Hi everyone,
>>
>> v2 of this patch set. I've either pushed or removed the other
>> patches from v1, so only two remain.
>>
>> Pretty straight forward conversation and shouldn't result in any visible
>> technical difference.
>>
>> Please review and/or comment.
>>
> 
> I'll take a look but heads up Thomas is out until 7/21. I know he did
> some concerns on v1, so might need to wait for him to get back?

Yeah, that works for me.

But I would rather like to get the first patch in if possible since that is just a simple rename.

Christian.

> 
> Matt 
> 
>> Regards,
>> Christian.
>>
>>

