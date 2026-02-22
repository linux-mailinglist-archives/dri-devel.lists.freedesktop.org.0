Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL6+GSAMnGlL/QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:13:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92EC172F70
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 09:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C834110E26C;
	Mon, 23 Feb 2026 08:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=pm.me header.i=@pm.me header.b="bvEPP7BM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944C110E136
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 06:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1771742759; x=1772001959;
 bh=egmxeKzZW4IOZX19k1bmJ//ZuEL1hoh9VdDZXSOcoUk=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=bvEPP7BMyXI/mvQBpvBthualk2QnlC+Ug5Wv3LLaR3hHRYj4CCGf7R4vi/Y77vkMy
 w3vzSBwzbgGJ9v/v7GBgIwvGK0dIPooWL8a4WtYUc1yn4vht+vGXwwN3rmXp4kxy0+
 ttz9RCkYKp4VaPYP/gJco3l3gXZO3cnDmupdg/quoivBJzmAFAYCDOceoAckJqpARe
 HoqjcjKEHu0vBX6rSbRfdXBqacgZFDRCYWyAJCqv6su6urq33buC9BjiDJziOJ1Ug0
 JxFVXwwjLSeG3eujRgXuWGSArHIob9x/c/DkjWQlxBmbZ8tsGoSQ5K3t4BMrSESQyX
 LYyP8TaLGxLJg==
Date: Sun, 22 Feb 2026 06:45:54 +0000
To: Ruben Wauters <rubenru09@aol.com>
From: Hardik Phalet <hardik.phalet@pm.me>
Cc: Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Subject: [drm/gud] RFC: Convert dev_* logging to drm_*() for multi-instance
 GUD devices?
Message-ID: <DGLADYEJGEKE.3JJBF0RHQ4T6H@pm.me>
Feedback-ID: 166659585:user:proton
X-Pm-Message-ID: 9d0fb8ac2b904fc39c67961891fe6f304cff63e1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 Feb 2026 08:13:16 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	DATE_IN_PAST(1.00)[25];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rubenru09@aol.com,m:seanpaul@chromium.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[aol.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[hardik.phalet@pm.me,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[hardik.phalet@pm.me,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pm.me:mid,pm.me:dkim]
X-Rspamd-Queue-Id: E92EC172F70
X-Rspamd-Action: no action

Hi Ruben,

I am looking to work on a small starter task in DRM and was considering
converting logging in drivers/gpu/drm/gud from dev_info/dev_warn/dev_err
to the drm_*() helpers where a struct drm_device is already (or readily)
available.

Since GUD is a USB-backed DRM driver and can have multiple active
instances, using drm_*() would make log messages instance-aware and
consistent with DRM drivers.

Before preparing a patch series, I wanted to check whether this kind of
conversion is welcome for GUD, and whether there are any parts of the drive=
r
you would prefer to keep using dev_*() instead of drm_*().

If this is fine, I plan to keep the changes mechanical and scoped only to
call sites where drm_device is already in scope, preserving logging
semantics.

Thanks,
Hardik

