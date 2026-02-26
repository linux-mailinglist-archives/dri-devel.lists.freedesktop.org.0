Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO0eGNOWn2k9cwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:41:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A719F83B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 01:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1AA10E84D;
	Thu, 26 Feb 2026 00:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CcOiuO7N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A1110E84A;
 Thu, 26 Feb 2026 00:41:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1381C60053;
 Thu, 26 Feb 2026 00:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CC4C116D0;
 Thu, 26 Feb 2026 00:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1772066507;
 bh=a5b15Ngqo2bOOdUHSjsT/sSuPPfkZQCQF/naFXI2QkI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CcOiuO7NEI5etysy42JpjnremhTiWgG4lUGW8vs+Kti8TdTA3xkAw8m9bRPHQw/jW
 UtviHmXGTs0EojsHSlFb7e+3Lc6f61/dMS61S/znrah0BD8VlKfWckTXVq5rOTTIiN
 OwOPmCyouWxjyK/Ldx7pApiM6o9/4J5sMHRRG9vY=
Date: Wed, 25 Feb 2026 16:41:44 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Tal Zussman <tz2294@columbia.edu>
Cc: David Howells <dhowells@redhat.com>, Marc Dionne
 <marc.dionne@auristor.com>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu
 <chao@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li
 <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi
 <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He
 <bhe@redhat.com>, Barry Song <baohua@kernel.org>, Matthew Wilcox
 <willy@infradead.org>, Dan Williams <dan.j.williams@intel.com>, Jan Kara
 <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, Paulo Alcantara <pc@manguebit.org>, Trond
 Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, Mark
 Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Steve French <sfrench@samba.org>, Ronnie
 Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N
 <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>, Bharath SM
 <bharathsm@microsoft.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Chris
 Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, Ilya Dryomov
 <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, Viacheslav
 Dubeyko <slava@dubeyko.com>, Andreas Gruenbacher <agruenba@redhat.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Olga Kornievskaia
 <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin
 <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Jann
 Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Brendan Jackman
 <jackmanb@google.com>, Zi Yan <ziy@nvidia.com>, Hugh Dickins
 <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Axel
 Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei
 Xu <weixugc@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-ext4@vger.kernel.org, netfs@lists.linux.dev,
 linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 gfs2@lists.linux.dev, linux-nilfs@vger.kernel.org,
 linux-xfs@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mm: Remove stray references to pagevec
Message-Id: <20260225164144.76e14a362e0d7cae49f20787@linux-foundation.org>
In-Reply-To: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[linux-foundation.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,auristor.com,kernel.org,oracle.com,google.com,suse.com,tencent.com,huaweicloud.com,gmail.com,infradead.org,intel.com,suse.cz,zeniv.linux.org.uk,mit.edu,dilger.ca,manguebit.org,fasheh.com,evilplan.org,linux.alibaba.com,samba.org,microsoft.com,talpey.com,linux.intel.com,suse.de,ffwll.ch,ursulin.net,fb.com,dubeyko.com,linux.dev,brown.name,ziepe.ca,nvidia.com,cmpxchg.org,bytedance.com,lists.infradead.org,vger.kernel.org,lists.sourceforge.net,kvack.org,lists.linux.dev,lists.samba.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_GT_50(0.00)[96];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	NEURAL_HAM(-0.00)[-0.918];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:email]
X-Rspamd-Queue-Id: 102A719F83B
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 18:44:24 -0500 Tal Zussman <tz2294@columbia.edu> wrote:

> struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
> pagevec"). Remove any stray references to it and rename relevant files
> and macros accordingly.
> 
> While at it, remove unnecessary #includes of pagevec.h (now
> folio_batch.h) in .c files. There are probably more of these that could
> be removed in .h files, but those are more complex to verify.

Dang that's a lot of cc's ;)

Thanks, I'll add this series to mm.git's mm-new branch.
