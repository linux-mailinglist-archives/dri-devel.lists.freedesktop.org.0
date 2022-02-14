Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BB04B3E8C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 01:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631AC10E154;
	Mon, 14 Feb 2022 00:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC61410E154;
 Mon, 14 Feb 2022 00:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTBPpmTivEisrH55gVFbpRn4z+vgy2Qh3xCzlAvrt34wmtTykFBpjpc7iUP4XZRceM6CD3UIUZ83fF2lSt9mP9aql5cSAjAgtgpfmT5MF0PVYB404KdMqLBxtaE9NjOw1014Xq+VRRRQPMiVY36nkECYHHOHCme5A8noEkq7W9nuJdZknc5P7s6Jm0VYRHpGaCz85miW/GNUtBqRHj9JfNuYhD8nY9MTCg5oxZ3zX8rga2KINo50za9Qtnq7asq5rnqbFnwCRgCYvfp5jCZCUvcUu7P5AnF3aWQOfWzsB6wwGhHEuJjA9lQAy+ZGc31pBGSEl3PuSjP9LnoNdsuI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCYrrzFoW5hAcJqejchdxoqKxYNnLW0FEatVxngRN+0=;
 b=oYVNYaR0rUk6l5jnUWz2mMVX39PpWwP0iDf2gXM2Z7wRPOjshaZTxPEAuYWxfAwj+ffIxjpgctkqoOz5x6EYAxRN6MZrJGaPvSZYj+9d+OacdcY2tlhen0GB21TeCwgJImr/I4bCcv217IIBlhMK+lN3lyAHiOlyqZ1xgueojFG8uNTbpzYHin7yhojgyPpt2sf+gd7ouy78uZKB04gJ10qwADQehMsrgs8F2hLZ9/BHxAB5X12gXWmnyw/0gF30IuPmezLvG6ywt+TTNcwWGAwBqG4P3QQSw36WsgioS0HPF/T02isGdmbhCKbfEpcDbpq2TyTxFP0curMcYtQaNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCYrrzFoW5hAcJqejchdxoqKxYNnLW0FEatVxngRN+0=;
 b=XCBkw6a5KGYQJVZ0gNYm+h0glPvf3MI7Z/MjzP4178/PG8ZJrKtDuO/ApLEEJQCgAfGv928QWfRWPIzAOcwFVUCHasgcB5hhaN0Pz7Gxh+sfrMzKsL6Rv0h3Im1d9uGmPq4qUzELdNVCw1jym8nAJ5INb050pxoOyBlMYNwq6M6Tr3pR9l+MDvHjkbYA8z2eWT270/77ir9pbqBweQJ9hlI4BuZpi9XUHRPGrDoyy5KErR53LHpSvJqfXWgCYBI0WGhx4k++KwtEf8B6YIiHGKRvARIV0NyNdbqZugpi1N0ZtNId9Q+77HmatrczUfu4t0QyDl16V7f3XUct7/gqRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3179.namprd12.prod.outlook.com (2603:10b6:5:183::18)
 by MWHPR12MB1760.namprd12.prod.outlook.com (2603:10b6:300:112::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 00:11:27 +0000
Received: from DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::8513:6328:e0a7:b9a2]) by DM6PR12MB3179.namprd12.prod.outlook.com
 ([fe80::8513:6328:e0a7:b9a2%3]) with mapi id 15.20.4975.017; Mon, 14 Feb 2022
 00:11:27 +0000
From: Alistair Popple <apopple@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 2/3] mm/gup.c: Migrate device coherent pages when
 pinning instead of failing
Date: Mon, 14 Feb 2022 11:05:50 +1100
References: <cover.0d3c846b1c6c294e055ff7ebe221fab9964c1436.1644207242.git-series.apopple@nvidia.com>
 <dd9960b327ca49a9103d9f97868ea7b0b81186c4.1644207242.git-series.apopple@nvidia.com>
 <4b6b472d-07b6-0c96-22ed-9a77a878cf61@nvidia.com>
 <2315725.OX4gP1S1Nc@nvdebian>
 <0c7b50d3-9bca-9462-05ca-b4ef846cc49a@nvidia.com>
