Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC549EEC7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 00:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D642010E222;
	Thu, 27 Jan 2022 23:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A3D510E222;
 Thu, 27 Jan 2022 23:20:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQphgeQHQEkCDwNbOcDfDmS9Zm1qN8ysReuvb/sHnaP3D7AtlXKbL/YH+8UalUZcPvkmBEgmxM4mIlhWGZnc5XHQb2M5NmWCLCVXLBAIB6QNpjfrc5CTR4UWSvA8AxZCM69VYT4H4z5tiKxhzdQOhH+UCEPwwo5tRRc2EA4VI2yER8AjPATFRDe4TKBsuCH77mzUA61TYofjN06G0rabp9r24MZZ2MPWVe1VLMRrC/WUgHo2ujs850pO2pZ08pzdPjf1xMtq/5xTUp+1FAwswkf8ezNcru8UTNXIbZyeirqZP8KmpltHJdzku5mwMqpPoyggYeMV+snHYxHSugiRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBqx0Fn4Vh36FVinfK2gLhSIoJo3k2vJu6MuEzsuVFQ=;
 b=N3CKW7W9vRsGhS5Rvsq7EFqBTmDHiUxcopXpL+6saPuvtGGffp0yTTBgmDgWhGke4rGKQd3aPba2H42d4v8mREXwYlNZYTBltDjeHfEyrIUqpHialFdUyURd7xSNJ+lnqptpS5avw4MgC3oAmjrPb6ZD0iSxEE6wRPmFHRcz/cF02jhvuwW+jNOp1eQsTOoRfKmn87tWkciDcgBiMcmpAzeKw4re50fib6t80d60zn2qfcPXts6ZL1byXSbeBWHPwuFXKOEysWjXYloeCmR6CYQlmepglGS4S3krmPOsWY64A81UTj+PwsSZSSZElA1vkSJJ41doyJoWpPWHnxyO0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBqx0Fn4Vh36FVinfK2gLhSIoJo3k2vJu6MuEzsuVFQ=;
 b=T0RqzBB4fiM0qc9+dA095bkOsjNPR8lAY0Xk7oxMZnqsnOuyK/7A1olo9WmyhWDa/G6o/vF7fwMTY5ct2DHhEFkQNxtNqhq/v3YINeeov8v/3HKfBkX8GIaJLPLcbl4NH/d7qp2QPpRdJEjs5k0+Bw2sdrtDHpNag+zHqbY+MT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by CH0PR12MB5235.namprd12.prod.outlook.com (2603:10b6:610:d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Thu, 27 Jan
 2022 23:20:45 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37%3]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 23:20:45 +0000
Message-ID: <6434ba24-a219-6a5a-d902-0b48974a0e43@amd.com>
Date: Thu, 27 Jan 2022 17:20:40 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 00/10] Add MEMORY_DEVICE_COHERENT for coherent device
 memory mapping
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
References: <20220127030949.19396-1-alex.sierra@amd.com>
 <20220127143258.8da663659948ad1e6f0c0ea8@linux-foundation.org>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <20220127143258.8da663659948ad1e6f0c0ea8@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:208:91::24) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1b50743-0872-48b4-fe6e-08d9e1eba509
