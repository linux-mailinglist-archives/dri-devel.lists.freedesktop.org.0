Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02067520B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 11:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFA110E0E7;
	Fri, 20 Jan 2023 10:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AC110E0E7;
 Fri, 20 Jan 2023 10:08:38 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6CD116602AAA;
 Fri, 20 Jan 2023 10:08:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674209316;
 bh=mGZMRhz079cBUS3es9XAvPfXNBT914As8zfpB8Pu9n4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZWHBopnaIcDi261qkYCZ/g4fD7bEZ1Ek8PwKjhKVuNsNx1nenWz+K7ID4TSR7SWO5
 XFvWgQ2lRRZE5EzQkG92UzEV8UExou8CWSm5mjZJPVQTZuHO+7+6X3vUv8rJCsVc85
 iubV3oJ1y0d+jEIMqMySOLl0Zyx2y9f6RX8DV78Vt9W19exCH3eumax91ZnZZ5qCrJ
 LA/ahTmOejcx+9iWNauPHVSAz0xPmhcAJSLTeUpATtXNBKMcdF4SszpfmF4WURSDHV
 cU9sHbYnW0giNFNPwFCJLP0GQa8bbkAbt6oI+Eyo4IoEijpplAPvWdmk7FHtahrGSy
 DFhERHKe3a5FQ==
Date: Fri, 20 Jan 2023 11:08:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <20230120110833.76cc7864@collabora.com>
In-Reply-To: <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
 <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
 <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: jason@jlekstrand.net, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 \(Intel\)" <thomas_os@shipmail.org>, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, bskeggs@redhat.com, tzimmermann@suse.de,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023 04:58:48 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> > For the ops structures the drm_gpuva_manager allocates for reporting the
> > split/merge steps back to the driver I have ideas to entirely avoid
> > allocations, which also is a good thing in respect of Christians feedback
> > regarding the huge amount of mapping requests some applications seem to
> > generate.
> >  
> 
> It should be fine to have allocations to report the split/merge step as
> this step should be before a dma-fence is published, but yea if possible
> to avoid extra allocs as that is always better.
> 
> Also BTW, great work on drm_gpuva_manager too. We will almost likely
> pick this up in Xe rather than open coding all of this as we currently
> do. We should probably start the port to this soon so we can contribute
> to the implementation and get both of our drivers upstream sooner.

Also quite interested in using this drm_gpuva_manager for pancsf, since
I've been open-coding something similar. Didn't have the
gpuva_region concept to make sure VA mapping/unmapping requests don't
don't go outside a pre-reserved region, but it seems to automate some
of the stuff I've been doing quite nicely.
