Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MDUJZiGrWkE4AEAu9opvQ:T2
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735CB230AA0
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 15:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC29E10E439;
	Sun,  8 Mar 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="SjvZB0lf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5A410E3FB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 20:55:05 +0000 (UTC)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626K5TL12745338
 for <dri-devel@lists.freedesktop.org>; Fri, 6 Mar 2026 12:55:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=vykdHEryC/vnlsJN6kswrApntHcjxaWoLxbNgiPI9Jc=; b=SjvZB0lfs+bT
 /H4oSo/hYHehvRpcqfIh5qvn4C5Sy32D1Xdz2jPX044BJGjlqqHJz02TNJAk7fh8
 /PZOZdFqEZaXIwizpWEYPlfNG68ZCeGMeEX22pgHuiDGnGQHEWbCf3zMm+KCeDDV
 YygV2FiVeEMoFfrHrgas3oUZN0qHsIblNmYgyLjIT2vl6Io6MU3vfEdNUJAEoci1
 nLAhcoq3EK10c2IK6ZQ+evp0gzRdP8reZgSvUQqXqWu4cQM+OtiDBTXrwJ+CEm+/
 sYYdScOCVs+rfxAjcOr6UJeXS8i3b3HfTxnLxnZoqVaeEisPYpQemE6j3tIWEMcF
 MZWTa5p46w==
Received: from mail.thefacebook.com ([163.114.134.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4cqp7h1qcy-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2026 12:55:04 -0800 (PST)
Received: from twshared108366.16.frc2.facebook.com (2620:10d:c085:108::150d)
 by mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 6 Mar 2026 20:54:54 +0000
Received: by devbig259.ftw1.facebook.com (Postfix, from userid 664516)
 id 9D02712CD8433; Fri,  6 Mar 2026 12:49:00 -0800 (PST)
From: Zhiping Zhang <zhipingz@meta.com>
To: Keith Busch <kbusch@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Leon
 Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, <linux-rdma@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <netdev@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Yochai Cohen <yochai@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhiping Zhang <zhipingz@meta.com>
CC: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [RFC 2/2] RMDA MLX5: get tph for p2p access when registering
 dmabuf mr
Date: Fri, 6 Mar 2026 12:48:49 -0800
Message-ID: <20260306204900.3800370-1-zhipingz@meta.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301175551.GT44359@ziepe.ca>
References: <20260301175551.GT44359@ziepe.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Q5zfIo2a c=1 sm=1 tr=0 ts=69ab3f28 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=RWlL41xuHJUQnbMF2CoA:9
X-Proofpoint-GUID: hvR3wOCnzZtSbkBQQrUhAiWJs4pP9hr4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE5NyBTYWx0ZWRfX0VN9viEqcBVR
 McKzgGK7AMM6Ve0DQZDNJV9fv50nyxSJyHH4rPJVYRahbAV/ThWIk6Uhc4WDus8wT8+6MKUHxrf
 bVJlR5tDQrbtYUm5osddU7dHuaqlqHfG11xOC5vUSjtLB6zBqn85bvfDa6BoLvhE6XeyzD362th
 RWigVjeW03hLSfXeOho/6rTYIkq/HsRF6IjXwD1JqSe33y0ai5YltJuEsfcVn911lghPsvuSmIL
 il3CgHNlYBsPlgvPNJjEiNQh5rhFetj6zUI/8Gzr8P02B+nYk/i6Hif6SHYYbU7VbbzJbfjU7Hy
 a6krPu44fOobNDRJwDp4fUzZfqe3xy0/YDkUZiY/gX517HjImnxjupHUlwO9V1GaRtT0JHM5ojo
 qXHqz0G7Ps99z8nYhpK4s/NNlaZ+Ks4ow8eab6y6qBpaNg9y/ooLb2xr9DplySi230HMvqv2Id5
 ++P5jv5lOFuwwwoF0Jw==
X-Proofpoint-ORIG-GUID: hvR3wOCnzZtSbkBQQrUhAiWJs4pP9hr4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Mailman-Approved-At: Sun, 08 Mar 2026 14:13:21 +0000
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
X-Rspamd-Queue-Id: 735CB230AA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[41];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kbusch@kernel.org,m:jgg@ziepe.ca,m:leon@kernel.org,m:bhelgaas@google.com,m:linux-rdma@vger.kernel.org,m:linux-pci@vger.kernel.org,m:netdev@vger.kernel.org,m:yochai@nvidia.com,m:yishaih@nvidia.com,m:zhipingz@meta.com,m:helgaas@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[zhipingz@meta.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[zhipingz@meta.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[meta.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,meta.com:dkim,meta.com:mid]
X-Rspamd-Action: no action

On Sun, 1 Mar 2026 13:55:51 -0400, Jason Gunthorpe wrote:

> On Thu, Feb 26, 2026 at 06:21:28PM -0700, Keith Busch wrote:
> > On Tue, Feb 10, 2026 at 11:39:55AM -0800, Zhiping Zhang wrote:
> > > +static void get_tph_mr_dmabuf(struct mlx5_ib_dev *dev, int fd, u16=
 *st_index,
> > > +							  u8 *ph)
> > > +{
> > > +	int ret;
> > > +	struct dma_buf *dmabuf;
> > > +
> > > +	dmabuf =3D dma_buf_get(fd);
> > > +	if (IS_ERR(dmabuf))
> > > +		return;
> > > +
> > > +	if (!dif there's any implication mabuf->ops->get_tph)
> > > +		goto end_dbuf_put;
> > > +
> > > +	ret =3D dmabuf->ops->get_tph(dmabuf, st_index, ph);
> >=20
> > You defined the "get_tph" function to take a pointer to a raw steerin=
g
> > tag value, but you're passing in the steering index to it's table.
>
> Yeah that's weird, there should be one TPH for a DMABUF, not many.
>

Good catch, I'll fix it.

> > But in general, since you're letting the user put whatever they want =
in
> > the vfio private area, should there be some validation that it's in t=
he
> > valid range? I'm also not quite sure how user space comes to know wha=
t
> > steering tag to use, or what harm might happen if the wrong one is us=
ed.
>
> If the device is VFIO compatible then it needs to ensure that whatever
> it does with its steering tags fit the security model of VFIO. You
> can't harm the device - you can't reach outside the VFIO sandbox (eg
> into another VF or something) and so on.
>
> Under these conditions the kernel doesn't care what TPH is used, just
> let userspace specify the raw bits on the wire.
>
> Jason

thanks for clarification, that matches my understanding of how VFIO and=20
userspace drivers work.

Zhiping
