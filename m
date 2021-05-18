Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7E3872BF
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 08:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A93B89C3F;
	Tue, 18 May 2021 06:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBA489C3F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:58:26 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id c10so4267569iob.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 23:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=okFGSzwxy3Xl1EDwrbsZ6bJWGdPaUEKxSezi4/SE71A=;
 b=KvboTWH6SCfdQ7LLxm6vH9xhTNNbPkylAhr3iqPQWH1QNODKOLIbMt/OYjboWMwVvr
 +KD/UQeQoUETk6OK7TCWS0Utmt5EvBfWbA4IzzRRuwJkDy5Qi3ICeWOTChp1Py6zaNQt
 fa1WHS9ymuIo1ivMcIga1N5vVpkmfX46UnGI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=okFGSzwxy3Xl1EDwrbsZ6bJWGdPaUEKxSezi4/SE71A=;
 b=ifA7QmSCpZoOcqKy+mEBMP4SWYmcP0zjSNSw2kj+AK6btJtdlu58CItxId/m3asoCI
 irJ9/7EDxeRmIsDUc4vliGz3Ky5CjGBfqRWDMt7mQ/NCJBkePm2nJB7r+gLgECpBGuiG
 WpO6Yt8Vh4+4MzILe7XZYPYCD1xtsShfAdf5NARzx7DU9CNgRzZjmN/SBDmDdLXztocT
 08l4FAOFJhf/t66y4G6UNJsujT3SI0zsXAHtRzenCWjYi/UdtNdJoMPhmB0jCqWe03kv
 VWhQZzAfRrs//UhUk9mikdTTsHqcmBfAd8uuCNy9Yk218yYPFvS0w8c5H0qfbEXxpyDc
 hxhw==
X-Gm-Message-State: AOAM530jBFY/cRdx7/4a/avPZzTP7ZRcyvzUUc0VYMma0WLF72GMykcl
 xByqreKaf2Kn5dC5B2EBLn3ft0RcDek7SA==
X-Google-Smtp-Source: ABdhPJw31bSBcEJZ8u44Co/4GDRwc2uqcmBdXN79sJRa61CJYFvjIgcyOkRM8mvguzbjXb4nTA/gUg==
X-Received: by 2002:a5e:a704:: with SMTP id b4mr3179625iod.35.1621321105582;
 Mon, 17 May 2021 23:58:25 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com.
 [209.85.166.177])
 by smtp.gmail.com with ESMTPSA id y15sm10091277ila.3.2021.05.17.23.58.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:58:25 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id o10so7239511ilm.13
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 23:58:25 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a4d:: with SMTP id
 u13mr3011800ilv.64.1621320723564; 
 Mon, 17 May 2021 23:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-6-tientzu@chromium.org>
In-Reply-To: <20210518064215.2856977-6-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 18 May 2021 14:51:52 +0800
X-Gmail-Original-Message-ID: <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
Message-ID: <CALiNf28ke3c91Y7xaHUgvJePKXqYA7UmsYJV9yaeZc3-4Lzs8Q@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] swiotlb: Add a new get_io_tlb_mem getter
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, 
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Still keep this function because directly using dev->dma_io_tlb_mem
will cause issues for memory allocation for existing devices. The pool
can't support atomic coherent allocation so we need to distinguish the
per device pool and the default pool in swiotlb_alloc.
