Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCFwB06tjWmz5wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:37:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E309312C8FE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 11:37:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4279B10E248;
	Thu, 12 Feb 2026 10:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P/IKtvn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D0F10E245;
 Thu, 12 Feb 2026 10:36:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 22B0A60053;
 Thu, 12 Feb 2026 10:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914CBC4CEF7;
 Thu, 12 Feb 2026 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770892203;
 bh=ZCM9xpPU2kD7F6TSBvtSfvV2kHjO3+wswcwEoR1Poac=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=P/IKtvn9dFrhJUoeMZlWmQpQm4hTnofOic9konPvy4fcOzk5h7klacTfBXBe5b2s7
 WZcNu+DW3dmqmBT3wQ0L217Baly+AjXcCB8CJRy+MOV94ac5I9U10OPlCeToyi4WP0
 dbCCrnrTz35Na+QfHODzp1HxTxIJcC2YxwLrZ7Soq3fGUsQY3QXcSpTK8Xt7r+ah2A
 WskwjCLD8eMYtdijgbqyK87NyUZTJivHcu1qNLUXkMcFl1483X+3vSuEYL3P6kIMDb
 /yNZLkYc4iN8sTUV134BLQrrmGHNa4mz/eWAXB+OZ6Qgwm1Z2EhMVlSwOCpnt4CKy/
 oFyzVtOAW2QBQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 11:29:59 +0100
Message-Id: <DGCWW5ME9V8N.2C22CCX8Y3469@kernel.org>
Cc: <phasta@kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Leo Liu"
 <Leo.Liu@amd.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Matthew Brost"
 <matthew.brost@intel.com>, "Pierre-Eric Pelloux-Prayer"
 <pierre-eric.pelloux-prayer@amd.com>, =?utf-8?q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 00/31] Fair(er) DRM scheduler
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
 <7fcca1f49427e0279a740b6c1b9bb072eabc2c35.camel@mailbox.org>
 <12fc3ede-d9af-4d32-8ea4-822a9b93627d@igalia.com>
In-Reply-To: <12fc3ede-d9af-4d32-8ea4-822a9b93627d@igalia.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E309312C8FE
X-Rspamd-Action: no action

On Thu Feb 12, 2026 at 10:56 AM CET, Tvrtko Ursulin wrote:
> I am waiting on Christian to merge the first three patches via amd-next.=
=20

Let's take them through drm-misc if the AMD folks agree, otherwise we can't=
 pull
in this series without backmerging, etc.

> And based on the past experience you will not be merging it any time soon=
.

In our conversation in v5 we been discussing about the maintainance concern=
s and
seem to have consensus that subsequent work has to focus on locking design.

Also, thanks for the detailed clarification about the accounting of the ent=
ity
GPU time.

Given that, for the DRM scheduler and nouveau parts

	Acked-by: Danilo Krummrich <dakr@kernel.org>

One more request: For the future, please send the full series to my inbox.
