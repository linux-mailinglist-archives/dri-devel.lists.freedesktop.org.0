Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2184387C74
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99EF6EBC4;
	Tue, 18 May 2021 15:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DA589708;
 Tue, 18 May 2021 15:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVSSdejtBUHZJ+yriMoVxZ23qNK/R832oQdr9l5C7I0JINeBOHLgG0lxCAO7UJu9RgxB54lSDEFts6jSdJ0PZyQUL9NV2tcmDyZPACyqP40JwKOwfe4op5povs462+3RlPHyQ8FX+jVuT8DZ6Gm5uim6JtyzujiCEH2RKpU3atUSDsKbZPVudOQgjaAWcujtr5WvRtfYr8xgRr8fByAm1Xlyo6c2ql+RnfWYcjbBJnEBRphSWFHB3s7hYFCcEkRnoQCVpbiM2tWcffFgTPCQKE9KSCAzVZx+3Qm5PMFMbM2m8HKTJYom2rBlgtljkGe1uiinMDBDTOvM9LBHO3jkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXH2E98nKlBLjkXoLathX9kmI5594TGDmrsWWaA/vxk=;
 b=ib7yTQv238z02niRSEZ6xXYHaYi7hFUm1mRTx0EHpm6sF9da3YHLaJt1yyc6jacqAjh7FdXSkmZQ2qMgJCnrVk4IjRsA0XIwsCZSZR5A9aKmqHYbQvRzt7XtQTVuT4T9xRFfvw2nTVeUL8P+EUkvoIsNZFRMIzKqRRxiT4gcKtxBYXAfsYaXUFFaclr2dyOQSpC8Xh7ebzMqy4w5NDGyUHC/N4GixEC51vPh6mq8zKPIUMWorMkfsm5kWxo1QatHZeEpNdlvFJCV+bKLb91GwE39XMUDDc8nfsyIBYDWNmnpR39rmf2lSPsmyQoU9kRmTer1zoSx4rCaJLs7oXpD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXH2E98nKlBLjkXoLathX9kmI5594TGDmrsWWaA/vxk=;
 b=DOM/jL7S6v+p8tV8FAK1AYZrH9vugwIB9yL4XfYxkTdvOaAj060gqE3msRhOaRWcRzDp+x/pZ9McWKJXteX+I4vNGW8qlOAIOSwLbs4z9qM74Y3bUI4oNohulw4d28NQwwltLWBmx8lsEg8alISq4OzSd1fXqAR0U7vwacXU7Wc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 15:28:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:28:16 +0000
