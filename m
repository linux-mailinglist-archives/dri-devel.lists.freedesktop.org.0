Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319DD3B202
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E20910E4CC;
	Mon, 19 Jan 2026 16:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="iei1T2Go";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88E110E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:46:21 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id
 d75a77b69052e-50145cede6eso36392561cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768841181; x=1769445981; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zfC54g6ZC0VxR+dcM7NfRz1NWoEdvriN2xR6YNn2bfs=;
 b=iei1T2GoIbcWnK9vQUSccpMoJNC1iC6IInjl8ybxCpon0+cgMAD2uewjPZ91zBfPVS
 MvZEZUw3ASKNM3qLnYTGUa6HRTjDbO3pbTClZm4G8P1mmm92+MMKwlP9BsTWMDyQ1wXQ
 SeeIj82rYuG5crjg38E11bYUkMw+ea8s97VH8t8SG4AqFqJ3ebcWdRLodP0DRZNPuUDU
 9hf8x9MnfSLoZ9cQuQl0hAgmk5djLfipbi1Kdm/NV6jTN6CZnn0raxJLLNg1E34ic9My
 NTCJTzIByNzAmfGNgz+BVjLjpAAPGL7hjapVYU8cQTGg1xc+QMxInrAZLfInl0D3hQ1a
 ePMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768841181; x=1769445981;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zfC54g6ZC0VxR+dcM7NfRz1NWoEdvriN2xR6YNn2bfs=;
 b=vqQtITwrAEkxulR/VXKGIEZ9aYOxkfT/WquxUqHucs89JN6oDSm1Iexl1nVFbMMSFb
 s7fALrZKDsTudswIAEPJsrD4/CAZz/qIpBOn+o/Fb1B/gePveYnlv1b1zaJnQwyHvtwR
 zW3UYkquF6LllfutE2asx/jvl4iQPEhnzftpPe3QzVNSts2BKoszPhMZd1AXMpOJfWL6
 zjHnVgugBVAJOFQeXmAKIDnDDklGTk/tICo9U91r+8VJt01oSYB+3j5WYkty2m40lYKx
 /iFFGQXZYdi+9f7Tr6//jAsLOPEZAe3YA0rfcjwzirH9eD8zYdtyP7/oQDPBjJilWphX
 GVOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCcX5a6Io66EK5MtaX7MLwHZXVL9zxljutgRReFsnkAObRX7qM1rEO2kGSnEHMhOVeLZA0LAWvKh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHkoYgU/I5b3v19XNOPcozcKZfjqNkNUfiJYsVRwthqEOmLQLX
 V2rUQubQtHSnCGhYZrL9/KGmo1OpBYQaqBcyPqG/rTbH4TCiogLbP9dPeDb7+4y3KRY=
X-Gm-Gg: AY/fxX7bNiSqWIraPh+zbgOnCJqM0pfVTdJCKrVxC/fZYzksKnbKoiI/0FC7L4zMlHr
 uhzwWcVO0hfn0oRt88mrkUPf40VRUhsExlfWltr0Uau1Ul1Clmjoqst7G3svMUupxiwapSZWnzu
 JUxzXHvahPqYjka/NTj1O2UTaM2aXGLc3uDZcZ9AuL3WpDhc0Ki+Cg3BSAKS3vLW4n9g0ZFeQhi
 /LAN/o9Pgc2gw3VDhN/O+47vqelrfDF58idZ9BDTjdSQh8AGw260hrvWXYUl/djScp5HoB9TQZ1
 N47PdT6uMi0a9aKXsfCCVDRpe7WnWK3wCszE1SGfACh2FGg2Iq+1pAYkbp/ZTtW6/Jes4nTK4DZ
 shDDlAXlZ/0G06UBr5xsePaRagzfXSLaMt0TG4ugYT1W7n/10v1fm8MIaYJw3P/yuPV0Vmw9vxH
 NpkH/iCTh32x9o9h7FecGON44dy2tDj3GGn8MUjufGwMLBHOC7hxDsDHPbFpCqzg3q2cQ=
X-Received: by 2002:a05:622a:58e:b0:4ee:17e9:999a with SMTP id
 d75a77b69052e-502a1e551b4mr166978451cf.33.1768841180580; 
 Mon, 19 Jan 2026 08:46:20 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1d9ee19sm71855641cf.14.2026.01.19.08.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:46:20 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhsOR-00000005IML-2VzR;
 Mon, 19 Jan 2026 12:46:19 -0400
Date: Mon, 19 Jan 2026 12:46:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dma-buf: Document revoke semantics
Message-ID: <20260119164619.GG961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-2-a03bb27c0875@nvidia.com>
 <8bc75706c18c410f9564805c487907aba0aab627.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bc75706c18c410f9564805c487907aba0aab627.camel@linux.intel.com>
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

On Sun, Jan 18, 2026 at 03:29:02PM +0100, Thomas Hellström wrote:
> Why would the importer want to verify the exporter's support for
> revocation? If the exporter doesn't support it, the only consequence
> would be that invalidate_mappings() would never be called, and that
> dma_buf_pin() is a NOP. Besides, dma_buf_pin() would not return an
> error if the exporter doesn't implement the pin() callback?

I think the comment and commit message should be clarified that 
dma_buf_attachment_is_revoke() is called by the exporter.

The purpose is for the exporter that wants to call move_notify() on a
pinned DMABUF to determine if the importer is going to support it.

Jason
