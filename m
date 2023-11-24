Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E17F6D24
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 08:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5327B10E776;
	Fri, 24 Nov 2023 07:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B288110E769;
 Fri, 24 Nov 2023 07:48:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EFEBDCE11EA;
 Fri, 24 Nov 2023 07:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C4BC433C7;
 Fri, 24 Nov 2023 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700812116;
 bh=wuXwn6H3IYOQTJYurH/LAKoS23w/GwU7ryzU1+Vs8b4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cgJMC0Yj3JRcUDF8O8XpdEdYA/5STjclZLwUWXfVMJwJnFCmcyrJDVup7Rscs2p84
 1lIevByzmjhiYL9n/DPGwW0r1qVsQ45xdWW1cCKjcoubJ/Np/IRSX/dXnPPAZi1lyB
 ETOprEE5xY+akdxk7DWnyVkIziLf3Nu7PWCfTmFB985JDwr0PPgc9yJ4BLOQhlh8Nx
 7J3VH6h2rRYlPJhbqQ9tIol8mM/LtKts+YBDNQd03tji9lqn5ZFKRzSp7zz5eJxPSA
 m4YJmobEWMvUVEr6S2NJRsz4v9jSzMIYOHwn/4yZmgFOE0FpvuIzzDTt4O8YISu59u
 jwN2CAG1O1gvw==
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2 0/4] eventfd: simplify signal helpers
Date: Fri, 24 Nov 2023 08:47:57 +0100
Message-ID: <20231124-traurig-halunken-6defdd66e8f2@brauner>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wuXwn6H3IYOQTJYurH/LAKoS23w/GwU7ryzU1+Vs8b4=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaQmhOr8Nb88ObVn73mvUyobyi/8m/y5yi2fL80o6/sb9
 3cTN/yd21HKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCR7iBGhq1L7YSDDTVSee+x
 X1xccNDei/91c9MuqdqsiYtj7lg17WdkWCP3faH/qkmK79OnL3ut4/Vo+e0nB564XJ5mY6ruNdX
 4JgMA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shakeel Butt <shakeelb@google.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 x86@kernel.org, Roman Gushchin <roman.gushchin@linux.dev>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, intel-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linuxppc-dev@lists.ozlabs.org,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, netdev@vger.kernel.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Nov 2023 13:48:21 +0100, Christian Brauner wrote:
> Hey everyone,
> 
> This simplifies the eventfd_signal() and eventfd_signal_mask() helpers
> significantly. They can be made void and not take any unnecessary
> arguments.
> 
> I've added a few more simplifications based on Sean's suggestion.
> 
> [...]

Applied to the vfs.misc branch of the vfs/vfs.git tree.
Patches in the vfs.misc branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.misc

[1/4] i915: make inject_virtual_interrupt() void
      https://git.kernel.org/vfs/vfs/c/858848719210
[2/4] eventfd: simplify eventfd_signal()
      https://git.kernel.org/vfs/vfs/c/ded0f31f825f
[3/4] eventfd: simplify eventfd_signal_mask()
      https://git.kernel.org/vfs/vfs/c/45ee1c990e88
[4/4] eventfd: make eventfd_signal{_mask}() void
      https://git.kernel.org/vfs/vfs/c/37d5d473e749
