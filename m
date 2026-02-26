Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBbxBfrFoGnImQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA941B03E9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 23:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2FB10EA05;
	Thu, 26 Feb 2026 22:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="RROaW/RV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Thu, 26 Feb 2026 20:29:25 UTC
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC4C510E046
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 20:29:25 +0000 (UTC)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 61QHqVfg1068162;
 Thu, 26 Feb 2026 12:22:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=s2048-2025-q2; bh=IZiM70zfm7C3RbNIw1
 5Xtxv/zgzm0pVY5jx3r3lSttA=; b=RROaW/RVt+7Y/kjneYboZVoldW4u5KfMMa
 uG8In4NkuwMC7E0si/E0mP6iXbPVAa4nNbdWZaL3gCFV//6zk1YwPpEHZRNWimgS
 gB9KkG93UM5yo66G6srgzjWnr2ON5LhiZ4IpsgmPkXzKmynJRHQu/2dK3JhDKTYT
 tRPO/dwA789Mtg/ph9Dke3UpvyJTUeuOJ+9JtVoS3JswsMzJVsTMG4w6PHmQpDwk
 g2HLPesV0t2TpP2kTmgpBjnfs7VI4pB3nU3ALfriYiyGs8xOJJTUfQH0R6jLd7GM
 q2lJjdDPSNiVSH1xYWyIeK858vD4obhCERAxfqoVPwayNXdDJvOg==
Received: from maileast.thefacebook.com ([163.114.135.16])
 by m0089730.ppops.net (PPS) with ESMTPS id 4cjnjmd8wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Feb 2026 12:22:40 -0800 (PST)
Received: from localhost (2620:10d:c0a8:1c::11) by mail.thefacebook.com
 (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.35; Thu, 26 Feb
 2026 20:22:39 +0000
From: Matt Evans <mattev@meta.com>
To: Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>
CC: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>,
 Pranjal Shrivastava <praan@google.com>, Alistair Popple
 <apopple@nvidia.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <kvm@vger.kernel.org>
Subject: [RFC PATCH 0/7] vfio/pci: Add mmap() for DMABUFs
Date: Thu, 26 Feb 2026 12:21:56 -0800
Message-ID: <20260226202211.929005-1-mattev@meta.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2620:10d:c0a8:1c::11]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NiBTYWx0ZWRfX5h9s9Ky4ODAC
 uK7iwKepqZbDWB9zNVY3+AX6ltHfKbj/relQzSOkL2/MgDwWoZ3ZW2VhkFQy3lSnEcDSFt8vD9m
 GzsjlSYERzJ4axZgC2ZiBZ2uCmq45TGH7ukX6jBvnd/B+OWnP43+oWNi8aHTVcq2eNy+UxA68tT
 jDj1fKEKc7NnuJc4J4jfUlicEhIz3jcwmQgpOM33VzWKmyTsuRwVMDxBYjbJm6FP+eKIe1KRunq
 +br2DO9NDBwVRJgai/nvSdnObrKwXZ/ZM4AEwtuoD1XT8u/XXnnjmVn/HegEWKz9BHUBei1FCsA
 Xj26Z+xPMut0QwS7TtAUvq8hhFzF+vXJEt6fzS5djZ6bxfUt6fWrIuFv6Q7JR+9BWhbOCkwroJp
 fYaetFADM7ZsG653BtMwZf0EhrfIclEHAQ4eMmgi12qgKCdWa3jq/zlAUT87avzqN1h8oN8xMMc
 YUuZj6qMN4zcbgMobzg==
X-Proofpoint-ORIG-GUID: c_IRwxbK9RMEctVN9Z230XiPI5d-bVBW
X-Authority-Analysis: v=2.4 cv=B/m0EetM c=1 sm=1 tr=0 ts=69a0ab90 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=FOH2dFAWAAAA:8
 a=r96HxJact8T_fHbaSv8A:9
X-Proofpoint-GUID: c_IRwxbK9RMEctVN9Z230XiPI5d-bVBW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Mailman-Approved-At: Thu, 26 Feb 2026 22:15:13 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mattev@meta.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[meta.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.983];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ACA941B03E9
X-Rspamd-Action: no action

Hi all,


There were various suggestions in the September 2025 thread "[TECH
TOPIC] vfio, iommufd: Enabling user space drivers to vend more
granular access to client processes" [0], and LPC discussions, around
improving the situation for multi-process userspace driver designs.
This RFC series implements some of these ideas.


Background: Multi-process USDs
==============================

The userspace driver scenario discussed in that thread involves a
primary process driving a PCIe function through VFIO/iommufd, which
manages the function-wide ownership/lifecycle.  The function is
designed to provide multiple distinct programming interfaces (for
example, several independent MMIO register frames in one function),
and the primary process delegates control of these interfaces to
multiple independent client processes (which do the actual work).
This scenario clearly relies on a HW design that provides appropriate
isolation between the programming interfaces.

The two key needs are:

 1.  Mechanisms to safely delegate a subset of the device MMIO
     resources to a client process without over-sharing wider access
     (or influence over whole-device activities, such as reset).

 2.  Mechanisms to allow a client process to do its own iommufd
     management w.r.t. its address space, in a way that's isolated
     from DMA relating to other clients.


mmap() of VFIO DMABUFs
======================

