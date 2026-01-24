Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCpHE8ybdGnH7wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 11:15:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D57D329
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 11:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AD510E24F;
	Sat, 24 Jan 2026 10:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="Q4C7NJ5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF3A10E24F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1769249732; x=1769854532; i=markus.elfring@web.de;
 bh=rsoERRKLk8v/HFgJCO+IP71gVuF5bKGFSkmvd6+xYB0=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Q4C7NJ5R968I8U1MN0QVZz3nhPI0cgllUwv2ux6pPjEuxYOEnHtG4bHHzIxo9zTG
 TDVlL7ACmC89oYzpaGn5vCWVyWZZHW9CIa6qALE/u7g9Isbhr14f6W5TU2aRnyIer
 YANeF+RY53S9Z1t98pk4jJUnxn+8FFkMqj/MfJ9XM47/4YrrbHuKuf98eIXTdAdGX
 RfK/bfPuWxuehLRR1Lhp6jUswmlwFNBSmC63hVlibdb45MvyiSpe2NTnF6rlnl7RD
 miyetZ1U6ubWs/pxowyKDlnHYTtKfmtUg2IDhEiNrwMyJkB5RIL/F6ACnM7oNT1jD
 boaHbMDSkQWOy8QAww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.184]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M28WT-1vm3WH114L-002UvM; Sat, 24
 Jan 2026 11:15:32 +0100
Message-ID: <7c9ebd40-07cc-4a52-a6e8-5c590fc6714e@web.de>
Date: Sat, 24 Jan 2026 11:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
References: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rDUKSLjdKvXS80KswokFGF6f0IpYQClanYs9CehPNrF9i3pUFKD
 P1u+dHyIOtB+faI4YxACJ7LHN0jCNnqAD3Aq78roIOl7maptFb3p2kSTnQtN4VU4ZCywaiy
 8evCaPNT057AQVnzsuYenWKnEwpvcitPFFxgWW6H6Yif6MO8QgjzL4HronOImimA9XTWC0b
 jbozeFU6nB7claAGb3wBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dhynBp3cveg=;qkvvXRHNOvJQtkm8g9fD6igkxEM
 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
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abhinav.kumar@linux.dev,m:akhilpo@oss.qualcomm.com,m:airlied@gmail.com,m:lumag@kernel.org,m:jesszhan0024@gmail.com,m:konradybcio@kernel.org,m:marijn.suijten@somainline.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:simona@ffwll.ch,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[web.de:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.dev,oss.qualcomm.com,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A06D57D329
X-Rspamd-Action: no action

=E2=80=A6
> While there was a manual of_node_put() at the end of the
> common path, several early error returns would bypass this call,
=E2=80=A6

* How do you think about to benefit any more from a known text formatting =
parameter?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.19-rc6#n659

* Were any source code analysis tools involved here?

Regards,
Markus
