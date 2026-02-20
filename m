Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCzJDfMemGnhAgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20AD165D7F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 09:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9365210E7CE;
	Fri, 20 Feb 2026 08:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BwNaf1eQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BB410E772
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 02:55:31 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-59e6b736b84so1555117e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 18:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771556130; x=1772160930; darn=lists.freedesktop.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O1wlu+Egy8kX5COPwj3XJx/HFDM+oi/MNIFa11uC12I=;
 b=BwNaf1eQJKsaXJ3JWd/smP4Cviiqmyjtzx1njvw92q6qDpPz8lulQcF+x7MwmYYmom
 lHQeQsxXHyYLDHJahmF6xMITdYyM1xpVveqbAaqV77MMkCpMmNNqaiuWkEPv9yssYK+M
 XS6oawbNBbPRmjWsmj0XLX+cwCILiklIQrwcUD+4Mb1R00jWK9zYImFIUJcj3WeS3Y4c
 58ypcQ5HhnYC5VprNVXPXa2WA3tMcR87YY9AHQ7I83OJMFvR1QF3KBOIR1zhAwN1fo2F
 HyA4Zg6em0+ehHXR3ai9Zh7nXkBiKtGx+SZGRFUdEQignaiqQrxsAkKbL//ldgmRFOAj
 /hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771556130; x=1772160930;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O1wlu+Egy8kX5COPwj3XJx/HFDM+oi/MNIFa11uC12I=;
 b=ufG1i+LrIipTYQQSIHHKnWmS49DUxocKDZfWv4X00EVe1zHNjz3nGDKlMZOS3aDIjr
 PbyvyReBZe8dqRWfuYLD/ZDRjABjNaKQtlnkgI3rcgd92UcRMX7Tj0fIvBtJ9ynFz7LO
 QT+qRdc2vF3F00nQBQiks/mCfzXt2tx6ZIYsSI9f4pjd8ioP0qSya6JhQSLIag8VEOcx
 m/SNP6Ohhpt1YskcMp3B3ojJ61WW7XceC0UxGJF20/0ZyTI+u5dZ0NvO6nS0Lb4T6lCQ
 WtTuqp8Xc6JevBj+u30NTnkg2AsAtB6DUaHn6V7KefZXMbO38tZW1oKtdSN5NtNaWSAu
 rscQ==
X-Gm-Message-State: AOJu0Yx/VpjhJ/iLEdoi8U+uUhUDYnXK9+PApAn45H5Nm3lil2UyTii4
 ZcygAY5s0/XW4KpoTWedG+yLn6x/OacqlnxQbaYvABvvY08xpzrrnEk=
X-Gm-Gg: AZuq6aIdE3zbIQ0Fy+P6S2JcSsl5MG2lpmYF3L0M/xAYlYOKJqsdm0N+Knx1ZlBUZFN
 s21NE/MGp2IPfL9JvyvXQ7KS28DYKfMPjLtZaRRRPrwbqnBomxi3nnvD8LdwFQg8VELxRU60hm6
 xxdPA9E5wFP/d/mc4dEFrIlOqA6kbGez+6maTZLAvhr/0/f+1ZyD+lg4ckuG2/1PJEb8Y3FHKv2
 kW+d1fyBgbJ9b3o1X9e4htPWfjGEHNhpZxwb/SUArz84rQ68ic1e2sG3nmJ404GnyFGA6EoMdz3
 acUl7Ou/Ks73o91+1RI+k9f/sIs4Wvaj+EUUM2U9HILBkP7Ifs98AHNbxQvGIYhF756zJ3oLcWc
 HYzaiV5DpB+VhHfSnI6x2oSMIVS5i8QfFo3RQWSNvuqPArDPOKgpPkjxEMcZbgs2PlYHBN6b9QU
 6xI0a9zXM=
X-Received: by 2002:a05:6512:3b9c:b0:59e:ccca:87f2 with SMTP id
 2adb3069b0e04-59f6d37ec2amr6050451e87.39.1771556130186; 
 Thu, 19 Feb 2026 18:55:30 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59e5f5b21f7sm5679427e87.78.2026.02.19.18.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 18:55:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 05:55:29 +0300
Message-Id: <DGJG8IIRDS5E.297UI3P1W2PWC@gmail.com>
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Ivan Sergeev" <ivan8215145640@gmail.com>, "Mario Limonciello"
 <superm1@kernel.org>, <amd-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ivan8215145640@gmail.com,m:superm1@kernel.org,m:amd-gfx@lists.freedesktop.org,m:regressions@lists.linux.dev,m:mwen@igalia.com,m:mario.limonciello@amd.com,m:alex.hung@amd.com,m:daniel.wheeler@amd.com,m:rodrigo.siqueira@amd.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:christian.koenig@amd.com,m:huangalex409@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,igalia.com,amd.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ivan8215145640@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B20AD165D7F
X-Rspamd-Action: no action

Checked commit 7f2b5237e313, it still has the issue
