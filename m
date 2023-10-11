Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C747C4B31
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 09:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8511510E477;
	Wed, 11 Oct 2023 07:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93F7610E477;
 Wed, 11 Oct 2023 07:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVdAXUO6IGww4lG6Mr4XWSxeTmhv6qK+YLWqMMDDTq7SVoHfAVyVkl0B2vPVv1rDw7FoKMwVFXkFuD6opUxtTXR1p9pttMdOFabVWmyTlQ+phGQ4W6yhW/sy0JTon/IpCcTVYxVgtxbOJfs+6yGOyAzEVKCPqPYVJVSWLc/s8Q+5UMz5fq1MtZON8Iijf8sZWjllUro8P5ALL0ud8HoLSxW3mOPQn2DiZb4mmoEup9L0dW4CfAo72Be3uqR+gFFlS1zRher+Uh0EaQqUGOm5qkp1lvz41gQ6gQUUz3KOyDi8W+bxB9Bv4M89c+wUiXdhNdKPJoGvgioAvV6MdBJwfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgFKqCi2UIbu4cj9NmVvG3lT1c3jQ0od4yED2AHluxs=;
 b=GXKQnXexQHKr86/vbtrHZhsaV3shulkIi1OMdZ6urrIbnBqrYDLkVskNsqSroUDvIt6xOKUyJmEKsw332zfkAk0mGJkveQCE5L6PO3Ori6e7up8QxpqoKM8mmm5zBRfnl1soYappn09EcvhamR5ND3XQL4rrEWb0HaBFmFao74bNPFcPsnrCd7uLo3GUep7BpyqipXCdInAZvICVbu+xOvtXJJUeeWR/WncJ/hFR4exqGOp0693CDBC+i9CDqVA5PT12k2PQBqleIzPHvHiw9/DcjN1jarvtiYAI7EY9MF5sofbqmMsH/+xGE80Jmn9TyANDO1LSq2qPzt2IjD/Q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgFKqCi2UIbu4cj9NmVvG3lT1c3jQ0od4yED2AHluxs=;
 b=sqv/hjZY7K8H8YFwq76uO9YTSC442yIFatgxWf7g2D3Ta0DlBvM1HC3Ole+ESiVHv/feP1MgRASW6uo97cvs4qN2pI3Wx9CTvjL3HKyjUBNElg00KYkmT1vrlBuKBcEg4gHJ//gxoMoW4UQpfOhsnN0rYl23lorwVxjW8WnYukk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SN7PR12MB7345.namprd12.prod.outlook.com (2603:10b6:806:298::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Wed, 11 Oct
 2023 07:07:44 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6863.040; Wed, 11 Oct 2023
 07:07:44 +0000
