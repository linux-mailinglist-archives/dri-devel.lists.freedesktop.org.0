Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B23EDD6A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 20:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD2CB89A75;
	Mon, 16 Aug 2021 18:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2071.outbound.protection.outlook.com [40.107.212.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B8C898A4;
 Mon, 16 Aug 2021 18:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRWdCX+hhx4ATY+egc8kGhxw5BWYoJE9fpGCFRyn1JHaBLm9ArrK35j8EAlkT9RIKf4AfKLprOoTp5eF63A17lrobMPBdPleVbYrZwtuG5w40ZvrNfTTrGZUU2VBCSkRTGin1em3jAVhrWZ13nTSGyIX9kgJCzAv0/uv6yZgM2TjgWhJbT7VZ10j+d7Fw0mAcqfSNZc2UYb7jtWluerw4mDC43ag5NreLMDn7iEkQZFquOw6YcdH5/p9qW5b2CsLI/nJS1CrZPyFoDI94SrRQyaSUQet4XMHPbbpOOyqB9MptGWhTsGF5LkZpj9799OLOa0iuMtRnsPkDiUKrNqqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0eUZtkJIyOQSPmaxd3D82mw127aokNaEj826uuELeo=;
 b=QwbvArBIQPmQ8ZDO7HOw7xcr5HwcqCvDaab+ENKsZ4v9jhpLfvglGt9i8niVQIZPLGR+rozPwYogwcULHYG9RtzKN0hgrLYVaz2tHB1eeaGJfaDoM7C8owDm/QMFGivj0HKOKC/pN5bMbcCKDhfhhTNZ8T6iH6JbzKD393ZY3yyLX4jUYr3XWrgnVyON/C33N8fc5Hy1w9J9S7bHMxa2VGMAXlL1Ox63V7aITwn2cLhdlDquhTCaGScmxPhNOUarviJXX3vvzSUv02m7AZvj2qonh1RCmxypWND8deVnDO3EVyZ7yeE3tBH0toHMXAbi5nAwNcoKbXoGeOok6vB8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0eUZtkJIyOQSPmaxd3D82mw127aokNaEj826uuELeo=;
 b=v8FdXQBlg6Am/LGagNzvcpRLT0zu+OE1yKCqxyTh7Z08ocEGR35Q/iwpiDVCAs2bLSRQF3gK1wub38/ROxOxXrZq8Z/pza/YW8XEBMLho5HqPa/Yt5vdjbYz8N3AeMqP+XQedtwurDL6Krfs8UVy31iQzOspoMF+Zj0yW1xN0XM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5276.namprd12.prod.outlook.com (2603:10b6:408:101::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 18:56:42 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::b891:a906:28f0:fdb%4]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 18:56:42 +0000
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, jglisse@redhat.com
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com> <20210815153713.GA32384@lst.de>
 <387d5f85-3d15-9a9e-2382-6ce3c14bc6d5@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <94dbd8f2-6c7e-cddc-6792-00f12942937c@amd.com>
Date: Mon, 16 Aug 2021 14:56:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <387d5f85-3d15-9a9e-2382-6ce3c14bc6d5@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.186.47.3) by
 YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 18:56:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff88cf73-6009-4664-5779-08d960e795d4
