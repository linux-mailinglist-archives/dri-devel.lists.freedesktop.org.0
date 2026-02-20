Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Eb2M9/8l2kf/AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:19:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CC9164EC6
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 07:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE1710E139;
	Fri, 20 Feb 2026 06:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ysOn/ZQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA4F10E139;
 Fri, 20 Feb 2026 06:06:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4209B61843;
 Fri, 20 Feb 2026 06:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276E2C116D0;
 Fri, 20 Feb 2026 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1771567574;
 bh=K4J5kwrWG6Klaz0TWaWDwYqm9sura75BmlC5zDrxEic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ysOn/ZQp+kpa+h+su/QdYoLZ9kPZfUB18kZEl0AJHkHijbDfpt0RdrOevuMjaVu81
 l1PvMbTSwjKI86Bd9q1r25ghHZKdw5pWXi95I7G6jOF1Qg4KM01QWvN+HICS2qXn1A
 3Z1DD67/W89jg84AxoptP8KaqH7t077dKwYf5hlM=
Date: Fri, 20 Feb 2026 07:06:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Koen Koning <koen.koning@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Matthew Auld <matthew.auld@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Chunming Zhou <david1.zhou@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] drm/sched: fix module_init() usage
Message-ID: <2026022007-radiator-schnapps-e557@gregkh>
References: <20260216111902.110286-1-koen.koning@linux.intel.com>
 <20260219213858.370675-1-koen.koning@linux.intel.com>
 <20260219213858.370675-3-koen.koning@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260219213858.370675-3-koen.koning@linux.intel.com>
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
X-Spamd-Result: default: False [4.69 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,nvidia.com,intel.com,kernel.org,amd.com,pengutronix.de,gmail.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linuxfoundation.org:dkim,pengutronix.de:email]
X-Rspamd-Queue-Id: 65CC9164EC6
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 10:38:57PM +0100, Koen Koning wrote:
> Use subsys_initcall() instead of module_init() (which compiles to
> device_initcall() for built-ins) for sched_fence, so its initialization
> code always runs before any (built-in) drivers.
> This happened to work correctly so far due to the order of linking in
> the Makefiles, but this should not be relied upon.

The linking order of Makefiles should ALWAYS be relied on.  If that were
to somehow change, so many things will blow up.

But be careful, none of this fixes the issue if you use modules, so you
still have to have symbols resolving properly.


> 
> Fixes: 4983e48c85392 ("drm/sched: move fence slab handling to module init/exit")
> Cc: Chunming Zhou <david1.zhou@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Philipp Stanner <phasta@kernel.org>
> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org

Why is this for stable if it doesn't actually fix a real issue?

thanks,

greg k-h
