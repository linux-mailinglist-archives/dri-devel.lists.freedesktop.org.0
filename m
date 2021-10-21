Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1742435B49
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177DF6EB75;
	Thu, 21 Oct 2021 07:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6A36EB75
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:04:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQFUbQRfr0jQVqKhyWfnvcmd7yZbhi/xTU4on0HM8b1qGfUqnZLMuPepjiwkPPz2yeRz3lh5lQt8KkqUcKH6YYgbSN9djlQzyfSseSQgDoVWdlssRktOhLD8YVt9YmwXCXNeoqJmrLzNHAwyzjSxKrinU0a0QuoRsHi2Uud6Gobi3m5P8xQPRw8fMViRILeG8rRMSva5vjxnblkXXpIdp5ugEJtl8dhorMum9noD+QuwR1Ns11cMTp/QyS/kqe3VxxPExbt3tHyMy66M7daVntaGINEsCjk3QhpExQ0jN9kJAkOmupYo8B2X4AhKeXd/OBaS00hBbmQrBNAVZAUPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gc32GWGH2uGdM6iRKrarig67SB7ozsW81uy/SYBUHw=;
 b=E/GuCXM2LfBlllfxS/YZQIMGd2+OE5ARjp1Azm2VkGGzGGTLnenfiXTFfT/n9Ib/FivF1nCWXs0ChMHrVbATWD6DROQd2qaw9/YUjeyLKzsPOZscdmr+p7k30yjV8FcJxFhxiQif4RitVoL5L+AuvkrNQTa0SKda53IOCy1vcxjqAslgGCmohdtBwxTY8JBIyY6rJ/VwSnhof4k5Fj77cG12FAlQC4ugXWLPyJZ++DKlU7dFB72ZeUkxWTBkTSeswfvIzAptNEu4AsIBUk2JcJJZa7NCO6c6Rc0wNtFPXThS/k9ApKNadIsKRR6nLEYQHcSt3F+l/BO98merx0CZdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gc32GWGH2uGdM6iRKrarig67SB7ozsW81uy/SYBUHw=;
 b=T3KKwh4WmGTdwXgqPkEnFFoERktbB82UXkP45C2WH+2EH7Y4Ea8S/5OILv4j8XIXAy/6wNLTu9HS+R1HqOE+qM8e4jg50DwD5mYx19yET252GOqGDaEvzjFyai8X6UfypEk8IPsZV2wA+W9OZ8An5W6W0KJv77YvnNY2fKTb+3s=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR1201MB2511.namprd12.prod.outlook.com
 (2603:10b6:300:e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 07:04:16 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.019; Thu, 21 Oct
 2021 07:04:16 +0000
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
 <20211020193702.GJ2744544@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d6dfc7d5-7c02-aea9-fc71-e0d93033c3fb@amd.com>
Date: Thu, 21 Oct 2021 09:04:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211020193702.GJ2744544@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS8PR04CA0071.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::16) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:46a4:dec3:9292:691a]
 (2a02:908:1252:fb60:46a4:dec3:9292:691a) by
 AS8PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:313::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16 via Frontend
 Transport; Thu, 21 Oct 2021 07:04:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2582edde-5261-44ce-b76f-08d99460fed7
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2511:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB2511DAC2DB5683D9C6D4086E83BF9@MWHPR1201MB2511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ukhGNmuOHmwud7ENIkk60qUrAZFhdoMpdcQGAyKmWUO7ftaVZlWORM89y1EM0Xj1Zv3s+n0ppsGR9jnpk1ivgq9Ofj+dBWSBAhvTas1oQfWAq0WZtxk7sdHiJoBrfzgMOuHMtRGzfSpc06V7hMuoUrYTDDUFbWM9mSEaonVaB8B9xlsD4MwDdqf1S8YK1icdiMVz8B7dGnmJDH2BKaO//7qG2U5axXq9rpiyeysK4WmtTnBelubcgW9GcA+oxR+ZDMKAR0oyl3oZ1bggh+j1ggXQaW7eEOhftFTmMbuiKvNWqzzDUx84HzY8bSayqC5zKTkRL1wfUdXcaBMVvmiVUCZJwuWme+Xw3hE4wJ9mwBlB5UgWHDL7IA8ADP1unIupn3TRolrmhxwgnDMKAJ8WXyFxsY+zhss2fsRRNlnvIOm5VFgBdjQ+XZFCSSakYENucUddzbwypjhB4RsELq2iVnhaVQ/Q/1q2aOj9hK97IIlS/xSLpkiPgOjwIx+6jizqpMxSiat4jJLoGO7BTXsmjRhFqex060gwXq75OY3sUxHRpA7VDu/X0ALv3F31L2IATXbJpIoNlFCcRVE7XPIoeB0jY4AAeyYpHU03B/C+IzX5aigXxRAD517cszXSvnGO/5ctYebGY6+Yvy4yyoAxAbR4JbFQh8vPwfRq26TXqnwSBGXLk1TjDNCCC3mNtdYJUBUzfpp1VwWP7Hjp6G4HK/n60bkyg9u2M2/ep1uzXa0Mro4GPHWn8k3EahMOKy2q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(508600001)(6666004)(66476007)(66556008)(66946007)(31686004)(66574015)(38100700002)(36756003)(86362001)(316002)(54906003)(2616005)(2906002)(5660300002)(186003)(6916009)(8676002)(8936002)(31696002)(4326008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWZ0L3RLL3o2TGxrN2E4YkcwNzU4OTNacDJ3b2dwOWlEMWFyWjhvYXR0V05M?=
 =?utf-8?B?YzE5OEl6Q2hKVmxVdE9RUnBzMllCNkNXUjFldllDbDUrQzE4ZmZaU0FaVnBW?=
 =?utf-8?B?QTN1bFJRQnRSQ1hHWkt2Ri9Bc3d5RmNUajhLWmJ5MHFwWmpoeUM1bEQ1UlM2?=
 =?utf-8?B?TWs0MERXb2MyRG5yd1BjQWordittR2d3K1FzK3B3RVNXb09Gc2hUcVFsczh1?=
 =?utf-8?B?eWJ4U1BhWU9HZ3ZuMDZvMVF3WE5YUkxDL1owVHdGbVNGZ2h6ejdFWWhQV1Jo?=
 =?utf-8?B?SDFOc1AzOTd2MWZkVXFsRmlLeHRsRndzaUtveDR3bVdpMTRSdm1DVFJYczRn?=
 =?utf-8?B?KzBJYjdwOForWE9JRGxqK1RvK1didERCM0RMcU9iQUdBQ1ppVHhaOWpwSnBa?=
 =?utf-8?B?TjlTcTI2RXZWR01UREhNdVlKblRwWW4zVlZLcDZ4STVpSHJFdnJyV2RpZ0hG?=
 =?utf-8?B?bzR5K0h2OXVUUlNqbFMzSFgzNXkwLzk3VjZRekIxaTBCREJ3WWdUWkV6UEQ4?=
 =?utf-8?B?U2srK0RkcCtCeVBRYXBNMHlWdmRVZTFKVVlzeW5JeFJiOE1LLy9ZM3hCR3ht?=
 =?utf-8?B?WHVCMTJmQ0I3YmIxajhsS0N5Ri9vSFg5b2VXQzNKeHErMjV2OFR4ZWZ2d01D?=
 =?utf-8?B?TUt2d3RoaGJ1bU96MXc3UDhES0NPREVtYWxJZjNYVWozbkNZMk0zRm9vK0RD?=
 =?utf-8?B?Wk5MQVBoZmlCV3pPVXdZMEhaNi9ERE9oZ25IYmczY3JXckhpM2xTektGbEx5?=
 =?utf-8?B?MFMyQngxVUkvNmo3Y2o5ZHZUQzRmQ2Vwc1NQLzd2WjY4MnRzRFBWMk1qOWh0?=
 =?utf-8?B?NzVMb1M4RTl0cCtWcTNBSm5DTEpZWEovTmhpME90Qno1T1ZIMzFyMVAzL1Vp?=
 =?utf-8?B?bkpRU05hMVdOcm5iYVFmaTZQTTZyays5Wk1Vdng0M2NtQ0lNdThwWkdJVWM1?=
 =?utf-8?B?c0xiY25jbGRJTk9RRU4zZ1FvNUV0NkJvK2tTWU1QYnNPRE0zdDJ5WjFxclhW?=
 =?utf-8?B?cVBhN0lxaFE5VnV0TjlzQ0NRS1phSk1PZkRXN1EzVEpvcW5ZK25pZWw1OUZ5?=
 =?utf-8?B?S0RqbmZVaVdFeHcxSWRLYzZsekdJUFhWM3VJM0Y1NjRwUU0vN1BtQ2ZCSkpv?=
 =?utf-8?B?NjEyNnY2cStKVjZCd00vazMxRmh2RHZQSXd5Q0VZVHhrOTdhSjMzbDNhVjhx?=
 =?utf-8?B?emI3SXZHUnRtK05nQkxvWG1EcFdKcWVLN3pHYlRIVzJ2Qm5uRkR1SHBGNmNQ?=
 =?utf-8?B?SjJ6V1diT1NGQldzY25FZzJtRDdnZnhId1pobkQ5OEs5TXdIZVdGWVBaZnF0?=
 =?utf-8?B?OGV4TzdzQ0ZHUnJSWldrdlBNV2MyVmxrbXNmaFUzcFBuWS9UbW9tckRmYmE5?=
 =?utf-8?B?VmNxZXZKUy9TbXp6U0JlMnlaVlBRdGVqZ2ZEL3M5SVBvdGh6a2tZVDJGaXNS?=
 =?utf-8?B?aGpZVmR2N3pvckFxZTdReFEyOFVNN0tNclFYYnoyeVh4MjZWZ1FZQ1lmNW04?=
 =?utf-8?B?cmtXQVZZM3BDYWFCTnE5cVFYM08vL056L3M2d2UwTWVYVlgrNFlreDFvQUIw?=
 =?utf-8?B?RFhtakwvbWhVQ3U0K1FtT3E4MU5leFFNd0pnWTJJNnBQdEE0eWROTit0ZGRs?=
 =?utf-8?B?R3RGcTdqSm1RNGp2SWFneDZDL0JEUDZoMUsrbm9QZnA2VXh3Y2FJU0x0ZUY0?=
 =?utf-8?B?bjN5WW9RZ0dEVU5mYmVYUUFVMk10aFYyZDBlVk9RLzFYUjhZTndwMTF5cEVo?=
 =?utf-8?B?Qm80SkZ6ZWlBbTFzQlRrR3V3OFRtSFR6VEIxR2llRHBqaFNrQXVKQi9oL1Fa?=
 =?utf-8?B?VHMvdXlPeCtTTENFNC9GNzBaKy9PcGF2bmd1aGlGcFpSQXFBaGdLVEMxeEJ4?=
 =?utf-8?Q?VD9OZDNEtR7D8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2582edde-5261-44ce-b76f-08d99460fed7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 07:04:16.5046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2511
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Works for me.

