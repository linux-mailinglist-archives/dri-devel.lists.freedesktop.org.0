Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668464B3F69
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 03:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619EF10E133;
	Mon, 14 Feb 2022 02:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EE410E133;
 Mon, 14 Feb 2022 02:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehh5SCQgZoplycuwfh/W7FhjipI6bThHiK40rERvhEI8wVVTsy+bDZ+tbRfCLBH5uyfwYmmr1SOv1Fb0maZidKVdAykmBdcB5otSg0fZnW4fAiP1hruLm1YH4C/A1G3OW2dDR3IkiW5aFNE3bofDUxQc2o1xMn33k7uPlmD5b2yPKwB2JhfXuwV4/QW15/tvS92Z2CTWaJyE3LP/RSkiR3bcNIZmPk6/XLK0v/1WQww5n8iUabcAvEm5wR6SONQdnKfbGPKCcfshQdD7qulIFrdV+NMHo1Qn5vBhV+97PPMY5EEU1sPwb28cy5adyoveYuPKMpQCuIzKi/NiLtPiGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mZKKKxR9CYxuyw5vY2DCV/ng3LXc6E8SH67yNsiSJ8=;
 b=Fa/MmCKCuiOoUcaLg3gf6j2pZnPM/9NRQHNfZm7a5G8MHDhDtATyf5daoH2khtADqB1yAV/nmyUwCbiFMf+l96Zp1AzEOUo7psQ4+BNDYp27T6wFfCT8oXH4Ze9UXg/3ysMloIoQkIvPwd9PHFapbemceM3J30NqRk+EDDmN36EupK00ItXAq8bpTLC9/Txhimcj4B5zm1u6iH8jJh91jIrGWdlYudA4fxskGEPtU5FvkJiXJ07evXgd+DydRoljPJIPnDE9luv7SqB5z+++7JCMa3mghZ17cVnmJ/qYOdoTUYS1UtuhOW3RPLX+9Dwi9mXFxSxsQS3OOKLQNP5R3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mZKKKxR9CYxuyw5vY2DCV/ng3LXc6E8SH67yNsiSJ8=;
 b=GkB0KiUuTFvchaB+NeokIyHvPAgOXgUVZrDOHPvIs83VMIvsLut//5PTtfX+awSx1NJhBHb/pVB4b2Rd4si6mfyC9P5ua0i1B/stMeJPd262EwxRHMo1yJSucb1LYeOZ8kt0zE7lzVYP3jsH0Oauso6uQO34OqFpvmBXjui6wNP7y5uw7uNP3wVg8DuUByVmx4qbwn/5xUCJNr79L3BDvkG1AknaOkF8ucFa+b+229/VCf9707FoAyX/Q2kUlq1t/YUWV77eRRkgHXvhHVwub9SphgUDIBigw/XFYrDD1X7wVQmJ/DtZvO8z3lF3GjsD6xKgT/XE9DV9q6We+WKgZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BYAPR12MB5704.namprd12.prod.outlook.com (2603:10b6:a03:9d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 02:27:14 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::1528:82a2:aa0:7aa6%6]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 02:27:14 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Date: Mon, 14 Feb 2022 13:04:35 +1100
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <3acdebb4-310e-1edb-d7b0-a79db348f6f2@amd.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <3acdebb4-310e-1edb-d7b0-a79db348f6f2@amd.com>
Message-ID: <875ypigp39.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: SY4P282CA0007.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:a0::17) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8c03473-421a-4f39-d062-08d9ef618301
X-MS-TrafficTypeDiagnostic: BYAPR12MB5704:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB570496DC1C30071CD769E263DF339@BYAPR12MB5704.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qyrUdsfwH72OPyQHxJ944xbRaVkQMOAXmrxUXjH7DS9hmb0NTChgSLzXoQ/mHfkmUrytY2dM+jZ09yyUaZwz4EIQW2WxdcX+RnVoGpB0qd7KA5sn4VQ63szWonLts4ize+JngtZzxEoY2SsBF/8pZDijGsoYBjBLI6j+1z6+PVdrSewZZC53asqCqBFRPCcR5BEL3IkmqLjvG4YnVOr8SDhesQdG1U4IVIvsFruO39acvbnAvGP66m045a+EFbS7Ykboqz7hcKh8sL3d3xY/dnh50r1f3B5cH8lx+tlf+E8T2dyspAEWNEjvdx705ejD1kzC9H2gp4Ra90smkU0TzuLeb4ic4r6b9JPE8JkR8VutzYhvMotWVyw8b/aorap5vxx2c6VKdbolTdZbo6VTecRdnvlftQDJH0kmKEJIvK0tt36UhJJvznScE7EbdLKIVet9kVRDHs4y4uXclJpMI8y76YvvHHKTIaaP96lxmYpeGoDsHdkW5wVPB+GrV1a2gLvoCWNe07oghHUkZ4eCBR/K0riVvyZgOQ7C52yKhIOsGdXKrJjRboi+NsS4E0bDdjwnCY1PYSFPrQ6+GPjeoshPGFvYqIdMPE2tAXI1ZgMUFQKStCvPt2zyU2t7pq4gfoEVU8XJkJqjEeXggcXMBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(9686003)(8936002)(8676002)(66946007)(6916009)(316002)(54906003)(7416002)(5660300002)(2906002)(66476007)(66556008)(86362001)(38100700002)(6486002)(83380400001)(508600001)(6506007)(6512007)(6666004)(33964004)(44144004)(53546011)(26005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFVMcWNSOU1YMzBFeXZLOTlxOWtQNjBiRE81d1pGMHlDSXhUbWtGZFVYN2NS?=
 =?utf-8?B?cnBuV3FXUTZhS3RlVy9FSGZxenJueDFkSG85YnFRSzlTaDZWK1ZQdEp4a05p?=
 =?utf-8?B?Uy8rblBKYW4vcllZZTBaSFplWHg2bGtZL0hwQWNLQmxXNnlnQ2lYMnRYNE1w?=
 =?utf-8?B?ejZua3Z1WDdCeE5GdmNqQ29PUVpEU2RYcWlhMzk5V0FOMmZEVTlrUE1aRDEv?=
 =?utf-8?B?YVpNaU9mRWhQYklVRDZWUmhKVmtQTHcvc1d5VmdabGoxV01YWlJqSi9Cbk1M?=
 =?utf-8?B?ZWh6MHgvMWNPa21OQzhMOWdhbTYxQmFXUkJzeGd5em04UFpsL0crbGlDbHhI?=
 =?utf-8?B?UndqOU11ZlArelN6OFpYTldNYTd6UjI5MWtVczJoYTVnMG5sZndJWkVzMm4r?=
 =?utf-8?B?SUw2K0pBRENwZUdEanpIOVd2emFUc1ZWTE4xcWlXUFlOdDZXTUxMZ1MvY0xJ?=
 =?utf-8?B?NFN0QnZrdjdJWnowZktqaVdDbFllY2JRdndzZTJlMFZnNkFFVzNGUG0rTGFn?=
 =?utf-8?B?K1pxbU9hVTFBUkRaMm5PcXZhNWIzTlJvd1Y1OHJMaU5McGYwSVk5bnY2SWxj?=
 =?utf-8?B?YUkwdmRUVGEwTTFveGRZMUtQbXZGWHJ6ek5YcTNTR0pOanJMcHRsV2RjQ1Rh?=
 =?utf-8?B?K01HQmZBNVNJejVvcExQRzVYcE5mcEZJQW1YTVBrdTlxd01GNytGTjJweElM?=
 =?utf-8?B?M05RcnNUUGNoNmhCc0paRS9JUTJzYytZMFBsY1VJbnRUakdHVW5Oem00K3NS?=
 =?utf-8?B?bWVkSEJEOGJuTENuWmNnaythTEIrcUwvZXM3OGtETVNSa0p5aG9ZWVlmQjBF?=
 =?utf-8?B?WnJQc3Y0SXdXQjFPaG0vcVRJMzh5NkJOQmlKY0lKNDFSSkg1UUZXbG95R1NM?=
 =?utf-8?B?RGsydzRVaVMwYXFWRjlqMWd2bHpDOUhTMnZhcUZ4NWlJTzhLQkJDdWo0ck9I?=
 =?utf-8?B?Q2svTERZRlk2TEV0dzNzbUlFYUJocUc5Rk4zay9KS0F6cW1TUVVCT0ovbk80?=
 =?utf-8?B?WWpESlhjTEFZQ3NvakdHN1hhMGc2TEg2RGFhZ0ZCMXd3SC9MM01HbUlEUWlp?=
 =?utf-8?B?TDJ2eXRRWWxzZTM5WkVoNWM2TjJiVXFRVFhKcnpzSVhlM0dmaFkvSHlqcDd0?=
 =?utf-8?B?aGRLZGFhbTJOZ2JyV0hZcngrWFJvWkxXTTZPRzUxV0g3MUtlOUFuSzVucERr?=
 =?utf-8?B?ZWY3bHdoTUZ3VytYVnVvTC8rbjd6RE5oZ29RUWNhcU50bCtXQXU5UTZCVWcw?=
 =?utf-8?B?V3d1UlBac016Z08xWjF6S091YXZEa2FHdWUwNlpldWxrd1lBbi8wUE1BcEd1?=
 =?utf-8?B?SWFnRGV6QSsvSUswVW1wMmY1VFdiRGVyMDB6WTE5WjhNQk5vU0ZXVC9BTzlN?=
 =?utf-8?B?dHFsYmlNSmlOU1pPK2RLdi9HRFJWaHhmMjk2cFlKSS9nc3EzcGZHbTNkemla?=
 =?utf-8?B?bXlvWDZnTzBZS3lHNjJqcHZCZUdTTVVScE1rWDQvVVEvT1k4RjQ1M3U0QW9T?=
 =?utf-8?B?Wk5TK1pLenZ1UXk4MmtUSE5zM0p0azA0V3lUNGRSa2ZWMVlpaFlvQVl0Nmxl?=
 =?utf-8?B?Wlc3aFArcUI3d0V2U3IxY2pxb3lCbFNpcXlvcVhZbUM3T0F3eGhXWGlrWDRF?=
 =?utf-8?B?V3diU3lsaFkwdjgxeEFCZlIrSGlCMjlRN2RYSDl2SXRXVkIxbjVybVRUTkRT?=
 =?utf-8?B?Nm5qUzZMallTaThtYXhNZU5kOE1jajlZV2tWNFc4bEJkWFVKSDNac3d5aHRq?=
 =?utf-8?B?TzVnTFpETjRLNjlmU2Rhb1hHUkh4bnJsTHBwaDBEa2Q1YWRLUnZNR2JGcVVM?=
 =?utf-8?B?MktYdTQ1b0VoSUhWTVpiQjFrYXMrSGRMOFovaFU3bzRBS2pPblhpVVJZUUha?=
 =?utf-8?B?cGlwZXhOY1dSemd6V29td2czYk9vZHlnV1NERGh0eEpHYVg3Si9hbEE3Qnhr?=
 =?utf-8?B?eDM1MW14M3o4QkJZZzdtWk42eU91bGREWUpHNlY2T1I0cXpjeXNhV3JWTUh6?=
 =?utf-8?B?aGducGpETFFHOUhJZlREZXZYWGNXbHIrLzdrMkk1eHkweUJKTGo2NEowQVhy?=
 =?utf-8?B?MFJRY2JVd0xjRHpjMkx4NnlBOStwN0pkRm5HTlhKMUhJaWxkQ1lJZlFUNWQr?=
 =?utf-8?B?WTU4aGdxL3A0QUNubi9yWVRhRExvdWtlZWU4V1FTd1c2Y05WVTIzQVBncWsx?=
 =?utf-8?Q?7t27da3dEnjzMPLIauHlVK8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c03473-421a-4f39-d062-08d9ef618301
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 02:27:14.1092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2tXT5BBWikTVLRGp4QYKOSxNu/fckgm+pMryM5TzpOxVK0WUM3ZmjeRYtsf6wXIaq4eNW7dOk1MxHEbT2w4zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB5704
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Felix Kuehling <felix.kuehling@amd.com> writes:

> Am 2022-02-11 um 11:15 schrieb David Hildenbrand:
>> On 01.02.22 16:48, Alex Sierra wrote:
>>> Device memory that is cache coherent from device and CPU point of view.
>>> This is used on platforms that have an advanced system bus (like CAPI
>>> or CXL). Any page of a process can be migrated to such memory. However,
>>> no one should be allowed to pin such memory so that it can always be
>>> evicted.
>>>
>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> So, I=E2=80=99m currently messing with PageAnon() pages and CoW semantic=
s =E2=80=A6
>> all these PageAnon() ZONE_DEVICE variants don=E2=80=99t necessarily make=
 my life
>> easier but I=E2=80=99m not sure yet if they make my life harder. I hope =
you can
>> help me understand some of that stuff.
>>
>> 1) What are expected CoW semantics for DEVICE_COHERENT?
>>
>> I assume we=E2=80=99ll share them just like other PageAnon() pages durin=
g fork()
>> readable, and the first sharer writing to them receives an =E2=80=9Cordi=
nary=E2=80=9D
>> !ZONE_DEVICE copy.
>
> Yes.
>
>
>>
>> So this would be just like DEVICE_EXCLUSIVE CoW handling I assume, just
>> that we don=E2=80=99t have to go through the loop of restoring a device
>> exclusive entry?
>
> I=E2=80=99m not sure how DEVICE_EXCLUSIVE pages are handled under CoW. As=
 I understand
