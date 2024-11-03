Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87659BA7CA
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 21:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10A310E0AA;
	Sun,  3 Nov 2024 20:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E307610E0AA;
 Sun,  3 Nov 2024 20:02:05 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-20cdbe608b3so34483735ad.1; 
 Sun, 03 Nov 2024 12:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730664125; x=1731268925;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VjfQvqCHHfDeXG4GMQuNHaE4bkPmkI1XqjnN8lstP2Q=;
 b=B9ksgQUWMm4edPb2eWP6UTUv+MzvLGDVmUC3e8+x6/2O0PaExYdslBKyp2XfAyLDwK
 d2tPQv1UX5lcoDIFkidplm6HegmiK4sWmWjxGiZq5N2UzqofKQDiUBQWHzEMu0d13QuC
 tBEAW8zrf+/Garr8IAgE4kW2pRqGATzRohQ+JFR3iCnbB+bnv02TFC87M5fCs+I0+PjI
 Swx+iYdaBEh06JBGLULHkp+NwcubvvEPk40yOecsjBumkRtq9YzUDvD3Txd0T+NpjzhS
 kjmKsvBZksbyTFlkkidKhJJRrxrH3Krq8FxWklLDaqVbZiAbKmvxZazWADI8St38TXxQ
 2cFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyBAoB8U3GdDAVPzw9ejiBsgEdqbwunAjftlAleHuQuN7n1NivlAsBOPTBs9wcx/YC0GCGFuo7@lists.freedesktop.org,
 AJvYcCXqLhaR3s/2h/fBh1wfOBcgjzYbbIeiCmWs5BtU5GjxAZUpOtFo4c2Ip1tswX1TgEeoUxP4d4tZce6O@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNUAqSSNb/F+IPxzIVzGiBfZwSBpp+bngzeShQobURFajlMWJC
 EBWKRTPEW/g1XO3YajkGQjUDFMzoZBxKtm5d9LtxXuCKvI2r2nxD
X-Google-Smtp-Source: AGHT+IHAS+v1ffLBb+GI+ZNM4/mlV92TQI2AYHoaDbWsFSd1zPZgooqCqKQWbVDQVnW3KjMuxbyzsA==
X-Received: by 2002:a17:902:ce91:b0:20b:6624:70b2 with SMTP id
 d9443c01a7336-210f75154e9mr256357005ad.19.1730664125219; 
 Sun, 03 Nov 2024 12:02:05 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21105707059sm49877745ad.81.2024.11.03.12.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 12:02:04 -0800 (PST)
Date: Mon, 4 Nov 2024 05:02:03 +0900
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
Subject: Re: [PATCH v2 00/10] sysfs: constify struct bin_attribute (Part 1)
Message-ID: <20241103200203.GA183945@rocinante>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
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

> struct bin_attribute contains a bunch of pointer members, which when
> overwritten by accident or malice can lead to system instability and
> security problems.
> Moving the definitions of struct bin_attribute to read-only memory
> makes these modifications impossible.
> The same change has been performed for many other structures in the
> past. (struct class, struct ctl_table...)
> 
> For the structure definitions throughout the core to be moved to
> read-only memory the following steps are necessary.
> 
> 1) Change all callbacks invoked from the sysfs core to only pass const
>    pointers
> 2) Adapt the sysfs core to only work in terms of const pointers
> 3) Adapt the sysfs core APIs to allow const pointers
> 4) Change all structure definitions through the core to const
> 
> This series provides the foundation for step 1) above.
> It converts some callbacks in a single step to const and provides a
> foundation for those callbacks where a single step is not possible.
> 
> Patches 1-5 change the bin_attribute callbacks of 'struct
> attribute_group'. The remaining ones touch 'struct bin_attribute' itself.
> 
> The techniques employed by this series can later be reused for the
> same change for other sysfs attributes.
> 
> This series is intended to be merged through the driver core tree.

This is very nice.  Thank you!

For PCI changes:
  Acked-by: Krzysztof Wilczyński <kw@linux.com>

This reminded me of an old discussions with Greg and Bjorn about how to set
size correctly for our ROM and BAR sysfs objects.  Nice to see a very nice
approach here, indeed.

	Krzysztof
