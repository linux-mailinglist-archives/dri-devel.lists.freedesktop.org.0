Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAI1NxnVnGkJLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:30:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E0117E5E8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 23:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8474910E457;
	Mon, 23 Feb 2026 22:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nRhl7swP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CC310E457;
 Mon, 23 Feb 2026 22:30:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7A71642E0C;
 Mon, 23 Feb 2026 22:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A76C116C6;
 Mon, 23 Feb 2026 22:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771885846;
 bh=Ri8Bcp3HNyoGxaB+xtimKGPg09Xa/BNnKr7GVNRZg7c=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=nRhl7swPKKcAroLdDFvPAoPx0CnV7LfQtzl7aH7Z6tqtRtrp0UpJ/Ki2jnqXchNkn
 aahglVaYJ8vqzJfIU27+WF/5baLzzHzVS3a+BEPeaK8ghSZI9BJTLP1OzfIc/t0fPq
 kZYj94WApvOpOW6+0euJsMyckPB5qds4vmN7styV8BRmKFR67KwauijEoojtM/Yj91
 KE9hI6X93wQZs1IatN8YKdKrMFU6MTZu5Q550rQmRQCzLKLsDauyu6yOOOgCvjS9Ls
 7KSx3BM4Yca3ZbQ3mJ5b0MJn9d85bNDoZ4C/27GsEPmK1Yhg+0Iec/W6EZXiZDMwIY
 1rd8THtiso8lQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 23:30:42 +0100
Message-Id: <DGMP3YT8VSCW.3OJRL3TK5PLRQ@kernel.org>
Subject: Re: [PATCH] gpu: Fix uninitialized buddy for built-in drivers
Cc: <dri-devel@lists.freedesktop.org>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Dave Airlie" <airlied@redhat.com>,
 <intel-xe@lists.freedesktop.org>, "Peter Senna Tschudin"
 <peter.senna@linux.intel.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>, "Matthew Auld"
 <matthew.auld@intel.com>, "Arun Pravin" <arunpravin.paneerselvam@amd.com>
To: "Koen Koning" <koen.koning@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
In-Reply-To: <20260213152047.179628-1-koen.koning@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,nvidia.com:email]
X-Rspamd-Queue-Id: 68E0117E5E8
X-Rspamd-Action: no action

(Cc: Matthew, Arun)

On Fri Feb 13, 2026 at 4:20 PM CET, Koen Koning wrote:
> Move buddy to the start of the link order, so its __init runs before any
> other built-in drivers that may depend on it. Otherwise, a built-in
> driver that tries to use the buddy allocator will run into a kernel NULL
> pointer dereference because slab_blocks is uninitialized.
>
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.
>
> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part tw=
o)")
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
> ---
>  drivers/gpu/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/Makefile b/drivers/gpu/Makefile
> index 5cd54d06e262..b4e5e338efa2 100644
> --- a/drivers/gpu/Makefile
> +++ b/drivers/gpu/Makefile
> @@ -2,8 +2,9 @@
>  # drm/tegra depends on host1x, so if both drivers are built-in care must=
 be
>  # taken to initialize them in the correct order. Link order is the only =
way
>  # to ensure this currently.
> +# Similarly, buddy must come first since it is used by other drivers.
> +obj-$(CONFIG_GPU_BUDDY)	+=3D buddy.o
>  obj-y			+=3D host1x/ drm/ vga/ tests/
>  obj-$(CONFIG_IMX_IPUV3_CORE)	+=3D ipu-v3/
>  obj-$(CONFIG_TRACE_GPU_MEM)		+=3D trace/
>  obj-$(CONFIG_NOVA_CORE)		+=3D nova-core/
> -obj-$(CONFIG_GPU_BUDDY)		+=3D buddy.o
> --=20
> 2.48.1

