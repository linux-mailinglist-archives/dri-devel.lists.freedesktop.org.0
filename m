Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPuvJMJtlmnrfAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 02:56:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176D15B735
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 02:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EF210E650;
	Thu, 19 Feb 2026 01:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="L9ZlxRlv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C412510E64E;
 Thu, 19 Feb 2026 01:56:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AF6136132F;
 Thu, 19 Feb 2026 01:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1546FC116D0;
 Thu, 19 Feb 2026 01:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771466172;
 bh=1Zr6zn+t9zQ5uzbiKux522mMCUA2Rat4glkGMdEmA08=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L9ZlxRlvz0gAOZGndoAcQUAbNGoc5Q9zhtBuFJkAIHxh1L1Jv/FBiFF76MfUQM3Aw
 89I3FUKMAr5o5rDoqEo0Yq42gqco77Ar949v8QnSr3QAXQ+sIf5BO3xYo7vi68m4Ob
 DIA1HnzeGlYbeoO1VzQT1DJi74bXc5IOiUVjK9n0K9Yu8JzpKRMA1uRpxbuHb8bWJw
 r4hT94HN4u7ObB2Q20El1jUv3Nhhh4mlwpEE3L41SEu/cbx3k37o5ifGShwMgkdiF9
 pBOrIO7mrMujacO8qaL+4x4dRz97BjHA1KiPiJ0dXLSnOoIInkMuz3pqurNraYt9Y8
 oX8g2cD/+st+g==
Date: Wed, 18 Feb 2026 17:56:07 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 simona.vetter@ffwll.ch, airlied@gmail.com, pratik.bari@intel.com,
 joshua.santosh.ranjan@intel.com, ashwin.kumar.kulkarni@intel.com,
 shubham.kumar@intel.com, ravi.kishore.koppuravuri@intel.com,
 raag.jadav@intel.com, Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 "David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v7 1/5] drm/ras: Introduce the DRM RAS infrastructure
 over generic netlink
Message-ID: <20260218175607.711ffd2c@kernel.org>
In-Reply-To: <20260218121904.157295-8-riana.tauro@intel.com>
References: <20260218121904.157295-7-riana.tauro@intel.com>
 <20260218121904.157295-8-riana.tauro@intel.com>
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
	RCPT_COUNT_TWELVE(0.00)[22];
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
X-Rspamd-Queue-Id: 0176D15B735
X-Rspamd-Action: no action

On Wed, 18 Feb 2026 17:49:03 +0530 Riana Tauro wrote:
> +    -
> +      name: get-error-counters
> +      doc: >-
> +           Retrieve the full list of error counters for a given node.
> +           The response include the id, the name, and even the current
> +           value of each counter.
> +      attribute-set: error-counter-attrs
> +      flags: [admin-perm]
> +      dump:
> +        request:
> +          attributes:
> +            - node-id
> +        reply:
> +          attributes:
> +            - error-id
> +            - error-name
> +            - error-value
> +    -
> +      name: query-error-counter
> +      doc: >-
> +           Query the information of a specific error counter for a given node.
> +           Users must provide the node ID and the error counter ID.
> +           The response contains the id, the name, and the current value
> +           of the counter.
> +      attribute-set: error-counter-attrs
> +      flags: [admin-perm]
> +      do:
> +        request:
> +          attributes:
> +            - node-id
> +            - error-id
> +        reply:
> +          attributes:
> +            - error-id
> +            - error-name
> +            - error-value

The get-error-counters vs query-error-counter is sort of asking to be a
do and dump of the same op doesn't it? The return messages are the same,
one returns a single counter, the other one (filtered to given node-id)
dump of counters. Not a big deal, but from Netlink perspective having
these as do / dump of the same op would be more natural.

On top of that please definitely make sure that the code is generated
with the latest tooling from Linus's tree! We tweaked the output a
little, it shouldn't happen again but running regen with this commit
gives me a dirty tree with a bunch of:

diff --git a/include/uapi/drm/drm_ras.h b/include/uapi/drm/drm_ras.h
index 3415ba345ac8..31f0180c1035 100644
--- a/include/uapi/drm/drm_ras.h
+++ b/include/uapi/drm/drm_ras.h
@@ -2,6 +2,7 @@
 /* Do not edit directly, auto-generated from: */
 /*     Documentation/netlink/specs/drm_ras.yaml */
 /* YNL-GEN uapi header */
+/* To regenerate run: tools/net/ynl/ynl-regen.sh */
 
 #ifndef _UAPI_LINUX_DRM_RAS_H
 #define _UAPI_LINUX_DRM_RAS_H


Last but not least:

$ yamllint Documentation/netlink/specs/drm_ras.yaml
Documentation/netlink/specs/drm_ras.yaml
  59:14     error    too many spaces after colon  (colons)

