Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4B389672
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 21:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7206EE6A;
	Wed, 19 May 2021 19:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD746EE6A;
 Wed, 19 May 2021 19:19:48 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 10so10607597pfl.1;
 Wed, 19 May 2021 12:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ghVDOoMvorTJdaMzHQG/RIv5BmHhyL6sw4dTSHsJEnU=;
 b=rcLYOAKu9u/Pk2N2pIINoWg7Qql5CHIaTXPW1rmbbrFNRBJ17e6P88xZ/Yr3+K40Vg
 KFK9I+oMG/IgtitN6mi8iqL0UX94lczwdh7i0nBMb8jue1bBvD+G4ynJruy5PLRKgM8v
 188V9tFxrPE9B0B1aPKzXgftN+LtzT071WIlfZD+1U+hRwMChhgRPMvMzKYVh5Q7yJyY
 X233KhJbv3QXKhh18IR7fU0ZBHQkRzKr/brYbrWfvUGYpz9WfdE1CfhVQ0XA+pTrnR5x
 VWSQyHCExyqYP4xFwbo2E8+nGlIJeknoGezPntMeUW6YyiidoBVXS6cxaKILk/O3+EJK
 3+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ghVDOoMvorTJdaMzHQG/RIv5BmHhyL6sw4dTSHsJEnU=;
 b=ikQOeQR7JH0de7PIoyOYHPv9tdATNvT7Ii0P+lR7x291CXK8HvayA1qEaWRIaDOvBA
 xQYGdH5Odc9NhzxIoI4oF5tbxjX5VWu8v2CN4nRSY9fsqB2V6kNHL1NjJ1WAJCKYszAn
 1O5JEwrnlFTRkOqnwVPrfNgP3/5uO+5iB3ubGGqHqAlTCOiCrSyYhcJoaGWGI69lp57G
 xWec3fMrHWTDVefX3Wst9nVeMHDxXtClffG/CWlmZMILGwHhas7Rfala2xDHRop9Sw8r
 kAlSRFfSOq10U14QadALXZZDgNKaF9WxR4aKlZDFZa3SaR+dwdtG9AAybiTXr5QClHTd
 i5ig==
X-Gm-Message-State: AOAM532A9Xfm2FOvhwliACIR9HGo1h62xU3lasrCsY5voZdO9h0RjtJW
 kHjTHe933faGjR7hc/QTd8A=
X-Google-Smtp-Source: ABdhPJwjgDsBVD45dTtfq/CuwPFV8Nn9xvyX5u2jGlIQAuONAFWU5ZnSLNw+gRQXo9RnVxq5dGzq7g==
X-Received: by 2002:a63:4e01:: with SMTP id c1mr645397pgb.265.1621451987803;
 Wed, 19 May 2021 12:19:47 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y66sm128104pgb.14.2021.05.19.12.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 12:19:47 -0700 (PDT)
Subject: Re: [PATCH v7 06/15] swiotlb: Update is_swiotlb_buffer to add a
 struct device argument
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-7-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e825f332-eabe-4a82-1528-8bc9d1e60625@gmail.com>
Date: Wed, 19 May 2021 12:19:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518064215.2856977-7-tientzu@chromium.org>
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
> Update is_swiotlb_buffer to add a struct device argument. This will be
> useful later to allow for restricted DMA pool.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
