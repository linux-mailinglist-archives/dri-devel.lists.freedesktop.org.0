Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F577751E3F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 12:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A24F10E666;
	Thu, 13 Jul 2023 10:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B70910E666;
 Thu, 13 Jul 2023 10:06:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8455C601C6;
 Thu, 13 Jul 2023 10:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6875C433C8;
 Thu, 13 Jul 2023 10:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689242764;
 bh=uxBF/65cfGgFc9NUZsYBWMo4c7yjkoqCGF6QeEUJdAY=;
 h=From:Subject:Date:To:Cc:From;
 b=fMIucUY7GArhLgcLDCFIQxCyAzXRgRPE8TkbNnY5GyU1HBPhbd5464W8Yg6jjQ1lL
 m6CWFlXeaqd10iV8ptWkOllE56aJPowyXSs5WiPty1Qsblb5rDh7+XYZZkXkukuQUD
 2oiaMlw7C0sww3ot9gyUkCaU1j297MtNOoU25HevXc+ptbrPhHq2Zk21bLHu2o2olV
 KM6Bl/kUQtYvAIUPH+MSd/KGQP+HX58eb57Amnb444A4mU/RQ41PTUTV2bTgUUDM37
 0Ncnb1LvDeYFhV3bcDM22YynZx1G+N6CQHl4PYcq4tdmwsqnstpRPCpNQMucQad6SH
 v0+dq9gbDJkNg==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH 0/2] eventfd: simplify signal helpers
Date: Thu, 13 Jul 2023 12:05:36 +0200
Message-Id: <20230713-vfs-eventfd-signal-v1-0-7fda6c5d212b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHDMr2QC/x3MwQrCMAyA4VcZORtpN9jAVxEPaZtuAY3SSBHG3
 t3o8Tv8/w7GTdjgMuzQuIvJUx3xNEDeSFdGKW4YwziFJU7YqyF31nctaLIq3TGkUOK8UJk5g4e
 vxlU+/+n15k5kjKmR5u238sP5IZbhOL4kMfO0fwAAAA==
To: linux-fsdevel@vger.kernel.org
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=276; i=brauner@kernel.org;
 h=from:subject:message-id; bh=uxBF/65cfGgFc9NUZsYBWMo4c7yjkoqCGF6QeEUJdAY=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSsP1PLoVi0NYRvYnj1752/FbjTRLb2F5/eK1jjLMP8OeoE
 g8DNjlIWBjEuBlkxRRaHdpNwueU8FZuNMjVg5rAygQxh4OIUgIlwrGT4n2l3WEWjd0VXqt6ih11Ns1
 YfjrROvjc3V73IYWbr0apscUaGq6+my1lGuQtz2O564OagKGE5qVEnsLx/a9H1rIRnpwXZAA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
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
Cc: linux-aio@kvack.org, linux-usb@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>,
 kvm@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, netdev@vger.kernel.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Sean Christopherson <seanjc@google.com>, Oded Gabbay <ogabbay@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Moritz Fischer <mdf@kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 Xu Yilun <yilun.xu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey everyone,

This simplifies the eventfd_signal() and eventfd_signal_mask() helpers
by removing the count argument which is effectively unused.

---



---
base-commit: 6be357f00aad4189130147fdc6f568cf776a4909
change-id: 20230713-vfs-eventfd-signal-0b0d167ad6ec

