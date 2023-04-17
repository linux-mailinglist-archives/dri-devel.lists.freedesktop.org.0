Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 818956E4922
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 15:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FA110E4A9;
	Mon, 17 Apr 2023 13:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CD210E4A9;
 Mon, 17 Apr 2023 13:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhhyV4d13AZi9hBxZu55PrxB2nRjfTjwwFM4jXFO2s7GskpYPyEA6680kaea105jFyg4zukjzl6fGBnDNci7H7ALDslkYbfHajhQM+biKJiCBejL2hWZw30j9uR7bLrddn2FnS1UPTOKjkMlnKChzibUjscMrcjfxRG6sWGM4EPtT1G96xxXmzblF3MQL1R5uZrNeYhSPc5v2Ei0Cw5MSSWDRSLanc0BPFSIl7YMD7D6OyMJCE6y6uEBpuQjG8MGErguGJ3VJ8bYYLKeaXvhqpXF+P70OQ6KRdOZfpIFoKeXcGyaDGc4MHBeCdowmEXZSs/m/RbrQJ5bUkDCCCYnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szPw/8osvmIcdPOk8gasD/fEYrOR++nVJ3WBNv+WaTE=;
 b=PUwE8zjiqGIvhVg/xIplvvmtYTFI2S3r/2BHUbVKSjVsGkUph93hqFoHEVky/z3GiNI4aaW94YRvyyC9XlKAHDgQfA/kypBMx526eQynN6GT4SjYIkKe+0BXtnokhZWCV9VmGciwkx4yuy07keHIzpAWviwVMJBayHT3t4/+8CywB4O5SUtSOn3DPaadD8Spe7xLVJBxNMqfp5i+70HRmAhOGnX8yi0Im04L/9f6zykB4daDB48XvdcyPR9yC0eMbE6iXow6pAvkyfJDYZXka87r8G9AoDSM2UHMlZiH4pIaRkGsysRliF6pHFn25p0fOVpAe4sWUIjsqq1gOnSgiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szPw/8osvmIcdPOk8gasD/fEYrOR++nVJ3WBNv+WaTE=;
 b=FbCtql1U0Tz25xhTlr02MClN9WmaspoAetytleGAzvtvxekTVTntd4ddSvf2HWhFrHFBe6JI1Q04XgBaQByoujnwTOlZHL75WPvbeiSx9YCHsamtNeCNHkoJxa+9M6anGAg9a1FMh6Aze5RHOv52XhYkfz0MImHpQv17txGHN2Z+uGAzatrY7BXAsVRKOCWA6PFV7/FiZTAWJBFwNeklx57bI9xAkTcjzkEtldYj64T/d3/93vTJ4hnV/EBTurN+frUNlNlkXOC3v258S4SUDoIsEjcRiNamKEVSyiUrocjSclhZwNcu2pcisIe69omdQugEswQYFnW5J5xgEnKgRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Mon, 17 Apr
 2023 13:01:57 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::6045:ad97:10b7:62a2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::6045:ad97:10b7:62a2%9]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 13:01:56 +0000
Date: Mon, 17 Apr 2023 10:01:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Subject: Re: [PATCH 1/7] mm/gup: remove unused vmas parameter from
 get_user_pages()
Message-ID: <ZD1DQrSLlMn4CUZX@nvidia.com>
References: <cover.1681508038.git.lstoakes@gmail.com>
 <d40cb239d0ca01e51f7fc2a276398e8f4dedf9ff.1681508038.git.lstoakes@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d40cb239d0ca01e51f7fc2a276398e8f4dedf9ff.1681508038.git.lstoakes@gmail.com>
