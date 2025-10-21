Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BADEBF941B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 01:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EE310E35D;
	Tue, 21 Oct 2025 23:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="XypxeIyb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006C10E65B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 23:38:14 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-893c373500cso46152585a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 16:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1761089893; x=1761694693; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=l0T6gaWR8wRqUaz48FqGAKEBOYEGIQ3pcXRlgXnhgn0=;
 b=XypxeIybBMTiI+fUTVtZ4XfOvuxEcwWfN+J+tbtJpHEmqK8QdeH8LwFo7PKI2iZVD6
 FuoGyrfrS+2O6tmbGky5cp6Bt7pP6o2HSp6OsjGjn3+z86eChrGh8KmmhuEvvj9Zdn7d
 ZoB8xeFogoNRsbNNgNv9LW7BAWZW0dNd83bBAmuXcWhQk1m9jc+pZGMls3pS+daEXZBq
 3fomsrdRKvrRVJG9du6EbvLDoe6oEIZZfKgzyH8/yEjOTDJRjsteTlb25Deuteg+r1Rv
 NYGrgRpMAKaadoe2w5SqZ+2PABfus1mc1OSBcyOFYHuqYo4AlBzvctHDWaJLTjixI9GI
 oVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761089893; x=1761694693;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l0T6gaWR8wRqUaz48FqGAKEBOYEGIQ3pcXRlgXnhgn0=;
 b=cJtm5l+7DSOLXyTzeHowJKVBLxDRXcK8WCEvY62u8rO8DHEp1+7O8UNL09fq/6tFMJ
 3fhzqEBZPwqufI7OIXUQIUj1lP+UXHNXWE/kkI4NteYhNpJHxxPUNoVlwdx103/xfx3/
 jGtkB4R/7mBPkkJoGaG/tWM/tQ4dy0RZ0JAIPlsD1OQN8luPA54GTF6nLqOdBSawPNod
 vMNA0hUiLnpxZZsW2xrvYY2IJR1Q+G/UKUFh5dXc/UO60/YT/kS1XD0tBnQqnwknjbZf
 pQUqQosxZPTd06f+/zbrCrbNs5IQskci8f5a8PGL0MqLZAQ/1EQY5C4DfTag2yDBLwNV
 maAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPyPn1rkNQyabY3M3a2zTh71hV4DHhmw7U/p0iAQGk/cD422qAMAujjilqeMY6yc9JjT8Xbdk4/2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKwzadMuPGBvnznAB863AlumXfCAiAcxGqn17zAOk3WL8ssEFJ
 r6xeHTQLXBIFuEXotWbmiLNHxxbDQI18JUQDP3ICp+/eB2pQKLl8gUEmvHE+4XvScc0=
X-Gm-Gg: ASbGncs11UihQ2J0ZmKQJWdCELXUp+hU8hjB/nJSmLA9qRretiUFRKsW38tQcuN/hdO
 yIjqSgukDMiaNU7koO2YKc6Znsyl0qc4zUKTSzkwjF9nM/JI2zNrqaqifx7OVh1mWsW5UBj/WmG
 5zuZQ5lDHsrvIJYoj8SIdKDIxZDq7fSWkWDK8v3UspkI8RBMhHKioQJ9Q+tvGiAJN2WeBUV8bwr
 YIb6gvg7l9++KcyxgP0iqMkmZ1IcZ/uNoh5pn5ah/19lUs+2q4SC8AcbNkzJjSLVZlK5uO1BHYl
 gO5p+hmry/OfvrWy2Y7QZ0t83TZw3Scb5Pso82+MVtfaGdp3mgV3Afldt4xrv2c6W1R8U1mvyFO
 dkNJF2UyGgIgMyHcVrFlxTJR62BaGyDdpx3CcGchv7taHFT45TK7aHhRE1VC0VZ6MGYrlKW4tf+
 Q8XuWl7E6UKUGtpkmfiWa1vgkD2FLy7z7l5GS2d/HSx/BEzQ==
