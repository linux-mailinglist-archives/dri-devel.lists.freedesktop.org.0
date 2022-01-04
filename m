Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E58C648477A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 19:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787F410E134;
	Tue,  4 Jan 2022 18:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9090710E134;
 Tue,  4 Jan 2022 18:08:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HupS8Jw3gTiaaK3Cb6e7+k3BL0BXDO/cI3wPCisTYCXs1X5OFnJhwdF3iQ/v5mgtX7wDxBVIAkKg8wVivyvG2mc1btEXYPiF/r8JqSv7Izq57/kw8BQ/V05W3obV4pYd+pTftAt0VlnfuWWjzxZuMTB+auvv51vQe/+gdHXUml8xXzs/f8sV/MXCfpzl5ZQGvyho3WF+tvk0bO+sv3Wi6vbHCBitTSVYOIC5ujFxhgyCLnA3fkvReVoJDOZFBwaMfUt34X3mdgMk+XaGlyw9Jsd1BHSGg+wuM+OQNbcN7hUv27G1V+u3CU2zrJowEOArBbvlBy2y14lHCi0ec6gmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0/eTz/w52fZSQtxYU0FOj19OMkgc1iE1BItJzivBT8=;
 b=CM9YFUyedEk/X1axrEw/SqeVfs7dQVgArlbKbzJtWTNdCbwMH74o7ciUHGaYT9uO9W+cusO49kiT9bz+L6G7XAHDtWnAG75TpgD6O+Zbn2uTsQRfoCIIG7mHAk8VqdGWYMA0LB9k2A2Jw1R3Fbk8IUvshnp3r2IAPyPvlji0v9nN8o5+gfxHuGFuYWY+LfIZDRgqi/HCNsATUbOyXCb6zkg6UgeETNVOX8VDL5anbch563BwWyGzKqD4HBfss7LozNqc7qw920crw7tZmpWlShmBoZi2qSfzZ95/rRjGKEreBY/ybMsDHB7KstclJEhecVZ9mnPhyadaLI8rQV6vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0/eTz/w52fZSQtxYU0FOj19OMkgc1iE1BItJzivBT8=;
 b=WCJW0FUwRDDBnFa3nogBevtKJpzCVpPSm0HK8Ncq0w38UZWpQZPzCJTTzb5Xyb3KC9qfl79WeukawczAw1DYh3OarAW34gTF8kUsMWpejYfG04Gtbw+MbieNhNzhuweRobY5VFgX1ip6h7R8PHsk19LygHFegDu4hfdoOS1ipdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 4 Jan
 2022 18:08:11 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 18:08:11 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
