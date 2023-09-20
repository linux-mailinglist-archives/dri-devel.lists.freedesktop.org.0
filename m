Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EDA7A863E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 16:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268C810E4C2;
	Wed, 20 Sep 2023 14:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DE810E4C6;
 Wed, 20 Sep 2023 14:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D++8wOhSpJPU/deHjQTS35L3+UlVK79rBkHqd8vlud5fNZfzPUyeBR/4xx6MSNA4REVAp+UQsEPgcDyJ3tAfYqbd0GxbqjwPfUjOsLpYBnK1bmhg/1r8eym2ObemBpD/qIKPxK2PE+P7EG6jtVkuCSmCJ2UuKjWz4Q0ppgVY8otinNwrKWuD+lim6RyIXVvmQTMhARkNhoUXERYrsoaHLiRQJpDk+NODWCRwvzGgMy/fVPviY20GN7auqGkowWisBjL1yfoAPOp3IW/5ZKsRw75FLU089CHwFhGTvzoJkt8WFJ7fnCkvG9JHYc/vkvq1jyzF4CNZfyfzw7HMNHC17A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=071EPCi2TbLFZjQaaW8pb5706N0nSKAI7avDUDmz8wM=;
 b=Y68Ebfbv9CfrGclrvtCCq8LGxJenUqgKWNRNgd58qKzIAINX1nixFNEEAWJixGiia5nqht8a70wC3e95lXuYwJqr1xDikRpqBNjpoje+uRfHe51WdhebxxonFuEa7h58opt2kvhmeeYgzqivkUdC5RvuANyG9ZUju+q6ADzUNgiLzs1zq1iqGrWgWNl302rmmIN/pOdYInC+WUfDZHex2iMJEYQC3O+Di+HzqOFRkgFrFcIeqZwaLOf7+IWqRksO1NkD1DgfZt4CC+rZBoQxvFOEtW1wYCHZuqPEL6BFEppxcU3+6ma+s85l3TV7O98UQO+dWQsEWsm7TdKlHqXagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=071EPCi2TbLFZjQaaW8pb5706N0nSKAI7avDUDmz8wM=;
 b=1Vc1yi0MH+hpUdbJOzXcsuwf4NB38rG0ViFd9Y6OZa7CJVBQ7SZBt0+VOVpVm0lNn7pcmte8ZZgjlK5T/V5JX3CxDLn4odk8hrAWYETLn+1baz62PfDqJasZN5OlFetQKooX9DsRfT1q6s7VHhJotFre9VLfVjHry3NlzjVeRdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 20 Sep
 2023 14:11:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 14:11:31 +0000
