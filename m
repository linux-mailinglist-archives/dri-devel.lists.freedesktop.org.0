Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249439243E
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 03:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE5C6E8A8;
	Thu, 27 May 2021 01:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633D6E8A8;
 Thu, 27 May 2021 01:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkpgaT+qDl4FMbbJ9Z3gj4isxTlskndXbEU9SzeUe4eEbMGIANNi3EHdXnNio5oZ4gPSLwjH4LqxWz/vbTAJyL1dsdO4evDwgzoaqa5HxUIK/GgucNSam2LHs56nWLzg2mevfCO3TNVlbO6MAeA76kBs8Ksq8OqOfkVh/JUU1IMdgxQaGRq8FLfpbc51SUWEkDFQxhxsX+LnH2P4cUlhq12pWsUUwgkXwHcGrhBiaUNnO3Oc/8WFaBFAZPGd8CatdWMtWO5G3tPJ3Ji6//Nu/9OkOiBl5LIh/4IXnhrfU0EeH8ErwB47hh6ekwQ46njLeU44Lo49vZVDP+cHQJE5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYmHosF1/PQ3SLR0/61RIGhUaU7vfnmIJaAYXGD1oI=;
 b=jbZDWfU3a9Rn8W93SH3JMF67/ny/1tSP93LBfpF/FDlbrP6woZvt3Olfvuu9NpFQr//rhp3gZ6Lspwfgz38KKL2lE+q5atW7QBD/NUiSJhnyYTisKdyRQZEeDZmswd7m8kXHYq9B3YagMoZjP6SMFsKni9b5aW0NtdNlcG4eoIM0/UEeWUWDfPGO9SjApU9iz4WkTbLNk56F7nVrvgvY7iDkecsOJql6gynX/J7rUYgqzvOJ2ZrNyPuyoWWJ4B+30c7IJbt8lMkSmPwNEuMqNnhEG9FO/McTwmQcOw7DmPzdLBHmG0EqcS5CRsBvoXd5ufcxtk4m28A7SGxIwgWgYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=infradead.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBYmHosF1/PQ3SLR0/61RIGhUaU7vfnmIJaAYXGD1oI=;
 b=Ddktud8CI2v/aXZD/Nj17EnB7Ea79dxal+s7aSPhm4H7S+q+tOWbnlCPXZ1pVllVdc0MgFIYsCqOc0znJKzhOWexrxcVcm+CFmdYhe7/04ppd2eBFWk2uWwgVPrw9HeD6F5cY502e+232q4HEo2Xs8gQOniItK0ylv+p+425X8TNXLR6G7bWdzEVWMJp1IpQ0ra7j1Soo6kbi+WYYykV68GIEZukSazSIKj9OzeHWZ+gvR+98kAuDD1GsgYrdyEBnzRtiUaTrZ50btgmYKT/ZbkYc1prqgybrWNwS1Xoxs0JnwdSV+y5gRN6waWC0rozA8fg3HxTpuMVjS1AC2SGJg==
