Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6CB7B721C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 21:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE4910E30F;
	Tue,  3 Oct 2023 19:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13D9C10E30F;
 Tue,  3 Oct 2023 19:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuJxrQvMFZVVW32eFMGvFiP8MlQ1YBKfuuiCdvKjiFAKk4xEB+8d9YPtbOiiBpZnCkNxEvxauCDtTxMZRSi42rlzlDOA3ozvFvNLa6iQyrClOzlPo6bAaj2rKVqsQGtVI0U63gcxjfhBQaKTwGaj3385PMR2HvPAIWhs4vBPXexzzkZZH0lA8QgP0zjGwSDsTqtDrbya48yeU/BcNONeynfq3oPfmHy9bqiANLpvsYrXHHab4DPQW2sRbSm8JZWhwGXjP1ylGwgMI8uhXcguQiBqPunWmP0tWrAz/4xj0TIJYR6RTI1XHPfk1X7IsqbMro9pGAhuIzMsJ9Wh50I/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gonJml/nB0MdWJpJtc7WDpz+e0c4V65Pb1jjfW1adGU=;
 b=BKBw5Yr74Do5ti2UtrGFL0Qz3Nc3YkLexyc6ImJ8lnR2FH9pz/7p7FwRwiMep5qTWzHLIus3FRgfm61QiSvXk4B3s4OL8w1KcSz0n6Zo+SnpPq5hOfmVf7Avli9UYIRprb2VytMwSI8lrBzJA+ztzUoEd5SiKXajYPVkYtYTnlwlrfrhhSjntvx+fSARhYe5UEn6SewQKiUGooVcuggR1+fPUKiNj1QEeuU94A5Ko3hQbxj1vO+8Y/4aEAGxXZocZh5xDX5mSGPKvPZGpGfJTEhaCcg+7hBTrgD1gtZo53YccWPVMvvlr5fX/LRDtkAmztx/6K6P3z/2B/M666Aqrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gonJml/nB0MdWJpJtc7WDpz+e0c4V65Pb1jjfW1adGU=;
 b=PL51jG9il0Y64aTe5SbUBloP/hjVT93wxvOktNYA0pNadXJrybpy5FWGj088Jm8g8UOuBo+4rMwWAzlDlnWEDRXQQMH99FA2TPj0/vbiuugkiefU1/aUufyBuQnhNpn8LleSG53DTSSSwXmZNPz+xCpKNg8XyptcNwyZaZYMt5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BN9PR12MB5209.namprd12.prod.outlook.com (2603:10b6:408:11a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Tue, 3 Oct
 2023 19:55:00 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 19:55:00 +0000
Message-ID: <7a3875f6-122f-426e-95c9-06ed8123249b@amd.com>
Date: Tue, 3 Oct 2023 15:54:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move
 memory allocation.
Content-Language: en-US
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
 <8be685cb-f44a-1143-60ec-d1073fda8e16@gmail.com>
 <20231002105813.NrEGqSCY@linutronix.de>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20231002105813.NrEGqSCY@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::7) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BN9PR12MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 26432a8e-3732-4c70-4234-08dbc44aa094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cu2TpQkh3uzTih16DigM8Pgzf729oCBboBiudRLEjez4n1GP2Impm+4bi7ng/mdDRLqjRu5Bj9fCRzCVqUqNj9/rirUpc4p9TgYVChJ1bBxMdbOlYuU+8JbjGA2syOzv02CUawa6LqCWYLzF+gT33LzulRwtSa4gBM/tCb+vV7xinVegIT1s+LAhqxXnF62G+ydsSHJ48MNXLvAb4g+iwJD9i2hDLb1JgQliKXnmtbrAm3KHMpc9t8I7g2hEC5TqPFjiGic/PWpw0tRFwEL1CgkFEJ5hLFFb2wKYCUfh822IJjrJjuWoawxfWf4WA74Tz/mptlAPFZACKWv524SvaXQ4d2yEOmRG6SWk1SdZnXRz9WCzzIk1I/42hOouOZPFVOgqjMnU3K0jR3ZHdTSWX4SLh1Xuq9477z+QUgz2zuOd3WxLJV7lC28pWHcL38pf1Ma8cDeidPoFJLHRPz2w08+TRUgPqccBwcqMpyg1mdOOsJH4RyuPyQhBeDwDyO+WagMUKhLYZNsFJlXPFnzj6/sL0YLZNLkywnYT7eHWuPceMn6E79IG2qmXy/rUO9siZJbc1+54mhx8YuAnWffFWkakjx4bUXnZbu1u3aqqlbVgA2Y7MOmJzu6FIKlkjvOaIxUsLDfZxRq8LD3eFvbDqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(66574015)(2906002)(6506007)(38100700002)(4326008)(6486002)(53546011)(66946007)(66556008)(66476007)(110136005)(6512007)(54906003)(2616005)(5660300002)(8676002)(8936002)(26005)(44832011)(478600001)(316002)(41300700001)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elhxb3Nld1Y2VDcvaDc3WVZJcTE2UzdndmxzUE5YckZJS2QrVWRLanQwZzNa?=
 =?utf-8?B?K1plOVY0YVZMNTlaQ0diSGJBdHcyaTQvaWpub3F5WXZiOHBja3BZdGNHM1kr?=
 =?utf-8?B?N0xTYmZSc3hJLzRKY3V1R0pGUm1WVVVuQ0I2dko1M3llNGgrcTJPWXRHclBw?=
 =?utf-8?B?cDNLSjFJTzNtdzJCQ2xTcnhsdkhNa2N3TzZRajFoYTRNS1E3KzJpSmhId0N5?=
 =?utf-8?B?NEo3eG5UNVloMGxCUThNcEl5RVpXMFJFSm9aTUl4OWNCNXJjQkFqb1VBdTl5?=
 =?utf-8?B?ZlI2QnNCTktPWkNKZGNVeWN2SHZnTTQvWlNtRjVTMExiY3lIcDdSbDNKSEY2?=
 =?utf-8?B?M2haZ2dSUVcwOGpOZEptWXRYQUs5ano4bHdTUlhKYnpXcnlsM0NRMy9iTU9E?=
 =?utf-8?B?enNMMnBPTnRZOFZQbEpINW5CNUxQR2FXOW45dWVIaUI2SE1KOW51aFcyNXlw?=
 =?utf-8?B?TjZWczY3UGVCK3paUTNFYVVpQkZISFNuUlRxZGorYmVHb1k1cGdNMlN4YVJP?=
 =?utf-8?B?OHQrdUlhMEl3S01QcGFJMDNVc2liL1M3OVJ2ZEk0SjBHZU90bSt5NklwNjdT?=
 =?utf-8?B?R3FBUzBrM3gra3RjY3FnVVBZbzZtT3psYjV2VFpZUkxqamU3eGNubWJTb0ww?=
 =?utf-8?B?bHV1alIrQ00ycVhmQmp3VmN5aHdRZ295U0lZM2lDRll5RFF4Z2VhQXVHSU5v?=
 =?utf-8?B?RDd1T3JNbnh6ZTNDUWx0TmdkZ3AwR0o5c1ovcVJMa2RxeWNMbXRQRWg2REIr?=
 =?utf-8?B?UWEwcUFmRmFOWW9relVmVnFQVmRlNjZ2elcwaS9YTFNqbDBmN0l3UU84L0Qw?=
 =?utf-8?B?dEJocGpqekNnQ1BSb0FJN1ZCaDRLejdXaTB2cDRLcFdMbzk5dDZ2Vis0Rjlk?=
 =?utf-8?B?QVR2akRWcEdFSk0wYk9QY2ZiZHBIMkcvSjhKVEx1L0t3M3BENmRxSDc4Zmdk?=
 =?utf-8?B?TG5WUVBWQXlFWmtnVXpuYU9zYktCUWxFNWlzWnZEeHN1MWx4ZHBBR3U2ZkpN?=
 =?utf-8?B?LzJrM01JWDJVbEYxN0VVSmZyeWx5NFo2V2VxKzdtckl2RUNnUWp3S1NuUHNQ?=
 =?utf-8?B?dG53UklkcWQ5WDRqRWxBSTE3YTlWcmNkenE3dEVlRFM0OWplT3EwOUw3NytK?=
 =?utf-8?B?SlhQTnNZSExhRGs0andDVDk5SUsvTzBCYkFjL3VyeHYyd1BDS20wNHVNTlBj?=
 =?utf-8?B?UWN1WFpHclNBdk5DRkhtamQ3a0c3T293UTJPdEczRWdNUzNCR1dzclNrN1hl?=
 =?utf-8?B?VExoK3NuK3JvQlpJWHZGbmUxbE11TGErOWF2U3o1eDcvVDBxdWN5RmZtVnd5?=
 =?utf-8?B?SmdtSE01N0VXdkNYTVFvemViQ041YldETitIVEd1alVqVXVFRlJrSVlqWjlC?=
 =?utf-8?B?a2cvQnJNWFNaMTUrVll2Q01MQm1iNVVPL0hzbm4zcjA0bUZ1SE0vY1JUaVcv?=
 =?utf-8?B?aGZOcHBlb2lnaFA1ZmRYcUJQcU4wYzBtVVUwdWg1dGU0NWJoSnJ3a3h1S2Z5?=
 =?utf-8?B?RS9oS2RSek9aeTVQOFl3a1hGNi9Ob2FLc3htdk5kTUhvT2ZLbHN1b3B5dmVF?=
 =?utf-8?B?UEpJM1orQUdQc0xOTm5WYWpDMENVNE4rM1c3SWprdHBlK0wwNjZNRTlyRTc5?=
 =?utf-8?B?V2xldVhYOHRIK3FNNEZUazY5VERnK0NyZGRWN0VMWlBDQWd0NUhWSVFkQmNG?=
 =?utf-8?B?MnlySUp3b2pPcnkwSm83Skg4YW1vUDBrMFdMR21NOFlOSk5KMXdQRm03RDRT?=
 =?utf-8?B?akNYbkw5VFFwYUprMHBCeEkwbFdteWV1YlBsM0ZXcXRPRU1tY1plaEtKSjN0?=
 =?utf-8?B?NWx6N0xtb3Btem9JbzUrWnZnRTBkaGoxZi9uMU9LSGwwNXZiNHpyUG1uTm42?=
 =?utf-8?B?bWRGenkyVUR1QzNJNWFzRFVnWWVTcWgvdTUrUGdhMnlvdXZobEV5UHB3V0hZ?=
 =?utf-8?B?SzBQbTBMUm1Yd21PQndlc0FhTG5oYkdsZEtZY1VXeVg2YmFkU3QwcnpBWUo1?=
 =?utf-8?B?czJHYXI1b2Ryc0xseHhFWDlZWk9hL0FRbm50NithWFZWNXlXMnROTGJNdHdH?=
 =?utf-8?B?MEVmcGFmSFpvRzd6ZmFqeDhIRzNrU3lnNHNuNEsyTnlZWnVHdEVENEdrWjU5?=
 =?utf-8?Q?RU2GdUEmyZKcE24cj3BT8aOvg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26432a8e-3732-4c70-4234-08dbc44aa094
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 19:55:00.5414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAcwzkxhop+OPvdBzZN4bVD7Inw0iaFLsrNPexNe4UyA3YfiXCZ0kjaUUC4cgnSIkl953ty8K25Xx6WR6ERF2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5209
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-02 06:58, Sebastian Andrzej Siewior wrote:
> On 2023-09-22 07:33:26 [+0200], Christian König wrote:
>> Am 21.09.23 um 16:15 schrieb Sebastian Andrzej Siewior:
>>> Hi,
>>>
>>> I stumbled uppon the amdgpu driver via a bugzilla report. The actual fix
>>> is #4 + #5 and the rest was made while looking at the code.
>>
>> Oh, yes please :)
>>
>> Rodrigo and I have been trying to sort those things out previously, but
>> that's Sisyphean work.
>>
>> In general the DC team needs to judge, but of hand it looks good to me.
> 
> Any way to get this merged? There was no reply from the DC team… No
> reply from the person breaking it either. The bugzilla reporter stated
> that it solves his trouble. He didn't report anything new ;)
> 

Apologies for the slow progress. We're feeding it through our CI and
will let you know the verdict soon.

Do you happen to have the bugzilla link that this is fixing? It would
be helpful to include that as a link in the patches as well, to give
them context.

Harry

>> Christian.
> 
> Sebastian

