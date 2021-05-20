Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7D38B16F
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 16:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FAA6EB4F;
	Thu, 20 May 2021 14:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4896E402;
 Thu, 20 May 2021 14:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rv7r19rkGx7dL5Tr5mWyWBtdfGrExAzrhLwsCi0fVZsyfj1JQmigFVz9oimq2IX81w8zn3cN6ZhpvfznZjbM0QnkOumSbkvRHUCEbrluBs3CIR50kn0Eksl3UV6QIdfxXnH38W2tsntbH4zV0Ux6PrbRhJIzwg1ip/MfwF/bIJj1NhKYEDbeAhwrmGKKuI7ogC5tnMrg1PJ0foG2wCiZYfEyHmmjpt+tM992meIgMGwnD1+TYuIJBHIN7mkTJ4vxRrmkhjkEcX5Yk+3dnLbDZAdUqm8uAbpJcrJ9bab4MLxtFVDQJ/ZL54eVzPhQ9hFxcHrkG8eSrOkaGJXayHVHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMIywHWHrY4LN+wB1PlsicK/MBqhLdjOQwwD9cZOmE0=;
 b=ZIhHeC8rICEDsQjHhhYHytRtbJQjqfE5H/hgYVFLmCUNVAeM/UfjxWiR2flJXOgKMe+n7I1uLal4A8HlnYHbYtpCkLaMnPLb+ufCiqM151W3uAz4jfqNhdcJ6yxXMyIX1y1iaF/HieRtTSAjQz8mAdJ3HjzRHpDQoQ9z+WyxdJIebeq1zPzjAI6sTnWUuOMlyBvw/Q2fKSKfCHOsM//A7pYUFHw3IT5iX5v/tVs+SY5BO6Wu/k8CL8eRU/l7u61V7PX1zhp8aXNBIW617rx+aDQco+9kTIU3y+THTf9nbRHVKNkD46CV+EKv2MEdi6aIorvTKbgGxlq+TTiDMxEong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMIywHWHrY4LN+wB1PlsicK/MBqhLdjOQwwD9cZOmE0=;
 b=wLX/eKtKexvN6AizrUY33sgvO5IwKU0I+LyO15KPbWDX/KNd6v43OqOW3FHY4TJEhL7Rt+FQncKpYCLYBhuRZbbSYAifmNmH5Svtt4nHFh3SaSSo6lUWYntLk4WuByDW5pJtpcTLuOFgdMMOWRtxGaT+TPSJ1GvOp3w6aBaFQKY=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 14:12:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Thu, 20 May 2021
 14:12:51 +0000
Subject: Re: [Intel-gfx] [PATCH 0/7] Per client engine busyness
To: Daniel Vetter <daniel@ffwll.ch>, "Nieto, David M" <David.Nieto@amd.com>
References: <c85fc53f-d25b-464c-d411-eed4a509a009@linux.intel.com>
 <BYAPR12MB28409E25DEFD3DD620E596ABF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <BYAPR12MB284090FAC1C6E149F0A1A0ECF42D9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <mysJHURIfWxBRBabIlnunj7LZNkkRQ-Knu_o6v7GZI4xCwGMZXn0rvjscl-aTT_d-ttlAQgJOG3gP95DBd_dxCPQNfguTSdrltxPrKt2FGs=@emersion.fr>
 <7f8fc38a-cd25-aa1f-fa2d-5d3334edb3d2@linux.intel.com>
 <CAPj87rOL7SEVXoH1rWH9ypj7idRmVPLXzmEsdVqFdVjsMh5PbA@mail.gmail.com>
 <71428a10-4b2f-dbbf-7678-7487f9eda6a5@linux.intel.com>
 <c22608a4-b84c-a3a4-0df1-448312b1292e@linux.intel.com>
 <CAKMK7uF0fHBoYfiTS+-80RtUeuKFUcYDBpGHtNY6Ma+aJmmkxA@mail.gmail.com>
 <BYAPR12MB28404674622BAB65A9257D1FF42B9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <YKZt+x6as7ix6TPy@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e086fbd7-5d37-c8e2-0a49-c6c646faf309@amd.com>
