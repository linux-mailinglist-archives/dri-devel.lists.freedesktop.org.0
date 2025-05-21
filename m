Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E0ABF5B7
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA03112891;
	Wed, 21 May 2025 13:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WQrD2BfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0500712BBFF;
 Wed, 21 May 2025 12:43:28 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-47691d82bfbso131187961cf.0; 
 Wed, 21 May 2025 05:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747831408; x=1748436208; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hgjwFdM2k5sCslQZdWwlZbIspHEoXzqe2FcVDJivI+o=;
 b=WQrD2BfLb7xgYSsuJ83dg2UPLqYzcJqz28V9iOBg7XznJou387i79UdViIvxVvI6dx
 tLOWSx1DKGdrrbe9BncyTgFyZS4DJmGYLN24PpVCs/99Us//3DzCp81DG/KXPdVflqLI
 cwYJ9RROMirJz7Zeu+YF9u4wJySjnZPfV/y5C4aRBzTmRts32xcc9y2NPS41zQ3orqSt
 nCpPjDI+LN4nYoSOWCffGZe3VDp6TB9WhBQtBI9ZcAiMGggC9IQKeZV/7QAI8fuJ4SHL
 r4vl11GgKdIDijWAP94qrr5Z+KUYBvrl5BjPwJPqTIUxNnr/UNJm4DPFQCLM7bY631gH
 rUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747831408; x=1748436208;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hgjwFdM2k5sCslQZdWwlZbIspHEoXzqe2FcVDJivI+o=;
 b=A3oufzoI4y3DZX6D9/5VylbrwkwgexXgb5/ebDAte5epEjeKoAnb3VQ8Ittladm8h1
 VScICaBgHQt+MujbMAXwgnNJgbr22ibY1vM6og39qfr6IS67XPz1HMspxSKRBQnzmO2N
 NawrY6KmloFt718OVPJwVdsSXQ/azJjSAWFD9RQ9gqURi9RNMJL/dkhYJVOUv+6Z1tQu
 qBaz0Gj4p5ZUSCYU+c4E2nh417XRaibiiZ6Vqkj5pIjC7YP/XSETA2ufHBG9bvht5TCa
 b133i23jrotOpDcFXWfA3//PmAtTO0m8N6Pdz5AboAJO/+GsJPZZRSemIffTxyEjGWyt
 y/Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQGd6dxFoBfGHImZOoUvccI7x+IcC08K+R5Ccd79TOPXfIai4GIoQCtVY5A4jqKCFULOKyfqILM8o=@lists.freedesktop.org,
 AJvYcCXVK3/pXLLj6c6mtQTB2+F53QnOD5LYaXY8lFFtQMFoDL38KWGz33EIIss6q+qT6FcpF0gLMZyYrA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXlY6AS0Hwh1jhlACdkwiKx+CP46smVB2vcSpyZJrWqYg8hEpZ
 G5bRzf0nGJ8FUXv60TaJWYESI8OShxN7nuoLjc8m9SBHN68dEZwHo00m
X-Gm-Gg: ASbGncuY6LMSNJShDoCqgPX4b2deytelUoov95NzR3pr67i7TlB7co9Ob6f/+o/Hkqx
 CiRePIlTKJsC5Xd9Jz/jh5PTtY1JFvvNPPmazXH6fH5kaIjzzFjAANXvfAuV6UIWUyZnvsF7Ctb
 zVpqUv8bJysx8cICHTu6UBYBj3aoncVtCVHiXH5MjN7lkfBWXMOSq6kCIADhh/J/pCJn/Z7azNh
 xrVMT257VSUnzkM9FbKRss/lMxJmwpyKmyMtV4Q4oWwZrBTpP4V5HZ5JlTT+ql05eIkLmJAJGqY
 IMP+8s6Kbr4U0+Q89uVAkfDSuoQCL4wNOkH7pOK3P3Y2bfm9EMEPqXFFc0nYwVW+veoLC1cqjzy
 lzj06xuWqojIZrcxGi/kePSdYVrhfn7lm2sYUJwDu6K47RPv0yOw2
