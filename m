Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dy6H5wKjWmLyAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 00:02:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FFE12836F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 00:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9671B10E251;
	Wed, 11 Feb 2026 23:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=stgolabs.net header.i=@stgolabs.net header.b="QU7y1Ajr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1200 seconds by postgrey-1.36 at gabe;
 Wed, 11 Feb 2026 23:02:46 UTC
Received: from dormouse.ash.relay.mailchannels.net
 (dormouse.ash.relay.mailchannels.net [23.83.222.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AF110E18F;
 Wed, 11 Feb 2026 23:02:46 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id C10F944199D;
 Wed, 11 Feb 2026 22:23:07 +0000 (UTC)
Received: from pdx1-sub0-mail-a251.dreamhost.com
 (100-96-86-174.trex-nlb.outbound.svc.cluster.local [100.96.86.174])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 452BC441A1E;
 Wed, 11 Feb 2026 22:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
 t=1770848587;
 b=IypmqsYIeBZwbj16uTuPsarvT3ON3Vy6pmMNPSgl0hoZ/VDvuZn55ohmZIIJ/Lfw3iS/23
 TeecAD390LyowofmK6q82MAlgP/9J33ZPx168sTiW2/Wla6RLNHWuDx99jCL1PwK3VWxC9
 uFK4wEXzWPR7hIz1UvtYoVXqLXJ05LMczQZjeHFkDsocFcrOtvyOOVSTaM43RVGahcAGXw
 OpyDd1C1YQMU3F/VY9tYNoc0fmweffGKs3YDcZn8eeL1Se0axDaqO+IpwVM1TYzS434Jt0
 r728vEwhDuj3ork9F0xFX3YdtQdmZYJBuSHGw2OeeqVICCFngLqVItVhIO3HHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net; s=arc-2022; t=1770848587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:dkim-signature;
 bh=PONYIdbDGRxdo56DTcMpUfL2VeqX9vWTpesN1Ub95bk=;
 b=uzdNdLen5mvUQkOu5dpYKKJEMNRGNPMAEcAwpbj75UB4hGdKqS4mHN8EMH+EN08PvL6oRw
 MZ68A+4ktRQwOIslbUNj48aiyX7cmZxRnXavnAqdjWK1EhjiOjt5YZWrIXoZA3JqdmT0oc
 AsYZgix4nuOJWVr0+hNrmtnH8IMBy1EwAKunjxj2Z770lsdvNR/GDtETV8EBGKOy0dMWy5
 1FxW8W1vHroev4Rut5gNj4/DOxlMgnF2k0a217Tp57u+nBXo/tBAKH2mCgcMPfKBR6vTcC
 0dD83sUWjMEJXZBGtHpgoeAHKpilyffkvQmwxu7NMa+najGhEBpWp7kt1xenNw==
ARC-Authentication-Results: i=1; rspamd-79bdc9947c-w8xzw;
 auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Befitting-Dime: 0ddd63e94dd79c47_1770848587598_223137175
X-MC-Loop-Signature: 1770848587598:2068019580
X-MC-Ingress-Time: 1770848587597
Received: from pdx1-sub0-mail-a251.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.96.86.174 (trex/7.1.3); Wed, 11 Feb 2026 22:23:07 +0000
Received: from offworld (unknown [76.167.199.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: dave@stgolabs.net)
 by pdx1-sub0-mail-a251.dreamhost.com (Postfix) with ESMTPSA id 4fBCcV2qX7z1041;
 Wed, 11 Feb 2026 14:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
 s=dreamhost; t=1770848587;
 bh=PONYIdbDGRxdo56DTcMpUfL2VeqX9vWTpesN1Ub95bk=;
 h=Date:From:To:Cc:Subject:Content-Type:Content-Transfer-Encoding;
 b=QU7y1Ajr1a7JKLxkXZWmXPu5llbF+rk9H33Ux5srLDRFR3jGMgNXO3EazwSlJOO74
 rFzzSWY8KbDsbgkCUv/ors6d/cg3U6taTgULmVYzyIJCvN1NDpg6BMRs8KPueHJxfZ
 IuOXzmXb4dpnKIw8uLnHETQifiWtSKFjg4BufO4boU+UPABj5fXjNZsXAYjgCv8T/s
 q5gktzcj2f6PNrjlJssrVGxJy6Gd/JM8mHRC/WLkVhWxK3JBxn39Vj9pcGh0Hmg1b5
 e1PC/NSuvJz3ANjmx+pCcsT8JKySIzDb2g/hLIcMCgHCJaefuF80oZUPOHyGKrfeNZ
 XGMPLpCreYB2w==
Date: Wed, 11 Feb 2026 14:23:03 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Thomas =?utf-8?B?SGVsbHN0csOvwr/CvW0=?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
Subject: Re: [PATCH v5] mm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <20260211222303.42qfp6rqxxnpfkr4@offworld>
Mail-Followup-To: Thomas =?utf-8?B?SGVsbHN0csOvwr/CvW0=?=
 <thomas.hellstrom@linux.intel.com>, 
 intel-xe@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20260210115653.92413-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260210115653.92413-1-thomas.hellstrom@linux.intel.com>
User-Agent: NeoMutt/20220429
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
	ARC_ALLOW(-1.00)[mailchannels.net:s=arc-2022:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[stgolabs.net:s=dreamhost];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stgolabs.net:dkim];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave@stgolabs.net,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_NA(0.00)[stgolabs.net];
	DKIM_TRACE(0.00)[stgolabs.net:+]
X-Rspamd-Queue-Id: D2FFE12836F
X-Rspamd-Action: no action

On Tue, 10 Feb 2026, Thomas Hellstr=EF=BF=BDm wrote:

>@@ -176,7 +176,7 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, u=
nsigned long start,
> 		}
>
> 		if (softleaf_is_migration(entry)) {
>-			migration_entry_wait_on_locked(entry, ptl);
>+			softleaf_entry_wait_on_locked(entry, ptl);
> 			spin_unlock(ptl);

softleaf_entry_wait_on_locked() unconditionally drops the ptl.

> 			return -EAGAIN;
> 		}
