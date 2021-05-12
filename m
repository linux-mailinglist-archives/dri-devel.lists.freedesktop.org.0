Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B2C37BA39
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 12:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB52C6EB6E;
	Wed, 12 May 2021 10:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEF36EB6A;
 Wed, 12 May 2021 10:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVpux50tocCVsqUy62YLymme2IpMI8tley5rxbsUc70CAWBeq6SpaX292gffcz+tD7MIb+Gpmx5djkZVtzPEbyI1Y0GtuoIup2im0A9MuB+vhRLvlspoO+L7DOPV5tqqYIIzpGoFjk8ekWanUKGOKWu3HbzzK24udGjiL0Y4dbHJRv7KEP6MDX+c12Txz2Uj856XeUdoD/+rBYKgUhEaZao6bsYNcItw0grgFn9+8bhINSp3co7vvHILzXrfe5InQlHvAGieLcsUEcNyWJvf4pu5aJCBUa9Hgss7ycSsZSqImS6hTRidk1B2u5C/Ev5zTw3zciVHd4/6A7ejzKrjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ81k1dGfwvt/BH83iWoUd8+mIkypbPvj2OGyk0RtAA=;
 b=HjjryX0VgUoEs7PYG2lM4X0Gk7XmFx3DrvIIKkuIi+3YK0W5fc53bokCBVmZKaz5CROolKCzh9YLfUB0YpfsTD5q/2ZG1j4fQOp8T3Y7FISYXRVSXyTnexai4TdcOLlOoxnGz9rT63C2VcGe4/vohnQKUZugRdHTd8djwF2fOpUEl2PZhNFWBLfaE7Bhch1ZQ1jvBU9o0smFRQuFhW/y9jJsMBg3PXuGzXiYx+jZU8ipmJLPMjdd5OVnB8KmwiYs/iluxUrIXlBiGR5aStWH0pP7TPZEAsbte7UUSyBsHkAdZpadBU30e4GUwCy720tztfHuEo7GzeS5FuG2EbzUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ81k1dGfwvt/BH83iWoUd8+mIkypbPvj2OGyk0RtAA=;
 b=rWlcfuOQ9gNztDicJkK8saDTSwR2zJRDBczaIRdZOm2m3jyaam+6uRxqDILxvXAx9/W9W+FIBMcMLK+VN777ZENyXs4kuGbzi0BG6nnFtSlyNAHgaT33Bb8Ga7rSUv/N4f8acZoFGU1Ks+pKvU+P1ow9tNnVgkK/lmRKtqNgHcw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Wed, 12 May
 2021 10:21:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 10:21:02 +0000
Subject: Re: [5.12 regression] ttm->pages NULL dereference with radeon driver
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Takashi Iwai <tiwai@suse.de>, arvin.kebob@gmail.com, mail@dennisfoster.us
References: <s5ho8dmh98p.wl-tiwai@suse.de>
 <aa54b1d7-1d3c-4c77-37db-d6c93b8c794c@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <72fd6a34-89d6-f46c-36ba-5b006dd47019@amd.com>