X-MS-TrafficTypeDiagnostic: CH0PR12MB5235:EE_
X-Microsoft-Antispam-PRVS: <CH0PR12MB5235866576050E3ADD4CB77FFD219@CH0PR12MB5235.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tegecmldYu36aB/nO61uG4zETJkFdIIf80jICJcF2rtvlXRS9kSmhG0WKWy4jK4+cm/Aex6ZizkWMAGov1y+NnAmzkC5S3wiS23xkpJfXSYHDsAJJwnI0yRyHwK31ADTHP1OirqVZplOXn0+n55WLqEYOd12DspiP6vOl7/BKh8PV0WVNnHsodLB1us9+4+UxW/4sXAQTAanmZlhUZjbMf2hQbG1jiDOvb91kCinhWta9VyeoDmeupSp1TWn0Ske/kMPCZVlxmUvNGItHn0+sbGntocHuxiKKbihtyKQ682uAa5WzcYu92Bhsc1n7jPQAGgJS8teDGYsW1rYXuKG/4e2mE4cl9pPdDj5Pimg9snMJ/C6QR932XP4W8HkU07nZpfGomadTDDCfFi8ST3DUQ+3hnJ7dnwkGiHI9bwdJFePNKXYzoU2GxB4+LmvosjkRMKFG8NhDvjahDlD1uCF3/uwu2NCEutq/WQHDPDAQlVxmt1WyliYZqqa0tOXrjnrYxAbsHiZX9OfQ1WTVypfsKRgE41TrD2MFjCLRJRmRgG4ETkRucx/7U/4Z+ez24uWsDxVFi3gWZm7XFTXHeOTsTDS59bARskYXFAlYNGYVrFXCcejNnk3NCT1TK96xA/2BjRPk3Yg/yLwLPfHBnxVXedkm+yXXrWF9cvkDVAlMWipm6aT4mTCgBN7951qLRxrWjgHfqPpo+kf085qyCz/CBSXl5orVzupEQ3jfyb9ox0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(31696002)(8676002)(7416002)(66476007)(8936002)(4744005)(66946007)(66556008)(6512007)(6666004)(26005)(53546011)(6506007)(86362001)(186003)(5660300002)(38100700002)(316002)(508600001)(6916009)(36756003)(2616005)(2906002)(6486002)(31686004)(45980500001)(43740500002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkxSVnYyVDNqdDBvYkdGczhOSmNlU2RVeThsUDc2bzZMbUYzM3c5Vll3b05G?=
 =?utf-8?B?VWw1cDFaeEVZd0xYbkwycjlyV1NPNWtMSFYreFpCRGU3S0NQWk01clpLWG9i?=
 =?utf-8?B?cHk1ZTZtOXF4UGVOajNvNTVoYU9RUjdVTG10T3BmM1VEWTNpRjEvUXFEMWVY?=
 =?utf-8?B?KzAxcFRJUUlEVFl0NE1NMjRYY1Bud2xwZ3Uxclc1dU9QMU9zbW9WK2VVZyt3?=
 =?utf-8?B?ZzF1dzk0dURPbGhvcktVRXhsVk5FRXJoWFVjRVNmeVJUd1IrVVNsQ25kSzV6?=
 =?utf-8?B?UmdnZ2dGY3h2SHlCRzNFODBCaDg3b0xxSGtVd1dyWmpBYlY5OWJVMWZZaEc1?=
 =?utf-8?B?V0x0eTVVU1lLWXlyUWc5MGxTaG93VEx2ZHV3WWpQYklpdDlXdVBVdHFBOXNL?=
 =?utf-8?B?WHdDOWhwaEp3ZHppb1VjRnBhNVFXZFRNVkcrSVlvaXZyR3IrNUdQQkdxNDlF?=
 =?utf-8?B?Z29PY0ZLUW5lTHZzZkIyVGY1WjY4ZU8zNTNncTVyTUhRYURZTHJRY0NFbEhK?=
 =?utf-8?B?dUtHaU9KZTMvZEc1Zi84R0pKemhJZ2d4SW9vUFBPUzJSVnpkRVhTRnFRUG1s?=
 =?utf-8?B?Y0RQNjBzZ3QwdEhxRkxhRHY4ZEZkamdmd3BUYzhBckMxbzhaOUZ4RzdxTlFo?=
 =?utf-8?B?QktISzl2V3FoUEFTcVdjWmJQb3hNS25rZXhVV1Y1Zk9ZMjBrTW1FaE9sSU5F?=
 =?utf-8?B?RnNYVUdyU2U1ZDdjS2g3RllQd0V1SWU3QmVid3B0UWxJaTRTNExVcTBMbk85?=
 =?utf-8?B?UzB0ZXQrZFBLRlVkRi85WW5DMjJLbGljeTVMekpKSHlKSUtFZmVPeE5oUTZM?=
 =?utf-8?B?V2JncGg4Uk5RV3IxaEJkcUVtTm41Q2FHZExUTTVNVFQ5S1ExNzVnT2xCWE9Y?=
 =?utf-8?B?eXpQNXB5UTh0N3VycUliQmVoeDVzM1JZNkM0U0UraVlkcWdhUVA5K1VoTTJl?=
 =?utf-8?B?dFFNRXFiNVI0UCtTZDRDeEgraUtEZGdOYytaWlBWeFNRWVVZVkJVQlM2Z3My?=
 =?utf-8?B?TldJd1pFb3VJSk9BSUhqV29GT3g3K2FZdmsrcXZmVkErMDE3VVpRYWxWQVFp?=
 =?utf-8?B?U2ZlcWNPMWl3U0h0WWgxTTNHcmpYc2FCVXZsWGhpYzNici94RVZmZmRCMHgy?=
 =?utf-8?B?ZE5HZU55aVlBNEkvRFhObXVDaG1ZMTVPMm5BNkRQOGVjOEQrWTJNaUVIbzZl?=
 =?utf-8?B?ajhsa3psVXE4UTNDOHBSSUY4VDRQa1hoWlpvbEFWVDlLeXNGM3JySTlLS3Ju?=
 =?utf-8?B?QjFRdDg0TEY5aVhFSVlMWTRTb3hERG0rWTRvTWk1S0EzeFpDSFJWYWIwcENv?=
 =?utf-8?B?MndzaFo5TGx4b0p5eGx1dDdLaTM5NHBONjE5aDdHeURXK1RkVXlPY1JVYmsr?=
 =?utf-8?B?NHlJRmdSczN0NDJYcTlmUjh3cnVMUDFrUW5rbGJKN01JNklmVlY4VEx6WFdZ?=
 =?utf-8?B?cjBSOU1oTlRscjdyVGJsUTRhSVBhVU8rZmhXM3h0QXBVUlJEOCtwMFZpTEZp?=
 =?utf-8?B?VUlpYlNLVEJZUUxpUm8vbjBDQ1hhVjFaUXNFK1NSSE44MExTVTc5ZTFjeGpJ?=
 =?utf-8?B?bWdjeWs1UXIrTkV5TE9Jdms0cWJlTnM3VHNDUzRmditqYnBaSzZmQVRUL20v?=
 =?utf-8?B?NFBVQzJSMk0wYThUMThUcFVLQnlCajJrTTRraE5OUXlCcXZUS2dxUEdQejdH?=
 =?utf-8?B?a3BvWUJQRUdqQmNTUjJEcWt0QlFEc1BBdGJsMGttQ3RielpSbHJrMFcrYVJO?=
 =?utf-8?B?SjRaOWtWWkp2TEs1WmlOZGRPSkI4TldCaE1sTnNORU5mOURBeGwrM09ML0Rs?=
 =?utf-8?B?dHZadTQ4ZVVmaEJCd0d4L2hVMDZPZ0JNWU9tTlBVTk9pSHVTM0cxZDQrNHFx?=
 =?utf-8?B?MWJNM3ZwU1BYblpiOUMzTjB4RlFxbjNUU29nVzN3N2srQUpyV2JkeFZBdXd3?=
 =?utf-8?B?Y2dQVkttbElzbzVuVFp4amdvZ1BJWjM0N2FPbHVLRXBUM3lBNTBxcGNVYmdo?=
 =?utf-8?B?ZlF4UjFDVFNTaU1ESkZkWkthU01kckdjOGNsYjJsMFMzakFWV1JGVHhwRWtK?=
 =?utf-8?B?a0pvRTFoanRRRDlrbU1hUTNzc29ZSmJjVXlHVkdWSHB2bUpETU9McXNIUEhS?=
 =?utf-8?B?WVRLREZ6WEhYNkJhQ0dvcE9Ec2ExcFJGRVZpeHhUQktiakVlajdRZmphUXhz?=
 =?utf-8?Q?nwJzG8rMoUHCu7QjCGv5fSg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b50743-0872-48b4-fe6e-08d9e1eba509
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 23:20:45.3794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M8nRhJ3gyWhTmzYNlf5EqO0E9GD1LDK4d/VCtTBKJhDxyJDENtlOE3NcOf0aeGqLa2NpiA/vNSR503h0uSyWCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5235
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 jgg@nvidia.com, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Andrew,
We're somehow new on this procedure. Are you referring to rebase this 
patch series to
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git 
<5.17-rc1 tag>?

Regards,
Alex Sierra

Alex Deucher,
Just a quick heads up. This patch series contains changes to the amdgpu 
driver which we're
planning to merge through Andrew's tree, If that's ok with you.

Regards,
Alex Sierra

On 1/27/2022 4:32 PM, Andrew Morton wrote:
> On Wed, 26 Jan 2022 21:09:39 -0600 Alex Sierra <alex.sierra@amd.com> wrote:
>
>> This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
>> owned by a device that can be mapped into CPU page tables like
>> MEMORY_DEVICE_GENERIC and can also be migrated like
>> MEMORY_DEVICE_PRIVATE.
> Some more reviewer input appears to be desirable here.
>
> I was going to tentatively add it to -mm and -next, but problems.
> 5.17-rc1's mm/migrate.c:migrate_vma_check_page() is rather different
> from the tree you patched.  Please redo, refresh and resend?
>
