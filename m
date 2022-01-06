Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB548680F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 18:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE2A10EC92;
	Thu,  6 Jan 2022 17:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0834A10E928;
 Thu,  6 Jan 2022 17:00:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTDNn/BNXRn63EBOz2CGTrS6f/bGrKNF/x2Evs4wI9rtC8y4pWht4ZkC8dN0NYqeTqFJrmiGeUBGG+wNVZPjiP0S0e6iIGLcR8M8tIfc76+KzAAhxN0d3r3IIRHPWwaXF6XGEO/zt2Zv/W3JRo+Lhs511M0hDbb222QOb2vJe7NXk29nb0zpfTeGtLR9KvcjrpW+1IjPSYKZ99RWe2njnJKaoQGjXkmm3zJ4irFCd8ttVIzsR2BK2FKFuOj9/+gwiM7E/56cVod8/8W/jsA77XiEmBioufHuhFp8r4/hoGsiGFGZmYOI6gqTvw67Q+s5rOTkVg5N4IDz8toPJZC0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8rxuv6B9ecWdnuUVll9GmCfvrvpA/W4cRFZPJ+XoOU=;
 b=kLtddPkOD5EF4gGVw4S6JujCj2LuwUWc2+WKOx2O0V5hU5wjzF/KGuDCAhloLaUMn6a+1o/gmLQPnm7UMs96zzCnpbYIJgEgwJblAnF3F2GDRyoAnMPZuAkYdKwqJ8GOI4pP9CxZZjjudP78FLjq9ZLWVnAMvwYaysCGRgg3jdLNDMlpS9rtepYy2B9jb9oqmEthbzDic22JoV8VywHitaA/C+5QXY6q6gVl5LxufqfgTFPPv/bKOySrOCXWJ74fuhztQy9h207hzviw87QWVV+Gg2gPD4UNy7g1U8odeLXaKssuzFPmG/Y2yMmoVRT7hxu1LxUILrB+kVFz/n/b7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8rxuv6B9ecWdnuUVll9GmCfvrvpA/W4cRFZPJ+XoOU=;
 b=nrnULHEcHDIioUESYJLSllyMHm48aeEU/A0LijZRE8ISGr+u/PrcIgRD4T5PUXu118KEgWOX0AV2gDrGxQWrJm2VJ+QfI3e3momT0BMd3jQcyPx9D17Xyu+QsrVio6uje/T51uwKz/m4QXb9J4rfme1PSlfevEf+Zlf7Bd+6O7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 16:45:37 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 16:45:37 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Adrian Reber <adrian@lisas.de>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
 <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
