Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C613034F139
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 20:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552936E953;
	Tue, 30 Mar 2021 18:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 323226E952;
 Tue, 30 Mar 2021 18:49:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+U6drQHtbMEQ/HJI4BC0BhJQa3j/EFrQVkH+sXvVWIh4JvLsp40Rsd3L3Jew9nGVsz3BGNESdeCfbzz/dubPTXuMelUTi+MlcZUizcVWyBgis1BeS5vdjx1oLFS23P9T0uERX6JEwd6Czp4wbf3QmF6qT4pElFvfKortS0JrHFHJ+Tmb/yPj+8JiP5tOALvQzpYvmrSVECqfoFjvHBPZ8mHHlxrDjh2VIADFW7+cua5ejRHQ2Wp5JTvaE7b5hcbTw3duttOK0UH9nmF1YtSL+zgcS1gspilxqc7/1aA3s/hGCAc/a9c5ZQAuNrGRcIvMnVtrbpfz3Gf8FOYXuJCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5udlLvxI3MP/gf/TKC3f2iE+jHjQJnkwGLN47dqGSaM=;
 b=WX0vugPxKz4Grbj/msRtAEH2lwYCPGgOw0t1f/2gF2PgOCft+0PpI7iqcr1GEC92z2lX1TJlwT71xYsUMHqyJB5fzvuZvtYALJu6uFa2rCTcj4Hkf+wb0Q2ooUnEkrHRWFdEUHA0R6w8cEX/jEzyHNVHhb1ptpzxITt/Dn9X/gs5f7uvz+Xf+JJ7xdygWmrMXZTwlhbcq/Q7yBtvIN/DSFn4QDMfr6tFMIaxJBrPZyxgvn5zoRu7bYhJy90mFERapF49KwgieIDEQPjZquE1hs3k54qEGGozIu1SzhajUCzvDOmpAJFvTVsFn9byn5BMo1G6TeB/es2GlmgCE4e7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5udlLvxI3MP/gf/TKC3f2iE+jHjQJnkwGLN47dqGSaM=;
 b=Q+DqdgUUJ9U/gOeoJSFLB0wMV3W3Ah4PeVzXwbJql1/BpW2yWWZuLzJkVSp7O8jBrqG6HIcb0M6DEhOtWM7jKgjPdh3gv8DeB9wDjzVjhGJOg1MpGYNGbbTFossFbjrBlQ1WPDGdh0oQteE7xDmaVKj6Y8R82z9Hf1WBKPuJTXZfUXoytGifStP+NirsFdoYznFzK8yjVC98biyX6peWOOKx15XGdsV38mZwmd2QBYSkpsV5spLLPjErxSusswRHnV+vz+5leQOe24HPoa3uwiozwES71Pgnypxh28sL+XqZEtI4ISInB+HhppTI+vdJcy9zalzYHjGq6t0smcr1Nw==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR1201MB0202.namprd12.prod.outlook.com (2603:10b6:4:4d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 18:49:05 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 18:49:05 +0000
Date: Tue, 30 Mar 2021 15:49:03 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v7 3/8] mm/rmap: Split try_to_munlock from try_to_unmap
Message-ID: <20210330184903.GZ2356281@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-4-apopple@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20210326000805.2518-4-apopple@nvidia.com>
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BLAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:208:32b::6) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BLAPR03CA0001.namprd03.prod.outlook.com (2603:10b6:208:32b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 18:49:05 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lRJQF-0060Fl-7p; Tue, 30 Mar 2021 15:49:03 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc46dc5e-64cc-437c-a3f7-08d8f3ac7e4d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0202:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0202AE498E86E7219E1202A6C27D9@DM5PR1201MB0202.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJyR4MJv/43JkMYSUrm56Jv9u4vd0aIPwBRDnCLdDsdGUJP0oC+EKRbwxp04/HcQyAM1nWtxKcD2u0Rah41MxXDWZSine6PnNv0FM8rz4o9v+6fhdGppWuejrRxhbgl/MfXEhCaA0QZDZ0NdUZUKyeYjq3lWK/D/pFumJ+dLFSy5n6fCG5MxCweh7pBC3WMppRsAr5duv9fdEkKs4yv1jNnsA9g3M3e/7Fh+eEcffwaLHwDU+u3jEFm2Qg+j3NT6ai0sRT1QKsyDS/9ylxq1/64OFq8GGVh9dwnQbwrBnuSGfB4jLEv30FFg/EDelD4ykvJgy9fxcfU2LB3D+V7/zy9b43QXEMJOtMCaAgMxxMyaWEQm8NnTQ5lnYjI3JKJm/xKM48xXKzqMmrP7i5s7W82Ipd/KqL/lBWziycyMPWaE1Ae/hLNLS4q8mkbSj93dXj+cjzyjK3LHE6T83C9U+RrfuBDrXdRkE4NO5fFKixycxGVrzf6yPGoU56qQySjEJ5iB2UxXFA8zvRLm4u3QL/6tCNNGKlfPLgpVUcsvpVgFroFKXRi+I1NVUp4WuDZT9z8Mu2fVPPf8lV5RNpqoYFJKUs6ubXnVpaxCYv2hUpW252WYRL8p52J29YnJl9OMO20EJ5ID2VWWTNY3xmvrCssD2qTbP+VrkSNq8SSBH8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(33656002)(7416002)(86362001)(316002)(9746002)(8676002)(2906002)(8936002)(9786002)(6636002)(478600001)(36756003)(426003)(5660300002)(38100700001)(1076003)(6862004)(2616005)(83380400001)(66556008)(37006003)(66476007)(186003)(66946007)(26005)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wCbIMzJSgjSgNyBI/DcLzb2kD/Wr0yvpM5L+NHvfR9gn3ajdDqgtqigzmd+z?=
 =?us-ascii?Q?qUwQpm5TKdc54g/mWN+aZXFohgvdMSUJ8YsEd/oKyKuOJvOW1MMQqC+asH4b?=
 =?us-ascii?Q?IwOCMPTVP4PT6OzTTzsGgIOxw6zsoISMu0/vfy75hbJ+HC/0V/k7IJqnDHUg?=
 =?us-ascii?Q?PW9PrykxgnpUbHY/MIoIx3z2y6W0OMlt72l2cvDTHnY/duQwzTN6XJRoRULS?=
 =?us-ascii?Q?a7AxDNX+a9TSW+o+tPhNwkYM1oqRyXfoZl2QmCkb342xdjIdtDd6MZHdGl3R?=
 =?us-ascii?Q?iVM9FNs5rkV6aRLgQ5MrjU8i4ckehjHAJdpowYazigC3Je5SJPp6GTap3iiv?=
 =?us-ascii?Q?QAx1h8OEIGMk4Zczh/JTzVp/hP1XuulasLyUjVLMMCw775Pnw9Yb+WDAhhgM?=
 =?us-ascii?Q?vx8J8Cg1YW5LeT54C+nLPTpWoWG2TIrCrVRCw1903enbi+hhk15TjVHllMlD?=
 =?us-ascii?Q?QMvfPjzQM2SQRIqBfZViy48a+V9lRQd3mA+HLuotyp/GobR1PSiw1N3AUqrh?=
 =?us-ascii?Q?Ey0c1ZGG2TOjYyzDbwtVEsHNSRdHY9ml7cexyZXOlN8wZ093DBYbLkJPajMk?=
 =?us-ascii?Q?UDVu9dN7aI00QvucN9u62Y/Xg8+ksABbiiRBGSJJ0Jy8sNZizp0347Hk0EZN?=
 =?us-ascii?Q?w39165XXB0jYRmfURTETNvqcIU5D0i+aYwZOEgc4UoiU91SrpiomcuvfpWqr?=
 =?us-ascii?Q?y32Po9LA/XA9E9JQ+JvXWYDAYBwB75rf+HhlK5I6rs5AEdbffXZK1rnmHA+D?=
 =?us-ascii?Q?3ACFYWVs0a0CStrCArb9UyromsEtDGRy/LmBT6Z7ZOF5+2kFS+p2VTOMVmeK?=
 =?us-ascii?Q?OK/CxPq40FvB4DFStQrX8Q3VJLZfM3G2YNsaMSdERA+lP1fE2pvTxje0qJ3R?=
 =?us-ascii?Q?0+wiuvO5saEA9klSPqQOuiMyCnoGwvb6U8NTCkFUvFo/l41ZB2HWprn5QRJQ?=
 =?us-ascii?Q?FoOlERgWdMKgVKMBLKvcTGee59FCFcEoXuHPr94JgIF6O0jzinFepoZPcrR8?=
 =?us-ascii?Q?K1PSJllC2anyCaClwE3Au8FEi0M5z4iscMQBd9+BrdOB7LlWduZhL6rcPXcZ?=
 =?us-ascii?Q?pwvQ1QMWczZLQ1Z3y0PvuEYUAdjTr1G+kjIAalVOJiDm9ZtfJPurBDj/z8b4?=
 =?us-ascii?Q?woqbpuIu3goRty1XooBtuT0XjydXLuIeBB9HQOGiSXN2n2cNv4n0EHQtCgin?=
 =?us-ascii?Q?LCy1MqMxj0CklN5Z7eCfxYgTQB7kgzYhH3q5JMwxzeeOuoFxi4g1PHaO6sUy?=
 =?us-ascii?Q?BJHlMs4mQ2Vy7PF6Tv/cz5u/OiYwN7fmNfdVHbSCXB8k9xrS5bZX9JNSD7yj?=
 =?us-ascii?Q?FY6LWHWTp8ao++JP+jKWEw/yG1X7dZIDREZaslWBORqoyw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc46dc5e-64cc-437c-a3f7-08d8f3ac7e4d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 18:49:05.8343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w+aDCrGDzh211idVdYY+Q5UWcUbAllLwASWx4KxgVAI518B8dRkEQ2MouwyvEb91
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0202
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 11:08:00AM +1100, Alistair Popple wrote:

> +static bool try_to_munlock_one(struct page *page, struct vm_area_struct *vma,
> +		     unsigned long address, void *arg)
> +{

Is this function name right?

> +	struct page_vma_mapped_walk pvmw = {
> +		.page = page,
> +		.vma = vma,
> +		.address = address,
> +	};
> +
> +	/* munlock has nothing to gain from examining un-locked vmas */
> +	if (!(vma->vm_flags & VM_LOCKED))
> +		return true;
> +
> +	while (page_vma_mapped_walk(&pvmw)) {
> +		/* PTE-mapped THP are never mlocked */
> +		if (!PageTransCompound(page)) {
> +			/*
> +			 * Holding pte lock, we do *not* need
> +			 * mmap_lock here
> +			 */
> +			mlock_vma_page(page);

Because the only action this function seems to take is to call
*mlock*_vma_page()

> +		}
> +		page_vma_mapped_walk_done(&pvmw);
> +
> +		/* found a mlocked page, no point continuing munlock check */
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  /**
>   * try_to_munlock - try to munlock a page
>   * @page: the page to be munlocked
> @@ -1796,8 +1821,7 @@ bool try_to_unmap(struct page *page, enum ttu_flags flags)
>  void try_to_munlock(struct page *page)
>  {

But this is also called try_to_munlock ??

/**
 * try_to_munlock - try to munlock a page
 * @page: the page to be munlocked
 *
 * Called from munlock code.  Checks all of the VMAs mapping the page
 * to make sure nobody else has this page mlocked. The page will be
 * returned with PG_mlocked cleared if no other vmas have it mlocked.
 */

So what clears PG_mlocked on this call path?

Something needs attention here..

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
