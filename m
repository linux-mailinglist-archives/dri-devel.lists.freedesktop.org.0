Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184959BF7C3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 21:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B55610E0CC;
	Wed,  6 Nov 2024 20:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8093910E0CC;
 Wed,  6 Nov 2024 20:05:16 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20cb7139d9dso2418515ad.1; 
 Wed, 06 Nov 2024 12:05:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730923516; x=1731528316;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57haWgxVK3Bhz2CTFQJdY/J31Debho+HXpt9b6frcmw=;
 b=KT2lEbsoLa302AWNF7jbAop0ZXYPUGWXNNFre7qkoOyoO0XYMB627nBKycPW8kxaP9
 QxpnMSzcg9chwPdRiy6XNOfJWBTuJBTYejWAHdKaEZL5Q7onpS4A4xBMhdyBCz1ypubj
 HnrEDGVqCvJZXdT5pR2IJgba0O3P8n3s4AhqXdlX6ZFSSiWLYZWaqi3/D8yVCKqrtd/q
 OyM7Xmxx/LH/MCTNN/MRk0RT2UEbgYI2QhdNQ2IkFL9BODMl9yJ+0SBdpf0qaISokMTJ
 jWlX0iA9g2sPErZcbVv7Ox2egyuxOJcPeH9ljYlQaFAuRpCjpzmmokzLhaQHGRvVBAZL
 Cn9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUXYXDObxHrhlqBbxO1bfbBMZILVV7mscByYCA9FKcnn1NClvkO7Bal7curt3w1zQr2Oj9SFTMht/p@lists.freedesktop.org,
 AJvYcCXXDX8lNtp/M2L4BD7GLqaDVio963qvKxXtKZtSI8VO+sHPwB5wOl2fojhSVQFMEKvrBX5jMnmF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQcsVPkCDr+dVgvTfC1DuqKodngFJ/AwGDM6PsDsS7IfUtLgiT
 qMiYNyUlb2JB8dkSJfGT3NBRa42Nj3ZGWZDNQ1/QaxSE05R5SCfr
X-Google-Smtp-Source: AGHT+IFmoIbZw8g1IipDn3Lp+ri/9C7OdJSPor3hPH1pRa7RYRF3y6lGuH/8ZaeEQ1eFo8eAFPaCWQ==
X-Received: by 2002:a17:902:cecd:b0:20c:a97d:cc7f with SMTP id
 d9443c01a7336-210c6c3ec78mr567878865ad.41.1730923515866; 
 Wed, 06 Nov 2024 12:05:15 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211057c076bsm99997795ad.197.2024.11.06.12.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 12:05:15 -0800 (PST)
Date: Thu, 7 Nov 2024 05:05:13 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
Message-ID: <20241106200513.GB174958@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
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

Hello,

> Several drivers need to dynamically calculate the size of an binary
> attribute. Currently this is done by assigning attr->size from the
> is_bin_visible() callback.
> 
> This has drawbacks:
> * It is not documented.
> * A single attribute can be instantiated multiple times, overwriting the
>   shared size field.
> * It prevents the structure to be moved to read-only memory.
> 
> Introduce a new dedicated callback to calculate the size of the
> attribute.

Would it be possible to have a helper that when run against a specific
kobject reference, then it would refresh or re-run the size callbacks?

We have an use case where we resize BARs on demand via sysfs, and currently
the only way to update the size of each resource sysfs object is to remove
and added them again, which is a bit crude, and can also be unsafe.

Hence the question.

There exist the sysfs_update_groups(), but the BAR resource sysfs objects
are currently, at least not yet, added to any attribute group.

Thank you!

	Krzysztof
