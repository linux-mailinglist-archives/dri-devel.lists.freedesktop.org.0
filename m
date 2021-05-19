Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6359389695
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 21:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7856EE6E;
	Wed, 19 May 2021 19:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99D86EE6E;
 Wed, 19 May 2021 19:24:18 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id g18so8935345pfr.2;
 Wed, 19 May 2021 12:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=47JQ73C0NJdLVL+El8Yu9LZib8r+sSTJ+nf9zBKe9o0=;
 b=CToMN5sVOeaSvxsFwh30mnX1cEfbujdvLOsJoVGXyNK5xIClhHeY9+5gjOfAEdXX3G
 eU6qVJByg68kQ/w6JlnavFgIe+nfjuKKhbAsZxJHLIoUmLJC+FNQXwfuXltAASilweQx
 t+08hp5u1PLu1TqToQLVPh129PwSHFiJcf7M+I2aRakLaRJ2reqCHrxjRIjxuLTiBnzU
 obYFCXVysXAW0hEOj/ZFRzKi1W/0ELgGhGTgBKGpo2iX5m/PP/BptzsrBt+DoXhRmi5/
 WDDfuoHSDbRwV59E2nqJbeAwXtBih5h7WjHhxwWGM7Qsk3IgYQx+mCus3GhZ5jZ2T7eK
 2tug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=47JQ73C0NJdLVL+El8Yu9LZib8r+sSTJ+nf9zBKe9o0=;
 b=lCXZ+R/yGHd57PyMhgc3vPDjmfpl9ZdzdCK09e3SSu6QD7esb1HEE5BzK0GxYK3y9w
 YWA9nuh5m1Lf79wFXWLQhQF+xMa/pjQ35c1lN4wJ2JkJyQCKB+yOQ5TnXdwE4rFO2wUY
 xk8lp2+uOpmO2EpmUg7bSXUCFjy9/NByBa6695BOrlEHgvcr9cmRyCtPvoLAt2Al7hIq
 GYqPgk/KIe9YO/E44fDB+Vj3c/3q3h84t0/0LIY/wxAdofc96/DPuLEoa1kjcoM1LeYW
 JPm4V3DUJfmrxaO4LDbHD9HGG8p3pQQdHcvJN+5JKdW+xxvUCNw/xLawJyiQamqHWcg8
 SAqg==
X-Gm-Message-State: AOAM530+zgNE2HCcdR5A8clja6SFdhwA6KKLZKl8aiv7e2ttBlKczInk
 uj0+UAFysELO/ro7qFy2ivA=
X-Google-Smtp-Source: ABdhPJzJyhu29XiaIUqubYuVceyIJwVsMCRuIXu8+2duk9EuCth6A3fkL6TVyZT/YsIkYQB5Otc01Q==
X-Received: by 2002:a62:1d52:0:b029:2dd:ee:1439 with SMTP id
 d79-20020a621d520000b02902dd00ee1439mr573310pfd.57.1621452258195; 
 Wed, 19 May 2021 12:24:18 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id gj21sm4690007pjb.49.2021.05.19.12.24.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:24:17 -0700 (PDT)
Subject: Re: [PATCH v7 02/15] swiotlb: Refactor swiotlb_create_debugfs
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-3-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d4a3ee6d-55be-1a60-9092-66b444dc9dda@gmail.com>
Date: Wed, 19 May 2021 12:24:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-3-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/17/2021 11:42 PM, Claire Chang wrote:
> Split the debugfs creation to make the code reusable for supporting
> different bounce buffer pools, e.g. restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
