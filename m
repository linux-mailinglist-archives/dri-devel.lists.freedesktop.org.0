Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 435596EE210
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 14:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C564E10E72E;
	Tue, 25 Apr 2023 12:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3302810E283;
 Tue, 25 Apr 2023 12:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bx3uaz9W7ib4eVN+++NN/pCfsh/YhfGYGysGSM+oPi7rbni/tn/EECa2hawI6A/HXdR8707ZncUdIlkOty7+N0j7rZJJjwtlbXxllBjIWUEWtHMPbVB5r78DF0IhXOHkg3Q17jd2ixdS3c8w8nIdnKnIvM5AtX5l+vb+e6FFhGC77bZtpwN24XOEWKZ3jrJrUTLpYuf9zm6XXGLwHQeNn2MXKEr8AmPaGYUu9p+LUFoiychIaI/HmTJ0qOwAZFM2ce+YkoPQK4gLcXrXq1lEbuxRnclD10DahH00jhf15LSKTdn8sg65NVQTvP7bgd4XPtsX9Xar6jtzEM4aJTbaJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TULRMnsDe4zmcnPHuxE/KCUvGynNYpFx7UcrElzGJuI=;
 b=KcS/jc+1z+DaE7YM97YhGgUIeUqeZrJvIp7XpAz0CdZUFsl2GLAjc6BAo8MLJ56VTjjUjYSCJs7JUSaBpbkc+jC/mzEWvcHnINLkn9+ueXNFbpfaeuwwOJWTfR1FBU+O00ksbJjd34P3K0Pc811s3ToQy9bVK+o1Iys+S0l58z3PZZwNcf1gZqXyXubyzcb8k1fLSEbAtMQiGflRhfM4DZt1pOqPCZjOoyI47u7Pu0mLgHsOast9l2weQOCzGFWhYR7FvSwwm6MQKRiq6S4zQiNhJVcsf+CVVf3quY/ZEvRgQpV+/xYLjPmBzaEWQD1lRHpWEDist072UJ0/U61etQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TULRMnsDe4zmcnPHuxE/KCUvGynNYpFx7UcrElzGJuI=;
 b=0gwooElM3Rpi9fgj5QVzjltzOqpIZwNxAkJG7Hn2Go7pALm9U/GDOVBQouFc8eAXuAabeDsQK4B92xFlqc09CsNKuu9msa+lHf5332Szxkc8lAC6B+7OYXTs6FGw1xVeU/OD2JaF7pFYG6gurFDLKQ7BLUQE7eWHio753r7f9t0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 12:44:29 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:44:29 +0000
