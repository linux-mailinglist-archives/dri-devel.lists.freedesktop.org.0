Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBFE39F2CB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A4F6EB8C;
	Tue,  8 Jun 2021 09:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2054.outbound.protection.outlook.com [40.107.96.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232F36EB8C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4DjhA5N/bKIKIUMSdih4mU7TXDr5hMPMOcZFWKVZITgyY7A3tDOXVDAOfrvi5Xc4t3WhwR/Nk5alyejOVqKMVC3wWYZPs6uP4PqVY871A6jcGPEVXlDF4ANqOWFn0itAb+noRDuWpGuEW77gRZOeordCiOMlV1vWUh+LbtXvNsH72vd20MmNqsvsQTBO7XPG25rltauyzQFsOI6UHClPBscRT7q5b5eh+d4QD0aDi5IEGhW0p28xzfLuBYxoSJd+T1f7jNa0AJLyTdIJ6oesp/CzLOyduDvK9bc+dVN2rArNvYorGI6Ji9Dz6bRbkErWTqbi2Y9oQK6s0JYz2wznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOFlPxrdWnHHFDtcBlHBgygBIgj8/CsVZqDU8bpS7Q4=;
 b=RHeiG/MD94w+4CfPNoQCgBAy8AjoHU4kRasu6RzuM+IXV1ZwcKDQt0/ycQ1IBqDs3JHd244VCbXAEG7mLvdOzRQgfDr8GBqbwIz8oET1jRDpsUNBx1UMgbVTf7DlvaTglpCfpCpY2SDc+PFVPT+3iK2kYaXVkYurwm0YpPbiolaUfucn5GXvCz5x7R7H6Vbpx445mV1mRHSqlaiZoF8uYCproOU9jl6NctPpxr2T2QscyPqELdpu4DTHN3YPK9Taq70/275CQF5pG16LNNMGmM7lrV3guD4NdgsCV8tFbnz/8KhyzP54ecpkIY2GW09IJrLF4tFDXjTPxEKm43n8pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOFlPxrdWnHHFDtcBlHBgygBIgj8/CsVZqDU8bpS7Q4=;
 b=IsmzY8tVcvzSh62FtHnvGtBL9iPd4NW36TJyBS5tDZNkz9H/1ZitD8hWmeYJKNoKAwnbU71j2/jw35qOCkzVHj+uvwO216wSRavYOA3HKfJ3fApOSkm8X1xDly8C+t4VA2ercxE6/IBk4MeT1ZJqDYI8xfjTBMgQP/FR7+mJwbQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Tue, 8 Jun
 2021 09:48:34 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 09:48:34 +0000
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
 <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
 <6d316dfe-0378-8284-1f8e-29caf5619e34@gmail.com>
 <a08db95b-7c75-d998-7443-73d809121e47@shipmail.org>
 <aa1d9fea-d425-608d-6696-96e437acd08c@gmail.com>
 <59e3ccb8-5c6a-e44b-41d7-9d15dc3c63f5@shipmail.org>
 <adb183d0-fdcb-5b78-a814-76683b6200ff@gmail.com>
 <552ba90e-0136-1008-2f0d-5501006b007f@amd.com>
 <df1b9679-1780-3905-4b25-9e73c1ca1320@amd.com>
 <500fba95-7ad6-d842-fb0e-9cee7f852cc1@gmail.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <8ddfa993-cb58-d73d-5f04-b9dc64f19a75@amd.com>
Date: Tue, 8 Jun 2021 11:48:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <500fba95-7ad6-d842-fb0e-9cee7f852cc1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f2b:6400:c449:165a:413d:7e84]
X-ClientProxiedBy: PR3P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::10) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2b:6400:c449:165a:413d:7e84]
 (2003:c5:8f2b:6400:c449:165a:413d:7e84) by
 PR3P189CA0005.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Tue, 8 Jun 2021 09:48:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24cfe13f-7228-4e3e-3229-08d92a629522
