Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C97E2A21
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEDD10E354;
	Mon,  6 Nov 2023 16:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5A710E354
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699288983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=demYFbT8NdCvlVcXbfq0xkIzU4JrzURf1aMU2MsFGP8=;
 b=N1Lzti0qvocj1MKpaYEdlJHzRopjXU3D9Ypbs3vp2kDjLwxVM7cmeIcvg4RzReXddZncM3
 W4EE08cRQdeZvs2YH4J+edn3xyLTYLZqBDE0DcfdEx/q2vYGPe63Rsok6z4ZmuwYNw1EB/
 74RlIsdOpaAoKQd8hWkog3kcyGW191M=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-6c-ABQGbNySOarfLpjGuVg-1; Mon, 06 Nov 2023 11:43:01 -0500
X-MC-Unique: 6c-ABQGbNySOarfLpjGuVg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9bf1047cb28so335869566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 08:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699288980; x=1699893780;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=demYFbT8NdCvlVcXbfq0xkIzU4JrzURf1aMU2MsFGP8=;
 b=Y0vmWQ01FzpNmjzRHgASQRiI/tFPa5jURy+EnY6JQ1Euzx2ZLFYfxpE48EV46Euw2J
 bq9gjltxgBNNjKZ8AaIVGoyiDD4IUql0Vjpw5f+uPf96lKKFQIESOHNZDAAjDI0iqQQQ
 xxMtpkPVeei/ET1Nv5V3z4z0Cfy7mf2rIfXKxqMFCa7wftwmhhpFi2oI7Shyl38qOOl4
 /QfooXosT/S5kS947bcMgfgjr1vYpgx5M3mUW5pFnB2uK8UhTnI3eGaBqzi5H7vBswQH
 mkWpTUZItnRUmKrV2gUbS6xHrgfvN48J/hC8SpjBkvfH/JKtVNbbKmI4ljru2wf+ukLe
 AmYg==
X-Gm-Message-State: AOJu0YwiA2W0mP5l2wu3jdqMcGnGAqAYxoWuRhXxHRQkCUfB0A3n0vJN
 r8BAxuM82coCT8UD+esaoyOJPLmz/HCMxmHzOdNAjU4XjktP+OFM+h/+VQLYTbEJoiVzmKwHe9T
 SPB0Gx3gXO4LJKKeKJDvNHCcN9DAv
X-Received: by 2002:a17:907:928e:b0:9bd:fc4b:6c9b with SMTP id
 bw14-20020a170907928e00b009bdfc4b6c9bmr13504478ejc.36.1699288980027; 
 Mon, 06 Nov 2023 08:43:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVPJsYG3aMdFI5JpPur2FeiziwRgTsK4RlEloHYDldOEJVfngzX+4WALEbu2FkUVLxIU9I7g==
X-Received: by 2002:a17:907:928e:b0:9bd:fc4b:6c9b with SMTP id
 bw14-20020a170907928e00b009bdfc4b6c9bmr13504461ejc.36.1699288979682; 
 Mon, 06 Nov 2023 08:42:59 -0800 (PST)
Received: from pollux ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a17090616d000b009ce03057c48sm16987ejd.214.2023.11.06.08.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 08:42:59 -0800 (PST)
Date: Mon, 6 Nov 2023 17:42:56 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Message-ID: <ZUkXkJ+zT7OFGosC@pollux>
References: <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com>
 <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com>
 <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com>
 <ZUj0DdYZUgjhcvf5@pollux>
 <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com>
MIME-Version: 1.0
In-Reply-To: <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 06, 2023 at 04:10:50PM +0100, Christian König wrote:
> Am 06.11.23 um 15:11 schrieb Danilo Krummrich:
> > On Mon, Nov 06, 2023 at 02:05:13PM +0100, Christian König wrote:
> > > Am 06.11.23 um 13:16 schrieb Danilo Krummrich:
> > > > [SNIP]
> > > > This reference count just prevents that the VM is freed as long as other
> > > > ressources are attached to it that carry a VM pointer, such as mappings and
> > > > VM_BOs. The motivation for that are VM_BOs. For mappings it's indeed a bit
> > > > paranoid, but it doesn't hurt either and keeps it consistant.
> > > Ah! Yeah, we have similar semantics in amdgpu as well.
> > > 
> > > But we keep the reference to the root GEM object and not the VM.
> > > 
> > > Ok, that makes much more sense then keeping one reference for each mapping.
> > > 
> > > > > Because of this the mapping should *never* have a reference to the VM, but
> > > > > rather the VM destroys all mapping when it is destroyed itself.
> > > > > 
> > > > > > Hence, If the VM is still alive at a point where you don't expect it to
> > > > > > be, then it's
> > > > > > simply a driver bug.
> > > > > Driver bugs is just what I try to prevent here. When individual mappings
> > > > > keep the VM structure alive then drivers are responsible to clean them up,
> > > > > if the VM cleans up after itself then we don't need to worry about it in the
> > > > > driver.
> > > > Drivers are *always* responsible for that. This has nothing to do with whether
> > > > the VM is reference counted or not. GPUVM can't clean up mappings after itself.
> > > Why not?
> > I feel like we're talking past each other here, at least to some extend.
> > However, I can't yet see where exactly the misunderstanding resides.
> 
> +1
> 
> > > At least in amdgpu we have it exactly like that. E.g. the higher level can
> > > cleanup the BO_VM structure at any time possible, even when there are
> > > mappings.
> > What do you mean with "cleanup the VM_BO structue" exactly?
> > 
> > The VM_BO structure keeps track of all the mappings mapped in the VM_BO's VM
> > being backed by the VM_BO's GEM object. And the GEM objects keeps a list of
> > the corresponding VM_BOs.
> > 
> > Hence, as long as there are mappings that this VM_BO keeps track of, this VM_BO
> > should stay alive.
> 
> No, exactly the other way around. When the VM_BO structure is destroyed the
> mappings are destroyed with them.