Date: Wed, 12 May 2021 12:20:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <aa54b1d7-1d3c-4c77-37db-d6c93b8c794c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bc39:4e06:ac5e:2e31]
X-ClientProxiedBy: PR0P264CA0191.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc39:4e06:ac5e:2e31]
 (2a02:908:1252:fb60:bc39:4e06:ac5e:2e31) by
 PR0P264CA0191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 10:21:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63d08f38-30c4-48cb-ec7c-08d9152fa4d7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41922F7E819458E87F4C5D8183529@MN2PR12MB4192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1LmsKaq67Eb02hdvK4qMHkG2D/0uR3eAyecdjZ7T1z5bsEvjWs3fb+91sFl9jHQM+ZpPyN7XANm3lF1m82GeCojcuY4p8NRmAAWv88vzHQe6p/v7CTx05cZvhl26kahrxM29W4G/vUvcX92uUqt3CNFUBRvsB/D7Og3/9y3VHPgybwcEK23KMEPsSJlLIsFS+TZeq5jBuE41M0M63wqT2HcGjRKOWrMNdwsTjJQ9TNJrjPAarY0HCVLOznrp1G/Kwf+39UEghWT2WwTS6vakzPDIvrDU7uD2R7CY7bFcTZ4mqImmq3qM8A53KRuUpRBDqiD6/gycFw6RvCPwPqdahCgLN4/NTA0EGLzfPaDkfB6Sfv4bKbvUkvToe1AKDDG7KzENRXGtGZxAnI9k6yWtNHFwnUnbzOuotD0WDUyReNtn7xdlTiM0/onp+/UiemtYzq65d5ebMG5oI55AwFnXuPpj2WljK2rnSrSOO/jE4aRyKaIcXSIJ1Z8Sw4VPtwUIcjZgDXR/rEd7ITT44fQ5HsSoodmTAs5g2ikhZZ5W08gs4EfwSu3YyF0Znhxk3IRfuwChvBjr4ftwvMZF7Rcx2aYr9Y26DZokE0uZJobA3ezG1YsYNPOkbqXh1/yuV/wXE4RZxxW2GndIy+U39i+NlMKas8X1yAyb+CMY+L23zwNY6UwGw0plOxqukylCXbCRa7JkantH3jB1enCHPAGwNB8M3emTjrcZzNl4n6NbJmEdx2RYN4pPQM8uhBx3AXykQ5+w7RJz90xpGT69rtKRHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(8936002)(52116002)(66946007)(83380400001)(110136005)(45080400002)(5660300002)(66574015)(31686004)(8676002)(16526019)(186003)(2616005)(316002)(4326008)(36756003)(6486002)(478600001)(86362001)(38100700002)(2906002)(966005)(66556008)(31696002)(6666004)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFdnb0JhYmVMN1JzL3krM1lTcUYyUC9EVHF2ODVtbDNJQ0ZHK0szMTBoYmJP?=
 =?utf-8?B?dklXQktrakRzZTJmMjI3c0lXREx4bm12amlURVpBZ1YyQTJGdTNEMzdoK05B?=
 =?utf-8?B?SkNiM1BPRVl1ZVpudU5LOE5IWEFlYnB3dHdqZlpyK3BlUXpubzhFRnN0VmZ6?=
 =?utf-8?B?MWYxbUhWTWIrTzZjWjhYRjJCa3JKYTFoc0NIVW9GVjkwY05NQ2FDRW9VOFV2?=
 =?utf-8?B?WVdMQTVlQnZpbHMxTGJQWG9YM1NmSlBSdXpSVGlaNzFLN2VkVlJvY1FmNzJN?=
 =?utf-8?B?SXpwc2V6OXFrM3hscWJyWTJyb2czR2I5U0VaWS96bFNMWms5QnBydmk2MzdU?=
 =?utf-8?B?eURMZnJxNkJJSERkS096SWRqb2FVbnZhMjV5ZWRqMzFacUpiNGJhMllPZkVk?=
 =?utf-8?B?a0QxMUdtMjhWQzloZlg1SmkrdXVSVEtPTkhJRDJGRURkNEZRNVZYd000ZjFJ?=
 =?utf-8?B?aHJMblVnUm1MdjJ3V25aVDgvbUxaSG4rOFphVjlGZlg2QmFiNVNhaHVrbGNI?=
 =?utf-8?B?LzhGeXkvY3dpd0N3djVyd25aNGJXSTZuSTA5aGozeG5PQUREUkQvSFdzVks5?=
 =?utf-8?B?NnlwNERhVXZPZVhuTUhtaGRVZ21sL1dNRE04bnhNREV0OVB1VHJFTmJ1M2F4?=
 =?utf-8?B?V2lHdDhhQUp4aDBwMno3bjRvZTRpaTV0Vm5yTDJ5T3N1alIxd3ZObVpiTDRo?=
 =?utf-8?B?RlptRzJseHhBdmI5ODhtWmJXcjdMOWdiaGxwakRGTDdSVGVPK25kS0VHcXZW?=
 =?utf-8?B?Y3QrZVhtbHMrVTd6VzQ3clpCRW00NitUSW5JZk5aZDN5Wk1pc0c4Snphd1BE?=
 =?utf-8?B?N3FUVmpSWHVSZy96bnNOZ0FKNHJCay9LZStVNkZqN3pkbFp3UHB6Q3R1ZDZq?=
 =?utf-8?B?cnJhYWk2MERRK2N1blpPZ1kwNHhDeTkvZnJDYjJIaS84NHZNcWNtblFnWVRi?=
 =?utf-8?B?V3NLbUxERVNMWFh0Z1dXYVJNY2JWK3EzY1NkNVVhQ096NlhIT1dTclRabEo1?=
 =?utf-8?B?Yk9iR1FXZFRWYWlCMHdHSENyMThlZDNzSDBpYzY2TzV1dldVc1U5U3EvZ1RE?=
 =?utf-8?B?UkhGc3dEMTZ4YmtlRm9BNTMvb3RoUWtMRCtxL2RjWExlL1NYWEJxSW9RYkNW?=
 =?utf-8?B?MXFnSDFWTThLTjlRbGcvSExGNitkaGJ3Z3NzQU5oWG05UzdBL1c5Sy90MFZ6?=
 =?utf-8?B?NDhTTStVZ24yOGd5cHpSa3RVRmN0bEZmdnQ1d0dWTjcxZkIrMVJVUm9odVVR?=
 =?utf-8?B?SEhUTGpuL2F0ZUpHTm16WmtqdlkwYkF2WnZ6NkhRRE5HR01pdWtIaTVBREZR?=
 =?utf-8?B?RXg5RWwvRGQyWURTNTR1L25IaXA3MDYwbHVpaCtnRkxlcFd1QVUvTFU0aDc4?=
 =?utf-8?B?L2tEcmdsVW1zRHR5WTFoS0V6ak9TRGxsc0tPUkZiZ1NXRUxXd2YrVEE2NkFV?=
 =?utf-8?B?UXhtL0w4b2RqUUZWbG51MXZYS3N5K0V4VEp2dkRmUnI3a2w3bmJwZ0JIcXBI?=
 =?utf-8?B?bXhkQmZCd2daMm8xWDRYZ3hFSnhJUStadk5PN0tMbzI5cWhMWG03MzlibklP?=
 =?utf-8?B?YnFlZ2dtUVlFc2dDWW1HYVNQa0g2T0pwV282NDhqbkZ0MXFYRS9wREtkbnNk?=
 =?utf-8?B?cFZUdlgzbXlhanJLWkp0RHByc2UybDFMR05SNmh4c3ZtRk9CWVgyY0w2SERE?=
 =?utf-8?B?YWt6ZW9MZ2UySnZPcWhSZWx2emFob2lZcDhPV1gyOWsyUEtNUzZLVnFlQUM4?=
 =?utf-8?B?RlBmZUtXV3BPV29VQmdyL1Azay9ab096VHR2WVlJVXp5RmxrQW5xN255UnR6?=
 =?utf-8?B?NUNVem5tNHdzdFA5dExvdGo2WTdJTm9vM1hCT0NMWTI4ejMyUllQZ1FZamFm?=
 =?utf-8?Q?tuIf6ntiT2qdk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d08f38-30c4-48cb-ec7c-08d9152fa4d7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 10:21:02.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSo9wngroewNXFH6JSieHRO88WMeinqayE/mpFuSlPH/MFQwH3qj+9OvLMKNHF+I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4192
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi guys,

