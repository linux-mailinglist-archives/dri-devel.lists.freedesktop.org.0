Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA8C49D927
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 04:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF06210EDE8;
	Thu, 27 Jan 2022 03:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ABE10EB86;
 Thu, 27 Jan 2022 03:22:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1oSDhs4D3larT8CY5xb/K6IBM7L9rDzsMuzr7tQwWbBRHZLROw26e4Lc+Xsx7sC9A9kCqJ1Bicayue32E9XP8NcYsZJDw2jEt9whvGBOnljRiPqNlFCWaax0R7d8pkDrkYiOlzDOBiYUamLeo3MIwRP0QKW3O5zCrezYnuPwGX7GfRriqU9TBSQMTsIckftSzkpwAKW/OHCPA/HYjyqEOV88qX4nroanI3CElmITtrpjMMUdBkAqWZIsVM3bNfzonyNQhSM+/FUUa1kUfCZUYhAUa4QSXuWepHdiUaEi3vWeGBOaBLhEdBhsl18yTk5gm4yUDU+JK97M4icvrRmXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u21d6e5uWa287sHRF6ks9F2pso+BptfHfjHxxkX4Hl0=;
 b=a8TtvD3hRe6uPeSeJz9g4HvyNXLo/G7AzTwvaRJ+4qyzhz7bTmahi17fS6EHdWw6HbJ5jkscXdrJrXwxfOYaRhtvCw10M5lcifu+dtG4Q04C9A7Tl3AGLG0mldDXPfVoxvXHQnxzInITzuO8FP3taGikBvhWzhb0bEz09Se8xc6Bgtx9EaxHGnmeV/woMb15x1uJKVd9yqUi9Yj8AEpSbJNRs7k8qvYjKcGUx3xKFO76yH47zFODSFQVljomi0X/JTn0OdLhZsjtoITlqK7SVaB9oLtuM5ri4V1rar9M/9HCYVIgu2lbTwdysN4nLqWvgd81ZqXtGtDy8rLoAxlMwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u21d6e5uWa287sHRF6ks9F2pso+BptfHfjHxxkX4Hl0=;
 b=dWwjUZWZULETMOmmlbl15kUm4AAe6yzgE1vZWjbhGS7Ae1sb7A1vnsFXAybvWMI4eXGKEweaYlu+BiDxOQXkQw7qF2ViKThNGh49JwiXBpjM3Qg1lBBvzgK/Dvf9BHP9wOkYFyoo9mgYlNUPPnpwxVdWGINcs+0x9druREAAbLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by CY4PR1201MB0102.namprd12.prod.outlook.com (2603:10b6:910:1b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 03:22:18 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37%3]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 03:22:18 +0000
