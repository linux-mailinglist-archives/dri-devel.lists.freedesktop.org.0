Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF6E27A81A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4B36E301;
	Mon, 28 Sep 2020 07:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311AD6ECA4;
 Fri, 25 Sep 2020 12:03:48 +0000 (UTC)
Received: from HKMAIL102.nvidia.com (Not Verified[10.18.92.9]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6ddb710000>; Fri, 25 Sep 2020 19:58:41 +0800
Received: from HKMAIL104.nvidia.com (10.18.16.13) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 11:58:37 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.51) by
 HKMAIL104.nvidia.com (10.18.16.13) with Microsoft SMTP Server (TLS)
 id
 15.0.1473.3 via Frontend Transport; Fri, 25 Sep 2020 11:58:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlzDhE2CpEFR5UvMwx36aDOIi8nVK1CJQ+3s+5S/ZeslJRzDEf77mLg7u1W6eMIBP692JvubWExDT4R5A622dAYa6IUW/v34epl+XJC0Jc28LSQ+A8KK0Y/EJ0CWeeKoIsQKvGGO8kNWwHNWc8FESTY1f7VPdHspT0Vb84wnVzkd0pBz82mWoQ0h8BjAYpbhBMpzmNJP1FR4TRG3va55fN2+o9dggqqyiG2EEJNs1HG42+R1aWbkREuTCqqu4g+rIRsQcsME6769pQUyLR+1d/kTiSGY9KI4JHTcBRjQOS9YIxaVsiyEu8ZnCO/2nkLsKnCk4k6/o4tIbdqHgY3rGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9MYxayAQMlbYSUtc6MXr0ErFpGIN/sIC/TquzhapA0=;
 b=Ss4o6zXfwfTmWOLuTukOd2vjQsAav5B4QFY5AoYQju2RNDSeHW8NPc9Pwrnb9y/0ceYr3nMgyf+95S5TyCORcm8ayy0l4ahmEzb29IzO4zVNi2AMsiu4iTZaOOZV2HCzRHMAAcqhlnhkQ2wLw4Vi/+xr1CtzmG8+uv6GJFAlHt1lvjzCiwmSAxhMnECed3JUx55RTznX+NKmt3y+Oi31Q/+WXxjbzcM9cuB0g/excOXIcyaqjWvQ8kAxZK/3mqjc9yMocBJts5ehQtpTAVFxd1iyTvMeJ/Pux+m0acU5kjaOxtWsyiBvTeBWuNrQi50MaE87wmLE9b+vX39SbFXtBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=nvidia.com; 
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB2485.namprd12.prod.outlook.com (2603:10b6:4:bb::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Fri, 25 Sep
 2020 11:58:35 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 11:58:35 +0000
Date: Fri, 25 Sep 2020 08:58:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH rdma-next v3 1/2] lib/scatterlist: Add
 support in dynamic allocation of SG table from pages
Message-ID: <20200925115833.GZ9475@nvidia.com>
References: <20200922083958.2150803-1-leon@kernel.org>
 <20200922083958.2150803-2-leon@kernel.org>
 <118a03ef-d160-e202-81cc-16c9c39359fc@linux.intel.com>
 <20200925071330.GA2280698@unreal>
 <adff5752-582c-2065-89e2-924ef732911a@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <adff5752-582c-2065-89e2-924ef732911a@linux.intel.com>
X-Originating-IP: [156.34.48.30]
X-ClientProxiedBy: BL1PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:208:256::31) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 BL1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:208:256::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.14 via Frontend
 Transport; Fri, 25 Sep 2020 11:58:35 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kLmMz-000nQL-L0; Fri, 25 Sep 2020 08:58:33 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcf473df-5ed4-4e72-f637-08d8614a54cc
