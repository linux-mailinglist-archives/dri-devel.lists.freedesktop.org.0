Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D248F801554
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 22:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F1C10E960;
	Fri,  1 Dec 2023 21:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64A310E955
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 21:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701466107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UUNJhovhxDWkDFPAMnfAwC1ubpD33wNi22hZbkOdQG4=;
 b=EML2Yct9Q5Q150OTpt4BDMzhvWauQHPB9wlYMUH1YIt962vJLaTn3i2/ZM9K9L6w20BrcZ
 wrIW+Ok+gi6IVFxtsHcF86wdLyNv6wdQKSTglqNxxT114YUuPgwWHQ4CSI6j/ssMeYyIjO
 lYuMvldoa3cYTqkuptINzOC8jc+8AHs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-NvzAaNYrOpWGzuLzorIUXA-1; Fri, 01 Dec 2023 16:28:26 -0500
X-MC-Unique: NvzAaNYrOpWGzuLzorIUXA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40b4302eac2so3640255e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 13:28:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701466104; x=1702070904;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UUNJhovhxDWkDFPAMnfAwC1ubpD33wNi22hZbkOdQG4=;
 b=JM4W60Ki16zkHKN1cm3HFqPeOne+DmeFZfiqtiPgx5hF/1TUA5jjo9/kPo+HE+MD6i
 WshCC5kHVWdNga4BE6ZIPMjtY3M/6pdxG4EbjeortpnrCCHfKIohKjg/nhRSdd0A2l8d
 JEbL8He46Xh1fNdWmpnXg1bLZpuFF7tIx6HQHp3an6NzDsWYuwrQTfNIrc7IxuoYuUr/
 aj2tiEnq/EAf/esteo3Xl/1kjcHJO8XRLA0mw3fBInUQwROYhWHR1FpnWys+jHPa5s4l
 dO3XNJLeYMCFry969Iit/JKvKBRwyIzH/1B4gPgNi+3WmmGZ+N7cbIcudt+mVG1v6SlB
 +/WQ==
X-Gm-Message-State: AOJu0Yx6P7vviZBTWf7ChNOXlkbZCZ3lsK4Qz3Fxdom1SIf1OrOoJa89
 NVK4aIf6GdPWsOLd/RjdpyqHGakqYfPifruvN2bHixtZ3RPvLxRkt434dVL5V0iqP9lHnMeskSq
 5g+oFtXirn6FYMgUt6Vdcv7lTs63f
X-Received: by 2002:a05:600c:3b0c:b0:40b:2708:2a52 with SMTP id
 m12-20020a05600c3b0c00b0040b27082a52mr18152279wms.1.1701466104545; 
 Fri, 01 Dec 2023 13:28:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfUmJdkt3klwZNkyde29RxHzTz93JITy0dZ4hSD+JbHbAIpP9rugYgkrNYQVamZ+NsZXuI/A==
X-Received: by 2002:a05:600c:3b0c:b0:40b:2708:2a52 with SMTP id
 m12-20020a05600c3b0c00b0040b27082a52mr18152255wms.1.1701466104087; 
 Fri, 01 Dec 2023 13:28:24 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32e2:4e00:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 v9-20020adfe4c9000000b0032d9f32b96csm5104539wrm.62.2023.12.01.13.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 13:28:23 -0800 (PST)
Message-ID: <2598c65b1e9d9458e3bca7646e0504a58faa70f8.camel@redhat.com>
Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory management)
 for external memory devices
