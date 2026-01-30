Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKilLMXDfGmgOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:44:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1ADBBB05
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 15:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 704F910EA06;
	Fri, 30 Jan 2026 14:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Cqv8CE0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DED610EA06
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 14:44:17 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8c6f21c2d81so223549385a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 06:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1769784256; x=1770389056; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UlIFC23S9unnjQhVGEC3vUha1a+Kfy5xxpLqRiUCtvQ=;
 b=Cqv8CE0I5etEUquT1xgBZe/pjZMAsJxOBrq4Yih/3qz2svW59f1ymULImZtvDBHzQ2
 v2Z4ydPBXC/9YNMi1DNCYfSpicfGs9REsVs20Or9m3wxeoYGYuf4jBEweTW+ZnzFYlQ9
 f0+rhft5sYYl30QoQ40kMKM0WnvXgyBfz/mj+O3yFOesTOmSKrLemhNCcup4untZ5BXQ
 3arKwy0Ea6jS3Cx5FY7uVKeV7YPPliVA0i2KOpb3eeFHz+4HFYQTCPPWAclAImkF7WtN
 LynKvKflA6DkxbQC8OjbWABn3TP7EC0LAi9H+bjKmESWishZQweKVvZzckuBNltEhQzV
 DhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769784256; x=1770389056;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UlIFC23S9unnjQhVGEC3vUha1a+Kfy5xxpLqRiUCtvQ=;
 b=IVkdnyp6rBd9QI4Nj/CMeBo41lfsgjN7Mhai33H/2eVLN6dL3ZRkrI8cVmPMnRtLCr
 IAL5KYbJTgqGdifKa5Ap7/koMK7OtEqFCpJsCn4z2vqZeAAL31gVQbe/UZwCSx6cwVw3
 wI1jgCnYyC4/gwlVPynVUwDTdHQBQ6osNshnPAxHAuGVPihhIO5Xe+bY58TkU8fBBo9c
 yePcWi+JLsulrra7ulOnKnk156n/ygmBOXZ06Zm6DeGnXy1os4Ami5kAJxMhJOG9Rpn7
 YtupXi4RjfF3x0/5v6BmvpFTttHZzn4OCM00st35pF4oE61MJdKYfMpf0YF+nANeR+LZ
 g74A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIkTlxFoNaHtTp3g31VJ4eCLlmj2gZ77uJhGI83JLnYh2jxr+wZ+734RIW6d0U8qdxg3yJOuNwjxo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx63SkDe/bzBKZcXPiYxmbvcwKrUnO3Wahn9mIh5T/nHXDLKr59
 ZokY8KJStk1m656gZ9kYKGx8m/q6pTEoi8kx/Wy2RmK2YHJXQ1/TPOzC3rh4xKvFIkw=
X-Gm-Gg: AZuq6aKHmCd6qFzkzqmutyFa18jZpWEluAJoYVfmMO3Y+KDCLqrtaCfXee/hUUHObjY
 FchxZ/0RP+jsdyJFGOrC21wnLv6nUknOE2zA0PuxufUDS1PP6DS8dMfBWQZY6JgtKCe3P+vQBYE
 qIXoqi2Y+BrXPpmiV4d4yJsp7dUrZp9BpssuM+UhXX8xRUgfkwQt4+oJpGWcqBgsbIYl7Cpjwv/
 BMT/AMGDLRIeAzLxsRvRxb2eg7H/WA8AaVIKCWKpmROrNWul0R2o3TdnOtHp+ZROdJPfDp8x0Wh
 cWaYg5Dc3GNtyi+KxZyGuJfJ/KNdOV/pF6KE0WqWprY2caMI+eHuCz8cySHjGSzu9ImqVMYIazr
 HcIowAQIWHrMuL76YVkUdcSIak1h6/r/d9hgtGgCw3oB09x+J9u5KYrRn6DlZDPeTbniX1I1491
 fWAPKqto7HFJLELr7uZJFb3jlD4rkw55EOQtFDSbBOpN4EbUU8el6IQ2bfosRzuz5x1rA=
X-Received: by 2002:ac8:7f0f:0:b0:501:51b6:cd3e with SMTP id
 d75a77b69052e-505d21a4775mr39321141cf.29.1769784256186; 
 Fri, 30 Jan 2026 06:44:16 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5033745c426sm56137391cf.7.2026.01.30.06.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 06:44:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vlpjL-0000000B0t1-0Fhg;
 Fri, 30 Jan 2026 10:44:15 -0400
Date: Fri, 30 Jan 2026 10:44:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
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
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Williamson <alex@shazbot.org>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
Message-ID: <20260130144415.GE2328995@ziepe.ca>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <31872c87-5cba-4081-8196-72cc839c6122@amd.com>
 <20260130130131.GO10992@unreal>
 <d25bead8-8372-4791-a741-3371342f4698@amd.com>
 <20260130135618.GC2328995@ziepe.ca>
 <d1dce6c1-9a89-4ae4-90eb-7b6d8cdcdd91@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1dce6c1-9a89-4ae4-90eb-7b6d8cdcdd91@amd.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:leon@kernel.org,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:alex@shazbot.org,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1F1ADBBB05
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 03:11:48PM +0100, Christian König wrote:
> On 1/30/26 14:56, Jason Gunthorpe wrote:
> > On Fri, Jan 30, 2026 at 02:21:08PM +0100, Christian König wrote:
> > 
> >> That would work for me.
> >>
> >> Question is if you really want to do it this way? See usually
> >> exporters try to avoid blocking such functions.
> > 
> > Yes, it has to be this way, revoke is a synchronous user space
> > triggered operation around things like FLR or device close. We can't
> > defer it into some background operation like pm.
> 
> Yeah, but you only need that in a couple of use cases and not all.

Not all, that is why the dma_buf_attach_revocable() is there to
distinguish this case from others.

Jason
