Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D40AA3500C8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 14:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24516EA8D;
	Wed, 31 Mar 2021 12:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007E56EA8D;
 Wed, 31 Mar 2021 12:59:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y79zYly4IM2md+4IbMb5XOceAyXW6hGi4TF4QvdRuMoYgQDVm8dm+qN5P5lBirax40J0RObiq8VvYnl786KsS9KyeSCAh6GJrL0Ouke42tIkFl6mDIonb0SRFpeZ50/WPF3T5LkOdUdUsEcX2ofzhJMnMMLKbu0AQb1qDV/QfqtpoSMK3aDPcgwPJN1Ih2lMqn93YjAyRRzsW7LZdasgODD2XSJHuECt1XPPOMDoVt7pKydrvXL2bYATFrfxpGe6FwhW572+1x0rWdOJ1x1rJGBElx29lpR8ZxQtAwijSNPlaNdl3sGTVt2Ze2JDxGY3pAXgmuiyC+DqeIrIhBc/PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWJEySXboLipER8oMW8rutazhWLcYjjKoDiU6MlsDME=;
 b=Ae/8acdDXQYAknGwj8GFaK2kyBzf7VZVQGfvX1JnvEs6HsCRnQlvumn/RYEpwd8JtLPzJLiIwhb3VbZ+9ZL6zdDAhCOegBK/Sbq5NxZy9ZI1tFmzlSVO7pm8ASrT68zKuVC5LIG0BbKeOUpWN6Y/OvdpTPFbvj2L/xTf6Qoun4KIpmDLVEy8NUBm8TVFokX77joSbYL6SVvZAnbXonyZ/+28/hYugYDMPGDS08F72LIcX3QiNqtwt4bummOwAVmyILmAT7Iha9XsyajwYkwTgYfhibnIhGB1xcIMEqyjY0x3ibMQ3wQtWCSiWqGrlyl2vBTnK577lD8WaDmp1aHRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWJEySXboLipER8oMW8rutazhWLcYjjKoDiU6MlsDME=;
 b=Ugmbz7IrCTklLJwoA5eoZHK6YHnuvtuWXJuYNwLiRUyHd3WXcjEvv+FUjkk26X1Ie+kwAIKDSN8Cl5g3doXd7fDxkT7pIKH5bB4og6WAec5OORvT3IJbd7d1qNA5UVnjEkBEi98Z6luDOwn0IfuTZU5zPJTXV1rIcrsVrZ3Bqk0udDE88lu7m5XdaGRLKHuAUdV7IeB9ljSlO2QCfgKmytK12wRMmQ3VLv5HiegcQcjogiaSDYX8+W+feCYx72YWYmi8c+KgwKbTM1Ad813OdS2TKZHVJ+SxHMKKqJwBWmD9Zqrgx6TugycRNhqByTEs4UqIy5jOtRKw1tPEUAey0g==
