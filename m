Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57D7AAFDF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 12:46:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480C010E64C;
	Fri, 22 Sep 2023 10:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22A710E64C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 10:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfY78iMelHygcXAEq6cgWp+OsCRsj9XTc6s8ETQUCH+1F82mr4AJmBjDF7mAkQaAaQsBF/Fh1QuAftqIRUI1J5Es3xqydVyPwKCxXyCzIpPFB17yIhzDwnsVEmqDVaX7YwB3ehJBhYEYnRxIo4PlDFmeqi8lWt7kuWAuBtdEcygniw90Gz1b+Dj1elPlqgFlWYs23vHQnGL01td9mObYpWxk6TAASAp6GEawznksr1GF2qPH/yoB3QGAgIE87TsCBzNly8+QHRAqP1pCy9nLljBtkP9YHAszZsj7oHK2OBNzl7FPZTklZwg6CwLeAcTF3AYR3Tjsn0WMPrgvpd+mzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsb51zCYZwFcl89OMl+xx5WY8Pkhs4c9bgy5rg2Rhjo=;
 b=n7WLx6pVAX4RZMKLZDi+Bqe9Q5sxsYDI/M5meQ1g0d6S7SdGwydB8lJ9phamfDBLoZPr7iBJBabCeOhWbHMdSlp33s8yO705bs/pTEKuZVqnRF0PhOEzCJJ+mjT5c7w1gjluSVV2xUxntFIEJtvJ9gASqUCc8Z8I1esAlVzwQEoWwPEva2IyfRTeBbJ+4ISbprHHxhJWqGoZ5gq1K+GhYMa4h+iQo4RtdpUGDM8IMotrX5iBx32bcuBZ5HlTPTqyGZDC4TX+wn66dwbJZMkAuauFu/vo0gNDOhOadGPnGL/z95+1XcKK38U59k/C8g7yMrotJYgfkGBbA3dNYrXIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsb51zCYZwFcl89OMl+xx5WY8Pkhs4c9bgy5rg2Rhjo=;
 b=JE/gY5jptZn3AoAEKthEj/1HUB+GTxoNvZFXGi66gF0LUILiBmJ3zrLvLXwTtXzIjT4PbP8zwrm5AmIHyxDxKT/xxOU3BRpMhwdjtP9peFQQmU1hyQlvEOGbvtB4R4gH936Figx2oryuovSrMAisopPLPSCDkuTJDYAMjw2OQPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH3PR12MB9341.namprd12.prod.outlook.com (2603:10b6:610:1cd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 10:46:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 10:46:06 +0000
Message-ID: <98ecb2a0-976b-770f-eb72-67146934b279@amd.com>
Date: Fri, 22 Sep 2023 12:46:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Decrypting tt maps in ttm
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>, "alexdeucher@gmail.com"
 <alexdeucher@gmail.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
 <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
 <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
 <5efd9a5d-7c88-855a-8a2f-5d984ea4a5e7@amd.com>
 <53e09f13-eb54-9662-a511-77c012df9646@linux.intel.com>
 <beb209b5-fb67-5b53-62b8-bc1c78b41cc5@amd.com>
 <d61a3236737e13a6a303fd9902cf6938e29cf32d.camel@vmware.com>
 <70af0fd3-3dbb-b19a-8a4d-dcddab60d3e9@linux.intel.com>
 <690a0d33-0091-fdbf-7a1c-c9de89bb79eb@amd.com>
 <78999ee1dc22edb6acb49ae936e5ad7a7470b591.camel@vmware.com>
 <2b22e309-26bf-c553-fc6c-3cfc6c701d51@linux.intel.com>
 <36a2ebcecf79e71bd0a310427de674e07ded6198.camel@vmware.com>
 <222b98d0-7e5b-ff69-269d-6f6c6c26736c@linux.intel.com>
 <a2dc67f5356381a4c56ca52549f79941de66da83.camel@vmware.com>
 <c8d90961-798b-a0cd-8564-6bb5d1816e4f@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <c8d90961-798b-a0cd-8564-6bb5d1816e4f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH3PR12MB9341:EE_
X-MS-Office365-Filtering-Correlation-Id: 349163c0-8340-4442-e357-08dbbb591ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q3tP9NmVvX3d+Dp51Pk5+cPOVERrsphuijoEi5EibVOyFMPBy5U3ocPOszQGFgpbfDtxjGzdlSh1TzXEyWpMeGOK+FBk4mfs344kB6qd9pVVMgmG2H4bRLTLp6EX5SIIz8k3EnIsSv9y4O6hj4t5uT2LmxwO/W+1E1bs1WGKs753gkjoSQz0us7lS0lZSjI/UADpC3O1M6v0HWZMad9ozwtrlaV785MtBDeI62wolkmyfEd3DVHpA68nEdxZGZaleOPOqrZOzczgcQdbkVk1NGz9ddAElgEw7Xi9GEPI/p5wOm/2jaJx6R0C73klZT/eNeD2G+3WezC66sMCnruQEr7HtOMjbmyFKl9z6WZE8v7FCYnram22Pq9lMMTpkaA22/Qnd7HyTE5OChwjrtLqfUlbvPHYXSmGLimv8IEeBtGBzdyqVX7j3/rZ7Ggo1T94x3siARBHfUeMuP3pVNHH2oe3vuiZoM8l+bMGmzIvrj3Ayl0AwQpi7lUh6MHhXF8TS1R3eztcV3YGLtzG0BFh4BPQEOxYz6PntE42qixj940QPsMA/biwwsLn81tmA8mD1H4ys+e0o7d2ocUU8NWUzgDbsiIhjVwKgXVDg+yIZhgazMlKFoBx4BdFcLZVijbv8FIqNyUm3PbIqk2z8TFih9/CDoeInf8j3iTVCCrVgB0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(1800799009)(186009)(451199024)(6512007)(53546011)(6666004)(6486002)(478600001)(6506007)(8676002)(8936002)(83380400001)(66946007)(66556008)(54906003)(31686004)(966005)(110136005)(316002)(66476007)(5660300002)(66574015)(2616005)(36756003)(38100700002)(31696002)(4326008)(86362001)(2906002)(41300700001)(30864003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTlDTWxxOTRma095ckVzY3lHS29MQlIyUFdYUjZhOURsTEtLbnhSTnZXaWpY?=
 =?utf-8?B?Rzh1SUdFQUU2TUhwQzYvSkVLUTZiYjBNTEk4eC90eHEvaDdxTi9QZVF6UlR0?=
 =?utf-8?B?MmhlUGlER201RVpEYnI0SWRIc2RnRGtINTQ0RXFEMmNiYzY2aFRFZU9XZE15?=
 =?utf-8?B?Q2ZORUI4U3p4VHdOMWd1RG53eU1PMExoaHEweHZoYVhEYmFnRk5qc1FiWWlF?=
 =?utf-8?B?VEo0cm43SEkwNzJJOERTcHQ1QlVEb3ZvTWVpRXhYazZ0Nm9aYy9QWXlIVnMz?=
 =?utf-8?B?L1pORXBiSmtDVVRkQ2w2S0wwTnhjd1Y3d2lSdjU2SWI0S1BRM2UwOVk0T2Fu?=
 =?utf-8?B?N2RxL29INi9wb0tOMkxRRE82UThZaHhFaDdXdDNnTHN3eDN5c1dRckJGNTcv?=
 =?utf-8?B?SWRSVDJjRkRzQXkraGRnRXc0ZS9BUEpsc2E0eGFVUnFBc3NzVFlkY1NzOEY0?=
 =?utf-8?B?T3pZUTVnSVpmT2puNk5NNUw4Nld6MWQycHJ3MXJYQWYvL2Rjb3RCU081R0Nx?=
 =?utf-8?B?a1pTUTN4UE1qQUlQQ3psRDJWTnBpaS9lcmt0djYwMXk1MXVMcmRnR1RUcFBQ?=
 =?utf-8?B?UUZTKzJLQ2hBaWpEdUROQW12T1JYWkdzL0lhaGhLZUFCdDVPRkVBdnBTcmQv?=
 =?utf-8?B?NG8rUDhZdTRSUTFXSGpIM3ZxeGMrN3lRMDhvUldIM1pncXJuOG5mam1SL0Q3?=
 =?utf-8?B?T3BzWTNPdTh0WlpUNXk1QUpxcEtkWC84RDhGNDYydHRHMFFqR2E3V2VKNkFl?=
 =?utf-8?B?RStTMHJIK3l6NDhGN2Zac0FYYWl0Sm1NTnVaT1Zub2gzVWRaY0wxang4Y1Fs?=
 =?utf-8?B?c0tieVcwRWZLKy9PWXZEVzlMZ0NtY3FIR3E2OXhURkRXdU91SWRNRll4M3A5?=
 =?utf-8?B?SlNucGtUWEkyUkhiVmw1SDQ2aXBzb3ZvekdiVzZGOGlhTkw0bWUvOGx4amhK?=
 =?utf-8?B?VFJmQVNtL2pWcDRHemthN3dMTXdXYnZrenVkNTdFemI3UTl0Vncwa3RhNUJP?=
 =?utf-8?B?UjJIcnR6ZWlqOGpOdHBlRDhNZWtuM2hJT2lQcjRGc014dlg1K1RsVXB5aUND?=
 =?utf-8?B?SjhuWkJzVi9PSmxTQndBSDFOU2JHRkVuVW1YMk82UllGSDZJamg0c3FhQ3ht?=
 =?utf-8?B?ZkZVVUhOaWtLaWJCemwrVHdTTWVzTmRhUFlsSXVqVEZEeTR6NkVSOElHaUdK?=
 =?utf-8?B?Zy9LMW1iL0Qzakg4ZzB0NFY2M2hJOVdjRFNmaXcwYUcvUjFmdnlYTjNLOHVD?=
 =?utf-8?B?RGVHdWxxQmJHTWtPMm5zTWw2eXZFUzJwMVYzNmNCSTdQZzArVitpeXVBdWFT?=
 =?utf-8?B?Rk4rdVg4d0NTNFFHN0VnTi9LcGs3Si9zM0FaVWF6bDUxdUhteE10OUJVdFNM?=
 =?utf-8?B?MVJkOHZxbk02a0RVWktjaXlwWFlITWw3amdTVFRSc3dKaklGUTZDZ1h6OWxw?=
 =?utf-8?B?Z0xKOWFiWGZKSkVJcnl3SjA5RFY0dTZINW5pWE9NWEVVV3hBc2pwWHpHOW9C?=
 =?utf-8?B?YUd3TTRjYlp1VjZGTUVRNzljTjNITFhHb3RhdGx6ck1kZ2l4U21GTlZJOXF5?=
 =?utf-8?B?bUVVa1o0bENzdGc3dFVWVE5ra1JqN3BNUHVaNEVTay9GMUlaWWpGTkllbUhr?=
 =?utf-8?B?N2tMS2lZZE51NE9zelBtYnhOWTRKamZyeEFFb3JuU3NJWEJRQnZZb1NsbWdp?=
 =?utf-8?B?R1Q3UHcrRTVBYVJXbFNYQkhpM3ZzcUx4em9hZysyWU5jRU9VV3FQU3RPRndn?=
 =?utf-8?B?N0Y1RlFabWhLN3RvSlFha3dpTks2Vlp6Q2ZSd2VmZ2VQdEVJdU1la1QreUpJ?=
 =?utf-8?B?cnNkZjVxQzNWbEVPOWtobHpSdE85NGxMV3FyOFE4ZnJHMWFNUm9Kb0lnbUVq?=
 =?utf-8?B?a0dzMHBYYW5jMFh3SUQ3UzJvVkx5bDl2Ukp1bnhLSzh3SXB1aWJ5S1hCbmty?=
 =?utf-8?B?UFZkRjd6bnQydUZ5NFdUYzlHa1ZXOU42S0RRb1hJVXA4TEFqNVNIbzRNTFIw?=
 =?utf-8?B?VnB3MjFaSEU1WDFVWUNFY3JFWXFyMGkvL2FYeXVpbi9IaGtteXMrMFZWUHd3?=
 =?utf-8?B?MzF1Y0pCc2ZyN0tFSGs4MWc3OC9ldGFyV1JVN09GclZCMEdqSEtmWlZPKzJ1?=
 =?utf-8?Q?+6UXPlUSc8+YWtvQv7Gh19KpX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 349163c0-8340-4442-e357-08dbbb591ff5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 10:46:06.6807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OfGIjI0sBJBNnJBYjcfRJnSsaYPRC6OFc7AIYHMrthL2QPYKonF7ZWD1zPmf3AdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9341
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 21.09.23 um 09:12 schrieb Thomas Hellström:
>
> On 9/21/23 05:51, Zack Rusin wrote:
>> On Wed, 2023-09-20 at 21:22 +0200, Thomas Hellström wrote:
>>> !! External Email
>>>
>>> On 9/20/23 20:24, Zack Rusin wrote:
>>>> On Wed, 2023-09-20 at 19:17 +0200, Thomas Hellström wrote:
>>>>> !! External Email
>>>>>
>>>>> Hi, Zack
>>>>>
>>>>> On 9/20/23 18:39, Zack Rusin wrote:
>>>>>> On Wed, 2023-09-20 at 12:48 +0200, Christian König wrote:
>>>>>>> !! External Email
>>>>>>>
>>>>>>> Am 20.09.23 um 09:36 schrieb Thomas Hellström:
>>>>>>>> Hi, Zack,
>>>>>>>>
>>>>>>>> On 9/20/23 05:43, Zack Rusin wrote:
>>>>>>>>> On Tue, 2023-09-19 at 09:47 +0200, Christian König wrote:
>>>>>>>>>> !! External Email
>>>>>>>>>>
>>>>>>>>>> Am 19.09.23 um 08:56 schrieb Thomas Hellström:
>>>>>>>>>>> On 9/19/23 07:39, Christian König wrote:
>>>>>>>>>>>> Am 19.09.23 um 03:26 schrieb Zack Rusin:
>>>>>>>>>>>>> On Mon, 2023-09-18 at 16:21 -0400, Alex Deucher wrote:
>>>>>>>>>>>>>> !! External Email
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On Mon, Sep 18, 2023 at 3:06 PM Thomas Hellström
>>>>>>>>>>>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>>>>>>>>>>>> On 9/18/23 17:52, Zack Rusin wrote:
>>>>>>>>>>>>>>>> On Mon, 2023-09-18 at 17:13 +0200, Thomas Hellström
>>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>> Hi,
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> On 9/18/23 16:56, Thomas Hellström wrote:
>>>>>>>>>>>>>>>>>> Hi Zack, Christian
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> On 9/18/23 13:36, Christian König wrote:
>>>>>>>>>>>>>>>>>>> Hi Zack,
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> adding Thomas and Daniel.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> I briefly remember that I talked with Thomas and
>>>>>>>>>>>>>>>>>>> some
>>>>>>>>>>>>>>>>>>> other
>>>>>>>>>>>>>>>>>>> people
>>>>>>>>>>>>>>>>>>> about that quite a while ago as well, but I don't
>>>>>>>>>>>>>>>>>>> fully
>>>>>>>>>>>>>>>>>>> remember the
>>>>>>>>>>>>>>>>>>> outcome.
>>>>>>>>>>>>>>>>>> Found one old thread, but didn't read it:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> https://lists.freedesktop.org/archives/dri-devel/2019-September/234100.html 
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> /Thomas
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> Ugh. Now starting to read that thread I have a vague
>>>>>>>>>>>>>>>>> recollection it all
>>>>>>>>>>>>>>>>> ended with not supporting mapping any device pages
>>>>>>>>>>>>>>>>> whatsoever
>>>>>>>>>>>>>>>>> when SEV
>>>>>>>>>>>>>>>>> was enabled, but rather resorting to llvmpipe and VM-
>>>>>>>>>>>>>>>>> local
>>>>>>>>>>>>>>>>> bos.
>>>>>>>>>>>>>>>> Hi, Thomas.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Thanks for finding this! I'd (of course) like to solve
>>>>>>>>>>>>>>>> it
>>>>>>>>>>>>>>>> properly and get
>>>>>>>>>>>>>>>> vmwgfx
>>>>>>>>>>>>>>>> running with 3d support with SEV-ES active instead of
>>>>>>>>>>>>>>>> essentially
>>>>>>>>>>>>>>>> disabling
>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>> driver when SEV-ES is active.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I think there are two separate discussions there, the
>>>>>>>>>>>>>>>> non-controversial one
>>>>>>>>>>>>>>>> and the
>>>>>>>>>>>>>>>> controversial one:
>>>>>>>>>>>>>>>> 1) The non-controversial: is there a case where drivers
>>>>>>>>>>>>>>>> would
>>>>>>>>>>>>>>>> want encrypted
>>>>>>>>>>>>>>>> memory
>>>>>>>>>>>>>>>> for TT pages but not for io mem mappings? Because if not
>>>>>>>>>>>>>>>> then as
>>>>>>>>>>>>>>>> Christian
>>>>>>>>>>>>>>>> pointed
>>>>>>>>>>>>>>>> out we could just add pgprot_decrypted to ttm_io_prot
>>>>>>>>>>>>>>>> and be
>>>>>>>>>>>>>>>> essentially done.
>>>>>>>>>>>>>>>> The
>>>>>>>>>>>>>>>> current method of decrypting io mem but leaving sys mem
>>>>>>>>>>>>>>>> mappings
>>>>>>>>>>>>>>>> encrypted is
>>>>>>>>>>>>>>>> a bit
>>>>>>>>>>>>>>>> weird anyway.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> If the answer to that question is "yes, some driver does
>>>>>>>>>>>>>>>> want
>>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>>> TT mappings
>>>>>>>>>>>>>>>> to be
>>>>>>>>>>>>>>>> encrypted" then your "[PATCH v2 3/4] drm/ttm,
>>>>>>>>>>>>>>>> drm/vmwgfx:
>>>>>>>>>>>>>>>> Correctly support
>>>>>>>>>>>>>>>> support
>>>>>>>>>>>>>>>> AMD memory encryption" solves that. I think getting one
>>>>>>>>>>>>>>>> of
>>>>>>>>>>>>>>>> those
>>>>>>>>>>>>>>>> two in makes
>>>>>>>>>>>>>>>> sense
>>>>>>>>>>>>>>>> regardless of everything else, agreed?
>>>>>>>>>>>>>>> Well, there is more to it I think.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> IIRC, the AMD SME encryption mode has a way for a device
>>>>>>>>>>>>>>> to
>>>>>>>>>>>>>>> have the
>>>>>>>>>>>>>>> memory controller (?) encrypt / decrypt device traffic by
>>>>>>>>>>>>>>> using an
>>>>>>>>>>>>>>> address range alias, so in theory it supports encrypted TT
>>>>>>>>>>>>>>> pages, and
>>>>>>>>>>>>>>> the dma-layer may indeed hand encrypted DMA pages to TTM
>>>>>>>>>>>>>>> on
>>>>>>>>>>>>>>> such
>>>>>>>>>>>>>>> systems
>>>>>>>>>>>>>>> depending on the device's DMA mask. That's why I think
>>>>>>>>>>>>>>> that
>>>>>>>>>>>>>>> force_dma_unencrypted() export was needed, and If the
>>>>>>>>>>>>>>> amdgpu
>>>>>>>>>>>>>>> driver
>>>>>>>>>>>>>>> accesses TT memory in SME mode *without*
>>>>>>>>>>>>>>> pgprot_decrypted()
>>>>>>>>>>>>>>> and it
>>>>>>>>>>>>>>> still
>>>>>>>>>>>>>>> works, then I think that mode is actually used. How could
>>>>>>>>>>>>>>> it
>>>>>>>>>>>>>>> otherwise work?
>>>>>>>>>>>>>> For SME, as long as the encrypted bit is set in the physical
>>>>>>>>>>>>>> address
>>>>>>>>>>>>>> used for DMA, the memory controller will handle the
>>>>>>>>>>>>>> encrypt/decrypt
>>>>>>>>>>>>>> for the device.  For devices with a limited dma mask, you
>>>>>>>>>>>>>> need
>>>>>>>>>>>>>> to use
>>>>>>>>>>>>>> the IOMMU so that the encrypted bit is retained when the
>>>>>>>>>>>>>> address
>>>>>>>>>>>>>> hits
>>>>>>>>>>>>>> the memory controller.
>>>>>>>>>>>>> How does that work on systems with swiotlb, e.g.
>>>>>>>>>>>>> swiotlb=force, or
>>>>>>>>>>>>> i.e. what would
>>>>>>>>>>>>> decrypt the ttm tt mappings when copying between system and
>>>>>>>>>>>>> vram
>>>>>>>>>>>>> when iommu is
>>>>>>>>>>>>> disabled/absent?
>>>>>>>>>>>> SME makes it mandatory that all devices can handle the 
>>>>>>>>>>>> physical
>>>>>>>>>>>> address used for DMA, either native or with the help of IOMMU.
>>>>>>>>>>>>
>>>>>>>>>>>> Hacks like SWIOTLB are not directly supported as far as I 
>>>>>>>>>>>> know.
>>>>>>>>>>>> Maybe
>>>>>>>>>>>> somehow SWIOTLB manually decrypts the data while copying it or
>>>>>>>>>>>> something like this, but I'm not 100% sure if that is actually
>>>>>>>>>>>> implemented.
>>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>> A bold guess after looking at various code and patches:
>>>>>>>>>>>
>>>>>>>>>>> 1) Devices under SME that don't support the encryption bit and
>>>>>>>>>>> SEV:
>>>>>>>>>>> a) Coherent memory is unencrypted.
>>>>>>>>>>> b) Streaming DMA under IOMMU: The IOMMU sets the encrypted bit.
>>>>>>>>>>> c) Streaming DMA with SWIOTLB: The bounce buffer is 
>>>>>>>>>>> unencrypted.
>>>>>>>>>>> Copying to/from bounce-buffer decrypts/encrypts.
>>>>>>>>>>>
>>>>>>>>>>> 2) Devices under SME that do support the encryption bit 
>>>>>>>>>>> (which I
>>>>>>>>>>> believe is most graphics devices in general on SME systems, not
>>>>>>>>>>> just
>>>>>>>>>>> amdgpu; it "just works")
>>>>>>>>>>> *) Coherent memory is encrypted. The DMA layer sets dma 
>>>>>>>>>>> addresses
>>>>>>>>>>> and
>>>>>>>>>>> pgprot accordingly.
>>>>>>>>>>> *) Streaming DMA is encrypted.
>>>>>>>>>>>
>>>>>>>>>>> So the bug in TTM would then be it's not handling 1a) and 1b)
>>>>>>>>>>> correctly.
>>>>>>>>>>>
>>>>>>>>>>> Remedy:
>>>>>>>>>>> 1b) Shouldn't be used with encryption.
>>>>>>>>>>> 1a) This is what we should try to fix. Exporting
>>>>>>>>>>> dma_force_unencrypted() didn't seem to be a way forward. 
>>>>>>>>>>> Properly
>>>>>>>>>>> fixing this would, I guess, mean implement the missing
>>>>>>>>>>> functionality
>>>>>>>>>>> in the dma layer: For vmap / kmap we could simply reuse the
>>>>>>>>>>> virtual
>>>>>>>>>>> addresses we get back from dma_alloc_coherent(), but for 
>>>>>>>>>>> faulting
>>>>>>>>>>> one
>>>>>>>>>>> would want something like dma_coherent_insert_pfn() (if it 
>>>>>>>>>>> doesn't
>>>>>>>>>>> exist already) after a proper disussion with Christoph Hellwig.
>>>>>>>>>> Christoph once pointed me to dma_mmap_attrs() for this, but I 
>>>>>>>>>> never
>>>>>>>>>> found the time to fully look into it.
>>>>>>>>> Hmm, yea, that would make sense
>>>>>>>>> https://elixir.bootlin.com/linux/latest/source/kernel/dma/direct.c#L564 
>>>>>>>>>
>>>>>>>>> Replacing the vmap's with dma_mmap_attrs would probably fix 
>>>>>>>>> this, but
>>>>>>>>> it would
>>>>>>>>> require a bit of extra setup.
>>>>>>>>>
>>>>>>>>> So we're saying that yes, we don't want unconditional 
>>>>>>>>> pgprot_decrypt
>>>>>>>>> in ttm_io_prot.
>>>>>>>>> We'd like to leave those tt mappings as encrypted when 
>>>>>>>>> possible and
>>>>>>>>> instead maybe
>>>>>>>>> add a vaddr to ttm_tt (or extract it from the pages->private 
>>>>>>>>> via the
>>>>>>>>> ttm_pool_dma,
>>>>>>>>> but that seems rather ugly),
>>>>>>>> It could probably be extracted from pages->private from a 
>>>>>>>> helper in
>>>>>>>> the ttm pool code, (Christian has a final saying here). 
>>>>>>>> However, that
>>>>>>>> requires that all ttm_tts are built from a single dma_alloc 
>>>>>>>> chunk. Not
>>>>>>>> sure that's the case? In that case we're back to square zero 
>>>>>>>> for vmaps.
>>>>>>> Nope they aren't and yes we are back to square one with that.
>>>>>> Well, that's my favorite square. Number one, just like me...
>>>>>>
>>>>>> Maybe we're overthinking this particular problem a bit. As is 
>>>>>> use_dma_alloc
>>>>>> in
>>>>>> ttm
>>>>>> is only set in two cases:
>>>>>> - driver explicitly wants coherent mappings (vmwgfx, which 
>>>>>> require decrypted
>>>>>> pages)
>>>>>> - driver needs swiotlb (which, as was pointed out, would require 
>>>>>> the pages
>>>>>> to be
>>>>>> decrypted as well)
>>>>>>
>>>>>> So use_dma_alloc always requires the pages to be decrypted.
>>>>> IIRC moving forward it doesn't, since there is (or at least there 
>>>>> was)
>>>>> implement missing TTM functionality in the dma layer and most TTM
>>>>> drivers should at least support dma coherent memory. That means all
>>>>> devices supporting a sufficiently large dma mask will break with 
>>>>> SME and
>>>>> your proposal then.
>>>>>
>>>>> Perhaps if we condition that on
>>>>> "cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)" that will capture all 
>>>>> the
>>>>> SEV cases, and limit the existing bug to the hopefully very few TTM
>>>>> devices with limited dma mask on SME.
>>>> Ah, I wasn't aware those exist, do you know what platforms are 
>>>> those? I can try
>>>> to
>>>> find one around here to see.
>>> My understanding is cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) will
>>> return true in the guest iff SEV is active, and can be used in TTM as a
>>> poor man's force_dma_unencrypted(), enabling the functionality in your
>>> diff. It looks like a similar check is present in vmwgfx to detect SEV,
>>> but also see below.
>>>
>>>> And they don't really break, they just might unnecessarily decrypt 
>>>> tt pages,
>>>> right?
>>> No, with SME, dma from hw will encrypt the content, because the dma
>>> layer will set the "encrypt" bit in the physical address given to the
>>> iommu or the device in case iommu is not active, but a subsequent
>>> reading the content using the CPU won't decrypt so CPU and device will
>>> have different views of the page.
>>>
>>> Also the linear kernel mapping PTEs will conflict in encryption mode
>>> with the ones TTM sets up, and IIRC that's forbidden in the SEV spec.
>>> (The x86 arch code goes through some serious work to flush out caches
>>> and TLBs to convert a page kernel linear mapping from encrypted to
>>> non-encrypted,
>>>
>>> https://elixir.bootlin.com/linux/latest/source/arch/x86/mm/pat/set_memory.c#L2129 
>>>
>>>
>>> and that is also seen as pretty heavy dma_alloc_coherent() latency).
>> Thanks for this!
>>
>>> So the pgprot_t TTM sets up *must* be identical to the one used by the
>>> dma layer, so anything we should be aware here that anything we do in
>>> TTM less than adding needed functionality in the dma layer is
>>> second-guessing what the dma layer does internally and is not really 
>>> the
>>> right solution.
>> I think this is already the case for virtualized drivers, but I see 
>> what you're
>> saying that fixing this for them might break some real hardware and 
>> that's bad.
>> Playing those games with matching pgprot between ttm and dma is 
>> really fragile.
>>
>> cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) is also used in 
>> drm_need_swiotlb so
>> adding that check to the last patch would seem to make sense. Of 
>> course, it's up to
>> Christian whether that's robust enough or whether we need to think 
>> about the
>> dma/page fault rework to fix it properly. I'm not sure if I see any 
>> other reasonable
>> solution besides these two options.
> Agreed.

Uff, of hand that looks like the right thing to do. But I'm really not 
an expert for that stuff.

I think the best thing you can do is to write a patch and send it to 
LKML and dri-devel and see if anybody objects.

Christian.

>
> /Thomas
>
>
>>
>> z

