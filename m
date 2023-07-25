Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A27976270F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 00:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CF910E1BD;
	Tue, 25 Jul 2023 22:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F65010E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 22:53:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wnwdnoq4K65sOaQqrZVuwWmPS5joEeyM0ekCdU/iF6Hy1bZ4sl9rQureyKYLaYZhFQPdng7jM60gAaLvYtlJ2Cj09JncFZO9I9XShnRQJU1pcc76uo9Q6p0OC2P/EsPpXAooxohpfcKMkSMhG9ihSzPUQLRJTfZa4fapmUvxekLKOMXj7/cgUF74lnQVDBIhNcu+UMIJ9n/d+FYf5kUW/bfB8uoHK9N03axVOncqhFlBytuwEKQXEBqELZInmK6iiruIm2IGoIkOM01abOaIIqKJMOhHOQ3ysoCviQJfnCWDCLWTANxacW5WcsvY7Sz84uEm7GHRpP79CFWUYtcuvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPqDxiopXCIRH2Oo/WqX5FaqPDBIhfaFRSzT1J4ZKx4=;
 b=oYWy16468mKIuVtv2TipDOYUynFeRAf9BhUMuCRLNJTIkrJPiUhH3FRJO+ZZhovHMkixyWQBvpEZP+eJeR6poxp10u7m8ylVlm/CLAe5fcIE1Hry8H057itaP1Xgm4FIiOtAyF3IKjc0PAaW2IErtCRvNstdTAKPtOIFSVDK/M03lICDtkRpx39D7XvWrJcTP3aMhp0NBbSBCszCPp43Lg+hWRIxXJBb2rpWl/L728vLNSjvg17LPUMul1FoF7qezFK5JxuI6CqIeB8t8AVq0JcgMuDEBYxIi/Rwts/r9H9SC04eoCyZXr4bJisQeFHKtx7EaD/vD6zUHWyPM+X/Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPqDxiopXCIRH2Oo/WqX5FaqPDBIhfaFRSzT1J4ZKx4=;
 b=rZvPDHuBowwgxsZeiSA2HCpBueuClFlRLZ4VFGaybnsu5dFsomxMQttfViLPR65xxGaYhGsg5L2gvM6bcSqBg63ZSGKZyuSWO7Py3atFj1wPjcElbeNH8CgNKGIHsxkNBUYjI2ayB+zxotmwnBW3nC/dcc1aE2LEjywC/MDkpvP9CutGdB+MSFaUN6kaSxlngWPh+q3OfxtIM9WymMn/0ePnjt9WKSlDt3z5KCHHUYDdiwmzZ4x3vjPguHrsmsiJDuJRkJGgz4CJWGujW0Yox9RchT77m0m/0i9gUCBPIvgTD7MS2NpoEBCrJhVchTVz+sVi9YiFO6y3ojabSBogUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17)
 by PH0PR12MB5484.namprd12.prod.outlook.com (2603:10b6:510:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:53:16 +0000
Received: from MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::79ca:2fea:f0a2:d1e9]) by MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::79ca:2fea:f0a2:d1e9%4]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:53:16 +0000
Date: Tue, 25 Jul 2023 19:53:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMBSWxYnWLlzG3+6@nvidia.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
 <20230718082858.1570809-2-vivek.kasireddy@intel.com>
 <87jzuwlkae.fsf@nvdebian.thelocal>
 <IA0PR11MB718527A20068383829DFF6A3F83EA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL/B6yvO1bIkFRcF@nvidia.com>
 <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB7177FA18562FCED8A3171007F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR18CA0011.namprd18.prod.outlook.com
 (2603:10b6:208:23c::16) To MN0PR12MB5859.namprd12.prod.outlook.com
 (2603:10b6:208:37a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5859:EE_|PH0PR12MB5484:EE_
X-MS-Office365-Filtering-Correlation-Id: b2db42a4-521f-4ad9-cd2b-08db8d61eee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sbsLa69tIgfu9WNRD1BQMbPBXjn1BhmLol8/H8TFC7gciWXsi2NTdvG+YY9mrXRXqMQ9z7gYV6yC4hqZkMeUqRTPo1PQd2M0RvfrIBbW9Ewkh8RLV3ygFYlUNOxt5wb2PZEy2wMlMLd6loNT4qDxHNHtvcSp4IGv13R0EWkq6GgULZNMiRlnZ7Q4G/shkGGLRjisUkvMnm4A1Pw+aWM0QPLHxJhuDvoRp007Ydmapd9sgk6uRqZsiNI0UN2EiV0WWYb6HD04eC018hdihUylSkgQcxNZiNZTfN+rnNSAk/lP6k9g2209ERB11uYzpk1OoovUC7tNVUit8raiBU2zzfLBgCcyCQvgaRa3WqkpEJFT+J3eYO7Un740hGbEMlfzQ7RrBGW2Eu6hwazRYbXaWwu0yaCmij5nu1/c7CEX9OYvmOKutVsUR8E543jTzfyoQTlVw0/dGpTqrzcTG6xLoDy6UGCf/45+I5PPYMjh8C1Qzry81S1ZG2hRWIZJYnSt5Pf+VM2fB2lTa+ehQJ7GjyQFYVM1oHYnlbShMpCO4gbsy0krFM20vh4MoCkUZ6I2zrvepnJWurKNgQPHkoRgFJgGJiKyP80CAsliTgUMPOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB5859.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199021)(54906003)(6512007)(38100700002)(6486002)(478600001)(41300700001)(2616005)(5660300002)(316002)(66476007)(8936002)(8676002)(4326008)(66556008)(6916009)(66946007)(186003)(83380400001)(6506007)(26005)(86362001)(7416002)(2906002)(36756003)(15650500001)(66899021)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?InDYrcH2BQLxQh8FY+3zHbs3XRwQwTCwWcERozUSpFzX8ZUj+lX1CxLVeT3r?=
 =?us-ascii?Q?TjOvIZjr6HVdsny1cMEBknvknQXsyGS535QVE8hZYo6IgpaWtV40a84q1mk0?=
 =?us-ascii?Q?xWg1Rxm1NUcoK/ziWsSvH9II779ajN4Br/cfWUGzI9ZnpTm89ECc/a3jOaby?=
 =?us-ascii?Q?FppaDTCiPEhMg7SPZtrv0pg9A6GK5mmcoL52r2n/RyeM+rRWtO1+ygKMlDcq?=
 =?us-ascii?Q?+PEOxBZQoTfOAwJXDPnQAt+FRaigOaqvFRCWPPETilsa4VPJ8fRJ8egr3sNp?=
 =?us-ascii?Q?WBs4W+pF2JRKqWIKtV6pTuOg6hPIaC84C3fKCB7TbfMA6fvSI5Hy1I64hCcd?=
 =?us-ascii?Q?RxCs3CpH43ILUyqbAs/A5Z7QCnku+SX24oEAo8UDX0NCsEiNC5yGV6ZqGNv5?=
 =?us-ascii?Q?xF2yFBDdPz1bnxM/dJLMXAZTphw4A7WQ5jrPZvSnXyNcvB9qe4ZSYSb9gFXC?=
 =?us-ascii?Q?dGzlk6a7+2W9+g4nsRGTLH73ot2I1566YmNzjoY7dXZ6HCTkjaFe934qc7Xt?=
 =?us-ascii?Q?eQK7WrhU9d+zSDT8P8KyLE+h9gdGCKVEUNuut8WMQqkTyYbK/MrhwOkEobRt?=
 =?us-ascii?Q?CemZN1qiEqqKYeN30zWgF1AFNbDCf6Q9sRZeoUGGxUzo/ftsl/mNgdK78N0d?=
 =?us-ascii?Q?CcQRcAqjX5AZCcG6GFQM7mF0LmtWAkaRsMpV7PqH4aTZaWri/CP/1wl+qBg/?=
 =?us-ascii?Q?W5eVuTEBg5Hddm4dNX32t0Mn7365piTipCqBnPeSiR84G591U2K/Dlkm94ra?=
 =?us-ascii?Q?MSPP9FdPgjikZpuSoPV14qRUo3KpbekshKjx73AmRYmZVlYGVbsqA0dN+Osr?=
 =?us-ascii?Q?W4pVscpvs/gDDAYNXVWLlAmI3Ya+H4H2uvmVxrLJJaGKaWI02F2p+CMpQJBK?=
 =?us-ascii?Q?H0ri41s/RCxRfcbxG88p+ndt9i632COP/nC4KrT4DgwtWgaDtRGpwWIi82q3?=
 =?us-ascii?Q?LtIrWZbui0fF50zqMHVwPzVydbZWbrRSjPDIi/L9WOVe6UzfPqW4Olltmg9e?=
 =?us-ascii?Q?+yVG262OgI12g4kFT/dXbx+bEWw/+PxHO/c2mbFJtwHraMwAu6uGoe/6f3Be?=
 =?us-ascii?Q?X9TG2P0c8GDXPwdzC/+ezsTvui8gCkLGKho8oYkn2wbYZ2VwjfWIeClpPYQB?=
 =?us-ascii?Q?a/rxlna+Co50X4CyxawYRSENSwApMhVJlK3BvyFcJNOyKO6LXtMTnSuJTpEp?=
 =?us-ascii?Q?Ht4Q356AgaLEGlKDlrTq3BI1uSGI6rvTlTYpyhugnea58ahBfUA/MnK63Buv?=
 =?us-ascii?Q?Qa0TjZkYySkvp1QYuvFFSCb1EfnN/A+XiBm2y8BxEpnyI28WMl3Csglh8qj4?=
 =?us-ascii?Q?MnVwRUiETSUNplBeNO1HH1ZMZOKWWqVjRoqasWFC/3Bo0exD7rzFEAFecezT?=
 =?us-ascii?Q?AVbhgy9b6drzeicjiS6hnVFAWseB5Ri54clImz9Tr8soV2x+9OxiV0lPO6kP?=
 =?us-ascii?Q?hgvcWnAK+nX5ktqtlB1fQ45ogA8BtJPhjihw8OQFlc0gu3X+fnthtYeGH6V6?=
 =?us-ascii?Q?ZrPXyTDYwZIldGFCZXjsLtuqU0scjvb1Tph0cUeYImb2lY1G+syzcWGcIdsZ?=
 =?us-ascii?Q?uyRKMJ8+BoDvranVbmUljfsGr24c3UV4CuuY+LYq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2db42a4-521f-4ad9-cd2b-08db8d61eee1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5859.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:53:16.3796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhPC1HQ2c8kMc3wv2Nh+aPn0+B+/YdJRArtRR72Idvwp5Z0BWmlufF++RTA1agi3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5484
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>,
 Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 25, 2023 at 10:44:09PM +0000, Kasireddy, Vivek wrote:
> > If you still need the memory mapped then you re-call hmm_range_fault
> > and re-obtain it. hmm_range_fault will resolve all the races and you
> > get new pages.

> IIUC, for my udmabuf use-case, it looks like calling hmm_range_fault
> immediately after an invalidate (range notification) would preemptively fault in
> new pages before a write. The problem with that is if a read occurs on those
> new pages, then the data is incorrect as a write may not have
> happened yet.

It cannot be, if you use hmm_range_fault correctly you cannot get
corruption no matter what is done to the mmap'd memfd. If there is
otherwise it is a hmm_range_fault bug plain and simple.

> Ideally, what I am looking for is for getting new pages at the time of or after
> a write; until then, it is ok to use the old pages given my use-case.

It is wrong, if you are synchronizing the vma then you must use the
latest copy. If your use case can tolerate it then keep a 'not
present' indication for the missing pages until you actually need
them, but dmabuf doesn't really provide an API for that.

> I think the difference comes down to whether we (udmabuf driver) want to
> grab the new pages after getting notified about a PTE update because
> of a fault

Why? You still haven't explained why you want this.

If you are writing to the pages then you have to do this

If you are reading from the pages then hmm_range_fault should return
the zero page for a hole until it is written too

Jason
