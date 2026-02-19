Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOu+LnLhlmnkqQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:09:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AB015D9F6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 11:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC5410E254;
	Thu, 19 Feb 2026 10:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QTUIZPLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D0510E23C;
 Thu, 19 Feb 2026 10:09:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B76060054;
 Thu, 19 Feb 2026 10:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EDFC4CEF7;
 Thu, 19 Feb 2026 10:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771495787;
 bh=q1/kcsmRETp7wspynddOCV7OlvJ+YvFQsBqiIrIMRr4=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=QTUIZPLoWDtllOmleDtmudvrTyW+aH6DHEaB39eE9nhw9OfqYWDoOUx1LcX3Iq/s/
 /07ir+pL485oJZgPmPrVVqdFgKQxU6nR9eN8MEMZr8CBihxbLJiu8g3cxyyumNXss6
 xTtZZeTGXUqaYTstOwP9xuqAbK6VIjF+8YiSFH4FeNP0PCCCxLW/v/uRwatJSl94pN
 4IIXd/+d3o1hWP7ZwukN3Wd41o+2HxBT3TR/rb7y5yVgrxiZqiZinv8Xm+olshjBAR
 Wa18gcI0xWgtVeWSPOd1PYI1wFtiq5zOjzXXZy74VAt8B2hh7ZbFTWz3Dp0sHgJUgN
 Rsf2sSPGAPLKw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:09:42 +0100
Message-Id: <DGIUUFLC31D5.2OZBF5FWQJWMZ@kernel.org>
Subject: Re: [PATCH v10 3/8] gpu: Fix uninitialized buddy for built-in drivers
Cc: <linux-kernel@vger.kernel.org>, "Matthew Auld" <matthew.auld@intel.com>,
 "Arun Pravin" <arunpravin.paneerselvam@amd.com>, "Christian Koenig"
 <christian.koenig@amd.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Dave Airlie" <airlied@redhat.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-4-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-4-joelagnelf@nvidia.com>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,amd.com,gmail.com,ffwll.ch,redhat.com,kernel.org,garyguo.net,collabora.com,linux.intel.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,intel.com:email,lists.freedesktop.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 41AB015D9F6
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> From: Koen Koning <koen.koning@linux.intel.com>
>
> Use subsys_initcall instead of module_init for the GPU buddy allocator,
> so its initialization code runs before any gpu drivers.
> Otherwise, a built-in driver that tries to use the buddy allocator will
> run into a kernel NULL pointer dereference because slab_blocks is
> uninitialized.
>
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.
>
> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part tw=
o)")

This Fixes: tag seems wrong. How is this code move related to this problem?

This should rather be:

Fixes: 6387a3c4b0c4 ("drm: move the buddy allocator from i915 into common d=
rm")

Also, please add:

Cc: stable@vger.kernel.org

> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I also think this patch should be sent separately and go through drm-misc-f=
ixes.
