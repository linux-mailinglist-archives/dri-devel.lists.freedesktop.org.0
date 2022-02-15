Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8254B7954
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 22:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E66B10E55D;
	Tue, 15 Feb 2022 21:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2053.outbound.protection.outlook.com [40.107.100.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA5D10E11B;
 Tue, 15 Feb 2022 21:36:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZepySCcn9HtAMN7cP31jj8ale/hnz20AjciNrXpXwTIYrZAlkMMRoehZZT/bmoSFjrBF9ID5L7tRBXNRKFmbahfurUoxCMVbKPT6kf9XPurd0yfkIPFfJZDGXEfPFi7iFr+niukdRKhjp6KtSZYoxtsuECyLcx4pi9CuwV5oDYG92mvfmR1a1dIv/GKRYrqdWGp1//GYsqPZEFc3W4Hr/hS7DyET5umHxUIM5yC8QD1JrvGARWZo2C7lpyML+apAnp17UFL/UgzlAQcmtRlQTlayW4yFA3bpyUkQVOZ4z1j7J4DqFvo8+SGYntoWObAhcvSBS+D1dFPODTB5DiXMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSYCKd59p2jrxm0D7F785gOrZwod+edno4rOLB0MRQ0=;
 b=WQOKtU51uli3jHsy21NrjL6rt5rtn781njAH/uomQwRFoYwh+xNUkrRgbLMsD5fT/QYUaC4d+IIOcMd/XxJI2c8tNOgIB/N5fvRBgGeTcXcQfr5PUAb8qpLcrNl7zwSQT3HU/iN+Aljq88l0DupEt/kUxuGFnXsHaOVjzD9C34ntS2fwc38ezdsVrskthgvPGexVyP6oJ3+Xs0f4Q2iJ2ZUT/OLD7Yhe1beG2Pv4u2jRdvAS3jsuNwm9WwYsHmzNLnu9AUsbU+mumoIJeBS8u466rLfTcJZEjxZJDC+1yVvm/ahh7jQt3v1bMPdjRpo8gE5sVQeTkSZmB+8Ddr7c1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSYCKd59p2jrxm0D7F785gOrZwod+edno4rOLB0MRQ0=;
 b=XMa9EJJ1qkNUmotI02yOEg9wEuypwqWxU8yH2j2LjkEAnUBQxq2m5eWSqgd5bpCBeAmrpr3V5biCQVmQIJ2OP7grmZoVAI6jl0s9827XaXI/w3Yj7SLkPTJgzi7Jc17aXYauL/nJyM/s/6yVIMhqfZASW6roin/8iImYNqGnuIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5367.namprd12.prod.outlook.com (2603:10b6:408:104::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Tue, 15 Feb
 2022 21:35:59 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 21:35:59 +0000
Message-ID: <ac3d5157-9251-f9fb-a973-f268ce58b4e0@amd.com>
Date: Tue, 15 Feb 2022 16:35:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <f2af73c1-396b-168f-7f86-eb10b3b68a26@redhat.com>
 <a24d82d9-daf9-fa1a-8b9d-5db7fe10655e@amd.com>
 <078dd84e-ebbc-5c89-0407-f5ecc2ca3ebf@redhat.com>
 <20220215144524.GR4160@nvidia.com> <20220215183209.GA24409@lst.de>
 <20220215194107.GZ4160@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220215194107.GZ4160@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0266.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36f2833e-8ef4-49ae-6de9-08d9f0cb280d
X-MS-TrafficTypeDiagnostic: BN9PR12MB5367:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB5367552AF41DFF6C8D292F1C92349@BN9PR12MB5367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: atIFVGgzNEhtkErktxuSJ2USZDEEDpE3TYZQplkMsw3lyRaw8uO5QYgfg6R6xF4/C759U9mImb0dY3pDsa8FH+TqZZDAddxsmQifWuGQbDgHOENHz0xB5ctiFcuuTSWWXZ8PWa7nXFmIeB5iKtP4qnNiMQYZBGl7fvprluOq1cgezGcG3ZgzW2//RXQQwJyDhlHxhVgu+wEQ9iySVztcdlqOL0/6FUS3LKTPVZ6opYvaLihUxR0uAmem0lJ8iv7YTd+okxaJ6jg/ojIJz6js3i9n4tsIS28oLy7aZOpf3VnPmbo4xxbDbtdHQGf5fjVghw9iHTzcsYoC+4ktm2ACZwz67vV9hXTL21Pwaj4add2S/usNqSLkE9VMprVWSgGucp+4QXQrtFEvGznPqmeGGtdPqFNibJtTOAbOR3Ud/ghM9ejS0Bdg7uz1hDg0jRHVaWq1lwG8CfhEnny5CB7vuROB0cI6wwNEgZbuI1NG+cSoxFRlZcfBJHwNwhJlPisBhtJBNg1+BUXbUaOONFsaA2JpBMjhsUxQEBcli7vGyhHOvaP1kFNPt1tM7MHVlPYO3tnzjcPnzsoOVWgM24rsVbVzNFNLCs7hCi65PJtnlsOY+kuUb1KYJkiz6MgOTTn8BPxSCrmftWizxcWp//8za6/aYYPFQeVHpCykmAdKD8qSH2zjj1OXNorPJTmFFTMndNT10BqAY5t17FH+l8No3oLuQU7W6oqPYm2kiwo8TIpap6RF+HLtdAbIx++5CzTi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66556008)(66946007)(66476007)(5660300002)(8936002)(7416002)(53546011)(44832011)(186003)(6506007)(36916002)(2906002)(2616005)(26005)(6666004)(6512007)(54906003)(38100700002)(31696002)(6486002)(36756003)(316002)(86362001)(508600001)(110136005)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXc3b2ZCWEtrTG1uM3J1Q0ZhL2sxWjNsK1kyc3YyREd3K1ZhZlh1ZHd2RDVs?=
 =?utf-8?B?akZBU1ZLME50b3lySE80akpuNzVTNGNLWTFVUldmL20rZ2Y0Q2VWM1lpb2hm?=
 =?utf-8?B?T0JOalg3R1plNEM2WHdNTVFqc0FjbzVNODNwcHVDcjNDTjhlZC9TWmxRZVJm?=
 =?utf-8?B?UC9XMjhzUzE1bDlkbnhnTi9hYmlLejc1L1BzWlNodHJKS3REbFY1U05vdVRT?=
 =?utf-8?B?bVE5NXRQREJ0RmxVL3IrUEZiTkVFVytLWjhNaTBkNHh0aGhGSzIzRWMzZmE5?=
 =?utf-8?B?YXRaSG01aHF5d1VSRldNT0pKNEJhQXZkSmlkSlR1SXlMWUltQTQyOHJ3UUhC?=
 =?utf-8?B?RVFNZVlydUlrZzN3SDlRK0ErMmdDQTFlNHhzWTFWeE5QUlRnQ2pzalpweXR6?=
 =?utf-8?B?NWw3cVJidHRTMm1RSFBWdmlCRTU5L0NJVEZDV08vdW00TmxNeEh0QVlRMCtl?=
 =?utf-8?B?UUJ3RHN4cmlyMFJWL0xWem1PcFc1M1EyUjhEQ1lZWFM0VHNzV2p2S3dGajJS?=
 =?utf-8?B?dXJYb1p3ZG52QnVqNllwNnR6TGYyOGtveWdoL2NHQUNrM0VScllGeVNCeWtp?=
 =?utf-8?B?NWtnZzlGWEdjQmxRb3ZaeVVtcW55cUxTNHB3K3haODVqZXFiN21DUXJoblNy?=
 =?utf-8?B?SytyWjV4OHFoS1NHRFFPU21rN09uNGRoS3RwY04rNEpmUkNnK0Qxam1YWkl0?=
 =?utf-8?B?eVc3WFNUV0NIdGFGT0xXNDk2aUwyNGZPODZxY21HNi9BQlB2WlZBNVh2Njc5?=
 =?utf-8?B?Q2RLR3hDVXFRR3hwTnJiN0VIenZEVHZWaVhUWm5md1BXVXQyZkExbkplTFFl?=
 =?utf-8?B?TnJDazNTQ1NwRStrRXE0VDJtRE05MFp0Y3ZLTmVmR2huSEdZVjlFWHhBWFlY?=
 =?utf-8?B?OGN3TVR1UEtSNnEyTmJHSEI4NGJWSVRSNTJjVFRSNjh5cEZFZzl4aDZod2tX?=
 =?utf-8?B?WWVnSjBXM0haVTQ4UXRuSTlIS2c0eGprVFNQSC9GbDFsTFcya1ZCbkZxUmZy?=
 =?utf-8?B?bnI4TDhzT0FML1FERHozMngrcjl0TVV0bCtLZEhWdktodEkxZG1GR3NKdnRu?=
 =?utf-8?B?cCtZMXFlN05nVytaV2R1Vzl3Ri9WV2ljVktUbDIvSmFIaTByeWgyaGtFRnVV?=
 =?utf-8?B?YnJKMWZhK09yZEE0MXBJdkhsVXhYL1dIdXlMdGoreFJZYmhTZ0lEa2VySHI4?=
 =?utf-8?B?dUVKUkIyUmxETVN4MGJGWGdEZjRDQ2Z0QWlySEZPaUhKQ0pyN25XK1c5cmwx?=
 =?utf-8?B?d0c2eVp4YS84cmFrN0lLZjNyUVJOeHZrUzZsaXU3UFBqRExWUGhkRWk1U2c1?=
 =?utf-8?B?bWpZQnM4M0pGYTNTckxhNFlnZXpiVXpQeExmMkJRaDQ4dDEzOTdnR1B1Y2U4?=
 =?utf-8?B?ekx0d1FLSU0xV0tiWWEvZ1RLd1ozSUJHM3paZmt6dmNNTEZYaVYrWmQvWjNX?=
 =?utf-8?B?U2lzMGJsLzNYY0FHSnl6bUJIRHFpWDlhZHRzMUQva1NkREdNbUpic3BIWUkz?=
 =?utf-8?B?MEo2WHlGWUVDbGdVQVpRZkhqY1l2UzRML1o1Nm5LYlU5b2VhYzBFMXJzQW5X?=
 =?utf-8?B?djVDTzhqSjkyeTVpRlNSSCtqTnEvVElKVUYrK2NXWG16Yk5vSzlyNzBqL3pF?=
 =?utf-8?B?OFFKbnM4Snl0Y2RRYmMyMzF6MHlDM0ROMjFSblFBN2gzRWJWNk9hclkySjk2?=
 =?utf-8?B?NkpVZ3JsS1VlL3JsRnYzamxySHFxR0VQM09DMXo1SGVoUlBwOTBRUTBPMVJ6?=
 =?utf-8?B?V0djc29WdklWaUZWSG5uNEJmb1JUVjR3MXRJbnhoS3FCc1QxMXhBc0Z3Tk5U?=
 =?utf-8?B?alp0YXpObUUzODdpcVl3aVQvbUhBcHRQcC9XUFpWTGhiTkpQRm1yWWs3RVc5?=
 =?utf-8?B?RTRoUEQ5dGY0M0M2ZGpNUXVrbXF4ZDZxckxpS0FnWjN5TkJzNytFV3pNMFFR?=
 =?utf-8?B?SG5kV1lmbUtTbkNibU92Q3BoTUFIWWkzcTh0dXFncHNkclFVeHQ4dC9raXNV?=
 =?utf-8?B?YWw0S2NRTXVwVlZoK2YwTnJmQzRFYldESG9vbEQ4RlViNnFPYzB5dEpnTDhj?=
 =?utf-8?B?YURLbVdNMDJGNDRTS3JaMm43WWFKRHQyZCtpaTlGeFJrRVVxTk1qVUlYdVFZ?=
 =?utf-8?B?emlGNXJFa3hVUzl0Q29GOVFmVXh4ZVhFZU9pOEs2TmJBM0luekNUV3k5YVFD?=
 =?utf-8?Q?e/7Aup75XACJHvQgQSDtxgA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f2833e-8ef4-49ae-6de9-08d9f0cb280d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 21:35:59.3756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhLLSIIkx4Ifdm1aq9fc7uIMEEHcuKGrkFhfSHdyKOXP+piLVeUWoXXH6zldy8k7ynEk4OPCBAn32DtMse+Ufg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5367
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
 willy@infradead.org, David Hildenbrand <david@redhat.com>, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-15 14:41, Jason Gunthorpe wrote:
> On Tue, Feb 15, 2022 at 07:32:09PM +0100, Christoph Hellwig wrote:
>> On Tue, Feb 15, 2022 at 10:45:24AM -0400, Jason Gunthorpe wrote:
>>>> Do you know if DEVICE_GENERIC pages would end up as PageAnon()? My
>>>> assumption was that they would be part of a special mapping.
>>> We need to stop using the special PTEs and VMAs for things that have a
>>> struct page. This is a mistake DAX created that must be undone.
>> Yes, we'll get to it.  Maybe we can do it for the non-DAX devmap
>> ptes first given that DAX is more complicated.
> Probably, I think we can check the page->pgmap type to tell the
> difference.
>
> I'm not sure how the DEVICE_GENERIC can work without this, as DAX was
> made safe by using the unmap_mapping_range(), which won't work
> here. Is there some other trick being used to keep track of references
> inside the AMD driver?

Not sure I'm following all the discussion about VMAs and DAX. So I may 
be answering the wrong question: We treat each ZONE_DEVICE page as a 
reference to the BO (buffer object) that backs the page. We increment 
the BO refcount for each page we migrate into it. In the 
dev_pagemap_ops.page_free callback we drop that reference. Once all 
pages backed by a BO are freed, the BO refcount reaches 0 [*] and we can 
free the BO allocation.

Regards,
   Felix


[*] That's a somewhat simplified view. There may be other references to 
the BO, which allows us to reuse the same BO for the same virtual 
address range.

>
> Jason
