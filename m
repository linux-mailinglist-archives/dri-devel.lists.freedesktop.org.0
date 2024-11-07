Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E939C0A5A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 16:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE7210E32A;
	Thu,  7 Nov 2024 15:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A655F10E32A;
 Thu,  7 Nov 2024 15:50:47 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-20c803787abso10192235ad.0; 
 Thu, 07 Nov 2024 07:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730994647; x=1731599447;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4g9pTMBWn8NYG8DJqu2aF9WChjDh3es1iM4dJmMreI=;
 b=oOFWw48U7tuqsZlgl97aYEMN+xs91dF989G1ooqukHYzpzCqiZURqFctbFO/yQ+Ywx
 38GsZ7MkRJvjIvf2zILp2I3gBePqRU3bVTXNXbmWvVkc0lDJK78pQWT6R235ysD3eQ1U
 WSrvHXGXUP786cIK668TmiTKBR0jh91bCQpn+mtlaKSMts+mlL8zNAJYhc74IbcwcSla
 QegfjNFpVvXauvslsU5UNRBNWE+/YMnPKiShe9AzofQJYuBwE1dk/RJ6Pe5i5SClCIEh
 /8jVWAG2Ayxiw+5U1TcWNiVUdUZvVTDrNYmClLlHl3raUycWT2HKZglVDXAtUYGsFd9x
 KeCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSIbMbbY9XtLzOaJ5a1e5doX/EdLVDriLKlwMIXZkKIEVsVHmTuHt/nDNfZquU1Qc1KnVB0X4O1fKu@lists.freedesktop.org,
 AJvYcCUsJDMqyy6E1yHcixigcS1v6z5z0kw8EDlN2E7sB9OuPtEBXxnsNGEHfSMgBf8ooUX9jcnUG+Bl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0vLFqWHcR9JXOq5+gfdNdor7GYPiMXEvW7/TtRB383F0JwcNP
 XTkPM5ewWgg6X4qBSvYRdGrABeR+ObOwdNh37SCFQxRxtOsS5/uN
X-Google-Smtp-Source: AGHT+IEfW8mc6K7WMilatY4cRGrx/jJrVZ2Go8Ums63B2x6oVuXb+zNT4RZMBtIqDecZElfJ9fn+6w==
X-Received: by 2002:a17:903:183:b0:210:e760:77e with SMTP id
 d9443c01a7336-21181184b51mr5235045ad.7.1730994647037; 
 Thu, 07 Nov 2024 07:50:47 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21177e6c2ecsm13637145ad.252.2024.11.07.07.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 07:50:46 -0800 (PST)
Date: Fri, 8 Nov 2024 00:50:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
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
Message-ID: <20241107155044.GA1297107@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
 <20241106200513.GB174958@rocinante>
 <2024110726-hasty-obsolete-3780@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110726-hasty-obsolete-3780@gregkh>
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

[...]
> > There exist the sysfs_update_groups(), but the BAR resource sysfs objects
> > are currently, at least not yet, added to any attribute group.
> 
> then maybe they should be added to one :)

Yeah. There is work in progress that will take care of some of this.

	Krzysztof