X-Google-Smtp-Source: AGHT+IErCuCfRGil1ejhob4xg9yF6HudkK+JCsZ+ou6hegKIPEwSjezrXHPPDMBGZDMU5QdCutpJMw==
X-Received: by 2002:a05:622a:5a92:b0:474:fee1:7915 with SMTP id
 d75a77b69052e-494b0804fccmr351306121cf.31.1747831408000; 
 Wed, 21 May 2025 05:43:28 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494b2de7adesm78612461cf.17.2025.05.21.05.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 05:43:27 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfauth.phl.internal (Postfix) with ESMTP id C0F0E120007A;
 Wed, 21 May 2025 08:43:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 21 May 2025 08:43:26 -0400
X-ME-Sender: <xms:bsotaDmo6rPZ2tXj80tjivOzXA9zUk6xy3r7BaxKDzBH9Tl7SYB8Jw>
 <xme:bsotaG3yjjhGuEA2SFUFzXmthWJxpZLhxozreZrqF_Mh0IiDABi6OW1yzmMv1Uc1B
 1yS-xMRrtdJYAqDgQ>
X-ME-Received: <xmr:bsotaJp-h3wu69T1xoojOOr2UB59J6teF9TmX8dDoOrOvdDnOJQiPFLq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudduucdltddurdegfedvrddttd
 dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
 nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
 enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhgg
 tggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunh
 drfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffet
 uedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgr
 uhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsoh
 hquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghr
 tghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrtghouhhrsg
 hothesnhhvihguihgrrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
 rhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtph
 htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegp
 ghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhssh
 hinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhn
 vghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpd
 hrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:bsotaLmvSkg2Q06ODnYxXBUDGpip6DQk3VTw7K4qMb2reqkkcSWrVA>
 <xmx:bsotaB3MfIrt8FFge-AucHIiw6NaEDMgIfwaMG4fS9t1kft0C04zuA>
 <xmx:bsotaKuSJ-iPW_ldhIxNCQ2UxEf5EaZ56wZOLmaLS1G0rcJmTJ2YgA>
 <xmx:bsotaFWm4FiQy945-CSPTPkSXQlvyTnVjbb8iPWajXkBDIE068QB1g>
 <xmx:bsotaA39I8JQdG94Oyw-Ah8xDMPX_twLC3gAiGlTsg415qakz7IrijV3>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 May 2025 08:43:25 -0400 (EDT)
Date: Wed, 21 May 2025 05:43:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 01/20] rust: dma: expose the count and size of
 CoherentAllocation
Message-ID: <aC3KbKeEVlHggi5l@Mac.home>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521-nova-frts-v4-1-05dfd4f39479@nvidia.com>
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

On Wed, May 21, 2025 at 03:44:56PM +0900, Alexandre Courbot wrote:
> These properties are very useful to have and should be accessible.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/dma.rs | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 605e01e35715667f93297fd9ec49d8e7032e0910..2a60eefa47dfc1f836c30ee342e26c6ff3e9b13a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -129,6 +129,10 @@ pub mod attrs {
>  //
>  // Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
>  // entire `CoherentAllocation` including the allocated memory itself.
> +//
> +// # Invariants
> +//
> +// The size in bytes of the allocation is equal to `size_of::<T> * count()`.
>  pub struct CoherentAllocation<T: AsBytes + FromBytes> {
>      dev: ARef<Device>,
>      dma_handle: bindings::dma_addr_t,
> @@ -201,6 +205,20 @@ pub fn alloc_coherent(
>          CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
>      }
>  
> +    /// Returns the number of elements `T` in this allocation.
> +    ///
> +    /// Note that this is not the size of the allocation in bytes, which is provided by
> +    /// [`Self::size`].
> +    pub fn count(&self) -> usize {
> +        self.count
> +    }
> +
> +    /// Returns the size in bytes of this allocation.
> +    pub fn size(&self) -> usize {
> +        // As per the invariants of `CoherentAllocation`.
> +        self.count * core::mem::size_of::<T>()

I think we need a comment or even an invariant saying this multiply
cannot overflow.

Regards,
Boqun

> +    }
> +
>      /// Returns the base address to the allocated region in the CPU's virtual address space.
>      pub fn start_ptr(&self) -> *const T {
>          self.cpu_addr
> 
> -- 
> 2.49.0
> 
