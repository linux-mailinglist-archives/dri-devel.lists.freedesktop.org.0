Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A997DA11
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 22:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B24410E2B4;
	Fri, 20 Sep 2024 20:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IzqRU490";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1502410E2B4;
 Fri, 20 Sep 2024 20:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXqCgdm07jiufBEfrA55ZIKNGZoNk8oEcX085c4l/LQutmjNMZNHUuodRIIZHoILs/5fA+vYtVKp0LoLl4rBYtcUaQ72gk/ia6dJU2ebs8x0dwTi8aG1Rlm1mvos03KOBOXwiFstRVd723kO8IQ58IvHjeidBMMpC2JYLloWVflj4T3p+TpfrLnerE8wrPFJ5FY6jRMHMDH1FEwt+mgq2XLSOoXog1Os3lAat8mTMkD1708QnOH2sASKp0HrXaVzSq2Sqe43oPBC7ODet5WkaluEu/kyz8zDTH1p84buyk+YJf7C0ZvR1WQheJ80VjVhTMKC5EUt+u5A7iqrrq9+rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvBLUGoTv9qDcdBjMpdKjYLOu4SMXrqqieJu20MSiLI=;
 b=Th5YM6S8tOCohhYlsK7b3pO9NJG+tV3YckaeLylA/+DofDEfDeaDrbWUTLy0ir9VHn1e058kpUwdd+P1HvO+uTvylPZleQetSXTEdUq6Vv16sgYoRqckev1DOa1eJWm/LdUExMHPWGdsPzrIOlobtLpKpD5c3fWDSfT99Rw7ohw3Sjgwz4hUOYh8yWxmPC5z1xdv+lZIPWO5nYfMw8BT3GiF/bP+2PniuqUHlTAIzLTBcwQReT2lWu0yysfmmTXb3OBhckEehajs5Q526eNUF+vSKyKd4TVpQmT8WZ7mQ18svWulL2+po2OTeViVO/+t8VEU1A3JzByXVFZHy9mmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvBLUGoTv9qDcdBjMpdKjYLOu4SMXrqqieJu20MSiLI=;
 b=IzqRU490YfFNt2xhRnm1p+11iWuDQpp2lGVzetRYY5c0Z6QA8Jgo1uptRkiMW5AB7kLEK2et8xGBbDZ4gTKdB079N4So18sNQf5QkkZto1UwI4y1OjXx/VakACTXnbpD4b5hJni57q5NANqFufiEFEAnPtjBq6iMKbDzkcwCwEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN7PR12MB8130.namprd12.prod.outlook.com (2603:10b6:806:32e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 20:26:54 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%2]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 20:26:53 +0000
Message-ID: <ece41917-2ea7-4571-83a5-a50c776c6587@amd.com>
Date: Fri, 20 Sep 2024 16:26:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/migrate: Trylock device page in do_swap_page
To: Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, simona.vetter@ffwll.ch,
 Philip.Yang@amd.com, akpm@linux-foundation.org, christian.koenig@amd.com
