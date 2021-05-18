Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E9A387C3D
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39FCE6EBA1;
	Tue, 18 May 2021 15:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE986EBA1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 15:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+KhKWtB2ijr2cBrCGCQGuGRa6aHQqTN26BYP/ZVVxu9Ek1E2cEZa8COLmhAxJyU/UKAZOVxQnUF01CDCttjAhub3+R75wDwlgo19ml0D8Eua1W7SiA+hit7iul8FYBhxNLO+kasdC9pcuK2kqIR2fHYXJN3k+KyAFqyvrWcrdr7V01gF8nkyMMYH7re/uLh08VThuWRqKvmlhQiCA6U2P3hFmB7p2KXJLW3MUdUVOhhiBwS3EQmFvLSy088ldUs6IgvWXuAhbshQmDUhXBJkLaL7E/4Seu/3UcNifOHTgiOpym4rFh2avDxS1m6sqaoBMgnSJC83pcX3gHpRoL9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmctLURO9IkPHX4sCsJUISffK6UMkYh/PNk7XF/II6Y=;
 b=IdVsSm7gH90WFyP/3MCu3oCsyGjgdDF4y5K6mf0fpznNGmCQEiTeJ8rLD9cuNIWAae+1q/JB7C4zi5zlt5+mbqmzQOwDjbiBQ9jtl2yqVrxgLAlK1ykNVbsJa6OJ7achF0vtR0+QluJnFJXWULu1KYV4aAqBz9dE+b+MIPEyeq7y1CJHRK1Y7DtMuEbkh+5UWpu6d4hI+wORsLDwhLnfsCOZO4hR78DQO9nXW1nBS/yacvSGMNsrc0rN2rjGbOU8yTDeEWL4R34pzewab2RimHofcsg8IMUY0NeVhCUWww7n/tkZWh4SR16X1b7Y9KAI70rEmBYDGvCxNE2j5ilRag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmctLURO9IkPHX4sCsJUISffK6UMkYh/PNk7XF/II6Y=;
 b=yYTEu0WlCsoLgkNE15IqTi7Z487CTEQtRmwa7wvd+rF4KyHnwB3uIRKTbw4+7EB3/u4wpzYAQbcE8UzOVemxSNAAZlh8r3/GRWsBl2ncsT8J7g+Mxg8v0bBstFUG+26CldTNBESlKtAkoK9Jjz+Pu06qzXJWdGA1XhXEUjhhhyI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4900.namprd12.prod.outlook.com (2603:10b6:208:1c1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 15:17:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:17:27 +0000
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
 <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
 <0beb46d3-96c8-dcfd-6540-e23ff7207888@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <151faa7d-c4c0-4f8b-f127-9e82a5432774@amd.com>
Date: Tue, 18 May 2021 17:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <0beb46d3-96c8-dcfd-6540-e23ff7207888@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3b27:1830:9671:4cc9]
X-ClientProxiedBy: AM0PR02CA0082.eurprd02.prod.outlook.com
 (2603:10a6:208:154::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9]
 (2a02:908:1252:fb60:3b27:1830:9671:4cc9) by
 AM0PR02CA0082.eurprd02.prod.outlook.com (2603:10a6:208:154::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 15:17:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2db2d6a3-3940-4a8c-f0c7-08d91a100bfb
X-MS-TrafficTypeDiagnostic: BL0PR12MB4900:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49002987BA9003A36CF815F2832C9@BL0PR12MB4900.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vb9rR/pXPFC126ekWV87VzyovyAS3/bfVXi20rHppHgn1Hu5Bv01JkkMHh+3llChceNtnO3U6VZi27Bg93snXb5qqWZZ0j55L9/gShAWFMZb4MlFTR/clli5k4oZBr1QzE9fOWDACLtn9RWidqCF68L7gNFG4z9xmFIUvdU8KmuvsAUAZab0n5A9QooCXAJoKgPmnzVf08ZRfvCxXlSmXn1OcWK8/DgAv9jroxOZ3JJVhTQ1D74m7uk8tmXmglpeWmfHgjFi5nrNdNLNCmomxArDZS3Fj48Dl/SrpFncOM2hjClsXhGKG1VMnoDzk1H+QYFt+L/8DvXkJxldL81xmYyzVBUrTC98C1LBMqT6EBQdR2Qkf57OGTA0a2Xyw4JFsWM6XwJG0nJD63L9V5XjODzTNoA8TJMLOotX6UfyoyhpxZE7i585iP+Ol4vGvapbAhNLeiyfPyNQ6vvHOaXTsB4bi/QTwU0CjovyRrKMpoDd5THp0oMdGyyQNXJM0Oz0lq6BY8I+hBzLgv+zH7wHBo7eQvLt4CH23MyC5m84/RpzfmDE9/fgXzVIKoa0WJ0L1cGVCazRqMgobzMjSpbkio2ejkmFvUzVCehVWjxwxoKyOR/c/rPD8Ao6Vd77NAv3PXMe4JrXF/xPn3sTleSPv9kINSG0Jen9/XYYufd6VqX1e5rJCjKs2X7eQMsThUxw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(6666004)(36756003)(8676002)(8936002)(4744005)(6916009)(38100700002)(54906003)(4326008)(31696002)(2906002)(478600001)(86362001)(16526019)(186003)(5660300002)(2616005)(31686004)(66946007)(52116002)(66556008)(53546011)(6486002)(316002)(83380400001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dVVPeWVad2VCYytkSVlSVnNFVW9SRnU0bkJQZ0llQUtaZ09PUHp3dHMrNGRn?=
 =?utf-8?B?NVpDd3dOUjFDZ0ZYOVQ2dlJ4MFV1d0w1NW5obUVpUkM2ZzFNMEJoMEhPcHY3?=
 =?utf-8?B?TmxoYk9nVi9VWFlkYlphV3B5bkdqdmdOZzU0ODF0ZzEvRm9Gb2JmN0l3a24x?=
 =?utf-8?B?Wng4ZXRKZFVYSDJDV2F2eTFSK090OHZoWnVQOUdVUjloMzBwODIzYVZhR0FM?=
 =?utf-8?B?enZ1cFR6THZUSlZ4L0ZCc1RkZFp3dFlRWkJ1MWF5Wlh0VmFnUThDYTRxR2Yx?=
 =?utf-8?B?cWg2R0xXMCt4RUNuQU1RMm9IR0lPWmowRlUrMWRQbnJ1MU5wbjJmUXhYVEZo?=
 =?utf-8?B?NlVjSndKVUREK0g0S2tQTlFYYVQ1c1UzS0ZuYUhPM1c0UW9XcVRPcU1sUEhn?=
 =?utf-8?B?MGFJRUdLVmNDekYwckJtTXpma2U2aG5xTHROYkxnNDdQd3R0TXpQNnJSelE4?=
 =?utf-8?B?c2FySml4YWlvWW5jcmJUSGxkZ2U4YkxYUGZ0WnBRekhQYnBsYzVhd01qUi9K?=
 =?utf-8?B?TXBFMHVRZDNSTk8xRVEvOWZucS8wUHQ4MnI5UjMwenJlNWR2S015TVRoYmFq?=
 =?utf-8?B?WWs4RHZ2WWtUeENURUhBblplTUFVVE04SXZTZXpFWmdjSUY4R1RTZlpDWFlN?=
 =?utf-8?B?YkdGQi9FaS9SUjI3T1dsbjBLV3l6WUxlb1VLNDJsU05FQmRuUTcrNWxNOGlI?=
 =?utf-8?B?LzU3Y3VCTlh1aERQc3JYeXo2RHlGWFR0VlNldmhub1V5bzJGblVWVW5GWE44?=
 =?utf-8?B?ZUJBMm9aOXZubkJmUzdSQVJIMU91RjJLS09obFZxa1J5ZUlwLzJTUkVlNVhz?=
 =?utf-8?B?QUkvTk1wTTJ5bHFvdmZBL0pRY3FRa1V1OStRUm1wZnI3ZWhjYVlXZU5oUlQv?=
 =?utf-8?B?Q2N6ZFBieWM0VDdWM0JXSTJ2dTdGSnA5YU1CNFBhejlROHBFMEhobktLSlYx?=
 =?utf-8?B?eVFvUm5hRzdLVUE5cm5HM0pPZTdyZmwxZy9XanIrVS9SYnNidnV2enJ2RWFB?=
 =?utf-8?B?U0FCVXF2aTZ3VFNINHVzZHd5OGRZcE1BMnVZdHZJZ2hTU1lIS0ZRdFIwTWtp?=
 =?utf-8?B?U0tIc2N4clM2MFU3QVA3aG4zM0ZZWEVzQlpOQmRHRlNqY1pMbGVtWVViZlBE?=
 =?utf-8?B?WnVvZXZIQUdvczJSVEtyUEhndzhZRjNyMElQZ01UL3AxNkVRZ3J5Y09iL3hu?=
 =?utf-8?B?NTJFUDR1a1NXbEMydzZpdjdhUGcxdGFZRFM3Y0tzZVVCZlY3ek5ra0c1Tjlx?=
 =?utf-8?B?VjVzSVV4Vi93QWxJQWRsY2NsZnUwaW5nWkljc2FxTURMd3VqRjRLa2VyZHlw?=
 =?utf-8?B?dWFmUGVwR0dmdUJVeEJTUmg3Uzg5M3h4aVZCMXVGT0k3ZlFjbTduNUo2UmE2?=
 =?utf-8?B?TzZid1g1a1UvNnZIbE0zem9td2o5NDlkRVh2T2FBWGl3eFNRSzVGdHh2WVlL?=
 =?utf-8?B?NE9lUVl6MEtIdHJWYTVGbHFBKzBuRk9kZTQwQWxXQ2xwUVU1ODF0bldZeEgr?=
 =?utf-8?B?dGw0ZDVqYkQrWlBaUU1qem4wUDIzMzJzWGJQK0JuSjZOamVyZWdNY1dab1VM?=
 =?utf-8?B?TmNNeTVtbi9DRXd0MVBzQXpBRlQxOFhZUEtkeWd6eGhQbmhieXJHNEhZZ25h?=
 =?utf-8?B?RXowYUFLY1YyZ2UweVZ1bU0za21xRVJ1aTNkU2FDSVlwL2F2aVNaU0lQRWVu?=
 =?utf-8?B?NlZqSEl1S1FNSEE5cGw2dERPcTdpbkJYTUx1QzFPMjU2QXFhcUdTYXFCdDBm?=
 =?utf-8?B?YlV6d3VrdFB6endXVjZ3ZzZVNzdRN2doYUdNNnVvUURvUkd3dkEzU3B3U2JB?=
 =?utf-8?B?TjlqaFFyelEwaThYaExGdUYvRUIwYnMvZkVKejgvaks0SGFnN20xbnp3NUwx?=
 =?utf-8?Q?99CrfQpQOCseh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db2d6a3-3940-4a8c-f0c7-08d91a100bfb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:17:27.4404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxDTHEV8PqO6Kom9WyU8fS9pxBsVY5uQuhhhD8k6luDBo59aQF4VMFeZ7K6iDodS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4900
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 18.05.21 um 17:11 schrieb Thomas Hellström:
>
> On 5/18/21 5:07 PM, Christian König wrote:
>> Am 18.05.21 um 16:55 schrieb Thomas Hellström:
>>> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>
>>> This allows other drivers that may not setup the vma in the same way
>>> to use the ttm bo helpers.
>>
>> Uff can you please explain why exactly you need that?
>>
>> Providing the BO is not much of a problem, but having the BO at 
>> different VMA offsets is really a no-go with TTM.
>>
>> Christian.
>
> The current i915 uapi is using different offsets for different caching 
> :/. We're currently working around that by using ttm_bo_type_kernel 
> (no TTM vma offset at all) and i915's offset.

Can you instead adjust the offset in the mmap callback like we do for 
dma-buf?

That's really a no-go what you describe here because it will mess up 
reverse mapping lockup for buffer movement.

Christian.

>
> /Thomas
>

