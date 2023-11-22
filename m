Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F5A7F469D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 13:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E895210E080;
	Wed, 22 Nov 2023 12:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B719410E080;
 Wed, 22 Nov 2023 12:49:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE99B61DC6;
 Wed, 22 Nov 2023 12:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B8AC433C7;
 Wed, 22 Nov 2023 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700657341;
 bh=6OXBSUL+nsBWDSWY/Q2r+0obUk1WW2944LvuwrKFOOg=;
 h=From:Subject:Date:To:Cc:From;
 b=Tc/2BAOyq/CL424TPKJ+8ok4iD2CSlMj4gj7I88R2wR3SRpoXrwpPP4CcDv0rCy4Q
 imtDsj4NMmiBNZozdVII4r1Tu0lKWkktCHU3pI4LzAIFYMYIaMFpbulm6tUMVwguK4
 qTlrJ2u4/DeMIiXbQyzfXkH/WxJG3G65JVkRZ5lf6r4VzUJTQXH/UjyJJ0V5cZAl2s
 w/spDO6VPLhtfPliBsbbdWVAXUjht3ojtCQDl0LfCWNNwph8Zdy7ZX7mLHL0no3jWG
 z8IdhyFNF5VEPzmpKIFkxea1CvPQqUVZAxIi/ByG3Lv1c90SwdjDEIcrL99R5YQgIg
 fP3gmG5BvwYWQ==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH v2 0/4] eventfd: simplify signal helpers
Date: Wed, 22 Nov 2023 13:48:21 +0100
Message-Id: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJX4XWUC/32OTQ6CMBBGr0K6dkhbYpu48h6GRX8GaMRiZkijI
 dzdwgFcvsV737cJRkrI4tZsgrAkTkuuoC+NCJPLI0KKlYWWupNWdVAGBiyY1yECpzG7GaSXURn
 rosEgqvgmHNLnjD76yt4xgieXw3SkXo5XpLaY1gIFdRhT4nWh7/miqMP7O1gUSLBDdCZco1ba3
 59IGed2oVH0+77/ALQAWw7XAAAA
To: linux-fsdevel@vger.kernel.org
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=openpgp-sha256; l=564; i=brauner@kernel.org;
 h=from:subject:message-id; bh=6OXBSUL+nsBWDSWY/Q2r+0obUk1WW2944LvuwrKFOOg=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaTG/lhzPFmKbc7Vgs4lut/eP1hw9bOuxtyeI9s4tYwWe
 yZZxby53lHKwiDGxSArpsji0G4SLrecp2KzUaYGzBxWJpAhDFycAjCRf4IM/8NUuv3TH0hJOWz8
 c65PTujVFLaLGrq6vFP/9yxi7X77UInhf0113erTobU10gp/tt37unHeHp8P0ZHTLq5c7sWdN//
 2D04A
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
 Christian Brauner <brauner@kernel.org>,
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

Hey everyone,

This simplifies the eventfd_signal() and eventfd_signal_mask() helpers
significantly. They can be made void and not take any unnecessary
arguments.

I've added a few more simplifications based on Sean's suggestion.

Signed-off-by: Christian Brauner <brauner@kernel.org>

Changes in v2:
- further simplify helpers
- Link to v1: https://lore.kernel.org/r/20230713-vfs-eventfd-signal-v1-0-7fda6c5d212b@kernel.org

---



---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20230713-vfs-eventfd-signal-0b0d167ad6ec

