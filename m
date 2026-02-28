Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INzDIQgSo2k29gQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 17:04:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037831C434E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Feb 2026 17:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFE910E2C7;
	Sat, 28 Feb 2026 16:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MyibQhlj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F27210E0F2;
 Sat, 28 Feb 2026 16:04:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 59D82600CB;
 Sat, 28 Feb 2026 16:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC098C116D0;
 Sat, 28 Feb 2026 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772294656;
 bh=VqoqwReNyK4D8hI7bVL5FnWWjw9JOwqFRBdBg0EIDo0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MyibQhljkF/0xj9qWOrOF8chMi/2NvrW1/QeXjahOp4xSseT3FkDVMncM5FOlDrGP
 ca/1hhlBRjytXhuYklzhUAmdF78wKg92TPnU+gAJxAMwD8C2/avdWz/y1gWfBkTZYA
 jIkknUSYpMy+z50Q2dEeEd3MVfHVJ7i/VyVeMhrHr4SOxrhMxni8aijh9RjMKciLFs
 yGFPdVD11bS3ZL8f0kfrnn3eUbNna1k00+H7YY4VleOjV806n/kY1jz2HEouKKMimu
 +cTDsIp4Zt7K4SLSIHY8VJiA72CMR165V1ZzTf1uVKsh7AQhyIWBFx3+/9T94KQ2l2
 VRNJKAw+T6DZQ==
Date: Sat, 28 Feb 2026 08:04:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, anvesh.bakwad@intel.com, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v9 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <20260228080414.6f1256cc@kernel.org>
In-Reply-To: <20260228080858.3063532-8-riana.tauro@intel.com>
References: <20260228080858.3063532-7-riana.tauro@intel.com>
 <20260228080858.3063532-8-riana.tauro@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,davemloft.net,redhat.com,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 037831C434E
X-Rspamd-Action: no action

On Sat, 28 Feb 2026 13:38:25 +0530 Riana Tauro wrote:
>  Documentation/gpu/drm-ras.rst            | 103 +++++++
>  Documentation/gpu/index.rst              |   1 +
>  Documentation/netlink/specs/drm_ras.yaml | 115 ++++++++
>  drivers/gpu/drm/Kconfig                  |  10 +
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/drm_drv.c                |   6 +
>  drivers/gpu/drm/drm_ras.c                | 354 +++++++++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c    |  42 +++
>  drivers/gpu/drm/drm_ras_nl.c             |  56 ++++
>  drivers/gpu/drm/drm_ras_nl.h             |  24 ++
>  include/drm/drm_ras.h                    |  75 +++++
>  include/drm/drm_ras_genl_family.h        |  17 ++
>  include/uapi/drm/drm_ras.h               |  49 ++++

Doesn't apply to my local trees any more but _looks_ right :)
Assuming ./tools/net/ynl/ynl-regen.sh -f doesn't result in a dirty tree:

Acked-by: Jakub Kicinski <kuba@kernel.org>

> +	if (!info->attrs ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID] ||
> +	    !info->attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID])
> +		return -EINVAL;

Sorry for not noticing earlier but you could use GENL_REQ_ATTR_CHECK()
here. It will give the user a nice error pointing out which attr was
missing (assuming user space uses a competent ynl-based library).
