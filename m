Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AISaNrRAnmlgUQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 01:22:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EB618E5BB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 01:22:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8915410E33B;
	Wed, 25 Feb 2026 00:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ge0AiJIv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87DC10E012;
 Wed, 25 Feb 2026 00:22:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A013C60051;
 Wed, 25 Feb 2026 00:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8666EC116D0;
 Wed, 25 Feb 2026 00:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771978925;
 bh=ynS84/0PMmxwKi16uvPa1XSyB0im66wxPhqSCK6S0ds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ge0AiJIvBbl8tSOzxzpG6pDDxdakdYHxj/SGqI3iokbedOLglImYp+KS38hGNLx0a
 aM4z068jN6vU+r6rQx96V354L/n0avRsXMP61aiek7Wk/sTQI/b/qtcaYXPMNI4jIj
 pUvPi6m8MfYfGpMMgEMs1mEvyNGFgZsjTHt2fO9tuWmafIKW9JNw94xJZSonkwZQhO
 N7N+6eS2Ypj6Qedc00oqWRi1T7HC9ThxHiXUEdpSGv68DZ7fIpzGbprS9+eBwESEDG
 WBdNBdDQRHLx2jz2FBUpPSykRhJDOHutCVc2UfCQYFN0Xags6ULJmM8vzqnJm5JvDH
 ICcFRdvLF48gQ==
Date: Tue, 24 Feb 2026 16:22:03 -0800
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
Subject: Re: [PATCH v8 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <20260224162203.279f7b74@kernel.org>
In-Reply-To: <20260223060541.526397-8-riana.tauro@intel.com>
References: <20260223060541.526397-7-riana.tauro@intel.com>
 <20260223060541.526397-8-riana.tauro@intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]
X-Rspamd-Queue-Id: 46EB618E5BB
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 11:35:41 +0530 Riana Tauro wrote:
> From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Introduces the DRM RAS infrastructure over generic netlink.
> 
> The new interface allows drivers to expose RAS nodes and their
> associated error counters to userspace in a structured and extensible
> way. Each drm_ras node can register its own set of error counters, which
> are then discoverable and queryable through netlink operations. This
> lays the groundwork for reporting and managing hardware error states
> in a unified manner across different DRM drivers.

Family itself LGTM.

I'm getting this diff when running regen:

diff --git a/drivers/gpu/drm/drm_ras_nl.c b/drivers/gpu/drm/drm_ras_nl.c
index 4714a574a143..8bc85eab751f 100644
--- a/drivers/gpu/drm/drm_ras_nl.c
+++ b/drivers/gpu/drm/drm_ras_nl.c
@@ -7,6 +7,8 @@
 #include <net/netlink.h>
 #include <net/genetlink.h>
 
+#include "drm_ras_nl.h"
+
 #include <uapi/drm/drm_ras.h>
 #include <drm/drm_ras_nl.h>
 

Is there a reason why drm_ras_nl.h is in the global include/ path and
not in drivers/gpu/drm/, directly? This header is meant to be used
just between the generated C code (which is mostly structs at this
point) and the C source implementing the family. We haven't had any
use case which would require making it global so generator doesn't
support that.

The source needs to be clean after regen, so we either need to move 
the header in this patch or I can send you a patch to add a new
generator feature to override the header location. LMK.
