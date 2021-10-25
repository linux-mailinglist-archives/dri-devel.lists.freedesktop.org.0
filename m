Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B03DC439461
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 12:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4298789DEA;
	Mon, 25 Oct 2021 10:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830AE89DE5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 10:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOjNh2QW9volPG9ADufu9lBBbl+PfGx073X/UuExsbOD7JVRtUJAfCYkzbC5ye7Uk4fUb89wapm5972GsjzJ4MJ4VtZQL5yhvXotOny69GFioCE9+HcdtR380yWuWZU7Lta8QnG2vO4gLN0hdFb391c9NmmBKi4ZLkNq5MLgO7XXiCln9wyioXwBWBfmxxnRAHGxdnyGnBlIHmi9hD+yWZzldhaBfBDM7dDB/J7YRG98G7P6Mh7ltIZhuc3ROegSNhFu837/ByU7A0gjbyQ4ljCFHVzsV4Kap/S32YylJCdcrfMORrkk8HFfWMDHJjlgcRXXEJs4PNFNfc0zGL0tuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+Mv/B6795aUAWrhlrRJo7tdQ3QiHvRiaN0PoGNXFuk=;
 b=SQUlWdveiWMU5JNZoXs3zqphyqHI6eZneq7TFVeHvMQWDxZP7TAcNXIjGpHKHlvJQeU46IYFY/3nbDnWRaGZouy/BB1dRvcohI5Kf7ijce/pRFefBvmbe6IAKtYv5iZO24QnV5xylFy/cVQ2fsmKfORKXDiB/cTUiVYyAHCElUYMHbgLT8TMQfWUzIZZ1/HAx2o2j3Q7AmkGNnXGRxdL9rzp1HT1xnHpMIYUGQDcgMx1pbQF/Xqxqo7SKFdWUM8v9jLDf2E3D841aMX4DxTMKQbAz7pGWfgTq8DCH3Zi5afJRI0JinHFVwqQa+lLaGJan4FzUFXtC/giK19i8FMqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+Mv/B6795aUAWrhlrRJo7tdQ3QiHvRiaN0PoGNXFuk=;
 b=OnI5hPsV5xf35Ja+3c9988CS4JTfU81MLoxKf+bq9UmpE5Aj+uuXOHK3Hp0qlokdQxfZ94R+YiNiI8ghuTsh/xt9nF9I9Gm0traYpqWPXFTXn3PyoaPVasr4cNhgEGf/dUoZ616feqj183B9TT9oX+Jki2qfLsdNlmMtcy8LdzI=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0112.namprd12.prod.outlook.com
 (2603:10b6:301:5a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 10:58:59 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.018; Mon, 25 Oct
 2021 10:58:59 +0000
Subject: Re: [PATCH v2] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Xinhui.Pan@amd.com
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>
References: <20211010124628.17691-1-gregkh@linuxfoundation.org>
 <YXaIx0g/kHEnq8ZN@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7328189c-0567-847e-17e9-e2ed4f3a78f4@amd.com>
Date: Mon, 25 Oct 2021 12:58:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YXaIx0g/kHEnq8ZN@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P193CA0013.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::18) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM9P193CA0013.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 10:58:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d277fb29-60b2-4845-da71-08d997a67258
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0112:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0112947EDFE319039EC147A983839@MWHPR1201MB0112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fDCtOl6C5395+f1ATv3cDRjzf4VSwtfpbh3WKsYgZh4rgR4CZnl6JqSKa86T7t1tVMzBCotHSlQQhELjyoEX7vFg87fQGmm3M33T6VxCqsJjGYsmQFx1/kK4nkvL6Y/ARG1i4YY4aHkUY6O1bvvZRPrgPHazSde+bXYE68NnRgsXPtwWTCY+XjCgtCvWoYphhkTUMRJ38cccb+IsdVqGTTt9d9ZSUz/qdAu9n5DvP1ceXvjAAT0lCGRLEuCA2Q0KyKr1eJK/MZHDxQwnz6c14lrHrDaO6z3xnVwMy2Qp0mpy9WKCejtsYGF6Us49gWjhuqh+uBBvE4RZfmOl0LoBkWZprn080dwCFMLJk2SK3GFYBGRkZqDxiQqNq3PdrU10O/bAFFpIkitcNepXFU+e5FJ4EAGoH61XqT039ge9jJ9Suipl7TEvgSlDMWbm7jiyVyaVIAQ+wRwhHAhgrx0ysjILcnB/HIHfN4EN7kUit1yIvrBLmP4TYKAreLok30aGujamZ3xrK7KQEz7DPfFzeQfYIy8lxPBz7HGJwtkPU0epDu8yiPY9F6f+DJtooYbNFwjqHBE5F0FndbMV6Xgmq/+PyFMvmr3zPwG9ktQADjxjWXvT1T6ZAAhosKc2BNdikcY53cUYBaWVR4LA9g9tww10yFJkAkWUPZJfxJxdA467WFQL3+VL8ug3xV442XiEGM5bhyTQvh1//ez7HLGo627kNlEAFuDj39EfKGKgfB2dt/IAkYrVHg/v32chrWm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(6636002)(31686004)(6486002)(8676002)(956004)(316002)(508600001)(5660300002)(2906002)(16576012)(6666004)(4326008)(36756003)(66946007)(110136005)(8936002)(66476007)(2616005)(7416002)(54906003)(26005)(66574015)(186003)(38100700002)(83380400001)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0QvRS9HUlUrQytwMzRoT3BYeVNYS1BCS2tXTVBQci96ZUY4ay9zVjJaLzBK?=
 =?utf-8?B?ZHhnQmtUemt0SG4rejM2Q2x5ZjR6dFAwQWpJcDVqTVl3QjREVVY1c2pNZHFN?=
 =?utf-8?B?WEtzZEU3TWhCaVVXaTZUSTFtOUR4VEhWTGM5bkw4Y1huOFV3NGNmM0FlS1JO?=
 =?utf-8?B?SUpWNVUzbVdOeEx5VjhnRGFEVUtacWhzbCsxNEdFcGNUc1pXRmZjWmNoVFYv?=
 =?utf-8?B?eTVqQldsM2JIVWFxSXlDbWtFTXRtb2NNakR4ZFFpa0drVGtDOGFrTnI4d2J1?=
 =?utf-8?B?VC9tTFRxWHJreHRUSlMrRVVHa0FpYndKamRHQ2xZYXZDNVU2WTlmRUdTSjgr?=
 =?utf-8?B?SENNSGpHZzdRWXhabWhhRmJlazRiS3BwNmRRZHNEcTgrUVU3b1dMMFBoZitL?=
 =?utf-8?B?RXVRczlqdDR1YUROd3NLNTVmRlA4VEUrUHByeDRNM085S0RjQkZpVVgweTdv?=
 =?utf-8?B?ZEcrTmtVV3VtN0k1T2Noa3dHTk1wb05SK0g2WURzNXVMUmx6ZCtjdTRWWkc3?=
 =?utf-8?B?VzFSTGI5NDNibDluYndDYk5BZnpsTGI1RnhKanNDT0hUSW9kaGVyKzZuZzQr?=
 =?utf-8?B?NlppYmRZT2RXQ3Q0YUJUcTl5ZEw1SzdXeGN5MUVHTXp1Szd3a1R5UHBHbTZF?=
 =?utf-8?B?by83NGpyZUdRK0xkL2dpVDUzUUs5NVAxblhVUHlJNWVaUHA4ZU11QWtleTNE?=
 =?utf-8?B?d2ozYXlGZGR1UmEvU25XRG4rb1NhcCtLOGxCWGRET21odk5iaFFUMkJVNDR5?=
 =?utf-8?B?SGFaSkxSaitaVllTWUtNUE16VWtmRDlqMjhNNGtLWUdZS3BuQmZkNjBkcm9w?=
 =?utf-8?B?NDg3dFYveFBUU3U2eng5UFBkeENXQUFla1puV0NldFcyaSs0TXhZZ2Z1bm01?=
 =?utf-8?B?UXd5RThJenBUNmpBMzQzeERnRDhRWXRYUWpWQmF3Zzdac2JFOXVjMEpiZDdC?=
 =?utf-8?B?N3RTRFZ3RkxETHhqOGh1OGdycCtJOWYvOTZYeWNEU3BtRDlNZjhrMStXQ2hm?=
 =?utf-8?B?S2Z2NEYzNGZITXF1ZjJmakdhRzJpWDlKLzUrRy9ZZkg1d1pKVndvOTQzeStF?=
 =?utf-8?B?K2tVcW9sd0JXUis3TGQxTktVQWM0b3Iwd09GemFIeFBSQkpCNzdZdGYybnhp?=
 =?utf-8?B?Qkl0OTZEUnJnY0duSmY1N1F4WFNNL0ROc1IvVjRjc0ZScTdJY2J2YVIySkha?=
 =?utf-8?B?ekNkeHR3Z283d1NTV2pTcmtUMUEwUlFlc0NMYnVZeFh4cTQvNm40dlBTT2cx?=
 =?utf-8?B?Q2xXMkJvRmxpZi9YZ2txOTFiS2hTY1dMbU1mZWkxZzBuQzFtT05iWDdGSmh5?=
 =?utf-8?B?dzFwK0ljM0lBbVpmMEhqYWp5Q2lGK2ZtTGpRZzVNTTNvVUJJcmQ3d3pmb0t1?=
 =?utf-8?B?SVMxMyt1cGYrWm90V3pkNDIyY0x1aURtZ25zMjBIeEdhVldLbXpSMHBGeFQ4?=
 =?utf-8?B?Y2p0VDE4K0tnYkZWWXV5M3kvR1dhSDRJL2tXZm1RZjdRbXJOOGdMQXlnbGZP?=
 =?utf-8?B?aXIzREpxcVJjZnFOdmJFRkw5Ni85Q2lValZraFZodVp4MUJsSUtENWxFWTIv?=
 =?utf-8?B?VDk4QmJuMkpId1cwaGhGOVlFbDFvQmxoaGR2L2pPZjFlc2RHZDVhdzZueTk3?=
 =?utf-8?B?MG1kWVBwR0d0K3cxTXMzWXcvODFScDM4UXBFSkRVclVHU1A3SEhGNXE1WmNi?=
 =?utf-8?B?d2ViR1FmYkNtQytsOWFWZGtSOVpuUGtkdjU5UTlJUG5tM2wyMzZ5dldXU3po?=
 =?utf-8?B?VU5SWm9weVVjZE4xK0x3YS9ybjBmKzlFbzJNbWx5WTQvUlYvSngzU0QydW42?=
 =?utf-8?B?YnhkTHNGdThFVzY0cEdUbFBsSThzdlhxd2FjTkJ4eHUvMkozQTVybmdybnhu?=
 =?utf-8?B?M2F5MW0rRXBpZVNTSk9qajU1MXNyUU0wWGEzQmhjMUxXSVpsL1VpL2JSMlZ2?=
 =?utf-8?B?RVdvaU1NcEtuTTMyV0t3NlJpQktZbDNuYk9VeFFIa2QwZi9KYjUyWG14M25S?=
 =?utf-8?B?THpqTXNyb1V1MmpjbkgxSldYRjZNY1o2azZZejExbUQ3SGY5QWxud2lJTlBp?=
 =?utf-8?B?aUZBZW9FSXFpMDUrSzZsY1Y5VklCK1VYM2J3eTIrV1UybUlKdHdBKzZnRFNG?=
 =?utf-8?Q?6nkk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d277fb29-60b2-4845-da71-08d997a67258
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 10:58:59.2485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tfNHcYM2sjOHHj+Q39Mr09O/l7vQV9WNZzXFb6mduBXwR+M5bRZnjcAzWf90EYs3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0112
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

Am 25.10.21 um 12:36 schrieb Greg Kroah-Hartman:
> On Sun, Oct 10, 2021 at 02:46:28PM +0200, Greg Kroah-Hartman wrote:
>> In order to better track where in the kernel the dma-buf code is used,
>> put the symbols in the namespace DMA_BUF and modify all users of the
>> symbols to properly import the namespace to not break the build at the
>> same time.
>>
>> Now the output of modinfo shows the use of these symbols, making it
>> easier to watch for users over time:
>>
>> $ modinfo drivers/misc/fastrpc.ko | grep import
>> import_ns:      DMA_BUF
>>
>> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> ---
>> v2: added lots of acks
>>      added 2 more drivers that needed the change, as found by Arnd
> Ping?  Any ideas on what needs to happen to get this into the tree?
>
> Or can I take it through my char-misc tree?  I seem to have a bunch of
> acks on it by the respective maintainers...

I could push that upstream through the drm-misc-next tree if you like, 
but honestly char-misc sounds like the better approach since this 
touches a lot of drivers outside of drm as well.

Thanks,
Christian.

>
> thanks,
>
> greg k-h