adding a few people who ran into the problem as well and opened a kernel 
bug.

Am 07.05.21 um 17:11 schrieb Christian König:
> Hi Takashi,
>
> Am 07.05.21 um 17:08 schrieb Takashi Iwai:
>> Hi,
>>
>> we've received a regression report showing NULL dereference Oops with
>> radeon driver on 5.12 kernel:
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.opensuse.org%2Fshow_bug.cgi%3Fid%3D1185516&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C64447e9e97604aaf117008d9116a742a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637559971181187178%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=1LJMLxuuMjkfgnIt%2B5Z5n19ri%2BMTLMQvEEB%2F%2Fd6SVkg%3D&amp;reserved=0
>>
>> It turned out that the recent TTM cleanup / refactoring via commit
>> 0575ff3d33cd ("drm/radeon: stop using pages with
>> drm_prime_sg_to_page_addr_arrays v2") is the culprit.  On 5.12 kernel,
>> ttm->pages is no longer allocated / set up, while the radeon driver
>> still has a few places assuming the valid ttm->pages, and for the
>> reporter (running the modesettig driver), radeon_gart_bind() hits the
>> problem.
>>
>> A hackish patch below was confirmed to work, at least, but obviously
>> we need a proper fix.
>>
>> Could you take a look at it?
>
> If that's all then that looks trivial to me.
>
> Going to provide a patch on Monday.

Sorry, was a busy start into the week. I've just send a patch which 
should address the issue to you and the mailing list.

Please test since I can't reproduce the problem locally.

Thanks,
Christian.

>
> Thanks for the notice,
> Christian.
>
>>
>>
>> thanks,
>>
>> Takashi
>>
>> --- a/drivers/gpu/drm/radeon/radeon_gart.c
>> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
>> @@ -253,7 +253,7 @@ void radeon_gart_unbind(struct radeon_de
>>       t = offset / RADEON_GPU_PAGE_SIZE;
>>       p = t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
>>       for (i = 0; i < pages; i++, p++) {
>> -        if (rdev->gart.pages[p]) {
>> +        if (1 /*rdev->gart.pages[p]*/) {
>>               rdev->gart.pages[p] = NULL;
>>               for (j = 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE); 
>> j++, t++) {
>>                   rdev->gart.pages_entry[t] = rdev->dummy_page.entry;
>> @@ -301,7 +301,7 @@ int radeon_gart_bind(struct radeon_devic
>>       p = t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
>>         for (i = 0; i < pages; i++, p++) {
>> -        rdev->gart.pages[p] = pagelist[i];
>> +        /* rdev->gart.pages[p] = pagelist[i]; */
>>           page_base = dma_addr[i];
>>           for (j = 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE); j++, 
>> t++) {
>>               page_entry = radeon_gart_get_page_entry(page_base, flags);
>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>> @@ -360,6 +360,8 @@ static int radeon_ttm_tt_pin_userptr(str
>>         if (current->mm != gtt->usermm)
>>           return -EPERM;
>> +    if (!ttm->pages)
>> +        return -EPERM;
>>         if (gtt->userflags & RADEON_GEM_USERPTR_ANONONLY) {
>>           /* check that we only pin down anonymous memory
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C64447e9e97604aaf117008d9116a742a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637559971181187178%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=RdzGp1FLxBKE%2ByPclrUBfQomRU0pQT%2F78Ewcj%2FBZ73g%3D&amp;reserved=0 
>>
>

