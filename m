Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F14697DC1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 14:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B0810E1D6;
	Wed, 15 Feb 2023 13:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF5D10E1D6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 13:46:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtVPH+rtQAyyChu5VX5zKHh93penjE3rvNY4BGSU9PxB5hNnFEe6lXk93+xJDcwxWkTb+N8nFNv7oKYIwNZqhoLdqR+lVhqS7mYiHSzaXcPu1WyBv8Mvm2t1OWxhSeBuUKM/fI4mOCgWyd9yknPeDAT3jeJmTG1N9raDIHYCsciobe+U72kuBGzIKiRUZB/3D+gnwrUB3MdRvuKqfRiRgkacAYxkhGw3I2GLUXq/qCSeFVsv5P2mn0voG5RvaQxfarYvZtEh/CczlUO7biJ5SOQUDVVQp/ihCezivjazEzZTNBsJLqfFGUWt30Uxo3KLPqJKmFF6+7WM2NWq0+rIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwR0X3/Xc18qVKoluHXBDaGnE5QqGQmiICGgpGlrrMs=;
 b=FneOTi/yc7F4ZEGH18u3YFLUYxhSJDGRKpu/40HKZBw/dXjxyw4s0XJ9Ign1LzI0dk7H0sASwtjQiq3k0El2TbvPyfyCcKA0z+021aUAhGb2kkEbt7hPT/k0CTtmhriv7tErMJFkHO/cN21GvuBlUHz6cSEWx+MwNY1s6eoxqhiES4spxTt3RRAIbRThcMMkxgHduey4aQDTkkFRh2fyF/wTROtAeZfI2OdEO+oLZQb1vgG4vO3n39psctQvxlPt9dmCrFgnSU5HKT2bCbB6CGRPK/cDXMk723CiKKRPN5QQNBevDi2JnXbv+IraSTdooFnPH5Sh3J0HEROpaXebNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwR0X3/Xc18qVKoluHXBDaGnE5QqGQmiICGgpGlrrMs=;
 b=xnwqwy9X8Q/uAcKxoxG9GjNR0lZ0snSMUYMCSYWG5EDriqKIYE3xeUs1RZ0vauvzG29cxdR+6CM/S022j7Tw3PpC2LTASE2Qznay2p/so1vQq20eLYRWKV4WIalF2TknwFiY+4a04qfxVSROHg7yVbxO3iOHOZTATOHct0alciY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB7685.namprd12.prod.outlook.com (2603:10b6:208:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 13:46:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 13:46:20 +0000
Message-ID: <bf3771bc-bbdc-8a9f-b9e7-425812a66ea9@amd.com>
Date: Wed, 15 Feb 2023 14:46:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Question: partial transfers of DMABUFs
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
 <c5fe8089-49e9-2bec-eac5-e8a035412cf3@amd.com>
 <db4d83f3c3c8dc4f3ef5f850fe4c1c04aa648d47.camel@crapouillou.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <db4d83f3c3c8dc4f3ef5f850fe4c1c04aa648d47.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 6309e6c2-dc46-4402-51c4-08db0f5b0526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rG87dQ5rrSV9FlNsK5l60r2d7Dt1WOFm3uzjB3waYy+32H8Y8/NcGfr4tdqm3kaDyygdLmyJlm6tRqJ4fGVGeLyXF2yTt5EObyY2lUq+4NE6iQB5Kfy604DjrhX+pTpEwgpfvPwtJxn1vfBAyIXhU9YFXc8am1xYivBeXiWkV7WCNXGDrVhM7wlyqRWB4BcN5SSVFlaMklXzkd6WGBnKvR/dApfdMwRNy5D/4qPZBCTuuTmHSp8ldfP8N/5y8ZVQXD/K47d+XC00RT8eiWC2C0VvDAAew2t8kGzQsSevA6CqI6l1Qg8uZ4FUV6KmWLBXcqWdQuNHa1eykBbU+DIYgzKyaawfYnS+bUUQudMgYb7qkuAGfFZ+o0PGkPQ5ExQ7j34g72+9k9JTDQZ6vF5VWGSvMzKSsIt6AbVYakRwkSWbS3gzs98mwp+10nkM5qMHMK1XiGKTAjQV3WXGnN8/A4ERdn5Q1Y1Ris7Pr0wm9/J0gJEd64FRZbnk2z7MEN+HK9KCDrAX9b17Oeze9PnrolbUzNN+Y2V60Z1x7wah8GL7efc2WkP1AHxsD8ZpioWMydDmx3kanD/EtoYR63erxeQScFRwfAIq9rSxWkUCIChPgIVqdvCW5QeOW2lcQjZI0o0/HkZWQoPXALnYUaobNK5yK4F/Q4aXzqPUVW5F8XqHs0RFJ8DGI88BX+WBbysa5RuGgeF1eiB4em9bdZ5tuhNVM5LVvr774V5vQx/wO6M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(451199018)(36756003)(31696002)(86362001)(110136005)(66574015)(186003)(83380400001)(31686004)(316002)(6512007)(2616005)(478600001)(6486002)(966005)(6666004)(6506007)(66946007)(2906002)(41300700001)(8676002)(4326008)(38100700002)(66556008)(66476007)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjJwNkticzdKYjZGMFdOSmhURWpXblg1M1J2UFhpZHBXK2E3UytrbHpOaFho?=
 =?utf-8?B?STYvRUtHZWRiYXp4cllqTmNJZm1DTS9QeWFwZm5kejVsT01IQlZWVUZ4WTMv?=
 =?utf-8?B?U3lDbitXK2duckhJQzAwbHNGSi9Tc3lCRU5xWGZnUEN6UDVkRmFsMkYvdWRp?=
 =?utf-8?B?WlcwOXJuOExkZGRYWWc5akZPblZKL05OQWtWMHpNckFsWVFQZ1R6STJ3MGU4?=
 =?utf-8?B?U3huek9SUlN0OW9ZaUlHK2w2TVFsT3RPTDUyS2M2Z2pyQUsyRXRlRkU2NEV3?=
 =?utf-8?B?UjE0YWNlQU9RV2dRUDZVUEFNQ1hRQTV2RzJsamVmMDMwREdpNVVyZk5aQ1NZ?=
 =?utf-8?B?V09aTWVJL3pZQlAwYXJ1cFRYOHJhampac3ZHVTZYMU0xVForbmwxUW5ML0U1?=
 =?utf-8?B?V0E0L1VnaDhuMXFnTXJTS0s4UnlMa1JEMmFWNlFtbUY2UW1LWWg0TmVPOUMz?=
 =?utf-8?B?QWF5b3dIb085OVVZT3graWJoakZKSDFqWU81UjNwdmJaVHFyOWxlblc1OFpw?=
 =?utf-8?B?MTY1S1hzQjlFOG44d21OaUo2SmJRM3ViTThaWFM0REIxTnFRdnUrbXdiaUdO?=
 =?utf-8?B?T0hoOXFwNWtYZkdPYTcreFBFQjlxQWtEQkdxWEloUm55ZC8zdmZ5WVh2NG9E?=
 =?utf-8?B?ZlZhZ0Q1KythWmduTHZIRVJ3cVV1SnFsWHJZR0VZYUNMNGxjNmVwekNSdlZI?=
 =?utf-8?B?dklRUzJrMTE0ekFQRGI3bHp0VzB2cStQcnpUSWxDbGliemhveUhtZTAzaUtE?=
 =?utf-8?B?ekwwNW44UGdkekZZVHZ5OWtCd3VuMTZYM2JXK0JGREN6Z2h2bk13Z0FLUVZu?=
 =?utf-8?B?R2VrWnZBZDJSU2ltK2U3T2FGc3NCcHE0cjFEcGJmTXFia1hrQXZhVll0L1JK?=
 =?utf-8?B?YmpRaVM2QXpqRlcraHZ3YmtON2JhMEZpbHFoN01pZjVCWWhhVjZzQ2NxQ0Y0?=
 =?utf-8?B?RGhEaWRMbUlLZTJ1bWFrUEdvVkdTLzNFMWtVY1U0TjMvRHFQendaWitFa2ZD?=
 =?utf-8?B?dVJNbmJvaGVmdXlpZ3Q1VzhEVjk4SUkyanB2SXdFWEhHNlgrMmhsMkdIS1dE?=
 =?utf-8?B?TGNBT0J6YVlHREpUYXAxZVlqcmRDNWk0UENXSTlYR2pIclExTUM5M2xsSGdo?=
 =?utf-8?B?WEV4cTZiN2JPRXVpUDJkUCtaUUdDN25EbXEwQU0rdThHVWR0VGZYUVpKSFpl?=
 =?utf-8?B?T2t2YlVkb3YzZjJSNWwwQzRiYVJHQ2pyampLWEZ1a2RmYW84a1NqS2g3K1hu?=
 =?utf-8?B?M2J6RVo5NVcrdlZhcXd5eDZZYTRpWm4vdk9sbSsvL2o1cHc5UHNsL0xFY3I3?=
 =?utf-8?B?TW1FM1lyYU43Z0t3bFFwYkcxWjZOSGx5dm01ajRZWTRwd0ZHamZ2YmZCejJL?=
 =?utf-8?B?UXJoRVhDUkkybWs3ODdzalp2OGlIQ3ZzWTBETGhzRVNhdk5PZUc1N3psL0Ja?=
 =?utf-8?B?Zjh2eG1uZlNSYXYzYkNqNkh2ZzRXY2NDUkRzSFdaVDNXZ3hLbmJ4L2hRMUdz?=
 =?utf-8?B?aVBqcXFRcXRwVzF0d2FMQ3h6VHdxbnRXTUhBdk83Y1RaMTlPdDdka21ORzhI?=
 =?utf-8?B?eFRha0ZMVUN1cmNwMllDYXQvd2hPUzNqOHU2WFN1RHBJSjNLZG14Z1dTZW5B?=
 =?utf-8?B?QzFuMUo2dGVWV3NjUjR1Snp4U1Q1TTJ3QngzQjBRbzlpRmZjSDczYjVnUnkr?=
 =?utf-8?B?RnpleTlGZURyV2dsNHRPMWk5WExHV0huMG1mOGl1WGg5SGlxdlhxVy9uTktS?=
 =?utf-8?B?MVNFQVJBT2lKY0ZSR3BqS3pYd1REZEJVdCtJS05FQkg2dTdUM2p0YVB4R0Fj?=
 =?utf-8?B?MHZLWXVPeDN1dFBPVlYrcTk5amF4ZW9FUW9QZTZ6U1k0MWp4YmtBbTFYaWlO?=
 =?utf-8?B?NjZWUWpJbVRDVGNUdk9hWFhrZFNzKzhsNGlPa2tDS0tIL3NDaEMwV3lTeC90?=
 =?utf-8?B?SGZLMFcxcE9oc3V3NDN5NmNucUNzWmo1bHZzNlg5V1RjeThOY0poRmhBaXFr?=
 =?utf-8?B?aTEvazNYWUtSQk5wSnlZWGlmVWlLdG56RVlua1hVYW9tZ0dPc3ZJVXBsVCtr?=
 =?utf-8?B?NFhuQWErODRwcjRsQ0orWVM5TGE5b0ZMeXVzUXNJUnhWOWR4ZkZXNHBqM2wx?=
 =?utf-8?B?NkxKQVZvVGRpNkdkN2VneGhVNjE5bnpaTmlKbjZmbzZ1RkhTS3dPcTJpeTdh?=
 =?utf-8?Q?8ohR6ba48Kc+RUODAch8xJzactMR4pGB9qIrtbl/VkFE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6309e6c2-dc46-4402-51c4-08db0f5b0526
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 13:46:20.7613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmcCXnXktjKj8lsvnJeo8jd5cGmx0QqgFkY+22AFx4cTKbovfboMAugD+ZGdGgUS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7685
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
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.02.23 um 14:24 schrieb Paul Cercueil:
> Hi Christian,
>
> Le mercredi 15 février 2023 à 13:58 +0100, Christian König a écrit :
>> Hi Paul,
>>
>> Am 15.02.23 um 11:48 schrieb Paul Cercueil:
>>> Hi,
>>>
>>> I am working on adding support for DMABUFs in the IIO subsystem.
>>>
>>> One thing we want there, is the ability to specify the number of
>>> bytes
>>> to transfer (while still defaulting to the DMABUF size).
>>>
>>> Since dma_buf_map_attachment() returns a sg_table,
>> Please don't assume that this is an sg_table. We just used it as
>> container for DMA addresses, but this has proven to be a mistake.
> TL/DR, why was it a mistake? Just curious.

The sg_table should have just contained DMA addresses, but we had 
multiple people who tried to use the pages instead.

This works to some extend, but goes boom as soon as somebody messes with 
the pages reference counts or tries to map it into an address space or 
something like that.

We got so far that we now intentionally mangle the page addresses in the 
sg_table to prevent people from using it: 
https://elixir.bootlin.com/linux/latest/source/drivers/dma-buf/dma-buf.c#L763

>> There is work underway to replace the sg_table with (for example)
>> just
>> an array of DMA addresses.
> Ok, so I believe at some point we will need an equivalent of
> dmaengine_prep_slave_sg() which takes an array of DMA addresses.

Well we will probably come up with a new container for this, but yeah.

Regards,
Christian.

>
>>> I basically have two options, and I can't decide which one is the
>>> best (or the less ugly):
>>>
>>> - Either I add a new API function similar to
>>> dmaengine_prep_slave_sg(),
>>> which still takes a scatterlist as argument but also takes the
>>> number
>>> of bytes as argument;
>>>
>>> - Or I add a function to duplicate the scatterlist and then shrink
>>> it
>>> manually, which doesn't sound like a good idea either.
>>>
>>> What would be the recommended way?
>> I strongly recommend to come up with a new function which only takes
>> DMA
>> addresses and separate segment length.
> Alright, thanks for your input.
>
> So I would add a new dma_device.dma_prep_slave_dma_array() callback
> with a corresponding API function, and then the drivers can be
> converted from using .dma_prep_slave_sg() to this new function in due
> time.
>
> Vinod, that works for you?
>
> Cheers,
> -Paul