X-MS-TrafficTypeDiagnostic: DM5PR12MB2485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2485C89862DB531E934930C8C2360@DM5PR12MB2485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMV9LxU4FhJo3IJUVpgvPqcdEchPAJA70JaUfKLK4k1NGWSTlTy43Afs28aoX7j3IQjozRAs97nTVNtrwnK5RU38ak7Ts0k7FwbOjxBc3DjE90X0GXeGXDM+/IsC43pV3ET+rGknb/Iv5+VcolaY6lL18M3FaIusR6aH/HqPe1WjdQ2MH8iUPHNiphNXo+6XugRc/nf1TrqdNWZBeZb8Y4TTpeuURugtBQBWL6pjp0Zt6PNuptXX3c8jmC5AY9WpfGzg7bCQz2LNQqaSllTuAKzIzDy8FkH62cPcgoAoww47m1gIzBPwEM1oi0e5N6JQGcg4kEG0BUt/QAR51gR8jguFW5tKD7yykhaUBsGR0u0kEZa98oexnVMGpMVTQJnl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(66946007)(66556008)(186003)(54906003)(2906002)(1076003)(26005)(53546011)(316002)(86362001)(33656002)(5660300002)(36756003)(7416002)(9786002)(9746002)(6916009)(478600001)(2616005)(66476007)(8676002)(4326008)(107886003)(8936002)(426003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: e1pQNxeP/TLN76OdKBdfxJXBFLssCjTtnS2Sg+COpOc5a/oKkkEmd1WpC9AR2QE/tKIFAvYilsGWgPvMKb+Q1zcagbV1h/O7BgBBH2AUkDWywKirbJ5Ek4y0PCvSeU123qF9hfbUkGyMv4lw/Pp69XIHitctjcnxWH7v5jH87hb/7GRzD1uEQTbsRitWzQxVAJg2MkYhkrmtbwZ3Qk1FV2bOjlpFS5gemOYM9yFj1YGowaUqzXLB8YU7MQB2S18e60oAcVWpEc9ss2+eqvKLePcHlwMjKifkh8CoPsVowtEEetSJestHd5j7Ge0O+uwvbOoD8k8zmCKJw/YVsb+uUtbgcj2EwXfyYgkoOgcwJm+AHD2kTOgZnQB0rxVeKdBrP3QuFN0pJywahgHGIpHEGV4MPXs+9NQs6wxSZrxSTj0er4gs5fDUd1XsnPq/oQ6SkZwJfoQz/cx1/l8X/AEhf8eRBsXebWOjA+P+XEHwAcILC2HjObNXbye3TRrrPOVY9tJmE2MQhltYA7M3kM8ANTx4LAokYt8ZatMqGQKooHaRN700v2ySGU5omELT5iG20ZpzMnlri5IplYPCAAOaEvTfviDs1gDAQtImDpGiupDlarCqaOVp45WKXgpEETnHCYJ1sXhh02MO/ea1bxK/8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf473df-5ed4-4e72-f637-08d8614a54cc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 11:58:35.2696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7iCdokvHLeK1A+yiFj3KUn+HddJZG/boTZlaxhSMLJoc/U9cAJtVN/5jaPdOTmV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2485
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601035121; bh=i9MYxayAQMlbYSUtc6MXr0ErFpGIN/sIC/TquzhapA0=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:
 Authentication-Results:Date:From:To:CC:Subject:Message-ID:
 References:Content-Type:Content-Disposition:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
 X-MS-Office365-Filtering-Correlation-Id:X-MS-TrafficTypeDiagnostic:
 X-MS-Exchange-Transport-Forked:X-Microsoft-Antispam-PRVS:
 X-MS-Oob-TLC-OOBClassifiers:X-MS-Exchange-SenderADCheck:
 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
 X-Forefront-Antispam-Report:X-MS-Exchange-AntiSpam-MessageData:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
 X-MS-Exchange-CrossTenant-UserPrincipalName:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=UBU7RbJGc72g5nCst20RcXOTriUU+oCCDckomH4l7d67cf1gNfCg0h6Dd9KYzRDUS
 sKgShT2YOL3yJfyXHrIXOqFDqqDKbi9PZAd5zzB3M5DoCpSXxWGYgD7O6NYjkrE5ya
 w8V/kJ4iX0rcRh+OVcJQM6bDrZdFQHr5XB0z5ZrHZl/geDsCLk/uXlQydLeCZjtKW9
 hjDQPYQZP/dH/N8BbbusUwVCVV4ZptczESC4NoSnHMcX850PkScP+IsLMsgBNnq7XT
 1h7EJOUPDC2GbzDuLcCZsjgJIlFOJg5ESgdBMccxUmY5vMm/s2WuuWjBp36ZGA0IYt
 odRFDPnap/PHw==
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, Maor Gottlieb <maorg@mellanox.com>,
 David Airlie <airlied@linux.ie>, Doug Ledford <dledford@redhat.com>, VMware
 Graphics <linux-graphics-maintainer@vmware.com>,
 Maor Gottlieb <maorg@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 12:41:29PM +0100, Tvrtko Ursulin wrote:
> 
> On 25/09/2020 08:13, Leon Romanovsky wrote:
> > On Thu, Sep 24, 2020 at 09:21:20AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 22/09/2020 09:39, Leon Romanovsky wrote:
> > > > From: Maor Gottlieb <maorg@mellanox.com>
> > > > 
> > > > Extend __sg_alloc_table_from_pages to support dynamic allocation of
> > > > SG table from pages. It should be used by drivers that can't supply
> > > > all the pages at one time.
> > > > 
> > > > This function returns the last populated SGE in the table. Users should
> > > > pass it as an argument to the function from the second call and forward.
> > > > As before, nents will be equal to the number of populated SGEs (chunks).
> > > 
> > > So it's appending and growing the "list", did I get that right? Sounds handy
> > > indeed. Some comments/questions below.
> > 
> > Yes, we (RDMA) use this function to chain contiguous pages.
> 
> I will eveluate if i915 could start using it. We have some loops which build
> page by page and coalesce.

Christoph H doesn't like it, but if there are enough cases we should
really have a pin_user_pages_to_sg() rather than open code this all
over the place.

With THP the chance of getting a coalescing SG is much higher, and
everything is more efficient with larger SGEs.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