Am 20.10.21 um 21:37 schrieb Jason Gunthorpe:
> On Wed, Oct 20, 2021 at 08:41:24AM +0200, Christian König wrote:
>
>>> I think the patch subject needs updating to reflect that we're disabling
>>> PUD/PMDs completely.
>>> With that fixed,
> Everyone is OK with this?
>
> drm/ttm: remove ttm_bo_vm_insert_huge()
>
> The huge page functionality in TTM does not work safely because PUD and
> PMD entries do not have a special bit.
>
> get_user_pages_fast() considers any page that passed pmd_huge() as
> usable:
>
> 	if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> 		     pmd_devmap(pmd))) {
>
> And vmf_insert_pfn_pmd_prot() unconditionally sets
>
> 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
>
> eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
>
> As such gup_huge_pmd() will try to deref a struct page:
>
> 	head = try_grab_compound_head(pmd_page(orig), refs, flags);
>
> and thus crash.
>
> So, iomem cannot be installed using vmf_insert_pfn_pud/pmd_prot().
>
> Thomas further notices that the drivers are not expecting the struct page
> to be used by anything - in particular the refcount incr above will cause
> them to malfunction. This means even the struct page memory cannot be
> used.
>
> Therefore everything about this is not able to fully work correctly
> considering GUP_fast. Delete it entirely. It can return someday along with
> a proper PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.
>
> Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

