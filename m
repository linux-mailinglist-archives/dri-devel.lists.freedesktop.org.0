Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874D49E2641
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:11:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CFD10EA97;
	Tue,  3 Dec 2024 16:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="sizE5QoI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BD610EA97;
 Tue,  3 Dec 2024 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1733242270;
 bh=277NQChdWnV4HacrcegFUWzVRwOH48nxQcs2AvUWU/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sizE5QoIfdIYrqxRdwX94ZC/agXw0pa0PTSsY+EhiaHK9ZyNdezGC3st3dTpS0o5y
 8J4Rum3nNJJc9R7oV79zFn2aPNNgOgAo2+kTKS3uiDI40pDCkYOi6LivymYIQUOLVi
 Vh/4iUKA2LVrdrQMyxIcCg+a3+hHswgOA9DOmlgg=
Date: Tue, 3 Dec 2024 17:11:10 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, ajd@linux.ibm.com, 
 alexander.deucher@amd.com, alison.schofield@intel.com,
 amd-gfx@lists.freedesktop.org, 
 arnd@arndb.de, bhelgaas@google.com, carlos.bilbao.osdev@gmail.com, 
 christian.koenig@amd.com, dan.j.williams@intel.com, dave.jiang@intel.com, 
 dave@stgolabs.net, david.e.box@linux.intel.com, decui@microsoft.com, 
 dennis.dalessandro@cornelisnetworks.com, dri-devel@lists.freedesktop.org,
 fbarrat@linux.ibm.com, 
 gregkh@linuxfoundation.org, haiyangz@microsoft.com, hdegoede@redhat.com, 
 ilpo.jarvinen@linux.intel.com, ira.weiny@intel.com, jgg@ziepe.ca,
 jonathan.cameron@huawei.com, 
 kys@microsoft.com, leon@kernel.org, linux-alpha@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-rdma@vger.kernel.org, 
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 
 logang@deltatee.com, martin.petersen@oracle.com, mattst88@gmail.com, 
 miquel.raynal@bootlin.com, mwalle@kernel.org, naveenkrishna.chatradhi@amd.com, 
 platform-driver-x86@vger.kernel.org, pratyush@kernel.org, rafael@kernel.org, 
 richard.henderson@linaro.org, richard@nod.at, simona@ffwll.ch,
 srinivas.kandagatla@linaro.org, 
 tudor.ambarus@linaro.org, vigneshr@ti.com, vishal.l.verma@intel.com,
 wei.liu@kernel.org
Subject: Re: [PATCH v2 09/10] sysfs: bin_attribute: add const read/write
 callback variants
Message-ID: <5b589ddb-e3c9-40e1-987f-30ba81dc8ace@t-8ch.de>
References: <20241103-sysfs-const-bin_attr-v2-9-71110628844c@weissschuh.net>
 <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>
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

On 2024-12-03 11:06:16-0500, James Bottomley wrote:
> > diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> > index
> > d17c473c1ef292875475bf3bdf62d07241c13882..d713a6445a6267145a7014f308d
> > f3bb25b8c3287 100644
> > --- a/include/linux/sysfs.h
> > +++ b/include/linux/sysfs.h
> > @@ -305,8 +305,12 @@ struct bin_attribute {
> >  	struct address_space *(*f_mapping)(void);
> >  	ssize_t (*read)(struct file *, struct kobject *, struct
> > bin_attribute *,
> >  			char *, loff_t, size_t);
> > +	ssize_t (*read_new)(struct file *, struct kobject *, const
> > struct bin_attribute *,
> > +			    char *, loff_t, size_t);
> >  	ssize_t (*write)(struct file *, struct kobject *, struct
> > bin_attribute *,
> >  			 char *, loff_t, size_t);
> > +	ssize_t (*write_new)(struct file *, struct kobject *,
> > +			     const struct bin_attribute *, char *,
> > loff_t, size_t);
> >  	loff_t (*llseek)(struct file *, struct kobject *, const
> > struct bin_attribute *,
> >  			 loff_t, int);
> >  	int (*mmap)(struct file *, struct kobject *, const struct
> > bin_attribute *attr,
> > @@ -325,11 +329,28 @@ struct bin_attribute {
> >   */
> >  #define sysfs_bin_attr_init(bin_attr) sysfs_attr_init(&(bin_attr)-
> > >attr)
> >  
> > +typedef ssize_t __sysfs_bin_rw_handler_new(struct file *, struct
> > kobject *,
> > +					   const struct
> > bin_attribute *, char *, loff_t, size_t);
> > +
> >  /* macros to create static binary attributes easier */
> >  #define __BIN_ATTR(_name, _mode, _read, _write, _size)
> > {		\
> >  	.attr = { .name = __stringify(_name), .mode = _mode
> > },		\
> > -	.read	=
> > _read,						\
> > -	.write	=
> > _write,						\
> > +	.read =
> > _Generic(_read,						\
> > +		__sysfs_bin_rw_handler_new * :
> > NULL,			\
> > +		default :
> > _read						\
> > +	),							
> > 	\
> > +	.read_new =
> > _Generic(_read,					\
> > +		__sysfs_bin_rw_handler_new * :
> > _read,			\
> > +		default :
> > NULL						\
> > +	),							
> > 	\
> > +	.write =
> > _Generic(_write,					\
> > +		__sysfs_bin_rw_handler_new * :
> > NULL,			\
> > +		default :
> > _write					\
> > +	),							
> > 	\
> > +	.write_new =
> > _Generic(_write,					\
> > +		__sysfs_bin_rw_handler_new * :
> > _write,			\
> > +		default :
> > NULL						\
> > +	),							
> > 	\
> >  	.size	=
> > _size,						\
> >  }
> 
> It's probably a bit late now, but you've done this the wrong way
> around.  What you should have done is added the const to .read/.write
> then added a .read_old/.write_old with the original function prototype
> and used _Generic() to switch between them.  Then when there are no
> more non const left, you can simply remove .read_old and .write_old
> without getting Linus annoyed by having to do something like this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e70140ba0d2b1a30467d4af6bcfe761327b9ec95

Not all users are using the macros to define their attributes.
(Nor do they want to)

These users would break with your suggestion.
Otherwise I agree.


Thomas
