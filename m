Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6AACEEF0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0936410E0F8;
	Thu,  5 Jun 2025 12:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="LGyBOTfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085BF10E0F8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:09:19 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-6face367320so8526176d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1749125359; x=1749730159; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
 b=LGyBOTfX+pyplGLboGQsHExFdvAlcJBZdBQlMILtFdv8KhC6zSP253lQ4mWdFS4rN+
 EHkf7Q7Pb4TWPRjGToZuib6cuiD+lcoRWyA+mg7zDTjeSpa19km8W/aMmZdFnbyTLgSG
 jXx9IZjax7Y6zNwy8UH2DOoLQ1WjEB9Mzt3Z37XBmtX3yL7t9zVLi386pUsnl7WpSV44
 sqTuD5XCveMpLA027/4M8dStvaqD9L3RKcS396vVIf51i1gSIT0QtZCS/XIsVCT0SceQ
 tgx2jPZ44QMcc2YB1G8Ld2Ojk1drs2vmpgJ9NETkwqBw5J3TTmNlGP/v7uHGa8f+HaXx
 h9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749125359; x=1749730159;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
 b=GnOFwhODMU+06ZBMTvnQZLzRzHHeMwJsGUts1b4akh478WGsi9CVZ6ayhZDIhXn3v5
 x9LmeDQnKshKRuszdbnIxBRypZ3omwbgPp7zLGQycD/8Pf+wj3Xbd4KxmSxv59O1MbrL
 MJDPl8Q4hg5Hg71Ja2ZbGzZ6s7vlVcNAMnHXrmzHbU3ns7Ze4D8TJxTMcuRNukOMW59n
 aKFTgI88lGyB3c5bXfutlgSOHNjdMYrGUiJ8BOv2WreO3/xUcA5Duio//jU4hWHpyqob
 uZv8149hWAkt8Wct5MmX9p9m2n/ZLRvh2a1WMzzSBduBMCxIXnYyjB0v9/dBsCaFH3pm
 0h9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe3J3zkgwzDhYBpjCEqGxSc5Adx6F/hgUchlZ2Kp5C3tKXoQwOirjotSuaE+nX2PUbDgpyxlwTz/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzhl3Br78dG8D0wOPyGNQY895ZiWKx9fPK5vKoyEo6hSWHAFcxy
 lX/DftijvCfxDomEinkq5NgJ9j40BUyR9cnbu570rHXBT82m858n7ISOn1MRh8Wuw8s=
X-Gm-Gg: ASbGncuZnDBepmbLs/+A8f/QHqsIAFV0cBWVeI+NPZxUGKmCbY7BreHUnHe0V4D2AhB
 M30w238vfUjeTirYQvn/LTdMMuukGO2eTwFqt8yIpN4ZXg/s3goQJ1PBcKdeYTl5c/B3GsreVW+
 DkAYCN6MCePF10iaKmf6TSxoQVpLeEa5JTwXqWUN/wGtSG8iySRTgpWzXNb+Q4Ft6aM8ZVEawnV
 Y19GxIwmbsBpmMx4IxPud04GYACSusg9nosUYZblsLpXgh2InGUEu2V+FHCHc1TmYSSKf/DqScL
 cVDswijoKShWBrMMCd3/ASaCv3R4EbPCk6r/eOvkLjhRSrzmlurzB971pvknbkeF+JmO0l+baEB
 YVMaoE3EiEGq9m8CGeMTAr/BbZI0=
X-Google-Smtp-Source: AGHT+IGoKm/5U4/UM2uM64qO2HBitYJapsKbuDFJlmk9byEyE/W8ROsmev/IR9V9jeal6LfHAI1O8g==
X-Received: by 2002:a05:6214:224d:b0:6fa:c512:c401 with SMTP id
 6a1803df08f44-6faf70163f2mr115317766d6.37.1749125350351; 
 Thu, 05 Jun 2025 05:09:10 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fac6d4c7d8sm120604836d6.36.2025.06.05.05.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:09:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1uN9PB-00000000EdT-18gz;
 Thu, 05 Jun 2025 09:09:09 -0300
Date: Thu, 5 Jun 2025 09:09:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 gerald.schaefer@linux.ibm.com, willy@infradead.org,
 david@redhat.com, linux-kernel@vger.kernel.org,
 nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com,
 debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
 lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
 dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250605120909.GA44681@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
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

On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:

> If all dax pages are special, then vm_normal_page() should never find
> them and gup should fail.
> 
> ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
> 'special' is not set in the pte path.

That seems really suboptimal?? Why would pmd and pte be different?

> I think for any p[mu]d where p[mu]d_page() is ok to use should never set
> 'special', right?

There should be dedicated functions for installing pages and PFNs,
only the PFN one would set the special bit.

And certainly your tests *should* be failing as special entries should
never ever be converted to struct page.

Jason
