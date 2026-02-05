Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKMDKCywhGk14QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:58:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF074F456E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 15:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4528810E8EA;
	Thu,  5 Feb 2026 14:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Gb0wZeMu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720C210E8FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 14:58:47 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id
 6a1803df08f44-88a367a1dbbso17929626d6.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 06:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1770303526; x=1770908326; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6paZ1/dfF6ZJkTrV436UqQ3Veg/Kl0esrhdcHdeVKCQ=;
 b=Gb0wZeMuhvGggNJtvOLX5qNFM8HEZ4zEgS71O8+VEXArvd623WtcKh7W/r9Hcbc3gQ
 ablGTnr1XXk9YcMOmUvfRk4V8T3++hsbs2dn+1mOAPxI2Qib9KsNA/RAi/rCpOAHKbfp
 /4lPBir3uIeZ3/VFyh/SEv0eWQ8+mLZWZibIO4HvCPPc61nMMvFhaQVfhcNRZ0kBq0Xg
 fHnP2Wqq6I6qLhEOfAAfak3zu/V5IiB6DWrt0tOc6qZnmwGpUnaD3EVfkOKLqzVZxEJL
 YrHmsEd53RRqUpazI90S+vrFMRPY9GcCZfwBve6npUFxQnsJVVi/3sRS2E53vcxmeiOR
 3cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770303526; x=1770908326;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6paZ1/dfF6ZJkTrV436UqQ3Veg/Kl0esrhdcHdeVKCQ=;
 b=PjcypD8h+jSXs9SaGYRusmSciJLzRNSYUSyg5ZYicwy+7hmLW4ReDsulgn6ESRbPhU
 VWJ9ws59amR004dyZ0qdJIqhbSdLpd83emum0cux9OptlOZXlNYRmsnNOFIT3HayqSov
 Nlyscjeb1Q9QwRZpCuYovCdHS8jzanoldX5PL3859jZ+G5JLC+460xL/Sb/k9GctoTxH
 /R/koqAg9GkCBvynF5j8ctA3+T4is3OJwn09RjVMtBwNkGpvM5Nv3/uSKLl1sxwD+q6x
 xz83hChJ2Sf8QMo3WSivr88Ds/MvgEEa0Lh9f5ivYt9bGzhY7rMw9Q7pfnRd+PIx/h+m
 ca5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5SMsjY7HVz+I6oVSCIlyWRcY5BeyWYIwwiqBSZe0q9fXNKYssmJln//B1Yi0BWuZGdwA4V9R+lxE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE5QyMAUL8wJmzFyY07zgnLNqccs5cGePnDW+AMPYJcPPKCsHC
 99HJtNrYezD23St/fDPgWrCnWRQHEhz58sBr5X0zbAL0mNhEQf/zccArpMKMR3baSDw=
X-Gm-Gg: AZuq6aLgjMUkiTYHRnOFIuM9KbXgr0NxxqVV7cT0CuM3qdGFXE/Un0OvyaGUlrwJh9Y
 4SqnWjnFYeTDohzv75Lj+uALs3OCGcZwRjXVoc1/F59H8Y8c5UP7wBjz5SjwQ1knxDf1UCgtRtV
 0h4O/v1Zhsr5weuqDLwSQ2mOE9JkKkEZpdfowIqKjT6ZJ/QCEJWJGdhBe6MJgCF+SHdr8YUgjMg
 iJFlnqR9R39UB6Z7evcKp6nVqNYWcf2GmaGsxYiXViEaz4Y2nO5Oar9+MkUkr613IOm662M4TIg
 62FGtUhtwdnEtb4RHvIJTmTGlC1jPRyc6X85QJfxI3n8tQ6n67mQWc925X9KflKNN2Dpx9Z6goX
 xhUifZZyNRqJzUZaFjMgzb7S8bEUw4GkQXGvbYxdvUZXmPJgnavOgZ7yMG3XX1IB/XO8tL9S5X8
 C//o+y0a1Rvo9zdZe5ux2PPAvOv3qSKAmpPaIfUz9rSQSTsSLzgojosznSqO4LAUEFzno=
