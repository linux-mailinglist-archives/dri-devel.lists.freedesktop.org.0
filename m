Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D388742841
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 16:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B8110E139;
	Thu, 29 Jun 2023 14:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C962A10E139
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 14:26:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF2cVWsnqiuGQc/nRaB10USJBNRa5W1ZhpBezkV19+1YWrRuytviBz8+NHQO7IKAR+RgATBoUi26R28QyjAvmWpoNZsGXnOm1HRPfqSc3MEoCA3WsH8zK83bjcGCQTx9G1qoinuLHP6lc5DQ3T7wByHR4/AZnuVSd+U9zPWlimux0ueESL/EujLWvo6tk5Nezmy913FTUreTDz3YlzjddTtnp92Bz21dpEiqnArEM0oMW0LmTiY72ZyrW3M3SEs1yRYtuhK3wjmFHKsvCIWYkFHgMha1VWc7ClDZeKGTMIZ1ZAZoM0qC/WjNXBfm+jWEldslNIsvZOMZz3Mk4Khwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRs9Z9PiuBDIP0fqClpv1HphXxk1gTZcClefDvi0EYs=;
 b=nZpwxDwIQC0ht08TBbkCm6P2e2LVK8MCNrFjsOpEsXPVWRcbMaEVeiwsezHpjnixKNcx9y6WYN2GP3XrjrsoNN7aR++/r0gt3+rKpH9IRMrJryyzmwfSg6WCyC10LkL+WC2XAisP/X3/5kq5nus3tJoOfKvOetkoZ9QhbnZwABUXlLR1VhkW5B3JduEtO05RO4eK32sqCBd4fVJj9n/7fr2Xnqw7h+Znl8Ng0TOq8yDscHzjx8kWfb0hTlAejJXAeKxHTKANe1ELF1qRuDa1/v/V/vSIoM5uKbp5gg44ulKUoSTLs3tg4WzOrBHvr8fa4jH4xW1tduOw2j3AmoaNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRs9Z9PiuBDIP0fqClpv1HphXxk1gTZcClefDvi0EYs=;
 b=kPxNTWy5a8UFfhqNNfE2D6KxpmjQ9uMJii50MS++d+6ywxG+mTWOglC7n0O7CODoMrwTmJf4SR7i47ZSIArHt//PnSkD+IK+5uWRVh94EGJRG0+joOTiwylldVUXfpqiqCWogsckTuZ3qIVNe4wtgDzZTLJeLuB61KSwvAiS+bo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by CY5PR12MB6204.namprd12.prod.outlook.com (2603:10b6:930:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 14:26:10 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::4469:e2f0:3628:49f6]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::4469:e2f0:3628:49f6%5]) with mapi id 15.20.6521.023; Thu, 29 Jun 2023
 14:26:09 +0000
Message-ID: <342cffe6-e063-9cca-7d7d-675d3fbe841e@amd.com>
Date: Thu, 29 Jun 2023 10:26:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Why does kgd2kfd_interrupt() have to schedule work on a specific
 CPU?
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>,
 Philipp Stanner <pstanner@redhat.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>
References: <b551fb687a07e1461ca325c6951e96f4f962941a.camel@redhat.com>
 <CADnq5_N-0DV7PpOwjMAp2ZdOEBYiJRWw4duo-g07AL7Mo5kS7Q@mail.gmail.com>