X-Google-Smtp-Source: AGHT+IESZxgXwvIqIMj9dzYjccElH5tAxo9dER4LfWd2lD11GISceznOVY3S2mBydzghuiBWXmdJvQ==
X-Received: by 2002:a05:620a:700c:b0:892:a71a:bff with SMTP id
 af79cd13be357-899ea1350d1mr183689785a.44.1761089893141; 
 Tue, 21 Oct 2025 16:38:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e8ab0c8c1csm83229571cf.20.2025.10.21.16.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 16:38:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vBLvf-00000000cBo-0n5B;
 Tue, 21 Oct 2025 20:38:11 -0300
Date: Tue, 21 Oct 2025 20:38:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Yishai Hadas <yishaih@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Message-ID: <20251021233811.GB21554@ziepe.ca>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-27-michal.winiarski@intel.com>
 <20251021230328.GA21554@ziepe.ca>
 <aPgT1u1YO3C3YozC@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPgT1u1YO3C3YozC@lstrano-desk.jf.intel.com>
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

On Tue, Oct 21, 2025 at 04:14:30PM -0700, Matthew Brost wrote:
> On Tue, Oct 21, 2025 at 08:03:28PM -0300, Jason Gunthorpe wrote:
> > On Sat, Oct 11, 2025 at 09:38:47PM +0200, Michał Winiarski wrote:
> > > +	/*
> > > +	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't have the capability to
> > > +	 * selectively block p2p DMA transfers.
> > > +	 * The device is not processing new workload requests when the VF is stopped, and both
> > > +	 * memory and MMIO communication channels are transferred to destination (where processing
> > > +	 * will be resumed).
> > > +	 */
> > > +	if ((cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_STOP) ||
> > > +	    (cur == VFIO_DEVICE_STATE_RUNNING && new == VFIO_DEVICE_STATE_RUNNING_P2P)) {
> > > +		ret = xe_sriov_vfio_stop(xe_vdev->pf, xe_vdev->vfid);
> > 
> > This comment is not right, RUNNING_P2P means the device can still
> > receive P2P activity on it's BAR. Eg a GPU will still allow read/write
> > to its framebuffer.
> > 
> > But it is not initiating any new transactions.
> > 
> > > +static void xe_vfio_pci_migration_init(struct vfio_device *core_vdev)
> > > +{
> > > +	struct xe_vfio_pci_core_device *xe_vdev =
> > > +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> > > +	struct pci_dev *pdev = to_pci_dev(core_vdev->dev);
> > > +
> > > +	if (!xe_sriov_vfio_migration_supported(pdev->physfn))
> > > +		return;
> > > +
> > > +	/* vfid starts from 1 for xe */
> > > +	xe_vdev->vfid = pci_iov_vf_id(pdev) + 1;
> > > +	xe_vdev->pf = pdev->physfn;
> > 
> > No, this has to use pci_iov_get_pf_drvdata, and this driver should
> > never have a naked pf pointer flowing around.
> > 
> > The entire exported interface is wrongly formed:
> > 
> > +bool xe_sriov_vfio_migration_supported(struct pci_dev *pdev);
> > +int xe_sriov_vfio_wait_flr_done(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_run(struct pci_dev *pdev, unsigned int vfid);
> > +int xe_sriov_vfio_stop_copy_enter(struct pci_dev *pdev, unsigned int vfid);
> > 
> > None of these should be taking in a naked pci_dev, it should all work
> > on whatever type the drvdata is.
> 
> This seems entirely backwards. Why would the Xe module export its driver
> structure to the VFIO module? 

Because that is how we designed this to work. You've completely
ignored the safety protocols built into this method.

> That opens up potential vectors for abuse—for example, the VFIO
> module accessing internal Xe device structures.

It does not, just use an opaque struct type.

> much cleaner to keep interfaces between modules as opaque / generic
> as possible.

Nope, don't do that. They should be limited and locked down. Passing
random pci_devs into these API is going to be bad.

Jason
