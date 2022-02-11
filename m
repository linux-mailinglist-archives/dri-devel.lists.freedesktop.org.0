Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EC44B2B38
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 18:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A295F10E3DD;
	Fri, 11 Feb 2022 17:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E093A10E3DD;
 Fri, 11 Feb 2022 17:05:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+xoY9RGK9N4UAn+oe2OTB7XNgE0OW+2eoWLbNOezg+eq8p2WPKiJs0BK7aQ0lU7DP9JojuQTHRA2oiJ17Yl0al0PruDI6GmHGKJqyaWbGTv57OA+t+jaoAnYMBR/ukOG2w1bKIS8sGycst6+NLtT2MRebSHlkIa1NQJ4ke5ya5cnTq7Mn4m7IbjKiqLE7DbDr/W8C1ZTKsM5WHYY5jGg5qaQZztCTlwQVNuC4JcYur5ZdmwDrA5rRAY6rXgTgZtY0/trENhVNVjUa1ci1QESLnRPHljwygUwhez4TbmYl+0bGz8koDpbVfezIBLq7EWWpWy0drWi0amJUcQDLngnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBktjK1nZQ4wJaNwkXaXP149Eo3dAwN754shguUapS4=;
 b=HJSEgCWkjcpmoq8GGbCtDaHI7bXInsWg09v3W0ABQSS9f+QDdhSsJ9rjtKiWH89B0wEO+JBu3+ym0IpTLtK4ETHnsWL0OAiMt/AiQb4JWeJ9ouy1rtO2DkqX7LWPmS1mr950ovFSqEaU5uWBpr95Y858nsoHowsqw+mm53tJd4Azk4pDHDhn+1jXEojCN//TVyipuiXIFr6zWyMDL46Fh1hJrfd1L14wvszOjkPrkjNhaJkZeJM/uTwFnicQ9WJTg0MtkYqpYn2bodGeF2VTe6Tc2ElSRJryNh26d5FConzziDSs+sw7pt9CT0RA4aeNKsR+bUJxvYiUVex76hntLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBktjK1nZQ4wJaNwkXaXP149Eo3dAwN754shguUapS4=;
 b=SsNsOHzlIBASsLjykbGrI0i4Nk8ASfn69qxPngBvDuhYCTaaF7XJMqTdpzTmkgEUBJbeoavHy6zaLf2irps1x7md6+W+P/lG3cukFyzgPttf+HgnzKMS6R1lovtAy0227zjyv+qDR8mvqpdcmYnWKdd62j17RnZUbsV8p1NOQ9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM5PR12MB1369.namprd12.prod.outlook.com (2603:10b6:3:6f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 17:05:04 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 17:05:03 +0000
Message-ID: <3acdebb4-310e-1edb-d7b0-a79db348f6f2@amd.com>
Date: Fri, 11 Feb 2022 12:05:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Alex Sierra <alex.sierra@amd.com>,
 akpm@linux-foundation.org, linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e9714b5-3732-4da1-9308-08d9ed80a55d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1369:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB136962B5C80BB37F5171D4F392309@DM5PR12MB1369.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euHVKqmpxJxYheCQv9ldlO9zPRgUG/+xZFmKqZxqk6/lXrKBcsworCSGAXmXzXxHtjzlXgK5Fbdc/gU5S43yl+83f9lAeXWqdHIKH7Rm0OZ7zLNFUwI+G8ojIMZs58RGqoNWulMiqNasmvtS46uUvGwD6STbQk21MnO8Cydo8DnZnetNDUVKH9B9EWomlRSistHeN4APE6eU77XLfZvrWRsd2uYfigy/fpSAuwgWD9GDdqLRRwvYslYH1E2+cmf0nJPinXbO0WwMcqRn+H9yogpO38x09A5JwBkIA+Q9pL9VplJiU0vi/V+GV4+rfBdvuOb5NH1PBAEluoi8hBhr/k3MxFqMkcboxVHZgfWwvwBrGLT4+oGzLzs0huUOv6VP4o3hLjANHbGH5bSq4VtpvwT6Kh1rzfariMGiLVWbiQPnrTq+OBZS8xpw4yi5+hVCfjIOs8TXfncduJWu62SABEwImpgL1Y14x/oBBk4V4+NaRlC7cO3dgwuziXf14nfoRVY6e+SmKk7HPRbpHEnEH1i+tMzSCtufmUr3nhDIKqMdtAVS/A1H/oHwm2aUYAnVR22Cu6FDeH5GhgaIqdhnbCgFnZgLsFfF7Sgqv8nUliKx/dokfr6aO07YhZ+fgWWmtZqmX6S1yMyrWuCx862a1zlYmlCVdXkeRDtDdEOz2N8y9bL/A5kIMuRkJH0HeKRRR9qpdIjBSiftkuzvjaE3t6Nxrx+qpMLkHiMQsQiLng3RZO4QKjKAfBnJiluipSyH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(83380400001)(31686004)(36756003)(186003)(2906002)(26005)(2616005)(44832011)(5660300002)(31696002)(7416002)(86362001)(508600001)(6506007)(53546011)(6486002)(66946007)(6512007)(316002)(110136005)(66476007)(66556008)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBQTVN4aHFpTmcxczY1N3A2STAzU1RpL1p6UnJFK21hQmdtd0szNm1lcVpB?=
 =?utf-8?B?N0dmc0hxQTNEdUV0WGw1NGY3dlZxekc4dFMwZGpReEtzd3NETlMyUmZaVUhW?=
 =?utf-8?B?MFFzOWJWWThWL2drUVlQNTE3UDVVVDF0US9UUDR2YzFseERJOGdSeDAxY1dJ?=
 =?utf-8?B?bEx2clNucnpDcG4zbmZ3UURYbUVSMElwMVk4L0J2ZFZwWlVYZ2g3Y0FEdlMw?=
 =?utf-8?B?a0c5alBTdzNnVGhZSHdFWSs1RWhoaHlPR09JL0VlNTdSVmErTTNaTlNVV1Rm?=
 =?utf-8?B?bTBIaWFTVFZmalBidjJkV3VPTi93c21uby9LNUZoQzBrMXZabmJEb0EwZ3VO?=
 =?utf-8?B?d1B2Q2R6NHY4S25ZNDdHMnhEM1RmNk15L0QxVlgyTXM2RmJGZ3hHcitkSU95?=
 =?utf-8?B?RWtYaVBnRFE0RzlONVRpeURzWWM4RDlvNGJhVFV2TU9ncmF0OC9KUGxoQ3FY?=
 =?utf-8?B?dEtqQ2tYQ08vZW5uZXpEbjY1N3UzcFk0ZXhGQjEzT0cxZEx5OFZPZUdWcDBF?=
 =?utf-8?B?RUo4UkxNMVFBbVNZblZaRlVDbXRGbmVlRWV5cG8rMlkzaHBCckFEMWVMT3Rj?=
 =?utf-8?B?eHJldVlxSEU2eHRHdWlrQ2Q4Z0htdzVSSEEvWWk5aEhxdFlkb1ZvZWl3SWhE?=
 =?utf-8?B?UVczNVNsb2p3a01MZlFwaXNXbzVIOHpzKzZQd0VMaU5CM2l2Q3NEd29Ud3VP?=
 =?utf-8?B?WFZSY0lxZmg0Z3duQnZEY014N09UNVhuZ2NNZnRZUTByRU1LVVE1MUE3U0Rs?=
 =?utf-8?B?L1Z5MFdaWnpvY2taK1pZU3F2TU04d3dKU2M4czd4ZTc0QThST0x5WmZ6cmZp?=
 =?utf-8?B?ZUNLTjh4Y205TndwVk11NW1Qb0xpTzluNlYyTWk3NHNmNS9MZG80bWlhYWpP?=
 =?utf-8?B?Q3RSVEs2RFEvWE55TXRUWU9XZ1Z6aU80dkdpNThTVGs1eGJPQXIwcHBNeGlP?=
 =?utf-8?B?SGNFV0NSVklYWWVqTXl2NkkwQktJd0FxdUY0cEw4bTc3OGJ0RXZmRjdNd2di?=
 =?utf-8?B?WHVxd3RxQ0w5dVZCOUZ1N0orTjIvcHpLeUdnR1RrNW5ZWUNybkgrZWgvUGFn?=
 =?utf-8?B?RXNOVGYwOGNZcmx1aWJPUnNNY3JTbVE0d3dwT2Q5SFJjL1ZKV21ZOFdOZExK?=
 =?utf-8?B?Qm8wWG5rTWs2cXFpTVd0c051bVgrSkZBYjhyZjNkVzkvSEl3dnEzRGhPRFY4?=
 =?utf-8?B?UVNCKys4UmMwWk1HS0RPY2ZHcG8xMlIrSGE1d0FJMVVOVXNEWkFvL1FZU1Fr?=
 =?utf-8?B?bVRqbUdMcERyU3hYYUlkT0hsUmhYUG4zZFZIWkJ5VTRpdzAyTGw5c0RaeVB5?=
 =?utf-8?B?U2hzdmxocU5pQSswMExKM3NBc1JJZkNGeXBGa2NaTlVOQU84bEJuU04xNGhr?=
 =?utf-8?B?OXN1Uks0NDJEdnc1R1VJbVl4eFlySkhIV3d1c2RRUS9MNkthd1g3QXFPZWVT?=
 =?utf-8?B?dHpMYzY3M3ZUaDl2VjFSZlV6MFNSN0ozZFVHa1ZwS0FhTmlNcWtFczZWZmk5?=
 =?utf-8?B?dWJ2QnV2MVQyOENZUGN2T0V5amNyVWpkUlcyUXB0ZE8xZUhSOGFudU9qMFIv?=
 =?utf-8?B?b2o3ZmZRUXcrdHByWDNCMmthNEE4REFuVjFzb1VuamNuUGtCZ2dyMlU0cG91?=
 =?utf-8?B?UXNkaHVGRFVmWnowanBJYUlQdU10azRyYVZBZDJEeWZTUGphaGl0MXV1VlRT?=
 =?utf-8?B?U0lvQjRvKzNpN3hKNGFObVBCMXFVNkl3L0pqZ1hyTENET0Vyd1kzSWJCcDZJ?=
 =?utf-8?B?ZmJQZXV2Z1NZcWhkOXJ5ZVl0MHBOS2UvaDRva0RTT1R2dkg1S0xjTmZvWVpM?=
 =?utf-8?B?UnpkQTdLaUxtTHA2akVBZlZNSElOekJ0Z1dldkxMMTMyWnIyczN0anpEN1g0?=
 =?utf-8?B?NktIV2VsODdXU0tXOWhnUHlEeVFhRFd4MSsyYnNNZGZNb05PYmR2czJtM1dW?=
 =?utf-8?B?SFJBcHJ3VjFkWWt3T2RtS0NPeEpOVjdJdSs3YnMxRElhNVRib2p0V29mRmJH?=
 =?utf-8?B?V1FJemNjWEIrYlBoVm4rcnBPUks0a21vM1hVKzhIdGRpc3E3OGd6bHFuT3RP?=
 =?utf-8?B?YkRYcmFTRm93c0JrT1RmQjBrek8ydDk1ckpYZDdFOS9nR1NJSkNvM3l3VU9F?=
 =?utf-8?B?bkc0MXZNT3U1Y082b3JGS1F0UlN3cUN3eWYvZTdUM3A2bHdGcXNSWHpobU14?=
 =?utf-8?Q?ntKxZf5q7Nu48FR+HzGjad8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9714b5-3732-4da1-9308-08d9ed80a55d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 17:05:03.7167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /M4CB/3Y25Yx86cHxacTw0yv2+BCVgoVWoHHEq6cAvQPhOwVjt8b399y1CisI2yWGiJVM3/8nQvOIW/cxQYFBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1369
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
Cc: willy@infradead.org, apopple@nvidia.com, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-11 um 11:15 schrieb David Hildenbrand:
> On 01.02.22 16:48, Alex Sierra wrote:
>> Device memory that is cache coherent from device and CPU point of view.
>> This is used on platforms that have an advanced system bus (like CAPI
>> or CXL). Any page of a process can be migrated to such memory. However,
>> no one should be allowed to pin such memory so that it can always be
>> evicted.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> So, I'm currently messing with PageAnon() pages and CoW semantics ...
> all these PageAnon() ZONE_DEVICE variants don't necessarily make my life
> easier but I'm not sure yet if they make my life harder. I hope you can
> help me understand some of that stuff.
>
> 1) What are expected CoW semantics for DEVICE_COHERENT?
>
> I assume we'll share them just like other PageAnon() pages during fork()
> readable, and the first sharer writing to them receives an "ordinary"
> !ZONE_DEVICE copy.

