Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ETGNPkFi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:18:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664681198C9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD66510E08B;
	Tue, 10 Feb 2026 10:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="r4sx4XCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDCB10E08B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:18:29 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61A7vgTd977406; Tue, 10 Feb 2026 10:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=l
 cRFQ0bPtWKlwRg49B13/0SO5PH1ZxcwK2mhMeXH9vk=; b=r4sx4XCjTCJ3k4Ed0
 Gk++3zi2JznPQlPLpaL+Eql4CM9kpsBAPPWnHjfCic2IC1eALyWdI6+3tyfweNS/
 TZJHQ1u+0SswUI//K41/rbkrQGm9opzxQt2JCOGBNu97XW+F8g+8YIobCv1360Xx
 xt7oOz0pc+TQC8+NFCQcrS2jQKBzAaB4QCGTQcDS+b219iL8cyRag9ApWVc08qCP
 t1gM3aTqRIa0MNmAwPBdTbLNDxqRGIR5gporxwWkhCKKfUh0xf+JXx4hpU+XPwjI
 75h94d3jJuEwRikZjH5EuX9jXcQKDj5oY3cMdGVPVearLiv0PQVRfSGXQ72JTaHB
 0+ZzQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c5vht1xa2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Feb 2026 10:18:15 +0000 (GMT)
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (172.25.6.240) by HHMAIL01.hh.imgtec.org (10.100.10.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 10:18:13 +0000
From: Matt Coster <matt.coster@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Coster
 <matt.coster@imgtec.com>
CC: Frank Binns <frank.binns@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
References: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
Subject: Re: [PATCH 0/2] drm/imagination: Improve handling of FWCCB command
 types
Message-ID: <177071869341.41085.10430023732136398808.b4-ty@imgtec.com>
Date: Tue, 10 Feb 2026 10:18:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Originating-IP: [172.25.6.240]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4NiBTYWx0ZWRfXws61a+NqJ4c/
 Ru+pr+xDE4YlXdKtJodsleZacQz/RJdPh8xWJjq2kfJ666TqMWTprOAnosrf9oTobG06aRjIDz3
 E10dHHSV0LpiKeSpv/UTMTrkBe513+1caXxQ+8CCNJEsPaso53WP5FMzju2e9irRmdww+1rHXoI
 dR8aZNgF+yEyfzOFCymtwTcq/T/NLSm0b2Ac/3y/Q7krbhwgWurxDUMrOQoyasJDovM/f4yV9q/
 brytxPtAR4S23wq1BOUT//dmoRmtCQEfzz8JAZAWaIaW6wK2NI5I+6ynVqhX5FKr88/Vgd4oDJq
 46tMZxwebx5uH2mkBYbFhhLZB/dcSUTE9xe0hrw3eDeISVBziIwGZQ6V4AU80qfN6cjkPNeBO3c
 MHyisa9e3xJEmnLWWoYtUsWZz8wmreRO3P9v2Si+taxCloT19Tb/cGCsAciqOMcQfxjs7N5Hhza
 VyxD3IuAh6e/vDISsPA==
X-Authority-Analysis: v=2.4 cv=IuYTsb/g c=1 sm=1 tr=0 ts=698b05e7 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=N16aOacbDtMA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=r_1tXGB3AAAA:8 a=XHqQ-Ykpb6qSMuCLZCgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: dmcuwvsuiKgnVS9101rO6LlSn5yWDvq-
X-Proofpoint-GUID: dmcuwvsuiKgnVS9101rO6LlSn5yWDvq-
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
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matt.coster@imgtec.com,m:frank.binns@imgtec.com,m:brajesh.gupta@imgtec.com,m:alessio.belle@imgtec.com,m:alexandru.dadu@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,imgtec.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matt.coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[imgtec.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:mid,imgtec.com:dkim,imgtec.com:email]
X-Rspamd-Queue-Id: 664681198C9
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 16:02:11 +0000, Matt Coster wrote:
> Just some simple QoL improvements within process_fwccb_command(). This
> should hopefully both reduce the dmesg spam from within this function,
> and make what messages remain easier to interpret.
> 
> 

Applied, thanks!

[1/2] drm/imagination: Improve handling of unknown FWCCB commands
      commit: c7384288d9266e52cd35aadb1749872caf3c0257
[2/2] drm/imagination: Mark FWCCB_CMD_UPDATE_STATS as known
      commit: 4af267ce3441e10198daa52a8cc4b5cb4575d06f

Best regards,
-- 
Matt Coster <matt.coster@imgtec.com>

