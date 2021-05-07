Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DCA3769C5
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 20:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA5C6EDD2;
	Fri,  7 May 2021 18:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770078.outbound.protection.outlook.com [40.107.77.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11D96EDD2;
 Fri,  7 May 2021 18:00:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv64cOpjzImSkzvfpd+4Ge9GvZYl3eIx81q48p06KMPLvms4VMLX3nwrmtKiPJ10BYN3o18PPiVOtvEkxlB2rURbH2pT92ODR5Bm0p+GpBQk1kAORcBt6KqP57jdZKPo7iEHTIrglgxpQCl5FwP01rgRGiN3dH/nolNdREsGJEQTY6jr5iWN1XThubUjPHlMin6jmxpvwSVGzL7RJrxeXtPuB+67SmRdn5qAyMmGa2lZm7l7FoFaF3bIxcMteatkZ8y+KBlj5BXkSJ5vNiY5ezpj/CLmVVmdLESvjYCD5ig7Pm57PfZahpNtZMRi8mKSZWf+3jyktakA2NBamx7JoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrUnOmu4zw+eEqMpsH41psZvGp5CS84UanOComc7TAs=;
 b=ItHaI9gjypwMdaMy4YQoyunhqPPuyGWOzGVfLylu8RkAhgXSWOQIS7wLJgmLWG3BFIaTKe8JsIdsVi9Mn1/Q3cdK5R6+laDjZgjUMkgQ5Mmo4YCnvCrGA/7m1CnBX3zrzg0DddI90KT401x8sfocuDdWU4rcBQb2IiWZUvQYfVaeRhe5L0O6WVYVXD2INKG8UpnPl4GCSEuCd2bbDlN2j9uDromGtWZyxnC5NL0U/UL6A07jhZqJpjzsvG0OQTeoN8n7cEThsOY+RclQBXV0qEku3r2EWyWKnSSOFzCq7OKxIoSckGCoVko47wbb5+Cvk6ae5IBPJwUZ4BkN6Goraw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrUnOmu4zw+eEqMpsH41psZvGp5CS84UanOComc7TAs=;
 b=IPLBCbVe6XA4xKKQGY+ocxCobsB+mCZIFAjp5XZ8i4HYnMJENPdBwQiwHUOWdZcFxjXN+TMSs0Mnb5ni9aXIo/xOyCmtALZCNulnPJDrLMfZsrXXxWX6unChkWGwy6OgvDzTNb+Ef7m9Qaee1g2kt1p3AO52w0YE8AGhRuPlWAc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 18:00:18 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.030; Fri, 7 May 2021
 18:00:18 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Daniel Vetter <daniel@ffwll.ch>
References: <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <YIsDXWMYkMeNhBYk@phenom.ffwll.local>
 <342ab668-554c-637b-b67b-bd8e6013b4c3@amd.com>
 <YIvbAI4PjFlZw+z9@phenom.ffwll.local>
 <b6d0c32c-cf90-6118-5c60-238b6f4a0aaa@amd.com>
 <YJO5jBaNj1XCTFXE@phenom.ffwll.local>
 <d398c3fd-badd-e9da-a74b-00231ad958a5@amd.com>
 <YJUEPPUGCiTJC8V8@phenom.ffwll.local>
 <9a42f77d-4506-255d-d47b-5d292c4fb62a@amd.com>
 <YJVpyoFIIVka2t9q@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <8955838d-66be-a1b1-5c9f-85ec8db0242c@amd.com>
Date: Fri, 7 May 2021 14:00:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YJVpyoFIIVka2t9q@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [2607:fea8:3edf:49b0:3bd1:bdb6:f650:9629]
X-ClientProxiedBy: YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::29) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3bd1:bdb6:f650:9629]
 (2607:fea8:3edf:49b0:3bd1:bdb6:f650:9629) by
 YTXPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.40 via Frontend Transport; Fri, 7 May 2021 18:00:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf7b2ed7-1177-44e2-0515-08d91181f8ee