X-ClientProxiedBy: YT4PR01CA0409.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5390:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c63563-ad8f-47b0-91c4-08db3f43ec79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yy3nF81DcVWFFMSf7CQ8qyBdIrTpdh52FBS6FUKtLREg0m1RrLYWezUJ2gjbhZEp31E4IK0jKyH5uXYHCCUT0x20ouE9TuG0gn8uTt6tCDHo1pZatXY/IfqfoErA7WC3N6KQTzoNnsySh2QDX3+zzceEBpoyVFsyxX9XcEuec5yOreVBfzzbTJFIESPfi9JKqMURQit+/uGf5j97zgw7hgKHLtwiAxA0/GNdErdwx/VtSq7qa5RHDLKEqJ1cULGSg85tARUiLwWx60bVFO5xnyB6M01sfnnN8nEaR0TmkB19vvr3PgiW81WoSJyIGuMqMqNPELmar7HOpYVeMFargf34np+YmcnUuUbHQkhOka7eyRLnE1EKOLcjDJTyqz75P/e1qAMgteUMl6pZh8GnsbsZ6UhPb1nqsfVmC2kDtfFnrLE9vzwxPDcgxYmMWxQUk5Ft5Tx+dBLOD4CR+Umvgix2wR3VaKtMdJl/zoK6shjcSy+uqHC3/heJ5kq9o7kG9SeBjuJ6ETC2mq8sT61tuOqot2pdL9ymkxgBTK13KygCGHLK0A6sT/eOTn5kRhZF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(2616005)(2906002)(26005)(6506007)(6512007)(86362001)(6486002)(8676002)(6916009)(54906003)(4326008)(478600001)(316002)(66556008)(66946007)(66476007)(7416002)(38100700002)(41300700001)(8936002)(5660300002)(36756003)(186003)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IiiDLyEnosYn7kysTkoIkb6lsp5onG2a5s7RFiFSUQPU1f1H6ZHBOvckw3t1?=
 =?us-ascii?Q?ikBX48odIWovJx4ink9iun5tVcj3x3zt3TLw9ebfJRC3/MWcDEbj6E+o/elw?=
 =?us-ascii?Q?ioYUtAj2Z7VWCPqzvOmBBtjZPKqY8msbqqxngR5mFVYmAxJHh62ggoabeiyC?=
 =?us-ascii?Q?s9ixG56yv1xNGjPPAV3JTau2F2GQqqImxJGSaVI6LXpP9Q2yWdgUQR0HJMqH?=
 =?us-ascii?Q?u5zud9e7+pyZLeQlwelVLCYlFa9+Cey3IRkz5ybxuIvU7ndTeUrzYkRqxk4m?=
 =?us-ascii?Q?wBQp06tx7P/IPRcqLMVBYakSV9LFxNSstTAq3LShaKDjye8PMKAamtbuZaXd?=
 =?us-ascii?Q?wNretB1gWE5F7qDdmbr1XkdrdHXkmFCjWixytfbEccryzIdG8dBAIyDgdAJ6?=
 =?us-ascii?Q?rZzL+J/ft1T+B31fV7dGgyTy9cGZkBWi7VVgAWgk/OcL5IvGPiD8QgsN4Rw9?=
 =?us-ascii?Q?9Ee/htrHdR59zGp9N3rkjcBooM6tY6JKWDzGx3HuSS2VZn5o3oLIDQvPE0Yb?=
 =?us-ascii?Q?fUffRgmnIvSI82JIssV9RMLPGe7I/l1Eir/QZKpTYqeptLMpfwXpKrn97HUq?=
 =?us-ascii?Q?AxVa0u3rGXw2spp/b0UYH/6CTtV6lZ9854cZjlPtqsBb/uWF+agFIMdEs+3q?=
 =?us-ascii?Q?9PS0nruUcAhnRwKBrh4wRI5euZ3hNDdbMVvsv8YIQ2wFdJnH16VIz/TlMTG7?=
 =?us-ascii?Q?0w4HKO1jnySh2zm/dGz+xqPyADeJUIK9YCEmg3TlL93Qi/SG2ZA2WugWIwMp?=
 =?us-ascii?Q?URPIgZQUSRx+S69pR2Ghna7pXvOfNuZsIhMoc9siFYBeXQ/+OXr0NTtEwOgs?=
 =?us-ascii?Q?Q5Q5JcbuEiDp6Htd5s4hjGfnn2gufMtUbDGmcGCHjGJA7QwrI+XHp8CqjQhY?=
 =?us-ascii?Q?31FuybFh7zciZPae1d846aOfsLD7QuBM7CzvYl8cvcnykayhXjK1EVUvdZX1?=
 =?us-ascii?Q?G71pdaERLwfE9NgY2Njq+0wFdFoxtbDKveOygQOmN8A4kEnaQS9IHkkZakgR?=
 =?us-ascii?Q?V1IUyV0pmFuJwxryahKEnFy5udgyBwSg5r58V5LaDNu0hyv+Tn8RX00xFvkZ?=
 =?us-ascii?Q?4IaHiVh8PCfJnddajyTJDgHiZ0fVX4+fuJ6O1IdVFVzjztDRAwWSwu/er/zr?=
 =?us-ascii?Q?aQ6gmogySkho1hNUxbJvrEvIYn6xuC/jWFlksN9bGnohBztygTcsICqgFkUH?=
 =?us-ascii?Q?HfD5fhhEypD33Wv2fhCQe4JIjOysSvSKJM36xZSnjIK7YfRwKbnWni9vx8z5?=
 =?us-ascii?Q?fMz65LjauVqJ321gOWte4cxa9KA3a/AcYIbWQzZCXDMzD0ssHTp1/FUgXwYP?=
 =?us-ascii?Q?+YoPqvOI43omtV46vXGCrg5C9+pB/m2+VJwbodgHNJGD9uMvo8cQLfAvMQKT?=
 =?us-ascii?Q?Ao5bZpnkJcu0IESxEJKOzY+u5zHE7zmpHUZVGhkKpi5D/mDWQWfYgFptZRAW?=
 =?us-ascii?Q?5heB7a3V8DzeWD8HLIOQTudw+Zec835GBeW7jf8jcQo32NO2H7IIilRbUxqj?=
 =?us-ascii?Q?shItB5MZcONmocJdvRiwmL31aNjrwJtROM52t/oWb0+6Izn2cs80XUStvqZi?=
 =?us-ascii?Q?fNf+rBK9CzK5rw5ULwzKD2ac+RQeP4Llm7x2XYTx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c63563-ad8f-47b0-91c4-08db3f43ec79
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 13:01:56.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+0baHLvWHTdAip5gKuODZ98CnsDXYde+eVw3/kzGKTNb73pJjHUY0cRYBX8Htc0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5390
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Matthew Wilcox <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-sgx@vger.kernel.org, Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 15, 2023 at 12:27:13AM +0100, Lorenzo Stoakes wrote:
> No invocation of get_user_pages() uses the vmas parameter, so remove
> it.
> 
> The GUP API is confusing and caveated. Recent changes have done much to
> improve that, however there is more we can do. Exporting vmas is a prime
> target as the caller has to be extremely careful to preclude their use
> after the mmap_lock has expired or otherwise be left with dangling
> pointers.
> 
> Removing the vmas parameter focuses the GUP functions upon their primary
> purpose - pinning (and outputting) pages as well as performing the actions
> implied by the input flags.
> 
> This is part of a patch series aiming to remove the vmas parameter
> altogether.
> 
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  arch/x86/kernel/cpu/sgx/ioctl.c     | 2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
>  drivers/misc/sgi-gru/grufault.c     | 2 +-
>  include/linux/mm.h                  | 3 +--
>  mm/gup.c                            | 9 +++------
>  mm/gup_test.c                       | 5 ++---
>  virt/kvm/kvm_main.c                 | 4 ++--
>  7 files changed, 11 insertions(+), 16 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
