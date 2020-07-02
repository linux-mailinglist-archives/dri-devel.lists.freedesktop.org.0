Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9362126EF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 16:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4150F6E98F;
	Thu,  2 Jul 2020 14:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233E96E98F
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 14:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPOQiqgEp49UsvdD+yG9EVLK/vsyu5UDcnJahQcr6l+ZMhnIhPZdXj6tMULhIDDt1j8GETsv4Nt8qHTggWtU32dFHD+u8MB8Fl8GceFrA5SLz3F7XjKwod15IcODv7BrD+MooWfhL++26xM9egq4fX+0knXMtEn2/Z6ama48vorO8TEAeAblbGk2L5MXBu3HxY4dl9BHMFLbxjCyrax+omxKstHGZCoBPz+lpX2P/ULzB6rsOKm4FWwrLKpsvRkaKgMdUBN90lu4zbF6sEug3r9wI1Pfq19SIl1SnI2Qw5a/rc1o4NzQdi+TjH0v2dxuOSWvlGV9oU6ixbWbP1S2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ulo8TpSSL6PBxWDYbp/YzNX0JkLUXKJtQAwfZEPQOms=;
 b=e4/hrwM0VDlnVqG8ZAMr6eU6RPlK2ByLKWFur4ys/IyJFZ/zJTYWFJsXRVa3dM5AlhX+PaVy6uJiWaeDA4U9MyccHb5K86JuwJ4chzB/OXJmiN/A6M2W5/6oxTHGAPj4NHm4DY68MtpfbilBRgPNmvBxvuFzfh3uOn9p55q/ESSu8Dhi35i6hX96EJsiNugm/D1dynWkmVFn+qf3nVAt0pmFAog0v+w9WbpCP5SlbB7rd0Ipy2JIqmVx3bi2cBQInAlJb9W+/dXMIXd4WKKM29gJd7P00qDFwOmaNYb/5fLDkqCCsCoRgR7Tu1FK3N8yMy0Zti7fVx4PL0OuHaIbmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ulo8TpSSL6PBxWDYbp/YzNX0JkLUXKJtQAwfZEPQOms=;
 b=YxDY3iUztn6x/EIgcFugKBDn2V2Dc7XmsvLGyDCRueOkqosvYyut8V94LpaMww9jw+mzhw7pKWd4qf6Zw0z87s+4mVAasT3+CO+yLA3QcLnFya6+NB8lJH3DDhBG0Nd5+pVTLmLXqxOmQtGwZs0jPAsTwsydUeF/b15w/rJVZgs=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3679.namprd12.prod.outlook.com (2603:10b6:208:159::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Thu, 2 Jul
 2020 14:50:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3153.021; Thu, 2 Jul 2020
 14:50:37 +0000
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel@ffwll.ch>
References: <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
 <20200701123904.GM25301@ziepe.ca>
 <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
 <CAKMK7uFf3_a+BN8CM7G8mNQPNtVBorouB+R5kxbbmFSB9XbeSg@mail.gmail.com>
 <20200701171524.GN25301@ziepe.ca>
 <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
Date: Thu, 2 Jul 2020 16:50:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200702132953.GS25301@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend
 Transport; Thu, 2 Jul 2020 14:50:36 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5be133e5-d1a4-4333-f91b-08d81e97485c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3679:
X-Microsoft-Antispam-PRVS: <MN2PR12MB367945F15E7553951A259889836D0@MN2PR12MB3679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p90dc8uvBXdJR/ynxyfqohw3JdDGNTKH7Rs3ScYWRsVpIlxPRi9PPmogDuu5EbyBrx3p0zGnP4S6parq24VJ7QubvDtuunOMd+XuQ4JC3P+lxqDgRuA4rvbq+elZUOGg37sPJIEsZWXANs+HviuvGT/7qHRle9s+oGcO+zjZHNt0xgZ722jcyKgFuISKvQLmckny1+WEMcmxO0FlDkBtNpZy9MMIly8iU04j6fPAFm6OTv//bt3SIwvFrzBFFObO5ml5yq5IRQq9G+CsG1Fyi5poV1MFPWKf/FWnvWadm8e7EwmF9XONe+gL3sctrnwej52zTIpQfvoOiPYBswg2FUMOtPDaQ+Hxd1TngHgZDjIW5Gj5GDL9w80WtJbmiSPZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39850400004)(396003)(346002)(136003)(366004)(83380400001)(6486002)(31686004)(186003)(4326008)(16526019)(52116002)(2906002)(110136005)(316002)(54906003)(8936002)(86362001)(8676002)(36756003)(478600001)(66946007)(66476007)(66556008)(31696002)(2616005)(5660300002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: wkPSXFq/9fXqSo4HoBJJyuUtid3PBFR+2oLVe5mCM5LIzaReEZW6sBo3aWoCWX1wfJxaHxGXpa9/iDY0F+kW/zuFWxbvjFJh83TsrWkNmbf7hDzJQpSYVnD8xXjPvGZIzxasDX1cw73Qa9TS1d85TA0ILl5A3V521ircTD6h9LuWakxMQM9WfwRLj/b4YoTD4wQA+KMfLN3i6MeEDQOc1KBf+57fkVjEnXyEsDR+y/YGu7G95JEfUKN/Ojvo6Q6VYMOm0f8zRMpLOezFRy+E0SInIACEXov3gqs7O0KFKbVCZl7nuQxTRDLDLedhYgKAYQ+7UadQkipJkD7P6MYuhSflz2zr6EStTB+R9qNeh05XhcaI/1zcmZwNT54ICsGBFCycdEU7pxA9sc1PjLvTCb0Z+9vCie5M8DvNg90kazzcARked3X0MLaNOmCprfJ/WWSDn1inIdkuxLHWbeiqjZOT6aYuzw5BoiWwB88BK9o9XeTrbX2ad5F9OEhy2HHPZ94c5AGgX6k+TUZcmRdnEieWh/wVDvRdhnv05ax9CxeV1qjChav2BvzanHuT9S80
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be133e5-d1a4-4333-f91b-08d81e97485c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 14:50:37.7102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tGo4WhbkwlxqLUhl7D6nfU3CmO/zeZVx5VNv2QabpzG+OYAaVawV0CFZ9NJkZS7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3679
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.07.20 um 15:29 schrieb Jason Gunthorpe:
> On Thu, Jul 02, 2020 at 03:10:00PM +0200, Daniel Vetter wrote:
>> On Wed, Jul 01, 2020 at 02:15:24PM -0300, Jason Gunthorpe wrote:
>>> On Wed, Jul 01, 2020 at 05:42:21PM +0200, Daniel Vetter wrote:
>>>>>>> All you need is the ability to stop wait for ongoing accesses to end and
>>>>>>> make sure that new ones grab a new mapping.
>>>>>> Swap and flush isn't a general HW ability either..
>>>>>>
>>>>>> I'm unclear how this could be useful, it is guarenteed to corrupt
>>>>>> in-progress writes?
>>>>>>
>>>>>> Did you mean pause, swap and resume? That's ODP.
>>>>> Yes, something like this. And good to know, never heard of ODP.
>>>> Hm I thought ODP was full hw page faults at an individual page
>>>> level,
>>> Yes
>>>
>>>> and this stop&resume is for the entire nic. Under the hood both apply
>>>> back-pressure on the network if a transmission can't be received,
>>>> but
>>> NIC's don't do stop and resume, blocking the Rx pipe is very
>>> problematic and performance destroying.
>>>
>>> The strategy for something like ODP is more complex, and so far no NIC
>>> has deployed it at any granularity larger than per-page.
>>>
>>>> So since Jason really doesn't like dma_fence much I think for rdma
>>>> synchronous it is. And it shouldn't really matter, since waiting for a
>>>> small transaction to complete at rdma wire speed isn't really that
>>>> long an operation.
>>> Even if DMA fence were to somehow be involved, how would it look?
>> Well above you're saying it would be performance destroying, but let's
>> pretend that's not a problem :-) Also, I have no clue about rdma, so this
>> is really just the flow we have on the gpu side.
> I see, no, this is not workable, the command flow in RDMA is not at
> all like GPU - what you are a proposing is a global 'stop the whole
> chip' Tx and Rx flows for an undetermined time. Not feasible
>
> What we can do is use ODP techniques and pause only the MR attached to
> the DMA buf with the process you outline below. This is not so hard to
> implement.

Well it boils down to only two requirements:

1. You can stop accessing the memory or addresses exported by the DMA-buf.

2. Before the next access you need to acquire a new mapping.

How you do this is perfectly up to you. E.g. you can stop everything, 
just prevent access to this DMA-buf, or just pause the users of this 
DMA-buf....

>
>> 3. rdma driver worker gets busy to restart rx:
>> 	1. lock all dma-buf that are currently in use (dma_resv_lock).
>> 	thanks to ww_mutex deadlock avoidance this is possible
> Why all? Why not just lock the one that was invalidated to restore the
> mappings? That is some artifact of the GPU approach?

No, but you must make sure that mapping one doesn't invalidate others 
you need.

Otherwise you can end up in a nice live lock :)

> And why is this done with work queues and locking instead of a
> callback saying the buffer is valid again?

You can do this as well, but a work queue is usually easier to handle 
than a notification in an interrupt context of a foreign driver.

Regards,
Christian.

>
> Jason

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
