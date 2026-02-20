Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IprBa00mGn/CgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 11:17:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE6C166BD7
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 11:17:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E552910E7E1;
	Fri, 20 Feb 2026 10:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UyXJGIe4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1D510E159;
 Fri, 20 Feb 2026 10:17:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9855642DDE;
 Fri, 20 Feb 2026 10:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA55BC116D0;
 Fri, 20 Feb 2026 10:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771582632;
 bh=p2k6pWtIsWSnFSLP2RBtbJq52aI2gnODo0HD/B9Bb7g=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=UyXJGIe40+t97tpN8dEFOyel8KT9L8bnqZjxeRmLJcZxGelI+4DUEZCCPzHhqU3+Y
 D5WXu3XzhN9cdfI+fZi9hx5lJP/pT39mneYuG126DBQkFcCdbMDDTPHf4gbHNeI9Wd
 nY/h4GBHFQmO+lz0NlhqYAuYLOYctlpzcZYdAPJDZs1+BQJQ1SOVtRW5VHXj+T5vLg
 hpTsnGKtgpQGEwWj2CoXh2SxV04ycrQwyjH21V3nnJjeOV8m+eEegml+j+0P6He0vE
 /XepDWtQDGkIzRE55lRzIziRavXK75hyzKdXWfVwjdUrjDJI8U3pRQK0Tn8SB7uc0n
 SI7YDWT4DodVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 11:17:09 +0100
Message-Id: <DGJPMOESHINC.1NGNT8LLY8DKW@kernel.org>
Subject: Re: [PATCH v3 1/3] gpu/buddy: fix module_init() usage
Cc: "Koen Koning" <koen.koning@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Matthew Auld"
 <matthew.auld@intel.com>, "Dave Airlie" <airlied@redhat.com>, "Peter Senna
 Tschudin" <peter.senna@linux.intel.com>, <stable@vger.kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260216111902.110286-1-koen.koning@linux.intel.com>
 <20260219213858.370675-1-koen.koning@linux.intel.com>
 <20260219213858.370675-2-koen.koning@linux.intel.com>
 <2026022016-creole-limpness-6ae7@gregkh>
In-Reply-To: <2026022016-creole-limpness-6ae7@gregkh>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7BE6C166BD7
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 7:06 AM CET, Greg KH wrote:
> On Thu, Feb 19, 2026 at 10:38:56PM +0100, Koen Koning wrote:
>> Use subsys_initcall() instead of module_init() (which compiles to
>> device_initcall() for built-ins) for buddy, so its initialization code
>> always runs before any (built-in) drivers.
>> This happened to work correctly so far due to the order of linking in
>> the Makefiles, but this should not be relied upon.
>
> Same here, Makefile order can always be relied on.

I want to point out that Koen's original patch fixed the Makefile order:

diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
index 5cd54d06e262..b4e5e338efa2 100644
--- a/drivers/gpu/Makefile
+++ b/drivers/gpu/Makefile
@@ -2,8 +2,9 @@
 # drm/tegra depends on host1x, so if both drivers are built-in care must b=
e
 # taken to initialize them in the correct order. Link order is the only wa=
y
 # to ensure this currently.
+# Similarly, buddy must come first since it is used by other drivers.
+obj-$(CONFIG_GPU_BUDDY)	+=3D buddy.o
 obj-y			+=3D host1x/ drm/ vga/ tests/
 obj-$(CONFIG_IMX_IPUV3_CORE)	+=3D ipu-v3/
 obj-$(CONFIG_TRACE_GPU_MEM)		+=3D trace/
 obj-$(CONFIG_NOVA_CORE)		+=3D nova-core/
-obj-$(CONFIG_GPU_BUDDY)		+=3D buddy.o

He was then suggested to not rely on this and rather use subsys_initcall().

When I then came across the new patch using subsys_initcall() I made it wor=
se; I
badly confused this with something else and gave a wrong advise -- sorry Ko=
en!

(Of course, since this is all within the same subsystem, without any extern=
al
ordering contraints, Makefile order is sufficient.)
