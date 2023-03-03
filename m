Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C86A98DA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 14:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA1310E5CE;
	Fri,  3 Mar 2023 13:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA05010E039;
 Fri,  3 Mar 2023 13:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2usaDF1SSVVSnRoNAoVtrqdduWp9GrjSdakvSjcoSsJxm+HgbO8u5jTT1AuS5CimJZUhFGQLu4oaMbBh5KOhAbVihFf+eaEBkO1zwqY565m57uQIWqsLb/zzuSwvGYYFACcEZ3cppWqsiixcDqS+tC5XJaU0wdbGAyq66ICLByaIyPfibTHLi49Ry1zBJXQJ5opYO1qzcVCJcHcwr2oNGL/8whbIRWAfPqd5i2CdnsXmaAFs2aLFz2/QfCUBqb0x+F+YI07YcUWuUmNOIJnj5L07h4WlUdr4A1ODhQduQ5aFIPfAfPkrhfRgf7GjXpj3wiuE7sohqmOryDE8+lXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsS74yjKiZ6ZMtgmtT1Duk+mdt9RXZdP/EZxaH8BgQQ=;
 b=OkuVGSJecayL32AMVV6e8HU4MvxkYyWx4oFJdPeKg57hXiZHiVaeWqr27huP6uIc6zUo08NSPeTjvGNDFXHffEaCFREHAJNu8dSWMdXHz0kRm8nOkDgAm5G7khevkd803FucnZ9IWehO4JoUOtaqjMO6/Wc7LgryYSCWGrpmSiCcGtbJGRj0XX23ROy9bE5EAI5t2kwWc632taptqLISERi4g/L0TT+fqyv0uAhodukecwVSOHF5YWfa7d3o0oC/jq8odyyDyJHisaMcDuB9SwHuj7pofA94c4lHuSukBevW5YrLTJebmUAHXanTSww+GK2KngfF16jAhUBJVjMsrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsS74yjKiZ6ZMtgmtT1Duk+mdt9RXZdP/EZxaH8BgQQ=;
 b=R7MsAvSWXTwfMJk52JJHBtA949xEx+DWaezNSrTD/vTWHdOlG4Aru+2aEpeMIa6u6/H0/Zh+KnrSk9VodrVFMwB4vLEdrttDWNSAOPE2KVF4MyRmpgBSV4U7olD0wbyLOV2lA+ngbwf1+otxdLYEPTGmwnuApD6GyofOxUQ+mVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH8PR12MB6818.namprd12.prod.outlook.com (2603:10b6:510:1c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Fri, 3 Mar
 2023 13:45:35 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e43d:5bd2:7a85:d0cf]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::e43d:5bd2:7a85:d0cf%4]) with mapi id 15.20.6156.018; Fri, 3 Mar 2023
 13:45:35 +0000