From: Philipp Stanner <pstanner@redhat.com>
To: zhuweixi <weixi.zhu@huawei.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Dave Airlie <airlied@gmail.com>
Date: Fri, 01 Dec 2023 22:28:21 +0100
In-Reply-To: <4a7eb924297341708400949a8a62b277@huawei.com>
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <9308a79d-e312-4e6d-98fe-75dc6d0fbeda@amd.com>
 <CAPM=9tx-d-Au_bjX0vYxv6OwqiSjmbbMC7ebWpTsQgFNddWDuw@mail.gmail.com>
 <a07fd33c6f9e44418c528de06f89707e@huawei.com>
 <8b3673c7-d0b9-4509-938f-eb8d4f158367@amd.com>
 <6f5d849a16084f68a2e24a7810eac433@huawei.com>
 <0973526a-ea8e-4a1d-8684-2d49a772c04a@amd.com>
 <4a7eb924297341708400949a8a62b277@huawei.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "leonro@nvidia.com" <leonro@nvidia.com>,
 "apopple@nvidia.com" <apopple@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Danilo Krummrich <dakr@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "jgg@nvidia.com" <jgg@nvidia.com>,
 "zhi.a.wang@intel.com" <zhi.a.wang@intel.com>,
 "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
 "ziy@nvidia.com" <ziy@nvidia.com>,
 "weixi.zhu@openeuler.sh" <weixi.zhu@openeuler.sh>,
 "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "mhairgrove@nvidia.com" <mhairgrove@nvidia.com>, "Zeng,
 Oak" <oak.zeng@intel.com>, "jglisse@redhat.com" <jglisse@redhat.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2023-12-01 at 02:37 +0000, zhuweixi wrote:
> From your argument on KVM I can see that the biggest miscommunication
> between us is that you believed that GMEM wanted to share the whole
> address space. No, it is not the case. GMEM is only providing
> coordination via certain mmap() calls. So you are raising a case
> supporting GMEM again -- passthrough part of the CPU addresses space
> instead of passthrough the whole CPU address space, is exactly what
> GMEM can do. On the other side, the IOMMU SVA feature wildly binds
> the whole address space -- since the hardware feature is to directly
> share the whole CPU page table.
>=20
> "We really should never ever encourage people to bind their device
> address space to the CPU address space. This is a very special use
> case and limits the driver design to only this use case.
> We have exercised this approach to a rather extreme degree with KFD
> and I can clearly say that doing this was a really big mistake.
> As far as I can see you are about to repeat that mistake and even
> encourage others to do so as well."
>=20
> -- The behavior of internally "attach device context to mm_struct" in
> GMEM is ultimately a different approach to coordinate CPU and
> devices. I want to replace MMU notifiers with this approach because I
> want to protect core MM from random interactions with external driver
> MMs. Both GMEM and MMU notifiers are binding device contexts to the
> CPU context, not putting them in the same address space. If someone
> is against GMEM's approach for binding CPU and device context, then
> someone should be against MMU notifiers as well.
>=20
> Currently, from our discussion I think I received two messages:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A01. The original AMDKFD de=
sign was rejected because of
> inserting vendor-specific stuff to the generic core MM.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02. The rejection from #1 =
led to your opinion that anyone
> cannot mix device and core MM together.

That's precisely not what Christian wrote:

"KFD was meant to be a vendor agnostic framework, very similar to what=20
you propose here.

It's just that it was seen as vendor specific because nobody else=20
actually wanted to design the their drivers this way."


It may be that the original discussion about AMDKFD could hint at #1,
but the one here certainly does not ;)


P.

