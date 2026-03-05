Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JvwAuZKqWn+3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:20:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DA820E3D1
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8710EBCD;
	Thu,  5 Mar 2026 09:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gnkMvPLp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC49610EBCD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mjjpIfVBw+OfovjerOy7FsA1OO7yTDOchbtSBxVm5mM=; b=gnkMvPLp4+IX2qS9jOKCa8nULM
 x+G88QCWtHaPPfHCHL27FFUULfnan6WwptYnUjb8vKuGQ9LTNrwtjvPb1LGwy+R2nsFvNDaa+DHCp
 diEJeslTo9/5qoSFAdYHRop50jnjLNSwWhey1kdR79/WjDI8HZZkskFKXZCPmQwIAg9Tz6iPqJ2QH
 wcFr4wLqP6P8cye19dvZuLrZXr5IoC9kJgBGw/wVQCAGX1+geBeILJzcYzP2vvhT3hmviliuocZwr
 yvG9uAZG2X5uTpIv0GmFNcTHKtwb7xXpvSz7HmJzqmJooNWUf8qbNsni1HGtektAZfl4kBIfnjE7t
 kBz1PlTw==;
Received: from ip160.dynamic.igalia.com ([192.168.10.160])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vy4sf-009IBL-Se; Thu, 05 Mar 2026 10:20:29 +0100
Message-ID: <c215d66ce4009b2f6fb4a12cca6c6bc34c900f70.camel@igalia.com>
Subject: Re: [PATCH 0/6] drm/v3d: Improve v3d_stats lifetime and locking
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Maxime
 Ripard <mripard@kernel.org>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Date: Thu, 05 Mar 2026 10:20:29 +0100
In-Reply-To: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
References: <20260217-v3d-reset-locking-improv-v1-0-0db848016869@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: 68DA820E3D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mcanal@igalia.com,m:mwen@igalia.com,m:tvrtko.ursulin@igalia.com,m:mripard@kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[itoral@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.957];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[itoral@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Action: no action

Patches 1-4 and 6 are:
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Patch 5 looks good too except for one question I had, I might be
missing something though, so let me know if that's the case.

Iago


El mar, 17-02-2026 a las 09:18 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> This series aims to improve the `struct v3d_stats` lifetime
> management.
> The commit fa6a20c87470 ("drm/v3d: Address race-condition between
> per-fd
> GPU stats and fd release") addressed a race-condition between the
> per-fd
> GPU stats and the fd release by clearing `job->file_priv` before the
> V3D
> per-fd structure is freed and assuring that `job->file_priv` exists
> during the per-fd GPU stats updates.
>=20
> However, this approach introduced a tricky file_priv NULL-ing dance
> with
> the `queue_lock` spinlock. This series aims to address this issue in
> a
> simpler way: converting `v3d_stats` from embedded structs to
> heap-allocated, refcounted objects. This simplifies the code and
> leaves
> `queue_lock` exclusively for job management.
>=20
> The series also switches to raw seqcount helpers to resolve a lockdep
> annotation issue, fixes missing error handling in
> drm_sched_entity_init(),
> and removes the now-unnecessary dedicated fence_lock.
>=20
> Best regards,
> - Ma=C3=ADra
>=20
> ---
> Ma=C3=ADra Canal (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Handle error from drm_sched_entit=
y_init()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Remove dedicated fence_lock
>=20
> Tvrtko Ursulin (4):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Use raw seqcount helpers instead =
of fighting with
> lockdep
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Refcount v3d_stats
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Hold v3d_stats references in each=
 job
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/v3d: Attach per-fd reset counters to v=
3d_stats
>=20
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0 53 ++++++++=
+-------
> =C2=A0drivers/gpu/drm/v3d/v3d_drv.h=C2=A0=C2=A0=C2=A0 |=C2=A0 46 ++++++++=
+-----
> =C2=A0drivers/gpu/drm/v3d/v3d_fence.c=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_gem.c=C2=A0=C2=A0=C2=A0 |=C2=A0 43 ++++++++=
-----
> =C2=A0drivers/gpu/drm/v3d/v3d_irq.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/v3d/v3d_sched.c=C2=A0 | 133 +++++++++++++++--------=
------
> ----------
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c |=C2=A0=C2=A0 6 ++
> =C2=A0drivers/gpu/drm/v3d/v3d_sysfs.c=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A08 files changed, 147 insertions(+), 140 deletions(-)
> ---
> base-commit: 0ef1dcf4c16bb6d90e8fbf7b18f3d76b79fcde9d
> change-id: 20260215-v3d-reset-locking-improv-ffe16c35569b
>=20
>=20