Message-ID: <5a98d48e-6121-06d3-523d-6e5b8e8ff2b7@amd.com>
Date: Fri, 3 Mar 2023 08:45:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/9] drm: execution context for GEM buffers v3
Content-Language: en-CA
To: Danilo Krummrich <dakr@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-2-christian.koenig@amd.com>
 <873a0702-56be-6277-c86f-8bb73a4805fd@redhat.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <873a0702-56be-6277-c86f-8bb73a4805fd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::8) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH8PR12MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: b16cf025-72ee-4b93-c5f6-08db1bed90b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fzvQwgAr9K8JvFxk93f9TVdETZ9OhajM7ZfwLKS2Kv95VUxr+nn2rKCi+bcN0+7BbcMsJ3NfjVoN6DvubBBEM1TSQG7DK6OCEQpMNfhT66kSdR2JI41S91yy0Pt90xKAEYL25jqyAfDU7jiG7JPJrhXfwsJjr538Ej60z8sFO7BX4eJNSpqlGtN+ItKkJv3c2R20SM+1318MRAc0wf6ON/vjeIRsHpO6TxTgMKUE+QXIOGAQqAP1qzDX91Oc04efuAddl4CS3eRgEy9eveMtVNxd+xXfxPh7P2OwqbvykRCmQ1U6bdzvVLKtvpUYfsUF+15RUR1WiJW4ru6jUWJEkn3GYioERbFyxTdOwBy4aSPG9bZ2Y8+oK8Ktgfc+P0uwXEGH/ABcj4HHiSREZwTotXVL9OwiAvDsNy+5l9UZ9XqdQMxtrl7qZ7EfU0deebTJazxMohrZtgBCguWZ7qaNuUFEhVmo6yLKVcozDvrDKU5xprtfEo04OEOYoOXUxSqtQItHV5yciC9SqbHxgHN1NZpEeoB//1Tn/KoJJgC8i0J/wgd49jDAOEv7TS06RE5oovxENGn+eBKD0vW5Et58/gEO8HmJMM0z6bqKEECTuryjXlHvmgHgt2pkNKGnQ+RfTAe8aF2Y7wyoNWUr+Ft9TdFjvKCmUc5YqNdNzlyay/444vhyJiM7Rzv39FyRIosUHCzv5S/ZqAXQCcQ7de7MYPFuoggDxqt2ziR5vKyCWTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199018)(38100700002)(31696002)(66946007)(5660300002)(4326008)(86362001)(44832011)(66556008)(8676002)(8936002)(41300700001)(66476007)(36756003)(2906002)(4744005)(2616005)(6512007)(26005)(53546011)(6506007)(186003)(66574015)(55236004)(83380400001)(110136005)(6486002)(316002)(478600001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHo2UzFEWTdudVJxTmc5T0l6ZU83cnpyRDg4eGtMQUErbXRPdndvQ1lwWlJW?=
 =?utf-8?B?M1M5RlExbjFQdzNpVnNCQUpTTWQ5c25HRzRjNllGaVFhUlNvOUI4bzdvTFlD?=
 =?utf-8?B?Ym9xNW96eUtqNTdtcDIwUE1JdVA1ZTh3V01KOVpwUVNvbXJScmd2aHZVM3ll?=
 =?utf-8?B?OGltL2FqMm9Td3BrYWwwOTBqMDUwZTlMbXlWTGJpOWZJd2NoN0tjOTRSRWFF?=
 =?utf-8?B?ZVp5RlBuWk93TTlpcW5JeFo0cjU5TE9IeitOTDQ3b21FeW5HdHFmTlJqQVQw?=
 =?utf-8?B?bENwVVF4b25KdlBlSnMrcnhvZXIxcmYzYXhEWXFNWVpzZTJLTENyL3NobWdJ?=
 =?utf-8?B?YllYRTR2SGxyeGJrWUdjWUpRVXFlVnZwbFFLbWhBbEVEVUk4UGRNVnNnYzJ3?=
 =?utf-8?B?THFDQmdpbjRBNzhaZndINHJtbURIQnpqT0YxWFhFTjZ4M3JZTGRiaGJwMUJa?=
 =?utf-8?B?NkhVck8vMFNCNGx5SFRCV2ZWSmQ4MWttWEY4cU1CNGRROEJMT0dPYUF5ZHdl?=
 =?utf-8?B?bS9Ec2pBVTR0VHNwdEtMc2xNRGFCSUNzWkNXclowWUVCb05EKytVZ0JYQjdJ?=
 =?utf-8?B?WmU1RGpEelUyTC9PU2h6S3BmRWw3c3J0SUpaMFdQUFVmVExxTlRQZGRsencz?=
 =?utf-8?B?YXYxY1ZIS2I3Y0dqeWdsK3dMbEZYdmd1Qk8xU1Y5cjY5VDZMRnY4RzhTSCt6?=
 =?utf-8?B?NG1xMCt1dXVkdUlMOXdKZnYrUHQ5Qkl6LzRxREdHWUhTUTh0dFpNUCt4d0hk?=
 =?utf-8?B?cjhkakk2UnF2M0xsUy9ZZi94a3dzeHNWamNPUFNkOTl6elFOK3NmaEQ1ZUdr?=
 =?utf-8?B?c2M4cEp4cFJpSmN3QWZJOGZsOEoyTkF3bFk4S2RmRnZvdnpjUjNCalB5SjRE?=
 =?utf-8?B?ckdtOWt1RFRMS3MwWHZwRTVhUGZjN25MalU4M00rbTNKQWJXR3VTWENsZCtX?=
 =?utf-8?B?M0hydGpjRTRVK0lnUmFic04yT2t5T1RZQzRsTWNidXBMblNjNk4rYlpHVnU4?=
 =?utf-8?B?Rnd2Qy8va2piSFFFZDdHTmJtajcyalVoKzdwVWl0Y29OaU5UWkw5clRSOHJo?=
 =?utf-8?B?SzdRcFozMlExRHlxaWVCaUozcVV0N3BRVFBTaE5DQXEraFZGQ201THJEcEh1?=
 =?utf-8?B?TDVGQ3J6SUpxNHc3bUo5WkhJOEx0MTdsckNQMUorS01LYTNzZHZVaWp2NUQv?=
 =?utf-8?B?L2V6dEV2WmhTOEZDam83aUw1aHhEc1NRSEo2YmZYM3piclE1UUYrRWxVOCt0?=
 =?utf-8?B?b0ErY1V2U2k5R01SamorZXU0b3Q1bFd0N0J6SGEvMm1zS3IwbnE1WEk4Tk5t?=
 =?utf-8?B?Q0UwVFBuTVMvSjV6bFBHWCs0bnkzZTRiODBSd2c1MjRWaGdaNHBXa1dRRlpN?=
 =?utf-8?B?ckNIL0FXQXdGczFIeGFnZjVueVFYRUlhUStnSkVVZDM5eUYvbEE1bGdRV0s4?=
 =?utf-8?B?eFIxNGU0Ui9iZ0dSQzFNalR1OE1yUkZUeHp0c1ltV2Z0emNTNXVzQU9SemxC?=
 =?utf-8?B?L01iSjlrV2ZDRXl6RXNyamlIeUVjdFc4RWVIaC93Nm9xbGJ3WkFUK285TzAw?=
 =?utf-8?B?cXBVallxMlFzcG9DMFBpU2tsdk1qSVR4Nzd4ZktYY01ETk9DYVZpdUhFQW9M?=
 =?utf-8?B?cVRFRUkzM1VyRitXNU9FN0NhYURzbnJjWXZQSGdPQVpVSy9GajNzeFMxWU9B?=
 =?utf-8?B?OEVqZjdVQUxwVkpBR0UwRUNia0NaSUREV0krcEhUcTU5K1J2N2JEQnNyQ1Bz?=
 =?utf-8?B?c0lyei9rektESHBsZDN0K0c5N3B0SHg4WjgzbFQ2MDdnV3cyUm5laFVsSUpP?=
 =?utf-8?B?b0NRRnZFSDV1Sy9UWi9qWU8rTEIxTHU2RE92azdiWElENCtWQVA5aW5MS1dJ?=
 =?utf-8?B?a3M4aFVoVGo0NjNZblE1bUt2V1ltY3JUVTRHeXZDNlZyTzFlTko2RnpsV3lt?=
 =?utf-8?B?bW9Od2xmZ3A2SThSRzViTU1JK3lzb3JrS1FMNnhER0l6QUQwdWJpUnRET2ZK?=
 =?utf-8?B?YkcrTEZYWW51eWJMR0JlQUVyWGF2OXgrYWg1Zlc3N0FzZnRuZ0VENVZWZ2ZI?=
 =?utf-8?B?Ulc4UWxoRDBnVk5kN0JxSmtxZkc4eE9OZHdWTTNqMm1naXFSbUhkdkQweVlZ?=
 =?utf-8?Q?+pTCH5TVs+KLN/I+Rv0AOY9ca?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16cf025-72ee-4b93-c5f6-08db1bed90b1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 13:45:35.3544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lkmfi429XH9fLSJ7JIyZBTCoSLfH3EIg7r49tMxc7CLujkh9vqcI0dhZoXnho2yp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6818
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-02-28 14:13, Danilo Krummrich wrote:
> On 2/28/23 09:33, Christian König wrote:
>> This adds the infrastructure for an execution context for GEM buffers
>> which is similar to the existinc TTMs execbuf util and intended to replace
> 
> "existing"
> 
>> it in the long term.
>>
>> The basic functionality is that we abstracts the necessary loop to lock
>> many different GEM buffers with automated deadlock and duplicate handling.
>>
>> v2: drop xarray and use dynamic resized array instead, the locking
>>      overhead is unecessary and measureable.
> 
> "unecessary", "measurable"

"unnecessary".
-- 
Regards,
Luben