References: <20240911030337.870160-1-matthew.brost@intel.com>
 <20240911030337.870160-2-matthew.brost@intel.com>
 <87mskehjtc.fsf@nvdebian.thelocal>
 <ZuS/NH/P8Fl+qptx@DUT025-TGLU.fm.intel.com>
 <87msk5our1.fsf@nvdebian.thelocal>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <87msk5our1.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0047.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SN7PR12MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d216788-f434-4cd7-cc48-08dcd9b290da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVBiZjB6dXNrdHhyRGQ5M0pUNHlZdlIzaEpGejd4eDRsYVVzcFh3ZHAyWks1?=
 =?utf-8?B?UG5ISkR2OWs1RGUzM1dXYjBBcFVkbE5mbTJBamNhMXJHWnhLeVBZQXQ5Zkti?=
 =?utf-8?B?OXNqRlN2NVRuTDltVEtRdjROMFpHMlQrT1QzenJWN050MjlCVUVuMnF0Zk44?=
 =?utf-8?B?TzZGYmh4aUJKbzhMcmZDQTltL21rZmczYTRLRmZsZk5VdmwxYWZVNis4RG12?=
 =?utf-8?B?UWZ5WGlEZDZra2xDOTZWM1Vhd1NseGVHR004VjY0VHF2WFFMZC93WWRyWkQ5?=
 =?utf-8?B?K3FjcGJKODZsbjc5bndlVVVOdWk4VnhzRmtORTlSM1JJR2tPbGxpOWd3Vk1l?=
 =?utf-8?B?djFrMk5GMkJYZGE1Z05BdzdiZ1BRcGllQ2g1UmQvUnN6U2Z5a3FDVWZNS3hZ?=
 =?utf-8?B?eVVZUEczYUJ5alJ0WmZFWXJ6TnUxTWZhamVwK0hpd0V2NlBNejlibEp4ZXJJ?=
 =?utf-8?B?bDI5VlNrOWtveHBWL2NmZlBGT3k5T2wvcFBCTTFDUVRjc2NOYkJ5YzNRTjZY?=
 =?utf-8?B?bStqcTI5emRiVllSRzdMellvQm96OWhzMGJRMHdKR1V0T1A4OTUrNkVIdXYr?=
 =?utf-8?B?UnB3SWNieCsyVlN1dHRZSWJqbUdVT3BEWTJESmVRbnVBSHhlL0RQZDdQZm5r?=
 =?utf-8?B?eWw3SHlXVGhiVlRMN3psc1R2NGVWT0FUYi9jUGcxSGZBMzNFUVZ2MGlSWEF2?=
 =?utf-8?B?MEZzckthVmVaV3lLdjBaVVM0MVRxT3pIWWZicG5iMzlJb3M3RjRhUlhrMU5q?=
 =?utf-8?B?SkNaYm03Mjd1L2x1cVJQK1dvMmJFZlBqMCtDckkyOVlFOHVWSnQvUkpLYmgv?=
 =?utf-8?B?aGRoSTZ1aHBJU2JhMmxwQTFwbDJReTRSMFVLcWFQU2JndmhBS2lpbzZXU0dI?=
 =?utf-8?B?SCtSOWp0MTNEYzdXbHBWUWFvU1VTYytzMTZtellzNk1MSzU4TkM2dXg4Wjhx?=
 =?utf-8?B?REx5cXRiWDMzdnh6L2lhSzlPL2N1ZTdGbFlwYnRLT3l1Z0wwenlzNTJ3RFdV?=
 =?utf-8?B?RS95ZWpZbndMSHp0TXNpa0J2dzBsVXhJa1RtR3JGaWppZ1NoRGMxWG1BMDFQ?=
 =?utf-8?B?WVVnV015Z1BXZ3NnRmd6dzdxY3E4Q05hVUxrQTI3NHRTcnVicXR1MFV2dzJK?=
 =?utf-8?B?OThSVVlMK0F6blprSXRETnRNb3Z5Y1JaZHVBY29VUjZ5QjNSMHZNbkx2RFl5?=
 =?utf-8?B?N0FnaGgybWVBcXlPbnIwSXlULy9nVXlOMlNLVDJQTFBDYkN5ZW1FUEZrWWt4?=
 =?utf-8?B?Z0pKa2RSczcvTk9ZbmdmUnZ2ZjZ1aThHd3R1UG52UWlscTJkN0k3SThKWnJZ?=
 =?utf-8?B?SFdBc293eG8ybFdqVXV4R0sxS2w5bjdvQUd4UFoxSXJhL3FCVjh0WGxEaStJ?=
 =?utf-8?B?RE1FZWJJQTR6dENycGdWcHplK3dOcjVYM09YTjhaTDdIUk9PQU1sUi9QVDIv?=
 =?utf-8?B?bmtjRlh3dm1lTUFwSWxFTGNQS0tlaVlVZGZDMFpEeUpOOFBNY3lZM1JvUS94?=
 =?utf-8?B?QW5sY0NBVUErRGFKZzhLRlljZWpLUXZQTlY5VS9UaW5odmpPVWZwYXM5ZlJx?=
 =?utf-8?B?Tk8rdXQyYjhKR2pKeGVzWGZXQUhUa28ya2pqaXdnc3ZDRHlOd1JxTktrQnJs?=
 =?utf-8?B?eC9QRXlDbGNMN004YXhMa252UVhQaFYzOHNOUlNZWWVHekthUWNTdkpwZjlM?=
 =?utf-8?B?SGtwRWJySGRGbCtES0N3SGwyY3NWNnVSdysrTmJLNlU2VkhSYjhmdUl6YVV4?=
 =?utf-8?B?VnAxcWwzWERYenJUWGV3UDd6M2FYTWFXTHdYWFhHNSttL3RWeXYxMTYwNVIy?=
 =?utf-8?B?T09BeEREblZqRnIwSWU2dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dURYeG5yVnZOQkNzTzBqTXF2YUJ1SW5qckRPL0dtcWNSRUFoMldZLzRTOGVi?=
 =?utf-8?B?V0x1bytocnB3TDFOby9pY3BvNVgvTUp6N2oycG5rYmtZbnN2VVk4R0IxcWVK?=
 =?utf-8?B?aGRDM1RaWktvUFNXK2tPSjl4R3NHRFRmdjgrTzY3Nmc0eXlBeHgxeHVMb1B5?=
 =?utf-8?B?RlExaU9OUkU3UEZSN3FpdEFSaDJHa0RRNDh1aVUwMkxjY25QTDFxcmpZc25P?=
 =?utf-8?B?Z2JuOGt2RjE1ZTBWbWFPYkFMcFJKQ2dHQW45aHExdXFMTGJLR0Nka3F5TmNL?=
 =?utf-8?B?QkVKd0FZRElMNDNQLzhqL1lUeUlubElnVzFURHBROENoOGxmYkVaYXlSYVhI?=
 =?utf-8?B?WVBzQlYwbFlQMjRHb3Y3ZjNZV3hzUEtBZlJjTjZhT3BreUt0Z0dKWkQzTjh1?=
 =?utf-8?B?ZGszNVZsVzQ1TUVzbXByNUV2TDNVYmozclVvV0lRU2F5NFNSd2IzbGtPYS9V?=
 =?utf-8?B?RUs2aGJPMHZ4UU1wOWhkODgxS2NSdXcyT3krYXFOOHJmcUYyS3dIdTl0M0JN?=
 =?utf-8?B?amFWd2RNWjVlcjRYN3ZkS0k1QXlKUG85VDU3Wjkra2F6YWZGUjlwR1B5bkRR?=
 =?utf-8?B?Qm1QZitxTUl4WTI1b2t2T29RdU5VUmQrOENFMDR2cC9zdkQvNDFOV2psd1ZY?=
 =?utf-8?B?OG5kMEZMWDJGVFhRdUgvTmFHTC9ENXMwajMwSVBJZEpzd2Uwc1BmZ1QwSnkr?=
 =?utf-8?B?dnZMQ1pEMHprRnBMTm9yMnBnaThJclAxSjZZejhkSnVDVWhLYW52ZWdiTHNr?=
 =?utf-8?B?SE5KTzQzWlFLYzBvQjFNNFR1RHpPUW9RL1p6ZHlsb21QNE5uUE1KTWN6V2JP?=
 =?utf-8?B?ZU1PR1JrbklLUWZnL3IrUVhZOG9UMDBTSVBCNjd1eEhUbFlxYzZNVnlGL1VP?=
 =?utf-8?B?ck9BclhocHEzQ0Nrb2Yrbms3Rk11SlBMNEU0YTBzS0hlMW9nVFNJZzFZeFFr?=
 =?utf-8?B?Wk53MTFRS0xPV1lteU5wb29oUWV4QnBMUURZWUppTjkxNkhMWlE1c0lrZG9G?=
 =?utf-8?B?WnpjcFVyWURzeWRZejlUaEwyb0JSU0xUZ0JBbHo3eXJXMHpXWEN1YWhLWEd2?=
 =?utf-8?B?bEtVNEc2UVhRbktVWFNNeXNsenM2c0l2VnhINWRCa0tLdWtoUU1ib29tYkRm?=
 =?utf-8?B?bzVHdm5RTGtPYkJ2S2RLQlJMK243SkdVbEtNRFZob1FZajUvZDlLeUEzZmFi?=
 =?utf-8?B?R3lsV01PQnBkbHFUR0ZaRnl6ODF2aWZNcUI5U0JDb1h2YytpQ1FXOVdyTmRK?=
 =?utf-8?B?Sk14U1dEM2hPQVJqMUVCenNONzhhTERSMXdaOUFwZGY1WjQ0eG54OUVuMUh2?=
 =?utf-8?B?SHlVRzVRdHppVEdMZmhnZm12M002UTJkWThVVnVuMWVkTUxOWTRSd3J0Y2FT?=
 =?utf-8?B?VFdXTnRtdEVET0UyeHp2c2F5NW5pZUV5THVjbU5rbmRQbk5JdEhaazU3cmRm?=
 =?utf-8?B?TXZHbTAxMzYwdDZBbjdzNU8ycmgxNnNyUUc0SFdodUNEM2I4QkZnYzhYR0VP?=
 =?utf-8?B?ODVsb0hoaTYwdEMvZEhiTUFYTUV1WjdVakw4OFA1VE1XTjJUc2czZUtCK3Fp?=
 =?utf-8?B?QnRGRDREM3NaRTcxSkZhYUJONmdQSy9HNWd1NmdLcEZyZFA5aGdEY2JxUFdm?=
 =?utf-8?B?NjIzWVBSdnBSY1piTVY2TmdRc0N0MWVYdkhBSW44dUJ3Z3l4cXpmMHhpbDdC?=
 =?utf-8?B?bHhPTUVNV0JhOUFkSW00ZXAwU1M4TWdFdmtDSS9UZ1E3a3o4bC93Q1g1eTM5?=
 =?utf-8?B?L0RxTWdIVHJhSjZ5TFZyNDVvZ1BsMFNhVFlIZ2lLQkgrNnFYQXNrOVdtOGhF?=
 =?utf-8?B?UFdDaEFYVjVLMUQ5ejQ5VGloV3dqMm1naXVrWk9NcnFSZnJMMWxybTVMZ0hJ?=
 =?utf-8?B?akVYV2YvWC8rUlFEOWNaZU1pK2d3MStJdTk1aXl4VjVXcDRxMXBjcTdaTlJ0?=
 =?utf-8?B?OGZwdUxCS1FHZm0zaEdQb3ZkVkYyUzMxbC9XQ0Z0b094UmtqVE9hajV6QVIz?=
 =?utf-8?B?SE9DcVFmVHQ5OFZZOFdTV29ZdWc3UFc3ZzNUMjV3UlNXTlNTaEdkamxkUGUw?=
 =?utf-8?B?bjAybmdjZm53ZVFTakNuN0VzM1ZlQTJScVpLM0QzOXZHNHBlaWY0aERtNG5V?=
 =?utf-8?Q?Cor2yDGdz+8dQQzvFsZKITA5s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d216788-f434-4cd7-cc48-08dcd9b290da
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 20:26:53.8826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2879BjB+7R3bZYRhRBAQeHiI8H2G32lB4GPGFC0RxajH7Ou+ylYSvVrdbjbbH5PMuU7oi6ao2/8ciqFATM1Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8130
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