Yes.


>
> So this would be just like DEVICE_EXCLUSIVE CoW handling I assume, just
> that we don't have to go through the loop of restoring a device
> exclusive entry?

I'm not sure how DEVICE_EXCLUSIVE pages are handled under CoW. As I 
understand it, they're not really in a special memory zone like 
DEVICE_COHERENT. Just a special way of mapping an ordinary page in order 
to allow device-exclusive access for some time. I suspect there may even 
be a possibility that a page can be both DEVICE_EXCLUSIVE and 
DEVICE_COHERENT.

That said, your statement sounds correct. There is no requirement to do 
anything with the new "ordinary" page after copying. What actually 
happens to DEVICE_COHERENT pages on CoW is a bit convoluted:

When the page is marked as CoW, it is marked R/O in the CPU page table. 
This causes an MMU notifier that invalidates the device PTE. The next 
device access in the parent process causes a page fault. If that's a 
write fault (usually is in our current driver), it will trigger CoW, 
which means the parent process now gets a new system memory copy of the 
page, while the child process keeps the DEVICE_COHERENT page. The driver 
could decide to migrate the page back to a new DEVICE_COHERENT allocation.

In practice that means, "fork" basically causes all DEVICE_COHERENT 
memory in the parent process to be migrated to ordinary system memory, 
which is quite disruptive. What we have today results in correct 
behaviour, but the performance is far from ideal.

