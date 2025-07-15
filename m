Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A242B058BF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F247110E36F;
	Tue, 15 Jul 2025 11:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1037 seconds by postgrey-1.36 at gabe;
 Tue, 15 Jul 2025 11:27:17 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67D310E36F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:27:17 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bhGdt4hCnz6L5Hn;
 Tue, 15 Jul 2025 19:08:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 1EB4E140370;
 Tue, 15 Jul 2025 19:09:58 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 15 Jul
 2025 13:09:56 +0200
Date: Tue, 15 Jul 2025 12:09:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <dan.j.williams@intel.com>
CC: Xu Yilun <yilun.xu@linux.intel.com>, Alexey Kardashevskiy <aik@amd.com>,
 <kvm@vger.kernel.org>, <sumit.semwal@linaro.org>, <christian.koenig@amd.com>, 
 <pbonzini@redhat.com>, <seanjc@google.com>, <alex.williamson@redhat.com>,
 <jgg@nvidia.com>, <linux-coco@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <vivek.kasireddy@intel.com>,
 <yilun.xu@intel.com>, <linux-kernel@vger.kernel.org>, <lukas@wunner.de>,
 <yan.y.zhao@intel.com>, <daniel.vetter@ffwll.ch>, <leon@kernel.org>,
 <baolu.lu@linux.intel.com>, <zhenzhong.duan@intel.com>, <tao1.su@intel.com>,
 <linux-pci@vger.kernel.org>, <zhiw@nvidia.com>, <simona.vetter@ffwll.ch>,
 <shameerali.kolothum.thodi@huawei.com>, <aneesh.kumar@kernel.org>,
 <iommu@lists.linux.dev>, <kevin.tian@intel.com>
Subject: Re: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for
 TDISP using TSM
Message-ID: <20250715120955.00006c40@huawei.com>
In-Reply-To: <68719960cc414_1d3d10056@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <e886855f-25cc-4274-9f11-fe0e5b025284@amd.com>
 <f5958bda-838a-4ed6-84c6-fef62cd0b28f@amd.com>
 <aFvTL6MUkVZrPoBS@yilunxu-OptiPlex-7050>
 <68719960cc414_1d3d10056@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
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

On Fri, 11 Jul 2025 16:08:16 -0700
dan.j.williams@intel.com wrote:

> Xu Yilun wrote:
> > On Sat, Jun 21, 2025 at 11:07:24AM +1000, Alexey Kardashevskiy wrote:  
> > > 
> > > 
> > > On 11/6/25 11:55, Alexey Kardashevskiy wrote:  
> > > > Hi,
> > > > 
> > > > Is there a QEMU tree using this somewhere?  
> > > 
> > > Ping? Thanks,  
> > 
> > Sorry for late. I've finally got a public tree.
> > 
> > https://github.com/yiliu1765/qemu/tree/zhenzhong/devsec_tsm
> > 
> > Again, I think the changes are far from good, just work for enabling.  
> 
> At some point I want to stage a merge tree QEMU bits here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/devsec/qemu.git/ (not
> created yet)
> 
> ...unless Paolo or others in QEMU community are open to running a
> staging branch in qemu.git. At some point we need to collide all the
> QEMU POC branches, and I expect that needs to happen and show some
> success before the upstream projects start ingesting all these changes.
> 

Qemu relies heavily on gitlab infrastructure for testing - so annoying though it
is maybe we need to host the qemu tree there - possibly mirrored to
kernel.org.

Jonathan

