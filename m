Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F948B141
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 16:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B68B10E81B;
	Tue, 11 Jan 2022 15:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F03610E7E9;
 Tue, 11 Jan 2022 15:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoYrbzOs5Ha+bxc0Aj7MSNiva/+q7Z/kUeeYH0LVEBD/Hg22XC1u8l5SPq68LCbNNI3H0DxMLo7EnWYoxdyiKCTw4awyTWUUD33PH2Hg1vE+HO221Fbe93bLT7sdxrNHPwfx6KaBUzAenxpHKNV06sx3JZA6ViTKHwePQ4nxYhjIWH3giuZ8hpOvPgWPIoZFnAoFwkRfC46nvXADxU/14vO9S0BuYmEMEcHrSclL+USD3g0RLwMSnbswRXPap+0Ecrv+HXIIrfvqsovb7uammMEyE/2FRS+hic3DZWglac5dGHsnaL6GVU6KhdpAEQX2J0icy26Qla1OispVye7mHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9UeaNUVIUWsIB0DTiw/QzGk98CqYSkCXz3fFhg3YPI=;
 b=AJwMjP/fC1GGc+kfxU5AqttGWi69CcYhoEigPlkzqMrTjPekCVX+n3br9M5VKC3L2X9zHYOQFlKgv9LFG0ao0DpL/ataMgTUZTxFEkcpyBtN5ie6kSioljUrn2CKKGVQ6q95kEPfBcyIFfjcPC92Mm00n+IhSAKHI9PoxnU0UHZ/uppdzHWKDMKPTOa4xJ8BEqwBe+LNjyy41/fhNlXjn3m6K+5kIBoImXlEOfYpLKvauGk2CLxBlI/K+MisiBPHOIwLC+p5gfscxHjCritset5B+bUEst3nyj++yvd6Oq8dOSXQl8IU7+H/dLZU2uMKc7a1pKG4lCiNUPPeaLmwUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9UeaNUVIUWsIB0DTiw/QzGk98CqYSkCXz3fFhg3YPI=;
 b=MgWOH1HsteTEn92THWYNbeIVCfCr9VOPXgHtyGMVUCI/v9Pmo9/l/p/jzn74iYD5qsXyn+QG0iumcgUCAtlHnWXpjQuRYIVn1oFgIKOy7sWZdk/dyFUDG0GO2+gofNlJlK4KRFocIShNHnLhgZeyjQ6WcvjLFsycvphSQ6CCIEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5149.namprd12.prod.outlook.com (2603:10b6:5:390::14)
 by DM6PR12MB5518.namprd12.prod.outlook.com (2603:10b6:5:1b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 15:49:05 +0000
Received: from DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862]) by DM4PR12MB5149.namprd12.prod.outlook.com
 ([fe80::14cd:f56f:bac0:a862%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 15:49:05 +0000
Subject: Re: [Patch v4 18/24] drm/amdkfd: CRIU checkpoint and restore xnack
 mode
To: Felix Kuehling <felix.kuehling@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
 <20211223003711.13064-19-rajneesh.bhardwaj@amd.com>
 <6e5d64da-3081-a8f3-398c-6e12d18c8507@amd.com>
 <116c8cf4-57c2-f3a1-f4b9-5f0ef4526967@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <6bc37a37-4505-3b9f-9873-5634e48b2002@amd.com>
Date: Tue, 11 Jan 2022 10:49:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <116c8cf4-57c2-f3a1-f4b9-5f0ef4526967@amd.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0420.namprd03.prod.outlook.com
 (2603:10b6:610:11b::25) To DM4PR12MB5149.namprd12.prod.outlook.com
 (2603:10b6:5:390::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02091d05-ea54-4f76-017b-08d9d519e586
X-MS-TrafficTypeDiagnostic: DM6PR12MB5518:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB551829BBCA4044B0D5F6727EE6519@DM6PR12MB5518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7xKg4RiKn25B+1wAkIDX8TOVsQO6khoIY7JuAMISuHLPptvHwdPFaD8+GsL+31aI16F32CuYJEFzhMkoNekZiMYggQTz29pp3ZZUHcDeru/looM+/EZya50CFpW4VYEZFexi8DPsV0pxlOWuEME+2b6+UyQoADYQvCLnLnezwxXc0JKAFq2XC+7IXiTB4mnokKeVnkvbulbSaMUHx0Vedc4qzxEcwxSvxM9PAMMTmHg6comGs1yM0loz9eK3gJTNPnHxqsyEXfAB9qDRh2ShOMnpqG8Gd/w0Jf6B4uPfhMHrctjZQasLjPycPJUZBDUVcZUGp2h+5g319ZU2xDgI59bgxYdURgEhNzNl9jMCwmCWU40qSifQrWiBE0vyvu2+oPoGTWPB7uUGM+q/+vxIOG5t7enmdy6bWLfSEHjAqOPWHKgRxR4AMIKymYuGTHHiKnjVbgD3/2yGiAXlGWiziMOfu/i/L27ac4iPgZ7fP5OzLfM9SknIFXGNgr35sxGSlmIjoYnDJsPJQLpdlkX7tEmBBjI/PKS6CUpbEqRH5r4mxPP9LE1d+KHiHeN/Diyb59Ob4YT9lBDMu99fUch1iWgIqTymMvben/TX/pYA3Xq1KQs7Jr3Pwco87ouINi2VhwkwmHhweYl8A0h4ff1IyyRT6zi5Uu4NEeuvNuA4uQ8bmxuY//q/kvRGCWMwpU01CSCMvuwAhAj0camvw+7QB7qqt+oGfSxJiM+yUx6yNNM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5149.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(316002)(31696002)(508600001)(36756003)(5660300002)(8936002)(53546011)(66556008)(66476007)(6486002)(6506007)(6512007)(31686004)(66946007)(2906002)(2616005)(38100700002)(4001150100001)(110136005)(26005)(186003)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDQ1eTZvcmZ6djlEUEZtQlVFL1E0dmcxWHJJWjlxR25tVHUxNm92d1EvVzIx?=
 =?utf-8?B?VFFhT0NtUzloV0J0UUpnYmxmYWFQb1JNZ0MrNWc1ZVNYdk02eENhYlhDN0sz?=
 =?utf-8?B?czY5RHdLN0VWUktZeDhhUmFBRlNBanZObkJHVUVSemxuRnJtYjNVTlBWUW80?=
 =?utf-8?B?eVcxVkNqVHlHaDRmeGNPTXZaS0RNN2NnTThyTnZsNnVBVXdlbGZYazMwNi8z?=
 =?utf-8?B?NFYvSGwrN3ZpOGg5SFgyVDF4aGQrQ1pHZS9Xd0J4UzcvczlUWitrNjhOVFAr?=
 =?utf-8?B?ZWsyYjZQT2UrZWQwb1gzc1V2eGx1ZXRaRFlrK2F2WVZFb1QzM1JjYjl1Yk5T?=
 =?utf-8?B?QlZsVzk5NUJCVFNKRmZzVjJsL3NkNjJQVE9IM0FrVnp5MVBpcEZxWUdBOWQz?=
 =?utf-8?B?cVNRYmVVM0ZQUjE3TlUvRk1sWE83RjZMdUxuNVVtUEZnMzNFTStYZVdNaEp3?=
 =?utf-8?B?dWJZVUx2ekRSVFFta0ZCTVZwc3FSYmxSYlBrWjZMbE1WdDBGZXNUbWIwcXBu?=
 =?utf-8?B?bzBNOUI4YlRTSVNVaTJUWUE5dUE2Y3lWQk52b05uazY3VnBLNzYwTHc4ajRm?=
 =?utf-8?B?OVhjQXowRjhVaksrK0dKTlRCaHkrMGZaVk1ROGJUTFFWdm5FckY3dFlXcmN3?=
 =?utf-8?B?V1ZxakxGYittTmh2YWV1ZTAwbVRoNUVibnFsWkZYTlhaR3VpeE5XNTF5WnVl?=
 =?utf-8?B?KzZGbUNmcFRDRDJGZ05XNHhDRHREdWd1VS9ybm5PTzRzV0c3SG5Lb0lvZ2hw?=
 =?utf-8?B?TlRGYndWUXRwMUhxaDhlNXFYVk03QThjRnp6NEM2UXJHWVJNcDNtVGdlZUcr?=
 =?utf-8?B?dHpueStwdDRLazVJSk1PQlhQcHY1NlpvdmNmbHFGdE5ua3o4blowd2UzT3No?=
 =?utf-8?B?Q1h2ZGRJcS96bzdXTVZjMVdaUEh0VHpRQVdja2Q2VTcrV21aQzQ0ZFdzekZw?=
 =?utf-8?B?KzBpdDVDR0JCQkg5QTRqTmhaMXJTemVZQlpsM3Y5ZzIvVW9oTFNKQi8zWEE2?=
 =?utf-8?B?a1lQeW40ck5xWTVnRXltdWs4UVVZRXMxbFFmZWVjQmFXNlY0TkRTbWcvU2FY?=
 =?utf-8?B?aElleHRHYWFNS3owY2FqWUlOc0VWcTBQTlV5MUFGaTNWSXFMbFNuNHVxQklF?=
 =?utf-8?B?MTBxMjJYTjhrbTBWd2xjMGxqMVp6SUJKdzlMdG5UL3JoMFE0bTV0Tm5UL3Bx?=
 =?utf-8?B?U3RVTFFTcjBwWWN0bnYzYlplU28xNDhXSSs3Nnp1aGtqYmZXZUpxOVVtQ2xm?=
 =?utf-8?B?ejJOVzRqdytDSlErMjdSRDlydHNjTkc3SDFhQWp6eCtHajQ5VmtPOGwvZGVq?=
 =?utf-8?B?UkJjV0JEeEdXa1h1WS9GTE9wNTZORjhMSm9JanR4Y0t4emJsaS9OOEcvSzht?=
 =?utf-8?B?dWRlbk1BTkFKZ2dSNzFvMSt0MTd3b2x6N0dqMHpPOXczd1Y5emtjc2g1azZT?=
 =?utf-8?B?Y3BnMUl2am16SDZ4WTZoYnE2dzVWQ0Q0b0VGMnhvL3p3cURjVUMxL2lKL2lk?=
 =?utf-8?B?M3FSNDAxcEozeXFwbm9wQ3c1RXNmL2pRTkhoQVpkVGRYTmRBWE5yMG1WY3FL?=
 =?utf-8?B?T2NDdjdxWmU4Z1cwUElzMElJYnJFUms1ajZER2NHS2J3aUdVUXV5UHl0OTBH?=
 =?utf-8?B?Sjlady9XWGF0K1JPMzltQ0h5NG92Rm5SY2V1V2p1ZWxPazVRTmQrY0QvUDZw?=
 =?utf-8?B?V0JTV3Zpd2poM1NyRnFPbnQ4M0s3bHpuRENveXphWDZYMFRKWTZybDhaVGEz?=
 =?utf-8?B?L2pPZWE5d1NuZklSWk5OZ1ZuVG0rRnNKUjJnK29xeHNkRU9MU1prSlE1a1pa?=
 =?utf-8?B?VDRGY0k3dGNDNXJyWVkvaTMxUW9jV3FGKysxS1FXLzBtdy9TblhqM2VSQjhC?=
 =?utf-8?B?QUtaakR3MHc1cEZTcGlSendrWFJZTndKUHdsaGg4dVRQd2lnTVRKdEljUzMy?=
 =?utf-8?B?TVBqRmx0clRyYkxrNGJWVEgweEQxS2tvRFlkd3ZjVkxJN0lucSt4TktvNEFM?=
 =?utf-8?B?cHFuSGN3YzNVVFZhOU9KZWdEV003QWRsS0MwVzJSandFTVJMc1R2YmY1OUVu?=
 =?utf-8?B?T1ZWRzRLdGl0allqSUJIMjZmdzdCWm1VblFJMk1MemFnek9hV1laWmJER2E5?=
 =?utf-8?Q?TNsM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02091d05-ea54-4f76-017b-08d9d519e586
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5149.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 15:49:05.3330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdsok5V4cvY9ps1/U1Uwi6CYpEijWt1iVX8OytL/1+0eiJaEX+o/4O1x0EU+OMFU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5518
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2022-01-10 7:10 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:116c8cf4-57c2-f3a1-f4b9-5f0ef4526967@amd.com">On
      2022-01-05 10:22 a.m., philip yang wrote:
      <br>
      <blockquote type="cite">
        <br>
        <br>
        On 2021-12-22 7:37 p.m., Rajneesh Bhardwaj wrote:
        <br>
        <blockquote type="cite">Recoverable page faults are represented
          by the xnack mode setting inside
          <br>
          a kfd process and are used to represent the device page
          faults. For CR,
          <br>
          we don't consider negative values which are typically used for
          querying
          <br>
          the current xnack mode without modifying it.
          <br>
          <br>
          Signed-off-by: Rajneesh
          Bhardwaj<a class="moz-txt-link-rfc2396E" href="mailto:rajneesh.bhardwaj@amd.com">&lt;rajneesh.bhardwaj@amd.com&gt;</a>
          <br>
          ---
          <br>
          &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15
          +++++++++++++++
          <br>
          &nbsp; drivers/gpu/drm/amd/amdkfd/kfd_priv.h&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
          <br>
          &nbsp; 2 files changed, 16 insertions(+)
          <br>
          <br>
          diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          <br>
          index 178b0ccfb286..446eb9310915 100644
          <br>
          --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          <br>
          +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
          <br>
          @@ -1845,6 +1845,11 @@ static int
          criu_checkpoint_process(struct kfd_process *p,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;process_priv, 0, sizeof(process_priv));
          <br>
          &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_priv.version = KFD_CRIU_PRIV_VERSION;
          <br>
          +&nbsp;&nbsp;&nbsp; /* For CR, we don't consider negative xnack mode which is
          used for
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * querying without changing it, here 0 simply means
          disabled and 1
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; * means enabled so retry for finding a valid PTE.
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp; */
          <br>
        </blockquote>
        Negative value to query xnack mode is for
        kfd_ioctl_set_xnack_mode user space ioctl interface, which is
        not used by CRIU, I think this comment is misleading,
        <br>
        <blockquote type="cite">+&nbsp;&nbsp;&nbsp; process_priv.xnack_mode =
          p-&gt;xnack_enabled ? 1 : 0;
          <br>
        </blockquote>
        change to process_priv.xnack_enabled
        <br>
        <blockquote type="cite">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
          copy_to_user(user_priv_data + *priv_offset,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;process_priv, sizeof(process_priv));
          <br>
          @@ -2231,6 +2236,16 @@ static int criu_restore_process(struct
          kfd_process *p,
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
          <br>
          &nbsp; +&nbsp;&nbsp;&nbsp; pr_debug(&quot;Setting XNACK mode\n&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp; if (process_priv.xnack_mode &amp;&amp;
          !kfd_process_xnack_mode(p, true)) {
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;xnack mode cannot be set\n&quot;);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EPERM;
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
          <br>
          +&nbsp;&nbsp;&nbsp; } else {
          <br>
        </blockquote>
        <br>
        On GFXv9 GPUs except Aldebaran, this means the process
        checkpointed is xnack off, it can restore and resume on GPU with
        xnack on, then shader will continue running successfully, but
        driver is not guaranteed to map svm ranges on GPU all the time,
        if retry fault happens, the shader will not recover. Maybe
        change to:
        <br>
        <br>
        If (KFD_GC_VERSION(dev) != IP_VERSION(9, 4, 2) {
        <br>
        <br>
      </blockquote>
      The code here was correct. The xnack mode applies to the whole
      process, not just one GPU. The logic for checking the capabilities
      of all GPUs is already in kfd_process_xnack_mode. If XNACK cannot
      be supported by all GPUs, restoring a non-0 XNACK mode will fail.
      <br>
      <br>
      Any GPU can run in XNACK-disabled mode. So we don't need any
      limitations for process_priv.xnack_enabled == 0.
      <br>
    </blockquote>
    <p>Yes, the code was correct, for case all GPUs dev-&gt;noretry=0
      (xnack on), process-&gt;xnack_enabled=0, we unmap the queues while
      migrating, guarantee to map svm ranges on GPUs then resume queues.
      If retry fault happens, we don't recover the fault, report the
      fault to user space. That is all correct.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:116c8cf4-57c2-f3a1-f4b9-5f0ef4526967@amd.com">
      <br>
      Regards,
      <br>
      &nbsp; Felix
      <br>
      <br>
      <br>
      <blockquote type="cite">&nbsp;&nbsp;&nbsp; if (process_priv.xnack_enabled !=
        kfd_process_xnack_mode(p, true)) {
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_err(&quot;xnack mode cannot be set\n&quot;);
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EPERM;
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto exit;
        <br>
        <br>
        &nbsp;&nbsp;&nbsp; }
        <br>
        <br>
        }
        <br>
        <br>
        pr_debug(&quot;set xnack mode: %d\n&quot;, process_priv.xnack_enabled);
        <br>
        <br>
        p-&gt;xnack_enabled = process_priv.xnack_enabled;
        <br>
        <br>
        <br>
        <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;set xnack mode:
          %d\n&quot;, process_priv.xnack_mode);
          <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p-&gt;xnack_enabled = process_priv.xnack_mode;
          <br>
          +&nbsp;&nbsp;&nbsp; }
          <br>
          +
          <br>
          &nbsp; exit:
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
          <br>
          &nbsp; }
          <br>
          diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          <br>
          index 855c162b85ea..d72dda84c18c 100644
          <br>
          --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          <br>
          +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
          <br>
          @@ -1057,6 +1057,7 @@ void kfd_process_set_trap_handler(struct
          qcm_process_device *qpd,
          <br>
          &nbsp; &nbsp; struct kfd_criu_process_priv_data {
          <br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t version;
          <br>
          +&nbsp;&nbsp;&nbsp; uint32_t xnack_mode;
          <br>
        </blockquote>
        <br>
        bool xnack_enabled;
        <br>
        <br>
        Regards,
        <br>
        <br>
        Philip
        <br>
        <br>
        <blockquote type="cite">&nbsp; };
          <br>
          &nbsp; &nbsp; struct kfd_criu_device_priv_data {
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>