>=20
> I think #1 really encouraged me that GMEM could help the AMDKFD
> driver. However I am also confused that why GMEM must be compared
> with a vendor-specific driver. AMDKFD was only considering a very
> special use case: AMD GPUs using AMD IOMMU.=20
> However, GMEM is trying to consider all generalized cases of memory
> devices. The device can be Nvidia's GPU and Huawei's NPU that use
> their own MMUs, or AMD/Intel GPUs that use IOMMUs, or other hundreds
> of new accelerator vendors.
>=20
> -Weixi
>=20
> -----Original Message-----
> From: Christian K=C3=B6nig <christian.koenig@amd.com>=20
> Sent: Thursday, November 30, 2023 9:05 PM
> To: zhuweixi <weixi.zhu@huawei.com>; Dave Airlie <airlied@gmail.com>
> Cc: linux-mm@kvack.org; linux-kernel@vger.kernel.org;
> akpm@linux-foundation.org; weixi.zhu@openeuler.sh; mgorman@suse.de;
> jglisse@redhat.com; rcampbell@nvidia.com; jhubbard@nvidia.com;
> apopple@nvidia.com; mhairgrove@nvidia.com; ziy@nvidia.com;
> alexander.deucher@amd.com; Xinhui.Pan@amd.com;
> amd-gfx@lists.freedesktop.org; Felix.Kuehling@amd.com;
> ogabbay@kernel.org; dri-devel@lists.freedesktop.org; jgg@nvidia.com;
> leonro@nvidia.com; zhenyuw@linux.intel.com; zhi.a.wang@intel.com;
> intel-gvt-dev@lists.freedesktop.org; intel-gfx@lists.freedesktop.org;
> jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com;
> rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com; Danilo
> Krummrich <dakr@redhat.com>; Daniel Vetter <daniel@ffwll.ch>; Zeng,
> Oak <oak.zeng@intel.com>
> Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
> management) for external memory devices
>=20
> Am 30.11.23 um 08:22 schrieb zhuweixi:
> > Add @Oak to the KFD discussion. I will reply separately elaborating
> > your questions on GMEM's difference from HMM/MMU notifiers.
> >=20
> > Christian, thanks for pointing me to that AMDKFD discussion. I have
> > read the discussion around the AMDKFD skeleton patch and found the
> > previous discussion in the following URLs:
> > https://lore.kernel.org/dri-devel/1405028848-5660-1-git-send-email-ode
> > d.gabbay@amd.com/#r=20
> > https://lore.kernel.org/dri-devel/20140711154231.GB1870@gmail.com/
> >=20
> > I believe AMDKFD's original patch was rejected mostly because of
> > inserting vendor-specific stuff to the generic core MM.=C2=A0 J=C3=A9r=
=C3=B4me has
> > clearly stated this issue in the second URL. If the code is vendor-
> > specific then it has no place in core MM, period.
> >=20
> > But why does that vendor-specific solution relate to a generalized
> > solution like GMEM? The initial AMDKFD patch doesn't work for
> > Nvidia or Intel.
>=20
> KFD was meant to be a vendor agnostic framework, very similar to what
> you propose here.
>=20
> It's just that it was seen as vendor specific because nobody else
> actually wanted to design the their drivers this way.
>=20
> >=20
> > In fact I think the rejection of the initial AMDKFD patch supports
> > GMEM's idea -- there could have been a simpler AMDKFD
> > implementation if the core MM was extended by GMEM. Also, after 9
> > years, there are so many other companies building their
> > accelerators over the past few years, especially now the GPT-family
> > has made a much bigger success. Don't we want to advance Linux's
> > core MM for more friendly and generalized support for the upcoming
> > new vendors?
>=20
> Well exactly that's the big point: Absolutely not!
>=20
> We really should never ever encourage people to bind their device
> address space to the CPU address space. This is a very special use
> case and limits the driver design to only this use case.
>=20
> We have exercised this approach to a rather extreme degree with KFD
> and I can clearly say that doing this was a really big mistake.
>=20
> As far as I can see you are about to repeat that mistake and even
> encourage others to do so as well.
>=20
> > Now answering Christian's design concerns:
> >=20
> > 1. "There are cases that do not want to share CPU address space"
> > Maybe, but I am not fully convinced. The current case we can find
> > is when a NIC utilizes IOMMU for security. For this case, GMEM
> > implemented a generalized VMA support and tested it with NICs using
> > both Intel-IOMMU/Arm-SMMU. This cut 600 LoC of IOVA management code
> > from the IOMMU driver, but it is still not included in this RFC
> > patch -- I cannot find other cases demanding this isolation. The
> > isolation is also unnecessary -- the NIC can enable the IOMMU SVM
> > feature to share the CPU address space. As of KVM, it is
> > essentially a host process that utilizes two different MMUs within
> > the same address space, so it fits GMEM's design...
>=20
> Maybe I don't completely follow here how you want to save LoC for the
> IOMMU implementation of NICs, but at least for the PASID/PRI support
> AMD just recently gone exactly the opposite direction:
>=20
> commit 5a0b11a180a9b82b4437a4be1cf73530053f139b
> Author: Vasant Hegde <vasant.hegde@amd.com>
> Date:=C2=A0=C2=A0 Fri Oct 6 09:57:02 2023 +0000
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 iommu/amd: Remove iommu_v2 module
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 AMD GPU driver which was the only in-kernel user=
 of iommu_v2
