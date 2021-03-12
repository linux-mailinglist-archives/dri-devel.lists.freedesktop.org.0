Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885A93386D0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 08:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62F86F45F;
	Fri, 12 Mar 2021 07:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2B46F45C;
 Fri, 12 Mar 2021 07:51:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AM/2bkrhAoVTMYandbs0xTcimZ68hMzfieoJZaBmt9FWvCV2qstF7S5TT8mWEj9XS6JOXuzsD7UaVBw0rsQ/UywzYO7EwVQqJgKQ0WXyZbbKvAebPvoXdf3ApC0QGkTw834Gml5+xTG8XNeuujzcPMHVoikcRmppYVXFF6jBtwN8PE3HLSb5aEqp9N94FGaFyBHgOJBtazOhuWA6Du3OSe+lehIrt7J7C0F6YxZC33OM6kume0jHdNQZGskzwS41lFYlV/DU8NmcYFFavd0VidACC/CkyeFqmIHilJRdKdcpvFHcfBHwtdjhKQNTic+y8a3ZjXVzx56bOIEGtpaH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXp7AZWEQUtzSJVLhVzWpvY4BWD8w1//7TUA82TlbGs=;
 b=FQzLs+MljCVyaK7BJu05A6Wf8xxAwTq9ygppudqwxIqd9HQpmptZtHlmrodWZF6lE3gjMwAx4lZcMznq0f4M0BuziZC/1Hu0or4WhS29cVgXhJCIrVsFCb0Og3Tkq/sGLVx4BZtjdBzVh1G/2BypQ0qVTRs/hBPgUDY9hZAGH43iqk/4PH/PyitjOXyKkhnFBq+B9A28XAS/QZQZOTXXDGfNKxGDCDP42iLMotYueFAAcTYYk8jy5+ETYz7GIjpE1hK8fbH43+0VZRiwrjZF3Suz21B37P9QlHRF0VE8b/J58k1NFv14cp01k5J8H8Q6zNZe7gOy9D7MxCqJy0zgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXp7AZWEQUtzSJVLhVzWpvY4BWD8w1//7TUA82TlbGs=;
 b=ekg65ufNrRH4xF0sM8RhKmJMsSAP8M9lDjv6K5NYMnuraR4t9iSsyTeKKtZy/CNnvp2XIRSyQeMO8v+FFRmV8RFBWILdkmzuJx+15PXUAEXvZShvg3IKEdPMDkbmS0eqP79ba4hkmbtge/5hfTXgHONVfgepfdv4F5Ak8/1RqwI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3696.namprd12.prod.outlook.com (2603:10b6:208:169::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Fri, 12 Mar
 2021 07:51:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 07:51:52 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
 <YDyuYk8x5QeX83s6@phenom.ffwll.local>
 <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
 <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
 <CAKMK7uHOe=LacUkvGC75dyWAt9TRm7ce8vgxasXOXn-6wJTVnA@mail.gmail.com>
 <9d608c61-c64c-dcde-c719-59a970144404@shipmail.org>
 <YEoUZe8BtvQdv3TG@phenom.ffwll.local>
 <0e15ae7a-58d3-c75e-9a6c-e397e11750a7@shipmail.org>
 <CAKMK7uEzGKUc27xdWTv7KPESsyg1kCYCmVxP3b-HrzNCNO5x7g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c96145e3-1386-8a50-2ee6-6af61a60c861@amd.com>
Date: Fri, 12 Mar 2021 08:51:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAKMK7uEzGKUc27xdWTv7KPESsyg1kCYCmVxP3b-HrzNCNO5x7g@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:2108:8a72:3f15:1a1f]
X-ClientProxiedBy: AM0PR10CA0074.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:2108:8a72:3f15:1a1f]
 (2a02:908:1252:fb60:2108:8a72:3f15:1a1f) by
 AM0PR10CA0074.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 12 Mar 2021 07:51:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1077066c-90f1-4971-9421-08d8e52bb272
