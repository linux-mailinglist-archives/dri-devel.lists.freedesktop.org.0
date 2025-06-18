Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E32ADF666
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 20:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B31410E8FF;
	Wed, 18 Jun 2025 18:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="spoIFwP0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PTBsKn5B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s69NhA1c";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hv0GDsGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC2F10E796
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 07:46:29 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97D931F7C0;
 Wed, 18 Jun 2025 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750232787; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RC+O0xj37+Yau58lyiHCV9xUnnOZ5GevJAzczGl/EV8=;
 b=spoIFwP0GUx0oL/Al3wYDGqO2Ms785XkS3z+TQJ6jYucPcwaVPjL7GjOo64ZcATIBD+kfT
 vettQ2+exQ8hMdawan7z9kB9eMyq8bBZeuL/JYvO0t4yvOvmuoHDqjN40IJqVYRgowimuw
 zA2o63JeHpRfsg2mP0h+C9tvSS85rvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750232787;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RC+O0xj37+Yau58lyiHCV9xUnnOZ5GevJAzczGl/EV8=;
 b=PTBsKn5B5HyvpMQk2XrmTVh17ufPR7duKGeKARDw3lXTaTZ40sfz8dzyEtmMGYJld6+2vG
 WFdjxClXy0CeBZCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750232786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RC+O0xj37+Yau58lyiHCV9xUnnOZ5GevJAzczGl/EV8=;
 b=s69NhA1cBtxNb0iqsjM06xlw5uusEuIrC9lwfb6v6PDsyBgvTfQRzXjc3WUL5n6eHwZoaw
 XNlI21spixT7NESSDYnAASnn8a8440/67d5ytjm1I5j3HWlBVsYxHKj9vggMGQgaU90QkD
 UjZdGJAIcFpb90vdadg9R6f0omszBPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750232786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RC+O0xj37+Yau58lyiHCV9xUnnOZ5GevJAzczGl/EV8=;
 b=hv0GDsGTEccUveV/7L0i1as+rco4s2pxSfMMMjUPyT6iaPj2hhi4448p6ToqQ5Kg+NrHeS
 /vJWkexH+MqvotDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1EA5F13A3F;
 Wed, 18 Jun 2025 07:46:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uVqkBNJuUmjdewAAD6G6ig
 (envelope-from <osalvador@suse.de>); Wed, 18 Jun 2025 07:46:26 +0000
Date: Wed, 18 Jun 2025 09:46:20 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 2/3] mm/memfd: Reserve hugetlb folios before allocation
Message-ID: <aFJuzKPG-7t_oflN@localhost.localdomain>
References: <20250618053415.1036185-1-vivek.kasireddy@intel.com>
 <20250618053415.1036185-3-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618053415.1036185-3-vivek.kasireddy@intel.com>
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid]
X-Spam-Level: 
X-Mailman-Approved-At: Wed, 18 Jun 2025 18:55:50 +0000
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

On Tue, Jun 17, 2025 at 10:30:54PM -0700, Vivek Kasireddy wrote:
> When we try to allocate a folio via alloc_hugetlb_folio_reserve(),
> we need to ensure that there is an active reservation associated
> with the allocation. Otherwise, our allocation request would fail
> if there are no active reservations made at that moment against any
> other allocations. This is because alloc_hugetlb_folio_reserve()
> checks h->resv_huge_pages before proceeding with the allocation.
> 
> Therefore, to address this issue, we just need to make a reservation
> (by calling hugetlb_reserve_pages()) before we try to allocate the
> folio. This will also ensure that proper region/subpool accounting is
> done associated with our allocation.

I'm not really familiar with memfd code, but can't you make such
reservation when you create the file in alloc_file?
I see that you explicitly pass VM_NORESERVE. What's the reason for
that?
 

-- 
Oscar Salvador
SUSE Labs