On 2024-09-18 11:10, Alistair Popple wrote:
> Matthew Brost <matthew.brost@intel.com> writes:
>
>> On Wed, Sep 11, 2024 at 02:53:31PM +1000, Alistair Popple wrote:
>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>
>>> I haven't seen the same in the NVIDIA UVM driver (out-of-tree, I know)
>> Still a driver.
> Indeed, and I'm happy to answer any questions about our implementation.
>
>>> but theoretically it seems like it should be possible. However we
>>> serialize migrations of the same virtual address range to avoid these
>>> kind of issues as they can happen the other way too (ie. multiple
>>> threads trying to migrate to GPU).
>>>
>>> So I suspect what happens in UVM is that one thread wins and installs
>>> the migration entry while the others fail to get the driver migration
>>> lock and bail out sufficiently early in the fault path to avoid the
>>> live-lock.
>>>
>> I had to try hard to show this, doubt an actual user could trigger this.
>>
>> I wrote a test which kicked 8 threads, each thread did a pthread join,
>> and then tried to read the same page. This repeats in loop for like 512
>> pages or something. I needed an exclusive lock in migrate_to_ram vfunc
>> for it to livelock. Without an exclusive lock I think on average I saw
>> about 32k retries (i.e. migrate_to_ram calls on the same page) before a
>> thread won this race.
>>
>>  From reading UVM, pretty sure if you tried hard enough you could trigger
>> a livelock given it appears you take excluvise locks in migrate_to_ram.
> Yes, I suspect you're correct here and that we just haven't tried hard
> enough to trigger it.
>
>>>> Cc: Philip Yang <Philip.Yang@amd.com>
>>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Suggessted-by: Simona Vetter <simona.vetter@ffwll.ch>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   mm/memory.c         | 13 +++++++---
>>>>   mm/migrate_device.c | 60 +++++++++++++++++++++++++++++++--------------
>>>>   2 files changed, 50 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/mm/memory.c b/mm/memory.c
>>>> index 3c01d68065be..bbd97d16a96a 100644
>>>> --- a/mm/memory.c
>>>> +++ b/mm/memory.c
>>>> @@ -4046,10 +4046,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>>>>   			 * Get a page reference while we know the page can't be
>>>>   			 * freed.
>>>>   			 */
>>>> -			get_page(vmf->page);
>>>> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>> -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>>> -			put_page(vmf->page);
>>>> +			if (trylock_page(vmf->page)) {
>>>> +				get_page(vmf->page);
>>>> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>> This is all beginning to look a lot like migrate_vma_collect_pmd(). So
>>> rather than do this and then have to pass all this context
>>> (ie. fault_page) down to the migrate_vma_* functions could we instead
>>> just do what migrate_vma_collect_pmd() does here? Ie. we already have
>>> the PTL and the page lock so there's no reason we couldn't just setup
>>> the migration entry prior to calling migrate_to_ram().
>>>
>>> Obviously calling migrate_vma_setup() would show the page as not
>>> migrating, but drivers could easily just fill in the src_pfn info after
>>> calling migrate_vma_setup().
>>>
>>> This would eliminate the whole fault_page ugliness.
>>>
>> This seems like it would work and agree it likely be cleaner. Let me
>> play around with this and see what I come up with. Multi-tasking a bit
>> so expect a bit of delay here.
>>
>> Thanks for the input,
>> Matt

Thanks! Sorry, I'm late catching up after a vacation. Please keep 
Philip, Christian and myself in the loop with future patches in this area.

Regards,
   Felix


>>
>>>> +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>>>> +				put_page(vmf->page);
>>>> +				unlock_page(vmf->page);
>>>> +			} else {
>>>> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
>>>> +			}
>>>>   		} else if (is_hwpoison_entry(entry)) {
>>>>   			ret = VM_FAULT_HWPOISON;
>>>>   		} else if (is_pte_marker_entry(entry)) {
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index 6d66dc1c6ffa..049893a5a179 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>   				   struct mm_walk *walk)
>>>>   {
>>>>   	struct migrate_vma *migrate = walk->private;
>>>> +	struct folio *fault_folio = migrate->fault_page ?
>>>> +		page_folio(migrate->fault_page) : NULL;
>>>>   	struct vm_area_struct *vma = walk->vma;
>>>>   	struct mm_struct *mm = vma->vm_mm;
>>>>   	unsigned long addr = start, unmapped = 0;
>>>> @@ -88,11 +90,13 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>   
>>>>   			folio_get(folio);
>>>>   			spin_unlock(ptl);
>>>> -			if (unlikely(!folio_trylock(folio)))
>>>> +			if (unlikely(fault_folio != folio &&
>>>> +				     !folio_trylock(folio)))
>>>>   				return migrate_vma_collect_skip(start, end,
>>>>   								walk);
>>>>   			ret = split_folio(folio);
>>>> -			folio_unlock(folio);
>>>> +			if (fault_folio != folio)
>>>> +				folio_unlock(folio);
>>>>   			folio_put(folio);
>>>>   			if (ret)
>>>>   				return migrate_vma_collect_skip(start, end,
>>>> @@ -192,7 +196,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>   		 * optimisation to avoid walking the rmap later with
>>>>   		 * try_to_migrate().
>>>>   		 */
>>>> -		if (folio_trylock(folio)) {
>>>> +		if (fault_folio == folio || folio_trylock(folio)) {
>>>>   			bool anon_exclusive;
>>>>   			pte_t swp_pte;
>>>>   
>>>> @@ -204,7 +208,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>   
>>>>   				if (folio_try_share_anon_rmap_pte(folio, page)) {
>>>>   					set_pte_at(mm, addr, ptep, pte);
>>>> -					folio_unlock(folio);
>>>> +					if (fault_folio != folio)
>>>> +						folio_unlock(folio);
>>>>   					folio_put(folio);
>>>>   					mpfn = 0;
>>>>   					goto next;
>>>> @@ -363,6 +368,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>>>>   					  unsigned long npages,
>>>>   					  struct page *fault_page)
>>>>   {
>>>> +	struct folio *fault_folio = fault_page ?
>>>> +		page_folio(fault_page) : NULL;
>>>>   	unsigned long i, restore = 0;
>>>>   	bool allow_drain = true;
>>>>   	unsigned long unmapped = 0;
>>>> @@ -427,7 +434,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>>>>   		remove_migration_ptes(folio, folio, false);
>>>>   
>>>>   		src_pfns[i] = 0;
>>>> -		folio_unlock(folio);
>>>> +		if (fault_folio != folio)
>>>> +			folio_unlock(folio);
>>>>   		folio_put(folio);
>>>>   		restore--;
>>>>   	}
>>>> @@ -536,6 +544,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>>   		return -EINVAL;
>>>>   	if (args->fault_page && !is_device_private_page(args->fault_page))
>>>>   		return -EINVAL;
>>>> +	if (args->fault_page && !PageLocked(args->fault_page))
>>>> +		return -EINVAL;
>>>>   
>>>>   	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>>>>   	args->cpages = 0;
>>>> @@ -799,19 +809,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>>>   }
>>>>   EXPORT_SYMBOL(migrate_vma_pages);
>>>>   
>>>> -/*
>>>> - * migrate_device_finalize() - complete page migration
>>>> - * @src_pfns: src_pfns returned from migrate_device_range()
>>>> - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
>>>> - * @npages: number of pages in the range
>>>> - *
>>>> - * Completes migration of the page by removing special migration entries.
>>>> - * Drivers must ensure copying of page data is complete and visible to the CPU
>>>> - * before calling this.
>>>> - */
>>>> -void migrate_device_finalize(unsigned long *src_pfns,
>>>> -			unsigned long *dst_pfns, unsigned long npages)
>>>> +static void __migrate_device_finalize(unsigned long *src_pfns,
>>>> +				      unsigned long *dst_pfns,
>>>> +				      unsigned long npages,
>>>> +				      struct page *fault_page)
>>>>   {
>>>> +	struct folio *fault_folio = fault_page ?
>>>> +		page_folio(fault_page) : NULL;
>>>>   	unsigned long i;
>>>>   
>>>>   	for (i = 0; i < npages; i++) {
>>>> @@ -838,7 +842,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>>>>   		src = page_folio(page);
>>>>   		dst = page_folio(newpage);
>>>>   		remove_migration_ptes(src, dst, false);
>>>> -		folio_unlock(src);
>>>> +		if (fault_folio != src)
>>>> +			folio_unlock(src);
>>>>   
>>>>   		if (is_zone_device_page(page))
>>>>   			put_page(page);
>>>> @@ -854,6 +859,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
>>>>   		}
>>>>   	}
>>>>   }
>>>> +
>>>> +/*
>>>> + * migrate_device_finalize() - complete page migration
>>>> + * @src_pfns: src_pfns returned from migrate_device_range()
>>>> + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
>>>> + * @npages: number of pages in the range
>>>> + *
>>>> + * Completes migration of the page by removing special migration entries.
>>>> + * Drivers must ensure copying of page data is complete and visible to the CPU
>>>> + * before calling this.
>>>> + */
>>>> +void migrate_device_finalize(unsigned long *src_pfns,
>>>> +			unsigned long *dst_pfns, unsigned long npages)
>>>> +{
>>>> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
>>>> +}
>>>>   EXPORT_SYMBOL(migrate_device_finalize);
>>>>   
>>>>   /**
>>>> @@ -869,7 +890,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>>>>    */
>>>>   void migrate_vma_finalize(struct migrate_vma *migrate)
>>>>   {
>>>> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
>>>> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
>>>> +				  migrate->fault_page);
>>>>   }
>>>>   EXPORT_SYMBOL(migrate_vma_finalize);
