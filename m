Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B145F5997F3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 10:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091B210E8A7;
	Fri, 19 Aug 2022 08:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B5710E507
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 08:53:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItbvNM9pdtJg89lHvEclcP8pWOgW500RJZ3pxaUtceCZux6sJLPvbLdSy/QsQigtRkeVhZmB+XHN9lR4WGNVC0BYmH4q2U42FTcoK+bIQrv75JNLtyB/LbHmK4S+a5JidgkVD7Uf0Aw29uTlr+naQkgBYuCbUtsAaJrB6ulsZZcF8JwgzeUZVdQH+5lvuDkxMeP1j3s+/nBBxXhVRX+AlrBhkYSTqsGSy2QXnxLcYbTAyo6SKRVF2jDo8iVxK5QuIWBfT/Lwn6X52VMi3/7jVbfUZbFZMPQwtA5z3Pj10kp+sEuEEUF/hM4qhhbwf89xG86Tp2b6gU6Y3Za45WhyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAJ86Ya1etuHPn/OkS/8xVzkYqS6EtbpMsur4ZWJBtw=;
 b=GC9NHlpE7YdCFKQaoOPaMky+kZnCdJsbkAeWAXVl0bkRHD8DcpKVb+kpYG5SV8mHVnm2uZcAT6mRSqiKknEYGJqJHkjoLM8hTSuy63JKu/+bVQtVa0mPGaElgBSF1JCxUjVd5eIYlM2xwzpGx8F2+3NhuBxhpcSzM8NEeyrV8jvKfcGPMghi9GX2xuGho0OuHtwPZYfxE6nhuo5HWmN+bZjmQFjQbuQDaKamq525TFBqIHD1pah23F13WyeaF6FoMEu46opZYbQbu1+0zp39Sj7bB2f9PJpJLDlI9wEIOCAw0VTyBd27eAoVChajo0bWWMp4OzV6H3Dn/53aBf3fiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAJ86Ya1etuHPn/OkS/8xVzkYqS6EtbpMsur4ZWJBtw=;
 b=xhO4Rz+pFLzBltXxpK29K6ZVMpQnpDR9DZ6E09dfVfVb8mzN4pRfwTrjRJsl55V95a9I/anT7Pv0h66KwrwPusYQL+nzHYNTgxCLrWgCbwdIO8SN8MlGXDdVC+taTPCAtZt56f5hL9uLX4ulmvUpuCg/gWCBh2zH4XAt36EpMAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 08:53:01 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Fri, 19 Aug 2022
 08:53:00 +0000
