Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGDhDcU4jGlZjgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9521220A1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 09:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADB610E201;
	Wed, 11 Feb 2026 08:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="DO9mt+Uy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16A689861
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 19:53:38 +0000 (UTC)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61AH2Jvj3309800
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 11:47:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=s2048-2025-q2; bh=EfVHrbdF8/yG09IBQ2
 0HHyfnxAzay8Gf5YSnWq6tV7k=; b=DO9mt+Uy0AavnJKPFVpdQFeFx7wmTdy+q4
 9Zd4SKKQmT5Vxv/2WmpU1HS840cw6ba7ngN9cPfRzgPKdITOFHsdorYD8x6x+E4m
 1JXQPhMDSMeQz1TiJo6rLGQBRGPcwf2G6EZvZ/rF8Mb470XJw1z4qXOf3WytmD8o
 2v6WbvmjIRztxj9f2688BRhkKu6wbvK91YJAxi/+SvtOl9qZ9RloccAoR5iNuFfz
 OqmYtB9XrvDMETixsQRtZAvOAw0mIGENvnNHToGezVLrFU6uZx/fZg4Xiu1uXGYY
 9vhVznJJFygEAulULtYOW5eOVYweFnOQor9hPvNVDgKyDc3wOxIQ==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4c88qnjd9p-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 11:47:35 -0800 (PST)
Received: from twshared41309.15.frc2.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Tue, 10 Feb 2026 19:47:34 +0000
Received: by devbig259.ftw1.facebook.com (Postfix, from userid 664516)
 id DCAA7102666AF; Tue, 10 Feb 2026 11:40:15 -0800 (PST)
From: Zhiping Zhang <zhipingz@meta.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, <linux-rdma@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <netdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Keith Busch <kbusch@kernel.org>, Yochai
 Cohen <yochai@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
CC: Bjorn Helgaas <helgaas@kernel.org>, Zhiping Zhang <zhipingz@meta.com>
Subject: [RFC 0/2] Retrieve tph from dmabuf for PCIe P2P memory access
Date: Tue, 10 Feb 2026 11:39:53 -0800
Message-ID: <20260210194014.2147481-1-zhipingz@meta.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE2MyBTYWx0ZWRfX7r/e0bJtj0Wm
 UGhR2zffdLjda+tp4jRVO+97fMY++LRHwMgORjN1n1q+AxqIDbRA1I781oR3gyzrdBugwrWtCjs
 Grs8Q90OdoXDXXYk82ENGwIc9JvtL3FE3kmOVHPmLHrkg4yy8E2fi8G2C+eLjm8oCcScAVC4sAd
 QcFTDJIJjwEEWTOu8D+i8m64N0fadDK3l3yfz6wYprgfV89+gHo35/kiXZ2PdGrEVbO//jQhDUx
 BRCo0jZyaAXyx7j7OJwcp1RCMkIwvc4ZGz7CrTDrvythhsjH/rL8HaYpoH9YYCcYWuGmbxkTpPU
 GuNVi+4oskqIOSNmld/iHK4GZT4euyxmtE1dLQnWA5rM/XEn1OVrAqN/Gd2UeP/DzFZrMX8zNbV
 SpLtJqlaRgUKHh+1BfX9vQW0WJ9ta+Ou31lh+Ld9KFXv5nqzI48L7aceLWAhGRb+s7iyJlAVHgV
 aans6MSu0spLsS1ZWuQ==
X-Authority-Analysis: v=2.4 cv=POkCOPqC c=1 sm=1 tr=0 ts=698b8b57 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VabnemYjAAAA:8 a=yWaUcmrBNUFKcz5DFYsA:9
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-ORIG-GUID: 7vGqTbZ4f-dncDydPfsFII_-Udn91n10
X-Proofpoint-GUID: 7vGqTbZ4f-dncDydPfsFII_-Udn91n10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Mailman-Approved-At: Wed, 11 Feb 2026 08:07:28 +0000
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
	FORGED_SENDER(0.00)[zhipingz@meta.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:leon@kernel.org,m:bhelgaas@google.com,m:linux-rdma@vger.kernel.org,m:linux-pci@vger.kernel.org,m:netdev@vger.kernel.org,m:kbusch@kernel.org,m:yochai@nvidia.com,m:yishaih@nvidia.com,m:helgaas@kernel.org,m:zhipingz@meta.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[zhipingz@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,meta.com:mid,meta.com:dkim,meta.com:email]
X-Rspamd-Queue-Id: 8E9521220A1
X-Rspamd-Action: no action

Currently, the steering tag can be used for a CPU on the motherboard; the
ACPI check is in place to query and obtain the supported tph settings. He=
re
we intend to use the tph info to improve RDMA NIC memory access on a vfio=
-based
accelerator device via PCIe peer-to-peer. When an applicantion register a
RDMA memory region with DMABUF for the RDMA NIC to access the device memo=
ry,
the tph associated with the memory region can be retrieved and used to se=
t the
steering tag / process hint (ph). The tph contains additional instruction=
s
or hints to the GPU or accelerator device for advanced memory operations,
such as, read cache selection.

Note this RFC is for the discussion on the direction and is not intended =
to be
a complete implementation. Once the direction is agreed on, we will work =
on the
implementation or a real patch set.

Signed-off-by: Zhiping Zhang <zhipingz@meta.com>

[RFC 1/2] Vfio: add callback to get tph info for dmabuf
[RFC 2/2] RMDA MLX5: get tph for p2p access when registering dmabuf
