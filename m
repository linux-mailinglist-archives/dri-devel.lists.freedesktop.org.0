Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92012757007
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 00:52:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47A910E2B6;
	Mon, 17 Jul 2023 22:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286EB10E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 22:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689634328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wy84DSSq8n2YYiK0mWellsvoswCFp/2kMAmdZ+UHHc=;
 b=XQUo3bvqjUpsOUN8GsxyIHaDVPFy4YocF1KfVpXfseLNxnoHQQwMv7AlCeG4Zoo/+Ykf3U
 D9Q+8g6vNPpsonv/zzORLqloc3niRORGz95s4pjnDwTDD/xUtUNZlEbpvZnorV19sdyt+c
 kDgNidq2eXxF6QoXTFIJDi3me8/vWE0=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-uAxgOlblP9uA_zqSp1VSRw-1; Mon, 17 Jul 2023 18:52:07 -0400
X-MC-Unique: uAxgOlblP9uA_zqSp1VSRw-1
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3463d07c991so34881515ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 15:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689634327; x=1692226327;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8wy84DSSq8n2YYiK0mWellsvoswCFp/2kMAmdZ+UHHc=;
 b=FDgMbqCOOFtoq7hl8IB0pczldLvnqL4bGMXAn/xGenyJXoXyqaUPjBMKQBDpNgkdsI
 aWO7UEQa112A38cX/b4hXBzPvzfHRKI3F/Yu4WuMktkehh45m66gdfNfAgm+eBCGpW2/
 i8AaMW6Iz6q871tD8h/UxzXyJDs4vkzeClKyZaWrU/ZRJmIiEhAvwO7i4lsXVrU+fBlF
 WPpZfyQt2Ap7151AAK+I4Eyio3rv37FGsEjYqid6rowlmZjBe+liJwlOgpG3PdLlmaaf
 eqZCHv4k+9N+6rMMF5V3/hdQ5ekHCB4GFddKDcST394xdQ/e4nZAJJWZIV/dK3afyT0q
 vylw==
X-Gm-Message-State: ABy/qLZM67mjNUMke73WTR83qHUIJXeQ7wArOo95nK1jv9qEP+1Sww6e
 542iiUbbSD2D+lEh6MbHL7GNgS4s3+qfTbwSLVkIpVc1zOIkzbH29PcsZWD63OGsp7hzUFwTr2c
 xz0SHQsoWh4BOL/9vbAWnI1SBdCgI
X-Received: by 2002:a92:c651:0:b0:347:693a:7300 with SMTP id
 17-20020a92c651000000b00347693a7300mr1012073ill.26.1689634327056; 
 Mon, 17 Jul 2023 15:52:07 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGlBYmCdY1EaUds5QDcX7E6PqePOm9wJTOwk2wgOBkeJp+9wxIVvWJlHjSTuTXhWw/m+atXtQ==
X-Received: by 2002:a92:c651:0:b0:347:693a:7300 with SMTP id
 17-20020a92c651000000b00347693a7300mr1012015ill.26.1689634326829; 
 Mon, 17 Jul 2023 15:52:06 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 d10-20020a92ddca000000b00341c0710169sm242627ilr.46.2023.07.17.15.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 15:52:06 -0700 (PDT)
Date: Mon, 17 Jul 2023 16:52:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
Message-ID: <20230717165203.4ee6b1e6.alex.williamson@redhat.com>
In-Reply-To: <ZLW8wEzkhBxd0O0L@ziepe.ca>
References: <20230630155936.3015595-1-jaz@semihalf.com>
 <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
 <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
 <20230717130831.0f18381a.alex.williamson@redhat.com>
 <ZLW8wEzkhBxd0O0L@ziepe.ca>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>, netdev@vger.kernel.org,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marcin Wojtas <mw@semihalf.com>,
 Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>,
 Harald Freudenberger <freude@linux.ibm.com>, x86@kernel.org,
 Halil Pasic <pasic@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Xu Yilun <yilun.xu@intel.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org,
 Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Dominik Behr <dbehr@chromium.org>,
 intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>,
 Eric Auger <eric.auger@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shakeel Butt <shakeelb@google.com>, kvm@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org,
 io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Christian Brauner <brauner@kernel.org>, Grzegorz Jaszczyk <jaz@semihalf.com>,
 Oded Gabbay <ogabbay@kernel.org>, linux-usb@vger.kernel.org,
 Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023 19:12:16 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Mon, Jul 17, 2023 at 01:08:31PM -0600, Alex Williamson wrote:
> 
> > What would that mechanism be?  We've been iterating on getting the
> > serialization and buffering correct, but I don't know of another means
> > that combines the notification with a value, so we'd likely end up with
> > an eventfd only for notification and a separate ring buffer for
> > notification values.  
> 
> All FDs do this. You just have to make a FD with custom
> file_operations that does what this wants. The uAPI shouldn't be able
> to tell if the FD is backing it with an eventfd or otherwise. Have the
> kernel return the FD instead of accepting it. Follow the basic design
> of eg mlx5vf_save_fops

Sure, userspace could poll on any fd and read a value from it, but at
that point we're essentially duplicating a lot of what eventfd provides
for a minor(?) semantic difference over how the counter value is
interpreted.  Using an actual eventfd allows the ACPI notification to
work as just another interrupt index within the existing vfio IRQ uAPI.
Thanks,

Alex

