Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id lwS9LKoRdGnq1wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:26:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D5A7BA96
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 01:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A610E2F7;
	Sat, 24 Jan 2026 00:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="cDtli5iq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2A410E2F7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 00:26:13 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-89461ccc46eso52696276d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 16:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769214372; x=1769819172; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=djhtYDUXpn3Mf2tJT3de27QaJBXcsb6MmYxlbeNXN60=;
 b=cDtli5iqMwzuKJy/7CAmkBDBcRkzRsOGOuH1Mj8K9ywc96U7K6BiKwnxSxQjhF9s06
 wN9EF2fWHsz+qBJOmSyaAZzQZ6r4HGZYt4x3BzHYSRh3Tr2hKHo7ReRdrSCkjw5zdMy9
 ovXEwL5ArFGJKWDp2erH3f6jCBqHXzYCORuxzmxncgFEDxqALBzNLoPUl5NlUCpGfxSM
 n2z1DHCch3KFSANMrQeRLmtjLxLnZ1khYiW/FRbZdXTWT94oK6QpRGAoQwwt2gboL5wU
 EL4rW2MBcQk0PRn7ck+3rJ6a/Pk+H3FuZmumuReUqbAKTWWvUP45miJHAHq3T2+fbTEn
 +9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769214372; x=1769819172;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djhtYDUXpn3Mf2tJT3de27QaJBXcsb6MmYxlbeNXN60=;
 b=loEvxYBVRMB8Bc7/QSQCYRWE3vMnzhWPWBn09GpVgmZNkNX3z1lqETkhusiyBPi29V
 yQCjfcFSAvQ57sXAKaQaV4AmZgsRLhs6/xDN7owvlwGMvsOjLlaJ3pddw0xDSpsFod+e
 sfDZ1zufTHHTkQWx3vR5Phgw1eL0UObpRSs+QncPThZ9tFcyNAOXER4YuPwiVbMKLUgs
 rVEddVNobYkFKA8B74+SwxxyvjrHzCUURpBRMdiqC0WQRcUOkD+bcMZ2weqpLMW8BIIH
 nvPIT47M+XBh2lLM8Uge1j1Sf7s3GKqWQrkjpnQRwZ4SJ8KQEdUpqLMgtdpPhLzM+AWW
 YLaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDKT5W3KMM/t0xvQXGmAlap9nxrxx4qIf84xVAeiqbAK8nIE1xgv/F7oIkRG+VtKLQLe7u1agYfeM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynhG7oGjODLYSJK7l+PivoHFJpN1x47RO6e8AsQUyecCPYm6/9
 9XIEmUdOjEx3mDdUDk/BWdYR63XtffIsYA/7axUbSXEwYI1e4LjjD/vM+Vqz6ocMGKQ=
X-Gm-Gg: AZuq6aLIXEuPRvM4//Zse+9SwG1YAVilQUVRW13d0PqUfN73AYixZYls0w1rTaGRMoj
 zRCMqjvgJRbmS3xD2Y2PfgGIKVBNth1HbIzRa1tXcYC3vvcB/2tycV3mBBqbfhRpvnfPFNR22JJ
 LCDy3YMbDu6WITwg+EFLAgKHdJBZxjcmL5gEj4yVAGYrSXZhOft+FxVEA8tuHjpARfsfCHtOSRn
 LUaMwP9WqboVfoinOdGARbMa6oBD9CdmUK3s538+a3xqmu7wNnME6wDQ9s3fu1Bt2Jn7Rauvo81
 lx9YxZ/Q9lYWn7idDJgK/ydoX3KbIroOhl6SGq7F1TOnV+zgA9KEcBc2JcZphCTpsGRT4o7XAyA
 SjwUGhTjTKpu22OPfTrqWyocQs53zakjZcvGzxlU3kRn/biJJYJEBI0WPeYtZYXuIBYZDKaM1BT
 70o4ZuC26biNMH71EqPBp1SihB+sFesvKxLlnv4KAqiRxp8JlSdL6ciieVIfX5elA82cU=
X-Received: by 2002:a05:622a:20e:b0:4ee:26bd:13f3 with SMTP id
 d75a77b69052e-502f772da92mr65622491cf.8.1769214372538; 
 Fri, 23 Jan 2026 16:26:12 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6e3854ceesm285154685a.40.2026.01.23.16.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 16:26:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vjRTe-00000008L4i-3ge9;
 Fri, 23 Jan 2026 20:26:10 -0400
Date: Fri, 23 Jan 2026 20:26:10 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v2 0/3] Use new dma-map IOVA alloc, link, and sync
 API in GPU SVM and DRM pagemap
Message-ID: <20260124002610.GC1641016@ziepe.ca>
References: <20260123215907.1643088-1-matthew.brost@intel.com>
 <20260123224146.GB1641016@ziepe.ca>
 <aXP8B/tAuJO1hfx1@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXP8B/tAuJO1hfx1@lstrano-desk.jf.intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:intel-xe@lists.freedesktop.org,m:leonro@nvidia.com,m:francois.dugast@intel.com,m:thomas.hellstrom@linux.intel.com,m:himal.prasad.ghimiray@intel.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[ziepe.ca];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim]
X-Rspamd-Queue-Id: 14D5A7BA96
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 02:53:59PM -0800, Matthew Brost wrote:
> > Thats a 2x improvement in overall full operation? Wow!
> > 
> > Did you look at how non-iommu cases perform too?
> > 
> 
> Like intel_iommu=off kerenl command line? I haven't checked that but can.

iommu.passthrough=1

This is generally what we recommend everyone who cares about
performance more than iommu protection should use by default. It
leaves the iommu HW turned on, which x86 requires for other reasons,
but eliminates the performance cost to DMA.

> > I think we can do better still for the non-cached platforms as I have
> > a way in mind to batch up lines and flush the line instead of flushing
> > for every 8 byte IOPTE written. Some ARM folks have been talking about
> > this problem too..
> 
> Yes, prior to the IOMMU changes I believe the basline was ~330us so
> dma-map/unmap are still way slower than before and if this affect
> platforms other than Intel x86 there will be complaints everyone until
> the entire kernel moves to the IOVA alloc model.

I have managed to get a test showing that when cache flushing is
turned on the new code is 50% slower. I'm investigating this..

map_pages
   pgsz  ,avg new,old ns, min new,old ns  , min % (+ve is better)
     2^12,    331,249   ,     289,214     , -35.35
     2^21,    335,243   ,     306,222     , -37.37
     2^30,    226,238   ,     205,215     ,   4.04
    # test_map_unmap_benchmark:
unmap_pages
   pgsz  ,avg new,old ns, min new,old ns  , min % (+ve is better)
     2^12,    389,272   ,     347,237     , -46.46
     2^21,    321,261   ,     297,239     , -24.24
     2^30,    237,251   ,     214,228     ,   6.06

So it looks to me like this is isolated to Intel GPU for the moment
because it is the only device that would use the cache flushing flow
until we convert ARM.

FWIW, on my system enabling cache flushing goes from 60ns to 250ns, it
has a huge, huge cost to these flows.

> Also another question does IOVA alloc support modes similar to
> dma_map_resource between per device? We also do that and I haven't
> modified that code or check that for perf regressions.

Yes, and no.. The API does, but Christoph doesn't want to let arbitary
drivers use it. So you need to figure out some way to get there.

For reference Leon added dma_buf_phys_vec_to_sgt() which shows this
flow to create a sg_table.

There are also hmm helpers for the mapping too if this is in a hmm
context.

A PCI device calling map_resource is incorrect usage of the DMA API,
but it was the only option till now.

Jason