X-MS-TrafficTypeDiagnostic: SA0PR12MB4541:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45410A33012AB728C7F2091DEA579@SA0PR12MB4541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: APZkos21ISBuAYA+ibq1adz4YQjfF/k6a9r26e3s6cCKUvEENTL7EqpIC+c3b8YKbFSoRn5/9/m7/AREc6VQ64cpQ4WyEuORgQiC/WShEGiFRNN65Mg3XppvIGAj0jZsuL9h9Zt8cmFc5fZa3o2YhAWGz6n5CwT/HJd8XzrZC11oZPggaFj/v1GVodXUq2ddEvLqnds7e3VezPR81Pl1O4JhtTW205/GODw2pyolA/ymWvFhhdL9CTRdxvdfJL4fOSW562dPmxVM+1O0upojR9MW0mHyNOJAlYEeOXLDnBudRMY79LUNsAmODgwb4kirrzHgV6eFCFRIKHJiJOED3pZv5g4tMCD+Bw/xK0OUJE800/NkfnsrzcpbDda3Wjnrrw5gp9Q1MpZ08NkLTQEcXobcFeBJlqZFyz+9mw3Ourn1LhC7ZpRkWTCRZBhHInbZFRsMHlAzSuNvkkULex9m3lh+qdlqV0+zGDmeWEFWu6l85ODkYp7qcPOZ4O51jLO4if3EtSMr2AfCgfTfxhm6fCzq6SQEp/OC8DoOEW7zHEP+ErZ2+ma5tBkT8zXFTLaoSA+RAJB2aYB8HJP4C7WUPaCuMDMulMxH0xx0YCYzSpcoDCtjfhRExXUdB/fhftRbx8xyQWmvVVjv5L0MYw/Ur+ZdPuixRSENm3XVTH+25fXu9cf6Wdf9WnbZZNzlWgeuRxKfOrPBj1hdtbhitJ6rJhP5JfE+Lz66xCt3flbD0z/MJMUCv6kaWFzFbZ7vWi5u0OJUzqmXiR+BOBQdNhZ5CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(316002)(5660300002)(16526019)(52116002)(186003)(6486002)(966005)(86362001)(6916009)(36756003)(30864003)(2906002)(38100700002)(478600001)(31696002)(45080400002)(83380400001)(2616005)(31686004)(44832011)(8936002)(53546011)(66476007)(4326008)(66946007)(8676002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?L3M4ajZWMFVCMlpSSW1ZL0c3c2NlN2tzSEFFWk9DcmhvZExOZnJQN1lvcDJL?=
 =?utf-8?B?NlhKQnR6OUM2UkNQdmx1YkhvczMxQXJJbkltbkdkN2RKU1M5VDF1enpMcThu?=
 =?utf-8?B?MHBOOFp2d3grRXFucFpBbEgzais5dG1pQzJsMFE5UjdqN2dVSVJNYXBSMVBz?=
 =?utf-8?B?RkVqejNQdXJHeHkzdVZ6OTdCZEFOWTdJNW01VXV0eTRCcnY1T2xsbXhzdml4?=
 =?utf-8?B?MFgxSkltZXowcjRzemx0Ky9raytZaysyeXJHTlh0VGxSY2RPNnh6ZGFPNXI1?=
 =?utf-8?B?VU1FYzA0WHpzRzBpWExSbHYwMVdnYkRlNVpFZ0FTZFN0N3RzWUxrTXlEcWZ5?=
 =?utf-8?B?UWEzQzZESEwrTW9WVkhuaWRIZldJK1duU0JSSFRDb1VUNklCU1FhcThSUVZK?=
 =?utf-8?B?N1hJU2M1ZHhvOG56ajNlb09iRDVjUzNqODJ4M1cyenFYZllQTnJSMmc4Qm9v?=
 =?utf-8?B?SHlaemNpS2JZYU91N1dIVGhZQjFybWVxc2p4aFdhTkRTRWNoNlRZQWh1NE1w?=
 =?utf-8?B?MHp3Znp6V3AxM2N2Vm5vU1RZam53NHRCQ1BieUZVcWVOYnJ0aG5lU3Z6b0Jq?=
 =?utf-8?B?aWlMNkl4MWJPVFloVk5pYUx6UVpIN0xpdCt2bTdBSnpCejlyM0tJbjV5cThS?=
 =?utf-8?B?QUlxbk54MFRMNlhIZ2xkOTBXQVZBbWxmZjhaVEw0UGFGWnhmdndEUHJaRHBv?=
 =?utf-8?B?MTVobjBNcmZoN1BsK25ja0hRNU16Q2UzM0tzMEg4cmIrZ3JpN0srZUtTbGVu?=
 =?utf-8?B?UnpHZmphS0xXS2FkOFZ5QXh5amhpd251c0w1M3FyZ3FnMjk2b0tvTkg0S2xi?=
 =?utf-8?B?S1JBSWJiVW5XUHdIa2psTXpyR1o1cnlWdit2NGJ4b2wxTytXSWROcnFrdXFH?=
 =?utf-8?B?djQ5VEZsWGphdWxyaENQL3pLZ2xjT0VlU0k0SS84T245MG9CMVdEVWZjTXRl?=
 =?utf-8?B?aGhaTFYwc0I2bWRIc1lpcitOT3M2aFZkM0w0VmNnTDZTOFN0czJWZzdVN2Vn?=
 =?utf-8?B?QWlFUzBmZ2NDK1doVENiRDR0Qitsd0FpblJteXExTS95S3hzRmtWVjVBSExG?=
 =?utf-8?B?bGdPUWhJU1k1UnNRQ1NPb1o5dEU0N3FzanlDZDBoRHhIR3pFa1lSUWJGSnZQ?=
 =?utf-8?B?QytVbTcvUEhrQW9IcUtlcVNMdmtVcVpvNDBVR3FZaHhhSWxqTEN6bmEvUzhT?=
 =?utf-8?B?WlgvVEQ0eUt2cEFscHlNTGNJa0o0SW9TODlYV2E2Q3pneWtKT3lxWU5oNS9C?=
 =?utf-8?B?cXd3M1NKZ2Iwa0tUY1VKamU3TWdVWEhQVEttbTkwZEkveEt5TnN2aFYvYU5O?=
 =?utf-8?B?ZFRETDlybEtwNVVsclZLcU9jYkNsVjYwMTRHbmNGbHgrL0VhM1FJS084Mzk4?=
 =?utf-8?B?YnUycTV3Y0dYb1VGbkNtNkFESFE4N1MyeGtJVnFmS0tVckk2SWZKdDIyckln?=
 =?utf-8?B?bHBXaTRaQXU3Mk5rUkVVZU9TS3BLR3RUYWxOMEs3bHE5bFFaaTgrdUlYQVA1?=
 =?utf-8?B?bjlzYi9nNkY1T3FQbUdzZ2U0RTR1UHZGT1dNTkhFSDVpRCtUeG96RnBXWWV5?=
 =?utf-8?B?L2xnVmh2aHZScUdrV0V1alRJaEtXSDNXMDEwSkVuTHJrY3ZZZEkwdG1XOGFa?=
 =?utf-8?B?U1BLYlR5NjVLVWhIUHRaYnNCQjJ1Nm9WREplVE53REhpU3VGeXhmbTFlMVFE?=
 =?utf-8?B?cXdwb3FYeXFTZGpXby81RTRZMlA4ajRMNnBtL3J1MzUzOENreHNwNUFUcUJI?=
 =?utf-8?B?SUFlVWdMeElwMlJiajFibVU4OXNKbGNrVHgwNkdRelBYRDd2TjZoTFNaaXF1?=
 =?utf-8?B?UDI0VGtMcENwYnhwMnBXa1l6dXdub0owUGk1R1JCRmthTnVIR0xydGV5b0oz?=
 =?utf-8?Q?XPg9YiGwi18/9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7b2ed7-1177-44e2-0515-08d91181f8ee
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2021 18:00:18.5811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sJGlIenSaN0ol8dJ953dmKZlZYt2zI+b0QWq9YigaiMvRdK48WqE36h7tBKlIASLIzYCK/Pqwcb2wHXYFeAB7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 helgaas@kernel.org, dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-07 12:24 p.m., Daniel Vetter wrote:
> On Fri, May 07, 2021 at 11:39:49AM -0400, Andrey Grodzovsky wrote:
>>
>>
>> On 2021-05-07 5:11 a.m., Daniel Vetter wrote:
>>> On Thu, May 06, 2021 at 12:25:06PM -0400, Andrey Grodzovsky wrote:
>>>>
>>>>
>>>> On 2021-05-06 5:40 a.m., Daniel Vetter wrote:
>>>>> On Fri, Apr 30, 2021 at 01:27:37PM -0400, Andrey Grodzovsky wrote:
>>>>>>
>>>>>>
>>>>>> On 2021-04-30 6:25 a.m., Daniel Vetter wrote:
>>>>>>> On Thu, Apr 29, 2021 at 04:34:55PM -0400, Andrey Grodzovsky wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 2021-04-29 3:05 p.m., Daniel Vetter wrote:
>>>>>>>>> On Thu, Apr 29, 2021 at 12:04:33PM -0400, Andrey Grodzovsky wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> On 2021-04-29 7:32 a.m., Daniel Vetter wrote:
>>>>>>>>>>> On Thu, Apr 29, 2021 at 01:23:19PM +0200, Daniel Vetter wrote:
>>>>>>>>>>>> On Wed, Apr 28, 2021 at 11:12:00AM -0400, Andrey Grodzovsky wrote:
>>>>>>>>>>>>> With this calling drm_dev_unplug will flush and block
>>>>>>>>>>>>> all in flight IOCTLs
>>>>>>>>>>>>>
>>>>>>>>>>>>> Also, add feature such that if device supports graceful unplug
>>>>>>>>>>>>> we enclose entire IOCTL in SRCU critical section.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Nope.
>>>>>>>>>>>>
>>>>>>>>>>>> The idea of drm_dev_enter/exit is to mark up hw access. Not entire ioctl.
>>>>>>>>>>
>>>>>>>>>> Then I am confused why we have https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.12%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_ioctl.c%23L826&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C66e4988eb341427e8b0108d91174a232%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637560014906903277%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=rdb3xesAUYYTeqU2WdoZ%2BWLzOuuRdOxBBQNTMMB%2BKB4%3D&amp;reserved=0
>>>>>>>>>> currently in code ?
>>>>>>>>>
>>>>>>>>> I forgot about this one, again. Thanks for reminding.
>>>>>>>>>
>>>>>>>>>>>> Especially not with an opt-in flag so that it could be shrugged of as a
>>>>>>>>>>>> driver hack. Most of these ioctls should have absolutely no problem
>>>>>>>>>>>> working after hotunplug.
>>>>>>>>>>>>
>>>>>>>>>>>> Also, doing this defeats the point since it pretty much guarantees
>>>>>>>>>>>> userspace will die in assert()s and stuff. E.g. on i915 the rough contract
>>>>>>>>>>>> is that only execbuf (and even that only when userspace has indicated
>>>>>>>>>>>> support for non-recoverable hw ctx) is allowed to fail. Anything else
>>>>>>>>>>>> might crash userspace.
>>>>>>>>>>
>>>>>>>>>> Given that as I pointed above we already fail any IOCTls with -ENODEV
>>>>>>>>>> when device is unplugged, it seems those crashes don't happen that
>>>>>>>>>> often ? Also, in all my testing I don't think I saw a user space crash
>>>>>>>>>> I could attribute to this.
>>>>>>>>>
>>>>>>>>> I guess it should be ok.
>>>>>>>>
>>>>>>>> What should be ok ?
>>>>>>>
>>>>>>> Your approach, but not your patch. If we go with this let's just lift it
>>>>>>> to drm_ioctl() as the default behavior. No driver opt-in flag, because
>>>>>>> that's definitely worse than any other approach because we really need to
>>>>>>> get rid of driver specific behaviour for generic ioctls, especially
>>>>>>> anything a compositor will use directly.
>>>>>>>
>>>>>>>>> My reasons for making this work is both less trouble for userspace (did
>>>>>>>>> you test with various wayland compositors out there, not just amdgpu x86
>>>>>>>>
>>>>>>>> I didn't - will give it a try.
>>>>>>
>>>>>> Weston worked without crashes, run the egl tester cube there.
>>>>>>
>>>>>>>>
>>>>>>>>> driver?), but also testing.
>>>>>>>>>
>>>>>>>>> We still need a bunch of these checks in various places or you'll wait a
>>>>>>>>> very long time for a pending modeset or similar to complete. Being able to
>>>>>>>>> run that code easily after hotunplug has completed should help a lot with
>>>>>>>>> testing.
>>>>>>>>>
>>>>>>>>> Plus various drivers already acquired drm_dev_enter/exit and now I wonder
>>>>>>>>> whether that was properly tested or not ...
>>>>>>>>>
>>>>>>>>> I guess maybe we need a drm module option to disable this check, so that
>>>>>>>>> we can exercise the code as if the ioctl has raced with hotunplug at the
>>>>>>>>> worst possible moment.
>>>>>>>>>
>>>>>>>>> Also atomic is really tricky here: I assume your testing has just done
>>>>>>>>> normal synchronous commits, but anything that goes through atomic can be
>>>>>>>>> done nonblocking in a separate thread. Which the ioctl catch-all here wont
>>>>>>>>> capture.
>>>>>>>>
>>>>>>>> Yes, async commit was on my mind and thanks for reminding me. Indeed
>>>>>>>> I forgot this but i planned to scope the entire amdgpu_dm_atomic_tail in
>>>>>>>> drm_dev_enter/exit. Note that i have a bunch of patches, all name's
>>>>>>>> starting with 'Scope....' that just methodically put all the background
>>>>>>>> work items and timers the drivers schedules in drm_dev_enter/exit scope.
>>>>>>>> This was supposed to be part of the 'Scope Display code' patch.
>>>>>>>
>>>>>>> That's too much. You still have to arrange that the flip completion event
>>>>>>> gets sent out. So it's a bit tricky.
>>>>>>>
>>>>>>> In other places the same problem applies, e.g. probe functions need to
>>>>>>> make sure they report "disconnected".
>>>>>>
>>>>>> I see, well, this is all part of KMS support which I defer for now
>>>>>> anyway. Will tackle it then.
>>>>>>
>>>>>>>
>>>>>>>>>>>> You probably need similar (and very precisely defined) rules for amdgpu.
>>>>>>>>>>>> And those must definitely exclude any shard ioctls from randomly failing
>>>>>>>>>>>> with EIO, because that just kills the box and defeats the point of trying
>>>>>>>>>>>> to gracefully handling hotunplug and making sure userspace has a chance of
>>>>>>>>>>>> survival. E.g. for atomic everything should continue, including flip
>>>>>>>>>>>> completion, but we set all outputs to "disconnected" and send out the
>>>>>>>>>>>> uevent. Maybe crtc enabling can fail too, but that can also be handled
>>>>>>>>>>>> through the async status we're using to signal DP link failures to
>>>>>>>>>>>> userspace.
>>>>>>>>>>
>>>>>>>>>> As I pointed before, because of the complexity of the topic I prefer to
>>>>>>>>>> take it step by step and solve first for secondary device use case, not
>>>>>>>>>> for primary, display attached device.
>>>>>>>>>
>>>>>>>>> Yeah makes sense. But then I think the right patch is to roll this out for
>>>>>>>>> all drivers, properly justified with existing code. Not behind a driver
>>>>>>>>> flag, because with all these different compositors the last thing we want
>>>>>>>>> is a proliferation of driver-specific behaviour. That's imo the worst
>>>>>>>>> option of all of them and needs to be avoided.
>>>>>>>>
>>>>>>>> So this kind of patch would be acceptable to you if I unconditionally
>>>>>>>> scope the drm_ioctl with drm_dev_enter/exit without the driver flag ?
>>>>>>>> I am worried to break other drivers with this, see patch https://nam11.safelinks.protection.outlook.com/?url=https:%2F%2Fcgit.freedesktop.org%2F~agrodzov%2Flinux%2Fcommit%2F%3Fh%3Ddrm-misc-next%26id%3Df0c593f35b22ca5bf60ed9e7ce2bf2b80e6c68c6&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C66e4988eb341427e8b0108d91174a232%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637560014906903277%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=e0PWmu%2FYZlPJMajOmR6rxRp%2Fj0w%2FsfdJPnJ6dwDqVag%3D&amp;reserved=0
>>>>>>>> Before setting drm_dev_unplug I go through a whole process of signalling
>>>>>>>> all possible fences in the system which some one some where might be
>>>>>>>> waiting on. My concern is that in the absence of HW those fences won't
>>>>>>>> signal and so unless I signal them myself srcu_synchrionize in
>>>>>>>> drm_dev_unplug will hang waiting for any such code scoped by
>>>>>>>> drm_dev_enter/exit.
>>>>>>>
>>>>>>> Uh right. I forgot about this.
>>>>>>>
>>>>>>> Which would kinda mean the top level scope is maybe not the best idea, and
>>>>>>> perhaps we should indeed drill it down. But then the testing issue
>>>>>>> definitely gets a lot worse.
>>>>>>>
>>>>>>> So what if we'd push that drm_dev_is_unplugged check down into ioctls?
>>>>>>> Then we can make a case-by case decision whether it should be converted to
>>>>>>> drm_dev_enter/exit, needs to be pushed down further into drivers (due to
>>>>>>> fence wait issues) or other concerns?
>>>>>>>
>>>>>>> Also I guess we need to have a subsystem wide rule on whether you need to
>>>>>>> force complete all fences before you call drm_dev_unplug, or afterwards.
>>>>>>
>>>>>> I don't see how you can handle it afterwards. If a thread is stuck in
>>>>>> dma_fence_wait in non interruptible wait (any kernel thread) and with no
>>>>>> timeout there is nothing you can do to stop the wait. Any such code
>>>>>> scopped with drm_dev_enter/exit will cause a hang in drm_dev_unplug.
>>>>>> The only way then is to preemptively force signal all such fences before
>>>>>> calling drm_dev_unplug - as I do in the above mentioned patch.
>>>>>
>>>>> Yeah, which is why I don't think top-level drm_dev_enter/exit is a good
>>>>> idea.
>>>>>
>>>>>>> If we have mixed behaviour on this there will be disappointment. And since
>>>>>>> hotunplug and dma_fence completion are both userspace visible that
>>>>>>> inconsistency might have bigger impact.
>>>>>>>
>>>>>>> This is all very tricky indeed :-/
>>>>>>>
>>>>>>> btw for the "gradual pushing drm_dev_enter into ioctl" approach, if we go
>>>>>>> with that: We could do the same trick we've done for DRM_UNLOCKED:
>>>>>>> - drm_dev_enter/exit is called for any ioctl that has not set the
>>>>>>>       DRM_HOTUNPLUG_SAFE flag
>>>>>>> - for drm core ioctls we push them into all ioctls and decide how to
>>>>>>>       handle/where (with the aim to have the least amount of code flow
>>>>>>>       different during hotunplug vs after hotunplug has finished, to reduce
>>>>>>>       testing scope)
>>>>>>> - then we make DRM_HOTUNPLUG_SAFE the implied default
>>>>>>>
>>>>>>> This would have us left with render ioctls, and I think the defensive
>>>>>>> assumption there is that they're all hotunplug safe. We might hang on a
>>>>>>> fence wait, but that's fixable, and it's better than blowing up on a
>>>>>>> use-after-free security bug.
>>>>>>>
>>>>>>> Thoughts?
>>>>>>
>>>>>> I don't fully see a difference between the approach described above and
>>>>>> the full drill down to each driver and even within the driver, to the HW
>>>>>> back-ends - what criteria I would use to decide if for a given IOCTL i
>>>>>> scope with drm_dev_enter/exit at the highest level while for another
>>>>>> i go all the way down ? If we would agree that signaling the fences
>>>>>> preemptively before engaging drm_dev_unplug is generically the right
>>>>>> approach maybe we can then scope drm_ioctl unconditionally with
>>>>>> drm_dev_enter/exit and then for each driver go through the same process
>>>>>> I do for amdgpu - writing driver specific function which takes care of
>>>>>> all the fences. We could then just create a drm callback which would
>>>>>> be called from drm_ioctl before drm_dev_unplug is called.
>>>>>
>>>>> So I see the appeal of just nuking all the fences, but I'm not sure that's
>>>>> a good plan. We've done this in the old i915 gpu reset code too, and the
>>>>> issue is it's defacto inverting the locking. But also the hw is truly
>>>>> gone, so it also makes sense.
>>>>>
>>>>> The problem is a bit roll-out, if we state that dma_fence_wait is allowed
>>>>> with a drm_dev_enter/exit, then all drivers need to force-retire their
>>>>> fences.
>>>>>
>>>>> The other option would be that we require that dma_fence_wait is _not_
>>>>> allowed in drm_dev_enter/exit, and that therefore these areas must be
>>>>> marked up more fine-grained to avoid deadlocks. I like this more from the
>>>>> testing aspect (it makes it easier to be reasonable sure your code handles
>>>>> concurrent hotunplug), but also it's pretty easy to validate with the
>>>>> dma_fence lockdep annotations we have I think.
>>>>
>>>> They key question as I see it - is it ok for a device to be unplugged
>>>> while it's driver has anywhere in it's code a dma_fence_wait
>>>> waiting for work completion from this device. The answers seems to me
>>>> is no, the HW is gone, this fence will never signal and so you will be
>>>> left with indefinitely hanged code thread with all it's unreleased
>>>> resources. If i am correct in the above statement then avoiding scoping
>>>> code with drm_dev_enter/exit because a dma_fence_wait might be there in the
>>>> middle
>>>> just hides the problem. Also, then the only solution for each driver
>>>> wanting to support hot-unplug is to force retire all it's HW
>>>> fences once it's notified of device removal.
>>>
>>> At a high level, yes dma_fence must always complete. I don't think we have
>>> a disagreement here on that.
>>>
>>> What we're discussing here is the precise sequencing and barriers, where
>>> things get tricky. Requiring that you force-complete all dma_fence that
>>> might be affected before you hotunplug is one solution, the other is
>>> tuning the critical sections that drm_dev_enter/exit annotates.
>>>
>>> This isn't about avoiding anything or hiding problems, this is about
>>> locking/synchronization design. And for that we must agree on what is
>>> allowed inside/outside of a critical section for all possible
>>> combinations.
>>>
>>> E.g. we're also "hiding" problems with calling dma_fence_wait from
>>> shrinkers/mmu notifiers by forbidding allocations in
>>> dma_fence_begin/end_signalling critical paths.
>>>
>>>>> A third reasons for not requiring force-retiring of dma_fence before
>>>>> drm_dev_unplug is the races: Before drm_dev_unplug you haven't stopped new
>>>>> fences from happening, but until you've stopped new fences it's hard to
>>>>> guarantee they're all retired. How do you solve this currently.
>>>>
>>>> See amdgpu_finilize_device_fences in https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.ozlabs.org%2Fproject%2Flinux-pci%2Fpatch%2F20210428151207.1212258-20-andrey.grodzovsky%40amd.com%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C66e4988eb341427e8b0108d91174a232%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637560014906903277%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=VEpwZuwoT0lBPJriOYCrZwEFcb0zAnWWpenFaPHsUQI%3D&amp;reserved=0
>>>> I think the steps described there answer your
>>>> concern here.
>>>
>>> The hard problem is stopping further command submission. Not seeing how
>>> you solve that.
>>
>> By stopping GPU SW scheduler before force completion of HW fences, see
>> amdgpu_finilize_device_fences->amdgpu_fence_driver_fini_hw and the
>> comment above it.
>>
>>>
>>> But I'm definitely scared about all the scheduler/tdr interactions you
>>> already have there, and that looks quite a bit like fallout from doing
>>> things the wrong way round.
>>>
>>> Also given that drm/scheduler is shared, why can't this be a drm/scheduler
>>> helper function?
>>
>> I was thinking about it, what stopped me is that HW fences signaling is
>> done from driver specific HW fence array. But we could do it generic by
>> instead iterating sched->pending_list and signaling
>> s_job->s_fence->parent instead.
>> You also need to retire scheduler's scheduled fences once you stopped
>> the schedulers as they are waited on as dependencies for other jobs
>> submissions (i do take care of it).
>>
>>>
>>>>> Finally there's still hangcheck and all that, so if we go with forbidding
>>>>> dma_fence_wait from within drm_dev_enter/exit sections, then drivers don't
>>>>> need to have additional tricky code to force-retire fences. TDR will take
>>>>> care already (albeit with maybe a slightly annoying long timeout, which
>>>>> we can shorten to "time out everything immediately" after drm_dev_unplug).
>>>>
>>>> I am not aware of TDR handlers  that do it today, at least we don't,
>>>> we don't check that if device is gone let's instead of resetting the device
>>>> and resubmit jobs just force retire all the HW fences. In any case, this
>>>> can and i think should be done in pci remove callback because this is
>>>> the place that supposed to handle device extraction. I for example in
>>>> amdgpu_finilize_device_fences just block all TDRs from taking place as first
>>>> step in the process. If other drivers want to force retire fences
>>>> in their TDR handlers they still need to block and wait for all such
>>>> TDRs in their pci_remove handler.
>>>
>>> TDR definitely force-completes the fence that did hang. Of course it'll
>>> take a while until they've all completed this way, but we do have
>>> guaranteed forward progress since we've stopped all further fences from
>>> showing up because drm_dev_unplug is called already.
>>>
>>> And yes after drm_dev_unplug you can then force-retire the tdr stuff.
>>>
>>>>> What we definitely can't have is half the drivers doing it one way, and
>>>>> the other half the other way. So your driver flag to wrap the ioctl
>>>>> optionally in a drm_dev_enter/exit path is a no-go still I think.
>>>>>
>>>>> I guess my tldr; is: I definitely see how your current approach gives
>>>>> quicker results for amdgpu right now, but long term I'm seeing more
>>>>> positives on the other one. At least I expect less special cases due to
>>>>> hotunplug with that.
>>>>
>>>> As i expressed my viewpoint above - seems to me any driver in need to
>>>> support hot-unplug must force retire it's fences because of need to
>>>> unblock all dma_fence waits and so it will not be a special case.
>>>
>>> This isn't the special case I meant. It's the very tricky
>>> force-retire-before-you-unplugged-officially which is large scale nasty.
>>>
>>> Also if your driver doesn't force-retire already, it's buggy. The
>>> additional need of hotunplug is just that we're trying to force-retire a
>>> bit faster, because we know it's all hopeless. But e.g. i915 already has a
>>> fallback that does this automatically:
>>> - first we reset only the engine/context, keeping everyone else running
>>> - if that doesn't pan out, we reset the entire chip and give up an
>>>     anything that's in-flight, which (iirc, it did so at least in the past)
>>>     force retires everything outstanding.
>>>
>>> I think amdgpu only has full chip reset, so your first step tries to
>>> reissue all other tasks. But that's not necessarily how it needs to
>>> happen.
>>>
>>> Either way drivers must force retire everything (albeit maybe a bit at a
>>> slow pace) if the hw ceased to work properly already. Hotunplug really
>>> isn't anything new here.
>>> -Daniel
>>
>> Let's then agree on the way forward -
>>
>> You raised before the following suggestion -
>>
>> "
>> btw for the "gradual pushing drm_dev_enter into ioctl" approach, if we go
>> with that: We could do the same trick we've done for DRM_UNLOCKED:
>> - drm_dev_enter/exit is called for any ioctl that has not set the
>>    DRM_HOTUNPLUG_SAFE flag
>> - for drm core ioctls we push them into all ioctls and decide how to
>>    handle/where (with the aim to have the least amount of code flow
>>    different during hotunplug vs after hotunplug has finished, to reduce
>>    testing scope)
>> - then we make DRM_HOTUNPLUG_SAFE the implied default
>> "
>> My problem here is that I have no good understating, criteria
>> for how to decide per each ioctl on the right scope of drm_dev_enter/
>> exit. It depends on whether each next function call can lead somewhere
>> down the call stack to dma_fence_wait and/or whether it can lead
>> to registers access. Seems to me very hard to cover and error prone.
> 
> Tbh, neither do I. This requires a lot of work to analyze.
> 
>> Another options which we discussed internally before and is basically
>> same as current drivers i guess is simply to scope with drm_dev_enter/
>> exit all the back-end HW specific callbacks. Those are most of the
>> places MMIO access takes place and by definition no dma_fence_wait
>> can be there as it's HW specific code. This leaves MMIO
>> access through pointers (memcpy, and various pointer de-references)
>> which will need to be protected on case by case, but given that I unmap
>> all MMIO anyway as last step of PCI remove callback, all of them will
>> be found by try and error eventually.
>> I feel more comfortable with this approach as I have a clear
>> understating of how to deal with it.
> 
> Hm ... I'm maybe failing to see the difference, but at least on the kms
> side "put drm_dev_enter/exit into driver callbacks" feels like the right
> place for them.
> 
> Render (and I guess kfd for amd as the special case) ioctl are different,
> especially all the driver specific ones.
> 
> So one thing that cross my mind maybe as step 0 is to annotate the rules
> for drm_dev_enter/exit using lockdep. With lockdep we can both check
> whether a lock is held, but also whether it's not held (but the latter is
> only possible with CONFIG_PROVE_LOCKING enabled). I think it would be good
> to annotate all the major locks in the kernel against drm_dev_enter/exit:
> 
> - dma_fence_wait could check that the drm_dev_enter/exit srcu is _not_
>    held.