X-MS-TrafficTypeDiagnostic: BN9PR12MB5276:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5276719098EAE82443C0218792FD9@BN9PR12MB5276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C2DdMkfRwYTs45jaNPGzvDNk4ZA8EBRgQdOjEHEccDfUDIt9dIextBAhupOydgePvrbrUWcza9I7iFrRc+JJu7xSbE1j3YScdZ3CJlnzd+X0GYOsFkJ9jQ6eM4BQChn1MgDSWptTKHdgB1MKW1ojNSoLwP7qje/e3NNw7GLSSVmzNItYxBBG01AqnBaxktWDGj55Y7l8N0Q0ZXBciq5f5N8IGKYEkwEPGZLlES0j/SKrROfQzVuCfIEKxKsqpmphRBccR3F9NFgEB0vTRwdf+YB08b3mMBIN7RWJcxUUOOIjZp1xbDiz9Qb3IvWuaRGmTTSmXofTFVh1jNmB/G9E1r5QBkW8cGQIH2ZNW81Rt2O7XemyokYrzv3cWyA1H6E2pkNxpBhjxgvdSZEhrj79Xc+eNnmVOMIRXPnNtytXktZkmdpu3Mq8VZ9cujCDhfnNPOn4aFrbONb8o2txiwDm4vQNFcgRfGd9GbHLq4thOE1LfsnVsVPOKwW+dDld6CeySe5jb38CxV1JPBxChehwhcwIn9jsga6pIs4akNgTV6cJ0+q2iZpnyBf3MEJyOldYMF9YX9kQN/V+B1BS/burFk8OhAbNo5jnL5xHS7bMqX329PeedwVdLIUG52MrszX5D6DTOCli7eyRV8MRhztEbSn+WW49qpx5UHhOBEx0bW/1GdgXvUD4Kch4VzJJaPKaAACda4UiEvB9bNtwyNwn5ZG/563qnDCWqu4IHzi7EPhAfaohW/+BbC9wCXzD1wYUJjfF5EzypievKUOuqEtYUNXUAvkm0Xxf4WQtg7kxc4i1iRaB3SBGoiDEwuyP17MMYx70xzAW23HwJaO7wxFzKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(31686004)(6636002)(186003)(16576012)(7416002)(26005)(2616005)(2906002)(5660300002)(316002)(4326008)(966005)(956004)(66946007)(38100700002)(8676002)(31696002)(44832011)(66556008)(66476007)(6486002)(53546011)(8936002)(86362001)(110136005)(36756003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJSZWRXYlF5R1J0M3g1SHhGSUJ2MFlUV2x4Y2FYclpHOXdMZFE5dC9EMDE1?=
 =?utf-8?B?SnNEMndpRHY0T2tsMGd1UjJoeEgveURZQW9oREExV0dtMDJIRnNZVUprcVAr?=
 =?utf-8?B?TnJpWWhrZFpNRTd6NWIwU3paTDJwVFI1bXBMOWhXYWxyM0NxQzRtY2l4K0Vi?=
 =?utf-8?B?bTZTd0FuU3pmOFpzMHlmWWpYTEVDSE5CWmJrU0djOWErNHlWR1cvTVhXK3l6?=
 =?utf-8?B?eEdlM05CM3pSaE9SN0pOSk94cmo4Sld6V0RXckVTVUZwWERMS0Y4eVdjZ2E0?=
 =?utf-8?B?MkVVNzRGazdnYkdkQWZTdUdjR0ZGakhHbTZRdVYwc0NYMnpReG1hWk1vTGli?=
 =?utf-8?B?RHp6Q3BiRDRYOEt3RkZUL1hhZ1lBVEJ1ejJEQjZLUjdaeWVnNHBiNm9QdGh2?=
 =?utf-8?B?TVBXRDZuck9keVQrQlpUbFJyRkxWNzdDR2I2dlpxaHdBbnpXTGRtc3VnRldI?=
 =?utf-8?B?T3NydWhSYVErVFNTNmZFTlNxRkNVRUZIdFBTTGVCMXFJQ0JOejhMcmZQUXpt?=
 =?utf-8?B?dzQzemNiQU10OFZKb0plVHMvc2lpYTVzZ3A5TzZMajJTNGdwSDRqSFpLSHdZ?=
 =?utf-8?B?QnlKU3BXUjZJakI0ZFhzcTFtRVhuQXJSa3E1Q0FxOVI2K2hHUTN4Nms5NlBt?=
 =?utf-8?B?OTVxS2czQXZielBIbTFUNWxHNnlFOWhMT0JzY0Fna0lOWWJBdWJVMnFrZUpT?=
 =?utf-8?B?T3dLYlp2SzEyeU55cWw2M05MTXpSZnkrZFZMczdYNU1VQkEwSGVDUkNxc0dz?=
 =?utf-8?B?Q1pFMHlJMzRwWTZmQWR4bDVXbWNHVkNtTmlZWTlwT3lGS0d1YzdSVUpvRHUy?=
 =?utf-8?B?YXljTVBNQ2pBdFhuNXNYTUNTZklBVFdwRklWMGFWTHlZNkNHNldiYjFWekpT?=
 =?utf-8?B?ZC8xaUFQaGZCeTdDSzh5bFFhejJWMFo0dVF3VEg5WXh2OHZKY2tyZlZFRnU1?=
 =?utf-8?B?b0pIOTZoNmgyZkdlUm1uR09uYVhZOXd4eUNueDVveWlsMjRIN0sveDVab29X?=
 =?utf-8?B?MjJEUjYzQmlUcUNGaTk0L0ZzREYwNExIS2dvaDNpakVMNitRTkEzd2k5YU8w?=
 =?utf-8?B?QXZBRW1qUHBacHEySFhUaGx0VXRoSEYwZmxkS1JPd1p0a3VVOXc1bVd0djNF?=
 =?utf-8?B?YTdyTDBFb0FXRWd0KytZTXVEL1Z5RnZ1Wmt5c3ZkOGpLUXNyZWM4OWk2Uzcy?=
 =?utf-8?B?SUJzRFpFNW8weDduYWpkeFdzWXRCQlN5UGphYnpGQlh6bjB2UXdQTGROUS84?=
 =?utf-8?B?WVlSNmdtVE84Rlp4ZVUvdGJDSk5FUmt6Q2YyS05JZU83Y0YyeXpBZmR4b0VU?=
 =?utf-8?B?TldXeEJva0k1UjdlWnhGNmVBREN0ZkdqaDNZUVAwSjNlamYrZkZjY0lRUGlB?=
 =?utf-8?B?eVFwRkgyOWZMK0RSSlBsVjJPS2NpTkpqUmFoUlY2QnlOVmpKUDBFZUtwWVA5?=
 =?utf-8?B?bkFZQzhwRGtYY2hYemY0UFAvUUwxODdHWERPMXNKYjFsQlNDOStWSm1oS0w0?=
 =?utf-8?B?QjZRd2VIb2p0cFpxWitDMlcrUk01QklqaVNiTkhpNUtKNmtTMGpzL1krTWN6?=
 =?utf-8?B?N2piTzAxR05LaEs1ZTBHMU14SEc3eGlhbGFFRGkwTjRjVXMzU245ditKZjJD?=
 =?utf-8?B?amwxYjZnc3pkbkJsSzU3em95UG1INWFpRDFzSzZ0bnFWRmR4Z2htcGYxYVFJ?=
 =?utf-8?B?UXk5M05HdmVFaXlhaXdDa25qUGFCalFEMGhBdFlMc0ZIUEoxYmdiWUU0Q0VF?=
 =?utf-8?Q?pP3nlpo8LhFn7p/xAielhvJoRB9Et4vRbTtiW+F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff88cf73-6009-4664-5779-08d960e795d4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 18:56:41.8661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CGx12wcMhlQV7xS0DBhLvUYIXujVYe4dhglQ+3oLi9pL/io0gDAtuFOmRZRiCvmJ0FqIjpUFS2p4KIYfMaX7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5276
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

Am 2021-08-15 um 4:40 p.m. schrieb John Hubbard:
> On 8/15/21 8:37 AM, Christoph Hellwig wrote:
>>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>>> index 8ae31622deef..d48a1f0889d1 100644
>>> --- a/include/linux/mm.h
>>> +++ b/include/linux/mm.h
>>> @@ -1218,7 +1218,7 @@ __maybe_unused struct page
>>> *try_grab_compound_head(struct page *page, int refs,
>>>   static inline __must_check bool try_get_page(struct page *page)
>>>   {
>>>       page = compound_head(page);
>>> -    if (WARN_ON_ONCE(page_ref_count(page) <= 0))
>>> +    if (WARN_ON_ONCE(page_ref_count(page) <
>>> (int)!is_zone_device_page(page)))
>>
>> Please avoid the overly long line.  In fact I'd be tempted to just not
>> bother here and keep the old, more lose check.  Especially given that
>> John has a patch ready that removes try_get_page entirely.
>>
>
> Yes. Andrew has accepted it into mmotm.
>
> Ralph's patch here was written well before my cleanup that removed
> try_grab_page() [1]. But now that we're here, if you drop this hunk then
> it will make merging easier, I think.
>
>
> [1]
> https://lore.kernel.org/r/20210813044133.1536842-4-jhubbard@nvidia.com

Hi John,

Thanks for the pointer. We'll drop this hunk and add a statement to our
patch description to highlight the dependency on your patch.

Regards,
  Felix


>
> thanks,
> -- 
> John Hubbard
> NVIDIA
>
