Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /ulsBpMOqmngKQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:15:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFCB219347
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 00:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E7E10EC76;
	Thu,  5 Mar 2026 23:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=sina.com header.i=@sina.com header.b="ymqM37cY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Thu, 05 Mar 2026 23:15:25 UTC
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn
 [202.108.3.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 540D210EC76
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1772752525; bh=Shl+BiZngOGxg1GDTZ6fLo/PO0+5Oaw5mzBqiPTjjjQ=;
 h=From:Subject:Date:Message-ID;
 b=ymqM37cYXL5cx2FbwSffTjCRopCatOi5pDbD1+TwGtL+RJA//7UyXXl67ldUXzqZA
 M8GSqqTE/IoaVUWp/nKCs1PsqecK6QCzlwED0Vj6Fp3evZW1Q5dFDnPFzBhKlLupmH
 MmQOPgGvamdAXpow/y7pHcb4Fc0i6cJlaCpoexqE=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.144])
 by sina.com (10.54.253.31) with ESMTP
 id 69AA0D4600005D81; Thu, 6 Mar 2026 07:09:59 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=hdanton@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3628436816224
X-SMAIL-UIID: 0D0675C103F64A02951E9EFE8FA1D363-20260306-070959-1
From: Hillf Danton <hdanton@sina.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 DRI <dri-devel@lists.freedesktop.org>, intel-xe@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: drm_sched run_job and scheduling latency
Date: Fri,  6 Mar 2026 07:09:46 +0800
Message-ID: <20260305230948.679-1-hdanton@sina.com>
In-Reply-To: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: DCFCB219347
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[sina.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[sina.com:s=201208];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:olvaffe@gmail.com,m:matthew.brost@intel.com,m:intel-xe@lists.freedesktop.org,m:dakr@kernel.org,m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[hdanton@sina.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[sina.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hdanton@sina.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:dkim,sina.com:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:51:39PM -0800, Chia-I Wu wrote:
> Hi,
> 
> Our system compositor (surfaceflinger on android) submits gpu jobs
> from a SCHED_FIFO thread to an RT gpu queue. However, because
> workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> to run_job can sometimes cause frame misses. We are seeing this on
> panthor and xe, but the issue should be common to all drm_sched users.
> 
> Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> meet future android requirements). It seems either workqueue needs to
> gain RT support, or drm_sched needs to support kthread_worker.
>
As RT means (in general) to some extent that the game of eevdf is played in
__userspace__, but you are not PeterZ, so any issue like frame miss is
understandably expected.
Who made the workqueue worker a victim if the CPU cycles are not tight?
Who is the new victim of a RT kthread worker?
As RT is not free, what did you pay for it, given fewer RT success on market?
