Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0384C0D7C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 08:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C468410EEC4;
	Wed, 23 Feb 2022 07:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B578E10EEBA;
 Wed, 23 Feb 2022 07:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLtRnBfWXPzzmCXtTNOBJDCJesefOr8Z71CbG34MdDo7oMaKisP94mryVkC96PZQCNJ9QrR2RJntuDl43V1Ozsz+1Gaj8MGVK/Pf81qA6WI+IVmIgYyaBIqiWlTzMIL2xV/k2+HN2vlqsi8M+uA+93SEM3ZJl/4J5crimj4dOA4tAS+iIO+VYdscR1S3pkE+km3w3bhIUPjIlTwZzx2jZnE0hiNjOvavxuPghU401p3KyCau0fc+G+SD82MOy6jfWYC2HUd+iZVvb/1TXG8BfCIi0feKSwoECAQbl93vcEWly9zMt4sewLIP67o5FOBcuF6i23q0h9GIZJqEQ9YaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ort204wsZJ+ymPQlOktkvJUuJ/zqvUQrAaexJmC9Gak=;
 b=EZaGM2cb5jKiA1iAihftx7HhZJQ/AUzpl7IjCOC+M/wn9vAFz2RPJ4ytoA9h/4zAAfvZPbXdKsksVquecGyH4cd/QCfDgbNmlEPoDqGWSRvbQo6i/3yX4/LCr7eCuhrxMKmE+lBIVORURgArx+xZjU73jATylqE8sZH5mKKKVW2LuBLxj5BdFNaaC6Qhdr6ySDSyJTLYs/nCeJSe2XkhLhtXmSx4bZjXMvApN+yHQ0goDpeC2FDk5S4u8UkOXTxEaCbwgEDdAy9Ssxotqa4MaG6ovctfN6gM8ZkgBD/d2Ff3KLy37nKgNLUFotfq/YeYjk7rFvaEhi6KqbecEnCktw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ort204wsZJ+ymPQlOktkvJUuJ/zqvUQrAaexJmC9Gak=;
 b=Y6FZkbJJbCtGOtKDYM/5wxO49fj8KPE/ijeq7b2pMOB2oWaih10JgrDasVhisvzwi2F4pIajjsNl06NOnw6Mw6IMD21qLlp+R7CqwVPEe1jZk/NQxUQPraB/Nu+pUbcvO6Aws+tGK5bi3DsSBgVrWy8CaXufnjyn+grLVeW2D3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4648.namprd12.prod.outlook.com (2603:10b6:610:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Wed, 23 Feb
 2022 07:42:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.022; Wed, 23 Feb 2022
 07:42:00 +0000
Message-ID: <aa5ea6d6-aaaf-f3ee-03ff-8397dfc4f43d@amd.com>
Date: Wed, 23 Feb 2022 08:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
Content-Language: en-US
To: "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily" <Emily.Deng@amd.com>,
 "Chen, Horace" <Horace.Chen@amd.com>,
 Alex Deucher <Alexander.Deucher@amd.com>
References: <20220221095705.5290-1-Jiawei.Gu@amd.com>
 <202202212330.nxcvFWEe-lkp@intel.com>
 <d7314af9-449c-f6ac-95d9-168d27990814@amd.com>
 <CH0PR12MB51567C166A9C3D54FD31EB71F83C9@CH0PR12MB5156.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CH0PR12MB51567C166A9C3D54FD31EB71F83C9@CH0PR12MB5156.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0115.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f78bb26-96ca-4e8e-2791-08d9f69ffa03
X-MS-TrafficTypeDiagnostic: CH2PR12MB4648:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB46489BB271A4DB418E393C91833C9@CH2PR12MB4648.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E7zcBMQxrW3pJKi/EUkTIRBG2K2ZrbRkXxuddlvPLKVqxCMprggo9rAHHgQssCQnD4pw4kKjaMQghjMqoCyyLYsGrWsCsfYrG/x4RfCUJVhPHqvaVnNxRkbPS2gnkFEa0XdJvR1WDACDwCfi3XHREj/gsD58CSEVR5OBoOlRZucW/bY17XQyFghOyFsrrKhQCxM/W95Rftl0XdCn9S3V53Z/OzZkPD599c6UTZly6k46SeVkTsgicVOWrSmYBm3RwzFxQmL+HStbmhU+Drj0tO9r3zkdaV85OOMsWsPTQBy3XVwduXs2IDu5Fs10MkKj8aidKDS4PjrvrhmB7VeEenIoWBpc2dEd56ud+usiMGPPVTQdl1oUVXAAqcTsKccDgfiwHgp/aOTR+sivazaT+RxyuCSpndlBzdmgfRPj6S8XNHnboGyB1sofxqB/Ibw3t8CY3BLbDPvnKUr0sZ7XcTaTe3OKlsAmhpUKELsovcPwrzh8CKWPomrKQgHcS8nu7UoMFQqEgzVPpn3eRVGGEDtO8uqah1Xb4DzT5dT7mnd7JHIn2naMaEyzAJ0mWpYDF+UyiXgMeI2ZWeyKrr8UBgWkaRZ+HI67dA6WlL7hWDLYgzoKlB3XJNDKX6Wgz9CsoeUQoZki7MFFSt063vH5HEk069d9m777r1wh2YLIUHhY3JbRCwyyGJyCFLqDuKSCKyCgY2mBzTyxOqmnJNlnixsjy+MzX5UBeC4PywHcJzT7Laj/57rRE4WrIgB/75cdnina6Dq2LPNh8ktpD3auhj4AUsxcOg2/+mt5cDq339vN/+qOw1q11ekKb0ZClDTqMgZWD4L3NpFYb485KPqsoLT1xTDT4JLmrOC3fZXtxvTeOZF+yAorQMF4/9oUkJuD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(66476007)(186003)(26005)(31696002)(66946007)(66556008)(86362001)(38100700002)(5660300002)(921005)(8676002)(4326008)(4001150100001)(30864003)(83380400001)(508600001)(8936002)(966005)(6666004)(31686004)(6636002)(316002)(6486002)(110136005)(45080400002)(6512007)(6506007)(36756003)(53546011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHhYU2UyQjB3eC9Nck9IZzVtUG1TNW5BOFA1NGdTWFV1SmtVN2NGTWF2bjhz?=
 =?utf-8?B?T0J1WE1qUTVKVGJHek1KM1JJcG9rODk2S2dqbHRGUVBBK1MveU5VRm5NTVQx?=
 =?utf-8?B?ejZnK3FuaWFJVkdxMFpRQ05aMWxtRFAxU21Wc2tuZ3FoRjFGcmcwOXphQjRu?=
 =?utf-8?B?allkNXNiY1F5d2NpWjhjYmwwQndqN0I3UzNpWGg3emtyY2NGa2tzVGhxdmtn?=
 =?utf-8?B?QWx5bDBqaHp5MWJXZXc0RWZOYktxY2MrUit4WVBSODBURzZ3RUJnMi9tSWVV?=
 =?utf-8?B?bFg5Z1o3Vnk3eWRhK3Q0M2NBM01tTTRiVG8xZ0paVHRJQUtUZ2RSU2hWc0U4?=
 =?utf-8?B?VjhKMDQ0QjJsNVZzR3lnd09zS3VtYjZrWVZNaGFDRW1WVnR1TDd3MXE2TlBa?=
 =?utf-8?B?VE9UV1NkWGFYOWlBZHJremhadjlvc1VpeXdKV2VoUzNNanNzUUZ2dk9LcEUr?=
 =?utf-8?B?S1J2T0VPZHdjQ0V3Z3B1RCt2MnFLWlVYaXNod09ES3M3aDlRdlBySnI4QktI?=
 =?utf-8?B?Tk85a0tLTVZVUHNKUmpGYVVQeTJzcWZQMk1PekdweFowUVM3YmR3ZWh5ZUJZ?=
 =?utf-8?B?ZWxPT1JzTEtyYVpSV0tSOTlFMVhzbVk4OGU3akJFakF3YTgveUpzMmZUU2ZD?=
 =?utf-8?B?T0twRzRETDRDMEkzNzJtQm5wZzlyWGkxVk13UFRNQUw0cXVYM0RwRDZXaEZz?=
 =?utf-8?B?S3QyRjBkUFlENWlzbVhURTNza0w2dEp2MzhRTGFKS2o0NTJwaGRrZmlyUXUy?=
 =?utf-8?B?Sm84RXlsdjFYUUdvejYySG1TVHRGUXNsSkF3K0xIV0JQUUpzRmRMczA2V3dO?=
 =?utf-8?B?em1GcXBzcU1oUmd0VnU0cmlvUms2MFFpcDFQek9NV2MxRVNSdVZkL3VzbDYv?=
 =?utf-8?B?cldoRWZtWEhTa0FiYlEyMFQzYjF5K0txU25xUW9yMGdNVjYyVHcrUVhOTmZj?=
 =?utf-8?B?eWdGRUFCb252L0NCN3JxMXF3Z3ZkTUcrN0k3K0ZwczdZZ3dVMnJWZW03QWl5?=
 =?utf-8?B?bzcwT2xMLzljdUFZSU9tWWV1alR6RXBUZldCNjZKL0IxSVorUFl6enU3L2lV?=
 =?utf-8?B?MWtGd1RtTUpVM0hCOGNzZVVVd3lQN2RrS2tLb0xHL2JMQjVRdk9CQWJDZkZG?=
 =?utf-8?B?S1dZMVgweXFrL1pqSUxFcno2QTF4V01ENlRtbmNEY002OFdNY3F1dk5VdW0w?=
 =?utf-8?B?eERpRTN4U1NQd21jMVdnQU95RVNrSGtGdmRpYng5R2VYbDFJZ0M0R3JOS09P?=
 =?utf-8?B?UlBpVSt4UDBlZFNDWjR3M3RUeDQzMlZYaWhZcWRuU1hZQ3crUDRzWm9sV2U0?=
 =?utf-8?B?a0NaMndDVzZ1UnM2dFB5TzBCS2xRTXhGZFpmUUtnRHcrTGdvVHZKQytROGF3?=
 =?utf-8?B?aW9RN0hWZ0Y3V28zLzJNcFFOMHMzU2ZWVkUwSS9WRzZ2TVQ1enpBSWRBRFFj?=
 =?utf-8?B?TUU3ZnpPeDJkcDcxQk1OTHV6QThoWkFkYzFXWm4xWHJGZklIYWlIbUphbitl?=
 =?utf-8?B?QnlSTitYZUJWVXBaMDlOTjNVa1dQS3k3b1pIak9hWitQK2FOdDhFaEJuMGt0?=
 =?utf-8?B?RVZHZHpRYmRwdHpVeC96SXJkQi9CV2VVOWxIcXEvV2pYVUR5TDFZY3JwMmZM?=
 =?utf-8?B?WnNFdS81ZlIrT2Fpd0pRcEg2U1lRbkpBd09yeW9NdXlUSmE2MVJpamNuaVdk?=
 =?utf-8?B?RitlS1JpcktpV1F0aGU5ZWpIL2xVbmZBM3RlYWVnZGhmckRmZ0xEaXVXY3ZD?=
 =?utf-8?B?RlRqTDlYT1d1VkZFakhldC9sNVd1OUZPbGRLRFhlNFFxK1BvV210LzVFbjIw?=
 =?utf-8?B?ckNjeTBLeFVwNmJsV003Y1kvYy9aSkhxQ3ZqbXRwTHN3dGRWYTgySnFPQ1A3?=
 =?utf-8?B?ZGt3M0UxbWwwa1VHd2RvZG9YRVgyNmExTHhMY3ZkZWtZR1dxT0hHQ1h0M2Ro?=
 =?utf-8?B?MlFTVEpxSXg3cHY0dERKTy9IWVgxNWJMcUROaHV5WU9IT1ZRb0J5SlBpS2Fr?=
 =?utf-8?B?cHRSOHZKc1Q4M2JjUXVFSVJsdXRSOW9ZaXNZMGpyRTZRT2dydnhIQnVCZHY4?=
 =?utf-8?B?VVlLNDRwQVp0dTltSmJpODErYVA3bFEzaDlhNkp4WlNrM0hKdXNJZ3ByTkJ6?=
 =?utf-8?Q?UdfI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f78bb26-96ca-4e8e-2791-08d9f69ffa03
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 07:42:00.7035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EImvWQ8dYLAjrNi4J4XjVCi0Ts6t28xegv2wl9SJUV0RM3ViczRrkG3COnRLerZb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4648
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
Cc: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Well that's bad. This should not be pushed to amd-staging-drm-next at all.

This patch is touching multiple drivers and therefore needs to go 
upstream through drm-misc-next.

Alex can you drop that one before you send out a pull request? I'm going 
to cherry-pick it over to drm-misc-next.

Thanks,
Christian.

Am 23.02.22 um 08:15 schrieb Gu, JiaWei (Will):
> [AMD Official Use Only]
>
> Hi Christian,
>
> I noticed that and it has been fixed with the latest patch.
> And I pushed it to amd-staging-drm-next already.
>
> Best regards,
> Jiawei
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Wednesday, February 23, 2022 3:12 PM
> To: kernel test robot <lkp@intel.com>; Gu, JiaWei (Will) <JiaWei.Gu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Chen, Horace <Horace.Chen@amd.com>
> Cc: kbuild-all@lists.01.org
> Subject: Re: [PATCH] drm/sched: Add device pointer to drm_gpu_scheduler
>
> Hi Jiawei,
>
>
> can you take a look at this? The kernel build robots screaming that this breaks the V3D build. Probably just a typo or missing include.
>
> I would rather like to push this sooner than later.
>
> Thanks,
> Christian.
>
> Am 21.02.22 um 16:51 schrieb kernel test robot:
>> Hi Jiawei,
>>
>> Thank you for the patch! Yet something to improve:
>>
>> [auto build test ERROR on drm/drm-next] [also build test ERROR on
>> drm-intel/for-linux-next drm-exynos/exynos-drm-next
>> tegra-drm/drm/tegra/for-next v5.17-rc5 next-20220217] [cannot apply to
>> drm-tip/drm-tip] [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit-
>> scm.com%2Fdocs%2Fgit-format-patch&amp;data=04%7C01%7CChristian.Koenig%
>> 40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82
>> d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
>> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp
>> ;sdata=8Kj1h9%2BCR%2B8nDeUXW%2B%2FQOFbiavK5oHons0mRPyHhq%2F0%3D&amp;re
>> served=0]
>>
>> url:    https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FJiawei-Gu%2Fdrm-sched-Add-device-pointer-to-drm_gpu_scheduler%2F20220221-175818&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=KMrQ%2FsAoUV768eWdTF1FdmXo44kDPjWKnwoi4rvVnqs%3D&amp;reserved=0
>> base:   git://anongit.freedesktop.org/drm/drm drm-next
>> config: ia64-allmodconfig
>> (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdow
>> nload.01.org%2F0day-ci%2Farchive%2F20220221%2F202202212330.nxcvFWEe-lk
>> p%40intel.com%2Fconfig&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7
>> C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7
>> C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD
>> AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=tLVb
>> OkxAyxSD%2BVUHUmS6BT5RfOzO4q3sotVZ2YHGV9o%3D&amp;reserved=0)
>> compiler: ia64-linux-gcc (GCC) 11.2.0
>> reproduce (this is a W=1 build):
>>           wget https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=8QLSr7JTjK87bBGwgOLxU6AU4bCeHoWX2zyx7SGYL7M%3D&amp;reserved=0 -O ~/bin/make.cross
>>           chmod +x ~/bin/make.cross
>>           # https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F9fdafca855faca0a3b8f213f024985c4112fa0bb&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=W9HKTScDzhoA1DClCigH2QQUgcIzLStBS%2Bx9ieYPbK4%3D&amp;reserved=0
>>           git remote add linux-review https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=FNJyugHVXenGmYqwgoK9kzKKjC3WGMia%2BNUduLNb0Pc%3D&amp;reserved=0
>>           git fetch --no-tags linux-review Jiawei-Gu/drm-sched-Add-device-pointer-to-drm_gpu_scheduler/20220221-175818
>>           git checkout 9fdafca855faca0a3b8f213f024985c4112fa0bb
>>           # save the config file to linux build tree
>>           mkdir build_dir
>>           COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0
>> make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/gpu/drm/msm/
>> drivers/gpu/drm/v3d/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>      drivers/gpu/drm/msm/msm_ringbuffer.c: In function 'msm_ringbuffer_new':
>>>> drivers/gpu/drm/msm/msm_ringbuffer.c:90:15: error: too few arguments to function 'drm_sched_init'
>>         90 |         ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>>            |               ^~~~~~~~~~~~~~
>>      In file included from drivers/gpu/drm/msm/msm_ringbuffer.h:10,
>>                       from drivers/gpu/drm/msm/msm_ringbuffer.c:7:
>>      include/drm/gpu_scheduler.h:463:5: note: declared here
>>        463 | int drm_sched_init(struct drm_gpu_scheduler *sched,
>>            |     ^~~~~~~~~~~~~~
>> --
>>      In file included from drivers/gpu/drm/v3d/v3d_sched.c:23:
>>      drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_sched_init':
>>>> drivers/gpu/drm/v3d/v3d_drv.h:158:26: error: implicit declaration of
>>>> function 'to_platform_device'
>>>> [-Werror=implicit-function-declaration]
>>        158 | #define v3d_to_pdev(v3d) to_platform_device((v3d)->drm.dev)
>>            |                          ^~~~~~~~~~~~~~~~~~
>>      drivers/gpu/drm/v3d/v3d_sched.c:394:49: note: in expansion of macro 'v3d_to_pdev'
>>        394 |                              NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
>>            |                                                 ^~~~~~~~~~~
>>>> drivers/gpu/drm/v3d/v3d_sched.c:394:65: error: invalid type argument
>>>> of '->' (have 'int')
>>        394 |                              NULL, "v3d_bin", &(v3d_to_pdev(v3d)->dev));
>>            |                                                                 ^~
>>      drivers/gpu/drm/v3d/v3d_sched.c:404:68: error: invalid type argument of '->' (have 'int')
>>        404 |                              NULL, "v3d_render", &(v3d_to_pdev(v3d)->dev));
>>            |                                                                    ^~
>>      drivers/gpu/drm/v3d/v3d_sched.c:416:65: error: invalid type argument of '->' (have 'int')
>>        416 |                              NULL, "v3d_tfu", &(v3d_to_pdev(v3d)->dev));
>>            |                                                                 ^~
>>      drivers/gpu/drm/v3d/v3d_sched.c:429:73: error: invalid type argument of '->' (have 'int')
>>        429 |                                      NULL, "v3d_csd", &(v3d_to_pdev(v3d)->dev));
>>            |                                                                         ^~
>>      drivers/gpu/drm/v3d/v3d_sched.c:441:81: error: invalid type argument of '->' (have 'int')
>>        441 |                                      NULL, "v3d_cache_clean", &(v3d_to_pdev(v3d)->dev));
>>            |                                                                                 ^~
>>      cc1: some warnings being treated as errors
>>
>>
>> vim +/drm_sched_init +90 drivers/gpu/drm/msm/msm_ringbuffer.c
>>
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   47
>> f97decac5f4c2d Jordan Crouse 2017-10-20   48  struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
>> f97decac5f4c2d Jordan Crouse 2017-10-20   49  		void *memptrs, uint64_t memptrs_iova)
>> 7198e6b03155f6 Rob Clark     2013-07-19   50  {
>> 7198e6b03155f6 Rob Clark     2013-07-19   51  	struct msm_ringbuffer *ring;
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   52  	long sched_timeout;
>> f97decac5f4c2d Jordan Crouse 2017-10-20   53  	char name[32];
>> 7198e6b03155f6 Rob Clark     2013-07-19   54  	int ret;
>> 7198e6b03155f6 Rob Clark     2013-07-19   55
>> f97decac5f4c2d Jordan Crouse 2017-10-20   56  	/* We assume everwhere that MSM_GPU_RINGBUFFER_SZ is a power of 2 */
>> f97decac5f4c2d Jordan Crouse 2017-10-20   57  	BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
>> 7198e6b03155f6 Rob Clark     2013-07-19   58
>> 7198e6b03155f6 Rob Clark     2013-07-19   59  	ring = kzalloc(sizeof(*ring), GFP_KERNEL);
>> 7198e6b03155f6 Rob Clark     2013-07-19   60  	if (!ring) {
>> 7198e6b03155f6 Rob Clark     2013-07-19   61  		ret = -ENOMEM;
>> 7198e6b03155f6 Rob Clark     2013-07-19   62  		goto fail;
>> 7198e6b03155f6 Rob Clark     2013-07-19   63  	}
>> 7198e6b03155f6 Rob Clark     2013-07-19   64
>> 7198e6b03155f6 Rob Clark     2013-07-19   65  	ring->gpu = gpu;
>> f97decac5f4c2d Jordan Crouse 2017-10-20   66  	ring->id = id;
>> 84c6127580c1ce Jordan Crouse 2018-11-07   67
>> f97decac5f4c2d Jordan Crouse 2017-10-20   68  	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
>> 604234f33658cd Jordan Crouse 2020-09-03   69  		check_apriv(gpu, MSM_BO_WC | MSM_BO_GPU_READONLY),
>> 604234f33658cd Jordan Crouse 2020-09-03   70  		gpu->aspace, &ring->bo, &ring->iova);
>> 8223286d62e296 Jordan Crouse 2017-07-27   71
>> 69a834c28fb514 Rob Clark     2016-05-24   72  	if (IS_ERR(ring->start)) {
>> 69a834c28fb514 Rob Clark     2016-05-24   73  		ret = PTR_ERR(ring->start);
>> 375f9a63a66bae Rob Clark     2021-07-27   74  		ring->start = NULL;
>> 69a834c28fb514 Rob Clark     2016-05-24   75  		goto fail;
>> 69a834c28fb514 Rob Clark     2016-05-24   76  	}
>> 0815d7749a6852 Jordan Crouse 2018-11-07   77
>> 0815d7749a6852 Jordan Crouse 2018-11-07   78  	msm_gem_object_set_name(ring->bo, "ring%d", id);
>> 0815d7749a6852 Jordan Crouse 2018-11-07   79
>> f97decac5f4c2d Jordan Crouse 2017-10-20   80  	ring->end   = ring->start + (MSM_GPU_RINGBUFFER_SZ >> 2);
>> 4c7085a5d581a5 Jordan Crouse 2017-10-20   81  	ring->next  = ring->start;
>> 7198e6b03155f6 Rob Clark     2013-07-19   82  	ring->cur   = ring->start;
>> 7198e6b03155f6 Rob Clark     2013-07-19   83
>> f97decac5f4c2d Jordan Crouse 2017-10-20   84  	ring->memptrs = memptrs;
>> f97decac5f4c2d Jordan Crouse 2017-10-20   85  	ring->memptrs_iova = memptrs_iova;
>> f97decac5f4c2d Jordan Crouse 2017-10-20   86
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   87  	 /* currently managing hangcheck ourselves: */
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   88  	sched_timeout = MAX_SCHEDULE_TIMEOUT;
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   89
>> 1d8a5ca436ee4a Rob Clark     2021-07-27  @90  	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   91  			num_hw_submissions, 0, sched_timeout,
>> f1b7996551a40a Dave Airlie   2021-07-30   92  			NULL, NULL, to_msm_bo(ring->bo)->name);
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   93  	if (ret) {
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   94  		goto fail;
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   95  	}
>> 1d8a5ca436ee4a Rob Clark     2021-07-27   96
>> f97decac5f4c2d Jordan Crouse 2017-10-20   97  	INIT_LIST_HEAD(&ring->submits);
>> 77d205290aa944 Rob Clark     2020-10-23   98  	spin_lock_init(&ring->submit_lock);
>> 77c406038e830a Rob Clark     2020-10-23   99  	spin_lock_init(&ring->preempt_lock);
>> f97decac5f4c2d Jordan Crouse 2017-10-20  100
>> f97decac5f4c2d Jordan Crouse 2017-10-20  101  	snprintf(name, sizeof(name), "gpu-ring-%d", ring->id);
>> f97decac5f4c2d Jordan Crouse 2017-10-20  102
>> da3d378dec8634 Rob Clark     2021-07-26  103  	ring->fctx = msm_fence_context_alloc(gpu->dev, &ring->memptrs->fence, name);
>> 7198e6b03155f6 Rob Clark     2013-07-19  104
>> 7198e6b03155f6 Rob Clark     2013-07-19  105  	return ring;
>> 7198e6b03155f6 Rob Clark     2013-07-19  106
>> 7198e6b03155f6 Rob Clark     2013-07-19  107  fail:
>> 7198e6b03155f6 Rob Clark     2013-07-19  108  	msm_ringbuffer_destroy(ring);
>> 7198e6b03155f6 Rob Clark     2013-07-19  109  	return ERR_PTR(ret);
>> 7198e6b03155f6 Rob Clark     2013-07-19  110  }
>> 7198e6b03155f6 Rob Clark     2013-07-19  111
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flist
>> s.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7
>> C01%7CChristian.Koenig%40amd.com%7C33c94d7ecffe465c671d08d9f5522651%7C
>> 3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637810555454343325%7CUnknow
>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC
>> JXVCI6Mn0%3D%7C3000&amp;sdata=JTbXE%2Fv85yMSdX1zm4Em1aUZ32N29bf3FrllBk
>> r%2BsMQ%3D&amp;reserved=0