Message-ID: <3e10368c-6ea9-f82f-16cb-3df7172404ad@amd.com>
Date: Wed, 26 Jan 2022 21:22:13 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 09/10] tools: update hmm-test to support device
 coherent type
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 Felix.Kuehling@amd.com, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20220110223201.31024-1-alex.sierra@amd.com>
 <20220110223201.31024-10-alex.sierra@amd.com> <2346143.zzXRFGWsWK@nvdebian>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <2346143.zzXRFGWsWK@nvdebian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:2d::25) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201cdc23-1aa1-4112-d065-08d9e14438f6
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0102:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0102B8C00FE2F788C8396799FD219@CY4PR1201MB0102.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fo9nWiZ4CBauJB4VDaTjbKAZpeX5b/yYIE5hy6P4uSViOroY2/S/cNYEWTlUu9R7Ssu+jmENVQPyBDOVDhMZ6K3mFRSWj8hfFGs+2h1zI1rn6wMhZ8W+7L8/YDS0EW07AiVAD5WvYsadfQYkDtSh/0lOAdjYvd4Pms2l+YoB2SIYgLG4Vdt57n3zZlWLdHnF8VnqJpzjMDGjKGbB14pSWf3fUJZ04kV9oy7bstOo/xNAMe9UM2ctP6A6+ikZFeDq7ZrG1LBkr5/jf4dCq6j8JFSe+OhcN1xnM5Vy5G8gm3uelIjTiAZdR7qQpqgELLJXg3gr1Zpo+lck0a2IYliYaUha+SiQtVrJODofe2EXWnF9QYIax8dC0fCbv3a7GdeDit6OIfRp0kooA2YP+akhIAZBCm8kiITtvCcQ+7eok63R+5yFXOFdKtWs+O7RkGRRjp36O/+gkkvFqYoWHz/Er17iJenc1zkBLu5L5QIZSguN6IlDV2J3yIxp1tZfVIdXCRdJgW1WqNZ9X6lp3J3vjawzmMg1GemDraHPeFOOZGcO/evEai94ejqzufompupBEJYWEg0b0g4mrtcwOqOeJTQj31nnuaeCI/91VB5gTcUmFveSJwI+5JqyRUV7YI+5cTPMauupbw5QREidVbAaJd8w/L/KjI2lTg6wTei9w0JpmA40XMiXeI4xJ2KoYqeh81m5Nt5fDISNgMTmVGxBIKA74HrrcDzQciwXEbTcNmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(36756003)(2906002)(53546011)(186003)(26005)(6486002)(2616005)(6512007)(508600001)(316002)(6506007)(31686004)(8936002)(83380400001)(66946007)(66556008)(66476007)(4326008)(86362001)(8676002)(31696002)(15650500001)(5660300002)(30864003)(7416002)(38100700002)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1ExR0kreEorNWxlYjhsV1pqZ2RCMFBuQzdMZkNRUlpRNnNEUStwOFE3TzRP?=
 =?utf-8?B?QXZBNEl6QjJWdXJPcENpY2xJVFQyaTBHbFdZQmpUMklMbFlPYm8xV2cvSHNV?=
 =?utf-8?B?ais1K3RQOE52dUh6T0t5NXBNaWtFOHk4YWtKZXFJVkJ0OE5PQ3NLbWRydWVk?=
 =?utf-8?B?R29IbVVEYjVLSGMxeDhiV0RvUjVOb25zV3UyVXZwUm9qNTBOdWdnQ0hFcFlP?=
 =?utf-8?B?bGZwTStpUTYzKzlNN0ppNGZKZ3NqOEZzbDZTRnpVZjhVNzFOMDg5aVpDK01p?=
 =?utf-8?B?VGpqV3VLRHBvdmRxNzhzcFA1OTFHem1DTzNQR3JUZUo2cTIyUUFNYmgvbWth?=
 =?utf-8?B?SUxTQXp4d2JJVXdHMVV0U1VCbVJpSXNWUlF2ZjlBSndtM216NndHSXJpcG5i?=
 =?utf-8?B?MXpqd3NLdmdnZkMrdllxR2hKS08wTTNpSzNYVlFYekcrcVRmYWtlU0lnemFO?=
 =?utf-8?B?SHNXQTBZWXcrd25McTZ6ZklSNEZZL0hnSlB0MzF1VFE0a282UzBBTW5mSXZ0?=
 =?utf-8?B?YjR5Tk1Gd1BuL1RqWVFqdFFQOEdsYXJqWEhvSG1QL3B3bmRLb1ZOeDg4US85?=
 =?utf-8?B?V3YrWDBvdkp3WmtvTURvODB6UFAyUWRPT2FKZ2YvaGRPMDh5eStXc0ZJL29Y?=
 =?utf-8?B?eWVwY3R6SlRXYUpRQzBkZS9FeVJUR1h3ZWJBSnpxZm0remFFRThGQ2d3aStX?=
 =?utf-8?B?TmlJUnY2dGNwZlo1eWpIL3AzM3VEV1dJcEJtc2ZKVXRwV2JzdmZMdFRrOG5a?=
 =?utf-8?B?T3ZaOEZhTmlTZWxKTW5IUEgxNFZ2NmQxT0hWQmwvT0RyNS9zTStJSHIyUVFL?=
 =?utf-8?B?eUdvUEVGOXUvOG12TmVZdjhleXVkRlBYUE1NdjJSN1YrbjEvQmpMZFdwbVRF?=
 =?utf-8?B?OG9TaEtmVEZ3WDc3T2N6WnlvTHVXQ1BydXRJU1ZhdjJMQmlHcU5jQ0xQUmNE?=
 =?utf-8?B?RjRkZmtydnQzZ1k4ZThhemNTU1hsTkFEOWVwd1dYSUpRclNETlZoSGNHUnV4?=
 =?utf-8?B?WDcwb0ZkU3FrVXdCcnNpNWp3SUpqc1ZrMENheXYyUDFvVy90S0NuVGpzOFlJ?=
 =?utf-8?B?Skduck03Zzd4WEVkL0s5eHNuNG1nVS9nd2pMM3h3WUVDUzNqSzlrTjFFUTl2?=
 =?utf-8?B?TnhrUnljb1NWcS9mZEU5TzRhczFCQVhmbUQ4SzBmRnRzZ1FNcjRqWW5meDQ5?=
 =?utf-8?B?ckxYLzQwdkRoYm1hSzZNVU9iMHFrdGQzb3VYWnFDK2U4RllZS3RoN3RrTWMr?=
 =?utf-8?B?VktmYkNSb29Pd3RsZmhWSG1YV3ZTSGNYQkc2Y0hnRG4xNG9oTkk5MysreXZN?=
 =?utf-8?B?Lzd4bDZjbUQvMjd6QXVGTmNCRnlBcEpkNTNCK3B0M3FCemJjNlpXSUZsOFE0?=
 =?utf-8?B?RjR5akJ0ajRob2Y5bk9SYnRNM04zOGxDUUJ2UHBBTDIrc0pJOFhmbk8vbTBl?=
 =?utf-8?B?NmlqVXorRDB3R3pvMnFiRHo4TmlQSlFXNnRqeUlOVyswblR6Mld2WFIyd2Fu?=
 =?utf-8?B?eGs4NWtRSmdtdG95RVdyOERKR0pyaDEyNFJUeFNNRlJCdDB5U2prcnpHaStj?=
 =?utf-8?B?akphb2VpRmdkSnpmTEYvK2ZWaGxjVmVCNTVHSUZhUTMrQTc0b2I4djVvMG5F?=
 =?utf-8?B?L28wV3QrMXJkTkVuWWt3LzNvY1p5czY5RmhIOFFEUldRbmR4a1poY1lZNCtE?=
 =?utf-8?B?RXh1NDlEeVdQWGRpSWRtN3RraVhuM3VIUGJUdTdqV0lIWUJISnJ0djRxWFRU?=
 =?utf-8?B?eWtZSDZzL3J0Rnc0dmNGS1hta2p1eTlZdk5rT0ZvUjZYcW5IOFh0TE5mckxU?=
 =?utf-8?B?cVJybG15Q2ZYUzNzUE42L0pjOGpkNmlyYU9zSzNyNjNaTUlWc1pnQ1VzVDVF?=
 =?utf-8?B?Y3JZR1lPQVdyalJnUzBvRFkrOFc4eDlRT05XcUwzMEJjSnpXZVhWNU5ldVpp?=
 =?utf-8?B?MXZIRTdBQ2toeVlNSWhDcTNzck9HeDBZRE1CVmJlbVg2Sk9aSkY4Mml1VXFl?=
 =?utf-8?B?dzJ0U0pqcC9hMFRSL2dBdDNXNlZ1elROd2llOUlKbjRyTjBRL1Y3aDB1K0g3?=
 =?utf-8?B?TXIwczUzL0pLelNhcDFlNUFxT0EyQWVFRjlSN0J3cHJDdThqRVNVRXo5NWl4?=
 =?utf-8?B?Z2l6NDVvYjJUdzVjcTdRMFVDUHBVUHhCeVFvOWUwcUlyaGZjN1Z6MWZZeDdI?=
 =?utf-8?Q?vXrBOKLYfQ4JORc92xlTxrw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201cdc23-1aa1-4112-d065-08d9e14438f6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 03:22:18.1339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GBc7QsrX3eP2WKm3p2Jm6AWAA3CO2P67QPwGq+iKkgr4hbsi38FDy3RimzW1MI2UbpSPz7v2CBmMu190SxOmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0102
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/20/2022 12:14 AM, Alistair Popple wrote:
> On Tuesday, 11 January 2022 9:32:00 AM AEDT Alex Sierra wrote:
>> Test cases such as migrate_fault and migrate_multiple, were modified to
>> explicit migrate from device to sys memory without the need of page
>> faults, when using device coherent type.
>>
>> Snapshot test case updated to read memory device type first and based
>> on that, get the proper returned results migrate_ping_pong test case
> Where is the migrate_ping_pong test? Did you perhaps forget to add it? :-)