> it, they=E2=80=99re not really in a special memory zone like DEVICE_COHER=
ENT. Just a
> special way of mapping an ordinary page in order to allow device-exclusiv=
e
> access for some time. I suspect there may even be a possibility that a pa=
ge can
> be both DEVICE_EXCLUSIVE and DEVICE_COHERENT.

Right - there aren=E2=80=99t really device exclusive pages, they are just s=
pecial
non-present ptes conceptually pretty similar to migration entries. The
difference is that on CPU fault (or fork) the original entry is restored
immediately after notifying the device that it no longer has exclusive acce=
ss.

As device exclusive entries can be turned into normal entries whenever requ=
ired
we handle CoW by restoring the original ptes if a device exclusive entry is
encountered. This reduces the chances of introducing any subtle CoW bugs as=
 it
just gets handled the same as any normal page table entry (because the excl=
usive
entries will have been removed).

> That said, your statement sounds correct. There is no requirement to do a=
nything
> with the new =E2=80=9Cordinary=E2=80=9D page after copying. What actually=
 happens to
> DEVICE_COHERENT pages on CoW is a bit convoluted:
>
> When the page is marked as CoW, it is marked R/O in the CPU page table. T=
his
> causes an MMU notifier that invalidates the device PTE. The next device a=
ccess
> in the parent process causes a page fault. If that=E2=80=99s a write faul=
t (usually is
> in our current driver), it will trigger CoW, which means the parent proce=
ss now
> gets a new system memory copy of the page, while the child process keeps =
the
> DEVICE_COHERENT page. The driver could decide to migrate the page back to=
 a new