User-agent: mu4e 1.6.9; emacs 27.1
In-reply-to: <0c7b50d3-9bca-9462-05ca-b4ef846cc49a@nvidia.com>
Message-ID: <877d9ygvdj.fsf@nvdebian.thelocal>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: SYBPR01CA0203.ausprd01.prod.outlook.com
 (2603:10c6:10:16::23) To DM6PR12MB3179.namprd12.prod.outlook.com
 (2603:10b6:5:183::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6027328e-33e8-499d-fe28-08d9ef4e8b7c
X-MS-TrafficTypeDiagnostic: MWHPR12MB1760:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1760043C85306F7C4FB2D169DF339@MWHPR12MB1760.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFL5yQ73AeDEDj50lkK2gLq+uCLVI/b8k74tu4z/2FupSJwL3JFNGiomNn1T/ZIZOFWZtq5DkErBNOHJ+JoA2SxS81A20wnjpgXIPMh2bErKhwj4rYUJr3Arnj6zzyP4af/W43jZOlE+ZIfRH47Cw4gItatruE96odxltK21ZTB+OkXKDaBsqh2N45OEn4/+XtZVwdG9O3+Fjf8EfSSGgJntKi6poIBJ9GspAtyCBgK4GDBwtuPH2+Hf4z9E7ozCAB/buDHJ6oP//1o7pZoG+EMT/7HswHwbJL8Bv7vdKGnuqVSWHTl7ZH5mxo0T2wXupPJN8VNG818mSNBTduFlu74nu5uGStD/eGZf0SjBZx+vK1io0vQAb9hrGRvlKyRkvoj3IdD8tNMJictSmUlc51k6PLevARu+iNBEDfbgFb7eI82s8+dB9zEppbVKpQKzsDnN2mgn6skwpyRbucVkwRzMj23GcckKcQmiPXATlLNzpi6Uqhfi5OPnp+8NMSWexCQ6tV2TklffJqMu3hNXGgHkItXe3Y9hi+XZTJ38lDIGjDqeswP5tTwcJuvsSi4zY/X6q3EN009XD82sapdXvoO4tfayJ7OXouOKVGOip3T4JbCwPnwjAyiSDFYnKGT+dViTl/D0a2eyDOT7zA2KpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3179.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(6862004)(508600001)(66946007)(66556008)(6486002)(6506007)(186003)(66476007)(316002)(6636002)(5660300002)(7416002)(8676002)(2906002)(9686003)(6512007)(26005)(86362001)(83380400001)(38100700002)(53546011)(6666004)(8936002)(33964004)(44144004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTR1aThYTG9tZ2dJMUxmOG9FcXNGMTNkTzVOVlBJZUhaQXN0Y3Bza25IUGdi?=
 =?utf-8?B?QjRFNXhIVERNL2tVK2ZNNmdIWU1tZjRrV0hkYm1HbGNlUTlXODBGSHRJb2s3?=
 =?utf-8?B?d200ckV5MU56Tm50MXN0dGdVL0NTelgweGxBMG9JWGlYUHZrdmFMZmozMWIx?=
 =?utf-8?B?amJGY2k4K2lBcHBSN3ZaUUZmTmFBVFNmTG4ybzRmRGxwN1RJQm85TWVQeXov?=
 =?utf-8?B?RExnOXM2aVhVZjVWUmcxVENndytWRnFnYm4wenNTWDVTbDkweDRzZ0JtbWRm?=
 =?utf-8?B?aDNlT2UrcE5aMEY2QVd1SHNzcEhWNVg0UjFidmxuR25Dc1NDUExwbks5clM4?=
 =?utf-8?B?N2l1MlYzZS91Z1NkV3hOWmcxWTQ1RjQ1T3VYNzk1MStWdmpwWW01V0RreE1s?=
 =?utf-8?B?VThvTjlPNmZETTEwbnRHVGFHa0E2Q2tieEwxY1VzeTFBWDJWZzNQRFVUL3d4?=
 =?utf-8?B?bUpETWMvWnovUExKV1RocWVoanRWRzBTT3ZLa0lQcmljNjM3NHUwZjRqSU9x?=
 =?utf-8?B?cExTQm5FL1kxdnNHams4eFhWUG8xSXYwWHk1ZXRTazllbTZGZ2tCUm1wd0ZZ?=
 =?utf-8?B?UndHQTVDeXE3QkFVKy9ROEFZRm5kem4wWm1aeGNkSXozQkVBK2VmTENrS2dt?=
 =?utf-8?B?RlV4VllRREtybHhTT3VlR0k3TDJqSkxmN0tLdXhka1Z0b0FtSHJOSzliQnE3?=
 =?utf-8?B?Zkc2cmg0UWRVSmE2elJ4aVAyM1RacmtZV1ZDbDUyRE14OUpDKzYxYmY0c3Y3?=
 =?utf-8?B?L0RHVTB6WGpWaTc2SWlOdzFuYmhGYWhtN0FtQzlaYWc5cWVrNVhIRzNsVkx2?=
 =?utf-8?B?bis4STd5K3ZNelFWL3g0eDN4OWFiblVoT3FjY3JLUnBOWmJ5ZG5FSjg2ZXhM?=
 =?utf-8?B?R1RWa3VlT3QyaFJkY1dJSnRXRXN3eTVjZUZieEZIM1F6WFpGdzRYUWYydVdX?=
 =?utf-8?B?ZGRTUDEySzZmbFR4UnA4b2MrOVZWWFRkOERuOXVqNWE4M0ttd1h3bitZUmx5?=
 =?utf-8?B?OFdoQS8zZkJXY2o5V2pXOXRaUGgvSEZsSHZmakE2QXZFeUZKOHVaMDYxdVhV?=
 =?utf-8?B?RTdWQWFLRjRDVXZCNVl2YjlQTjQ5bmhIMTFKZjQvYnlpVGZWVmt1UlBxajZ6?=
 =?utf-8?B?cUx5K0d3RjlweDI0MGE0ODltUmc5T3JoelBMZ1hOM1duT3pZTmMyZy9MYkxt?=
 =?utf-8?B?VVhaMFdQcmR3NjRISHRWSGNHdm9DTzE3ZjZndm1pWWFEZ0R4NkhFUk42blhy?=
 =?utf-8?B?QWZCVG9LUmprYnpkS0hqUDBKU1RxYTZsd1RjYkhOQ2syOGFYQzdpTkJaWjdz?=
 =?utf-8?B?Tm9VdnZvTHF0SFZEclozamI1NDdIekxQbktEdmFJZ3NNbnBwRFlEUWU3Y2t6?=
 =?utf-8?B?NFFZVzE4T3g5d2E4MkROS1FmRnM1eHI5Y2FVZjRuTGM3MzJzOTZvdHJwbVlU?=
 =?utf-8?B?WHUzbXI1SGRqb2l3RXc0TVhMdE5rYW00OSt6SUY5MTBGV21WMS8zQkJYczBO?=
 =?utf-8?B?dWRWS3U1K3MySVhtdm11d3JCSEI3ckJ2dE5YZjBHcHV4WHNVUEZBaCtFTnJX?=
 =?utf-8?B?d0dtLzJVS3lZRWNXOGIrTHpaQUF2OHNDSFBlcVNlZEVmU2xrM1V1S0dzNTBQ?=
 =?utf-8?B?bStWWEowSWZGcUoxck11Z0tuK1JZWGphekJJMVN6M2NaWVBOdCtac1dETkM2?=
 =?utf-8?B?ekpETURBbFZBTnRYWGVWNGNGaGVEYUdWdlJtQTJRbHdXT1Z5bCtGOW02T1hN?=
 =?utf-8?B?Tzd0eFdWZHNJM2VRNXRqUTE2NlpqZDl2U0U4RWdyUUp2bkh5SzNwdUJTTXNV?=
 =?utf-8?B?WGQ0Kzk0RlJMeEQ1elVIbEpwK1NWL2FrejV1eGlSdFNLT1RjeEtESmdaczV6?=
 =?utf-8?B?akd0N0FFcGhBZldkdG9OR0J4YStMcDVXbXhZQkhlK0xhOE5hNHdLYStmV1pC?=
 =?utf-8?B?TUtPTlJsQVFXc2FnTmdGZEFMOUFxMkExc1Z6R3FMRkg1Z3pnMWNmU3hGNXc4?=
 =?utf-8?B?S2tuMlNQRklFUXg0ODkzMFdOZk5iQUtJY29ncHZmekRTYm5IQmhyZ2k3bS9U?=
 =?utf-8?B?c0VBSm5tamJBZUJScFhld2NhQkJVK1RhNGRXOThQbHRrZEU4UENHSTVBLysx?=
 =?utf-8?B?bklMQkFHaklGU3dXRXowZ0htZlVJWmUrZDNxTWV2V1RMdS9XaW0vMGljYmxH?=
 =?utf-8?Q?QzAQ1UX2c0Aj8n3ngNBh5mo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6027328e-33e8-499d-fe28-08d9ef4e8b7c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 00:11:27.7910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4iC+Cq5y/HNz+mc2H7M7hYl8XR2k7Zy8pFfGVeAsD/3zaTyq5/rGToSeYe9sZoZySdPnrEi+okJKNR46WqNt6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1760
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
Cc: alex.sierra@amd.com, rcampbell@nvidia.com, willy@infradead.org,
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

John Hubbard <jhubbard@nvidia.com> writes:

> On 2/11/22 18:51, Alistair Popple wrote:

[=E2=80=A6]

>>> See below=E2=80=A6
>>>
>>>> +			}
>>>> +
>>>> +			pages[i] =3D migrate_device_page(head, gup_flags);
>> migrate_device_page() will return a new page that has been correctly pin=
ned
>> with gup_flags by try_grab_page(). Therefore this page can still be rele=
ased
>> with unpin_user_page() or put_page() as appropriate for the given gup_fl=
ags.
>> The reference we had on the source page (head) always gets dropped in
>> migrate_vma_finalize().
>
> OK. Good.
>
> The above would be good to have in a comment, right around here, imho.
> Because we have this marvelous mix of references for migration (get_page(=
))
> and other, and it=E2=80=99s a bit hard to see that it=E2=80=99s all corre=
ct without a
> hint or two.

Ok, will do.

>
> =E2=80=A6
>> Which unless I=E2=80=99ve missed something is still the correct thing to=
 do.
>>
>>> This reminds me: out of the many things to monitor, the FOLL_PIN counts
>>> in /proc/vmstat are especially helpful, whenever making changes to code
>>> that deals with this:
>>>
>>> 	nr_foll_pin_acquired
>>> 	nr_foll_pin_released
>>>
>>> =E2=80=A6and those should normally be equal to each other when =E2=80=
=9Cat rest=E2=80=9D.
>>>
>
> I hope this is/was run, just to be sure?

Thanks for the suggestion, these remain equal to each other after running
hmm-tests which confirms everything is working as expected.

>
> thanks,

--=-=-=--
