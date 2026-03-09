Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIdtN64Hr2kUMAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:47:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C25D23DD8D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 18:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE7510E578;
	Mon,  9 Mar 2026 17:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="O46FAzGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127A710E578;
 Mon,  9 Mar 2026 17:47:21 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629F7to91275175; Mon, 9 Mar 2026 17:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=k/HLlQ
 fqfXVQs+Pamcq/LePEaOpgjPTSxe75E2LQHmw=; b=O46FAzGvsE2YmZ6439UqTH
 f//oqGS2NuJoB8xY2lcg12hMD2aNtQ4ID9XxubauhUUNB5XWruUCNbrIED9U/sy2
 gQV+VyjgSVjVmAG4Kam45dqeg/cEF7wexHdqP7q6amhZ86wA+YW4+a7JvMwqNGHX
 K+CR1szr/+ThnSfgYQtyXM8JHrNaKlVVJxj2UpO9B9nfw7GY0lpUaQgYj3FXUBhW
 hCYFfYxjosdklAtClo/CAOyDK0Kz8Ak4d419uQhCeU81c/npAiEGpAq1IaGDP95R
 6czGdohxtpKDTNPNp0U2JdVL6ApX0w6YBruEMYsSerjEZYuw8x9syT1jr4FLueng
 ==
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4crcvr7huu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 17:47:15 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 629FqYI5015725;
 Mon, 9 Mar 2026 17:47:14 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cs121wp59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2026 17:47:14 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 629HlDVJ60162522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2026 17:47:13 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E5775805A;
 Mon,  9 Mar 2026 17:47:13 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4442758054;
 Mon,  9 Mar 2026 17:47:09 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown
 [9.61.72.80]) by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2026 17:47:09 +0000 (GMT)
Message-ID: <05b5d55c49b5a1bbc43a5315e3c84872e7e634b3.camel@linux.ibm.com>
Subject: Re: [PATCH v3 00/12] vfs: change inode->i_ino from unsigned long
 to u64
From: Mimi Zohar <zohar@linux.ibm.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 fsverity@lists.linux.dev, linux-mm@kvack.org, netfs@lists.linux.dev,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-nilfs@vger.kernel.org,
 v9fs@lists.linux.dev, linux-afs@lists.infradead.org,
 autofs@vger.kernel.org, ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
 linux-integrity@vger.kernel.org, selinux@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 netdev@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-hams@vger.kernel.org, linux-x25@vger.kernel.org,
 audit@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-can@vger.kernel.org, linux-sctp@vger.kernel.org, bpf@vger.kernel.org
In-Reply-To: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
References: <20260304-iino-u64-v3-0-2257ad83d372@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Mar 2026 13:47:08 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE1OCBTYWx0ZWRfX4MWriKER56jj
 FHMwPduc6Ya80ytljBjcJCflJZJQpLHypO90MyIljV3F+YGnUEWqD2zkjjI4tBlT1Isyk88nQqD
 Bxsi6y6lZ0wNsui73O82C4s92lOeLYZxoPRW/EZDUOjQSMymQTWQJKaIWTXxL4ETx9VAdofRsxH
 1pntH+n6NhQwxXW3M12fPcKiL5ADcuXldDKiDw4m+7ix+qwvBlo3nspOLghaJ2LE6mxrOiKA5Lh
 GMTERNprgwZauxVcqC/p8dLI9p6C/LOkJmscaf6mdPih3AOPO2LV5vS62FSOrim10LguG5ezUsF
 rdAkmDzMNpwcB3l0gkLlsufFyGUR7bS4yrPNzNHAbiSDJiUdpsUzX7AZ0qjMDEeQhvmbO0coQJz
 4Dc1QnM6RvCUkwZGaB0uRcWv6crLl/+68sTOTDKRYLJY7AFXUTAN+lczmFotg9pSQAz65D+NPWn
 mWAaXfwB8yIBs0IZagQ==
X-Proofpoint-GUID: k-5kS7gQwSwb7EbHSrKEnUBgm0EngagK
X-Proofpoint-ORIG-GUID: k-5kS7gQwSwb7EbHSrKEnUBgm0EngagK
X-Authority-Analysis: v=2.4 cv=QoFTHFyd c=1 sm=1 tr=0 ts=69af07a3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=x61hcHDQ_TxU8J0rBBAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090158
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
X-Rspamd-Queue-Id: 3C25D23DD8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[ibm.com:+];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,linux.ibm.com:mid];
	RCPT_COUNT_TWELVE(0.00)[45];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zohar@linux.ibm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

[ I/O socket time out.  Trimming the To list.]

On Wed, 2026-03-04 at 10:32 -0500, Jeff Layton wrote:
> This version squashes all of the format-string changes and the i_ino
> type change into the same patch. This results in a giant 600+ line patch
> at the end of the series, but it does remain bisectable.  Because the
> patchset was reorganized (again) some of the R-b's and A-b's have been
> dropped.
>=20
> The entire pile is in the "iino-u64" branch of my tree, if anyone is
> interested in testing this.
>=20
>     https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/
>=20
> Original cover letter follows:
>=20
> ----------------------8<-----------------------
>=20
> Christian said [1] to "just do it" when I proposed this, so here we are!
>=20
> For historical reasons, the inode->i_ino field is an unsigned long,
> which means that it's 32 bits on 32 bit architectures. This has caused a
> number of filesystems to implement hacks to hash a 64-bit identifier
> into a 32-bit field, and deprives us of a universal identifier field for
> an inode.
>=20
> This patchset changes the inode->i_ino field from an unsigned long to a
> u64. This shouldn't make any material difference on 64-bit hosts, but
> 32-bit hosts will see struct inode grow by at least 4 bytes. This could
> have effects on slabcache sizes and field alignment.
>=20
> The bulk of the changes are to format strings and tracepoints, since the
> kernel itself doesn't care that much about the i_ino field. The first
> patch changes some vfs function arguments, so check that one out
> carefully.
>=20
> With this change, we may be able to shrink some inode structures. For
> instance, struct nfs_inode has a fileid field that holds the 64-bit
> inode number. With this set of changes, that field could be eliminated.
> I'd rather leave that sort of cleanups for later just to keep this
> simple.
>=20
> Much of this set was generated by LLM, but I attributed it to myself
> since I consider this to be in the "menial tasks" category of LLM usage.
>=20
> [1]: https://lore.kernel.org/linux-fsdevel/20260219-portrait-winkt-959070=
cee42f@brauner/
>=20
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Jeff, missing from this patch set is EVM.  In hmac_add_misc() EVM copies th=
e
i_ino and calculates either an HMAC or file meta-data hash, which is then
signed.=20

Mimi