Received: from CO2PR07CA0064.namprd07.prod.outlook.com (2603:10b6:100::32) by
 BN6PR12MB1266.namprd12.prod.outlook.com (2603:10b6:404:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23; Thu, 27 May 2021 01:20:42 +0000
Received: from CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:100:0:cafe::fd) by CO2PR07CA0064.outlook.office365.com
 (2603:10b6:100::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Thu, 27 May 2021 01:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT060.mail.protection.outlook.com (10.13.175.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Thu, 27 May 2021 01:20:42 +0000
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 01:20:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v9 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Date: Thu, 27 May 2021 11:20:36 +1000
Message-ID: <2005328.bFqPmhE5MS@nvdebian>
In-Reply-To: <YK6mbf967dV0ljHn@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-7-apopple@nvidia.com> <YK6mbf967dV0ljHn@t490s>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d78414e7-cfaf-4f12-cb71-08d920ada570
X-MS-TrafficTypeDiagnostic: BN6PR12MB1266:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1266E85D8FACB077FEEA288EDF239@BN6PR12MB1266.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0d7+K+vE6+9VKNGuW0TFntKbb5dmvBDIlTZp0JsTp0bmESASk4qXF9e/rJ12Qr/zO+4ky8hWe8tezexAvPdj9bhNVJJni7f09YlpmUciwFbn1h+V+BGo5jNFatjXdwBiWOvEMaTRTcZoRMg51zE50fEgQN0pbdnhuR+NuWIF3N9aSJ+l+YC19/xOQ4nAQmkYfsZMLhGQGwk5QkkzHYGj8TLIy/0ULNQpSWY9mCbHnnojySbZfhIlrGtQEHH9gTX7dYbOqNlj2Vq8tgHC9/AeUbWLwz4RdLHuLZ+oWSDO6YQtS7sd7i+x8mbYPwQ3uTiu4DcYObCNXCzrkKa/d9sSOhvcquGhvD6ohgfCNKbFHHn5DcuFoNRElcfkstxdHmvVnOj6RSruBxq3R+O/+pY3HPBDzJP58z3fHjq3fBjQuy8qL+xJZ/UmQx+EkKbfJIHM1m++4lUSr9TJBkP4bPr1ZFGyUAxMd/MhksZ8Q2ZEjmolGEKhEMwBfHb8PvbPKBepPe4soBg3NgKcTGFKkkwZueEnBpmSHqQtS+LLzLGj6XQrUbE5MMpJ2c8V5fAkfZIVTv+Ujnq6hIUpnxVKKW0a8f830TeVlj1gLEDQ83FJnQNre50uFqXvoPjdfkglzBlnmLDpkTfnIlK7UZC86tSXBfrW030ZltfV2Hba+3pYCIrYcYY/iDjPQa6qVlJ96Gr6
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(5660300002)(83380400001)(186003)(316002)(82310400003)(2906002)(36906005)(426003)(86362001)(478600001)(7416002)(26005)(4326008)(6916009)(16526019)(70586007)(54906003)(70206006)(336012)(7636003)(9576002)(33716001)(8676002)(8936002)(356005)(36860700001)(9686003)(82740400003)(47076005)(39026012);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 01:20:42.5560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d78414e7-cfaf-4f12-cb71-08d920ada570
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1266
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
 nouveau@lists.freedesktop.org, bsingharora@gmail.com, hughd@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hch@infradead.org, linux-mm@kvack.org, jglisse@redhat.com, bskeggs@redhat.com,
 jgg@nvidia.com, jhubbard@nvidia.com, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, 27 May 2021 5:50:05 AM AEST Peter Xu wrote:
> On Mon, May 24, 2021 at 11:27:21PM +1000, Alistair Popple wrote:
> > Currently if copy_nonpresent_pte() returns a non-zero value it is
> > assumed to be a swap entry which requires further processing outside the
> > loop in copy_pte_range() after dropping locks. This prevents other
> > values being returned to signal conditions such as failure which a
> > subsequent change requires.
> > 
> > Instead make copy_nonpresent_pte() return an error code if further
> > processing is required and read the value for the swap entry in the main
> > loop under the ptl.
> > 
> > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > 
> > ---
> > 
> > v9:
> > 
> > New for v9 to allow device exclusive handling to occur in
> > copy_nonpresent_pte().
> > ---
> > 
> >  mm/memory.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 2fb455c365c2..e061cfa18c11 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct
> > mm_struct *src_mm,> 
> >       if (likely(!non_swap_entry(entry))) {
> >       
> >               if (swap_duplicate(entry) < 0)
> > 
> > -                     return entry.val;
> > +                     return -EAGAIN;
> > 
> >               /* make sure dst_mm is on swapoff's mmlist. */
> >               if (unlikely(list_empty(&dst_mm->mmlist))) {
> > 
> > @@ -974,11 +974,13 @@ copy_pte_range(struct vm_area_struct *dst_vma,
> > struct vm_area_struct *src_vma,> 
> >                       continue;
> >               
> >               }
> >               if (unlikely(!pte_present(*src_pte))) {
> > 
> > -                     entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> > -                                                     dst_pte, src_pte,
> > -                                                     src_vma, addr, rss);
> > -                     if (entry.val)
> > +                     ret = copy_nonpresent_pte(dst_mm, src_mm,
> > +                                             dst_pte, src_pte,
> > +                                             src_vma, addr, rss);
> > +                     if (ret == -EAGAIN) {
> > +                             entry = pte_to_swp_entry(*src_pte);
> > 
> >                               break;
> > 
> > +                     }
> > 
> >                       progress += 8;
> >                       continue;
> >               
> >               }
> 
> Note that -EAGAIN was previously used by copy_present_page() for early cow
> use.  Here later although we check entry.val first:
> 
>         if (entry.val) {
>                 if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
>                         ret = -ENOMEM;
>                         goto out;
>                 }
>                 entry.val = 0;
>         } else if (ret) {
>                 WARN_ON_ONCE(ret != -EAGAIN);
>                 prealloc = page_copy_prealloc(src_mm, src_vma, addr);
>                 if (!prealloc)
>                         return -ENOMEM;
>                 /* We've captured and resolved the error. Reset, try again.
> */ ret = 0;
>         }
> 
> We didn't reset "ret" in entry.val case (maybe we should?). Then in the next
> round of "goto again" if "ret" is unluckily untouched, it could reach the
> 2nd if check, and I think it could cause an unexpected
> page_copy_prealloc().

Thanks, I had considered that but saw "ret" was always set either by 
copy_nonpresent_pte() or copy_present_pte(). However missed the "unlucky" case 
at the start of the loop:

	if (progress >= 32) {
		progress = 0;
		if (need_resched() ||
				spin_needbreak(src_ptl) || pin_needbreak(dst_ptl))
			break;

Looking at this again though checking different variables to figure out what 
to do outside the locks and reusing error codes seems error prone. I reused -
EAGAIN for copy_nonpresent_pte() simply because that seemed the most sensible 
error code, but I don't think that aids readability and it might be better to 
use a unique error code for each case needing extra handling.

So it might be better if I update this patch to:
1) Use unique error codes for each case requiring special handling outside the 
lock.
2) Only check "ret" to determine what to do outside locks (ie. not entry.val)
3) Document these.
4) Always reset ret after handling.

Thoughts?

 - Alistair

> --
> Peter Xu




