Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gERLHVsFkmnNpQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 18:41:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA02113F3CB
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 18:41:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7410E11B;
	Sun, 15 Feb 2026 17:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="HPmThnj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8653C10E11B
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1771177267; x=1771436467;
 bh=Pals6ijfwsJfQQjdXHFieUAypGe6ZmeOZ+6FZkHrhjU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=HPmThnj1FwVHmsuebika/+MKQEGZLqxcxuLV/yhFEQhdr62t9SHRbjY55aNntTu2u
 rXuk3GjnP9zYbz9EwOZ+f1YRZ0+zPa3u5ppa4Vq0LUPaUJ4+Xzve2icilHdD3V65M6
 JhTeN618TrXZT+XGBDzcpTAtRNguwc6POPbnsX1RjE2vFz/7uT/6uOzcKq/N6x8p6L
 FvdBdLcFAKM/Z3KeoAqAdFP4L2CSEK5G0bkd6M49PrbnjagLkvxpX7jcd8y2sPSgQp
 oEFm+Mubs7ZKynz2En280wQUdGXDwyQpEqrEH3EHuxthzXOcJArWZNwpxzL+cubQXx
 2jaeqZd4Q1nDw==
Date: Sun, 15 Feb 2026 17:41:03 +0000
To: Robert Mader <robert.mader@collabora.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH] drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats
Message-ID: <sMK9TTL-ZrbPO1XziTK-27t5uy0F63eHyI1ERCusmQ6pPJ8BkzshI4yKu4bK19UwcljB-PQTRmE44GqWzcBr111zxRN0P3_GK9iASUtcn4o=@emersion.fr>
In-Reply-To: <87ce7c1f-99b0-4bbd-9b65-6ef541c60ab3@collabora.com>
References: <20260208224718.57199-1-contact@emersion.fr>
 <87ce7c1f-99b0-4bbd-9b65-6ef541c60ab3@collabora.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 643065666c49a079a6546c08a1609d97f36b96c8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
	DMARC_POLICY_ALLOW(-0.50)[emersion.fr,none];
	R_DKIM_ALLOW(-0.20)[emersion.fr:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:robert.mader@collabora.com,m:daniels@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[contact@emersion.fr,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[contact@emersion.fr,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[emersion.fr:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AA02113F3CB
X-Rspamd-Action: no action

Thanks for the review! I've pushed the patch to drm-misc-fixes.