Date: Tue, 4 Jan 2022 13:08:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::24) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dac2fd79-24c3-4fc7-d727-08d9cfad2b80
X-MS-TrafficTypeDiagnostic: BN9PR12MB5242:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB52422DC4905033F27092A6C9924A9@BN9PR12MB5242.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hszfKNtqThPrgmCnc3BuSFkcHpskopkht4xPPKuTUIfuuBhoR/bAXuvtMkfx2y3mHhE6VJJeI+mLpRyRSUYqmpS1+EhUkmuWblU9JWM4BaHV6hM+7s8jmrXv6AluzhWodag7xPibgxXcktaLFWRdbVQNeXBO4CITKfQaH8EeoQeOk6AP5wzbLVhayh3v6rIqDWM1gCpacrNNOoD88NWceuCpblknF32oGduZeGBYRipifLI7QLect1uofFeFd8JDDUWZGSNcdp0HGixZvPuNgzIaJjPq8+RYjJldqKOHtga/5CdjXisQIctImEafOKpaOuhQGfr/j/MYOIvvMc02inVRhrI9NgdJhpvoHVtyBw+glA7p18qFeFDpX/auh9R98PSv8FUcIfzRiRChb8xR1ujleEYPB4O9g/hV2lJ5OpIJqvq59+uTCkkIS18+x0Ydm0qA1VD6EtnzopwQQFAKV4XN8KNxOihwUzVremJ9IeYKm3Q0jj1fMgRNbBifl7lH/U11dkR8y0J/LbbkpVsH50g38iKvDHyNpZLwESyHuJE6FcfM+g5Mo+QUp4SBYx1v8UESVYFrx+DUMCHFCVfY42OMH3cSN+QDi4K/xa8ggpzBpnVBJtaFEmOymjNqzN3gPTWoZ6dHnTEYi7F384cRdkdCMq3vXzs1ecDqMIUSWp63/Gg64SJg5EBDPKEag1dStmjy8t2CdCCR3YH5YkkPi2fGKHaf3UsnygVDiYqM+C1hM/VKS2PeLZ231NIXBdPQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(4001150100001)(2616005)(8676002)(66556008)(5660300002)(4326008)(6486002)(6506007)(66476007)(44832011)(66946007)(36756003)(8936002)(31696002)(186003)(110136005)(26005)(2906002)(38100700002)(66574015)(316002)(508600001)(31686004)(6512007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBlWStvMjIwRUV4QytMTllLcCs3SlpQay9WNFZ2YmdYbGRkS1FtU3d1YnhF?=
 =?utf-8?B?THRXQWdPeW1yME50NWppNlNFMUViNzdxNU1tSktlUDUvS0w0NlM3c1dDQTJa?=
 =?utf-8?B?bkJBUmlJcVRTK0FaQ1lPL3JhUjB3NGRNTlZ3U1dwV1BRM3NOanZ0SkdRMDFi?=
 =?utf-8?B?Zm96VnU3TkNkZjYrenBTb294Rmd3N1ZRd3JyTGJ2WUNTeEZGRkVtVk5tdzV6?=
 =?utf-8?B?c3lITHRJaHdmZzZOWXZFdDZ3a2xoMjB0T1Jub1E4MzBXWU80SXBONG1zb3RS?=
 =?utf-8?B?b0o2WTFWVlNNc1dSeG9tOUZkeE13cWxLWW5HM2ZlMXdYWkRjWXdRZm1VRm9E?=
 =?utf-8?B?d1V4RDlCcTczRmI0Z0pISzlRTDBNOEdSSDJXSnlJU2l5NS9DOXV3aUh6Vmt6?=
 =?utf-8?B?S3E2cW1GdVBnUXQzRW9vSHQ0VysybGlxNjF1UUlMWXpWZHFIN1YwYmNZaGRE?=
 =?utf-8?B?VEk1UndJdk5TOEhXRkdYYmlMdVNHdzIxWDQ3MnVySFp2TXVsYjRZeXJSRWJk?=
 =?utf-8?B?enlITFZhVmtVK0Rpb3JPMFEwcDB6Zk9pNkV6ajVtT3Yrc2dpcnpVTmtKeG1O?=
 =?utf-8?B?T1JZRVpyeStydGluTm5RMWhVN09pM3oxNDlZaXRWb2NlWmFWMG9JOUxXalRq?=
 =?utf-8?B?TDhPTUk5eVFnaTFEYnovT0lIcUhaWGdNc3JpVVFPOEgzNFlJeUhyWUhUWTFw?=
 =?utf-8?B?UmVZTlo3SUdTVUlDVlYvbXp5dlFxNEtDdVdiRytPb09CYWdsVnI2dFZiRkVK?=
 =?utf-8?B?NnFqSzdSVC9LaE5TK24rRSt5R01xM0tPdkp1YnZwNkdBOTVHc01ZMXcxWTdQ?=
 =?utf-8?B?SjJhWW5kbEg3SWtGT3ZNZnV1K2h5enJ1WDBnb1lmN05abXMyMzNhd0lQSTkw?=
 =?utf-8?B?bGpNaWNiZnl2ZmpTbHNwL2M1cmlWRFpsVEM0UEs2YXNEOUlVNTFCdUFjOXpX?=
 =?utf-8?B?ZnhOa2lBeWFJVGFWUC92dzFvcGNiYVpaV1k3Qmx4MjRLRFBaT2lIeWdORGhL?=
 =?utf-8?B?S2pNdjFVUFB4SGJMRnJlWFpQT2pQSnQ4dXppb0pKcGp6SVJ4L2xVaUs2NnhK?=
 =?utf-8?B?VVpwbk1ScnJJSVNCdk44SmJ6aWM3NFFIUndtS0lhb2FLTDE1QnhTK3BBbkVM?=
 =?utf-8?B?R1d1QlNWbHFDT0w1NGdmSnRPcTVkVUlhQVNLUGJZVWtQeUxZb2M0YlNIb3Fz?=
 =?utf-8?B?K3pkZXhTdnVXL1NHdU9CNUkxYVdNR1B5N2o5UXdtZzJpajNHdHk0NUhMSEVE?=
 =?utf-8?B?WkhpQ0hNMHFydG9xd25sM2tmMjFaVEUzT2tUYnl0TldRRmlHQWdZNllqV2xV?=
 =?utf-8?B?Y0ErbTNpajYwTmVBN2RoWVZnWGNXSjhUUHFobDdsZUo4Vzd5KzRLL2oxcStE?=
 =?utf-8?B?NGhDbkdwLy9KMnl0cHgzV1BOb091aGxIQ0ZZaWwreW5mcjIwUkhZMU5LZ21q?=
 =?utf-8?B?TzJ5ZnFuTkhad2JNYThJbHdBV3Z3UWJIclBKRWxSeFNwbDA1ZU1WV250ZGJp?=
 =?utf-8?B?NXhueS9ydlplNGovQWtaQks2YVhFbSs0U3dDc0JhNXAxd0dZL2E4Q21VVEVX?=
 =?utf-8?B?SkhIMXJHa1dDaFZOTy85YWtZdHR1N1ZoeHRUREFTdHd5aW1IRE9WNmUwMFV3?=
 =?utf-8?B?Rk4vWE5nYmttUjl3NXBONFZ0MEJPWGtlR0oyRUQ2cnNkN2VhS09BS0hCcG1V?=
 =?utf-8?B?Y0ErMzNRM1NhVk15SjZ2K1UzMCtWYndUWUJIKzArNFh6L216dG4rWVZkWDZ0?=
 =?utf-8?B?SGJTMnFBV1FXa0sweFJsMXYwaG5nRGhSVER1ZW5jUFY2N3Z0TjNZYVUvTjc1?=
 =?utf-8?B?SERKSGFmU2R1MU5QWlNoK2d3UXN6a0Y2cWtncDExUTJsRG13Vnh3elU3VVZt?=
 =?utf-8?B?ZVRxSnZwcDY2LzdyMHNXeUx4dVJZSFJQWVhPTTRzeTgvTEVqdERNTG8zdkpo?=
 =?utf-8?B?SU9STG9memJnUFFya0F4NzQrU3FHQ2Uvb2pTZ1dJQ002SDN5V2srUEJ6TnFn?=
 =?utf-8?B?STRkOUoxa1JKV1lEWlFvcGltOHZYaE15ZG1hZFUzR29DR1pzV0hIYy9DMVRo?=
 =?utf-8?B?ejU4S1d3L25Ka1NzTmIvNnpLTUhyNEIyZ3BQUERydFhsYklWc1VrWlR4S0pw?=
 =?utf-8?B?c3Rxa2gxdUJUZ0dzTXJKdWtmc24yMDRKS3pOeUtucTZGS0RZbVZ2bDFUL3BI?=
 =?utf-8?Q?XU7IWdEdiaCGJmfgUIIPHcw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dac2fd79-24c3-4fc7-d727-08d9cfad2b80
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 18:08:11.6885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15zZ7/XiPNCErhNeTkl0UQmscNFpsBpH6uCyY3GoF3SW09zfy5KM1UfP/eUGJiOunvKxTLUfMnsu9/t+yNBCJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+Adrian]

