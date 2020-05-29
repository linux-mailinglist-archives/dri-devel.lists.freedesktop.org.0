Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B21E7819
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 10:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C0F6E8A0;
	Fri, 29 May 2020 08:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3466E8B4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnasTsAaH1QPZz4r5Wzj4GYrLTA9jGUAHIX7btfYEFFZcAbeMwcMWNiAeYx45t3UD6jcGBNu4N8HKtyrHes6zsJ0b6dHkVc8hLiQ5O5T1AsXopcq43CJeoq97KKb3dlco6Nlg702bM/EpzctA3mslzMlENXAuI++OrbXxTp3W++5tBNp/vljHKezVPId1wrx23h8jfJMXo8bPSQOlhQklWwz6RWGkh3xAmRXvuDm6xFEyIqb+5wF6MhUU5ZOBYRfFLCjpcXble1Jrh9yywoYOt6P47ENaV14VEsYXF52+B4yYIgTozWN1+aeVy5u7VNyxM4mi7ENnHhKmcfFFuG2tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/bsRqfDDSkrDRrgyOu6Fel3HJTfAdS310AtZKQo0Zk=;
 b=W1UukHvtUmwBVpewCP4IGrYqrr5V1Wl1lXAQvEJTZNqkWusg0ziKYN6EcZFpgTBDQj+zIr3UbMHUX1eWh//tY7Ln9IeCzR98ozDxhVoouAy5oSvMp7gjezgPaUCKQy/4e05Rqxc6QDUi8tOFlCgaScLBJEKLGvV5w+drMXqmi2vcbVPPMmxQNNT08bGbMvMBhxH3Napi3mPh0Yr/ymiWL6eqPyCg40bQSN/O/TESG715DHbk2TEUiq95XKQk0BMqH0XnTElUNLPRPkhhtgPa1P+Kc5jc4FueNGLklj9JBpYREGUE9obyWQ/iwVyQQc1amtW3la+J/JXAckKI5T8WSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/bsRqfDDSkrDRrgyOu6Fel3HJTfAdS310AtZKQo0Zk=;
 b=fnMDZK6qoVOIq+cS+TH8LCJpLPWzUNJq3OaUVhVwcYB88zgd20LRUpxWwkB5bxewTduxKgIL2N8EIwGsLe9sCv8UOH/U7U5nASOrADw+QgZj7tPyPuzV6n0G1TArhmUsNluqEh6JOJ/XWx7wCLAMKM82dVaInPxqPJ7SHHTbn5s=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3488.namprd12.prod.outlook.com (2603:10b6:208:ca::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 08:20:10 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::8843:c094:fb2a:d60a%7]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 08:20:10 +0000
Subject: Re: [PATCH] drm/mm: add ig_frag selftest
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200528130556.53275-1-nirmoy.das@amd.com>
 <159068188106.10651.8110655246465285780@build.alporthouse.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <3ff08d28-a1f4-6275-50c1-f2ba67bf5d74@amd.com>