X-MS-TrafficTypeDiagnostic: DM4PR12MB5182:
X-Microsoft-Antispam-PRVS: <DM4PR12MB51829C3832C75156262C795C8B379@DM4PR12MB5182.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVaZvuhNpJ+lAOhMzifPBhRBMdHYLG1gkvrA8KGh7ci8a8ahfaWzXlgCr1kjwRdypIPLCuWUvd3dIZflvcCpJ2JOn+AmS+qvlYbXPADmp2nS2WgJC79DdjsxJlItKQR2iyFFg/s216dTN8ycBgDZzS3tOfXY1Ng9WP+V67J9D5Q2l3aqXCSV6BttBvFSX655BZfGquR52ZrdnCNcYDVHO0oz/yVSsBP1q7X5NNmWTsu3F5AUhJ/i//G2fnGRI4HJWKQ4WNLVw+LVGeEQduA4HdKhEzWnM+No5ZXtjCkqSV/NwDpoaviTM045Aauk8nQwp3mW4jWRUyVubmcSH6sqreXwPdb8sRmc5Li8d4lcjOtzzJUL0Of8OFhAoJvJF9DwkU4aJAKhZFVDh0YDdlzJffuPL4bYOR1nP5QNYF9QhWixi3vzkJmQ2cSz0g9Cn+Ny0hwcBfeQVmMI1kk0dWmwJROLy89lJ0IeXfz61xxfbvP8lFnDmztA2Vl0nNqIZuWA2SougnEwCKDWj8easpoT5H/77Kj4AIrLsFa4b0kckcszpP/pyybfIzWQZcjNdRW3hcl9rucdeogTOiPET5Co6Ze4P5IPUBN7iqm0Ip4VSrR8EZRW+BnruYqZbtgWlQtweQLpXPeOPPjLOA9EyxRMwNeWDKJH3Pf0RD6k3STysTeXgornUkKnDMPHWLqhllRI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(2616005)(316002)(2906002)(110136005)(31696002)(5660300002)(6486002)(66556008)(53546011)(4744005)(16526019)(66476007)(66946007)(66574015)(52116002)(83380400001)(478600001)(31686004)(86362001)(36756003)(8676002)(8936002)(38100700002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGwxL2pHbUZObXhqbi9KMFpBc0M0ODA3VUZuQy8yclFKSlJMTFRITHhQaW9q?=
 =?utf-8?B?TGkzejd6K1ViKy9JMkVzOGcydXc0RldpWERRdUxBWFBobE1CZit2ampyWHlV?=
 =?utf-8?B?NjRIU2pKZ05aUWhHU2VjcUpaajFGb2ZOSDFWaUxvZ2FJNlZQd1FrZU9wNWxo?=
 =?utf-8?B?S1VNallldEE2WUZxTTYyd05xemcwaUZNU2lZTmxtUFQ3SW04S05yK2RvMGVX?=
 =?utf-8?B?RFRRWmFYeDN6M3dkTkdXWkhOaHhFdGhPdTBFbEZ6eXpna1NmYkJiTVNLcysy?=
 =?utf-8?B?VFRUTmgxRWMzcDgrakVYWEd0eW5Ea0FFalRJVS9uVGpveFV4dWpzZElDYklM?=
 =?utf-8?B?SVFsdTQrVDFWYlFhTlZFY3AzNDl1bllXVmpZQWFVc1Y5RVg3SXA4UjJSZGVI?=
 =?utf-8?B?QnZmcWh5M1M1NHlZbXY5M0hNSW9KN29hRGxVLzZpSHJxRXpIb3Arb1J6ZDVx?=
 =?utf-8?B?UnRRVXVNTGpSUm1NdndHSm5reUViNWxLb3pxa2xCTU9JWm1ZaXNoVG8rVmVt?=
 =?utf-8?B?b1Z1SU42RnZEcVJCZFVETVlNTlZTSUV0T1kvL25wZ0x5ZmdINW9wdmgzTEtQ?=
 =?utf-8?B?RTNoTTBHYjV0b1hnWFlFaW9pWklzQ1hVUndhd1pKOHhSU3BOQU1IN3NOcTFD?=
 =?utf-8?B?ZURlS0g1ei8waDJWQW4vYzJGMTM4WkdNYlRjbVkzZlpwK3YvNDNncmxYa1Y5?=
 =?utf-8?B?NFlUV25MZWZDREsrQnVTelczWFE0aXNhMXg1TVMxZlBYaGFCT0psODNBc2pY?=
 =?utf-8?B?TGEvM1VSMnZnZGJoT1Z5ZUNueDIvcVovU2VQdjdrNFNMYUdoUjZwTTNjM3V1?=
 =?utf-8?B?V3FUc2ErbVlZZmQwUGkyWkc4SVgzWkhLUHlaYkl3MTVRK3NRV3BpMUx6RVUx?=
 =?utf-8?B?b2U5dmY1SDNyaHU4MGptaHYyZ1d3dmlDYndFTDdHNm5OSjQrTUo4L2FScG5w?=
 =?utf-8?B?SytWSHc2T1IvWGl2N3pEM3FFQ3NYL3pwSEhDWjEwUGJTRnFJTklPYnlqcE9i?=
 =?utf-8?B?N1NTRjRLZHNreCtKcEkvMmdqTEVzdGZzVWVYdW40b3NaaGpsdHZ5MENoVnV5?=
 =?utf-8?B?MFFlZ2lvb1NHUW5FaFpPaDR5WnBXOCs4U1Y1Tkx3bEQxT3kreU96MG9MRC9D?=
 =?utf-8?B?YzkxTFZxelB2TlAyZ0htT2daNzAySHVLYWNmQzIrWm5raTNXWjljdVVEYXk2?=
 =?utf-8?B?ZDZJRExvdUFxVlFYTGRmSXRmN3pBdm8yWVhLV3A4azBid1kzdjBXR0d4VCtY?=
 =?utf-8?B?ai9aMitQVjAwd0pjaGNmU1ByM0hqbVMrelVPVUxrQUZOSldsZmx5MUUzNkh2?=
 =?utf-8?B?UEZiSUEyUkVsM1ZGMDhsK0pPTE1qQmZ5NXhvT29yNytVcW0xZEFqeEVnd2NV?=
 =?utf-8?B?VVdlRXU2Qk9CbXcwUWZ3N1lMYit1OXVyYjNuSVM5V25RK25RQlhIb1M2Z3dQ?=
 =?utf-8?B?WlRoM3M5bFMxYTV6WEVyMDhaQTQwQmN5dUVSYXdKYjR5ZmNuTXZ2SmVVc0tq?=
 =?utf-8?B?eldzYTZicU9XS0NxblV2RzZwZzYyRHEvVkdDY0QyT0ZjSURFazhUa25vNERz?=
 =?utf-8?B?MndGb0VOaExQWnY5NzhoaUZ3bllxWkJoSy90UWlkaG8wT1ZuS2RFT2xYMnlT?=
 =?utf-8?B?anRPVXh4a3FGalVGOGRHalZNRDJEY2I0TEdVQTA3MG14bkoxd3hPSWpLblZV?=
 =?utf-8?B?UzVqbi9mOXdYT2FIald6WUhrSjh3RW4vRlFwWnlyZ3g4WkVpb3Q5VzAzNG5L?=
 =?utf-8?B?WUlSRDFaNndtMkYyUEZHclQ3NWtUZmhMTnN1RVRQRHZRUzFBMUxyZk5mTWNn?=
 =?utf-8?B?QWE1WVAwNGoybGZYMk1UbnVoQ3lqR09XMWhjdUJIQ0xTajdUSkFNZHBUSVdp?=
 =?utf-8?Q?J8eRWqJfI7ydV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cfe13f-7228-4e3e-3229-08d92a629522
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 09:48:34.7859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6Q04Iqgf4L0Ie5IWqIVqnZswfgVONmud6YeWrbesQD4orfFrcjAnut1PnNivQBXXjBJbC8FvSIbbHlwLygtbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5182
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


On 6/8/2021 11:42 AM, Christian König wrote:
>
>
> Am 08.06.21 um 11:40 schrieb Das, Nirmoy:
>>
>> On 6/8/2021 11:38 AM, Das, Nirmoy wrote:
>>>
>>> On 6/8/2021 9:21 AM, Christian König wrote:
>>>>
>>>>
>>>> Am 08.06.21 um 09:17 schrieb Thomas Hellström (Intel):
>>>>> [SNIP]
>>>>>> Do you have the log to double check?
>>>>>
>>>>> Unfortunately not, but IIRC it was directly from vmw_move().
>>>>
>>>> Nirmoy do you still have your vmwgfx test environment?
>>>
>>>
>>> Yes!
>>
>>
>> I will test this series on my vmwgfx setup.
>
> Since it is already pushed (and we fixed a bunch of its fallout) can 
> you please test drm-misc-next instead?


Sure!


Nirmoy

>
> Thanks,
> Christian.
>
>>
>>>
>>>
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>>>
>>>>> /Thomas
>>>>>
>>>>>
>>>>
>