X-Received: by 2002:ad4:5bc1:0:b0:894:6d0b:502 with SMTP id
 6a1803df08f44-895221eff32mr95805386d6.59.1770303526139; 
 Thu, 05 Feb 2026 06:58:46 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89521bffb41sm43278866d6.4.2026.02.05.06.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 06:58:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vo0of-00000000zky-02N9;
 Thu, 05 Feb 2026 10:58:45 -0400
Date: Thu, 5 Feb 2026 10:58:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex@shazbot.org>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Leon Romanovsky <leon@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Ankit Agrawal <ankita@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v7 7/8] vfio: Permit VFIO to work with pinned importers
Message-ID: <20260205145844.GM2328995@ziepe.ca>
References: <20260131-dmabuf-revoke-v7-0-463d956bd527@nvidia.com>
 <20260131-dmabuf-revoke-v7-7-463d956bd527@nvidia.com>
 <fb9bf53a-7962-451a-bac2-c61eb52c7a0f@amd.com>
 <20260204095659.5a983af2@shazbot.org>
 <ac33ad1a-330c-4ab5-bb98-4a4dedccf0da@amd.com>
 <20260205121945.GC12824@unreal> <20260205142111.GK2328995@ziepe.ca>
 <f27ad57b-d935-4ffa-a65c-9f6b5d9a1f9a@amd.com>
 <1b7ee5ad-6dde-415a-8e06-93daddc9bcef@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b7ee5ad-6dde-415a-8e06-93daddc9bcef@app.fastmail.com>
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
	FREEMAIL_CC(0.00)[amd.com,kernel.org,ffwll.ch,intel.com,linaro.org,gmail.com,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,8bytes.org,arm.com,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:christian.koenig@amd.com,m:leon@kernel.org,m:simona@ffwll.ch,m:jani.nikula@intel.com,m:lucas.demarchi@intel.com,m:sumit.semwal@linaro.org,m:alexander.deucher@amd.com,m:airlied@gmail.com,m:kraxel@redhat.com,m:dmitry.osipenko@collabora.com,m:gurchetansingh@chromium.org,m:olvaffe@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:kevin.tian@intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:Felix.Kuehling@amd.com,m:ankita@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:intel-xe@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:iommu@lists.linux.dev,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jgg@ziepe.ca,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[35];
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
X-Rspamd-Queue-Id: EF074F456E
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 07:41:11AM -0700, Alex Williamson wrote:
> >> From https://anongit.freedesktop.org/git/drm/drm-misc
> >>  * branch                          drm-misc-next -> FETCH_HEAD
> >> 
> >> $ git show FETCH_HEAD
> >> commit 779ec12c85c9e4547519e3903a371a3b26a289de
> >> Author: Alexander Konyukhov <Alexander.Konyukhov@kaspersky.com>
> >> Date:   Tue Feb 3 16:48:46 2026 +0300
> >> 
> >>     drm/komeda: fix integer overflow in AFBC framebuffer size check
> >> 
> >> $ git merge-base  FETCH_HEAD 61ceaf236115f20f4fdd7cf60f883ada1063349a
> >> 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> >> $ git describe --contains 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
> >> v6.19-rc6^0
> >> 
> >> $ git log --oneline 61ceaf236115f20f4fdd7cf60f883ada1063349a ^FETCH_HEAD
> >> 61ceaf236115f2 vfio: Prevent from pinned DMABUF importers to attach to VFIO DMABUF
> >> 
> >> Just pull Alex's tree, the drm-misc-next tree already has v6.19-rc6,
> >> so all they will see is one extra patch from Alex in your PR.
> >> 
> >> No need to backmerge, this is normal git stuff and there won't be
> >> conflicts when they merge a later Linus tag.
> >
> > Correct, but that would merge the same patch through two different 
> > trees. That is usually a pretty big no-go.
> 
> Applying the patch through two different trees is a no-go, but
> merging the same commit from a shared branch or tag is very common
> and acceptable.  It's the same commit after all, there is no
> conflict, no duplicate commit.  When the trees are merged, the
> commit will exist once in the log.  Thanks,

+1

This is how shared branches work. There is no issue here.

Jason