Message-ID: <e4777ea9-9374-bb46-2c5c-4e70a30760bb@amd.com>
Date: Fri, 19 Aug 2022 10:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Balancing ttm_mem_io_reserve() and ttm_mem_io_free()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <e1c2abdd-8b7e-5611-e848-f9ec551a8880@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e1c2abdd-8b7e-5611-e848-f9ec551a8880@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:203:91::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93405f7b-46d8-4c97-9343-08da81c03873
X-MS-TrafficTypeDiagnostic: MN2PR12MB4303:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ITO790Xpnv5PmtMJ+ZzaC6I5bEdKJTXRqQz2Hfr2MM/s9KWmH0KJYJ6outyemOeUzmnhya3m1gRy1NVP3r9ebLMdmL5Oj8w5grtR/LurWCmHSD41yPGVtej257oLCqNRiiK28woIgtyP7genPYS4wokQq6m3JqeSFbrBhg2DN8e65PQPdEkUr6llsTBNXJ1zMXVw3DOVwiypZiVBD4u7KURYPfcw9A8gVz9qwdc4iGn/xAb62JcrddR+nmmif1G8xcm6oMD+cZUAAPiFUGaS8DNJDSTM0SDwfO2BrrpBBBYm1LnStRC6rNtAWsWdy2BRxfm4fyISrzc9Fe9Q5n5ECnLUn9uyC3uobS1ysOd+y0iSFwUpxNragHTAG9Rk9OoESyn5RljZd//2UtNwqv73wSVNjWiUak9499+JS52+uP4LtrNSBAemlel0LjdowwqUNf3B5wigChcVjo6Y8XwmXGNW2H/HB+6PHk4jTF8InqPuQ8NYU2AifSyl9gusb/grPuWIo27ltDrERAFyRRfbJOczq2S2ZDwGvvQHWlwIH+J/lJ3upqQc+cnVot9aeutCdwFEZVjf3ZakPQHbYEdn5FLDwiYrt6ZYYLBnwSpL9vjztRJ2esk7aSXs+MnNgCveuadYVf398aRwPzndUR60A0YCOX0TvVypgHwfJkTIiK12uLWCHtHAH55UX0JwZ9CsEcZE/WvMX/DK1OL8Y+9bD1FE5POHD4Q5+OWQ821E9+4CSZdwkOwNtbESxZi1GwcaW0aPZE0H2yN9HkwoeGMjKT73UkF0b871GGU7pCl7UkQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(31696002)(66556008)(66476007)(478600001)(66574015)(6486002)(8676002)(66946007)(2906002)(41300700001)(86362001)(6512007)(6666004)(2616005)(186003)(4326008)(5660300002)(6506007)(8936002)(36756003)(6916009)(316002)(31686004)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlJHUzdrQWR5ZklyS3Y2STJOOEhZSHhSU01aZkExazZJWksyWEpTSExsOEsz?=
 =?utf-8?B?RUVZTVJsam81cWhndUxjRXdvc2dCZlJNWTdYUG14THdmNzY1T2VtMHdtTkh3?=
 =?utf-8?B?OU4wQUN5Q2FEZkYrejV4QmZDSExJaE5IVkY0ZlRQK2ptU2hLRE9haEs4bHhm?=
 =?utf-8?B?MHJOVmJFQjBDVkRydU4zWlpxbmZ2UVNHNVZ4YlNvM1ppa1RjN3RpamVUNkIv?=
 =?utf-8?B?NkhONUdlczNrL1lDMklGMTBqMGN3dUloaVdBSWpSckw2NVhxcmpVaktBbWti?=
 =?utf-8?B?RlVrQlJNMDBpTWt1N3VzbWRMT1hlRzFzZVhNY0JVUXMvZ0VrZ0xMK2M0a3kr?=
 =?utf-8?B?WTBvVWhsWjY2U1hBRjArQlhON2NiTU9GTXJSejNpNTZzTURwMElLM0dxYkF6?=
 =?utf-8?B?RXIrRXh1TlVJc3JicFhxbUlMaE5ET082elg1N2dhckpHdy9zRWRUcnJBQWNR?=
 =?utf-8?B?Y3hlbDFuUHBGVG5DeExiNW40NVpFWFBFc211bnlCTitvSVpOQUdUYTFoTTJq?=
 =?utf-8?B?TVZSbVhWMHZXMFRJcmpQbWdrdnNXUXR4a1V1cGVoQ1ZWUjNQSUp1RGU1Qit6?=
 =?utf-8?B?NkNKa24rb3hZWXhvek5IYWtjOEk1Q0NaakVhakQxVjFKWTg0NDV4YVJpZ0Mz?=
 =?utf-8?B?VmlGeGo1em52aVBJeVRBeGtIczBTNHorRG51YzFsRS9YTFB1N05iOGZlVVUx?=
 =?utf-8?B?RlRrMDBpV3NKd0lEQXNHRlo1STJrRWNpdllnQVNPZmhlQ3ZMQnRMTHo2ckRR?=
 =?utf-8?B?Y2wxTTlGMENSam9kV1lBUGE1QWh3a3hSM1F1alpJTndwb2dTTEpQZnA2VGlx?=
 =?utf-8?B?bzQ2eWJzVGpTWXk2cXpFRW8vQjZsYU5hSjhtckZCOFpHVlZxWEttdk9yekMv?=
 =?utf-8?B?UUJhQWsrSmlqTy9MampZdlVBdXJ2Qmx0aHBndFNpcEx1a1ZXcW1VeVBCclBJ?=
 =?utf-8?B?d0Q2VlJyaWV0QlhDc25wYlBoYSs0N1JmOU9jMmtDekhaTVFmL3VFbjJpM0RK?=
 =?utf-8?B?VjZrRzRhWFEzTUMxekl4K1ZURjdGQU9KMXRjcGFkQlBSMEwvZXhFd0R1My9J?=
 =?utf-8?B?WUJuVXVhaGVzOWFNalBEWjJYN0lkQUZFREVXRmNqNnlPa0d0dTRvUDBkamx6?=
 =?utf-8?B?V2ZMT3dNZjJvbzhIZDJJZHhDS2Z3NXhrWEhpWVBmRVV2OS91S204NXNqdnF0?=
 =?utf-8?B?dXZuSnBRdzFnanJ5QWV5NHZwVnJZdmRKckhMb25JUUdPc3dWdnBxck5VaWFR?=
 =?utf-8?B?ZW1zTWhYN1FBTEEyWmZmVUhqNzRPNnNwZDhHcUNGZ1QvTmVtejNkRUduUGVP?=
 =?utf-8?B?VC92dmpTM3FHUjk4UnQwNFAzRWhhY0dwcjJETSs2YWF3NzZuM1FpL3dlSzZm?=
 =?utf-8?B?REJ0eHo5RlFFZGJjRHFtTiszQlVpOXpncE5sTjN3RVdqRTV3L2JoSy9BNDRh?=
 =?utf-8?B?SXJlVVlwRHhnL3FkZGNZVjBkUlYxQ21mcmZINFJZOWFjZXBOV1NXR1RibmFS?=
 =?utf-8?B?MG95WXJTbnVYSUFsbHdWRXR1ZnplbEorRDJ0VW42M0lFRUh6YXlMRTdyQ2xW?=
 =?utf-8?B?a0RFeGovNUs0dXZMRjFmTmJjdkFMYStLaFArNm5YYnQ1QUhXalV6bW1oSmxv?=
 =?utf-8?B?N293bEJTQ1BqVXMzSnRUd0tYdDZqOEtWZ2x2UjYrd3V6dWFFU0YxY2V6aHpZ?=
 =?utf-8?B?cDVRR1Q5TGp4WC9pS2ErVWNCUmkydkxERnVwL3MxcXZreFF1Sm93ZTJWdC9X?=
 =?utf-8?B?eTdSdVUvNHIyTDg1c2JNSWFxN0kvRElXN3ZneWorZERoczl0YitZSEF6Kzdm?=
 =?utf-8?B?RUtnQS9tbk1rNytSaVl0ZXZraElqbDVxTTRGazFMeDdPakY4QXNRK1AxK3RX?=
 =?utf-8?B?WUQ2bG1RVTd2Qk9rMDRvV3VqTks1V3RNbUIrb0RIS0xiRUNqb1h6QVRKMFhn?=
 =?utf-8?B?REZYcEZWQXNma2ZVcHJvRU05Z0RJT0I1TG1zOUpMb2M3WEQ5ZkkwZkpxbXBi?=
 =?utf-8?B?RFhBQU02cVFWd2NiMDh4cHJsN2EyU3VpK3hnZ3VNQXZVRVRFNFZmeW1HTTRj?=
 =?utf-8?B?VEM2MWdBelZETkNEZmt0NjFxbGZPTjVhVjVsZW8wSUcySmhiWGdTRGpDazgx?=
 =?utf-8?B?L1RjbzFCWEpvTWFkb0hSSnowYVNHV0w0UnRDZ3lZZVIwR3BaaTZ6amM3a0Jp?=
 =?utf-8?Q?JRZfF8COBVtNErxsTeqI/gSyj/YkAwuKpbQk2/bkRA2Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93405f7b-46d8-4c97-9343-08da81c03873
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:53:00.8867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: svNrZmBT8osSNQcPqeYYec9FYFHN684JR10fr5FDI2y0dBnB6XZMZFedoFtX/QtV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

