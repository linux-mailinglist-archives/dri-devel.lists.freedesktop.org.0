Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E55BE55A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 14:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCD010E4F1;
	Tue, 20 Sep 2022 12:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FED10E4F1;
 Tue, 20 Sep 2022 12:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUfHRGoGx0+jtHwPwbLWq0xG7aJR1z+2sCZdXUQUHuj7BbdNTlQDWb4NiIsiXOQmCbXQgoU0C42U/Gc7mdxF7BT3f8xzZBqHiDvWfxDfTmusAq03s5IPRUzlIB/649ADVsqUlLKkLgHdv6o5VkmpMXNRCLn0gO7G6OZjevbRqatOCrjiuiG9ZnVzBqBARCJPTOwNmJh5nS9kHHuGKaqw3XLmhVxG6+Gh9kuck8DlSn+Az9FBPtXMU+yzTrCdzNPS/oWwU/2PLwbQxpotWUsEIH3jdeuNnrErKr93bEIxDpEuxvlxYcJDUUrkj+SOmBx6yhtb327nH3gGNR9ldJpkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9+3OeAZej9Qg9483IsmEVA3K8pH4uo+IKIWExXkupI=;
 b=H6wYPeZUvIxlyBAIBEuKi7N1LG8HJknVahqs1jEkzQkmBgRRGWJTDes6FroNql15ZwJmCTw8bjKNRfy4/2wRjdo62HvW6TX4X0NdwtuEr6ftWVnOZaA6VNjCRj1PCxICkZnBspgEHFRXPwChS5mJ2bW0Xzj4nDdHYZ2tP2IWd6qBLdtlqls5XVqM95aZybn1O5wsoArmGH3hOnQf9sZazqjEuZxe7h624upT1FbySYI/mAqf8Zn0rOSt25ntlqmOnRWbaKcRKiXk/+ivVmMvcsDfPRYfGn4zkWOUuSESJJHB02F9o2GU+uymBGXwcT07B/oseuGnLkjrpP9zM552KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9+3OeAZej9Qg9483IsmEVA3K8pH4uo+IKIWExXkupI=;
 b=xEqKjneYs2oUzecRvhE+/4OL0BeJV7ShbsIMTxjxH24iIVs+44DYjoVrbnhKU87DgV6QQjjTr5ROHHpBUm8KHNN9gC0tx5owB1uY1K8RYDvs8eL7v0ZrsN5oZAv0Pb6gej9I5InR45Z00gNskZqRkwVZdI5ofNiW8Njjl79OR+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 12:12:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 12:12:14 +0000
