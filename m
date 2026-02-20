Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W+HrDAAfmGn0AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C975A165DAA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70A10E7E6;
	Fri, 20 Feb 2026 08:44:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OiC7UKsS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF9010E776
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 03:02:04 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-385c2f88618so14258651fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 19:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771556523; x=1772161323; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqp1jrv3QaroxdeHoV4ufkhY65ckcSlQNQnG63MUVbI=;
 b=OiC7UKsSkapzl4ETdNF16mGOA+vS/uSOuqdfGV+thQ4bRH9Fqdd+IS+OoKiUa/UBlr
 20ZKMwADnqNyCWXkeYrh/M0rIiYlqap1AawAMyoEu4B0eoOS7njRGSne75E5iwBfiHLN
 9JmfKRaDHmdyXRER/d3sKPUccFoSxkL5TGWrPO0qUQiRc8hlkoxPoiCCm9iA1YDWrgcC
 y8Q4vKKxs6SdkEhNGEOc14r6x4w7ImI00ffPjDri6xClYW0YtzK3b7w+L6FwdrZEhiqM
 JmTtrcSw5gVO1ARcdJEBIJ37mqcYlr4wxNjb1Woli6jSw6umHmXDfLFQxNJWWZWJDf5D
 SR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771556523; x=1772161323;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hqp1jrv3QaroxdeHoV4ufkhY65ckcSlQNQnG63MUVbI=;
 b=DcWE13+Di4E76y2QL1ahvbhAmH03mTXz2CR67XjuTtjQGfT77K328p/Nj4HtUNKvbb
 MSjcFoUboX7ZlvKZ7NqwSlm9CdO+t1FQ6OOwhvzjRpVMhYtGjaCsck1iNGEbtD2h6KgG
 ejNxnMWwGDAmj/ul1PkMVp/TLBFLRQgb6sH8anHpGFGHWAPZolpgfIyhLMHLnV/ax/7R
 vhohbyiNKx6ZQlLtUomjfY3BWz98AxdnRyeebVRt136q6JJ0n8X3/dEPg75m2qnsKdzt
 gdzGN6ZHDtUegIP10oBUxBmCNlczTJwCFwrGWozFJAVd3YanCYLI24WTgxEIf6J3/VAb
 by2Q==
X-Gm-Message-State: AOJu0Yx1QyGOFTsHM9c9wTqppkV7Jnn+voJBPeERXNZiHQMnBiA9sRxP
 ANsrG9P40G3r3flm06DU/nHr686gQkAAreLBWu8Gbcr6UIKE+6UvBLw=
X-Gm-Gg: AZuq6aIYmROoq4etavSOjX/jhiIASKo0zEBsJUXAFAh8IYwbzzYyzfGiNLm6RIMF0LF
 mmihlK7CNzEPYd12fvHrYhiahp43qsGFjYiB6xFdG173OcSPt/JkPOAAevJn5zXM6J33wtzUmyM
 B+PLXpJp+jufGdoZ2h5o/fPmEaME5X+AnExps8xTAhHdW8VLdbxDlftLBr1OAhwn1ZPLbqtL/+X
 yae8lPezhwnEJo/uiy5iF2+dNdstaN++Ku5DJttmvKuS9T2jbsYVEFSVxNu5elaTz1WWpAB7rVh
 LX+IaLgj+Y3P9obkzj+/HQqTWudqrdUXRsjpT6qE8bRxt8V7JvK0IfLFvQyT84pEfsTM5wgVoIt
 j1FJGWBtu6ROaxERzXVrWngPPjmIrbeRdu3do/aCAkzqJgWx0szV0xWxuBYfm7qS1XMpRRcTBwB
 yRrVmPGKY=
X-Received: by 2002:a05:651c:1504:b0:386:e936:71dd with SMTP id
 38308e7fff4ca-38846e37a02mr23095861fa.41.1771556522541; 
 Thu, 19 Feb 2026 19:02:02 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-387069259c1sm52664811fa.41.2026.02.19.19.02.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 19:02:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 06:02:01 +0300
Message-Id: <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Ivan Sergeev" <ivan8215145640@gmail.com>, "Mario Limonciello"
 <superm1@kernel.org>, <amd-gfx@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com>
In-Reply-To: <DGJFVPAQJA15.378GMU7XZXLU@gmail.com>
X-Mailman-Approved-At: Fri, 20 Feb 2026 08:44:31 +0000
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,igalia.com,amd.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C975A165DAA
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 5:38 AM MSK, Ivan Sergeev wrote:
>
> I've done the bisect using the v6.12.68 tag as good and v6.18.8 tag as ba=
d

Sorry, those are not the tags I've used for the bisect. Before doing a
bisect in git I first checked versions from 6.18 to 6.13, and could
reproduce the issue in all of them, so after that I went for the git
bisect between 6.12.68 and 6.13.6.
