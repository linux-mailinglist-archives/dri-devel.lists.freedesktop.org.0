Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F194861CE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CBA113D45;
	Thu,  6 Jan 2022 09:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7EB113D44;
 Thu,  6 Jan 2022 09:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkhoII/E5yyoxTzhcH6wnU13Kt5r8vyI1WF0iES7agK457cWyEsgfrndhyLQaI7PrV2pSG5tCRfYx3cAxyLLZF+PuDTf0vYmcJjJZfY2Kk3+IIle+YY7l8OGFAFQNwSBTAU6ChUrMBNLnE/cWsaRXvCK3uSjy7/geTfrXJnFHQpelXG6f0O93CuWzpXmf2E8i0/vC5jq910Ukln12m4DrdRn0FebETiZtyd/b2g9f/t33JoXEmlw9WKbtMmoNLuelp9jkJOA3p5wAoZdfaK0fWG7g4dLQFVlhigm3itF0m1iZxwL4qiB6FZpdTm2WZ5dJxozs1dBLUxeziaaM9GC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrlZlYU115v8V97wNvSqjwU8Q+4W9i2WyTqhIrlYQLY=;
 b=khXSBmCiyjouy9RJzMu+I0aJpaynkaDaZvTWtrcIzQFSptu801vmqQjF3DXYtjdS0lbFOIS/T8n9O2U7RGc45Qce57fmAtvSa0W782qOqBcAlC+Bel77QH3AmG0YR9JuLo09ZAQCNGkHQEViQUkVkV6TuaCbFkXWBRFbyjsg2Be6s32J/ahD8z0TFQLXS0etIQAlRPCYqxnpXEVX+T8okrZQrYe/SE/pPQUwMfYEY1zF1tl+iY/NtYevblKeFUvZSrafV/x82dYwOIVoEsYz1EDDFH+Ro+wUC2reaSquDhZS9qNzGt+nq9cqs8F29TL3KRC4tB3qy5WkBfTNGnpEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nrlZlYU115v8V97wNvSqjwU8Q+4W9i2WyTqhIrlYQLY=;
 b=15Z2GSs+4Hu27ABvX4ELCBEN/eGiM8xFgAKRUe8JcHR7fv2FuL9cbxxmJRAitRSZ6po248+p24zRL+8Qcb6qzZucjlBinaTeVZ2Wn2jZ7g7yYllrq9+S/YQpz15Wgeq3glfARhx7S93bxrsnPvLNfi3fMVhrEiNKqWRX5sBR3wE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB0077.namprd12.prod.outlook.com
 (2603:10b6:301:55::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 09:05:14 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 09:05:14 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: Felix Kuehling <felix.kuehling@amd.com>,
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
Date: Thu, 6 Jan 2022 10:05:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR08CA0031.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::44) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 081f7605-56b1-4411-5ccf-08d9d0f3a680
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0077:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0077C3B9A6367BB40EE29C22834C9@MWHPR1201MB0077.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4BmKikO4F0UKu4ogz8MOdyHaFNSBDeczP0IQ1SH9H3U4cmq5MCrGNXq05pQzKQbBZJfT6mOTMHHyNYt6eoW2b+aKRuSkoSjkNwVoRFTz+QJYKheKVxx0qQZ4kzea4YWs2co76P9m51YVtKceltAa6FDguzEhXSQDbbaOdy72gaNThMDSrX0likpE8z5dR39oH2SakVdDyWrobIe7gJ+mfVX27SZ8I6bH3UWPyNNxTw7I0VJKvrV7ZKLG1tsOILxgROvvycMhwmufiTbx0cFsSlhzRflJRhAGCkdw13rAwbHoTx7uKEI0wxU2OD5+RLOQcXxE3ElksYh4CC8KdvE6mXMibT1d1j61/JD8TxYO2KKKUIxN0E/ZR/gW/uGehobQgVik47f/Xvv48rTP/Rgb75T/q0Jq5JuMPafwzrhkqUGMwP+3LrFZW5QiZejHkNr9l87s6Shh71leYojdD5IgnWMHDgGrasayjyqGGRHrCS3Z34k5MezVpOw9zwXIEdK6tCVP5NZ35FQt8L2oOEAhDvkFjYGRSLkO75D7SoQcUtd7z57QNxMDbb6q5AFPHdoIG/fK77uSEEY1NbD1aSdCHgGkgrussxtcBmM+w2etiUw1pDQq4cLRoK6YDkQLL6HslU3DVf4aambL91mUMRCOd5L8TI6/bWwIn9+iNgi0OQa6lDu81p7r9gyEJo4DkXiT1qZiobU8InV/wEr9533SRp5MMdroC95OZVgSqZYV89Y5zlu+UAyMVWWTftEZ80cF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(36756003)(66556008)(66476007)(66946007)(316002)(6666004)(110136005)(6486002)(2906002)(31686004)(8936002)(508600001)(6512007)(86362001)(6506007)(38100700002)(4326008)(26005)(186003)(8676002)(2616005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEkrVEtSUms4bFFYY1RRUUpjQkJ2V3ZmSmp1WXhsMjBjbG1mcW9FWVdlSUVG?=
 =?utf-8?B?ditFK3I2R1g3VGE0eE5NcFVjMGZPK0dYUkNVcUNXYTRiL0lwOVFEWnhnTWxF?=
 =?utf-8?B?RFF5RFE5ZnRRQWlUSnBNWFVlNzEweVdWWVFySEk5UWprWEhzM0Jtd1IrTU5y?=
 =?utf-8?B?Y21DSHBCS2RORGowd012WU5reUJ3eDdoTnl2VjJ1dHBIU1Rsd1RtUzBpWWgw?=
 =?utf-8?B?OTRCakR6M2Fxa21TTnpvR1dOWkZDRGg1RUZNcytwd0wvQ2FCbTBSSkNMS1JX?=
 =?utf-8?B?WDRESzB0Sk52Z3RaemozTEJYemtSclE1NGt1RXQ3ODNsYkxNWjBTVFA0NHI5?=
 =?utf-8?B?QjUzNVFidTU5MFliNDEzR2l2MjJldnUwSDNHeGdIaktmRlljTU5OQ1poNEtQ?=
 =?utf-8?B?SEx0NDFJWHo2SnZpejZiNWRkMmVMNXRRKzdhWjVVa1pvQTM0NE1uRVhyb0tD?=
 =?utf-8?B?Yld2TEtmRmwyWEFneG1oOGMrMHZzSWtPYlhkemNJZjQxZTFlaGQ0WWxxbEJw?=
 =?utf-8?B?alJuRGFxT2FHeElzRkptcGcxUnJTbE1sN3hEVGNOMDI1ajRVL0xZb2lTbGFm?=
 =?utf-8?B?bnFiV1lXUGFzbmFoSXdpMExjdE5lLzVTSFNEY0lvT0RTWGowSEl4aU1vbnlm?=
 =?utf-8?B?cWhsa3pEK1RFVXRqTmEzS0xXRm5IR3ZSNmxHcDZsdDJYaC9BMTJYZlRlNUJD?=
 =?utf-8?B?eGR5U25TUkk3ck54NjJIZm9XdDdISFFJSGVIRTlhOENOMVNNbXdKbnFXYmdP?=
 =?utf-8?B?WmsrYzl3ODdmNEVmN3l4T3hLY0VYODI5aTlKREk5Rmx6NUhrdi9hZ0tTZDVQ?=
 =?utf-8?B?a0UwdjRRN0ZPblRhU0pOaVhKSHFxWm1RQmFGWlZMc0FUc2NRODBId0hwQUxk?=
 =?utf-8?B?V05hYVRIQllHSEltMlVtcEwxMGEyVUpudk1sVSs5VXVhMFRiMEF2S2xuTmdp?=
 =?utf-8?B?aER4cWVueHBtZVNvR05Vd0EzaytpQWpZSFhURWMrc0R6YlNrQk9yV1VwU3R5?=
 =?utf-8?B?UjJ6SVJZTWc3d2RTV0lyYUJxVUN1cGVMM3hlQWI1amVtVkxTRG5NSjJybHZM?=
 =?utf-8?B?YXpVVmtDQS9MTjB5dnpsUklhandsR0lZL2ZDMUpOcHNZNjZMV3Bpd3lVZHV1?=
 =?utf-8?B?RU9ZYTk2bDFEeFI1R3FTMElYcXgwTDZUcGpLYm5pS0VBTkY5Y1dqV0dGbFhQ?=
 =?utf-8?B?YzY4RWx2YzBUT3Z0eHY1ZnVwYUk5VThhYnlYM3o4ZzgwTjZYQWVjdnN4SWlQ?=
 =?utf-8?B?WGRnL3YzTmVQenEzSHVBaldpZTZBWCtpMVVJZU1tVWV4N3QrWmFJc1BCMjBV?=
 =?utf-8?B?U2hmaGxwS0ptN29zVUFIa0NEbFdNTUsxdG5DVnJJTGVDaVdoNUtlV2p2SHJ2?=
 =?utf-8?B?SjNYS3c5V2NzOUpCSkc2bGtCc1ljUFVORVYxQ3drb1Z6Smp0RXZ3VVVzTW43?=
 =?utf-8?B?cDJoeUJHQ01zbkhGeWMrNGY0SzMza01XbmxRWUY5bElVcHBpYU5iRENrS2FH?=
 =?utf-8?B?aDZzZlNlMWNTWURmTjhLUnVCOTZlSVBNSm9obnNqZitBMm9JcGUvN0ZRM1RK?=
 =?utf-8?B?N05yQW9nOUFpWVpvck1BcHZYK0srZnVsZ2xBUXQ1dFlLZXhQTEJVeWU4a0pI?=
 =?utf-8?B?VVlJWnlUdlVVcFBsc1ZaZ2hTcnBJeERnVXFYQ1JjcjFVWENGenF6TDNjazNI?=
 =?utf-8?B?bTI1aDZ1VzBxbDYzVFcyeldzY3FIaWUyWTVncjdMWnU5ZE11cFZLNXk5aktn?=
 =?utf-8?B?dTkzWWdlOE9UZ2ZCK3RVUkp4VTRKVUlXNUVTSlZJQUtuanYzMmFrSXlITEsr?=
 =?utf-8?B?SndWc20xWndmZmtuNmN2cHJEN3gyRmxNK2NwVm9QdXAxTjVCVVZTOElSWitB?=
 =?utf-8?B?QmJaeisvUEowcHQxUm9kTlVPeEtkckoxTEVGZW1QUnU0czZZVEpLazhkRzFx?=
 =?utf-8?B?M0FuZG96ZTFzR2dtS00xZHpFQWFjYWFWeFhxQk1EWSsxamxoNE9HTlMwTThI?=
 =?utf-8?B?VGdmOTgwdmR6MXBlRmlzbHpkRHl0U2ovUEVOQURxN0NGOWhoL0QxYTNQUFdq?=
 =?utf-8?B?YmQ2cFVvR1BUN3pkVktrRGUyN3dHdUR2eCt3Vy9reFd2bzkyaHJRbUpOVTVx?=
 =?utf-8?Q?lu2c=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081f7605-56b1-4411-5ccf-08d9d0f3a680
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 09:05:14.2133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPGRYq7bvPBlPNF8cGrqU0KdYBxielieKNjfZtii3UK19ht46po6C8TP3ykfQuLU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0077
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

Am 05.01.22 um 17:16 schrieb Felix Kuehling:
> [SNIP]
>>> But KFD doesn't know anything about the inherited BOs
>>> from the parent process.
>> Ok, why that? When the KFD is reinitializing it's context why
>> shouldn't it cleanup those VMAs?
> That cleanup has to be initiated by user mode. Basically closing the old
> KFD and DRM file descriptors, cleaning up all the user mode VM state,
> unmapping all the VMAs, etc. Then it reopens KFD and the render nodes
> and starts from scratch.
>
> User mode will do this automatically when it tries to reinitialize ROCm.
> However, in this case the child process doesn't do that (e.g. a python
> application using the multi-processing package). The child process does
> not use ROCm. But you're left with all the dangling VMAs in the child
> process indefinitely.

Oh, not that one again. I'm unfortunately pretty sure that this is an 
clear NAK then.

This python multi-processing package is violating various specifications 
by doing this fork() and we already had multiple discussions about that.

Let's talk about this on Mondays call. Thanks for giving the whole context.

Regards,
Christian.

>
> Regards,
>    Felix
>

