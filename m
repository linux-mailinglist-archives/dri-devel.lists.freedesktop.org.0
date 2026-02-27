Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFJFLvLboWlcwgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:01:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFA1BBBA3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E64910EBDC;
	Fri, 27 Feb 2026 18:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bvsf4Bsc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF21710EBDC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:01:16 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43984d7e49bso2089916f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772215275; x=1772820075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=;
 b=bvsf4BsciyALV7ctnRJ1PCbI6/8kjXF1+dfGMsolZbdOQAkqEywjICuUtTzTA3haBM
 vtWVD53OuA6W1P02QF1Gx/4YkFabB6xn/FXemxoIbj59/WYoWDWaIOepRRkSa5WUK0jb
 KSFF9cOVHrwiqukUq+JjpXvrDYYNmepmyO1oTUkXc7NO3m7cjeYsaLCGt5h+JPZiNt3+
 v6Pnbrh0W4WmbIzt+Xkcq50sWb50yiP4QVoPsmLmECpBHJxGsVFSVy4dAmB25CkG51my
 TJT73v1GAimP2LFSruvipcEJxbcpF1OfGsuCNlKASMNTVjGpsr+CgJ78PRz7ryAEz0PQ
 1yCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772215275; x=1772820075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=;
 b=CuIvHY8SaSzFHT6zvEk/Kb8XIQPP7dM8vH2npfENIg2jFZrM/lCHsHJpv4EpmJgZuT
 ZoJ6EH4UYL4FGtIa4LAs9fEdm+/ogknFqWADrMLdnlrFjp3CE8Phi5Pc4zkXRQTFP1x4
 uiV3kL5ln8Q+MrvRbA2U8cDP1vMx4pLUYV8rURZIHXZxWnx3drxn1Nf/6J836BX9E1rU
 QKiCHgE4HWr4QK0KBWDzhn9/MxXZO4FiApO0S+2EgX4cmmUsuDDLBtL+o0gPf5Rrlzk8
 5Vv2pBnAC2BAHS3B1K6PoGtrg8wiZNTJRHWr822fzmBTpXYOTE7I9lJxlPMp/6D3mNiK
 JVGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoQMQORVLLMig6ONS/7bCH3pfezq9qZl4w8Ca89rjgCKyBpzPZsbeQu3uUeJS5rCxvmVvjQovMwoY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVGc3xjVaPrJ/LUbXS3lvGBAmsovppM+8t2f9aS27E64tB9XYB
 C1VAYuLpkxR3/cGoDl7DDeQvVz+FN1b+odO5P67lPaJMvd42uYyBcShC
X-Gm-Gg: ATEYQzxgqwXuRCtf8YAp10DWi4V6oJWH38Kcwjf+P+U4D/Nhg//OtTVtO3tDL8l5e+4
 hOZH5vBUCNT8Z9CFRJUJkA87w9jqE2ebrCNha54XEBlAu7jYvTT3gepd3nhWCEsE32/+8m2k2eh
 oDtCiARxv3m3lDdSptcPfsXXIg2yduZONWa4lZJVdN3OB68OVqURVMK2BU/TBhCXbjLlK1Hx+Cu
 lZJJAk+phcfgOay4vMu5aMtKa8pzyqnoCUY51S/WyLBOVzStEKGzqeHBYzGQUqu9xJn/Ey5N+Aq
 uEoXdTzfljiOfZYj7hIsau2NFV1zIxCT0bEYmy1FlCpVUsBgelATMIbrMw2c4q4kruqUvHHf5cN
 8Q6Lcuk/H0Xn5Mv+StdaTk9LyT3oxEfLMCawOqv30iZhrczzMFzrJUzsNFutbMeZqZ21tfgWnIM
 bBlIO39ux2ePZoszsXH60kpRnbPoAMPt+DrYxjGevN9x70
X-Received: by 2002:a05:6000:40c9:b0:439:8c1c:6b4 with SMTP id
 ffacd0b85a97d-4399de2cbafmr6732890f8f.53.1772215275081; 
 Fri, 27 Feb 2026 10:01:15 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c70ff6esm13018886f8f.12.2026.02.27.10.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 10:01:14 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, mripard@kernel.org, samuel@sholland.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix resource leaks
Date: Fri, 27 Feb 2026 19:01:12 +0100
Message-ID: <2819144.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260226163836.10335-1-ethantidmore06@gmail.com>
References: <20260226163836.10335-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:mripard@kernel.org,m:samuel@sholland.org,m:ethantidmore06@gmail.com,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jernejskrabec@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,sholland.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 22CFA1BBBA3
X-Rspamd-Action: no action

Dne =C4=8Detrtek, 26. februar 2026 ob 17:38:36 Srednjeevropski standardni =
=C4=8Das je Ethan Tidmore napisal(a):
> Three clocks are not being released in devm_regmap_init_mmio() error
> path.
>=20
> Add proper goto and set ret to the error code.
>=20
> Fixes: 8270249fbeaf0 ("drm/sun4i: backend: Create regmap after access is =
possible")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


