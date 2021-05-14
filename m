Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E983804D6
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 10:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4CF6EE3A;
	Fri, 14 May 2021 08:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C94F6EE3A;
 Fri, 14 May 2021 08:05:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cj9yBZs1eHi7qpYkIkt/YHD/ptlsU+zcovkDZpNpZacYygCmZvxrtuvMwAccb8Lc0EJdoQgAvyTcjArP/n6ARIx6ONcG0R4dnuwgi1NUnYJSxOSnhR9jHO059bzGJA2FIZxYpTdu3snzDbYq++berwVoeexnxZgDbZzC8D7t+HjUkQTdhosJin0VMQSwqlpdvqA+2HPrOg8G21kuElx/eSDQQueVtldWDmHt8VtXWEZtGDFJ2EPB42Cxl611w1w/qLsk2mL7626H9R8NAty5cLCvxieIdSPEVVUoSRTyyeVEgt2g3tTkYfzob5JDxsfqCMBe52dCOUIycmZpn1BVsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp4VWWSqzje51i4z4KvvZ2b9clM3s3JSou2sjzJx/CQ=;
 b=kD0FnA9vUpIJeXGXIYigBtIDtirflEKMIRH3lhvkTyQAhRye9OokzyFCYQPy876/iJDS2UxlRBP4+IAFB/cHV+Gwoqq1EQrgXt8QoqfSC3tSIwWPuYZgvUAkDrggXmG3rhGIE0fXBMQ7KO3lzLCjBNf6DygVipRkFUy0OKxEyj/jUnhbSPSBxcf4aaid5yMJTWqZn3udxZCs7YaOPZub/KiLZlj143+suI8Na7TQEjuJP0eUwDu1lkzFqAxBxAz4lGnDeMud6j1tyT+d64m5CvxfA+NGofs7OHgjvyV1bdTYDz79GVOcFX96rNE4QsPyzhG8Pihw6JY8fqAElFkjfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yp4VWWSqzje51i4z4KvvZ2b9clM3s3JSou2sjzJx/CQ=;
 b=cx9dd3gotgVp92DylpRPRWtcisC558G5YP4y+0+w3/NknfpTi3i8zcG4jo6NCgg4xXu1G5LxCjwITWnJOx97rocXotusz0yfvzYzlqLFHsHsuMSoVxLoseyS/MbPt0ChJ4vy6qLIZY4K8s14cE3KHujpfuqMoLvf6iJNu6maqZM=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4848.namprd12.prod.outlook.com (2603:10b6:208:1be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 08:04:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 08:04:54 +0000
Subject: Re: [PATCH 0/7] Per client engine busyness
To: "Nieto, David M" <David.Nieto@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
Date: Fri, 14 May 2021 10:04:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="------------33218AAAA33C6B4900170AC6"
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
X-ClientProxiedBy: PR0P264CA0144.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cf70:a0fd:8c48:efd4]
 (2a02:908:1252:fb60:cf70:a0fd:8c48:efd4) by
 PR0P264CA0144.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Fri, 14 May 2021 08:04:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 641c5c4b-d29a-4b52-d97f-08d916aef4ed