From: Philip Yang <yangp@amd.com>
In-Reply-To: <CADnq5_N-0DV7PpOwjMAp2ZdOEBYiJRWw4duo-g07AL7Mo5kS7Q@mail.gmail.com>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::49) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5149:EE_|CY5PR12MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 9062dad7-d846-4990-4c35-08db78acc87d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HaFVXMXAkwChyUFQ3RWkzmSG30GitnQcKzqbdZw9m7PPP94Pvi73BrOL83uBw96EH19joy6m0vutTlPVWK49UVGnrxpRCJGxcnP4kmTQHoKpZ6/4nUw6qC7poCLUIZM0+aU89FRftjoqDuah8kQrmHUf/1JAIbOHStG2vJEvPtI7+olgUYX0HeaJF20+CQr38JApPpldwTb8j5VN9Aw9iy9PvWFVFJuaHchEy1ilLwlsVAWrdcdwYc//gzfRG+DecKpIKoRN+Pqc+HoJo/SJOwMc5edwSebFP0504vJ3x7tN2Vk5J1pNRUudbX2CX+jcnpGsuk68uli3zza/GWymLX1kysJSb0h1R7qn5ungC8Srhm9O/tyZWGIOlUvdrRHgDAyYn87cOCl+e7yIoVpH7F0/uJfm02CsVbBY63sVwWxWpZHq5SmQCdSL09fT1O2l5vh8XicY9mQBqSyaOmcf0h/odZwB+ZkxdDkY+4rhkus41Fn7c41t4zaZy/UNHhcNoYi1p5BFPFzmJWHL3M8nCLsH8dDo3hYplNA7zsmh3KXBlAZpA2Vj056/TznG2CxDjElvKvbbHkGq2knEmefrd5FoN+vTywr8/uc/LWsUfK62811d3/U5jd6163L+nbkPUjwgjafKpg058OhLztV7Bg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(26005)(4326008)(66476007)(66556008)(8936002)(6506007)(36756003)(110136005)(2616005)(478600001)(186003)(2906002)(6666004)(53546011)(6486002)(83380400001)(66946007)(5660300002)(38100700002)(31696002)(8676002)(6636002)(316002)(41300700001)(31686004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0txKzkyUjhYeVUwcjIyVXlDcHF1RkVsNWd5M25yVjdTSkJvdzI5Nk85K0hn?=
 =?utf-8?B?bnduUFBzL1Y1MkU3dHJmM1hyZFU0SXhhSVZYTGNJaWVQUWwzeVJHSXR2SjJq?=
 =?utf-8?B?NFRSTUFwMkVnNHk3U0xvZTVUaVhCREk2c2lGb0ZJQUsyUklJeElhb0UxbzRx?=
 =?utf-8?B?Nm5lMVVCaXlKT3BBM0JrUnkzczJHdUw1eVAwb2x2aGhjbEkzTi9OelhPY1pa?=
 =?utf-8?B?eUNUb01TSkJOOG1lY3hGbWcvM0hMams2bWwxSDltMThuODVXOEJwUnllSTR1?=
 =?utf-8?B?QnJwRUJSYVo2aTBLRmhHT0NLZ2Rrc0hkMENzNFJNNHYzeEtaNzFqbDBEcnFx?=
 =?utf-8?B?eUNQQUJQOVpkaWlGeFFuVmluSWRxWnRtRDFHNE9kbUdybTFwbUcwYjBDUHpG?=
 =?utf-8?B?NUMwak5NS0krV2NvYXdjNzZSOVdSVklaZ0psOGo0U0dVUU40R0NCRkNhOFZX?=
 =?utf-8?B?VXRkTkdRam1JK1haOHVJOG1RVjJhVW5wbUk1UFFwelltdTRaSGlrTFNXNDYy?=
 =?utf-8?B?MzV0Qm05cUNpR3A2N3EzYnI4bjhnQjdIUkxEMGV5WkUySUpkaCtUZmlMeVhu?=
 =?utf-8?B?ZXgwZEFaNFQrSE9uR1dWY3UvYUplZG1acVZsVG9ZSGxjWlpKbU1DcGg0VEw1?=
 =?utf-8?B?VDRYamNoVkx2MEJnQWg3V0tLWms1Um1rKzhQRm5lWHA1eFAwMlFaWmtIdGtv?=
 =?utf-8?B?NTk2eWE5QUdnU28xRWNIWmdJNHNnN3h3dHFLVDFxNk1WeGFoRXZ3OHNoZkpZ?=
 =?utf-8?B?RFFsMy9FUU51R1o3S0NHK21aZUd6WEdTVXVsV21lb1dSa21MRlE4Tm5UM1Qx?=
 =?utf-8?B?OUJ2RUE1VDJyU0crNkhiRkVCbWtoRzFhQlF1NlpqSzJCK0RNQ3FlWkZiaGpQ?=
 =?utf-8?B?SS9ob0RvOXlvSUFaUDdQbjhFblpndnk0QkVneG9yeHJDKysxS3ZJZ0tMblJT?=
 =?utf-8?B?Mm40bk5IbjUra0RNb1NqaFJkWnVNMGgzSm9VMDl2U2ZnMThPMWh1clhDRk5y?=
 =?utf-8?B?cURNM2NuYzdQa0MzNzJxempjTVNOelJIdklRdnRwelV4VERZNENhbnRDR09p?=
 =?utf-8?B?dE45bUp5UHJCWGU0MU9JQ2RVTmtza0o5T0NmRDFnU0FFek5aZ1ZDNExYRW1o?=
 =?utf-8?B?T2JjK1JzSnhYc0FaTEJheXh5MjZ3OUVSbEgzWFBPeWNEZGpmRVJOeE1VZ1oy?=
 =?utf-8?B?Z05ZUmlBRFV6ZDAzTXhxR0pXTFAxdDN3enRUdU83R1RCR3p2SWtoRXVoTjh6?=
 =?utf-8?B?S0NlaFk5WFhMUkUvVWhRdnVOcjBoR3dvMjB6U2VxSmlIWkFLYzYxZFlzeDla?=
 =?utf-8?B?czN3US9DYW1jclFnaTFycXJuRi8wb1RXL2ZaOVF6SjlPeXpDWlBWdzVjQ0du?=
 =?utf-8?B?Z2JSUE5HYThOSHU2SW56Tjc2dnVtdGVXODJZRHZ6NW5JK2pHK3FmVVNMMkpz?=
 =?utf-8?B?ZHpEQzFQSGxKZ0lGOVBmV0lNT3Z0aDI5OTVSU2pwQkNYYnZuV01pTkxMeC9G?=
 =?utf-8?B?MzN5SUdWYzRQQ0U3eHdrdTdjSEJIN0FoZUUzb21laGU2TjVBdjZ3YzR3RkFT?=
 =?utf-8?B?RnZVdDdQSnFKRGhVM2NBWHF1TkNialV0V0RvNUk1eDM3aHg4ZERIY1lFYmRJ?=
 =?utf-8?B?UWRCSy9Td29qU3c5TGNMZ1dRbVNSVHJUOGw5Sk45ZHducFhTQ2pkdHVxSlhq?=
 =?utf-8?B?QTVteDdqSTJ0b1ByMXRZT0RmY3BERFR2VlptTkVXdGJUcW9YbEt5VkJFU2Rw?=
 =?utf-8?B?b0paMzdXdUlSVDZCTGx4dTc0bTZPaXhiVHVJamhiTUM3U3FYU01DVy92YWNn?=
 =?utf-8?B?S1p2T3Q2ODNpUTNjc3Y1eEtGVHVYbUdwLzJWaEFpRU1uVlY3ZUlUM2l6STBR?=
 =?utf-8?B?S1UwalpEc1hwWlN3ZjFPQTJxREdPVU5CQ2tXVzZ6Rk9NTzA1eWVSUk82eFM3?=
 =?utf-8?B?S2pHUmdLT3FuRkw5c3h2MFBsTUJoQUpaclRYUXpKcW5rRVRZRzJDWXZJenJO?=
 =?utf-8?B?aldZTlpEUXY1aGQrcldzenRUMC9WcC8xbU1tYWR6TzNDMkV3elpobW42dTky?=
 =?utf-8?B?NFNNa0NTMmZHUnBWREw1cmZ3dDZZSU9qM1RrV1hZS2hRZmFaRm5zVFVMdWhF?=
 =?utf-8?Q?cL3E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9062dad7-d846-4990-4c35-08db78acc87d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:26:09.7718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9izCqteAQWxZh/HaJ14mIv96RMbHXk76Mapt5j/pDbWfvgrStz2lfv0gVC/OhIR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6204
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>This was to fix application long event wait latency, when app
      shader generates lots of event interrupts in short period, the
      scheduled work no chance to execute on the same CPU core, this
      causes event cannot post/return to app thread which are waiting
      the event. To schedule work on the core of same NUMA node is to
      optimize cache usage in general.<br>
    </p>
    <p>Regards</p>
    <p>Philip<br>
    </p>
    <div class="moz-cite-prefix">On 2023-06-27 11:42, Alex Deucher
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CADnq5_N-0DV7PpOwjMAp2ZdOEBYiJRWw4duo-g07AL7Mo5kS7Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">+Felix, Philip