First, this RFC addresses #1, implementing the proposals in [0] to add
mmap() support to the existing VFIO DMABUF exporter.

This enables a userspace driver to define DMABUF ranges corresponding
to sub-ranges of a BAR, and grant a given client (via a shared fd)
the capability to access (only) those sub-ranges.  The VFIO device fds
would be kept private to the primary process.  All the client can do
with that fd is map (or iomap via iommufd) that specific subset of
resources, and the impact of bugs/malice is contained.

 (We'll follow up on #2 separately, as a related-but-distinct problem.
  PASIDs are one way to achieve per-client isolation of DMA; another
  could be sharing of a single IOVA space via 'constrained' iommufds.)


Revocation/reclaim
==================

That's useful as-is, but then the lifetime of access granted to a
client needs to be managed well.  For example, a protocol between the
primary process and the client can indicate when the client is done,
and when it's safe to reuse the resources elsewhere.

Resources could be released cooperatively, but it's much more robust
to enable the driver to make the resources guaranteed-inaccessible
when it chooses, so that it can re-assign them to other uses in
future.

So, second, I've suggested a PoC/example mechanism for reclaiming
ranges shared with clients: a new DMABUF ioctl, DMA_BUF_IOCTL_REVOKE,
is routed to a DMABUF exporter callback.  The VFIO DMABUF exporter's
implementation permanently revokes a DMABUF (notifying importers, and
zapping PTEs for any mappings).  This makes the DMABUF defunct and any
client (or third party the client has shared the buffer onto!) cannot
be used to access the BAR ranges, whether via DMABUF import or mmap().

A primary driver process would do this operation when the client's
tenure ends to reclaim "loaned-out" MMIO interfaces, at which point
the interfaces could be safely re-used.

This ioctl is one of several possible approaches to achieve buffer
revocation, but I wanted to demonstrate something here as it's an
important part of the buffer lifecycle in this driver scenario.  An
alternative implementation could be some VFIO-specific operation to
search for a DMABUF (by address?) and kill it, but if the server keeps
hold of the DMABUF fd that's already a clean way to locate it later.


BAR mapping access attributes
=============================

Third, inspired by Alex [Mastro] and Jason's comments in [0], and
Mahmoud's work in [1] with the goal of controlling CPU access
attributes for VFIO BAR mappings (e.g. WC) I noticed that once we can
mmap() VFIO DMABUFs representing BAR sub-spans, it's straightforward
to decorate them with access attributes for the VMA.

I've proposed reserving a field in struct
vfio_device_feature_dma_buf's flags to specify an attribute for its
ranges.  Although that keeps the (UAPI) struct unchanged, it means all
ranges in a DMABUF share the same attribute.  I feel a single
attribute-to-mmap() relation is logical/reasonable.  An application
can also create multiple DMABUFs to describe any BAR layout and mix of
attributes.


Tests
=====

I've included an [RFC ONLY] userspace test program which I am _not_
proposing to merge, but am sharing for context.  It illustrates &
tests various map/revoke cases, but doesn't use the existing VFIO
selftests and relies on a (tweaked) QEMU EDU function.  I'm working on
integrating the scenarios into the existing VFIO selftests.

This code has been tested in mapping DMABUFs of single/multiple
ranges, aliasing mmap()s, aliasing ranges across DMABUFs, vm_pgoff >
0, revocation, shutdown/cleanup scenarios, and hugepage mappings seem
to work correctly.  I've lightly tested WC mappings also (by observing
resulting PTEs as having the correct attributes...).


(The first two commits are a couple of tiny bugfixes which I can send
separately, should reviewers prefer.)

This series is based on v6.19 but I expect to rebase, at least onto
Leon's recent work [2] ("vfio: Wait for dma-buf invalidation to
complete").

What are people's thoughts?  I'll respin to de-RFC and capture
comments, if we think this approach is appropriate.


Thanks,


Matt


References:

[0]: https://lore.kernel.org/linux-iommu/20250918214425.2677057-1-amastro@fb.com/
[1]: https://lore.kernel.org/all/20250804104012.87915-1-mngyadam@amazon.de/
[2]: https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a


Matt Evans (7):
  vfio/pci: Ensure VFIO barmap is set up before creating a DMABUF
  vfio/pci: Clean up DMABUFs before disabling function
  vfio/pci: Support mmap() of a DMABUF
  dma-buf: uapi: Mechanism to revoke DMABUFs via ioctl()
  vfio/pci: Permanently revoke a DMABUF on request
  vfio/pci: Add mmap() attributes to DMABUF feature
  [RFC ONLY] selftests: vfio: Add standalone vfio_dmabuf_mmap_test

 drivers/dma-buf/dma-buf.c                     |   5 +
 drivers/vfio/pci/vfio_pci_core.c              |   4 +-
 drivers/vfio/pci/vfio_pci_dmabuf.c            | 300 ++++++-
 include/linux/dma-buf.h                       |  22 +
 include/uapi/linux/dma-buf.h                  |   1 +
 include/uapi/linux/vfio.h                     |  12 +-
 tools/testing/selftests/vfio/Makefile         |   1 +
 .../vfio/standalone/vfio_dmabuf_mmap_test.c   | 822 ++++++++++++++++++
 8 files changed, 1153 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/vfio/standalone/vfio_dmabuf_mmap_test.c

-- 
2.47.3