> DEVICE_COHERENT allocation.
>
> In practice that means, =E2=80=9Cfork=E2=80=9D basically causes all DEVIC=
E_COHERENT memory in
> the parent process to be migrated to ordinary system memory, which is qui=
te
> disruptive. What we have today results in correct behaviour, but the perf=
ormance
> is far from ideal.
>
> We could probably mitigate it by making the driver better at mapping page=
s R/O
> in the device on read faults, at the potential cost of having to handle a=
 second
> (write) fault later.
>
>
>>
>> 2) How are these pages freed to clear/invalidate PageAnon() ?
>>
>> I assume for PageAnon() ZONE_DEVICE pages we=E2=80=99ll always for via
>> free_devmap_managed_page(), correct?
>
> Yes. The driver depends on the the page->pgmap->ops->page_free callback t=
o free
> the device memory allocation backing the page.
>
>
>>
>>
>> 3) FOLL_PIN
>>
>> While you write =E2=80=9Cno one should be allowed to pin such memory=E2=
=80=9D, patch #2
>> only blocks FOLL_LONGTERM. So I assume we allow ordinary FOLL_PIN and
>> you might want to be a bit more precise?
>
> I agree. I think the paragraph was written before we fully fleshed out th=
e
> interaction with GUP, and the forgotten.
>
>
>>
>>
>> =E2=80=A6 I=E2=80=99m pretty sure we cannot FOLL_PIN DEVICE_PRIVATE page=
s,
>
> Right. Trying to GUP a DEVICE_PRIVATE page causes a page fault that migra=
tes the
> page back to normal system memory (using the page->pgmap->ops->migrate_to=
_ram
> callback). Then you pin the system memory page.
>
>
>>   but can we
>> FILL_PIN DEVICE_EXCLUSIVE pages? I strongly assume so?

In the case of device exclusive entries GUP/PUP will fault and restore the
original entry. It will then pin the original normal page pointed to by the
device exclusive entry.

=E2=80=A2 Alistair

>
> I assume you mean DEVICE_COHERENT, not DEVICE_EXCLUSIVE? In that case the=
 answer
> is =E2=80=9CYes=E2=80=9D.
>
> Regards,
> =C2=A0 Felix
>
>
>>
>>
>> Thanks for any information.
>>

--=-=-=--