IIRC we intentionally dropped that approach of balancing 
ttm_mem_io_reserve()/ttm_mem_io_free().

Instead the results from ttm_mem_io_reserve() are cached and that cached 
information is freed by ttm_mem_io_free(). In other words every time we 
need to make sure we have the cache filled we call ttm_mem_io_reserve() 
and everytime we are about to free the resource or don't need the 
mapping any more we call ttm_mem_io_free().

The callbacks to io_mem_reserve() and io_mem_free() are then balanced.

Fixing missing _free() calls in the error path is probably a good idea, 
but I wouldn't go beyond that.

Why should any of that be racy? You need to hold the reservation lock to 
call any of those functions.

Regards,
Christian.

Am 19.08.22 um 10:13 schrieb Thomas Hellström:
> Hi Christian,
>
> I'm looking for a way to take some sort of reference across possible 
> VRAM accesses  over the PCI bar, be it for runtime PM, workarounds or 
> whatever.
>
> The ttm_mem_io_reserve/free seems like a good candidate, but is 
> completely unbalanced and looks racy. In particular error paths forget 
> to call ttm_mem_io_free().
>
> Would you have any objections if I took a look at attempting to 
> balance calls to those functions, or do you have any other suggestions 
> for a better method?
>
> Thanks,
>
> Thomas
>
>
>

