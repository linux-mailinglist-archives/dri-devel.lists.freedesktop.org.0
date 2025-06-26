Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43920AEA846
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 22:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB2C10E154;
	Thu, 26 Jun 2025 20:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1C1/JdlJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Ves1OA5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1C1/JdlJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7Ves1OA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012E810E154
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 20:35:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6B8052117C;
 Thu, 26 Jun 2025 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750970139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ip7Z31436t77dS85M6up0gd93ynn9vaRqbRMuIaCk1M=;
 b=1C1/JdlJYhfUFT2kAiN0dl3hGMM0wksxFVa6ze82AJU7gmiJ4OFESnj1YwPSHKmg5SPBco
 Gl81SaNUH9mB/NbRLfEmJWOqz8BY2PFFCoee2oK2jfuGqOgsjIHBRVj8A0sM5MBfJv3oOO
 zPc0OOp3IKcIe0rCACRVrOvS9l6aizY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750970139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ip7Z31436t77dS85M6up0gd93ynn9vaRqbRMuIaCk1M=;
 b=7Ves1OA5GcgDN1nWUvBJSCzutEzjxwNSnx6Ykt5erIxBzfiO+G8nz1u77/csHaPhbQ1Ong
 n5OC1ckpZlqdQkAQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="1C1/JdlJ";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7Ves1OA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750970139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ip7Z31436t77dS85M6up0gd93ynn9vaRqbRMuIaCk1M=;
 b=1C1/JdlJYhfUFT2kAiN0dl3hGMM0wksxFVa6ze82AJU7gmiJ4OFESnj1YwPSHKmg5SPBco
 Gl81SaNUH9mB/NbRLfEmJWOqz8BY2PFFCoee2oK2jfuGqOgsjIHBRVj8A0sM5MBfJv3oOO
 zPc0OOp3IKcIe0rCACRVrOvS9l6aizY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750970139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ip7Z31436t77dS85M6up0gd93ynn9vaRqbRMuIaCk1M=;
 b=7Ves1OA5GcgDN1nWUvBJSCzutEzjxwNSnx6Ykt5erIxBzfiO+G8nz1u77/csHaPhbQ1Ong
 n5OC1ckpZlqdQkAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE7CA138A7;
 Thu, 26 Jun 2025 20:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id sXqBMxqvXWhOGgAAD6G6ig
 (envelope-from <osalvador@suse.de>); Thu, 26 Jun 2025 20:35:38 +0000
Date: Thu, 26 Jun 2025 22:35:33 +0200
From: Oscar Salvador <osalvador@suse.de>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2] mm/hugetlb: Don't crash when allocating a folio if
 there are no resv
Message-ID: <aF2vFfXshoM391nQ@localhost.localdomain>
References: <20250626191116.1377761-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626191116.1377761-1-vivek.kasireddy@intel.com>
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6B8052117C
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MISSING_XM_UA(0.00)[]; TAGGED_RCPT(0.00)[a504cb5bae4fe117ba94];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,intel.com:email,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
X-Spam-Level: 
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

On Thu, Jun 26, 2025 at 12:11:16PM -0700, Vivek Kasireddy wrote:
> There are cases when we try to pin a folio but discover that it has
> not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
> but there is a chance that we might encounter a fatal crash/failure
> (VM_BUG_ON(!h->resv_huge_pages) in alloc_hugetlb_folio_reserve()) if
> there are no active reservations at that instant. This issue was
> reported by syzbot:
> 
... 
> 3) is the most common use-case where first a memfd is allocated
> followed by mmap(), user writes/updates and then the relevant folios
> are pinned (memfd_pin_folios()). The BUG this patch is fixing occurs
> in 2) because we try to pin the folios before hugetlbfs_file_mmap()
> is called. So, in this situation we try to allocate the folios
> before pinning them but since we did not make any reservations,
> resv_huge_pages would be 0, leading to this issue.

Well, if we did not make any reservations, resv_huge_pages will be 0 for sure,
right?
As I see it, this piece of code is steril, because you have to entrust making
those reservations to someone else for this to work. (Like you do in the
other patch).
But this fixes a bug, so..
 
> Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages leak")
> Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
> Closes: https://lore.kernel.org/all/677928b5.050a0220.3b53b0.004d.GAE@google.com/T/
> Cc: Steve Sistare <steven.sistare@oracle.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Acked-by: Oscar Salvador <osalvador@suse.de>

> ---
>  mm/hugetlb.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 8746ed2fec13..a181c55f268b 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2340,12 +2340,15 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
>  	struct folio *folio;
>  
>  	spin_lock_irq(&hugetlb_lock);
> +	if (!h->resv_huge_pages) {
> +		spin_unlock_irq(&hugetlb_lock);
> +		return NULL;
> +	}
> +
>  	folio = dequeue_hugetlb_folio_nodemask(h, gfp_mask, preferred_nid,
>  					       nmask);
> -	if (folio) {
> -		VM_BUG_ON(!h->resv_huge_pages);
> +	if (folio)
>  		h->resv_huge_pages--;
> -	}
>  
>  	spin_unlock_irq(&hugetlb_lock);
>  	return folio;
> -- 
> 2.49.0
> 

-- 
Oscar Salvador
SUSE Labs