Subject: Re: [PATCH v2 09/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-10-thomas.hellstrom@linux.intel.com>
 <c4cd4843-c3aa-1f01-fc73-bc9144fa478f@linux.intel.com>
 <60276369-dbfd-e0dc-548b-a9419ff4c7eb@amd.com>
 <471d8fd5-379f-e95a-4973-c50fadace7cb@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b909db91-5c61-4af5-135d-aa62d5e4b481@amd.com>
Date: Tue, 18 May 2021 17:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <471d8fd5-379f-e95a-4973-c50fadace7cb@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3b27:1830:9671:4cc9]
X-ClientProxiedBy: AM8P189CA0004.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9]
 (2a02:908:1252:fb60:3b27:1830:9671:4cc9) by
 AM8P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Tue, 18 May 2021 15:28:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f619036c-21f9-4c67-44a1-08d91a118e8b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4868:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4868456D6238BED1A2DD0034832C9@BL0PR12MB4868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uEZ6XkhHCiBdHHr1edtmd8xCac9z1WY90yDlqrrHnpq7z8EJ4qzqkp6VNLKYMt7aRlNQ82JyDp0Em1mEjtx3SVKVYbTzHha94qDT275m/OwxRquj+9PWeBcNUCEumtX/OyZI+6eKF/ZeTndeLzwC8OGi+3zpf81NL6I5e7QnRfadUUImwNBV4QrKSlM3WaKJlS70bH0YpqRYSFlYR3VPkjeb+ywmPDhpH1hGWDyT4GWj/mGVPnVWFTl1jUi0bbXTrEhYrY4f7hWq1St1iQf8kJg7kKD5yKkxhoSNQPlWvK9BNUz4aIh0F5xjn5Yg1JzbgcCEs74BQCXUoJRZlbNjBurJNvABdv2St4WqVgyq/9zSPzE0ckye9jRgeSSQGsIOOMdL5yYaGWtyuDMG6vy7I+uBhCGgeA0+EcdVS0/Mfy6oOfbfm9ozcH1qDE4YU+jOEKpg889Yuu5RZal0y0v1oy+8Jye1Fq9dqOPogWz3Qx/UmaZmye06ylNC1xoqkzR2v/RQYBQ6R7Xjs1qRpODEaKggqeLhHC930DcHuRBV8oq68nubQjz6CmSjeuzidZMa9EwPfbVvYUsKIUhMqjXPuWtcQrZpZHNDzTDQHvvJ9vEz1SMYIfLAS4Z2wvw+4viMflxg64ZB0IOJUrtZw4AqAfvEc3UkYa9p7jnGJlCYe6Oxp/rX27KJnY+MYDhzIqPO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(8676002)(52116002)(53546011)(83380400001)(6486002)(66574015)(86362001)(6666004)(31696002)(66556008)(478600001)(38100700002)(5660300002)(2616005)(2906002)(31686004)(16526019)(36756003)(316002)(8936002)(186003)(66476007)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Yy8zTjVUd0NXZUY0SG5VOWphK3ZES3FwZWJoUFRhK0hia0ZZYmppejRNUCtD?=
 =?utf-8?B?MVg4dTJQVmcwNWVmSHhoaVZhWG5pVTEvcktET1l0eFdMVVcwR2YybSswK1VV?=
 =?utf-8?B?TDNjNm5nT3M4cHVSU1Q2VHRKb09kdWhJaFppemR0aUdPVytSL0NhR3I0Kytw?=
 =?utf-8?B?YnpwZUw4Q2ZqVmFTYWZLa0FROXUwUGEwVWJ6WXAxdVdmaHAvVXdGdktaRGhi?=
 =?utf-8?B?YTlJWldkNzdmc1JIS3UyNGY4Q2dFdXVvNlFncWJOM1MyN05QREJ5L3ZLR1Bk?=
 =?utf-8?B?TXpwTXh5MGwrNk9HVmpoOXBEeVI3TWhEc3ZpMEt2SE1Sdm5OeklyVkZqR0VB?=
 =?utf-8?B?ajFxNmpHSlV2NEhjVTJOeUl3SHR4YnFCT3BhY1BWeDNPc2RHMWZoaUNHdkN5?=
 =?utf-8?B?STdiS2dRTTRRdG1ReVhvVjFlb2lUS2xZSzZ2cjdjVDJ2S3B6TUZCK0ROZDd3?=
 =?utf-8?B?V1VGbG8wbmNqZVFLY3RnZTgxZ3FCbUQxOEtnR3lkNU1qWDF4aW5oMFMxK2hm?=
 =?utf-8?B?UEdXd3hxQWZHY002YTJlUkU0bE1TNXNRZXNvUkg4RXpwT3hpSTdhQklJd29U?=
 =?utf-8?B?NE1LcDFqR1RsOHFVc1JmM092QnVPTExETVhvejhyV3lmSFdPYVVRcFVGQ1Z2?=
 =?utf-8?B?KzZraUNKcWdxYUpiclhvYWljZXBGQVp3aDhabEZ2VUNrdTR4dlQ0ZEllNUUw?=
 =?utf-8?B?Ui9DbFRnalhwRWZNOCtSaDBseW9MbmVUdWdJQWg4cndEcEZtMTZBUTFQMkNm?=
 =?utf-8?B?aXhHb1g1b2psSVVua21XWGR6OFd0VndsQ2pwOVdTOUxxa2FOZFY4MEx0VkRl?=
 =?utf-8?B?V2Nvdm1BSkJqWWh4UVZKaGpBalNvekxpQUJvZUxLNGJxYXRxUGM4NStJcFg1?=
 =?utf-8?B?RnJ2ZTRyZW5DZTBqZEN3dER1c1lITkNvSDk3WUN2S0JUMEN4c0I1SmhNRG81?=
 =?utf-8?B?N3d1ZVpONUVxRGN6cU1RTTk2aXdUbktzOTlCbWVVYjRqV20vbDNoZC92YURD?=
 =?utf-8?B?N2FhZHF2NE1Fb3JsWkREN0VzV3ZaMnpDS2pMQVFOcjg0TS9kbW40bmdmR2R2?=
 =?utf-8?B?NTE5ckJEYWVYTHRmZXhYV05jOHh4ZytIdUtGRVd5K0F6V0JwanpZUVFWQnJo?=
 =?utf-8?B?RDl2KzQzTG1sNG9kTUNibCtieW5Wdi9scnZXMlRjYjlteUJoQ2FsT1VUUi9x?=
 =?utf-8?B?OUx4b1R1R2hvNFhSSmwxVlN2elRxcllkUFAxOFg3RWRrVnQrUWFrUWY2VEUw?=
 =?utf-8?B?WVpIc1ZBcjVISHdveS9sZGR0eXlnRlhvR0QyWXJ6SHE5dEhvazRXN3VvSEll?=
 =?utf-8?B?YkxRbTJpQVAybUZaNDUxNlljeC9IQ0VCVzhjN1VYWlhsNkdNcCs2RDdyYW9M?=
 =?utf-8?B?RkRPNWJOR2lTOFdrRTB2WEdYU0czU1hoTWw4WTNDTnFuQTYvTmMyMXRVOW56?=
 =?utf-8?B?WWw3c01BVUg3c0t1bGUxSHpzNktkbzBYelEzdWJRYWQrQkZEcm81am01bmhN?=
 =?utf-8?B?d2RlUXNZaExxU0JEbVUya21OUTVET0kxUk5tbjZSR0FmaWhDQUZvUS81SG10?=
 =?utf-8?B?T2U3UjllZWxQbzFBNUhRYTlVdEFMNGY2VHVkSmN2dnBWZWdFdHlPTFdDaUdC?=
 =?utf-8?B?Wk02UW9CSDdoSVl4OXkzcjN4cVZXOVJqeFFiQzZrQVFHalBRSXZQZ2dxemk3?=
 =?utf-8?B?MHc2T1hmUUp2bnQwMlV2TVBVMUZMUFpqSTU2ZlluSXFtU3YzTFZOWnErMGkw?=
 =?utf-8?B?ZTc5YVNEcW85TmQ4Y0R5cVJCQ2pOMW14cHFGeFdhbGwvc2lJOXkrMDF6eThV?=
 =?utf-8?B?QnNtWFFOTHlUa0U5dUNiYWMzNXJFQkZBcUlDeTZweGJTU3lsb2JhQ2hmU2cv?=
 =?utf-8?Q?LOM47IcusSG+P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f619036c-21f9-4c67-44a1-08d91a118e8b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:28:16.0072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAJ728jCa6CGhe5Bg6ub/3u8K2MwGlxi2YhSBmz8Sc/c0lRRPCAWMNyUXempxPxk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
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