> module
> =C2=A0=C2=A0=C2=A0=C2=A0 removed dependency on iommu_v2 module.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 Also we are working on adding SVA support in AMD=
 IOMMU driver.
> Device
> =C2=A0=C2=A0=C2=A0=C2=A0 drivers are expected to use common SVA framework=
 to enable
> device
> =C2=A0=C2=A0=C2=A0=C2=A0 PASID/PRI features.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 Removing iommu_v2 module and then adding SVA sim=
plifies the
> development.
> =C2=A0=C2=A0=C2=A0=C2=A0 Hence remove iommu_v2 module.
>=20
> As I wrote before this IOMMU V2 driver was basically binding the CPU
> address space to IOMMU devices using the PASID. For an example see
> function amd_iommu_bind_pasid().
>=20
> This turned out to be not as useful as we hoped it would be.
> Essentially the use case where you want to give a device access to
> the whole address space of a process are extremely limited. That's
> why we are removing it and switching over to a separate SVA
> implementation which doesn't depend on the CPU address space.
>=20
>=20
> But the virtualization use case I mentioned is completely independent
> of IOMMU. In KVM/XEN/etc.. there is a functionality called native
> context, basically what this means is that instead of passing through
> complete device isolated by IOMMU only specific kernel
> functionalities are exposed to the guest operating system through
> QEMU.
>=20
> See here for an example how OpenGL is implemented on top of this:=20
> https://docs.mesa3d.org/drivers/virgl.html
>=20
> This is actually using the separation between device memory
> management and CPU memory management and is basically a killer
> argument why those two topics should be separated. Otherwise it's
> impossible for QEMU to actually handle multiple independent device
> memory address spaces inside a single CPU memory address space.
>=20
> > 2. "This does not integrate well with the filesystem layer in
> > Linux..."
> > To be honest, not using a logical page table for anonymous memory
> > is why Linux THP fails compared with FreeBSD's superpage, but I am
> > not going to elaborate it here. But yes, and I am looking for
> > merging struct vm_object->logical_page_table with struct
> > address_space->i_pages. This will make a natural support for
> > devices oversubscribing both host DRAM and disks. As explained in
> > my cover letter, struct vm_object borrows FreeBSD's VM design -- it
> > provides a unified abstraction layer for anonymous, file-backed
> > memory and etc.
>=20
> I'm not that deep into this stuff, so leaving this to the experts on
> FreeBSD.
>=20
> > 3. "Requirements to CPU address space management and device address
> > space management are just massively different. For example huge and
> > giant pages are a must have for modern devices..."
> > I think you are asking two questions. First, is VA space a problem?
>=20
> No, this is about something completely different.
>=20
> > GMEM assumes that device VA space should be covered by CPU VA space
> > (sorry i386), ...
> [SNIP]
>=20
> I'm removing this because you were talking about something different
> than what I meant.
>=20
> I will try to explain the background on an example outside of machine
> learning and compute since this framework should be applicable to
> every use case and not be limited to those. Otherwise Linux would
> sooner or later just be applicable to only those use cases.
>=20
> So let's take a look at how modern games use a GPU for example. On
> startup a rather large part of the GPU address space is allocated,
> for example 64GiB. Then the necessary resources (images, texture,
> vertices, shaders etc..) are loaded into separate buffer objects.
>=20
> Those resources are then mapped into the allocated address on a page
> by page basis. So you basically don't have large VMAs which cover one
> resource, but rather the page tables are used as a remapping table
> =C2=A0=C2=A0into the available resources. This increases the number of vi=
rtual
> mappings drastically, it's kind of comparable how an anon_vma works
> inside a VMA on Linux.
>=20
> Those mappings also are not setup at start and then used throughout
> the whole lifetime of the process, but rather done very dynamically
> sometimes resulting in thousands of mapping operations per second.
>=20
> Additional to that devices have page table feature which CPUs don't
> have. This ranges from support for partial resident texture over
> flags how caching and dynamic color space compression is made.
>=20
> So the mappings contain tons of device specific information and it's
> most likely not even possible to handle all of this with a device
> independent mmap() call.
>=20
> > 4. "The argument that a shared memory management leads to less bugs
> > has also absolutely not be proven true. Instead we literally spend
> > month if not years hunting down bugs which resulted from
> > interaction between CPU and devices."
> > This is another case supporting GMEM. Don't developers want to let
> > GMEM handle the CPU-device interaction so that they can waive
> > months of debugging cost?
>=20
> No, we already have HMM for that.
>=20
> Regards,
> Christian.
>=20
> >=20
> > PS, hmadvise() is based on the idea of Nvidia's cudaMemAdvise()
> > which provides abundant and useful memory policies. HMM extended
> > mbind() instead.
> >=20
> > -Weixi
> >=20
> > -----Original Message-----
> > From: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Sent: Wednesday, November 29, 2023 11:22 PM
> > To: zhuweixi <weixi.zhu@huawei.com>; Dave Airlie
> > <airlied@gmail.com>
> > Cc: linux-mm@kvack.org; linux-kernel@vger.kernel.org;=20
> > akpm@linux-foundation.org; weixi.zhu@openeuler.sh; mgorman@suse.de;
> > jglisse@redhat.com; rcampbell@nvidia.com; jhubbard@nvidia.com;=20
> > apopple@nvidia.com; mhairgrove@nvidia.com; ziy@nvidia.com;=20
> > alexander.deucher@amd.com; Xinhui.Pan@amd.com;=20
> > amd-gfx@lists.freedesktop.org; Felix.Kuehling@amd.com;=20
> > ogabbay@kernel.org; dri-devel@lists.freedesktop.org;
> > jgg@nvidia.com;=20
> > leonro@nvidia.com; zhenyuw@linux.intel.com; zhi.a.wang@intel.com;=20
> > intel-gvt-dev@lists.freedesktop.org;
> > intel-gfx@lists.freedesktop.org;=20
> > jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com;=20
> > rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com
> > Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory=20
> > management) for external memory devices
> >=20
> > Am 29.11.23 um 09:27 schrieb zhuweixi:
> > > Glad to hear that more sharable code is desirable.
> > > IMHO, for a common MM subsystem, it is more beneficial for GMEM
> > > to=20
> > > extend core MM instead of building a separate one.
> > >=20
> > > As stated in the beginning of my RFC letter, MM systems are large
> > > and=20
> > > similar. Even a sophisticated one like Linux MM that has evolved
> > > over=20
> > > decades still suffers from an increasing number of bugs[1]. So,=20
> > > directly extending core MM to support devices not only avoids
> > > opening=20
> > > a new box of bugs, but also allows the community to concentrate
> > > on=20
> > > maintaining one single MM system. On the other side, GMEM does no
> > > hurt to core MM If a CPU process is not attached with device
> > > contexts.
> > >=20
> > > @Christian, could you provide more information on what AMD
> > > proposed=20
> > > with KFD and why it was rejected?
> > Well, this is going to be a longer explanation.
> >=20
> > The combination of KFD and HMM is based on essentially on the same
> > idea as this code here. Even the initial KFD implementation was
> > very similar in the sense that it added device contexts to
> > mm_struct and tried to manage GPU/acceleration MM the same way as
> > CPU MM. On other words it was basically identical to your
> > gm_dev_create() and gm_mmu approach.
> >=20
> > As mentioned before this initial proposal was rejected, for more
> > background see the discussion around "amdkfd: Add amdkfd skeleton
> > driver" on the dri-devel mailing list between 2013 and 2014. You
> > need to dig up the whole discussion from the mailing list, but
> > summarizing it the general feeling was that it would be a mistake
> > to tie device drivers to close to CPU memory management (and stable
> > UAPI) without validating that this is really the right thing to do.
> >=20
> > So instead of the original implementation KFD has gone upstream
> > with a much less invasive approach where a device contexts are just
> > on demand looked up for each mm_struct. Felix can probably provide
> > some pointers to the implementation.
> >=20
> > On the initially supported hardware the KFD used the PCIe ATC
> > feature to allow routing of memory accesses directly into the
> > associated CPU process address space, later on we switched to an
> > MMU notifier/HMM based approach to give similar functionality to
> > the userspace stack on top of it for devices which doesn't support
> > the ATC path was just recently completely removed and we are now
> > only using MMU notifiers/HMM.
> >=20
> > HMM tried to add similar functionality like you propose with the
> > mmap() flag and hmadvise() call. The hmadvise() extension actually
> > looks so familiar to the HMM proposal that I would expect that this
> > is actually based on that code.
> >=20
> > All this turned out to have some major design issues.
> >=20
> > First of all you have a rather large group of use cases where you
> > don't want your device to mirror the address space of your process.
> > Just think of thinks like QEMU, KVM, XEN, in general virtualization
> > and container handling. Linux has the mantra that everything is a
> > file and if it's not a file it should be a file and when you tie
> > device memory management into CPU memory management you are pretty
> > much violating exactly that.
> >=20
> > Second this doesn't integrate well with the filesystem layer in
> > Linux.
> > For example we do have struct pages for HMM exposed device memory,
> > but=20
> > for I/O we still migrate this back to system memory because of (for
> > example) the page lock requirements around writeback.
> >=20
> > Then third it turned out that the requirements to CPU address space
> > management and device address space management are just massively
> > different. For example huge and giant pages are a must have for
> > modern devices, on the CPU side we are barely switching over to
> > folios now to add similar functionality.
> >=20
> > The argument that a shared memory management leads to less bugs has
> > also absolutely not be proven true. Instead we literally spend
> > month if not years hunting down bugs which resulted from
> > interaction between CPU and devices.
> > ...
> >=20
> > There are a couple of more things on this contra side to that
> > approach, but I think that would just make this mail unnecessary
> > long.
> >=20
> > To sum it up from over a decade of experience working in this area
> > I can just say that CPU and device memory management should
> > absolutely *NOT* be mixed. We had those ideas multiple times
> > before, but they either failed because they didn't integrated well
> > with the core OS or the hardware support is just lagging behind the
> > actual requirements.
> >=20
> > What can be done and where I completely agree with Dave is that
> > having common components which provides device drivers with the
> > necessary functionality to manage their device address space is
> > really good idea.
> > Danilo is for example working on a GPUVM component to have common
> > virtual address space management and I'm at least sometimes working
> > on MMU notifier/HMM improvements.
> >=20
> > Providing SVM functionality to your userspace stack is still a
> > really good idea, but it should be done with MMU notifiers and
> > components which are separate to your CPU memory management instead
> > of tying it directly to the CPU address space.
> >=20
> > Regards,
> > Christian.
> >=20
> > > [1] Huang, Jian, Moinuddin K. Qureshi, and Karsten Schwan. "An
> > > evolutionary study of linux memory management for fun and
> > > profit." 2016 USENIX Annual Technical Conference (USENIX ATC 16).
> > > 2016.
> > >=20
> > > Thanks,
> > > Weixi
> > >=20
> > > -----Original Message-----
> > > From: Dave Airlie <airlied@gmail.com>
> > > Sent: Wednesday, November 29, 2023 1:15 PM
> > > To: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: zhuweixi <weixi.zhu@huawei.com>; linux-mm@kvack.org;=20
> > > linux-kernel@vger.kernel.org; akpm@linux-foundation.org;=20
> > > weixi.zhu@openeuler.sh; mgorman@suse.de; jglisse@redhat.com;=20
> > > rcampbell@nvidia.com; jhubbard@nvidia.com; apopple@nvidia.com;=20
> > > mhairgrove@nvidia.com; ziy@nvidia.com; alexander.deucher@amd.com;
> > > Xinhui.Pan@amd.com; amd-gfx@lists.freedesktop.org;=20
> > > Felix.Kuehling@amd.com; ogabbay@kernel.org;=20
> > > dri-devel@lists.freedesktop.org; jgg@nvidia.com;
> > > leonro@nvidia.com;=20
> > > zhenyuw@linux.intel.com; zhi.a.wang@intel.com;=20
> > > intel-gvt-dev@lists.freedesktop.org;
> > > intel-gfx@lists.freedesktop.org;=20
> > > jani.nikula@linux.intel.com; joonas.lahtinen@linux.intel.com;=20
> > > rodrigo.vivi@intel.com; tvrtko.ursulin@linux.intel.com
> > > Subject: Re: [RFC PATCH 0/6] Supporting GMEM (generalized memory
> > > management) for external memory devices
> > >=20
> > > On Tue, 28 Nov 2023 at 23:07, Christian K=C3=B6nig
> > > <christian.koenig@amd.com> wrote:
> > > > Am 28.11.23 um 13:50 schrieb Weixi Zhu:
> > > > > The problem:
> > > > >=20
> > > > > Accelerator driver developers are forced to reinvent external
> > > > > MM=20
> > > > > subsystems case by case, because Linux core MM only considers
> > > > > host memory resources.
> > > > > These reinvented MM subsystems have similar orders of
> > > > > magnitude of=20
> > > > > LoC as Linux MM (80K), e.g. Nvidia-UVM has 70K, AMD GPU has
> > > > > 14K and=20
> > > > > Huawei NPU has 30K. Meanwhile, more and more vendors are=20
> > > > > implementing their own accelerators, e.g. Microsoft's Maia
> > > > > 100. At=20
> > > > > the same time, application-level developers suffer from poor=20
> > > > > programmability -- they must consider parallel address spaces
> > > > > and=20
> > > > > be careful about the limited device DRAM capacity. This can
> > > > > be=20
> > > > > alleviated if a malloc()-ed virtual address can be shared by
> > > > > the=20
> > > > > accelerator, or the abundant host DRAM can further
> > > > > transparently backup the device local memory.
> > > > >=20
> > > > > These external MM systems share similar mechanisms except for
> > > > > the=20
> > > > > hardware-dependent part, so reinventing them is effectively=20
> > > > > introducing redundant code (14K~70K for each case). Such=20
> > > > > developing/maintaining is not cheap. Furthermore, to share a=20
> > > > > malloc()-ed virtual address, device drivers need to deeply
> > > > > interact=20
> > > > > with Linux MM via low-level MM APIs, e.g. MMU notifiers/HMM.
> > > > > This=20
> > > > > raises the bar for driver development, since developers must=20
> > > > > understand how Linux MM works. Further, it creates code
> > > > > maintenance=20
> > > > > problems -- any changes to Linux MM potentially require
> > > > > coordinated changes to accelerator drivers using low-level MM
> > > > > APIs.
> > > > >=20
> > > > > Putting a cache-coherent bus between host and device will not
> > > > > make=20
> > > > > these external MM subsystems disappear. For example, a=20
> > > > > throughput-oriented accelerator will not tolerate executing
> > > > > heavy=20
> > > > > memory access workload with a host MMU/IOMMU via a remote
> > > > > bus.
> > > > > Therefore, devices will still have their own MMU and pick a
> > > > > simpler=20
> > > > > page table format for lower address translation overhead,
> > > > > requiring external MM subsystems.
> > > > >=20
> > > > > --------------------
> > > > >=20
> > > > > What GMEM (Generalized Memory Management [1]) does:
> > > > >=20
> > > > > GMEM extends Linux MM to share its machine-independent MM
> > > > > code.=20
> > > > > Only high-level interface is provided for device drivers.
> > > > > This=20
> > > > > prevents accelerator drivers from reinventing the wheel, but
> > > > > relies=20
> > > > > on drivers to implement their hardware-dependent functions
> > > > > declared=20
> > > > > by GMEM. GMEM's key interface include gm_dev_create(),=20
> > > > > gm_as_create(),
> > > > > gm_as_attach() and gm_dev_register_physmem(). Here briefly
> > > > > describe=20
> > > > > how a device driver utilizes them:
> > > > > 1. At boot time, call gm_dev_create() and registers the
> > > > > implementation of
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hardware-dependent functions as de=
clared in struct
> > > > > gm_mmu.
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - If the device has lo=
cal DRAM, call
> > > > > gm_dev_register_physmem() to
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register a=
vailable physical addresses.
> > > > > 2. When a device context is initialized (e.g. triggered by
> > > > > ioctl), check if
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the current CPU process has been a=
ttached to a gmem
> > > > > address space
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (struct gm_as). If not, call gm_as=
_create() and point
> > > > > current->mm->gm_as
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to it.
> > > > > 3. Call gm_as_attach() to attach the device context to a gmem
> > > > > address space.
> > > > > 4. Invoke gm_dev_fault() to resolve a page fault or prepare
> > > > > data before
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device computation happens.
> > > > >=20
> > > > > GMEM has changed the following assumptions in Linux MM:
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 1. An mm_struct not only handle a single=
 CPU context,