Date: Thu, 20 May 2021 16:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YKZt+x6as7ix6TPy@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4635:589e:67a4:e02a]
X-ClientProxiedBy: PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4635:589e:67a4:e02a]
 (2a02:908:1252:fb60:4635:589e:67a4:e02a) by
 PR0P264CA0257.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Thu, 20 May 2021 14:12:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0dd6ca4-4091-49ba-fe5c-08d91b995ab8
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4961E6D251C6274A73D664C9832A9@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXxSPkhE5I/jWTwovXOiDQ8XbLvu+RJWT74aOyyY+0A5rJtQI00NTfEMdLcmX/eJ2spLWlFCX4JUJnlVm5KhbPdCxSvCnxYxnYbeet/win+CoJTdfT0+Br+M42rrfP3+qBDOFdbkb8UCmurXx9+jHUeoSpf82qFTNoqZ9grPq2o7iywiPbAVEwOqn03h4lRTU0oJcj9KP1Xos2Ilo1c+/hejqgo8bBd8ZmWC+JDoL7HXM8XsHmpZjMo90rd1vzh54bZGjABds9g8lg5EY79QSD6srOwH25pwJrFk64RKlRgtrfPRSrU9okxTf7LVEC0lIevEgpl0nJ/BWRm2IGcF08aTlBXaWmifkisswefG1zNiD6TeahGlB4qP+5aQyhQmdG2/NXDEhJcZ3l1RyBGTxbGpQfj9eDCgVXCFExsff4DmrRMIVtmRbccVZuZI53Db/LrCG4EKq96sFhi7HvphuOisX8Vwf74ojxDOvzfqhbBpI3aiGv4/3A99OwtoDtFx1eeDu2Ov3acml3QG8k5byBIfQoA2icHuEXqfdxngT8lXTw+GaKyxHjQEkC8URFIP1TdC0MbNMCDFJcPFPKyc7hDReW0aMrWWmSCRM2yMkemgZNT1LeI5S+LyvidKSUMfOd9quTk8r+Iht2p03bxAkLQ0tiNUtpPkBNBSGDGowOaJhx5gkNdPeW9P/w3xlkduHUMwwQ4G4XJWCIYXiInnm2SVDGNMrOqB3qAnJAQDdLEu6yGOJRG4Bfq45Zt0i7826SlNjefXBLwQp8h7fCWk3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(39860400002)(376002)(52116002)(31696002)(45080400002)(478600001)(83380400001)(5660300002)(53546011)(86362001)(31686004)(66556008)(966005)(66476007)(66946007)(36756003)(2906002)(110136005)(6666004)(8676002)(316002)(186003)(8936002)(16526019)(54906003)(6636002)(2616005)(6486002)(38100700002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3dUbWhaY3Q3SWlsUGM1VUhieDRPNGRTQzM0MVkvb1RTUzl3ODB2N014SVpn?=
 =?utf-8?B?eXBJNTV5UVU5VVZIS09pcGlhQWRYK1hqVWcwSVNzOU9tUWhWcjhjcGw5Q0M4?=
 =?utf-8?B?cHh5NW5GZktUbS9FUXhkb1RSWDM2RVZ5cnJIa002U2Nub0xMc0pJR1E3YTZa?=
 =?utf-8?B?SkdvUFBTalRockNtVTdaOXBlTVliL20rM2ZoMnFyTHpzMXlwNHJDbW93QjNu?=
 =?utf-8?B?dXFGNlpoWjVTTWI4cVdkZ1Y0ZzFiWElqUVR6S1ZTdlRuSmxteG9EbWhmVXYz?=
 =?utf-8?B?NGVXbHZFRXk0N2pMdEd6N0F4T1l3TTB5UXpZS2duL2hucngyV0ZnU2l4bGRN?=
 =?utf-8?B?WnFiL3lhbGRibGMxMk1FejBsakZIL0g2NVgrdnRuK0hlblFJZUw5UXJnQm54?=
 =?utf-8?B?MnVMMEVWWGp4cVFKMHhacFNGRGQ3V2VqYm4yZnRDcGNTSWhiL3V0d0ZuaC8w?=
 =?utf-8?B?THg2RjkzbzZqWFZ6d0NUTEZTQVhNSVhTdlJxN3FBYTZud2ZsV00vV1dhTkIy?=
 =?utf-8?B?SS94UG95cHNKbU1nQjl4TkxTWmtPb0hTRFpRZnZmSC9LZmJLQTRaTlN0ZC8v?=
 =?utf-8?B?ditsd2JVdjB3MVU1Ri9maGJ1SUJrdExKQk5ocFV6ZzFFUmMwREJMMXhXQmY1?=
 =?utf-8?B?cmhQU3dSZTlkZzljZ3o5ZzBHREpVMnNXaGJ3NlhUZ3hIditBbm00SmE1cngr?=
 =?utf-8?B?b0RLL1dqT2ZPL0NFcExTTnQ1T2R6dzRuQU9OYVdzNDVzWEd0Y1pSdVZFMFda?=
 =?utf-8?B?eTBnRmlrUElidWo2cklvZG5uQ3Ztc2xkZjVIeSs4YzdzQzBjZlduUFRVOWxh?=
 =?utf-8?B?SjdSYXFnU0tET1p3Y0d6aDVrTjZuUHUzQkxFbEw1RTUza1BCQXB0R3RVbTEz?=
 =?utf-8?B?cUdpT1RxM1ZxOW4yODVyNmpLSVNuUnQwWmdFU01BRjNpdkNDaTliWUwvUnlE?=
 =?utf-8?B?UkRhYzNwclIxaUU2cTErcmw5TThtWWM2WWl4b2RsSG1Ec2RlSFh2M1BvdWlC?=
 =?utf-8?B?NlV0R1ZjRmZlZnh1UXJveXp6emhEZFl4cWI0ZVBjKzZtRVl4N3g2eUM5ZXpG?=
 =?utf-8?B?d1NSZmR5MXd3ZWRHRkRMOHljbTVReElQQ1lzejhvdUZPaTM2MTlVbzVDQ0dP?=
 =?utf-8?B?bzEvTW9Bd205bTlyNjhZR1c3WXpoanprNDkvNFVQdFhNc0NXWW1rblcxenB6?=
 =?utf-8?B?TUhCUnNWQkpkQVpHc3g4eFZteEh4aGUxam50K1YwRnFnYmdIcENHZU45c1c0?=
 =?utf-8?B?UDJoeHRXSTdnSDhNUEYvU2ljaFU2d3AzejBwc28yL3F2WWFVQ29haEpCQTNC?=
 =?utf-8?B?M1d2SlZYREN6VEp0eEVGWjRsOUwvUzF6aVBGZWZMN0k1TEdCdE00WWNkNWg2?=
 =?utf-8?B?SDRqNFhoZ0RlajZqbW5BTEhCOXNhN2R3b1JaU1djSnpJVWZ2MU9aUC9ZTG85?=
 =?utf-8?B?QUx1a0RxY1p2aTNwMjVpSmFHRjRLZndON21WMjFQNGhsMUl3TGJjZkpvMjh3?=
 =?utf-8?B?V1BaeXAweWF5dTZLYUZzZjI5OE9zL0dHMUFWK0JYTW02bmdkQ0pxRENmWURO?=
 =?utf-8?B?U0J1OHZJMjVmMnoxSmZURDRtRkJONG5lT3M4WHBaMXMyL0xuVVkxQlRHanVI?=
 =?utf-8?B?czlwR04yYytrT1FodTRGcjJzU2FJWjViVmFVVUtQTUMwbk9XaGlKN0FxblRy?=
 =?utf-8?B?OStQQVE4eDlsejBRZi9ucGUvWWVLa0l0c0NqQnNQRkRadVE3NFF0L1RZSWc1?=
 =?utf-8?B?eDk4SytNdkdoMFg0ZVlvSkliQ1kvWThGNnlHZjRPSCtrOU5BdlZnRE5xeG5a?=
 =?utf-8?B?ci8xQVk1S0ZmSmF3d1NKVklFNmpHUVUvcDVNcmpMYnViSFF2N1JmcW5wUEJO?=
 =?utf-8?Q?O1yamhr2YS8xx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dd6ca4-4091-49ba-fe5c-08d91b995ab8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 14:12:51.6544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZoI0z4JJnhzyuu4rKma8WIXk9AHE7AmabN9RoJuVD1ci4o2/L0u6fsERyJEz9qF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "aritger@nvidia.com" <aritger@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.05.21 um 16:11 schrieb Daniel Vetter:
> On Wed, May 19, 2021 at 11:17:24PM +0000, Nieto, David M wrote:
>> [AMD Official Use Only]
>>
>> Parsing over 550 processes for fdinfo is taking between 40-100ms single
>> threaded in a 2GHz skylake IBRS within a VM using simple string
>> comparisons and DIRent parsing. And that is pretty much the worst case
>> scenario with some more optimized implementations.
> I think this is plenty ok, and if it's not you could probably make this
> massively faster with io_uring for all the fs operations and whack a
> parser-generator on top for real parsing speed.

Well if it becomes a problem fixing the debugfs "clients" file and 
making it sysfs shouldn't be much of a problem later on.

Christian.

>
> So imo we shouldn't worry about algorithmic inefficiency of the fdinfo
> approach at all, and focuse more on trying to reasonably (but not too
> much, this is still drm render stuff after all) standardize how it works
> and how we'll extend it all. I think there's tons of good suggestions in
> this thread on this topic already.
>
> /me out
> -Daniel
>
>> David
>> ________________________________
>> From: Daniel Vetter <daniel@ffwll.ch>
>> Sent: Wednesday, May 19, 2021 11:23 AM
>> To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Cc: Daniel Stone <daniel@fooishbar.org>; jhubbard@nvidia.com <jhubbard@nvidia.com>; nouveau@lists.freedesktop.org <nouveau@lists.freedesktop.org>; Intel Graphics Development <Intel-gfx@lists.freedesktop.org>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Simon Ser <contact@emersion.fr>; Koenig, Christian <Christian.Koenig@amd.com>; aritger@nvidia.com <aritger@nvidia.com>; Nieto, David M <David.Nieto@amd.com>
>> Subject: Re: [Intel-gfx] [PATCH 0/7] Per client engine busyness
>>
>> On Wed, May 19, 2021 at 6:16 PM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>> On 18/05/2021 10:40, Tvrtko Ursulin wrote:
>>>> On 18/05/2021 10:16, Daniel Stone wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, 18 May 2021 at 10:09, Tvrtko Ursulin
>>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>> I was just wondering if stat(2) and a chrdev major check would be a
>>>>>> solid criteria to more efficiently (compared to parsing the text
>>>>>> content) detect drm files while walking procfs.
>>>>> Maybe I'm missing something, but is the per-PID walk actually a
>>>>> measurable performance issue rather than just a bit unpleasant?
>>>> Per pid and per each open fd.
>>>>
>>>> As said in the other thread what bothers me a bit in this scheme is that
>>>> the cost of obtaining GPU usage scales based on non-GPU criteria.
>>>>
>>>> For use case of a top-like tool which shows all processes this is a
>>>> smaller additional cost, but then for a gpu-top like tool it is somewhat
>>>> higher.
>>> To further expand, not only cost would scale per pid multiplies per open
>>> fd, but to detect which of the fds are DRM I see these three options:
>>>
>>> 1) Open and parse fdinfo.
>>> 2) Name based matching ie /dev/dri/.. something.
>>> 3) Stat the symlink target and check for DRM major.
>> stat with symlink following should be plenty fast.
>>
>>> All sound quite sub-optimal to me.
>>>
>>> Name based matching is probably the least evil on system resource usage
>>> (Keeping the dentry cache too hot? Too many syscalls?), even though
>>> fundamentally I don't it is the right approach.
>>>
>>> What happens with dup(2) is another question.
>> We need benchmark numbers showing that on anything remotely realistic
>> it's an actual problem. Until we've demonstrated it's a real problem
>> we don't need to solve it.
>>
>> E.g. top with any sorting enabled also parses way more than it
>> displays on every update. It seems to be doing Just Fine (tm).
>>
>>> Does anyone have any feedback on the /proc/<pid>/gpu idea at all?
>> When we know we have a problem to solve we can take a look at solutions.
>> -Daniel
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7CChristian.Koenig%40amd.com%7Ced2eccaa081d4cd336d408d91b991ee0%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637571166744508313%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ZihrnanU70nJAM6bHYCjRnURDDCIdwGI85imjGd%2FNgs%3D&amp;reserved=0

