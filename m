Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 464AFD13096
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E0A10E3E2;
	Mon, 12 Jan 2026 14:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ui/jZVA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1872A10E3E2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 14:14:43 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso110029436d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 06:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768227282; x=1768832082; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=idOldAb4LAo0ksi3bVUeAksa3fPCwgsdaazjCrmLC+c=;
 b=Ui/jZVA1rDTwDmMhU312Vf83nLjAkecxJSOM1+6OXQLjNf9LwUUgwA5k0bNu04Mjz0
 BIjm126ogbR36iyNa2QdkrCKMOpBUgi6mwfXjr1lShriKgc6iRNvYjO5dAoif1GEI7HE
 fPO+l1J09UhY+XTehvVDhSdEG9jF2NY5WRe61PB/4VFj69x7b8JNTEXOv6XSDtwhnHBe
 2Jde1ShU7rABtwrevgIlRtz/XrcW2y9YJwUIWkLSY1I8oMcOpp7lGds1qJJni9PLF6FB
 1yVG79Cmx9nxFZV+ltvpsnzAd83Ejjz36z0jp6NIUOHA0E6xmnD6YehgcamEujC9/+e3
 EL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768227282; x=1768832082;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=idOldAb4LAo0ksi3bVUeAksa3fPCwgsdaazjCrmLC+c=;
 b=qT9Lj92Ov6hwlmQMn9AkO7vcBZSPpvSCAXTJXqM6lXhLo1uRC5sL7ogJeZyyYMpCVM
 jXngP0Epi+h5OGYk/uirV3051fXPyot7ZckxeCkbIQTlrz+4JyxxtT9tErsLFgjwOfez
 tbIdbMC/gnZmR6iMgM3yxlB1tPE0BRHNKpajs5UUtjLkys3BSEKTnslOD7w7AkpPgHLw
 1l4RayITrt9RKVFu6dgJZ3jC2DGU/fO5XuMH3LhvNFB03sqkiGKrw+jM18Jr/TmP8Mke
 Pr1L1S6/3kgnH6d87n8Ac3lU+5osq5Q2+mw9bNrtCxTaSJNwBHMX7yEJ1/GEH0OaJFYC
 RHhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNk0xzrasg6/pVsn1c1orMQsZcOVfTaujGu8PqDYHvUs10WKncyMgdOYpsExL0Pmt+n8SFCacEllE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhpWwQglauvnCymLWDu7L2ePbY8wZNJ0Q8pLJvedCZfCwBmLPU
 LWKCr1TefkQ/0C2wXLb//fZasPtwcVKIz6o7fmVIBwOBDgWXIa/ZaFq6NekDcud5COg=
X-Gm-Gg: AY/fxX5YuK7TtdpLP2JgoG6rO+YxVRBE36VuCTbGwP4E+dj9SSkdzArwlPLna1rpujA
 nzaKk53/q/Ce1Uhm1Ir88XQKv2l6Z6nvnP8CFwTmEwEMEsHg1fofXeV66gyMqvXHcWUog8gLBWh
 QhvKEoSEQZYC6/ZZarfPTqvlwXCZsVQiPzVYnuqlS2q3R+yjMGviFT+EPkGH6GrhsnmM3+/Ff03
 0Td2OSCNlogoEOdftnj0yZfYZrHTG2B97fH1gDFSHoK5+3wfJDxttkPgNGpKipxxePcVIjjeZhp
 nfMSLy3Pj/GrAJtanCUmEt8bAG8kLhmi0akhGFq1PiLqASU5X0458esrvK8u8Zphq/6mNsABf66
 wfsQHaGbJrFVB8TRbBhpIOY85M8fA2ir9cL928z8YL20LEa95VJGZlIKaGfOsLkL4iQ6+MjKmNz
 a2Ex6Byl6qO/azApUdjNTbR5EfUECCMWR0ds18YZIW/Gb7kkbgsDNHuCsvGXkViBNxqts=
X-Google-Smtp-Source: AGHT+IF7Zvp/3g9UZvP3sG1m9fZ0kBeHeUwdq4Y0K8ZVazGpfRYYWPSZc44gsn+OV4Jjh6pl1L7JlA==
X-Received: by 2002:a05:6214:460e:b0:888:8913:89af with SMTP id
 6a1803df08f44-8908418b4f4mr232874836d6.15.1768227281987; 
 Mon, 12 Jan 2026 06:14:41 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8907723436fsm157350086d6.34.2026.01.12.06.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:14:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vfIgr-00000003QFh-01tA;
 Mon, 12 Jan 2026 10:14:41 -0400
Date: Mon, 12 Jan 2026 10:14:40 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Williamson <alex@shazbot.org>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH 0/4] dma-buf: add revoke mechanism to invalidate shared
 buffers
Message-ID: <20260112141440.GE745888@ziepe.ca>
References: <20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com>
 <eed9fd4c-ca36-4f6a-af10-56d6e0997d8c@amd.com>
 <20260112121956.GE14378@unreal>
 <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2db90323-9ddc-4408-9074-b44d9178bc68@amd.com>
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

On Mon, Jan 12, 2026 at 01:57:25PM +0100, Christian König wrote:
> Clear NAK to that plan. This is not something DMA-buf should need to
> deal with and as far as I can see is incompatible with the UAPI.

We had this discussion with Simona and you a while back and there was
a pretty clear direction we needed to add a revoke to sit inbetween
pin and move. I think Leon has no quite got the "dmabuf lingo" down
right to explain this.

 https://lore.kernel.org/dri-devel/Z4Z4NKqVG2Vbv98Q@phenom.ffwll.local/

   Since you mention pin here, I think that's another aspect of the revocable
   vs dynamic question. Dynamic buffers are expected to sometimes just move
   around for no reason, and importers must be able to cope.

   For recovable exporters/importers I'd expect that movement is not
   happening, meaning it's pinned until the single terminal revocation. And
   maybe I read the kvm stuff wrong, but it reads more like the latter to me
   when crawling through the pfn code.

The issue is that DMABUF only offers two attachment options today, pin
and move. iommufd/kvm can implement pin, but not move because they
don't support faulting.

vfio and others don't need move with faulting but they do need pin
with a terminal, emergency, revocation.

The purpose of revoke is to add a new negotiated attachment mode
between exporter and importer that behaves the same as pin up until
the user does something catastrophic (like ubind a driver) then a
revoke invalidation is used to clean everything up safely.

You are right that the existing move_notify already meets this
semantic, and today VFIO exporter, RDMA ODP importer even implement
this. Upon VFIO revoke move_notify() will invalidate and map() will
fail. RDMA ODP then HW fails all faults.

The problem revoke is designed to solve is that many importers have
hardware that can either be DMA'ing or failing. There is no fault
mechanims that can be used to implement the full "move around for no
reason" semantics that are implied by move_notify.

Thus they can't implement move_notify!

Revoke allows this less capable HW to still be usable with exporters,
so long as exporters promise only to issue an invalidation for a
"single terminal revocation". Which does nicely match the needs of
exporters which are primarily pin based.

IOW this is an enhancement to pin modes to add a terminal error case
invalidation to pinned attachments.

It is not intended to be UAPI changing, and Leon is not trying to say
that importers have to drop their attachment. The attachment just
becomes permanently non-present.

Jason