X-MS-TrafficTypeDiagnostic: MN2PR12MB3696:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3696267E09B8E21968563D4C836F9@MN2PR12MB3696.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QeGGClAt98m0nX3miHFf0GEWNZh8qYa/w/Mk8NOzI9jBjyS2BaXlO5dAKYMcDXfskHoKy0eftQ6+0xJARr62cb2Qa+ISUG/e7BuqrTSH4Ms/L/zeUrgNAk0HPX1fIShMvgDWlWF1RLsXIcRA6fJO5msSFszktKGB9UhC+LVjTgmOY4E0+RkSrx9KFnTs5HPca3fqjRECsV/HmyUfo/ZLyBqduik9tzy/9OEKgQ1Z2j+/akf6kqRy+xhLBCE/rzAQPJltJzb6j7bmIAiHzNUUFXke02aLV7FBv4Nvh8WRc2fSc+/DrJtOSszkk4Dh1jxDuZCPhlLvlxNAdzsGUAAq62o4aF2zttRRiUc3l1Nj39dke0woMsSVaXq3PQB2udaGintWS3iqG1DhVXGApyKSlSYidc4wH4ndWNL8gioYdiSV6Ws9IfrcGsDl5nT9aQ8NdvRuwi2H6jFsM+gUbMFmAUVJ5AkK2OuHqvN6JMkv95gGLfveY1rcrHcVPyqO4hdJSydMvnUmwE5avjAISdF87Lmgf6KC5ptwub3rr8pBn1BmBTc91gXzwGc6dlr+jLKXqPCRKE3lsr50yQzPhHiN/WBOoU4Lb9jdvx2aTce82Xs/NxM515l8UoUtNkWK1K8JX6OXn1IU+074Xz38+5uJsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(36756003)(2616005)(4326008)(2906002)(8936002)(83380400001)(8676002)(86362001)(31696002)(66476007)(54906003)(316002)(66556008)(110136005)(186003)(66946007)(16526019)(478600001)(31686004)(6486002)(7416002)(5660300002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dUZ2THdRdUErcndqNDdFeDRLci9jRTV0S3FNcS84bXl3UEtVRDduUXpPaXhB?=
 =?utf-8?B?blJ5YWF0ZzlEb0VwYkFrbURLUUpLU3JOWUxRZTgzVTFrL0U3UUZNYWZUMmh0?=
 =?utf-8?B?MVlOd2REbldaZ1R3VlpiSUlqZVcwdzZMMkNiTko0L3FDcmRMSkJDRUFyeDYw?=
 =?utf-8?B?NEFxTTFvRDJhRnpoREZWRzZHUHZ1VWNIQi92WExQZFhyVVljbG11MWd5VUIy?=
 =?utf-8?B?TE5RQ3haZlFZam80NkdRbnRDbXdNUEw2dGNPRncxaWhsSFFjT0NIazgrcDQ5?=
 =?utf-8?B?dGhobzlYWDRtbElEVGFWb0dQOFZUODlRZitGVzNWUTc4b0s1Mnd2WnA5Y281?=
 =?utf-8?B?WHlyQ2tNTnZ1WndFUUdHNDJQYXp6UUIxS0dhaloxMS9ZakF5OGxqZTRKa2FP?=
 =?utf-8?B?b0wwbHc3TGs2ZHEvZ1VvRU8vQWtjK3hNdVNBbEZxdnhwWmVtd0xSQTFmNURP?=
 =?utf-8?B?TWJqd3hOVjRCdWxBRzVCY0dkWTU4U295bHRKcUJQQWlLbk0zOXM1dkxrL0ZD?=
 =?utf-8?B?blVUV0FNUHU1WHdCV1hTRUw0ZTgvM3pvNmpvNS9uU1Y2TnpSVFdJNWhDYWJJ?=
 =?utf-8?B?MGtSN05XVkV1TDlNalU0VlExNXMwY08zSmdtMUFYaER6S0RFaUpWbWpPNXFr?=
 =?utf-8?B?SjRUS3E2dXBNNHIyc2ZITy80bTVXOVdSZkx6Sll1TmVkUzFWVEQ0bkpiYndI?=
 =?utf-8?B?b2o0NXMwN0dLV3pYck5nS1R5cTlXaVB1WHZPWXZ1SVo2Rm5FY1N6THYvWW1m?=
 =?utf-8?B?c0hWQmJrdytZQ1dnRDNlVGhUV0ZtS2tubTdPRnJGdzJadkRwaVc5bC9YKy9h?=
 =?utf-8?B?dzlQY1N5WjFEV2FocUVENmNIa3hCdVo4VWV3VEpTa0xpdG1MNEVvRXdHNHAx?=
 =?utf-8?B?V1g2OHRjTnM4QTM3WVdPMC9UeHpIMGVzSzY3TXFWeGRzL1puUCtrTmZEenJE?=
 =?utf-8?B?aGpCa2RUWXJvUjRCRVpGd1dXRWZqanlxcFdUdnRNNGpKdXI0NnpXemsybWxm?=
 =?utf-8?B?L2s2TTRvZnhRVk00NUlYWGZ5RytIMmxSNGEvcHdSOElhMVpsMWNQbnlpenpu?=
 =?utf-8?B?WEhpRVQxZFRzZ3BPb3czcEw2ZDhtbDBCVVFWV3F6VGdWS0JPWHp4VW1iYVFz?=
 =?utf-8?B?bDFFUW1LbGt1NzRpRi9UOTNLSnA0TFVJcEZnaXFGWW1jNktjT2x1LzlCRWtV?=
 =?utf-8?B?M0p4OFlaZm5HK2k0ZlpYYURGWFFubVA2dHYrWnVhK29pNXJyeHBZaTk5dFU4?=
 =?utf-8?B?MXVvZFBmYkJPK0p1MlB4NldHTkNkV2FzYlVJL1h2eXAycFdvNzRFSm8zektw?=
 =?utf-8?B?QTRzTE51d3k4dWM1RzdVaGhpY1JXSFBaSVBFNTQ0UU1RSDMrNDZhS1FVRHNP?=
 =?utf-8?B?U1dldTB3Zy9QWXZFdVpjY215bHNvakNvUFo1RkJRWnhZZEU3RmhnbGo3NGls?=
 =?utf-8?B?MXZ4WFBSL1RHOXd5WHJWT1grd2xOdnR1cHlGaFdmemh1Ujh4dlRlSS8vOFV3?=
 =?utf-8?B?UUxFMlBSVEtmNzFXK1IrRUtaNHc0V0hIVUFpK0x3dERWTk9hZTUvVG1mRTkv?=
 =?utf-8?B?TTNjMUNxK01SMVhkZVZ2NzVFcW9mT1JISEExN0xjMmI2SXNFMUR6alJrVExO?=
 =?utf-8?B?WkpDbVROK25hYmVISXhrM1Y3eFJuWGZDUXNOMHBuRGpCNnVxdC9rVGpqRHVU?=
 =?utf-8?B?Mkp6aUY1OHhwZ0NZNXdYRVR6K0hIY3hrSzJRVnpzYTUydjB1OWxFZFZNeXBo?=
 =?utf-8?B?amwySXVxYVpYSzlHVVRHaGtyN3FuWEMzTXlPd2RWelhWVDc4LzFFUmZVQWNv?=
 =?utf-8?B?MExZaUlZWnhmVXRZQUtjTndxbW5QYlpwVU5wanJiVGRHSGZHWnlLbHFObC83?=
 =?utf-8?Q?1SRhHdvw/hDaY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1077066c-90f1-4971-9421-08d8e52bb272
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 07:51:51.9659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y663TB2+qZiOkNKbbAYco9e72krETeqX0HwJbVMDi/m4/Yadu4yBSJo+kaESdvSW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3696
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 11.03.21 um 14:17 schrieb Daniel Vetter:
> [SNIP]
>>>> So I did the following quick experiment on vmwgfx, and it turns out that
>>>> with it,
>>>> fast gup never succeeds. Without the "| PFN_MAP", it typically succeeds
>>>>
>>>> I should probably craft an RFC formalizing this.
>>> Yeah I think that would be good. Maybe even more formalized if we also
>>> switch over to VM_PFNMAP, since afaiui these pte flags here only stop the
>>> fast gup path. And slow gup can still peak through VM_MIXEDMAP. Or
>>> something like that.
>>>
>>> Otoh your description of when it only sometimes succeeds would indicate my
>>> understanding of VM_PFNMAP vs VM_MIXEDMAP is wrong here.
>> My understanding from reading the vmf_insert_mixed() code is that iff
>> the arch has pte_special(), VM_MIXEDMAP should be harmless. But that's
>> not consistent with the vm_normal_page() doc. For architectures without
>> pte_special, VM_PFNMAP must be used, and then we must also block COW
>> mappings.
>>
>> If we can get someone can commit to verify that the potential PAT WC
>> performance issue is gone with PFNMAP, I can put together a series with
>> that included.
> Iirc when I checked there's not much archs without pte_special, so I
> guess that's why we luck out. Hopefully.

I still need to read up a bit on what you guys are discussing here, but 
it starts to make a picture. Especially my understanding of what 
VM_MIXEDMAP means seems to have been slightly of.

I would say just go ahead and provide patches to always use VM_PFNMAP in 
TTM and we can test it and see if there are still some issues.

>> As for existing userspace using COW TTM mappings, I once had a couple of
>> test cases to verify that it actually worked, in particular together
>> with huge PMDs and PUDs where breaking COW would imply splitting those,
>> but I can't think of anything else actually wanting to do that other
>> than by mistake.
> Yeah disallowing MAP_PRIVATE mappings would be another good thing to
> lock down. Really doesn't make much sense.

Completely agree. That sounds like something we should try to avoid.

Regards,
Christian.

> -Daniel
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
