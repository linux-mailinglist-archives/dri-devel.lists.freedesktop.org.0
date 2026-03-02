Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE/jBeShpmmvSAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:55:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9EE1EB45C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8CD010E6E9;
	Tue,  3 Mar 2026 08:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VcuXMaHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1B710E5C0;
 Mon,  2 Mar 2026 20:36:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 261C660131;
 Mon,  2 Mar 2026 20:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA5FFC2BCB6;
 Mon,  2 Mar 2026 20:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483790;
 bh=00hKJMzy7sYsJ1YOgVeBFYPPejllxH5501TXoBKb/EY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VcuXMaHsGS9MQntJPTqxheMObwYrAi/GVvR0kw0bb/rCsvu6SF2MbdYULNGyOBpy0
 6PYiBA7Dxg1U36OO3QSjQbye493vKTwjlHgigKka0weIHZRFsC5dBQQVb4KM4jNnTP
 Pav6Zd+50z8Wy81wYbGnFQSJNfMMYefXd5K3Y2hJvCosc5/LyepzEoP3RuEM6eBi6/
 RVB8ocbSiI7qaCAoslikDQAyfQx82c55I7UGP/CecGpw2C/OoQEcE9IUBU1Tw4YGhR
 zr5cyanaLugirG6BskpQueqyx7DUZ4Hn/I0dTXFqczVeJNr2n9fmjZiyjUltmDi7jQ
 2ZVLl8YTyQx1A==
From: Jeff Layton <jlayton@kernel.org>
Date: Mon, 02 Mar 2026 15:24:32 -0500
Subject: [PATCH v2 048/110] zonefs: use PRIino format for i_ino
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-iino-u64-v2-48-e5388800dae0@kernel.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, 
 Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yangtao Li <frank.li@vivo.com>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, 
 Joerg Reuter <jreuter@yaina.de>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Remi Denis-Courmont <courmisch@gmail.com>, 
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
 Xin Long <lucien.xin@gmail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
 fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev, 
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org, 
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org, autofs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, codalist@coda.cs.cmu.edu, 
 ecryptfs@vger.kernel.org, linux-mtd@lists.infradead.org, 
 jfs-discussion@lists.sourceforge.net, ntfs3@lists.linux.dev, 
 ocfs2-devel@lists.linux.dev, devel@lists.orangefs.org, 
 linux-unionfs@vger.kernel.org, apparmor@lists.ubuntu.com, 
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, 
 selinux@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-fscrypt@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linux-hams@vger.kernel.org, 
 linux-x25@vger.kernel.org, audit@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-sctp@vger.kernel.org, bpf@vger.kernel.org, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=00hKJMzy7sYsJ1YOgVeBFYPPejllxH5501TXoBKb/EY=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH7iSn+nuF18SKJ09GIwF9lGV/gMpEGjStoo
 kWpC+VrAweJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx+wAKCRAADmhBGVaC
 FQKfEACjSsXZzurjjILEHuG/C9EMcKoheBtyMn3dLskrkohM0UNiLSxTRscuhVF0milzCYzi70q
 +XcKZGuXxwxDywRGEG3XvlOT2IsU41kuLrxC+nR03F0Ytrcd2bu31e0LxBkhPB/NPEt9Wh0B8N0
 qKlYEozS78Q68F2dzE7iptWmo9nLasG1tqcOBRF2iSojpqAP29araSZ+MdLz8+8srEDm6ctBh7i
 1O311qKQ273EFMyFJJnwdK5KHlAWrWgHSaZHqrz3euJY/L9H9gI7RIp+LdYbZYdbFusMczmSNkR
 H43zejV4Nit3o12JjHngeAokR6DaZE+z80+H08g3ywlkAvc6utfnWgAMAVI+Xt9r/XUMMHqoSW2
 coXN7a3OximEiDRt/X14GZWsoAXwxmKd5jlJR3KIbgjKxUmEM6l3BsLb7HJrEdzLWoPZbTXYdjo
 rYerC6H+lK3as4r/S/tOwQAh0+WYr1RZPijWhJ8eeDY/8RHMA8Jlzyv+1Ux9IxcAss3fBjOHZsF
 Tyfnnelnlrhd/WQ4XtwG2BlvCN8OJEVrimfkMKt9JvKNZpgyQlVDssyNFHdLA0Q5IfqgLyPVJyR
 a2G5c1d2iEMjyjKYQZZVDvbBGob4mbC6yHIPRuyzWt0MG/i/bqAJfKUHFkPiFvD87vCSurytSc8
 xs7jIbOmcaHiuhQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Mailman-Approved-At: Tue, 03 Mar 2026 08:53:07 +0000
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
X-Rspamd-Queue-Id: BA9EE1EB45C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[172];
	FROM_NEQ_ENVFROM(0.00)[jlayton@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Convert zonefs i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/zonefs/super.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index e83b2ec5e49f81674bfbb5e1fd2c65add32cda1c..cf084c7905d4d43c0638187a55f3c9af71364f3d 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -297,7 +297,7 @@ static void zonefs_handle_io_error(struct inode *inode, struct blk_zone *zone,
 	 */
 	if (isize != data_size)
 		zonefs_warn(sb,
-			    "inode %lu: invalid size %lld (should be %lld)\n",
+			    "inode %" PRIino "u: invalid size %lld (should be %lld)\n",
 			    inode->i_ino, isize, data_size);
 
 	/*
@@ -308,7 +308,7 @@ static void zonefs_handle_io_error(struct inode *inode, struct blk_zone *zone,
 	 */
 	if ((z->z_flags & ZONEFS_ZONE_OFFLINE) ||
 	    (sbi->s_mount_opts & ZONEFS_MNTOPT_ERRORS_ZOL)) {
-		zonefs_warn(sb, "inode %lu: read/write access disabled\n",
+		zonefs_warn(sb, "inode %" PRIino "u: read/write access disabled\n",
 			    inode->i_ino);
 		if (!(z->z_flags & ZONEFS_ZONE_OFFLINE))
 			z->z_flags |= ZONEFS_ZONE_OFFLINE;
@@ -316,7 +316,7 @@ static void zonefs_handle_io_error(struct inode *inode, struct blk_zone *zone,
 		data_size = 0;
 	} else if ((z->z_flags & ZONEFS_ZONE_READONLY) ||
 		   (sbi->s_mount_opts & ZONEFS_MNTOPT_ERRORS_ZRO)) {
-		zonefs_warn(sb, "inode %lu: write access disabled\n",
+		zonefs_warn(sb, "inode %" PRIino "u: write access disabled\n",
 			    inode->i_ino);
 		if (!(z->z_flags & ZONEFS_ZONE_READONLY))
 			z->z_flags |= ZONEFS_ZONE_READONLY;
@@ -402,7 +402,7 @@ void __zonefs_io_error(struct inode *inode, bool write)
 	memalloc_noio_restore(noio_flag);
 
 	if (ret != 1) {
-		zonefs_err(sb, "Get inode %lu zone information failed %d\n",
+		zonefs_err(sb, "Get inode %" PRIino "u zone information failed %d\n",
 			   inode->i_ino, ret);
 		zonefs_warn(sb, "remounting filesystem read-only\n");
 		sb->s_flags |= SB_RDONLY;

-- 
2.53.0