Date: Fri, 29 May 2020 10:20:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <159068188106.10651.8110655246465285780@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0045.eurprd05.prod.outlook.com
 (2603:10a6:200:68::13) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2003:c5:8f1f:600:dbea:65ed:a38:6805) by
 AM4PR0501CA0045.eurprd05.prod.outlook.com (2603:10a6:200:68::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Fri, 29 May 2020 08:20:09 +0000
X-Originating-IP: [2003:c5:8f1f:600:dbea:65ed:a38:6805]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9b2c5f5d-9d0c-43b0-ae1f-08d803a91a43
X-MS-TrafficTypeDiagnostic: MN2PR12MB3488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3488CE25B6B244E4B592C0338B8F0@MN2PR12MB3488.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzcH0W7lFlOW8Ad34xWabH2HP/W08hrhq2zuOKYQRmKti7Q4IjSDr3UpAnLiZlp/PdT1YbeVmkW0E6zS42MWIUqEj6+ftFYYskBGrIemj1hSgDXtk53m1nPQxbCWUWbEjkMztT90mMVmBSlXo5JpemnpqGbPP496Z26lNNiN9EOq/f/Y0Txr0V0Rci/9e6mQ5vBGUaxELVoftXv2S8b0hwRolx1YB9FHr0Tcvb2gSuZF7y7mfpagE3u2YCbOHl5UNMLNxILjglWB/QltWOIl5e6KpKTJmIZWuV7/yQWUzLKwrvcPnV13e2xfQL1lLsS85SKhSPhREb6U5G0l+a69wZTETxj3MB9Bp0+4Jxqs6aELf9SMTQ6duRdLgBCMEajCh1bMS8vRyixYyAIGlpxxIsgITt/Q8LsC4j1UJoCbvVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(31696002)(45080400002)(2906002)(6666004)(6512007)(8676002)(6486002)(5660300002)(66946007)(8936002)(66556008)(66476007)(110136005)(316002)(53546011)(2616005)(36756003)(83380400001)(4326008)(16526019)(52116002)(478600001)(966005)(6506007)(186003)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7lBWFh2mYTjGIT1S/1D/rAzgw66y4SZHY6fjiqOqYvSjQVIWY0ZAmF3SoWtiRyk0ikj7B5Dbvp41xTCv+rkTrBAeYcvCiyIBozL0rB/CjSaNcCDkdp8u0Anti1TlIaxtKwRoPd+quxi51GqDN4ONfV26zB+FUV76qeJrRUBaRzNjtwBHlndwu4GGP3voqhqBmHYtozNRzHX4OjXRRCq63Ec1IJB9A/D36GaftZ+3iMX7TSMHnRXbu/OYdG2+iguc2VFjHvyyEpjeHzD6/bwdzd1BP2i4IxQYbiyqPftEwyPbVqULe703WELz1LwOBmA0063HcrDUNarIoiCkOVN2maXH6bjxkycjucjr4pwQDbpll0ptYmBihGhShNuEEqeFdSMf+N5CGAd1myESjjJK9iZGPhH6dgCEvRi8OSX8W/l33MsIxaQrTNRrHzENQLENIl1OOna+E8vQx6oLMN66wuJuMsfq9gg5rAUAbx2nCF4dx3qtBuXD9y+LN5rQoJcazINTc6/hDp/GY1brRfzWTS/dqv+IIva19E87fIzz4Dw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2c5f5d-9d0c-43b0-ae1f-08d803a91a43
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 08:20:10.1762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKKdecuP92RzirVW9M/vd3+J4FQPV9PQVwshKGDP8fLo9jZVfsw7bvGQ1dMIBKqnh4sfQSHy55FjpshBxg7q9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3488
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/28/20 6:04 PM, Chris Wilson wrote:
> Quoting Nirmoy Das (2020-05-28 14:05:56)
>> This patch introduces fragmentation in the address range
>> and measures time taken by 10k insertions for each modes.
>>
>> ig_frag() will fail if one of the mode takes more than 1 sec.
>>
>> Output:
>> <snip>
>> [   37.326723] drm_mm: igt_sanitycheck - ok!
>> [   37.326727] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
>> [   37.326728] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
>> [   37.326728] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
>> [   37.326729] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
>> [   37.326730] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
>> [   37.326730] igt_debug total: 4096, used 2048 free 2048
>> [   56.040064] drm_mm: best fragmented insert took 504 msecs
>> [   56.082184] drm_mm: bottom-up fragmented insert took 40 msecs
>> [   56.102255] drm_mm: top-down fragmented insert took 20 msecs
>> [   56.107177] drm_mm: evict fragmented insert took 4 msecs
>> <snip>
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> ---
>>   drivers/gpu/drm/selftests/drm_mm_selftests.h |  1 +
>>   drivers/gpu/drm/selftests/test-drm_mm.c      | 59 ++++++++++++++++++++
>>   2 files changed, 60 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/selftests/drm_mm_selftests.h b/drivers/gpu/drm/selftests/drm_mm_selftests.h
>> index 6b943ea1c57d..8c87c964176b 100644
>> --- a/drivers/gpu/drm/selftests/drm_mm_selftests.h
>> +++ b/drivers/gpu/drm/selftests/drm_mm_selftests.h
>> @@ -14,6 +14,7 @@ selftest(insert, igt_insert)
>>   selftest(replace, igt_replace)
>>   selftest(insert_range, igt_insert_range)
>>   selftest(align, igt_align)
>> +selftest(frag, igt_frag)
>>   selftest(align32, igt_align32)
>>   selftest(align64, igt_align64)
>>   selftest(evict, igt_evict)
>> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
>> index 9aabe82dcd3a..4c08ca86bb86 100644
>> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
>> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
>> @@ -1033,6 +1033,65 @@ static int igt_insert_range(void *ignored)
>>          return 0;
>>   }
>>   
>> +static int igt_frag(void *ignored)
>> +{
>> +       const struct insert_mode *mode;
>> +       struct drm_mm mm;
>> +       struct drm_mm_node *nodes, *node, *next;
>> +       unsigned int size = 4096, align = 8192;
>> +       unsigned long start, timeout = 1000;
>> +       const unsigned int max_count = 10000;
>> +       unsigned int i;
>> +       int ret = -EINVAL;
>> +
>> +       /* For each of the possible insertion modes, we pass an size, alignment
>> +        * value that is known to introduce fragmentation and check that it
>> +        * doesn't take more than 1 sec.
>> +        */
>> +
>> +       nodes = vzalloc(array_size(max_count, sizeof(*nodes)));
>> +       if (!nodes)
>> +               goto err;
>> +
>> +       drm_mm_init(&mm, 1, U64_MAX - 2);
>> +
>> +       for (mode = insert_modes; mode->name; mode++) {
>> +               start = jiffies;
>> +
>> +               for (i = 0; i < max_count; i++) {
>> +                       if (jiffies_to_msecs(jiffies - start) >= timeout) {
>> +                               pr_err("%s fragmented insert took more than %lu msecs\n",
>> +                                      mode->name, timeout);
>> +                               goto out;
> We will run into problems with fixed timeouts on slow devices (emulated
> virtual machines and whatnot). And yes there are a few that are known to
> run kernel selftests and send bug reports (and complain about slow
> tests such as the other drm_mm selftests :).


I had this in my mind but didn't think about emulated VMs :)


>
> Off the top of my head, we expect the fragmented search to scale
> [sub]linearly, whereas at the moment it's quadratic. How about if we do
> something like insert as many as we can within 50ms, and then verify
> that if we double that number of inserts it is less than 200ms. We will
> still run into fun with the CPU scheduler causing imprecise timing, but
> that should have sufficiently wide error margins.


This sounds like a good idea. I will send a v2 and cc to 
intel-gfx@lists.freedesktop.org as well.


Thanks,

Nirmoy


> -Chris
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cnirmoy.das%40amd.com%7Cfc9863e63ecf452884d908d80320d969%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637262786936101207&amp;sdata=J%2Bpu1rYIsLv5KBpD89rTkU50w%2FABDcGCDWlMnutvy%2B4%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