Message-ID: <f5bf590a-5d3f-03f2-531c-057cf8760000@amd.com>
Date: Tue, 25 Apr 2023 14:44:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
 <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
 <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
 <19406ec5-79d6-e9e6-fbdd-eb2f4a872fc4@amd.com>
 <5262c73e-e77c-91f7-e49e-a9c3571e2cc9@mailbox.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <5262c73e-e77c-91f7-e49e-a9c3571e2cc9@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: d4a7f389-3d24-4c57-2ea9-08db458acf4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0LvenWA4cyBCx+OX6mr1+4yYy7+dkuspsIHfGP9Mq6oY4d97ZLLFM5RkLwjhOevugqKL+pJpmUrvGnsi1Z1RfYj89DckvCLC5UHb8bsHpeLlDaGX9x1SJlquv7aMuOr2f1zUM7lVRT85IPOh4ov1MBx4bkwX6upSjoAzde41ZWnXuGQ+D09ez/uvRrPv0orLZqLrvdOZfbTWIqP18LV14d4UYPmz/2qpFhJSVfvcFl/31Zbq4iyjYP2cFfz+dm9S0+z9G3SWQormP0ebr9x2ODAfvr941JT0aW48TgkSlZcf9APR4gj1n3aD6oWl4Wuf+0Fke5uo5g8yWppyBZzT9TdiGMGQigYQq6jnnSuzLCqjoAPudQkb4+S6VpIlN1L7YelVkmdHXQsl2YPnhPvz014Xqsw7CXKaXcdmtz4ktWAbxsGuQYuVqod3DqiR4m1slmnCAAe0mlZVK87dFWf73q1EeeIHwS587odgclYkY53Unmsys3ZkFDN/ppFNvwzMDjqOZ4vIH/4Ac1sdK+r6RnVmhoria0qBNCRnj0AEO4c6hbRd6gz5rx5WNpT0VSgZjuK4vU1izZnnWrV+5BOpjBGC/ZCr7d56t+dVImBalE6rHKfzQwPz5IaYt33yaOfMCyhnp+6UIWwiTrv6XHvokg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(451199021)(2906002)(66476007)(66556008)(66946007)(4326008)(316002)(5660300002)(8936002)(8676002)(41300700001)(36756003)(31696002)(86362001)(186003)(6512007)(53546011)(38100700002)(478600001)(6666004)(6486002)(66574015)(83380400001)(31686004)(2616005)(6506007)(110136005)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlBMbk1PNFZVRFZwU3N5ZkNyTFk0eHB0WWVBMWtoT3BCZGVGdWtWUFp6eU85?=
 =?utf-8?B?anhERWhrTjBTWFdZOGlPeTY1eWVCcWg5QmxGQnhUTSthK0kzejVzbG1ZWjBs?=
 =?utf-8?B?WDUxd1RvYmdXY3pmb3U4UVhIdVBtWWI1TnNrc0JQdXJuYVc0SlJ5eWw0U0tn?=
 =?utf-8?B?OFZKWGlranpXUGRrNEhpdG56eHhBZmU3SEl1TUtlQUxPaGhiQUdMdnoybHJL?=
 =?utf-8?B?azV5RTJySzk5OG9mMDN5NWc3NzI5b2dhaXVtdUl0YWxHMWRpSHRWdUJ3R1JR?=
 =?utf-8?B?VkU4d3pIM3MwSjVoUE4rSU1XUzZxS2s2K2ZnU2ZyeHM5TzBidFpKaVBXNVV3?=
 =?utf-8?B?ZENJZDdLQ2lhR2tXT1dsRHdvNlpjUnJKYTlVRUNsQld1ZDY4TXRhTlBtdUtP?=
 =?utf-8?B?ZGhrMW9DOUFUa05ySHpreGZqS0RscXJQOVFPdE5XZlEyYW1kczRuSDdkekt6?=
 =?utf-8?B?d2cyREpmWmptMUtncm5vNEpsOE5oNEpIWnljNEhzcndUaERYZWJDQTJrOWIr?=
 =?utf-8?B?V3craWRYQ1FYWmpoMWpTQU96Q1JiemdTSXRvNzNzMEc1SlpabFRpNnVPUHBO?=
 =?utf-8?B?NFp3REYvSXVGOGVVVllLNXRxMHRtTTBocCtvM1Foc2NTVzJTSDJUTDNTRzFQ?=
 =?utf-8?B?ZU03cTNBd1pzVWt6LzBoVVp0Wk1SdzZlNk5SamNzK1g5OVQ2dlp3NDl1UXBZ?=
 =?utf-8?B?cHRybVUwZUs2NHYyU2xkWDZ3dTRQOFJkSXdBV29vak5PSzM5dStsbk10SnZj?=
 =?utf-8?B?U0I0T0t3bG1abXMyUFdSNUR5N0xLdVNFVXF0SUpMc2IzTmZCODQzY1d1dzFM?=
 =?utf-8?B?UksvRk9Jd0NKYkZCd0FFL0pMSVNaZVp5TXU5TUpNMkdOTEpSTmdQQlA4QTVF?=
 =?utf-8?B?YWszTGhCaGtVVThlYW5vb1Ywd1FhOGJCM1FseGJUaWpBMEc2dzE1RFZTTElr?=
 =?utf-8?B?OXgxL0xuajRnYzZubFBncEJvMUdjcnIrK25MVXFiZFUxZVdlTllPL0NFbHM1?=
 =?utf-8?B?R0g5VCtaVDVVM0hiNElabVRlRUFUMzNhTE90aE14bkxwNmMyL0F5NndaclVG?=
 =?utf-8?B?ZW5SNTNYVjNHU3N5SjNKemlhcEgyTExXVlVLQ2V0MnR2bklJakxKbkVvbFpy?=
 =?utf-8?B?SUZmNlpxQ0F2Nkh2SFpseFlUZWx5eUIwMGduY3lma0xLUklqTllySjhHMGFp?=
 =?utf-8?B?U3NnYjU3UE5ZQUljemtlMkM3NHlZNXBmOFBLUjVsMk50U1BMcWJRUlJvNDR5?=
 =?utf-8?B?c2hadXRnajQwZFptN05XaXhCWmowK21hMDNveXA3eTJtV0FxYnZqWU5EVUZK?=
 =?utf-8?B?OFVKcElmTFJ4QTVJQ25uUyszYTgyVkRITSs0Z2ZPOW15NitZR0pOcTlIMGlm?=
 =?utf-8?B?bmlMUHJZcHU5OVJwZkc2SDNQZ3NsYjEwOE1HdGRvR2hCVkx2UWJYOURvYnN1?=
 =?utf-8?B?aEVabkhTaXM5Vmdvc0p1M3hqWVdDMmUveGU5YmFDODNNYWZDRnlPM09xVEZT?=
 =?utf-8?B?OC9mRjFScE1oL3JqYUNvTzJ1TndQZ0YzZENnWU1xL1dkNkdCQ1FCN3ZxOWc0?=
 =?utf-8?B?SXpDajZyWVRUYnVJbCt2WXVhakpDOFNCclNITTF5dCtNY0JzUjZSSU1SWGVt?=
 =?utf-8?B?MU4zVmM0a1RRUEcycGNVU0xLeFBUaUtwWDBSMStqd3NLbTV3L3F4OGo4V0hN?=
 =?utf-8?B?eFE3WmNFRmp5eDhyUzFaQldkdDRFY3E1N09yWHRwMWZZcUtUOWF3SVpQWlIr?=
 =?utf-8?B?OUt5UnpnMlZrdkRKdjl0WFFYY1lWQTNsNFAyNFFLMHNQdkFzVUlFdXh6bWkr?=
 =?utf-8?B?eERlRVo0UndnclZOZjlZWDZ3QVQ4RGJSWjdjazE2dHpjNmVHbkIydWxaSHk1?=
 =?utf-8?B?LzZRdVV6ak1mcWVxQ0ZwS1hGWmNMckR0Ry9mSEFOdjIvcW9od1NnMThLWWNF?=
 =?utf-8?B?Q1h3ZmNDSnE1MlU5VURUcG1GZUcvWFBsaFAwT2dNMU1ibjJsZmlnblB4enpi?=
 =?utf-8?B?NFZGdHpNWkwxaHdoK3B3eGlxYm9oY1lPZVZKKzJEVGtCQk9xcGdUckUwTEp5?=
 =?utf-8?B?Vld1TWk3STJzMlpWdTFzWHUrUCs5c1c3Rlk1YnNGWk1lajY2ei9GMllBT1da?=
 =?utf-8?B?QllXc2tLaVdPNjg5V3gvRzY2aldsWnVud0RwZ3ZnaWM1Y3d4QjFyNTRSN3BO?=
 =?utf-8?Q?l9sLx1zUGg5x8bAQT7vYb7AOvycINh5uOB1ar4ijfcvn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4a7f389-3d24-4c57-2ea9-08db458acf4f
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:44:29.1453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0akp+ZlPau9QxnWWPSCFus9RzNpzz2H0dg4C2zB/swFUpY8rljpmXYDYVKouveuy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 kernel-dev@igalia.com, "Deucher, Alexander" <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.04.23 um 14:14 schrieb Michel Dänzer:
> On 4/25/23 14:08, Christian König wrote:
>> Well signaling that something happened is not the question. We do this for both soft as well as hard resets.
>>
>> The question is if errors result in blocking further submissions with the same context or not.
>>
>> In case of a hard reset and potential loss of state we have to kill the context, otherwise a follow up submission would just lockup the hardware once more.
>>
>> In case of a soft reset I think we can keep the context alive, this way even applications without robustness handling can keep work.
>>
>> You potentially still get some corruption, but at least not your compositor killed.
> Right, and if there is corruption, the user can restart the session.
>
>
> Maybe a possible compromise could be making soft resets fatal if user space enabled robustness for the context, and non-fatal if not.

Well that should already be mostly the case. If an application has 
enabled robustness it should notice that something went wrong and act 
appropriately.

The only thing we need to handle is for applications without robustness 
in case of a hard reset or otherwise it will trigger an reset over and 
over again.

Christian.

>
>
>> Am 25.04.23 um 13:07 schrieb Marek Olšák:
>>> That supposedly depends on the compositor. There may be compositors for very specific cases (e.g. Steam Deck) that handle resets very well, and those would like to be properly notified of all resets because that's how they get the best outcome, e.g. no corruption. A soft reset that is unhandled by userspace may result in persistent corruption.
>