Am 18.05.21 um 17:20 schrieb Thomas Hellström:
>
> On 5/18/21 5:18 PM, Christian König wrote:
>>
>>
>> Am 18.05.21 um 17:15 schrieb Thomas Hellström:
>>>
>>> On 5/18/21 10:26 AM, Thomas Hellström wrote:
>>>> We are calling the eviction_valuable driver callback at eviction 
>>>> time to
>>>> determine whether we actually can evict a buffer object.
>>>> The upcoming i915 TTM backend needs the same functionality for 
>>>> swapout,
>>>> and that might actually be beneficial to other drivers as well.
>>>>
>>>> Add an eviction_valuable call also in the swapout path. Try to keep 
>>>> the
>>>> current behaviour for all drivers by returning true if the buffer 
>>>> object
>>>> is already in the TTM_PL_SYSTEM placement. We change behaviour for the
>>>> case where a buffer object is in a TT backed placement when swapped 
>>>> out,
>>>> in which case the drivers normal eviction_valuable path is run.
>>>>
>>>> Finally export ttm_tt_unpopulate() and don't swap out bos
>>>> that are not populated. This allows a driver to purge a bo at
>>>> swapout time if its content is no longer valuable rather than to
>>>> have TTM swap the contents out.
>>>>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>
>>> Christian,
>>>
>>> Here we have a ttm_tt_unpopulate() export as well at the end. I 
>>> figure you will push back on that one. What we really need is a 
>>> functionality to just drop the bo contents and end up in system 
>>> memory unpopulated. Should I perhaps add a utility function to do 
>>> that instead? like ttm_bo_purge()?
>>
>> We already have that. Just call ttm_bo_validate() without any place 
>> to put the buffer.
>>
>> See how ttm_bo_pipeline_gutting() is used.
>>
>> Christian.
>
> OK, so is that reentrant from the move() or swap_notify() callback.

That sounds like a design bug to me since you should never need to do this.

When you want to destroy the backing store of a buffer during eviction 
you should just do this by returning an empty placement from the 
evict_flags callback.

It is TTMs job to deal with the buffer placement and drivers are no 
longer allowed to mess with that.

Regards,
Christian.

>
> /Thomas
>
>
>
>>
>>>
>>> Thanks,
>>>
>>> Thomas
>>>
>>>
>>

