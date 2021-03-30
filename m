Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC77B34F431
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 00:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10DD6E988;
	Tue, 30 Mar 2021 22:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BD36E986;
 Tue, 30 Mar 2021 22:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMn3VUBk4B4lJfTRC8LRx2nXCvK5xkillR4G5BfUTX710Dcs3spJniWHl8bjvc8Ozc8om7xY8vjmwq1I0wE0kH1iwM1P/rozauX5We9SHDfhOpnHizb/mLZCmBjp31cR1Hh4Y8KeYUkPJYLH48Hf7gHnuEVAZrT5d8N2ZHiTKUtaR0BOwklU16QeLNl/XJLX+dlDjFXHUz4ombNwrmh2NGu/1c2y8xKyznlWopx/sV5JztDicSYM9cc+j6YCFTQzGOoyfkzAK7q/l+OhZcFo6UvsDrvqAvLU1eaPSze0+7F0XOnDO+VdUu3uIpabvSbrLUK98sJXkXZE40gHvI3dog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ukJXfq2a6VQdE00YdgAIqNmhLcocMcEz1uqfCRjW0=;
 b=imYjZSaNiKUkDuKtiFlddejNVHiTudwBj75AvtZ/rmlEDRyfg3WUTJnWCizuKHxV0LgRgsjKEKcGcdiRFUK9ZZOGfGa+abiE0cyc4a5UXBk99cn2H9N+lANNqJAoGtf3nx2iLTlG0hBvWfGcXwH/X+MHIiEbQWbhl6s6jFRODR3cRAYDwg1bafiNXeHr7xnxCziwTd+fFKHAqMy7e+zbxB1F2ziFNEdg6I2dAGUVK96H9X9GC9BPL3jRKmAGe2Bidk1YPe0KZ1T9UEdvvIWkRGizrzH+HKakjUfOiyk9YTTpyltxguQG5DIhuomOZ3VPCGMFYcFc15XD1Xp1ILEjCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ukJXfq2a6VQdE00YdgAIqNmhLcocMcEz1uqfCRjW0=;
 b=hv8olSRsCv30ceK1wFEhlmtFkP/Dt2hPvC90xfsvikiRE8jdn9V/3ve/GhD6W6jgReykPENgDV9Xt4O8DTvyGF33Zeh9K7mEGmqVsVQFbZVWDqQBlDqzekMAfT8a2o0Qsl0fxP2l9GofO/BmErD/En51FM7kISYSlCmCwYYhRKBEAtfAJi+5ubm5+b4aAHaO4lgfG5gjmjnEvbZSpxOvshqIuaWnD6aOF47srsJZFdhndXFNta6sH74QHPK2okwA4TMpoffg/OrxYdhfhNTRKAZLCZv9m/szO1Wl810nwGFpA+ioQe/eZyBZ1NbnRCR6X703axR1RTJGiNnW85SW5w==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1754.namprd12.prod.outlook.com (2603:10b6:3:10f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 22:24:42 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 22:24:42 +0000
Date: Tue, 30 Mar 2021 19:24:40 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Message-ID: <20210330222440.GC2356281@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-4-apopple@nvidia.com>
 <20210330184903.GZ2356281@nvidia.com>
 <12442194.rtmf8Ope3M@nvdebian>
Content-Disposition: inline
In-Reply-To: <12442194.rtmf8Ope3M@nvdebian>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BL1PR13CA0413.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL1PR13CA0413.namprd13.prod.outlook.com (2603:10b6:208:2c2::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Tue, 30 Mar 2021 22:24:42 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRMmu-0066QV-Rf; Tue, 30 Mar 2021 19:24:40 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2b1a49e-95aa-4fbd-8134-08d8f3ca9d80
X-MS-TrafficTypeDiagnostic: DM5PR12MB1754:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB17543B4EE56A089205BCBA93C27D9@DM5PR12MB1754.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I6nNehQMKpEpR3jHWxwH+b2aWivTRHhOEGcB5lnTB3HHIGErY4xSy5yy5FcZ7Oh7ui3zEf6r3X0dm0yXAqsKH5zZQVuz8A17xKsvSFWc3Nw/OeyR0YBJLw6aQmogSISnX1yAMQVMWs9zS5W9qrpPHIzZy7NwPRU2lcI8xLlfeiYLhE75oEEXK50Kggs0gXhunXaS5nGvo0Ke1nyg/93zTaNIi4TwV+sUcDcFEF42B4p/MUyvmoRvUp/lYkwia9GESvkcGLfDw9Y9R8DrVRlTDkB9/g/8sIlygbpn2AI/JWla4S1+MhUDzu7kmnnhnN5VKhbXwcKJupWWOYGqsUwi9m5DxNKlon6ktSaeOK+ZpDrjC3gwrEJksqH+DSUM9qd4HRV9ZUn3OGKl8prWbR6GABzfozeA8LE4AwTtigXuUrWKBEqdCpA0p08HIxSa+ysOfSeh476jgC/f3KGuaraDlzTGSOQKmjUx4SEC6Bf+oD4PC+mofpG1aUnhaeyaO+R1z1REhXBQpTvCLpQuAnKPbzVBOfXqRFjF3nPztTQBU4WGUhjLQPAWNbasCfOWVnse4qrYdTgpBnZIWJ+jtZNYGT2TgTQPEepgJHUBTt1Bbn60xjB697Cd1OBa0eY9BgQDE13Z2/7Fbxbiw5L3JB+HRs6i2Ql+4eq8DXV+zQq6r3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(6636002)(6862004)(478600001)(66476007)(7416002)(1076003)(37006003)(38100700001)(2906002)(86362001)(316002)(9746002)(8676002)(4326008)(9786002)(66946007)(8936002)(186003)(33656002)(83380400001)(426003)(26005)(36756003)(66556008)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fVV59dARpSdv2KxCT3izOPfwZRgAEWGURqY+te/YBVuRMmt1efCxeEnbyMD/?=
 =?us-ascii?Q?aw4SmbiEL1w+qnhPB6So/Jwa8ymMxlRYIH/4+/hSKi1hXQCZgp0jeI20QUSv?=
 =?us-ascii?Q?Jzcyi/1xsb5iS5t+YEZlso12CGO9vVVW7Xefl66E2LoIi38vh/nQr0yPoGwI?=
 =?us-ascii?Q?L8M5j4gPDPooa9RVV8u/Suara5ChyTZHRjBQodRAWK0ruSP1PRcu8b6NwiGH?=
 =?us-ascii?Q?YTgaZzjF18SenIYavDOHKFNP5Cd0jf4YRTgScnGbuZDzDWA7NfmXimjGWXJg?=
 =?us-ascii?Q?F/PtSnQ8d1znZdGSQXB1B/xIAqrFRZaX9gDWukMRUCJ5Y25Dp7mCOnKCPyM4?=
 =?us-ascii?Q?407F/NqugA6weFlixAU5TYj75J1QXX6ZWF4urzYjvNdYPfzWuskuVpuSYzFB?=
 =?us-ascii?Q?5tBI97k5z2jNQxd+DxFZaA8frEbLYXQqTBF53iutLDfGfTRvLd4cfUq46WiY?=
 =?us-ascii?Q?jEezvCMow6Un6z8OidDAijZEbqJyZRAiiBNlS09HMhN96dqOh97ecVtKnfpq?=
 =?us-ascii?Q?gpjJldEnfJN8rQLfdhyCwYO3Sc5CyS0DaeRWkHWHzbvHOs4bd/ZqC/Mm/+Uf?=
 =?us-ascii?Q?cMO+58xKHBbTls0aN/k0iiUrN0V5DDxwjVIXt2OSt1+/2Ff3ujZjqGeV1csO?=
 =?us-ascii?Q?hnDLrNjU64we0RgAond85feWbsakufarHqwnEHFi6HNTjOWJgghHuid7fUEG?=
 =?us-ascii?Q?iCKrUFwjeAcV0OGoq2eZojyJTprbrK1VT06U6kpkGLzmHRzURuJEBrSw+K2M?=
 =?us-ascii?Q?a0pCDzkaIpmKnkCu5PvVlkxWrlPKgUyCMvwT0+dAyCFsQfLtKAcyut5kmkD+?=
 =?us-ascii?Q?+docQp5qhnA5tfpB6dHRclDgCJHVjXVN9jOADZbrKfanA14/yt9HSx63+oux?=
 =?us-ascii?Q?Z7i+MYsAgl/Na9A1SCncTV+Uv6FDeFYjs2/nDZeg+2MLjlmtbKoXS8CviTdo?=
 =?us-ascii?Q?J0pB15lct1eEI+uaMpD9flnCwvH8IgLbK0ecuO37Wvtgu7WATNSK+0EcbUtR?=
 =?us-ascii?Q?57XOa35uihJUNcPo0nICm1QCF9O1+7g7UoDcjdwLIshHK5V/agc2FTMUcjCD?=
 =?us-ascii?Q?As5JsCsGKTCyEUkwzgHHBgDgqFQ+j2Y7qM7v6BYNVXdkT6zwnBnoFlSdyAJG?=
 =?us-ascii?Q?AHYXCgJpQU+e1Fu5qyM+c6WhqttjisrzW/bRqOQ/QBpYvLTK2nk1z7cCq/rQ?=
 =?us-ascii?Q?KJpdMVzW/GpJcFqmDrtBW1UU7N6Gawta341Q7qpBQ590oVRP1vFsWKWse/8N?=
 =?us-ascii?Q?Je82TJyO0PamJZ7BbLinL9uBf76AJccfLWvBpNH9gmcSobqo7lVTrbAR4sVr?=
 =?us-ascii?Q?NsqFD+ow47xq7YX7BBCvtUm5aUuJyXN/5PHSew2DoGvZ9g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b1a49e-95aa-4fbd-8134-08d8f3ca9d80
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 22:24:42.6591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSGcLMR/MmgSJsDLj2FHsePQyW4mfJUtLDSpS9XZjwyDvZZHFJRzHfWMGzZlIJir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1754
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 09:09:30AM +1100, Alistair Popple wrote:

> > > @@ -1796,8 +1821,7 @@ bool try_to_unmap(struct page *page, enum ttu_flags 
> flags)
> > >  void try_to_munlock(struct page *page)
> > >  {
> > 
> > But this is also called try_to_munlock ??
> 
> As far as I can tell this has always been called try_to_munlock() even though 
> it appears to do the opposite.

Maybe we should change it then?

> > /**
> >  * try_to_munlock - try to munlock a page
> >  * @page: the page to be munlocked
> >  *
> >  * Called from munlock code.  Checks all of the VMAs mapping the page
> >  * to make sure nobody else has this page mlocked. The page will be
> >  * returned with PG_mlocked cleared if no other vmas have it mlocked.
> >  */
> 
> In other words it sets PG_mlocked if one or more vmas has it mlocked. So
> try_to_mlock() might be a better name, except that seems to have the potential 
> for confusion as well because it's only called from the munlock code path and 
> never for mlock.

That explanation makes more sense.. This function looks like it is
'set PG_mlocked of the page if any vm->flags has VM_LOCKED'

Maybe call it check_vm_locked or something then and reword the above
comment?

(and why is it OK to read vm->flags for this without any locking?)

> > Something needs attention here..
> 
> I think the code is correct, but perhaps the naming could be better. Would be 
> interested hearing any thoughts on renaming try_to_munlock() to try_to_mlock() 
> as the current name appears based on the context it is called from (munlock) 
> rather than what it does (mlock).

The point of this patch is to make it clearer, after all, so I'd
change something and maybe slightly clarify the comment.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