Message-ID: <26a8da83-5542-dec7-b5d8-5d8bd569a99f@amd.com>
Date: Wed, 20 Sep 2023 16:11:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com> <ZQD2FFLP28bFgHXT@pollux>
 <cbff08ca845655dee44fbf498cdb37a3d5251bf3.camel@linux.intel.com>
 <ZQGoNovGz/4Y3xvf@pollux> <96af067a-ca48-891c-2adf-9faf271e3629@amd.com>
 <5f66db4e-f580-bbfb-d9fc-ac78afdbf01a@redhat.com>
 <0ca78a6b-9011-1738-f367-c9e6369f4ad4@amd.com>
 <00ecb16c-5ebb-7122-4e2d-df21e89a0cf1@redhat.com>
 <92c00bc7-1a20-edc3-e36c-7bcf61684a91@amd.com>
 <5f1b8427-1c51-b10f-f41c-a0f068ef3792@linux.intel.com>
 <7d237f39-51cd-6a3c-c010-8d9c4c7061a1@redhat.com>
 <177db5b8-ee94-3b15-3445-7ed1dc7bef2a@linux.intel.com>
 <7577b5c0-a1cf-61b9-5929-f19515b340c4@amd.com>
 <4a60b67f-c67a-ca80-20b6-4af57f6858df@linux.intel.com>
 <d4c66fdb-fe8b-5e2b-edbd-29f526b88b79@amd.com>
 <8de979ed-82b7-553f-27ab-35da88f4b80c@linux.intel.com>
 <f0957d1d-3d90-7851-ee40-a53fb6e8df8e@amd.com>
 <0130bbf0-1336-721a-d804-e9fc82192d72@linux.intel.com>
 <bb0cd1c8-cd66-7775-3c71-88da5a792e3c@amd.com>
 <d00eb406-b1eb-c812-a6a8-7cc9050a8d9f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d00eb406-b1eb-c812-a6a8-7cc9050a8d9f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: f39aacbf-41eb-4537-3448-08dbb9e37cf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MMOfPuacJXofBm/TPyh1xc8vBLds61Ymb0mPhwylpLVNusPBnbmy2zLtVbH7Da6nTOtsQGF1A6JdmmATNkVbzcmcbP3GWctpZ1Lwx8MtTiCr9RIGpARqA7Dd0JIeu3tMg599aEVeq4u7Oy3316vDTnh+41Br44caJQzxOWa5dBl5+Noo0nzVp9cXU2ujtmeEfvk9lqjOanuI2foNjHftOKVf2nO77J+MMIU/IpORceUheQhqf+/EBBTncVVNo6Ubu+5HADbkqDx6IsiSjNMzWVqLQ4k1KPo7rdl4RqdKotNUtDNKtY2m95r/4jYw/JtErIIMRrJ97rjg0wVvetqVC8WxNA1+zwyzY3LfGgaAL3WRxxxRZx7FNmVa/yTB4tFNHI4v8z7kphA1eOgCrUy8zqa467w7eWttzHuKP3MZqj9oOkWvWVnk1EpNwsVTAZPO3sFZmr1aa2xMJanxXXv6IUlDZ21/FKu9eUHD7xfFjA85YeaNDVNsae+2anb6QGfcYVPP5ECP6TSW4nDOR3gFGnsBuMbU+BD30zydX5Z1IYK+S/QFUNikDwXZmfgS1c2OF8BMRnl4np61EvnQvjcLzmQ6IgVnvQcPBMDlQsDSDppLqMXGfrBlEJpa4aM2NQFd/9lkkMSFTSeAv3ZlSj3Pfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199024)(186009)(1800799009)(31686004)(478600001)(8936002)(8676002)(6666004)(6506007)(6486002)(2906002)(2616005)(316002)(6512007)(36756003)(7416002)(31696002)(86362001)(4326008)(38100700002)(41300700001)(5660300002)(110136005)(66556008)(83380400001)(66574015)(66476007)(26005)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S25GL1BkUEM1S0lIQ01vTHVET0luNjVma1NVT3ZJZEpNRTBvb09NckZ3NjhP?=
 =?utf-8?B?RzVQb3B1bGlVM01maEZTYmhJQ1B0eHAyM3ZzRURDNlNIRDBBNlJabkdGTytj?=
 =?utf-8?B?cHk5dnpQeVVabEhmMkgxbm92UzIzYWxXZkRpcVRQbkZMM2tydUlkVEdBYkk2?=
 =?utf-8?B?MkQ5TkNKOTR0bFp0MDhpVjV2YXdQT0NkWFg0MDZlejIvY0JYL0ROYmRlazV5?=
 =?utf-8?B?UFpWRDVDUEYrOUNScFlFQVVhTGx2N1ovcSswVTVRMTlpWHJueVcrZXA5VlZF?=
 =?utf-8?B?dG4zNjZnKzVqK2g2M05RVitiZXZEWi9ZSk5rbjZpaTN3QW9ZaUVSbWp5TWs3?=
 =?utf-8?B?eFBranZVOTU5SXo2VzBPQUtla2lQcGNVbDFrdGlabzJtbjA1YndhOGFpdVNt?=
 =?utf-8?B?Q29Md0taQ09kOTQ5Um1YaCtGcTVWbTVSclRhSmM4Y1VLOHV4Y2NIK25BRVox?=
 =?utf-8?B?ZHFVZ0tybXZIZEk1SnJid1RUcFhTUXJpSkt2bkJZTWV1MW5EQmcwMWNPRWZ3?=
 =?utf-8?B?MXlFMzQvUFNIUis3SzVDeUdUUkRhRUxhYnJNaFFlK0dQZFp2K1d2a29ZMXVP?=
 =?utf-8?B?TDhMU0VvMjIyWGV5a1VRNUJYZ2R5QzU4YnhCbnJJQVZJUTNzR092aDFRaWRj?=
 =?utf-8?B?SGQ0M3YwS28vbjEwY3lPWmV6Z3NVWFBvcC90RlNKMlprTFFsK25GVGNPUnRJ?=
 =?utf-8?B?T2VZT0tuNHpMbHBqbWw2Tk9wVlZDQlFkOXd6azhXWDVDb3ZnVlFLWkFWY0I3?=
 =?utf-8?B?c3NwejV1eEw1TFkwWFNNSGxQNzFwWFlWeHJONXJ3TTh1dzVPZi9tWFNkWWpB?=
 =?utf-8?B?aXhrTFhML1o4M2JBRkJxQkozL05CY29GdEVtWFphQ0N5cTFRNVZJeUdDMjFl?=
 =?utf-8?B?dlJackFSRWRaUGphNU1kTnNzWHc2REdrNG9xWmdOWTZPL1E0KzhEZVRSYWlF?=
 =?utf-8?B?am1pK3FCdWQ5Z1FkVmR1aVFtTjkxQkpXOSs5ZW5VMjRGeXVBWUgxRk91ZlNa?=
 =?utf-8?B?NGMvRWllSkVFa0NhSDVDL2dGc2FhV2tYWmtVSnRaNWFMSGh4YTFxdTYyWkxM?=
 =?utf-8?B?THRKY0t0dG5UQTJYdjhNc3VkUFdEUmIyMHB5MVppSnZsOUNKTWxlV3pkMGoz?=
 =?utf-8?B?V0lDOXpiNTNSWVZUbW1ncTR5My8rSVllNTQzVTlNdFpQbWdDN0VlVVpVci82?=
 =?utf-8?B?b1dXTk1aT3pCV3lxL1dTbW55Qi81bE1sS1N0WXRqdDRPZ1pXYkNEZkNrbTdB?=
 =?utf-8?B?WnkzTE4yRU43STJoV1JPZ1B6ZzVYOWN0VkplMVY0bTVuSTkyQWlRN3Z3Q0cw?=
 =?utf-8?B?SWxvL3AybHpBd1pxV0JpamxpbVliSEhYdW14a0xEdXlZaUlvbENKMmlHWEhS?=
 =?utf-8?B?bXJMNWVpSm5VOE1KUU5IVTVVTng5STJRQ213ZDN0YlR2dHNiTzZnV1BrMWpH?=
 =?utf-8?B?OTVLdTBUYVY1dlpwSUluS29GSEZ3SDN5Z2hXMVNlaWkzNGg3MUdFMnYyMm4w?=
 =?utf-8?B?MlFpWW9yT3pXdGNWQVRsT0c2VjFyckJqSFJlaUFtSmpoRmprNGFUSnZ4aHlU?=
 =?utf-8?B?WTBFVXhDQzhSWngxYWt0TDkwV1VFanVIUEtNc2pCMkw3bXJ2cURQQVJ4VlRp?=
 =?utf-8?B?QmZpd0ZmU2VaaG9YVUFpUnVzNGE1U091RjBKemZleTloWk5ZVTQyNHFUV1pl?=
 =?utf-8?B?MDZDNDQwZlFJdCtNWUoxTXhnSkdjZHV2ZnVmZERnOHA1L2tlUzVGRUZFYkw2?=
 =?utf-8?B?ZTlYOERSSzQ3ak10d0Ftd0prMmhpTVVDNTlCQ04zSG81VUQzR1dERDhxMkZX?=
 =?utf-8?B?YUZRK3hTZ0xDTzFtSGJzalZqY0dGQVZ1ejlKN1NNRmVWNnlSY2Z3ejN5RDZ5?=
 =?utf-8?B?WFlhcVJlZ2RWYlBqYVJHR01kclNRZXI5Q25qaDhxaG1WeHdDQkt0V3pCWlJj?=
 =?utf-8?B?RjE0WlhyOFRkbS82cW5DWUpuOHBDYkp4N0swMWIyS3JLTlp0dmllVklJZm9C?=
 =?utf-8?B?bUxFczVRTFZQdGZUWGZxbkw1UnlpRWpFeWlZcFFwMS9wMFk5WC80UG5rRFI5?=
 =?utf-8?B?aUNYQmpPYzFqUWtjcjYrWHNzTldqZStxVWxwWElqUTJQcVhlM01Zc1NqVUpD?=
 =?utf-8?Q?OsSF96gBxPRAFtF73aA9vAphR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f39aacbf-41eb-4537-3448-08dbb9e37cf0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 14:11:30.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngHoUIlFaU0Ae9QUYzXBv/fEcY6TX9TgWHwek7hifqHV9UMpypyN0AiWydnk9sMw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8113
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.09.23 um 16:02 schrieb Thomas Hellström:
> [SNIP]
>>> Do you by "relocation" list refer to what gpuvm calls "evict" list 
>>> or something else? Like the relocaton/validation list that used to 
>>> be sent from user-space for non-VM_BIND vms?
>>
>> The BOs send into the kernel with each command submission on the 
>> classic IOCTLs.
>>
>>>
>>> The vm bos plus the external/shared bos bound to the VM (the 
>>> external list) are the bos being referenced by the current batch. So 
>>> the bos on the VM's external list are the ones being locked and 
>>> fenced and checked for eviction. If they weren't they could be 
>>> evicted before the current batch completes?
>>
>> That only applies to a certain use case, e.g. Vulkan or user mode 
>> queues.
>>
>> Multimedia APIs and especially OpenGL work differently, here only the 
>> BOs mentioned in the relocation list are guaranteed to not be evicted.
>>
>> This is intentional because those APIs tend to over allocate memory 
>> all the time, so for good performance you need to be able to evict 
>> BOs from the VM while other parts of the VM are currently in use.
>>
>> Without that especially OpenGL performance would be completely 
>> crippled at least on amdgpu.
>
> OK, I've always wondered how overcommiting a local VM would be handled 
> on VM_BIND, where we don't have the relocation list, at least not in 
> xe, so we have what you refer to as the user mode queues.
>
> I figure those APIs that suffer from overcommitting would maintain a 
> "current working set" in user-space and send changes as deltas to the 
> kernel as unbinds/binds. Or at least "can be unbound / can no longer 
> be unbound" advises.
>
> This may turn out interesting.

Essentially this is how Windows used to work till (I think) Windows 8.

Basically the kernel is responsible to figure out which BO to move 
in/out of VRAM for each submission an application does. And it is 
perfectly acceptable for an application to allocate 8GiB of VRAM when 
only 4GiB is physical available.

To be honest I think it's one of the worst things every invented, but we 
somehow have to support it for some use cases.

Christian.

>
> /Thomas