We can't insert this directly inside dma_fence_wait as a DRM agnostic
layer, are you porpoising to wrap all dma_fence_waits in DRM and drivers
code with thin wrapper calling lockdep_assert_held(drm_unplug_srcu) ?
What about dma_resv objs and dma_resv_wait_timeout_rcu style of waits ?


> 
> - because srcu nest _very_ freely there's kinda no real restrictions for
>    putting drm_dev_enter/exit within a lock critical section. Might still
>    be good to explicitly call out in docs where it's all ok:
> 
>    - interrupt handlers (I hope that's the case, otherwise I screwed up)
>    - shrinkers/mmu_notifier callbacks

Is there a problem scooping these with drm_dev_enter/exit ? Might they
hang indefinitely once a device is gone ?

> 
> - anything else that's not allowed in within drm_dev_enter/exit. I'm e.g.
>    wondering whether we should disallow drm_modeset_lock() or maybe
>    dma_resv_lock(), or whether that's too restrictive. It could help quite
>    a bit in finding places where the drm_dev_enter/exit section is too
>    wide.
> 
> - another one is the inverse, but I guess you have that already with
>    putting a drm_dev_is_held() into mmio helpers and all that to make sure
>    we really have them all caught.

Not sure what drm_dev_is_held means here ? Also what do you mean by MMIO
helpers ? Maybe you meant the page fault helpers like ttm_bo_vm_fault ?

Andrey

> 
> Above is just examples, I think the more we nail down these rules one way
> or the other, the better for consistency across drivers. And without
> consistency everyone will be forced to write their own mmap helpers
> instead of one in ttm, or scheduler cleanup helpers instead of one in
> drm/scheduler.
> 
>> P.S Please respond on the question for you on the other thread at
>> 'PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity released'
>> about suggestion by Christian of partial up-streaming of this code up to
>> and before the patches dealing with scoping of drm_dev_enter/exit scoping.
> 
> Ok will try, I'm a bit burried unfortunately so thanks for reminder when I
> miss something.
> -Daniel
> 
>>
>> Andrey
>>
>>
>>
>>
>>
>>
>>>>
>>>> Andrey
>>>>
>>>>>
>>>>> Cheers, Daniel
>>>>>
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>>>
>>>>>>> It is unfortunately even more work until we've reached the goal, but I
>>>>>>> think it's safest and most flexible approach overall.
>>>>>>>
>>>>>>> Cheers, Daniel
>>>>>>>
>>>>>>>>
>>>>>>>> Andrey
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Cheers, Daniel
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> I guess we should clarify this in the hotunplug doc?
>>>>>>>>>>
>>>>>>>>>> Agree
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> To clarify: I'm not against throwing an ENODEV at userspace for ioctl that
>>>>>>>>>>> really make no sense, and where we're rather confident that all properly
>>>>>>>>>>> implemented userspace will gracefully handle failures. Like a modeset, or
>>>>>>>>>>> opening a device, or trying to import a dma-buf or stuff like that which
>>>>>>>>>>> can already fail in normal operation for any kind of reason.
>>>>>>>>>>>
>>>>>>>>>>> But stuff that never fails, like GETRESOURCES ioctl, really shouldn't fail
>>>>>>>>>>> after hotunplug.
>>>>>>>>>>
>>>>>>>>>> As I pointed above, this a bit confuses me given that we already do
>>>>>>>>>> blanker rejection of IOCTLs if device is unplugged.
>>>>>>>>>
>>>>>>>>> Well I'm confused about this too :-/
>>>>>>>>>
>>>>>>>>>>> And then there's the middle ground, like doing a pageflip or buffer flush,
>>>>>>>>>>> which I guess some userspace might handle, but risky to inflict those
>>>>>>>>>>> consequences on them. atomic modeset is especially fun since depending
>>>>>>>>>>> what you're doing it can be both "failures expected" and "failures not
>>>>>>>>>>> really expected in normal operation".
>>>>>>>>>>>
>>>>>>>>>>> Also, this really should be consistent across drivers, not solved with a
>>>>>>>>>>> driver flag for every possible combination.
>>>>>>>>>>>
>>>>>>>>>>> If you look at the current hotunplug kms drivers, they have
>>>>>>>>>>> drm_dev_enter/exit sprinkled in specific hw callback functions because of
>>>>>>>>>>> the above problems. But maybe it makes sense to change things in a few
>>>>>>>>>>> cases. But then we should do it across the board.
>>>>>>>>>>
>>>>>>>>>> So as I understand your preferred approach is that I scope any back_end, HW
>>>>>>>>>> specific function with drm_dev_enter/exit because that where MMIO
>>>>>>>>>> access takes place. But besides explicit MMIO access thorough
>>>>>>>>>> register accessors in the HW back-end there is also indirect MMIO access
>>>>>>>>>> taking place throughout the code in the driver because of various VRAM
>>>>>>>>>> BOs which provide CPU access to VRAM through the VRAM BAR. This kind of
>>>>>>>>>> access is spread all over in the driver and even in mid-layers such as
>>>>>>>>>> TTM and not limited to HW back-end functions. It means it's much harder
>>>>>>>>>> to spot such places to surgically scope them with drm_dev_enter/exit and
>>>>>>>>>> also that any new such code introduced will immediately break hot unplug
>>>>>>>>>> because the developers can't be expected to remember making their code
>>>>>>>>>> robust to this specific use case. That why when we discussed internally
>>>>>>>>>> what approach to take to protecting code with drm_dev_enter/exit we
>>>>>>>>>> opted for using the widest available scope.
>>>>>>>>>
>>>>>>>>> The thing is, you kinda have to anyway. There's enormous amounts of
>>>>>>>>> asynchronous processing going on. E.g. nonblocking atomic commits also do
>>>>>>>>> ttm unpinning and fun stuff like that, which if you sync things wrong can
>>>>>>>>> happen way late. So the door for bad fallout is wide open :-(
>>>>>>>>>
>>>>>>>>> I'm not sure where the right tradeoff is to make sure we catch them all,
>>>>>>>>> and can make sure with testing that we've indeed caught them all.
>>>>>>>>> -Daniel
>>>>>>>>>
>>>>>>>
>>>>>
>>>
> 