Migration from device coherent to system is tested with migrate_multiple 
too. Therefore,
I've removed migrate_ping_pong test. BTW, I just added the "number of 
pages migrated"
checker after migrate from coherent to system on v4 series.

Regards,
Alejandro Sierra

>
>> added to test explicit migration from device to sys memory for both
>> private and coherent zone types.
>>
>> Helpers to migrate from device to sys memory and vicerversa
>> were also added.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>> v2:
>> Set FIXTURE_VARIANT to add multiple device types to the FIXTURE. This
>> will run all the tests for each device type (private and coherent) in
>> case both existed during hmm-test driver probed.
>> ---
>>   tools/testing/selftests/vm/hmm-tests.c | 122 ++++++++++++++++++++-----
>>   1 file changed, 101 insertions(+), 21 deletions(-)
>>
>> diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
>> index 864f126ffd78..8eb81dfba4b3 100644
>> --- a/tools/testing/selftests/vm/hmm-tests.c
>> +++ b/tools/testing/selftests/vm/hmm-tests.c
>> @@ -44,6 +44,14 @@ struct hmm_buffer {
>>   	int		fd;
>>   	uint64_t	cpages;
>>   	uint64_t	faults;
>> +	int		zone_device_type;
>> +};
>> +
>> +enum {
>> +	HMM_PRIVATE_DEVICE_ONE,
>> +	HMM_PRIVATE_DEVICE_TWO,
>> +	HMM_COHERENCE_DEVICE_ONE,
>> +	HMM_COHERENCE_DEVICE_TWO,
>>   };
>>   
>>   #define TWOMEG		(1 << 21)
>> @@ -60,6 +68,21 @@ FIXTURE(hmm)
>>   	unsigned int	page_shift;
>>   };
>>   
>> +FIXTURE_VARIANT(hmm)
>> +{
>> +	int     device_number;
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(hmm, hmm_device_private)
>> +{
>> +	.device_number = HMM_PRIVATE_DEVICE_ONE,
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(hmm, hmm_device_coherent)
>> +{
>> +	.device_number = HMM_COHERENCE_DEVICE_ONE,
>> +};
>> +
>>   FIXTURE(hmm2)
>>   {
>>   	int		fd0;
>> @@ -68,6 +91,24 @@ FIXTURE(hmm2)
>>   	unsigned int	page_shift;
>>   };
>>   
>> +FIXTURE_VARIANT(hmm2)
>> +{
>> +	int     device_number0;
>> +	int     device_number1;
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_private)
>> +{
>> +	.device_number0 = HMM_PRIVATE_DEVICE_ONE,
>> +	.device_number1 = HMM_PRIVATE_DEVICE_TWO,
>> +};
>> +
>> +FIXTURE_VARIANT_ADD(hmm2, hmm2_device_coherent)
>> +{
>> +	.device_number0 = HMM_COHERENCE_DEVICE_ONE,
>> +	.device_number1 = HMM_COHERENCE_DEVICE_TWO,
>> +};
>> +
>>   static int hmm_open(int unit)
>>   {
>>   	char pathname[HMM_PATH_MAX];
>> @@ -81,12 +122,19 @@ static int hmm_open(int unit)
>>   	return fd;
>>   }
>>   
>> +static bool hmm_is_coherent_type(int dev_num)
>> +{
>> +	return (dev_num >= HMM_COHERENCE_DEVICE_ONE);
>> +}
>> +
>>   FIXTURE_SETUP(hmm)
>>   {
>>   	self->page_size = sysconf(_SC_PAGE_SIZE);
>>   	self->page_shift = ffs(self->page_size) - 1;
>>   
>> -	self->fd = hmm_open(0);
>> +	self->fd = hmm_open(variant->device_number);
>> +	if (self->fd < 0 && hmm_is_coherent_type(variant->device_number))
>> +		SKIP(exit(0), "DEVICE_COHERENT not available");
>>   	ASSERT_GE(self->fd, 0);
>>   }
>>   
>> @@ -95,9 +143,11 @@ FIXTURE_SETUP(hmm2)
>>   	self->page_size = sysconf(_SC_PAGE_SIZE);
>>   	self->page_shift = ffs(self->page_size) - 1;
>>   
>> -	self->fd0 = hmm_open(0);
>> +	self->fd0 = hmm_open(variant->device_number0);
>> +	if (self->fd0 < 0 && hmm_is_coherent_type(variant->device_number0))
>> +		SKIP(exit(0), "DEVICE_COHERENT not available");
>>   	ASSERT_GE(self->fd0, 0);
>> -	self->fd1 = hmm_open(1);
>> +	self->fd1 = hmm_open(variant->device_number1);
>>   	ASSERT_GE(self->fd1, 0);
>>   }
>>   
>> @@ -144,6 +194,7 @@ static int hmm_dmirror_cmd(int fd,
>>   	}
>>   	buffer->cpages = cmd.cpages;
>>   	buffer->faults = cmd.faults;
>> +	buffer->zone_device_type = cmd.zone_device_type;
>>   
>>   	return 0;
>>   }
>> @@ -211,6 +262,20 @@ static void hmm_nanosleep(unsigned int n)
>>   	nanosleep(&t, NULL);
>>   }
>>   
>> +static int hmm_migrate_sys_to_dev(int fd,
>> +				   struct hmm_buffer *buffer,
>> +				   unsigned long npages)
>> +{
>> +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_DEV, buffer, npages);
>> +}
>> +
>> +static int hmm_migrate_dev_to_sys(int fd,
>> +				   struct hmm_buffer *buffer,
>> +				   unsigned long npages)
>> +{
>> +	return hmm_dmirror_cmd(fd, HMM_DMIRROR_MIGRATE_TO_SYS, buffer, npages);
>> +}
>> +
>>   /*
>>    * Simple NULL test of device open/close.
>>    */
>> @@ -875,7 +940,7 @@ TEST_F(hmm, migrate)
>>   		ptr[i] = i;
>>   
>>   	/* Migrate memory to device. */
>> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
>> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>>   	ASSERT_EQ(ret, 0);
>>   	ASSERT_EQ(buffer->cpages, npages);
>>   
>> @@ -923,7 +988,7 @@ TEST_F(hmm, migrate_fault)
>>   		ptr[i] = i;
>>   
>>   	/* Migrate memory to device. */
>> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
>> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>>   	ASSERT_EQ(ret, 0);
>>   	ASSERT_EQ(buffer->cpages, npages);
>>   
>> @@ -936,7 +1001,7 @@ TEST_F(hmm, migrate_fault)
>>   		ASSERT_EQ(ptr[i], i);
>>   
>>   	/* Migrate memory to the device again. */
>> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
>> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>>   	ASSERT_EQ(ret, 0);
>>   	ASSERT_EQ(buffer->cpages, npages);
>>   
>> @@ -976,7 +1041,7 @@ TEST_F(hmm, migrate_shared)
>>   	ASSERT_NE(buffer->ptr, MAP_FAILED);
>>   
>>   	/* Migrate memory to device. */
>> -	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
>> +	ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>>   	ASSERT_EQ(ret, -ENOENT);
>>   
>>   	hmm_buffer_free(buffer);
>> @@ -1015,7 +1080,7 @@ TEST_F(hmm2, migrate_mixed)
>>   	p = buffer->ptr;
>>   
>>   	/* Migrating a protected area should be an error. */
>> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, npages);
>> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, npages);
>>   	ASSERT_EQ(ret, -EINVAL);
>>   
>>   	/* Punch a hole after the first page address. */
>> @@ -1023,7 +1088,7 @@ TEST_F(hmm2, migrate_mixed)
>>   	ASSERT_EQ(ret, 0);
>>   
>>   	/* We expect an error if the vma doesn't cover the range. */
>> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 3);
>> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 3);
>>   	ASSERT_EQ(ret, -EINVAL);
>>   
>>   	/* Page 2 will be a read-only zero page. */
>> @@ -1055,13 +1120,13 @@ TEST_F(hmm2, migrate_mixed)
>>   
>>   	/* Now try to migrate pages 2-5 to device 1. */
>>   	buffer->ptr = p + 2 * self->page_size;
>> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 4);
>> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 4);
>>   	ASSERT_EQ(ret, 0);
>>   	ASSERT_EQ(buffer->cpages, 4);
>>   
>>   	/* Page 5 won't be migrated to device 0 because it's on device 1. */
>>   	buffer->ptr = p + 5 * self->page_size;
>> -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
>> +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
>>   	ASSERT_EQ(ret, -ENOENT);
>>   	buffer->ptr = p;
>>   
>> @@ -1070,8 +1135,12 @@ TEST_F(hmm2, migrate_mixed)
>>   }
>>   
>>   /*
>> - * Migrate anonymous memory to device private memory and fault it back to system
>> - * memory multiple times.
>> + * Migrate anonymous memory to device memory and back to system memory
>> + * multiple times. In case of private zone configuration, this is done
>> + * through fault pages accessed by CPU. In case of coherent zone configuration,
>> + * the pages from the device should be explicitly migrated back to system memory.
>> + * The reason is Coherent device zone has coherent access by CPU, therefore
>> + * it will not generate any page fault.
>>    */
>>   TEST_F(hmm, migrate_multiple)
>>   {
>> @@ -1107,8 +1176,7 @@ TEST_F(hmm, migrate_multiple)
>>   			ptr[i] = i;
>>   
>>   		/* Migrate memory to device. */
>> -		ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer,
>> -				      npages);
>> +		ret = hmm_migrate_sys_to_dev(self->fd, buffer, npages);
>>   		ASSERT_EQ(ret, 0);
>>   		ASSERT_EQ(buffer->cpages, npages);
>>   
>> @@ -1116,7 +1184,12 @@ TEST_F(hmm, migrate_multiple)
>>   		for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
>>   			ASSERT_EQ(ptr[i], i);
>>   
>> -		/* Fault pages back to system memory and check them. */
>> +		/* Migrate back to system memory and check them. */
>> +		if (hmm_is_coherent_type(variant->device_number)) {
>> +			ret = hmm_migrate_dev_to_sys(self->fd, buffer, npages);
> So I think this will still pass even if nothing migrates so as mentioned on
> the previous patch I think we need to check for the number of pages that
> actually migrated. Alternatively I suppose you could do a snapshot and check
> that, but that seems like it would be harder. Otherwise I think this looks
> good.
>
>> +			ASSERT_EQ(ret, 0);
>> +		}
>> +
>>   		for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
>>   			ASSERT_EQ(ptr[i], i);
>>   
>> @@ -1312,13 +1385,13 @@ TEST_F(hmm2, snapshot)
>>   
>>   	/* Page 5 will be migrated to device 0. */
>>   	buffer->ptr = p + 5 * self->page_size;
>> -	ret = hmm_dmirror_cmd(self->fd0, HMM_DMIRROR_MIGRATE, buffer, 1);
>> +	ret = hmm_migrate_sys_to_dev(self->fd0, buffer, 1);
>>   	ASSERT_EQ(ret, 0);
>>   	ASSERT_EQ(buffer->cpages, 1);
>>   
>>   	/* Page 6 will be migrated to device 1. */
>>   	buffer->ptr = p + 6 * self->page_size;
>> -	ret = hmm_dmirror_cmd(self->fd1, HMM_DMIRROR_MIGRATE, buffer, 1);
>> +	ret = hmm_migrate_sys_to_dev(self->fd1, buffer, 1);
>>   	ASSERT_EQ(ret, 0);
>>   	ASSERT_EQ(buffer->cpages, 1);
>>   
>> @@ -1335,9 +1408,16 @@ TEST_F(hmm2, snapshot)
>>   	ASSERT_EQ(m[2], HMM_DMIRROR_PROT_ZERO | HMM_DMIRROR_PROT_READ);
>>   	ASSERT_EQ(m[3], HMM_DMIRROR_PROT_READ);
>>   	ASSERT_EQ(m[4], HMM_DMIRROR_PROT_WRITE);
>> -	ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
>> -			HMM_DMIRROR_PROT_WRITE);
>> -	ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
>> +	if (!hmm_is_coherent_type(variant->device_number0)) {
>> +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_PRIVATE_LOCAL |
>> +				HMM_DMIRROR_PROT_WRITE);
>> +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_NONE);
>> +	} else {
>> +		ASSERT_EQ(m[5], HMM_DMIRROR_PROT_DEV_COHERENT_LOCAL |
>> +				HMM_DMIRROR_PROT_WRITE);
>> +		ASSERT_EQ(m[6], HMM_DMIRROR_PROT_DEV_COHERENT_REMOTE |
>> +				HMM_DMIRROR_PROT_WRITE);
>> +	}
>>   
>>   	hmm_buffer_free(buffer);
>>   }
>>
>
>
>