Date: Thu, 6 Jan 2022 11:45:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc962776-5d93-4277-e890-08d9d133f708
X-MS-TrafficTypeDiagnostic: BN9PR12MB5243:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB52432A7540A4B81FE90E3A15924C9@BN9PR12MB5243.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZoDI+MVoYkP3O2RiREu1I98nCCOCkdmV6Ji1Iku40ZEbNTAO2CEHYje8ddmR/DSUeH6JvkFK7Oufn4/v0k0PdEH1iKRZ68Gp3c5C4nNANOubtwS3xTnetBZx64O0VbrcQoe8q7pmrgE0F0nhtrvsxNZFbvJiA5HWUCJn8K+DF8hcMuRh5YegxHoD1agXDA7n5diRxD2TziIcLUUrq89iNHNvf5XxU4W/RYKcNLtHctye2HElOSH4Yadp+KSIfNCz/QjhUF6O30hU+7NGCSer7kK8+Beb70LTXp36LomUWRvNg0lqDOJ1VaRMr2NZ+o2LNLaTT+GC7PryYcVmZMVne5vw1ZpYWVzsaoMy0tWBMInVoJlKHH59dkbDlWl5aR0IDSmUXCEe4cz3eXVJrQgxmGumhYvERMKwYN2LlYr+ZcnQQEU9ojT6LSH4Pm91FSxV4aXuG8QiHrvMEmzcSCDqtvNQ8bauoZoY986u4NQ9VQNlNd83uzjgHQCisYkYRe2bJuNoGBpfDJ5Kk5WtFXki5uO+wZRSf70t3eYmDUwEOmRgWUp6AJS1+pNKOzVJygLGbHG1epkssTZhp4or4ZINE8NeIyP/Ym1Vw5O9xp6rhoxzuc79zoYCzLtFX1aitpczn1REYKej+8/A3l1vydufsSw7HSw4u9q/+l2KqWPtekhj8SVIHpT4aNKQ9dbCedH1NMClYw0CpFVVvV15MeYS/hdAw8XuU1ycGG3ySc/evbZIlpLPOb9WrB20Vzz8Gf+A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(8676002)(8936002)(31696002)(4326008)(5660300002)(2616005)(86362001)(6512007)(316002)(26005)(66476007)(186003)(110136005)(66556008)(508600001)(36756003)(2906002)(44832011)(66574015)(31686004)(6506007)(6486002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWw3bTE2QkVvWE5PQXJHMm01YlV4MkxHb0tiT01tWlMrRlgrMVNPZjBPelhn?=
 =?utf-8?B?NHhtY2RqSkkyb3RIMEcyVFhPaSs2VWZDaXRiZW1wYWZLQ0xvRGhqVWJsdk1r?=
 =?utf-8?B?anFvNXdNb2NMK3lzZVQ5VmdsQTdWZiswSXlldlQ3b2diY1FIRGtKbEN2c1l5?=
 =?utf-8?B?Z0Nzd1hERmQ3cHhMUjdLWW9MdFJNUWhKWGtET2d0eVJUV1RCa1JhanBTUURx?=
 =?utf-8?B?eXF2OWVoQVgrSkNVZGtURUJqYTgrMzN3SVQ2YXBNV1JBZVp6RnhEano5VnMr?=
 =?utf-8?B?akttY3BUb3RScldkUkRuWUNqQksrQjV2eVNVeDY3UXFjdjZ4U2h2MWdRRWtt?=
 =?utf-8?B?bHRxdm94VE95dkpjY2tncTBWSExSY0FUYVZBK3hrM2RPY0ZyWGhNdGVQNDB3?=
 =?utf-8?B?SnJRdnZSVmRLU2hEQ0xkNmZnVUdwdm9FWEdLaCs1MnhnOEZYak9uV2FGZjRk?=
 =?utf-8?B?am9nS3k4MU40Q2JOdlRHc1g4ZGNEd3R6ckZLWXFkRzdhZWZaNmpqWGJycjNC?=
 =?utf-8?B?aHF6RUFGWldFSWFncXl0VFV1c1h0dnRsZ04vaFR4M1Z5am9FZmdiYlB4N0RN?=
 =?utf-8?B?TlBuU0pMM1R0MGRCUG9Zd0NHSlBGb2dXZEk2Q3VjWUNFSk9pNTQ3Y2RRZ2Yx?=
 =?utf-8?B?ZzBQZy9uODZLRVkvSnYzVitQTjFVLzd2dmcvclNFYWYrTWRCMzFXVlQ1TGhP?=
 =?utf-8?B?UmtPRlVuZHYyYkgrYXFnM0V2bkNCUDNWVFdJUGRaMjE1bC9xUm8xMURmNE5N?=
 =?utf-8?B?elorNnRqYll6UXMyL3pFMVpGVEl4RDZpdEtLOWg4OVV0RnVjbU0vZGtuSklD?=
 =?utf-8?B?d256QW9iL2lQNVJaS1p0VEtQaGpYd00yc3ExcmxTMEtSN1ZVU0U4akh5ZHNh?=
 =?utf-8?B?UTFGaWZJOWduR2p5WlNSRkYwZ092U1p6RytMeVJMZE5yMUo3dTI3UXh4dVE0?=
 =?utf-8?B?QjIzWlRqTHRFODYrNkRla2tVMDlqSlJIdURIQTA0a1NDcHNBZEZFekZ6Z2hj?=
 =?utf-8?B?OGdXc0kwdXo1ZTRVWSs2VTJub2hKNy81ZDVlT2NINm1ZbzlFaVB0cEFzbEJL?=
 =?utf-8?B?cXdSYjB3NmpJVndZcnFRcFpmWGlzUmVZMVh5ZW1tSTEwQldNR1FrT0xObnhN?=
 =?utf-8?B?UXQzN0NCQjdHMnNYRWlHQ1lHRVZIUEorOUt6Tys5RFhGRmMxMDE2SlM3cndk?=
 =?utf-8?B?ZUNWbGJQVTRNeGxrMUIrS2YvckZzVk1oT0pETlQwa3VjZnMwelJ6L0pKQ0tK?=
 =?utf-8?B?YzZHTkp3Z0FiZmg3S3VXd2prZG9pVmNIV1dEUSswYjJDeFNINDJzRGN4cXk0?=
 =?utf-8?B?NWRCQkR0azRmQlFiRmxJSkNMU0o2czhVamlQdGhVelk3YmlDWHJTOWpNd1d1?=
 =?utf-8?B?b3hmK2JLdUhDMGZySlQyb2w2dldvanMyR01FRU41ZjZ4Ym1rdTAzUUNxN202?=
 =?utf-8?B?SHBvMFRmQXppblZSRkhoNzFhdGxMZXRvU2s5dUJIb1h5b21Dbm1XQURjSmp0?=
 =?utf-8?B?RE1wanh2a0ZaQlh6aHluQlFSUDNnMzQvcVlkWURhYkJxOTBtWWgza1crZXl1?=
 =?utf-8?B?L2pHYk95TGtGdHo2bDZQL2VHamJpT2twZlViR2lBZGhGZ012T0VxOXAyN3gv?=
 =?utf-8?B?MzJhU0NwbGpFMDkvdWVmNHo4RnNvK3dvK0wyU3ZYQlVoM0gzNGF6cVhJMVVY?=
 =?utf-8?B?bkE0cWwvN3hhaEViVUVURDdaUFVVSVdFOWdhWU5Tc2k0TGtROHErbnJtSVhP?=
 =?utf-8?B?dUNBdFpiRC9EQjlrNTJFa3pQVEF0QjNoVWZxc2dSYzRPWjkxNTZjNGpnOVM4?=
 =?utf-8?B?R1lHMUFyckVoVENTUGZ0V0dHMmNCMnFsNyt2c2FFYkpWQUR3enUvdFJUVWZ4?=
 =?utf-8?B?eFpCSi9QSndVREpNMXQzeDNhSnhMYnNJU1U3bTZsMno0c3ZVYTcvOWt1K3ZN?=
 =?utf-8?B?MlBEdmM1OXFVZTVITVh0M3A4QkJydzRZc25kQU1Wd2FrK2YvcGZiTUdLR0xH?=
 =?utf-8?B?S1IyeXB1YUZReXFMZWtGcSsxMmlxaGdXK0t3WURUMGhxQ0IrZkZUZGZhZ1dy?=
 =?utf-8?B?aG5xOG5NVCtLTFFua3NrZHJXQ1Y1bUJMbzRaQnVVTXhkbjFzY0hPOEp4dFls?=
 =?utf-8?B?U01yTThJbGRaL29IbjFhT2Y0YStnTWx4NElvMXhwcFp0RHhnUG1sektRbnda?=
 =?utf-8?Q?2UaRYPwEmhWSpJ99QfCejQQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc962776-5d93-4277-e890-08d9d133f708
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:45:37.0541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qa4LDhCmnL4LosHurQ4sHVjicXojMiMnBp3hHNY90iJqNSb44iDrO57UbrvWdixDUIG9qf0pG1pk+tDb8bALtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
> Am 05.01.22 um 17:16 schrieb Felix Kuehling:
>> [SNIP]
>>>> But KFD doesn't know anything about the inherited BOs
>>>> from the parent process.
>>> Ok, why that? When the KFD is reinitializing it's context why
>>> shouldn't it cleanup those VMAs?
>> That cleanup has to be initiated by user mode. Basically closing the old
>> KFD and DRM file descriptors, cleaning up all the user mode VM state,
>> unmapping all the VMAs, etc. Then it reopens KFD and the render nodes
>> and starts from scratch.
>>
>> User mode will do this automatically when it tries to reinitialize ROCm.
>> However, in this case the child process doesn't do that (e.g. a python
>> application using the multi-processing package). The child process does
>> not use ROCm. But you're left with all the dangling VMAs in the child
>> process indefinitely.
>
> Oh, not that one again. I'm unfortunately pretty sure that this is an
> clear NAK then.
>
> This python multi-processing package is violating various
> specifications by doing this fork() and we already had multiple
> discussions about that.

Well, it's in wide-spread use. We can't just throw up our hands and say
they're buggy and not supported.

Also, why does your ACK or NAK depend on this at all. If it's the right
thing to do, it's the right thing to do regardless of who benefits from
it. In addition, how can a child process that doesn't even use the GPU
be in violation of any GPU-driver related specifications.

Regards,
  Felix


>
> Let's talk about this on Mondays call. Thanks for giving the whole
> context.
>
> Regards,
> Christian.
>
>>
>> Regards,
>>    Felix
>>
>
