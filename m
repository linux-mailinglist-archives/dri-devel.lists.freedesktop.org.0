Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIltELBlemmB5gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:38:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E071A834E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 20:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB3510E137;
	Wed, 28 Jan 2026 19:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="HbXPTb7S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24A410E2E4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 19:38:20 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-88fcc71dbf4so1590406d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769629100; x=1770233900; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=17Cv3S1HQz/Jxts2xw1h3I9H5dK5rRMEY+NE/bNEfIg=;
 b=HbXPTb7SlmUdi2GU+If6UindomA0OyihWt4yFLTEaxYgfnDseCRa9J/gY49wcA60Ek
 xuQCvq3irnLuxcWK42mUI70KS0TCshD3B7CBmtY2P7CZqk3d/f8fnaLMfQdXovjJQBgs
 MgEwjVRRRtsodti6goZLm5MrVdxazvU46M6+WNEnl/ypdUGCi8zCyRYTVfVFRTTtBzCT
 72Eb+2FatXxgxYUC7mgely5BLugA8Opop3dpGsOl/XKho8TbNzkLnYfo8PivLsWaJHLV
 MNXE54ygXBp+uk5QFVHVlq3HXom9Ftdu/+dj5EdpMr5aY5PCNXGBQ6XKcQF9aDzvXMnO
 gY+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769629100; x=1770233900;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=17Cv3S1HQz/Jxts2xw1h3I9H5dK5rRMEY+NE/bNEfIg=;
 b=sgj7HhisQ4SzET7XevgkwtxIvJBnwbHQgNSyHdvEh4wlMXaCFoof9UnyrCnf9k9mKp
 Q1kI8fM1myMpZfIOPbTKWmoiGtguz1GK/8cATFGH73LF/Pndqf0LFTu0mXagvQvhSA/K
 SZunEULs6ALqJYCoCEqyuQPWsqlHZkh+dMh95OoRmbiKAKGxD+7x53UU1Z2QZU2Hd7Bz
 nMPmLC/x1rl9PIf8Fa0yksTH8Ngx1bWVxqVXZTlt6j/IsgWGoMWsEGdcrSSvCTpRlNkm
 GTCaDVnYpQcAdD0nqPItCGCC1vRT9z0uhCbwjRFBGg20TCUzWaU1JCwmbSjLAkaRd68U
 qWrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpn/UZ/LXfhbxn4lgdsCyMH8nGWQ6govcrDYEpeIsC/YaGkOGG2KCf00JOy1AV8mGmZaGdhgaNm/I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcH4CD7zm/J/TOBzF/XU1kTUZFV+RF7Pim/3r0GbUjazmRMPkP
 Tw7+fIp8tlLbVYQg5pSC3MSMSJoFkyRVoYNYYTAAPa8cMQ8yO2jwXN90XUzjDp8zZvo=
X-Gm-Gg: AZuq6aIb4csk+NP2WGRylh68qHr44KnOX31X7hgm5EMnpaSqQNUPBVadq60fI+V4nAD
 Fe6mVvUdMvplBxE0hUY+781Xv35j/se7sT57t0HneVNJ4RRItEBlOVdG2KmnEnhnAMRVgbgBQyL
 EEsRUtDdLbI2rWjOCXd4fs8b4VfLSspQ6iJmlu8ZOFt5/KqfCEBoE7UexDSeY8JZWW4kSS0kiIO
 2IRoFPKzVjX2tjHh2RMJRK7Pi7Do4A0s1eHWzrSmXTGhd5Po3R8jeW1UPK/Mh/W/xA9crLXgssJ
 2mw8geBLlr808Cdv7LIpVjpeE7LpD5s6qiHY5h4Lc5/dxhLk9KbzTnubntj84T4kKXBvwKQzFPD
 YdK2jFQbFFRX5ENLOZFpkkXCHwajl8QVN7WuZP98WBWFFemDWwVOTHyRsyPeFMPvzzv6jqutLFV
 GG/JXZm8sKSIqyUvTwJMDcQXx6cic8HzXdMKH2Iz1WlYq0LdufQpP17Rez90bYl0Dbz5pFmV7we
 CiWnw==
X-Received: by 2002:a05:6214:21ac:b0:88a:2f90:b6f9 with SMTP id
 6a1803df08f44-894cc8175b6mr94833626d6.20.1769629099681; 
 Wed, 28 Jan 2026 11:38:19 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-894d375b640sm23482726d6.39.2026.01.28.11.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 11:38:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vlBMo-00000009awu-2skA;
 Wed, 28 Jan 2026 15:38:18 -0400
Date: Wed, 28 Jan 2026 15:38:18 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [RFC PATCH v3 04/11] drm/pagemap: Use dma-map IOVA alloc, link,
 and sync API for DRM pagemap
Message-ID: <20260128193818.GV1641016@ziepe.ca>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-5-matthew.brost@intel.com>
 <20260128142853.GH40916@unreal>
 <aXpLhN08jVbltQC0@lstrano-desk.jf.intel.com>
 <20260128175531.GR1641016@ziepe.ca>
 <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXpjk5sAgOzE3OcR@lstrano-desk.jf.intel.com>
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
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:leonro@nvidia.com,m:intel-xe@lists.freedesktop.org,m:francois.dugast@intel.com,m:thomas.hellstrom@linux.intel.com,m:himal.prasad.ghimiray@intel.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:mid,ziepe.ca:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9E071A834E
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 11:29:23AM -0800, Matthew Brost wrote:
> On Wed, Jan 28, 2026 at 01:55:31PM -0400, Jason Gunthorpe wrote:
> > On Wed, Jan 28, 2026 at 09:46:44AM -0800, Matthew Brost wrote:
> > 
> > > It is intended to fill holes. The input pages come from the
> > > migrate_vma_* functions, which can return a sparsely populated array of
> > > pages for a region (e.g., it scans a 2M range but only finds several of
> > > the 512 pages eligible for migration). As a result, if (!page) is true
> > > for many entries.
> > 
> > This is migration?? So something is DMA'ing from A -> B - why put
> > holes in the first place? Can you tightly pack the pages in the IOVA?
> > 
> 
> This could probably could be made to work. I think it would be an
> initial pass to figure out the IOVA size then tightly pack.

You don't need to so carefully determine the IOVA size, just allocate
the maximum you need which you already have and then tight pack the
pages and remember where it ended for the unmap.

It should be easier than dummy pages I think, you just have to use a
little different math to compute the IOVA.

> > This is a possible option to teach things to detect the holes and
> > ignore them..
> 
> Another option — and IMO probably the best one — as it makes potential
> usages with holes the simplest at the driver level. Let me look at this
> too.

It is fairly hard as all the iommu page table implementations work
this way. We can add some kind of flag to ignore holes for the new
iommupt stuff, but the old stuff doesn't have a fast way to emulate
it.

Jason