We could probably mitigate it by making the driver better at mapping 
pages R/O in the device on read faults, at the potential cost of having 
to handle a second (write) fault later.


>
> 2) How are these pages freed to clear/invalidate PageAnon() ?
>
> I assume for PageAnon() ZONE_DEVICE pages we'll always for via
> free_devmap_managed_page(), correct?

Yes. The driver depends on the the page->pgmap->ops->page_free callback 
to free the device memory allocation backing the page.


>
>
> 3) FOLL_PIN
>
> While you write "no one should be allowed to pin such memory", patch #2
> only blocks FOLL_LONGTERM. So I assume we allow ordinary FOLL_PIN and
> you might want to be a bit more precise?

I agree. I think the paragraph was written before we fully fleshed out 
the interaction with GUP, and the forgotten.


>
>
> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages,

Right. Trying to GUP a DEVICE_PRIVATE page causes a page fault that 
migrates the page back to normal system memory (using the 
page->pgmap->ops->migrate_to_ram callback). Then you pin the system 
memory page.


>   but can we
> FILL_PIN DEVICE_EXCLUSIVE pages? I strongly assume so?

I assume you mean DEVICE_COHERENT, not DEVICE_EXCLUSIVE? In that case 
the answer is "Yes".

Regards,
   Felix


>
>
> Thanks for any information.
>