Received: from MW4PR03CA0203.namprd03.prod.outlook.com (2603:10b6:303:b8::28)
 by BN6PR12MB1426.namprd12.prod.outlook.com (2603:10b6:404:22::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 12:59:35 +0000
Received: from CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::8c) by MW4PR03CA0203.outlook.office365.com
 (2603:10b6:303:b8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Wed, 31 Mar 2021 12:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT053.mail.protection.outlook.com (10.13.175.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 31 Mar 2021 12:59:33 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar
 2021 12:59:30 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v7 5/8] mm: Device exclusive memory access
Date: Wed, 31 Mar 2021 23:59:28 +1100
Message-ID: <2521635.masqiumSp9@nvdebian>
In-Reply-To: <20210330193234.GA2356281@nvidia.com>
References: <20210326000805.2518-1-apopple@nvidia.com>
 <20210326000805.2518-6-apopple@nvidia.com>
 <20210330193234.GA2356281@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c958375-292d-419d-1aaf-08d8f444d4f1
X-MS-TrafficTypeDiagnostic: BN6PR12MB1426:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1426145C4B69B1C7A5F30701DF7C9@BN6PR12MB1426.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /yvKwYVH+mNpwUO2VKY1vJN4IiRfDx6+aBXpGV4N9Y2sMvb6Eu+lLBSLTa6i74aL34bN5gVeT4BEQ2lGzwWLjJC+yueZpxqrB7W3LOVjWHgkIBfJ5NtzP9m2b9S4QoxgYoa6eAQwSaLPMuGosDMBUcu7qLKV5GFsuAhODVTRGYZUyhhz4CJeWWRh50tfEqM7YCJUno6jhkh9ZL1O839wg2XPyXKqlem/P2/1CKqgHifePrhABQE8q1CE7JwCwsbmAsG2dMYorIiWjIV4KZgblNV/U6VEBQ7cwapWWaut7182Mc0Ef6PinT++cCzf8mfI2FaYjD3q2VpRAUjDyXwulbmGmZ37jh/kyWn4MubTPyx+UJzzQCPt2uT5lMXNAqzh3H1kW/X0a/nKk4vPRRPhvd3w31vz6j0zjQ5o939jQ+SLub9lSvTJEwO9Ny9GGIopT57Rljy5AUFFiI6T24349D35hNOK4bEVRyU/vAWrORG5Yb0/4ULBqQbnPEnXXNLM9kdQu2OFa1Yo6ZITFbK21RRaQJuUp5BrMSkT3iMx8QZHDWLxYDO6B+6geeHnrHuCA3yvU1Qv5GDkxhB6LnXzvmEpaKbz1tCVNz3GK6FqEgWXLW0pzZz/gWzuK2oNMBB4laRZaggk8zg0cAzL3CUr5mlK5ngw3FSQx1weDadXz22mA5P7XRIgP/ZQUM9Xn2TT
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(36840700001)(36906005)(4326008)(54906003)(70586007)(70206006)(86362001)(316002)(8676002)(36860700001)(6636002)(33716001)(8936002)(426003)(186003)(16526019)(9576002)(336012)(26005)(6862004)(478600001)(2906002)(7416002)(9686003)(5660300002)(47076005)(82740400003)(7636003)(82310400003)(356005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 12:59:33.9340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c958375-292d-419d-1aaf-08d8f444d4f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1426
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
 jhubbard@nvidia.com, akpm@linux-foundation.org, Christoph
 Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, 31 March 2021 6:32:34 AM AEDT Jason Gunthorpe wrote:
> On Fri, Mar 26, 2021 at 11:08:02AM +1100, Alistair Popple wrote:
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 3a5705cfc891..33d11527ef77 100644
> > +++ b/mm/memory.c
> > @@ -781,6 +781,27 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct 
mm_struct *src_mm,
> >  				pte = pte_swp_mkuffd_wp(pte);
> >  			set_pte_at(src_mm, addr, src_pte, pte);
> >  		}
> > +	} else if (is_device_exclusive_entry(entry)) {
> > +		page = pfn_swap_entry_to_page(entry);
> > +
> > +		get_page(page);
> > +		rss[mm_counter(page)]++;
> > +
> > +		if (is_writable_device_exclusive_entry(entry) &&
> > +		    is_cow_mapping(vm_flags)) {
> > +			/*
> > +			 * COW mappings require pages in both
> > +			 * parent and child to be set to read.
> > +			 */
> > +			entry = make_readable_device_exclusive_entry(
> > +							swp_offset(entry));
> > +			pte = swp_entry_to_pte(entry);
> > +			if (pte_swp_soft_dirty(*src_pte))
> > +				pte = pte_swp_mksoft_dirty(pte);
> > +			if (pte_swp_uffd_wp(*src_pte))
> > +				pte = pte_swp_mkuffd_wp(pte);
> > +			set_pte_at(src_mm, addr, src_pte, pte);
> > +		}
> 
> This needs to have the same logic as we now have in
> copy_present_page(). The page *is* present and we can't copy the PTE
> value hidden in a swap entry if we can't copy the PTE normally.

You're saying we need to use copy_present_page() to make sure the split goes 
the right way for pinned pages? I guess that makes sense as the split could go 
either way at the moment but I should add a check to make sure this isn't used 
with pinned pages anyway.

 - Alistair

> The code should be shared because nobody is going to remember about
> this corner case.
> 
> Jason
> 




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