> > > > > but may also handle
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 external memory contex=
ts encapsulated as gm_context
> > > > > listed in
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mm->gm_as. An external=
 memory context can include a
> > > > > few or all of the
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 following parts: an ex=
ternal MMU (that requires TLB
> > > > > invalidation), an
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 external page table (t=
hat requires PTE manipulation)
> > > > > and external DRAM
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (that requires physica=
l memory management).
> > > > Well that is pretty much exactly what AMD has already proposed
> > > > with=20
> > > > KFD and was rejected for rather good reasons.
> > > > > MMU functions
> > > > > The MMU functions peer_map() and peer_unmap() overlap other=20
> > > > > functions, leaving a question if the MMU functions should be=20
> > > > > decoupled as more basic operations. Decoupling them could=20
> > > > > potentially prevent device drivers coalescing these basic
> > > > > steps=20
> > > > > within a single host-device communication operation, while
> > > > > coupling=20
> > > > > them makes it more difficult for device drivers to utilize
> > > > > GMEM interface.
> > > > Well to be honest all of this sounds like history to me. We
> > > > have=20
> > > > already seen the same basic approach in KFD, HMM and to some
> > > > extend in TTM as well.
> > > >=20
> > > > And all of them more or less failed. Why should this here be
> > > > different?
> > > Any info we have on why this has failed to work in the past would
> > > be=20
> > > useful to provide. This is one of those cases where we may not
> > > have=20
> > > documented the bad ideas to stop future developers from thinking
> > > they=20
> > > are bad.
> > >=20
> > > I do think we would want more common code in this area, but I
> > > would=20
> > > think we'd have it more on the driver infrastructure side, than
> > > in=20
> > > the core mm.
> > >=20
> > > Dave.
>=20

