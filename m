Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODufGnmRn2kicwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:19:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E919F56F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772FD10E08C;
	Thu, 26 Feb 2026 00:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q3FhyayY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0326910E08C;
 Thu, 26 Feb 2026 00:19:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 77E1B4452A;
 Thu, 26 Feb 2026 00:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 639F2C116D0;
 Thu, 26 Feb 2026 00:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772065139;
 bh=w3m6Gvq8PtKvqJds8vqvFnCWFEGepn0lazcbw18+qOA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q3FhyayYxO3igoPxQlkFl9p+Kfl+rgQl44e029l3FO2RUz3iO9mAnafK5riU+PfNu
 6nM0r6g3d2lojrnvzvhE8fb84biXXw6w4DUjEe56LKSkHEbFzrAeHifTDi6kH6soH/
 btvPiA1c5UBdNYH9h0QhQoZ141wg08VB7p6sgiso/RRUbu0DErebPVOnV8IieZgQFc
 U/ns+6ecdqe+aZhYV6Q0TCOKptBc7qU/xzPF28zzt6xJBEBoBEDploSY426YGZeu/Z
 RcIyO/SiXL9rBN+xB8IHYUve0Xgh2TUeVSzGuvuizbVSp7PlL4UFT+tJu1IUx2V/QE
 2LpVGePCRg2Fg==
Date: Wed, 25 Feb 2026 16:18:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <aravind.iddamsetty@linux.intel.com>,
 <anshuman.gupta@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <airlied@gmail.com>, <pratik.bari@intel.com>,
 <joshua.santosh.ranjan@intel.com>, <ashwin.kumar.kulkarni@intel.com>,
 <shubham.kumar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <raag.jadav@intel.com>, <anvesh.bakwad@intel.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lijo Lazar <lijo.lazar@amd.com>,
 "Hawking Zhang" <Hawking.Zhang@amd.com>, "David S. Miller"
 <davem@davemloft.net>, "Paolo Abeni" <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH v8 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <20260225161857.55fd4ba4@kernel.org>
In-Reply-To: <686b63cc-2dfb-467b-a472-b6766b2c8dd2@intel.com>
References: <20260223060541.526397-7-riana.tauro@intel.com>
 <20260223060541.526397-8-riana.tauro@intel.com>
 <20260224162203.279f7b74@kernel.org>
 <686b63cc-2dfb-467b-a472-b6766b2c8dd2@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[intel.com,lists.freedesktop.org,linux.intel.com,ffwll.ch,gmail.com,oss.qualcomm.com,amd.com,davemloft.net,redhat.com,google.com,vger.kernel.org];
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
X-Rspamd-Queue-Id: D12E919F56F
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 11:38:53 +0530 Riana Tauro wrote:
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>   Documentation/netlink/specs/drm_ras.yaml --mode uapi --header \
>   > include/uapi/drm/drm_ras.h  
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>   Documentation/netlink/specs/drm_ras.yaml --mode kernel --header \
>   > drivers/gpu/drm/drm_ras_nl.h  
> 
> $ tools/net/ynl/pyynl/ynl_gen_c.py --spec \
>   Documentation/netlink/specs/drm_ras.yaml --mode kernel --source \
>   > drivers/gpu/drm/drm_ras_nl.c  

Oh interesting.. that's technically supported but the regen script
uses "-o $file --cmp-out" instead of "> $file". If we were to use
a shell redirect we override the file each time which makes incremental
kernel builds much larger.

> I used above commands to generate the initial files moving the 
> drm_ras_nl.h from include/ to drm layer.
> 
> Even after that if i regen using tools/net/ynl/ynl-regen.sh -f
> I see the above diff.
> 
> Am i using the commands wrong or missing something?

If you use the redirect the script doesn't know what the file name is
so it gives up on adding the local header. If you really want to have
the header under include we can just add an option for "--no-auto-hdr"
But again, just double checking that its what we really need, as the
auto-generated header is usually quite internal to the Netlink code.
The users of the netlink family within the kernel include the uAPI
and some human-written header.
