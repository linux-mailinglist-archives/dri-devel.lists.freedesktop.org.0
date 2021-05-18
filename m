Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE609387299
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 08:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83816EAA3;
	Tue, 18 May 2021 06:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DC86EAA3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:48:59 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id p8so8332727iol.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 23:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3HopsH6N9F8FpkG4FSoTMtRMwuiSWSuF3ZB9X+VJCjU=;
 b=LETfA+HNnfbbscLemZLHMHTU1ucDVUTbar59Z+Ip1n1aOSxU2vCiyi6AnzZ7ISe1Ci
 d5+6nDZp7u09C4wccj2HMQoLbhxVgGmyilxSsMMqy6XnJ9Gh0XN/+XAYDZzV88am1gOT
 FB7ehF0SoAEZFAQ80iPByl3CmJPeIGWiXIdbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3HopsH6N9F8FpkG4FSoTMtRMwuiSWSuF3ZB9X+VJCjU=;
 b=Pmm9+fQYZLpBxkeNeDaIqallGjiE5UaKVjj2pZrCGyTIBPLb1g9UIFdd3whaK+gK6p
 m2Xe9EYgmAWyotT5TV4dhLB8ejItIip5uMDgAR8m70xMe/2OsEv2sBxPxh+gwgd3GV/9
 XqlQKHjxTMb7VGbpxeN5KAGdU6p+SUnT//fsG7SS4noNfe1tLfdP0buBiaJtd8XeO086
 fIppSKgcR1CAZA4pAzGMzZkZvKIdzlg0X/C+zsSw7HCukaZkurhETCzN9WLBgOE57RAT
 5Y1MJQbgUSn+0N2LS6YOilQ2PVZda1yWUDNU230Fn9rTh+9rbjgFdqX4Ngh7yROHzZSa
 947w==
X-Gm-Message-State: AOAM531B4rTOkpQZ3otRZirK6bQhsdSEr6WpAlgauFBGqT1LvqDeikKc
 GgpUMchNaZF8Q4A9kDog2ni7VXUlLuDSWQ==
X-Google-Smtp-Source: ABdhPJzw0I+FlzyvxpXLfH7WaJLmFNrlQkGrkfujczYZJ1FrTuSQHRYhxASNLECyNiMRr3ci8bPxfQ==
X-Received: by 2002:a05:6602:21ca:: with SMTP id
 c10mr3132038ioc.10.1621320539193; 
 Mon, 17 May 2021 23:48:59 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id t3sm8694979ioi.25.2021.05.17.23.48.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:48:58 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id d11so8364197iod.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 23:48:57 -0700 (PDT)
X-Received: by 2002:a05:6638:32a8:: with SMTP id
 f40mr3969029jav.84.1621320526895; 
 Mon, 17 May 2021 23:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-5-tientzu@chromium.org>
In-Reply-To: <20210518064215.2856977-5-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 18 May 2021 14:48:35 +0800
X-Gmail-Original-Message-ID: <CALiNf2_AWsnGqCnh02ZAGt+B-Ypzs1=-iOG2owm4GZHz2JAc4A@mail.gmail.com>
Message-ID: <CALiNf2_AWsnGqCnh02ZAGt+B-Ypzs1=-iOG2owm4GZHz2JAc4A@mail.gmail.com>
Subject: Re: [PATCH v7 04/15] swiotlb: Add restricted DMA pool initialization
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

I didn't move this to a separate file because I feel it might be
confusing for swiotlb_alloc/free (and need more functions to be
non-static).
Maybe instead of moving to a separate file, we can try to come up with
a better naming?