This seems to be the same misunderstanding as with the VM reference count.

It seems to me that you want to say that for amdgpu it seems to be a use-case
to get rid of all mappings backed by a given BO and mapped in a given VM, hence
a VM_BO. You can do that. Thers's even a helper for that in GPUVM.

But also in this case you first need to get rid of all mappings before you
*free* the VM_BO - GPUVM ensures that.

> 
> Otherwise you would need to destroy each individual mapping separately
> before teardown which is quite inefficient.

Not sure what you mean, but I don't see a difference between walking all VM_BOs
and removing their mappings and walking the VM's tree of mappings and removing
each of them. Comes down to the same effort in the end. But surely can go both
ways if you know all the existing VM_BOs.

> 
> > > The VM then keeps track which areas still need to be invalidated
> > > in the physical representation of the page tables.
> > And the VM does that through its tree of mappings (struct drm_gpuva). Hence, if
> > the VM would just remove those structures on cleanup by itself, you'd loose the
> > ability of cleaning up the page tables. Unless, you track this separately, which
> > would make the whole tracking of GPUVM itself kinda pointless.
> 
> But how do you then keep track of areas which are freed and needs to be
> updated so that nobody can access the underlying memory any more?

"areas which are freed", what do refer to? What do yo mean with that?

Do you mean areas of the VA space not containing mappings? Why would I need to
track them explicitly? When the mapping is removed the corresponding page tables
/ page table entries are gone as well, hence no subsequent access to the
underlaying memory would be possible.

> 
> > > I would expect that the generalized GPU VM handling would need something
> > > similar. If we leave that to the driver then each driver would have to
> > > implement that stuff on it's own again.
> > Similar to what? What exactly do you think can be generalized here?
> 
> Similar to how amdgpu works.

I don't think it's quite fair to just throw the "look at what amdgpu does"
argument at me. What am I supposed to do? Read and understand *every* detail of
*every* driver?

Did you read through the GPUVM code? That's a honest question and I'm asking it
because I feel like you're picking up some details from commit messages and
start questioning them (and that's perfectly fine and absolutely welcome).

But if the answers don't satisfy you or do not lead to a better understanding it
just seems you ask others to check out amdgpu rather than taking the time to go
though the proposed code yourself making suggestions to improve it or explicitly
point out the changes you require.

> 
> From what I can see you are basically re-inventing everything we already
> have in there and asking the same questions we stumbled over years ago.

I did not ask any questions in the first place. I came up with something that
Nouveau, Xe, Panthor, PowerVR, etc. required and that works for them.

They also all provided a lot of ideas and contributed code through the review
process.

Of course, I want this to work for amdgpu as well. So, if you think we're
missing something fundamential or if you see something that simply doesn't work
for other drivers, like amdgpu, please educate us. I'm surely willing to learn
and, if required, change the code.

But please don't just tell me I would re-invent amdgpu and assume that I know
all the details of this driver. None of that is reasonable.

> 
> > > > If the driver left mappings, GPUVM would just leak them without reference count.
> > > > It doesn't know about the drivers surrounding structures, nor does it know about
> > > > attached ressources such as PT(E)s.
> > > What are we talking with the word "mapping"? The BO_VM structure? Or each
> > > individual mapping?
> > An individual mapping represented by struct drm_gpuva.
> 
> Yeah than that certainly doesn't work. See below.
> 
> > > E.g. what we need to prevent is that VM structure (or the root GEM object)
> > > is released while VM_BOs are still around. That's what I totally agree on.
> > > 
> > > But each individual mapping is a different story. Userspace can create so
> > > many of them that we probably could even overrun a 32bit counter quite
> > > easily.
> > REFCOUNT_MAX is specified as 0x7fff_ffff. I agree there can be a lot of
> > mappings, but (including the VM_BO references) more than 2.147.483.647 per VM?
> 
> IIRC on amdgpu we can create something like 100k mappings per second and
> each takes ~64 bytes.
> 
> So you just need 128GiB of memory and approx 20 seconds to let the kernel
> run into a refcount overrun.

100.000 * 20 = 2.000.000

That's pretty far from REFCOUNT_MAX with 2.147.483.647. So, it's more like
20.000s if we can keep the pace and have enough memory. Also, it's not only the
mapping structures itself, it's also page tables, userspace structures, etc.

Again, is the number of ~2.15 Billion mappings something we really need to worry
about?

I'm still not convinced about that. But I think we can also just cap GPUVM at,
let's say, 1 Billion mappings?

> 
> The worst I've seen in a real world game was around 19k mappings, but that
> doesn't mean that this here can't be exploited.
> 
> What can be done is to keep one reference per VM_BO structure, but I think
> per mapping is rather unrealistic.
> 
> Regards,
> Christian.
> 
> 