Am 2021-12-23 um 2:05 a.m. schrieb Christian König:

> Am 22.12.21 um 21:53 schrieb Daniel Vetter:
>> On Mon, Dec 20, 2021 at 01:12:51PM -0500, Bhardwaj, Rajneesh wrote:
>>
>> [SNIP]
>> Still sounds funky. I think minimally we should have an ack from CRIU
>> developers that this is officially the right way to solve this
>> problem. I
>> really don't want to have random one-off hacks that don't work across
>> the
>> board, for a problem where we (drm subsystem) really shouldn't be the
>> only
>> one with this problem. Where "this problem" means that the mmap space is
>> per file description, and not per underlying inode or real device or
>> whatever. That part sounds like a CRIU problem, and I expect CRIU folks
>> want a consistent solution across the board for this. Hence please
>> grab an
>> ack from them.
>
> Unfortunately it's a KFD design problem. AMD used a single device
> node, then mmaped different objects from the same offset to different
> processes and expected it to work the rest of the fs subsystem without
> churn.

This may be true for mmaps in the KFD device, but not for mmaps in the
DRM render nodes.


>
> So yes, this is indeed because the mmap space is per file descriptor
> for the use case here.

No. This is a different problem.

The problem has to do with the way that DRM manages mmap permissions. In
order to be able to mmap an offset in the render node, there needs to be
a BO that was created in the same render node. If you fork a process, it
inherits the VMA. But KFD doesn't know anything about the inherited BOs
from the parent process. Therefore those BOs don't get checkpointed and
restored in the child process. When the CRIU checkpoint is restored, our
CRIU plugin never creates a BO corresponding to the VMA in the child
process' render node FD. We've also lost the relationship between the
parent and child-process' render node FDs. After "fork" the render node
FD points to the same struct file in parent and child. After restoring
the CRIU checkpoint, they are separate struct files, created by separate
"open" system calls. Therefore the mmap call that restores the VMA fails
in the child process.

At least for KFD, there is no point inheriting BOs from a child process,
because the GPU has no way of accessing the BOs in the child process.
The child process has no GPU address space, no user mode queues, no way
to do anything with the GPU before it completely reinitializes its KFD
context.

We can workaround this issue in user mode with madvise(...,
MADV_DONTFORK). In fact we've already done this for some BOs to avoid a
memory leak in the parent process while a child process exists. But it's
slightly racy because there is a short time window where VMA exists
without the VM_DONTCOPY flag. A fork during that time window could still
create a child process with an inherited VMA.

Therefore a safer solution is to set the vm_flags in the VMA in the
driver when the VMA is first created.

Regards,
  Felix


>
> And thanks for pointing this out, this indeed makes the whole change
> extremely questionable.
>
> Regards,
> Christian.
>
>>
>> Cheers, Daniel
>>
>