Message-ID: <76963abd-77a1-4bbd-9537-7b230e648a90@amd.com>
Date: Wed, 11 Oct 2023 09:07:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next 2/3] drm/gpuva_mgr: generalize
 dma_resv/extobj handling and GEM validation
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <20230820215320.4187-1-dakr@redhat.com>
 <20230820215320.4187-3-dakr@redhat.com>
 <0c50ff22-0f11-1e27-c32e-694ce2b1e6c5@shipmail.org> <ZO864yp3UyVEfEjz@pollux>
 <88c45fe6-0942-707c-9ea7-8486c177fcd7@shipmail.org> <ZO9Zq2RhbX8EeHrn@pollux>
 <736b6b6d-9e04-a27d-7d60-0c45d696b304@shipmail.org>
 <ZPB26A0/oLHTmyqk@cassiopeiae>
 <a8f28d62-daec-927a-a33d-5be3eec6a1ed@shipmail.org>
 <ZPDk/lao1JlBNGoJ@cassiopeiae>
 <8a8253ae-0b85-df90-b480-64eeebfafc6d@shipmail.org>
 <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tz3o-m+8VJJ6hxWhykat0kpp1UE7dBJE3X91aHHo1Y2VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::23)
 To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SN7PR12MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: 51acd07b-2f15-439b-4b12-08dbca28c3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TDU9vEoSChpXhxYN5V7MYOBfvyIYS4XYu0aTalwAXuGtgBHUPN4tYcXHF3pjpy1CI/hfPZuIWBJCJ7kb+xyBBkKF/2Hwyt36VYKzunH8rAqn8x3bV/TJ+F+7whqKLHbtj4pLPxgGP7+u1BKPRidigHdhG4benT2A/jbualVe24LMPkn/EK812SZVbEkpFBcNT0Ah6OBk73Zm+vfnmXoMIrEJ15Wajg5N4UNf14cQM1nqWCBwnxB2+mAU7G8uXtdI+a/mWAWtdLxu1luD9WrqQqKP3v9Y4FqwZOCosQ1gcnRftvYRaRnnr19Wh4OVyjNZs/bFNb441StrN4QV8jjhnnAWl1UWSCHCXonbFxPzi3hCztdA/E/Jd0Y35fHIaYE1Vz7/46y0PB6125BFgjU2/DBRxxVdH0AMy86pdOA6toJETpbo4DGRUZv4UJ+hQawTNcYQAR/AgkcXsgTEhPMgQUlVHXrMAa0oniPaHpzXhzBpFzJQazuYkgLivHrjnO1A3gliFAMSf4vuFa4K95zIPRLwFsIs4ZP0Rz3P5F6JnQg1P3PjOVuySUyn7lWSIyMZy04j+PpJRc+b+5Tkk4GHtAFkgcfs9EydcPBsZVJ6GZMM3aZEExSVLQX/XMhPIu7MQThBq3Uy1XqdEf09SqIgUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31696002)(86362001)(38100700002)(36756003)(31686004)(6512007)(478600001)(2906002)(41300700001)(8676002)(4326008)(5660300002)(6486002)(6506007)(6666004)(8936002)(2616005)(83380400001)(66476007)(110136005)(66556008)(316002)(7416002)(66946007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElBV29scDg1WTgxUEsweTFJcTAzZmJXTTF1WFVQZFNXOFNWQ0JZeDJFV0Yz?=
 =?utf-8?B?cGsrdXRwaUxpaTYrUHBZcTFTZ3JnZjBrRUtqWTNFcnVXM0tNUjB0SHhab3hV?=
 =?utf-8?B?SGdCZjNXVlAwTS9SYTg4UUtVQWlCb2d2UnJhQmtXeFRLMko0WCtUWnhFL2JL?=
 =?utf-8?B?cVpONFFid1pySVMxdkNCK1ByNTZ1a0F6cWZhWXM0YzhsYUFoQUt0dkxrajVZ?=
 =?utf-8?B?OUxkQ0NkWUtBQjY0SGZ2RlI5ZUtoblpzMkZMUEhpMkp4RVBUZXBpa2pzdjhi?=
 =?utf-8?B?OTlyYll0TEhqOXVXVUdBMTFDSTlpa0N4bVJtVGJzdzB5ZEZTQkRra2NtOVZB?=
 =?utf-8?B?Rzg5a3kyS1JMYTlLOWp3L2N5REpZVkpuVnBOUSt6YUluK25pOFVmeTlJUith?=
 =?utf-8?B?NG5LTEZGWis2NTBFeFFwMzNRNFp1RmgzUEhrL1dBMGRRTzNwSHRSTWpCa0J4?=
 =?utf-8?B?ams0MFZ3VGRCTE9LOHoxZ2hJTHJ4NG5pZk9VWmhITDNZMitrTHhOblFBTjNl?=
 =?utf-8?B?NVBRU3lXSDNRVzhQUTFiRFdIMGlvcXBYTTBrbVQ2OE9EMVdKR25heWF0L3pB?=
 =?utf-8?B?YTcrL09xem5yNU1lb2NtWWIybEpObzRVdk1UMlZNY2hTR2F5RmFmVGo1N3d5?=
 =?utf-8?B?aFNLSlIvME5NcllXandlOFhla1laZ1NLdVBZVWJWRzZZZVZ6Z3VQOStuRkE2?=
 =?utf-8?B?Rm91QVkxUG9qaDRTdnNvQUl0SmdvTTJqZjF5ZHFNVlRCbjBTeU81ZzRodk5K?=
 =?utf-8?B?REZzalVjSTRkbzNONnZCaFkzYTBkazdKZGYrSU5YNXloRWhlNEI3TzQ5V1Z5?=
 =?utf-8?B?N1MzcTBPeC9oWEJvQS93NkNTN3FPRVBiQmgyNk54eDkzQWJjUE5UTVZmWjIr?=
 =?utf-8?B?dkJRL0xzNFdxZGlpUkJCQmF3bG9GSVN5UHFXNEFONnpUaW94bGlxU3RFcHZn?=
 =?utf-8?B?emszTWM4WldFZ29DMDI2NThTR1MvY2V4U3JvVEgzaDJrZUZUYU0xK0cveC9m?=
 =?utf-8?B?WEtyZm15Z0hJck9VOEwzSC9MOHV3T0l0N09IaFREZmZTcjhsNDVDS1lZbWFa?=
 =?utf-8?B?eFM3SW4xVzNOZzBXaElheHBwdC9iU3lBS1k2bTl5d25BdWdaVWNFVkdETjlT?=
 =?utf-8?B?cXJKQ2xBQTNaWkNzYjVBNmxxMVl2YWJZUHVwM1h2Vm80VExGVDhnWGJ4YU5B?=
 =?utf-8?B?a01oSlZBUFY2MVFvZVQ4czdkaHBSbmZhMDY0ZUFHcGdaTlJoQnJOSkJZTTFx?=
 =?utf-8?B?Y1ZRNmEweE5OOHd4Mnl2MVlsemhLZ3hUSzU1WURhTHNlSUhxaFcxZ0krUlZz?=
 =?utf-8?B?bUxxWFFOeVJRRHF1b0U0cEgzTG10QTNTTjAweWptZktqVjFOUXdFTENzcWh2?=
 =?utf-8?B?cmdpZFZoWWJ1WEpWRkVUcTZHcHdwd2dSNS9FOGJRTnBQdUduZldQa1pjUmsv?=
 =?utf-8?B?NnI1eTlBSE93WXRsL2VVTzNUbkFTUmFKUytzdFJ1UnM2UFAwbFpURUtNWUE0?=
 =?utf-8?B?Q1pHVXYyeWNOR0dNcmlVN1d2T1NxMFhUL2tid3ovNURsSkhDNTJmenhPQUNq?=
 =?utf-8?B?SlRTdFZXeWpQNjZhS1VORHBPUWQrVXF4RW9DUlI4aW50QktyNkVZakVVZ3di?=
 =?utf-8?B?MXNpVTgrM2U1RDVCd1NCMUVpUUY0RStwOE0zWS83NHpzc2VlbzhvemdRaE45?=
 =?utf-8?B?Ym5sWnFKK210RnNXMFF2WmJEeDhTUk5FZzVXRVpOQzcySDFmaEpPVUpFeGZQ?=
 =?utf-8?B?UHNHQ0szRFZneUl6ZE84L0NQWXRHOTVUckszZm1tT1llWTlqSjRKMVBSdTAv?=
 =?utf-8?B?dDdZUVZZTTlad3lSRW13anF5REVja1ozZjRZQ0xndzloYVdIT3JzbzZ4L2xV?=
 =?utf-8?B?WFJlZWtBTkh0TDdQbzFtRXc2by9nM1VEWHpIREIyMWlsZXR2MjczdVBrSlha?=
 =?utf-8?B?OTlQYjVYT2ZqbERETjBuUXdoZ051dEhGT016R2pXY3F2aDhmdWJVcGt3cFEr?=
 =?utf-8?B?MDNWUWoyZTVmcU1lZU1YZmtJRUUrYkFYMUlKN25GNjVWVE9WNEd3ckttY3Vv?=
 =?utf-8?B?R2xsek4zc2g0akFvcmNEbDRic2NnZm1yMWptU2phWG1Gek5aVFNnajFaSnI5?=
 =?utf-8?Q?aCVXlhIOB0TQBrgGw+Fq2T689?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51acd07b-2f15-439b-4b12-08dbca28c3e6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 07:07:44.0307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmFo+dEfiINTvvdJNPqEPuL7P1iPgzrkCwa0/MWpc/DbUIhWmHXSIKsC2i5Is3Nl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7345
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, boris.brezillon@collabora.com,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 faith.ekstrand@collabora.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.10.23 um 22:23 schrieb Dave Airlie:
>> I think we're then optimizing for different scenarios. Our compute
>> driver will use mostly external objects only, and if shared, I don't
>> forsee them bound to many VMs. What saves us currently here is that in
>> compute mode we only really traverse the extobj list after a preempt
>> fence wait, or when a vm is using a new context for the first time. So
>> vm's extobj list is pretty large. Each bo's vma list will typically be
>> pretty small.
> Can I ask why we are optimising for this userspace, this seems
> incredibly broken.
>
> We've has this sort of problem in the past with Intel letting the tail
> wag the horse, does anyone remember optimising relocations for a
> userspace that didn't actually need to use relocations?
>
> We need to ask why this userspace is doing this, can we get some
> pointers to it? compute driver should have no reason to use mostly
> external objects, the OpenCL and level0 APIs should be good enough to
> figure this out.

Well that is pretty normal use case, AMD works the same way.

In a multi GPU compute stack you have mostly all the data shared between 
different hardware devices.

As I said before looking at just the Vulcan use case is not a good idea 
at all.

Christian.

>
> Dave.