On Tue, Jun 27, 2023 at 4:42 AM Philipp Stanner <a class="moz-txt-link-rfc2396E" href="mailto:pstanner@redhat.com">&lt;pstanner@redhat.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Hello folks,

I'm currently trying to learn more about DRM and discovered the
following code sequence:


drivers/gpu/drm/amd/amdkfd/kfd_device.c, Line 824 on 6.4-rc7

static inline void kfd_queue_work(struct workqueue_struct *wq,
                                  struct work_struct *work)
{
        int cpu, new_cpu;

        cpu = new_cpu = smp_processor_id();
        do {
                new_cpu = cpumask_next(new_cpu, cpu_online_mask) % nr_cpu_ids;
                if (cpu_to_node(new_cpu) == numa_node_id())
                        break;
        } while (cpu != new_cpu);

        queue_work_on(new_cpu, wq, work);
}

/* This is called directly from KGD at ISR. */
void kgd2kfd_interrupt(struct kfd_dev *kfd, const void *ih_ring_entry)
{
        uint32_t patched_ihre[KFD_MAX_RING_ENTRY_SIZE];
        bool is_patched = false;
        unsigned long flags;

        if (!kfd-&gt;init_complete)
                return;

        if (kfd-&gt;device_info.ih_ring_entry_size &gt; sizeof(patched_ihre)) {
                dev_err_once(kfd_device, &quot;Ring entry too small\n&quot;);
                return;
        }

        spin_lock_irqsave(&amp;kfd-&gt;interrupt_lock, flags);

        if (kfd-&gt;interrupts_active
            &amp;&amp; interrupt_is_wanted(kfd, ih_ring_entry,
                                   patched_ihre, &amp;is_patched)
            &amp;&amp; enqueue_ih_ring_entry(kfd,
                                     is_patched ? patched_ihre : ih_ring_entry))
                kfd_queue_work(kfd-&gt;ih_wq, &amp;kfd-&gt;interrupt_work);

        spin_unlock_irqrestore(&amp;kfd-&gt;interrupt_lock, flags);
}


These functions seem to be exclusively invoked by amdgpu_irq_dispatch()
in amdgpu_irq.c
At first glance it seems to me that it's just a typical scenario taking
place here: Interrupt arises, interrupt submits work to wq, then jumps
back to sleep / former process execution context again.

What I don't understand is why it's apparently important to schedule
the work on a particular CPU.

It seems that the do-while in kfd_queue_work() is searching for a CPU
within the same NUMA-Node. Thus I suspect that this is done because
either
a) performance requires it or
b) the work-function needs access to something that's only available
   within the same node.

I suspect there is an interrupt-related reason why that particular work
should be enqueued on a specific CPU. Just by reading the code alone I
can't really figure out why precisely that's necessary, though.

Does someone have any hints for me? :)

Cheers,
Philipp


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>