Message-ID: <dafdf6a1-9390-3589-0177-ff7b361f3cb4@amd.com>
Date: Tue, 20 Sep 2022 14:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: build failure of next-20220920 due to c2b08e7a6d27 ("drm/amdgpu:
 move entity selection and job init earlier during CS")
Content-Language: en-US
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <YymoZR0jHR7seGyU@debian>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YymoZR0jHR7seGyU@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: a70a1b98-1a86-406a-dd00-08da9b015a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AeTwsYeTo4xaIBL1CXw+07Wop+rlz6dZYpGbTXgUxHvt9GWJRahqRwqiZFitR09imZeHM92Kb3V07gH4XhTvJR+mXbCJQ2vyYGALtKochpFhHeFQ1nvgBX6ZiCazXTQlROejSYT6nM+Uow/dAB4+lG44jxGiQ4vYD3S81CQvHsuwfEVlc2AV/eogXTfoy4q4wPRlIQav5bv7rw6bU7v0CM8V5/svfhqCnqb8ef4fWIrjf2XDQyf9grthGSnyz6B81R0v1d05C/6j5IfDnYJtRE36MNXaE+8NnsRnjKnURPJEk7TD5bNqPna2zFyv5C+5P4UBKcYjiWDRg+nXN344UAhKDS5rBOPnc/e4lx8Ui5K4egkHtqnkaK20iY1pheLcWYUXd3yTDeoSktjHaZwLnnYvgq7cXf8E46Z9wmrH9ettqeAZRCKcDP2ExGncaSzETCVIMs8W8A+qCbiVHI4w7THIIMVMA8T0vIrc0gp5fvKhmBQol2cfcqtfg217HGV9h4gXiZGPhS7+XLUXzZCW3gdIANjp8Mg3qyTxapWg++UvPwZ68j0TDf8nXWuUA4H9CMlEAuB0BQRsQxzM/v3Aq5TusdpODYZVQ7ZcAdkRw2AQvUKvLLDPzH3Pf234BZ+kfx4MlrVodRLb1MxVpqNZpXYO4Q3J3CuycO2CZUwvwp0w/OLInfCtErW3DdSe0lWpH3PaBowGpT7wPmSMBeAO4M1DQRP+tc9eNkPP577yhTCwT/COpf2UFJk/yHmwtfkhSO4ZMNwhFvKveK7IdZjubd/JoXpxPTUQnt75TEoaxCI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199015)(5660300002)(8936002)(4744005)(83380400001)(38100700002)(31696002)(86362001)(54906003)(6636002)(6486002)(316002)(110136005)(186003)(6506007)(2616005)(2906002)(6512007)(26005)(7416002)(31686004)(66476007)(66556008)(66946007)(6666004)(478600001)(4326008)(8676002)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkN4d0F4V3FxRFdwRWRRRCtLM3RrN3FaUmhmcGYzWExzVmZnQjBud0c5VU1Z?=
 =?utf-8?B?d2VhY2M5N09Kd2tMR1JGb2xpd2lDRzdRUWoreWhjVStobXREa1RXS1o5TG1z?=
 =?utf-8?B?d01XV1ltTkhRSHdWcWVJa2lydCtsVGUrWVpnVDNFN2dRK09sLytOajJ5Wm9G?=
 =?utf-8?B?MDhqdEJFbGhXTlVRT3Z2cFRPc0VKTkpSZlVvOTRkdytZVDNkOE0vcjZEMmZP?=
 =?utf-8?B?Q3UxUmhkSWVSWlRaWWdxdGdYaENqM0Rtc0ZzQ1REUkVMUXg3TE5MTnBPcEc1?=
 =?utf-8?B?OWZCS2FvWUZKV0t6TjdZTTJZN1hzNGZqcldxNlc0YUM5Ukt3RE1UdGhWdi9K?=
 =?utf-8?B?MVNvSk5sanlLWFVIeURzQ2p0M3Z3eitvS1JKT3lIM0d4ZUowSE1NMGhmM0Nq?=
 =?utf-8?B?cmZ5QUNHQWU5RG15WGlCTm9iUnQrVFByZEg0SGdaVklrNkF6TmpjSEZwRnJK?=
 =?utf-8?B?WWc5SmhaOTY2T2NwY25rZVhBNmZqUGtJdW5qU25kREtSSHpSU2w1ZjFCN3pq?=
 =?utf-8?B?TnFYYkp0SVZxTTgzeUFSZ2tjUnlEU2xQRjI3WXZkMU1OQXB4dTNNakcyUUhz?=
 =?utf-8?B?NURQNUZqdkEvOUd0YjlKZy9yUXZXeEpJYmNUWjA4dVJpSmUrTjRDeStlWWd5?=
 =?utf-8?B?Y0JLMEdBZGdaclY5Zk4zL1FNVjI5bm4vbmluc0IzT0V5T2Z5dllYOXI2ZUYy?=
 =?utf-8?B?aEtmRGpsYi8xc3F3eENDcVdHT1krYWZRbnJQcEVtWEQ4OXgwQ01GMFBVMlJp?=
 =?utf-8?B?V1ZwOS9SSFYxdXlaZUhoOUVnaEJZY0IvRmtoRjEvZWdkTEFTVlU4dFQrejVx?=
 =?utf-8?B?K3FUTzJzeDJPMHJ6RVJFTTRrSzRZWmpRclJZZTRLRytQdElGeXBFZlZSZUxs?=
 =?utf-8?B?Nk1FbHQzTUdBM2tIQTB0VWdzSFpkVG1jUFp0SHEySDg0NXI4MmJJYjY1Y1BV?=
 =?utf-8?B?OVo3SVg1V0xFbGpCWVJYcG9VV0tXMVlGKzIrcXNBeVYycUVLR3RhdjZUUm5U?=
 =?utf-8?B?dmVCaXR3NmxQLzZKZlhiMXp5SVpRK0Vma3dBY1RtY3NZdGRaMVdvWDVDbEJG?=
 =?utf-8?B?OEZ3TjQyV2Y0MlZMWERwVy9KY2ZOaHFFLzVHMnJqNGpzYUhJektIWmpqTmNq?=
 =?utf-8?B?aDVzdUZsL08xTDUvU1cxQ3JiNTJwZkFWdlkweWgzenFwSndrbFNtZVVUMlFl?=
 =?utf-8?B?ejQyd3lHTWFpVGNZR0Q0YlBnVzdtYTV6YlY1bk5KLys4VWhNcEM4aWgvVFRD?=
 =?utf-8?B?TUtVQkk1MGNmc1pFSy85emI0WE1GWXB6NTFKeTVuWk41OXFUejZ1Q0R2WUxL?=
 =?utf-8?B?WmJGSlZDcUdLQnJZb01PaSt3ZE54aXZGTG1UU01DbDd3di9TandwRENNWFFk?=
 =?utf-8?B?bWZiV2drNlZyOUVaOU1teGRZRi9TVlZIRHpoM2FLVjJRU3ptSytSSUk3N2Q5?=
 =?utf-8?B?c01JK3B5NjVXcE9UOXdWRzVQbFl3NUdpNmcvQTk4aGZwK2ZYdG5Wc2VTbnVD?=
 =?utf-8?B?UVhwVGxJTy9WQnNSQkQ2WHl4L3VWclEyelpFeE8yZU0wd3dkUUtiUVFyRXJD?=
 =?utf-8?B?WHozL0tDMlk5ZjlyeTU0RDl4STR2S3FHRVZtL2ZxVlE4MWRZWlc5SGQ5QnhX?=
 =?utf-8?B?STJJeC9nTHcyK0pEZVVHTG9odmgwcytIdGtUUmt2bjlEcTQ1SlJoZHB4RGpD?=
 =?utf-8?B?aW8rNVY5SlNMNVFEM2E2OCs4bEtWejNtRFJiUlRGZTE2TEU4ZVVXdXR2eXM3?=
 =?utf-8?B?am1Relp5UGFHQXhhYzlMUDNQMWdQSHA0TDIwTEl6MEUyQVBiR2JIZStJSFlN?=
 =?utf-8?B?djVTMytMSFlURHR0eHpXYU56akxIQ2JTRDdkNkRxdXlnTzhRY3B0QVNzbHNB?=
 =?utf-8?B?ZDhOVVNoVFQvZGZSY25aQ3F0eFc1NzNXUmsxTGZlWmdFM0NWSE1waklXU0F3?=
 =?utf-8?B?UEhabTNXM2hUdFdwUHBNTDI4WmNDd1lQZjFZMmhNK1MrTGZ4WFh4aHlJMlVk?=
 =?utf-8?B?RWFaUGxJZVdscktmQzFydFZWT2JCWXJHT2NDRWcxeUNOM0RRa29KdGxBMWpT?=
 =?utf-8?B?c0ROWnNQakl3SmZRWGpYTGtTVXFJZnNDUkJZbmtWTHJzZmFPS1ZyZXNqZ293?=
 =?utf-8?Q?eE+3tbsZhSJi9Txs1gpK3ghxq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70a1b98-1a86-406a-dd00-08da9b015a90
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 12:12:14.5718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3RQDnEFdb3N4w0IPM6ax+vGAWcY9fCDXzRhx7UhJlSrwyHQDaDa4VAr2uJnCQbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287
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
Cc: Philip Yang <Philip.Yang@amd.com>, llvm@lists.linux.dev,
 David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-next@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for pointing this out! It's indeed quite a bug.

Going to send a patch ASAP.

Regards,
Christian.

Am 20.09.22 um 13:47 schrieb Sudip Mukherjee:
> Hi All,
>
> The builds of arm64 allmodconfig with clang failed to build next-20220920
> with the error:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
>                  r |= !amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
>                  ^
> drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1171:7: note: initialize the variable 'r' to silence this warning
>          int r;
>               ^
>                = 0
> 1 error generated.
>
>
> git bisect pointed to c2b08e7a6d27 ("drm/amdgpu: move entity selection and job init earlier during CS")
>
> I will be happy to test any patch or provide any extra log if needed.
>
>

