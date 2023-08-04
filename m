Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0374F770947
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 22:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E71010E10F;
	Fri,  4 Aug 2023 20:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BFA10E109;
 Fri,  4 Aug 2023 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691179351; x=1722715351;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qwDwu8huFreVjub1EcKBz79EBJRAotF34bdb6em+pXY=;
 b=Gokoi3Kggb1g3bZMEufxXQ2U2T81FV8e9c6NNtCN2Oql+LCbwo8sjdXA
 1xPuE+5ede/jee2i0o1lJMn49FbWOr4Rf7sjtQ4RgB4Lpl/15MNRiFDG2
 snugNdwP6aTty3HhLPLGGNpSfbrslN932Ma9TfqfDVrR2FxpgO4VFbbzV
 eJJ/DS1M2tgPCC73e/P39k6eEy5tGUhrV5MYl/t1lIAkB5JQhx5NY5kGJ
 c46RvJ3sKrFRkohgqaY3CI9POs3R50pGGzlJwtcn22ALYbptXHGuTIP8i
 mLVbV33Y26gLSUzafS5p7FgefNnbdSt4nR80L2lt0hzx1J2X+89jbs/eb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="370225369"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; d="scan'208";a="370225369"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 13:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="873509285"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2023 13:02:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 13:02:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 4 Aug 2023 13:02:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 4 Aug 2023 13:02:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nf0WrTDk3V6mh5FhLinU1bSYq1nLmpZn2bdmKRS6cBffRQ8eJmgH9W8x/9jjjCtxGb+lslSW+9FWHdeQ0EE9qmiHGIE4u3SP81JV5XvmVjkRjOpEdGwNoVcluWFyIY5AcT9COyRfJh89wTbX+srR0AcwW4m/P4UyWdqd0M12HLoso7IL1U4y83D+Z1WEAOwbxWyAfYMIKjadJ/8m2fl5HyWDYluiR+ji/Lv2WDfFuOZVgU8/l0d/ebpKz+x1Zvjg8qvGDCVYJKS7Fjy6D5hEcaaWaZ1cG7cQGorU1f8XMlPV7EdplcmKnwefll0fUlNVQcnV3g88FaygFQc0AlU9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AngmVS2Pv5h6L4reV09VNRtyy81G8BzSeRHiMBuNra8=;
 b=Qx8l13dhIGRlwmD9mApgcekylZVZAuIwf9RyrhoYPD72f8RizrOw+Zcx4wTBSfqz373VMjGEambUFFDvxE62HWuYBWBLyn/VE8cdzuuCUyajU5hL+CHHYGgpebYrSVVLATYmHwExkZNUTZQ5lfNi7j2zbG8e3tZTaKQqMT2ETVY3jMs/UiXuMbHlrKuocdfmKVivDHTlw++SWaFAEvGAlA7DvUfVoHMoYrjXqAxIyRu/Ws50tR5Xymt6/kblDFiQ3B0Utl5Ss1YYMZgHyA2WiDaCLtfJAXjyJ2DuUzMKqfUgbjIooqOvWOUAaXWACHxK7gjLWCtayEztWlZKhh97pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7596.namprd11.prod.outlook.com (2603:10b6:510:27e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 20:02:26 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6631.026; Fri, 4 Aug 2023
 20:02:25 +0000
Date: Fri, 4 Aug 2023 16:02:19 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Subject: Re: [Intel-xe] [PATCH v5] Documentation/gpu: Add a VM_BIND async
 draft document
Message-ID: <ZM1ZS9ZTU154Eyah@intel.com>
References: <20230715154543.13183-1-thomas.hellstrom@linux.intel.com>
 <50419f5bf1e3e5238cce2d71fd2e100cb7bc3364.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50419f5bf1e3e5238cce2d71fd2e100cb7bc3364.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7596:EE_
X-MS-Office365-Filtering-Correlation-Id: 3caa64ce-1022-4793-630a-08db9525b892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pF07+riZiSfcd7hjALmXLiBcC/ANJMsu9O8hryNpt+LJnCyi2xqJ93HsQfc2rX5ro0bupA2+G6VSG3nxTa8CDj2XDKa0m6GNqgOXG0hmyJddU82Vy7KcGdpjikbkXwFHDCq8F8WA79YwBmPJD/ev9xXCiiUtJLeA0quTNGg5YwbnTAsQ6Yoj2ohApHP2RSiHdeNcCkdP9YqHng8PoCh1kyjJY50X7ygc8khZbOAj9Eo0D8rUDLeKCADvRxQh0YyNeOK16s9V3frffBO9N+e1UJVCW6j2IrkPPz6rp6lxg/LkEORaTyjQd4ze9jAZTcnDgiq3+eDi88AkXWXZqcL5HzeLIp8LmNAGDEkqyvBZ7AtbTyLMXOOJzj0VyspwqeUPd9k5tAxBDJOPru2PJotWUkrrPfMEKnWA5RHld9eSyMz+I7vTBXkIAKM6Hbep5ClmxbxFO3xydK6BcjTnZWx3v6p3wIgLF6I/SxYrETQ7bv5GUt35SOs/lB5WVET42Tw8lnbVORWgIZCyJxLzVUp/lC5zpSvkafLNPItQY6PLnIaTCD4b9pehPRhGu51enipKVYV+FYyPAymb23OxRniq+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(376002)(39860400002)(396003)(186006)(451199021)(1800799003)(44832011)(66476007)(66946007)(66556008)(4326008)(6636002)(2906002)(66574015)(38100700002)(2616005)(82960400001)(6506007)(83380400001)(54906003)(37006003)(86362001)(6512007)(966005)(26005)(478600001)(36756003)(6486002)(6666004)(30864003)(8936002)(8676002)(6862004)(5660300002)(41300700001)(316002)(66899021);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HpEe2dMCKMUGa/8s6XWK1ckXIhM/czUagRNYo3Bb8gL1lqe9DAztVBE+H7?=
 =?iso-8859-1?Q?ds18P7j5liFGEGnB4VN/3SkMj5q7Yc1cW0JEIzihNQq/X0CVg69KZRJDSP?=
 =?iso-8859-1?Q?MG+PnRR6jnvzswQyYZk3na5viHY4wKIrCJcfNVRcmQ3b+TdPdofmgRH0H5?=
 =?iso-8859-1?Q?Uygl51h5/kqYHu22cr+WPd7c/O3FJgmdKkrz9QyxVLeBV43QNcHXyrpdQz?=
 =?iso-8859-1?Q?85XVGocaPB7CZY+HcXI/aStDg+kiqzfqHAxR983lZ3vDt9nuOECyBZ/SG5?=
 =?iso-8859-1?Q?bakKC5JTgeonYSomS4TQtHyuBlImDmvht1a/uro38lfnXNr8uDpwAQl57d?=
 =?iso-8859-1?Q?I2+GLrP9h79+aORKFMGzPEMD47MJ1cDKy351U49p1TO8taBmI6qgHxIn66?=
 =?iso-8859-1?Q?O4Ik5/4O5M8d+xHlSEMm99jfCTrqaO1FvDT1kypwcqK88rKe7LmBxujmfX?=
 =?iso-8859-1?Q?RjJ0votpS6lAJYUnjNEcGZtTmye7tTdlRKui/Bk1uPlW1hXlX7fwp3LLh4?=
 =?iso-8859-1?Q?fbcD3yAU3TO+x782sjh6E7aWrwCgKnYWhSnNTGupQS/jwIfBFdP5f/Bl+n?=
 =?iso-8859-1?Q?EBP0kId9vzYuGv2TJLRM4dWqXaoBgy4HupjZLU87fNM0KAPxWYFx1BLXYb?=
 =?iso-8859-1?Q?jkUZLjNLG8YGSpt+lECx//wm97pz/TW3UDS30/8ZRPpo49maZAQyRuiLAe?=
 =?iso-8859-1?Q?hNUiLZFD54oaIPS17xj1tApRMmCLscuROGjnkEVYHM1CfuqlMfEXE73pp4?=
 =?iso-8859-1?Q?rPZ00JfAij66q39TwIiYxjH9ehlFctmF2DuZzX6J0qkRiUc+tEQhliYSjX?=
 =?iso-8859-1?Q?L1tn0nYlrn7CaMUwD7IqzrgTziNHIxMWgLx5BR+M3yqhZNgybtOe61sU7c?=
 =?iso-8859-1?Q?1DJ5+qTJzUyZR8fYM7hIIAfSDWv+yuL2VB9lbci0TgLRufRzFxaWoQAKKX?=
 =?iso-8859-1?Q?4w8b2SMbq+CYsbgFEWCP640d7VqD7YoUPh3CDYRmjDP0X5LYtlcnRjslct?=
 =?iso-8859-1?Q?jgYoxLC2NeAw3qQV08Dg6mP12fBK6G384RQHwpPRSoxz44f9mCfNC054KV?=
 =?iso-8859-1?Q?IbJCPbhSP9K2Xft2ykpuTnuMGraDHbPgK03MlfC+I/yzNQpRTamcRV20kU?=
 =?iso-8859-1?Q?Orna2JUXxfijsUJZDFbw1GkO1vutP3+PKhFxdyRSOiJxx9iFq8GrLIEs6y?=
 =?iso-8859-1?Q?Fy/A2McfOK6q51De5Sd3ijf9Ebf5ed5qiJyUvKkVdcEbb99LadjJ27ojrI?=
 =?iso-8859-1?Q?zTU6EiQgPfMoRZTIFq8vn8wZlHV5qjx6QvP8kphXJfepw/6TrFenNsd3ex?=
 =?iso-8859-1?Q?2bYIGhY5FsvA7b/HP+z70LlvR+u+KvDObWweXmQ4GVCSN0k+yR3Y803zDP?=
 =?iso-8859-1?Q?5KB3ZYFJPFKiaRBFl3pCqq04xOC1A/E4tWrqHhg+ZOZwSkAjKVy4n3+Cu3?=
 =?iso-8859-1?Q?89iihkFmmQQKp+FYLTyN68Bmtbyolnw+c6ERsO9oJJ0SBOIDcjh3RHRONp?=
 =?iso-8859-1?Q?o7PF6vZA5mrWZXEU+mX5I934sqvk618jb/IClYCrnGuAmXVPSWPW2VcWPv?=
 =?iso-8859-1?Q?TO2OksXrE3deOvyfjt26CE/QOZmMsECCOqxnTsKEV+TFYN/w/eumXxK4GE?=
 =?iso-8859-1?Q?czR+cFsyufoOg0cAngd1WxpAGtjRSTY5FC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3caa64ce-1022-4793-630a-08db9525b892
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 20:02:24.9684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ewt6sHmQHnuyUperH2CC8KOOsvIB8y78b25Mk1v7/khhuyoLsG6+UFyjQh2y1mT3cV44Z8zO0TT+FakJpMHdmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7596
X-OriginatorOrg: intel.com
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "Dugast, Francois" <francois.dugast@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>, "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Das,
 Nirmoy" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 07:50:21PM +0000, Zanoni, Paulo R wrote:
> On Sat, 2023-07-15 at 17:45 +0200, Thomas Hellström wrote:
> > Add a motivation for and description of asynchronous VM_BIND operation
> 
> I think I may have missed some other documentation, which would explain
> some of my questions below, so please be patient with my
> misunderstandings. But here's a review from the POV of a UMD person.
> 
> 
> > 
> > v2:
> > - Fix typos (Nirmoy Das)
> > - Improve the description of a memory fence (Oak Zeng)
> > - Add a reference to the document in the Xe RFC.
> > - Add pointers to sample uAPI suggestions
> > v3:
> > - Address review comments (Danilo Krummrich)
> > - Formatting fixes
> > v4:
> > - Address typos (Francois Dugast)
> > - Explain why in-fences are not allowed for VM_BIND operations for long-
> >   running workloads (Matthew Brost)
> > v5:
> > - More typo- and style fixing
> > - Further clarify the implications of disallowing in-fences for VM_BIND
> >   operations for long-running workloads (Matthew Brost)
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >  Documentation/gpu/drm-vm-bind-async.rst | 171 ++++++++++++++++++++++++
> >  Documentation/gpu/rfc/xe.rst            |   4 +-
> >  2 files changed, 173 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/gpu/drm-vm-bind-async.rst
> > 
> > diff --git a/Documentation/gpu/drm-vm-bind-async.rst b/Documentation/gpu/drm-vm-bind-async.rst
> > new file mode 100644
> > index 000000000000..d2b02a38198a
> > --- /dev/null
> > +++ b/Documentation/gpu/drm-vm-bind-async.rst
> > @@ -0,0 +1,171 @@
> > +====================
> > +Asynchronous VM_BIND
> > +====================
> > +
> > +Nomenclature:
> > +=============
> > +
> > +* ``VRAM``: On-device memory. Sometimes referred to as device local memory.
> > +
> > +* ``gpu_vm``: A GPU address space. Typically per process, but can be shared by
> > +  multiple processes.
> > +
> > +* ``VM_BIND``: An operation or a list of operations to modify a gpu_vm using
> > +  an IOCTL. The operations include mapping and unmapping system- or
> > +  VRAM memory.
> > +
> > +* ``syncobj``: A container that abstracts synchronization objects. The
> > +  synchronization objects can be either generic, like dma-fences or
> > +  driver specific. A syncobj typically indicates the type of the
> > +  underlying synchronization object.
> > +
> > +* ``in-syncobj``: Argument to a VM_BIND IOCTL, the VM_BIND operation waits
> > +  for these before starting.
> > +
> > +* ``out-syncobj``: Argument to a VM_BIND_IOCTL, the VM_BIND operation
> > +  signals these when the bind operation is complete.
> > +
> > +* ``memory fence``: A synchronization object, different from a dma-fence.
> 
> Since you've mentioned it twice in this document already, for
> completeness would you mind also giving a definition for dma-fence in
> what it relates/contrasts to the rest of the text?

Maybe worth a link to the dma-fence doc itself?
(somehow making sphinx to point out to driver-api/dma-buf.html#dma-fences)

But the differences are written below Paulo:

> 
> 
> > +  A memory fence uses the value of a specified memory location to determine
> > +  signaled status. A memory fence can be awaited and signaled by both
> > +  the GPU and CPU. Memory fences are sometimes referred to as
> > +  user-fences, userspace-fences or gpu futexes and do not necessarily obey
> > +  the dma-fence rule of signaling within a "reasonable amount of time".
> > +  The kernel should thus avoid waiting for memory fences with locks held.

^

> > +
> > +* ``long-running workload``: A workload that may take more than the
> > +  current stipulated dma-fence maximum signal delay to complete and
> 
> Where is this delay defined? Is this the same as the gpuhang timer?

dma-fence defines it in a very "cool" way: "reasonable amount of time":
https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#dma-fences

so, in contrast, long-running workload is *anything* above that
"reasonable amount of time".

> 
> 
> > +  which therefore needs to set the gpu_vm or the GPU execution context in
> > +  a certain mode that disallows completion dma-fences.
> > +
> > +* ``exec function``: An exec function is a function that revalidates all
> > +  affected gpu_vmas, submits a GPU command batch and registers the
> > +  dma_fence representing the GPU command's activity with all affected
> > +  dma_resvs. For completeness, although not covered by this document,
> > +  it's worth mentioning that an exec function may also be the
> > +  revalidation worker that is used by some drivers in compute /
> > +  long-running mode.
> > +
> > +* ``bind context``: A context identifier used for the VM_BIND
> > +  operation. VM_BIND operations that use the same bind context can be
> > +  assumed, where it matters, to complete in order of submission. No such
> > +  assumptions can be made for VM_BIND operations using separate bind contexts.
> > +
> > +* ``UMD``: User-mode driver.
> > +
> > +* ``KMD``: Kernel-mode driver.
> > +
> > +
> > +Synchronous / Asynchronous VM_BIND operation
> > +============================================
> > +
> > +Synchronous VM_BIND
> > +___________________
> > +With Synchronous VM_BIND, the VM_BIND operations all complete before the
> > +IOCTL returns. A synchronous VM_BIND takes neither in-fences nor
> > +out-fences. Synchronous VM_BIND may block and wait for GPU operations;
> > +for example swap-in or clearing, or even previous binds.
> > +
> > +Asynchronous VM_BIND
> > +____________________
> > +Asynchronous VM_BIND accepts both in-syncobjs and out-syncobjs. While the
> > +IOCTL may return immediately, the VM_BIND operations wait for the in-syncobjs
> > +before modifying the GPU page-tables, and signal the out-syncobjs when
> > +the modification is done in the sense that the next exec function that
> > +awaits for the out-syncobjs will see the change. Errors are reported
> > +synchronously assuming that the asynchronous part of the job never errors.
> 
> There's a small degree of uncertainty here, which I think we can
> eliminate. Can you please make the text clearer? Do you mean "some
> errors will be reported synchronously but some others won't"? In what
> conditions can the async part error?

"assuming that the asynchronous part of the job ***never*** errors"

Errors are only reported synchronously.

> 
> 
> > +In low-memory situations the implementation may block, performing the
> > +VM_BIND synchronously, because there might not be enough memory
> > +immediately available for preparing the asynchronous operation.
> > +
> > +If the VM_BIND IOCTL takes a list or an array of operations as an argument,
> > +the in-syncobjs needs to signal before the first operation starts to
> > +execute, and the out-syncobjs signal after the last operation
> > +completes. Operations in the operation list can be assumed, where it
> > +matters, to complete in order.
> > +
> > +Since asynchronous VM_BIND operations may use dma-fences embedded in
> > +out-syncobjs and internally in KMD to signal bind completion,  any
> > +memory fences given as VM_BIND in-fences need to be awaited
> > +synchronously before the VM_BIND ioctl returns, since dma-fences,
> > +required to signal in a reasonable amount of time, can never be made
> > +to depend on memory fences that don't have such a restriction.
> > +
> > +To aid in supporting user-space queues, the VM_BIND may take a bind context.
> > +
> > +The purpose of an Asynchronous VM_BIND operation is for user-mode
> > +drivers to be able to pipeline interleaved gpu_vm modifications and
> > +exec functions. For long-running workloads, such pipelining of a bind
> > +operation is not allowed and any in-fences need to be awaited
> > +synchronously. The reason for this is twofold. First, any memory
> > +fences gated by a long-running workload and used as in-syncobjs for the
> > +VM_BIND operation will need to be awaited synchronously anyway (see
> > +above). Second, any dma-fences used as in-syncobjs for VM_BIND
> > +operations for long-running workloads will not allow for pipelining
> > +anyway since long-running workloads don't allow for dma-fences as
> > +out-syncobjs, so while theoretically possible the use of them is
> > +questionable and should be rejected until there is a valuable use-case.
> > +Note that this is not a limitation imposed by dma-fence rules, but
> > +rather a limitation imposed to keep KMD implementation simple. It does
> > +not affect using dma-fences as dependencies for the long-running
> > +workload itself, which is allowed by dma-fence rules, but rather for
> > +the VM_BIND operation only.
> > +
> > +Also for VM_BINDS for long-running gpu_vms the user-mode driver should typically
> > +select memory fences as out-fences since that gives greater flexibility for
> > +the kernel mode driver to inject other operations into the bind /
> > +unbind operations. Like for example inserting breakpoints into batch
> > +buffers. The workload execution can then easily be pipelined behind
> > +the bind completion using the memory out-fence as the signal condition
> > +for a GPU semaphore embedded by UMD in the workload.
> > +
> > +Multi-operation VM_BIND IOCTL error handling and interrupts
> > +===========================================================
> 
> What do you mean by multi-operation here? Is it where I pass multiple
> addresses to a single vm_bind ioctl? If yes, where is the section for
> single-operation errors? What differs between multi-operation and
> single-operation?

I don't feel that we need a single-operation mode, because if it failed
it failed by itself without dependency tracking. The problem comes only
on the multi-operation.

> 
> 
> > +
> > +The VM_BIND operations of the IOCTL may error due to lack of resources
> > +to complete and also due to interrupted waits. In both situations UMD
> 
> Earlier you talked about two classes of errors: ones that get signaled
> when the ioctl returns, and ones that happen during the "asynchronous
> part of the job". It seems here you're talking about the first. But
> then, what about the second class of errors?

there's only synchronously errors.

> 
> 
> 
> > +should preferably restart the IOCTL after taking suitable action. If
> > +UMD has over-committed a memory resource, an -ENOSPC error will be
> > +returned, and UMD may then unbind resources that are not used at the
> > +moment and restart the IOCTL. On -EINTR, UMD should simply restart the
> > +IOCTL and on -ENOMEM user-space may either attempt to free known
> > +system memory resources or abort the operation. If aborting as a
> > +result of a failed operation in a list of operations, some operations
> > +may still have completed, and to get back to a known state, user-space
> > +should therefore attempt to unbind all virtual memory regions touched
> > +by the failing IOCTL.
> > +Unbind operations are guaranteed not to cause any errors due to
> > +resource constraints.
> > +In between a failed VM_BIND IOCTL and a successful restart there may
> 
> Wait a minute, the paragraphs above just say "if things fail, try
> clearing resources and then try again". What constitutes of a
> "successful restart"? Is there some kind of state machine involved? Is
> this talking about errors after the ioctl returns? Why don't errors
> simply undo everything and leave user space in the same state as before
> the ioctl?

This is exactly the "Open:" documented below.

> 
> 
> > +be implementation defined restrictions on the use of the gpu_vm. For a
> > +description why, please see KMD implementation details under `error
> > +state saving`_.
> > +
> > +Sample uAPI implementations
> > +===========================
> > +Suggested uAPI implementations at the moment of writing can be found for
> > +the Nouveau driver `here
> > +<https://patchwork.freedesktop.org/patch/543260/?series=112994&rev=6>`_.
> > +and for the Xe driver `here
> > +<https://cgit.freedesktop.org/drm/drm-xe/diff/include/uapi/drm/xe_drm.h?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7>`_.
> > +
> > +KMD implementation details
> > +==========================
> > +
> > +Error state saving
> > +__________________
> > +Open: When the VM_BIND IOCTL returns an error, some or even parts of

     ^ Note the "Open:" here.

> > +an operation may have been completed. If the IOCTL is restarted, in
> > +order to know where to restart, the KMD can either put the gpu_vm in
> > +an error state and save one instance of the needed restart state
> > +internally. In this case, KMD needs to block further modifications of
> > +the gpu_vm state that may cause additional failures requiring a
> > +restart state save, until the error has been fully resolved. If the
> > +uAPI instead defines a pointer to a UMD allocated cookie in the IOCTL
> > +struct, it could also choose to store the restart state in that cookie.
> 
> Ok, so there is some kind of state machine here, but either I don't
> understand or it's not fully explained. This whole "restart state" part
> is confusing to me, please clarify.

It is an open that we still need to define...

> 
> 
> > +
> > +The restart state may, for example, be the number of successfully
> > +completed operations.
> > +
> > +Easiest for UMD would of course be if KMD did a full unwind on error
> > +so that no error state needs to be saved.
> 
> But does KMD do it? As a UMD person, what should I expect?\

it is an open question. I believe we should rewind all the operations
in the same ioctl. Possible? Easy? I don't know, but it would be good
to have UMD input here.

Should KMD rewind everything that succedded before the error? or
have the cookie idea and block all the further operations on that
vm unless if the cookie information is valid?

> 
> 
> > diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
> > index 2516fe141db6..0f062e1346d2 100644
> > --- a/Documentation/gpu/rfc/xe.rst
> > +++ b/Documentation/gpu/rfc/xe.rst
> > @@ -138,8 +138,8 @@ memory fences. Ideally with helper support so people don't get it wrong in all
> >  possible ways.
> >  
> >  As a key measurable result, the benefits of ASYNC VM_BIND and a discussion of
> > -various flavors, error handling and a sample API should be documented here or in
> > -a separate document pointed to by this document.
> > +various flavors, error handling and sample API suggestions are documented in
> > +Documentation/gpu/drm-vm-bind-async.rst
> >  
> >  Userptr integration and vm_bind
> >  -------------------------------
> 

While writing this answers I had to read everything again.
I agree with Danilo on ensuring we explicitly add the 'virtual'
to the gpu_vm description. And with that:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