X-MS-TrafficTypeDiagnostic: MN2PR12MB4848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB48486005CD6E0EC16CF3122C83509@MN2PR12MB4848.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZpMjDdkpUPn/EZk+FK938coHQz/XFQLPVDHL6WPu+Hth2YhuqC4txnCX8j2bAllPLfA1vO28QYaOexbxiXBg0EMlTdaAhufTL+qCym5mZa6j9fgpSPZHtTWuJ6T6sQ+PxA2Nw1M2ox6R7v7cEGEj8zZkGp4qwcCvf4FOXtXTLEDzI1X0HPP2Mffckp7tqXBxXb2A7ZjPrLmG9YPK5UMVOBaasvXpCLwj8bd0myCYXWPK+rdJh83Ecf7BC2QUs2vsIEmDaNtdFvyyx3EY2XUCUAsD0lywvNyZG8D+pR5fyLF6r8igLcYIW6xQJTGWwgoAAbZ+EY1+kKZwHsNB4QMHLvXhyKlfRmoi2oS5rHsRNXoTSOhvsBLHjpUi9SChA6yLKtefbnjFkr0VVc19R1be4K8WiBUjwuywwWIrrhh9awoIAUadqO/yOcg6Pjj8ZkhaqWMz7VbNZ2Bu5JsNODI/TFk3joQ2+UMRC8zLm8AcUlaHCaNjen9HC5OHdTmLvlV3snBMk0rROZQyenVgavXcqcejZ8VJLyAardgeszf/hF0rOvgDX2TWpv5wYxsx+xQNTXGhLvcka2BGzAe666LeXbHugpku7Yy1/Ou9Ib0/MgTelJnAVC2H4HjO9moCJQMMCdEV5EDQYU5BWGX1RtIkzMZhzPtbcDgnng5rJ9rW6Tdp8WHURvTyThSdsA4BMRP47zyDCZPUQONzZtaTIUqFMw8Wp97LMFss1ftqsNmHf0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(52116002)(33964004)(2906002)(38100700002)(4326008)(53546011)(66476007)(36756003)(31696002)(86362001)(66556008)(478600001)(8676002)(19627405001)(6486002)(5660300002)(30864003)(31686004)(83380400001)(8936002)(66946007)(2616005)(966005)(45080400002)(6666004)(54906003)(186003)(166002)(110136005)(316002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eTNkbk9VWVB6N1MrQVc3NisrYVJHZGhNUWRaNDh2bWtxQi92OGZ0MDYyalR3?=
 =?utf-8?B?ZGIyNUszSW9uOFJINHphTjBkM0FNSldJNWptcFFKYXJHbU1JMVUrUnl2MXNV?=
 =?utf-8?B?WXR5Y08zYXBiOVZuSnFxNExVZk11M2UzNEJBbFdBb29jdUJMYzlPM0d4b0lw?=
 =?utf-8?B?RVBobVpWNVpYT0ZCMHh0RzU4dkxRTngvYTB4T3pRNHFROCt3ZVBPcTBMeFdu?=
 =?utf-8?B?YlFza3JwZUJuejFxMWV1Q3ZsTEhmTk1yRm9uT1JsWUxncUE0ZXVieUxTR016?=
 =?utf-8?B?VmxwQlpIejRsZUs0TkxnM0xxa0NXeEJpeDhUYnJzUzM4RUEyV0J4UzFLSldJ?=
 =?utf-8?B?TkM3NEVMQkZaeTJjTGc1U21GRG5EZVJJT3JTcXZ1S2lpM0pEQVNwRExVY3Fw?=
 =?utf-8?B?ZGVoMlZocDExdEJ5NE1uK1Ywdk1jNkRqZmVjQlRyMkVoQkFBVEpVU3ZkS2kr?=
 =?utf-8?B?andDNVdFVGN3UTVHcUZGby80UFNpQkN1V2E5ekNrcVlYL3JNa3RnS1duV1gw?=
 =?utf-8?B?M0xCR0UwZlRjcmMxenNEQ1RSR2tCTDVrcGVwUkRUeVZQMGlGQVU4R0dPSUl3?=
 =?utf-8?B?UjhIbWQ0eFRBWEpEemZLdDJabmZJbTFDZGQveGVyUUlJaC9WRWdKYURlWXFN?=
 =?utf-8?B?SmZtZUJvakkyS2o1RFZhOEQ5dEFUaFVaNWY3Z2tHdFFSdDV5THl6WE0rdXJo?=
 =?utf-8?B?eWdpbHErdWdKK1o2OFAvc2I5NTlUa1B5ZGxKRkxjNjIzMkpXMDEwM1JxQlNy?=
 =?utf-8?B?MkZBajlwRmdGd0VTYTNscnZVWG9ySHoxT3BpcjcrY2haVGxSbVc1bmxkRUtl?=
 =?utf-8?B?WEdOTkkwZGV6N01kTDl6VCtzNG1KT0hhMExnQldFWll0cGRKMDNsNlExMGsy?=
 =?utf-8?B?SktTS0xjdEJaNStCU2FZdFI4M0gxcGkxaVNtVjk3RW5sWGpHRlRIM3huV3FT?=
 =?utf-8?B?R0xnTUpNMzhJMlVaMTY4L2NHeVZVdFNZeEtwalZJVThkNys3NW9lbEdOM05x?=
 =?utf-8?B?S0Rrc3ZhRlB6NEptNklvdWxtbFpqTjJVMjc0akI0L2k3RDJRM1ZFSDJ0RlQx?=
 =?utf-8?B?SElUNk04YjVMQVlFL215MnRBUmtMckk1bTNFQ0NKdTdHbU8rdzE5andwUXJW?=
 =?utf-8?B?WXVCcWtEM1M4ZytwaGNmejk3MkJWeXZTRUM2K1hGSjJUbjh3bWI5Vmdrem0y?=
 =?utf-8?B?cFJUbDN4OTdzek1nTHpLRFNJbXhsaG1yeVkrTlYrckdFNTBIeGxlTzF2VlpI?=
 =?utf-8?B?QzU1Rmk3eGF1K0IyYVkzLzVWU29JaHN0V29kSlFrUFJkVnJaY3RnSzMybUov?=
 =?utf-8?B?dmg3KzcySTM0NHBYV0VjRFRrOWtSTEpqZGFZNVBhUDk1M0VaTldFWUgrTjFh?=
 =?utf-8?B?QmpiY1NqQVVhNjhIa00vU0NZMGhmOW9JMUlkSWZOUk9iUk13cXNsVlF4ZXpE?=
 =?utf-8?B?SkwyNXFQdm9aVlg3aDg1aUlKRERVSVpBSmI2aGZmQUVCdUZ3b1Z0UDRDbUdY?=
 =?utf-8?B?SnpBOUEwVWFJbHgvb3FhNW55U210ekpMS2JxSWhtcnNjR1ZPTFVlcHVrWGpF?=
 =?utf-8?B?aUM1aHFXM0NENWhWOElXZmVCRmRFQ0o0K2p5bUx4ZnpEd3RlaGVqcFZPbE01?=
 =?utf-8?B?U01WcWQ0SFdXOTVZNTlFdUVTOC9IanM3cWt0eUpFZ2NmczZRS2RaN2d6Q2Ew?=
 =?utf-8?B?ZUtRVTh3YXR0RWRUZUk4bGpoSXd0bEVlbHRZSW9iRHI1VHlnL3B3M1lRUTNi?=
 =?utf-8?B?S0tyQU9XV3MrMzQyRkFvMDFCanJBcnM3cm0xY1RxVEJRakY2T0FSWTZSc2Fi?=
 =?utf-8?B?aHRmSHEvcnJJODV5STc2Yk1BWFByVWtKOWV4djlvYnlVZHFucGhJenQ2bys3?=
 =?utf-8?Q?hEYqZKk4xKMLw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641c5c4b-d29a-4b52-d97f-08d916aef4ed
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 08:04:54.1243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLqW2RmKOiifw9CgdowRjRJN5ZTCIwhxZ2lwvVpEIQCPGmSeXn4C9i29OqXFAGPt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4848
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------33218AAAA33C6B4900170AC6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Well in my opinion exposing it through fdinfo turned out to be a really 
clean approach.

It describes exactly the per file descriptor information we need.

Making that device driver independent is potentially useful as well.

Regards,
Christian.

Am 14.05.21 um 09:22 schrieb Nieto, David M:
>
> [AMD Official Use Only - Internal Distribution Only]
>
>
> We had entertained the idea of exposing the processes as sysfs nodes 
> as you proposed, but we had concerns about exposing process info in 
> there, especially since /proc already exists for that purpose.
>
> I think if you were to follow that approach, we could have tools like 
> top that support exposing GPU engine usage.
> ------------------------------------------------------------------------
> *From:* Alex Deucher <alexdeucher@gmail.com>
> *Sent:* Thursday, May 13, 2021 10:58 PM
> *To:* Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Nieto, David M 
> <David.Nieto@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> *Cc:* Intel Graphics Development <Intel-gfx@lists.freedesktop.org>; 
> Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Daniel 
> Vetter <daniel@ffwll.ch>
> *Subject:* Re: [PATCH 0/7] Per client engine busyness
> + David, Christian
>
> On Thu, May 13, 2021 at 12:41 PM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > Hi,
> >
> > On 13/05/2021 16:48, Alex Deucher wrote:
> > > On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin
> > > <tvrtko.ursulin@linux.intel.com> wrote:
> > >>
> > >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > >>
> > >> Resurrect of the previosuly merged per client engine busyness 
> patches. In a
> > >> nutshell it enables intel_gpu_top to be more top(1) like useful 
> and show not
> > >> only physical GPU engine usage but per process view as well.
> > >>
> > >> Example screen capture:
> > >> 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> intel-gpu-top -  906/ 955 MHz;    0% RC6; 5.30 Watts;      933 irqs/s
> > >>
> > >>        IMC reads:     4414 MiB/s
> > >>       IMC writes:     3805 MiB/s
> > >>
> > >>            ENGINE BUSY                                      
> MI_SEMA MI_WAIT
> > >>       Render/3D/0   93.46% |████████████████████████████████▋  
> |      0%      0%
> > >>         Blitter/0    0.00% |                                   
> |      0%      0%
> > >>           Video/0    0.00% |                                   
> |      0%      0%
> > >>    VideoEnhance/0    0.00% |                                   
> |      0%      0%
> > >>
> > >>    PID            NAME  Render/3D Blitter        Video      
> VideoEnhance
> > >>   2733       neverball |██████▌ ||            ||            
> ||            |
> > >>   2047            Xorg |███▊ ||            ||            
> ||            |
> > >>   2737        glxgears |█▍ ||            ||            
> ||            |
> > >>   2128           xfwm4 | ||            ||            ||            |
> > >>   2047            Xorg | ||            ||            ||            |
> > >> 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >>
> > >> Internally we track time spent on engines for each struct 
> intel_context, both
> > >> for current and past contexts belonging to each open DRM file.
> > >>
> > >> This can serve as a building block for several features from the 
> wanted list:
> > >> smarter scheduler decisions, getrusage(2)-like per-GEM-context 
> functionality
> > >> wanted by some customers, setrlimit(2) like controls, cgroups 
> controller,
> > >> dynamic SSEU tuning, ...
> > >>
> > >> To enable userspace access to the tracked data, we expose time 
> spent on GPU per
> > >> client and per engine class in sysfs with a hierarchy like the below:
> > >>
> > >>          # cd /sys/class/drm/card0/clients/
> > >>          # tree
> > >>          .
> > >>          ├── 7
> > >>          │   ├── busy
> > >>          │   │   ├── 0
> > >>          │   │   ├── 1
> > >>          │   │   ├── 2
> > >>          │   │   └── 3
> > >>          │   ├── name
> > >>          │   └── pid
> > >>          ├── 8
> > >>          │   ├── busy
> > >>          │   │   ├── 0
> > >>          │   │   ├── 1
> > >>          │   │   ├── 2
> > >>          │   │   └── 3
> > >>          │   ├── name
> > >>          │   └── pid
> > >>          └── 9
> > >>              ├── busy
> > >>              │   ├── 0
> > >>              │   ├── 1
> > >>              │   ├── 2
> > >>              │   └── 3
> > >>              ├── name
> > >>              └── pid
> > >>
> > >> Files in 'busy' directories are numbered using the engine class 
> ABI values and
> > >> they contain accumulated nanoseconds each client spent on engines 
> of a
> > >> respective class.
> > >
> > > We did something similar in amdgpu using the gpu scheduler.  We then
> > > expose the data via fdinfo.  See
> > > 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=mt1EIL%2Fc9pHCXR%2FYSd%2BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;reserved=0 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=mt1EIL%2Fc9pHCXR%2FYSd%2BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;reserved=0>
> > > 
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F3zMGw0LPTC1kG4NebTwUPTx7QCtEyw%2B4JToXDK5QXI%3D&amp;reserved=0 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F3zMGw0LPTC1kG4NebTwUPTx7QCtEyw%2B4JToXDK5QXI%3D&amp;reserved=0>
> >
> > Interesting!
> >
> > Is yours wall time or actual GPU time taking preemption and such into
> > account? Do you have some userspace tools parsing this data and how to
> > do you client discovery? Presumably there has to be a better way that
> > going through all open file descriptors?
>
> Wall time.  It uses the fences in the scheduler to calculate engine
> time.  We have some python scripts to make it look pretty, but mainly
> just reading the files directly.  If you know the process, you can
> look it up in procfs.
>
> >
> > Our implementation was merged in January but Daniel took it out recently
> > because he wanted to have discussion about a common vendor framework for
> > this whole story on dri-devel. I think. +Daniel to comment.
> >
> > I couldn't find the patch you pasted on the mailing list to see if there
> > was any such discussion around your version.
>
> It was on the amd-gfx mailing list.
>
> Alex
>
> >
> > Regards,
> >
> > Tvrtko
> >
> > >
> > > Alex
> > >
> > >
> > >>
> > >> Tvrtko Ursulin (7):
> > >>    drm/i915: Expose list of clients in sysfs
> > >>    drm/i915: Update client name on context create
> > >>    drm/i915: Make GEM contexts track DRM clients
> > >>    drm/i915: Track runtime spent in closed and unreachable GEM 
> contexts
> > >>    drm/i915: Track all user contexts per client
> > >>    drm/i915: Track context current active time
> > >>    drm/i915: Expose per-engine client busyness
> > >>
> > >> drivers/gpu/drm/i915/Makefile                 |   5 +-
> > >> drivers/gpu/drm/i915/gem/i915_gem_context.c   |  61 ++-
> > >> .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
> > >> drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
> > >> drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
> > >> drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
> > >> .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
> > >> .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
> > >> drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
> > >> drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
> > >> drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
> > >> drivers/gpu/drm/i915/i915_drm_client.c        | 365 
> ++++++++++++++++++
> > >> drivers/gpu/drm/i915/i915_drm_client.h        | 123 ++++++
> > >> drivers/gpu/drm/i915/i915_drv.c               |   6 +
> > >> drivers/gpu/drm/i915/i915_drv.h               |   5 +
> > >> drivers/gpu/drm/i915/i915_gem.c               |  21 +-
> > >> drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +-
> > >> drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
> > >> drivers/gpu/drm/i915/i915_sysfs.c             |   8 +
> > >>   19 files changed, 716 insertions(+), 81 deletions(-)
> > >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
> > >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
> > >>
> > >> --
> > >> 2.30.2
> > >>


--------------33218AAAA33C6B4900170AC6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Well in my opinion exposing it through fdinfo turned out to be a
    really clean approach.<br>
    <br>
    It describes exactly the per file descriptor information we need.<br>
    <br>
    Making that device driver independent is potentially useful as well.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 14.05.21 um 09:22 schrieb Nieto,
      David M:<br>
    </div>
    <blockquote type="cite" cite="mid:BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" align="Left">
        [AMD Official Use Only - Internal Distribution Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          We had entertained the idea of exposing the processes as sysfs
          nodes as you proposed, but we had concerns about exposing
          process info in there, especially since /proc already exists
          for that purpose.</div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0); background-color:
          rgb(255, 255, 255);">
          I think if you were to follow that approach, we could have
          tools like top that support exposing GPU engine usage.</div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b> Alex
            Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexdeucher@gmail.com">&lt;alexdeucher@gmail.com&gt;</a><br>
            <b>Sent:</b> Thursday, May 13, 2021 10:58 PM<br>
            <b>To:</b> Tvrtko Ursulin
            <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@linux.intel.com">&lt;tvrtko.ursulin@linux.intel.com&gt;</a>; Nieto, David M
            <a class="moz-txt-link-rfc2396E" href="mailto:David.Nieto@amd.com">&lt;David.Nieto@amd.com&gt;</a>; Koenig, Christian
            <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
            <b>Cc:</b> Intel Graphics Development
            <a class="moz-txt-link-rfc2396E" href="mailto:Intel-gfx@lists.freedesktop.org">&lt;Intel-gfx@lists.freedesktop.org&gt;</a>; Maling list - DRI
            developers <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; Daniel
            Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a><br>
            <b>Subject:</b> Re: [PATCH 0/7] Per client engine busyness</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">+ David, Christian<br>
                <br>
                On Thu, May 13, 2021 at 12:41 PM Tvrtko Ursulin<br>
                <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@linux.intel.com">&lt;tvrtko.ursulin@linux.intel.com&gt;</a> wrote:<br>
                &gt;<br>
                &gt;<br>
                &gt; Hi,<br>
                &gt;<br>
                &gt; On 13/05/2021 16:48, Alex Deucher wrote:<br>
                &gt; &gt; On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin<br>
                &gt; &gt; <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@linux.intel.com">&lt;tvrtko.ursulin@linux.intel.com&gt;</a> wrote:<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; From: Tvrtko Ursulin
                <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a><br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; Resurrect of the previosuly merged per
                client engine busyness patches. In a<br>
                &gt; &gt;&gt; nutshell it enables intel_gpu_top to be
                more top(1) like useful and show not<br>
                &gt; &gt;&gt; only physical GPU engine usage but per
                process view as well.<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; Example screen capture:<br>
                &gt; &gt;&gt;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
                &gt; &gt;&gt; intel-gpu-top -&nbsp; 906/ 955 MHz;&nbsp;&nbsp;&nbsp; 0% RC6;&nbsp;
                5.30 Watts;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 933 irqs/s<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IMC reads:&nbsp;&nbsp;&nbsp;&nbsp; 4414 MiB/s<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IMC writes:&nbsp;&nbsp;&nbsp;&nbsp; 3805 MiB/s<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ENGINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                BUSY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MI_SEMA
                MI_WAIT<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Render/3D/0&nbsp;&nbsp; 93.46%
                |████████████████████████████████▋&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blitter/0&nbsp;&nbsp;&nbsp; 0.00%
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Video/0&nbsp;&nbsp;&nbsp; 0.00%
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; VideoEnhance/0&nbsp;&nbsp;&nbsp; 0.00%
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; PID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAME&nbsp; Render/3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Blitter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Video&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VideoEnhance<br>
                &gt; &gt;&gt;&nbsp;&nbsp; 2733&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; neverball |██████▌&nbsp;&nbsp;&nbsp;&nbsp;
                ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
                &gt; &gt;&gt;&nbsp;&nbsp; 2047&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Xorg |███▊&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
                &gt; &gt;&gt;&nbsp;&nbsp; 2737&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; glxgears |█▍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
                &gt; &gt;&gt;&nbsp;&nbsp; 2128&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xfwm4 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
                &gt; &gt;&gt;&nbsp;&nbsp; 2047&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Xorg |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
                &gt; &gt;&gt;
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; Internally we track time spent on engines
                for each struct intel_context, both<br>
                &gt; &gt;&gt; for current and past contexts belonging to
                each open DRM file.<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; This can serve as a building block for
                several features from the wanted list:<br>
                &gt; &gt;&gt; smarter scheduler decisions,
                getrusage(2)-like per-GEM-context functionality<br>
                &gt; &gt;&gt; wanted by some customers, setrlimit(2)
                like controls, cgroups controller,<br>
                &gt; &gt;&gt; dynamic SSEU tuning, ...<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; To enable userspace access to the tracked
                data, we expose time spent on GPU per<br>
                &gt; &gt;&gt; client and per engine class in sysfs with
                a hierarchy like the below:<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # cd
                /sys/class/drm/card0/clients/<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # tree<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ├── 7<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; ├── busy<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; ├── 0<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; ├── 1<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; ├── 2<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; └── 3<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; ├── name<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; └── pid<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ├── 8<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; ├── busy<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; ├── 0<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; ├── 1<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; ├── 2<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; │&nbsp;&nbsp; └── 3<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; ├── name<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; └── pid<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; └── 9<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ├── busy<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; ├── 0<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; ├── 1<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; ├── 2<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; │&nbsp;&nbsp; └── 3<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ├── name<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; └── pid<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; Files in 'busy' directories are numbered
                using the engine class ABI values and<br>
                &gt; &gt;&gt; they contain accumulated nanoseconds each
                client spent on engines of a<br>
                &gt; &gt;&gt; respective class.<br>
                &gt; &gt;<br>
                &gt; &gt; We did something similar in amdgpu using the
                gpu scheduler.&nbsp; We then<br>
                &gt; &gt; expose the data via fdinfo.&nbsp; See<br>
                &gt; &gt; <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=mt1EIL%2Fc9pHCXR%2FYSd%2BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;amp;reserved=0" moz-do-not-send="true">
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=mt1EIL%2Fc9pHCXR%2FYSd%2BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;amp;reserved=0</a><br>
                &gt; &gt; <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=%2F3zMGw0LPTC1kG4NebTwUPTx7QCtEyw%2B4JToXDK5QXI%3D&amp;amp;reserved=0" moz-do-not-send="true">
https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=%2F3zMGw0LPTC1kG4NebTwUPTx7QCtEyw%2B4JToXDK5QXI%3D&amp;amp;reserved=0</a><br>
                &gt;<br>
                &gt; Interesting!<br>
                &gt;<br>
                &gt; Is yours wall time or actual GPU time taking
                preemption and such into<br>
                &gt; account? Do you have some userspace tools parsing
                this data and how to<br>
                &gt; do you client discovery? Presumably there has to be
                a better way that<br>
                &gt; going through all open file descriptors?<br>
                <br>
                Wall time.&nbsp; It uses the fences in the scheduler to
                calculate engine<br>
                time.&nbsp; We have some python scripts to make it look
                pretty, but mainly<br>
                just reading the files directly.&nbsp; If you know the
                process, you can<br>
                look it up in procfs.<br>
                <br>
                &gt;<br>
                &gt; Our implementation was merged in January but Daniel
                took it out recently<br>
                &gt; because he wanted to have discussion about a common
                vendor framework for<br>
                &gt; this whole story on dri-devel. I think. +Daniel to
                comment.<br>
                &gt;<br>
                &gt; I couldn't find the patch you pasted on the mailing
                list to see if there<br>
                &gt; was any such discussion around your version.<br>
                <br>
                It was on the amd-gfx mailing list.<br>
                <br>
                Alex<br>
                <br>
                &gt;<br>
                &gt; Regards,<br>
                &gt;<br>
                &gt; Tvrtko<br>
                &gt;<br>
                &gt; &gt;<br>
                &gt; &gt; Alex<br>
                &gt; &gt;<br>
                &gt; &gt;<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; Tvrtko Ursulin (7):<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Expose list of clients in
                sysfs<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Update client name on context
                create<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Make GEM contexts track DRM
                clients<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Track runtime spent in closed
                and unreachable GEM contexts<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Track all user contexts per
                client<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Track context current active
                time<br>
                &gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Expose per-engine client
                busyness<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 5 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/gem/i915_gem_context.c&nbsp;&nbsp; |&nbsp; 61 ++-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                .../gpu/drm/i915/gem/i915_gem_context_types.h |&nbsp; 16 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/gt/intel_context.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 27 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/gt/intel_context.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 15 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/gt/intel_context_types.h |&nbsp; 24 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                .../drm/i915/gt/intel_execlists_submission.c&nbsp; |&nbsp; 23 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                .../gpu/drm/i915/gt/intel_gt_clock_utils.c&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/gt/intel_lrc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 27 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/gt/intel_lrc.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 24 ++<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/gt/selftest_lrc.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_drm_client.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 365
                ++++++++++++++++++<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_drm_client.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 123
                ++++++<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_drv.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 +<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_drv.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 5 +<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_gem.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 21 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_gpu_error.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 31 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_gpu_error.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
                &gt; &gt;&gt;&nbsp;&nbsp;
                drivers/gpu/drm/i915/i915_sysfs.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +<br>
                &gt; &gt;&gt;&nbsp;&nbsp; 19 files changed, 716 insertions(+), 81
                deletions(-)<br>
                &gt; &gt;&gt;&nbsp;&nbsp; create mode 100644
                drivers/gpu/drm/i915/i915_drm_client.c<br>
                &gt; &gt;&gt;&nbsp;&nbsp; create mode 100644
                drivers/gpu/drm/i915/i915_drm_client.h<br>
                &gt; &gt;&gt;<br>
                &gt; &gt;&gt; --<br>
                &gt; &gt;&gt; 2.30.2<br>
                &gt; &gt;&gt;<br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------33218AAAA33C6B4900170AC6--
