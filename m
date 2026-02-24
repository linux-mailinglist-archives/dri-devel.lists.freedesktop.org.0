Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB01L0UrnWmfNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:38:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A070181B11
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 05:38:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED4710E275;
	Tue, 24 Feb 2026 04:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MRLbNPfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135F310E275
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 04:38:25 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso1862240a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771907904; x=1772512704; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IaRG35L9+sKa70owQkokTSS20AIgRWvhgTDtPyL30l4=;
 b=MRLbNPfbrNwhiQtPN0XjtupGypKjjjU1ytBCKcSf9zizZ1nwHvVL2DNC0tMJ5K1pWB
 u2Hw8NNi/Ks30U9pnxDJOMARid+SmHqNzZjj0pcm8EgU0SwH+MHC5Ywm9xGxzyy5jrnJ
 0yMhB3KRDN+PeCD5xoduVyw8jsTprFoDH6eUufmWPdKJot+S2r5aISihXVOhCVcw5kE9
 Y5ey040IizmnMxj4U1HbFpwGCnteP1rVu/HdSSNJsRN7Lz2aE8U10D/XWZDnbH+CJ56+
 sDrQKGZ6RwvGx1rDUh3JLw60G6ZDcedjVHBe5DwBQKEQMJ2nO6WpMyCT+T6eXmWFPCYz
 mPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771907904; x=1772512704;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IaRG35L9+sKa70owQkokTSS20AIgRWvhgTDtPyL30l4=;
 b=KbYdv7S7nRKn3QgrxIyFv0Y3rGKUTT+wpgF3W0HyBlk7Tz+YMEm9pEhbLT5ORaTxup
 VdcHG8UfPk5RSuI3xPoX7trh3a+lFd/ZxBAq9Z7l9sxULdBd7MqpdRIUlDivpYHk8DGP
 TUJ3DjgTKpjmR6ebPCoVtvOObz8JznAe35+nKdBGIJVOsAWPSZmm5sv223ycDA3CPdHm
 yenWy4rAMI0tWp2YBTfYRvsvikReHyy63diSZ2nOF8KakiySDTwgclopsDev4vCQlAzn
 AWamwGkXNSGbnl8NqJ1FTG6u+uem3GcWGdapCDg1XrDQ1Xp8dsFUCTy7h9e8+wWem/qk
 H7VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYvj0fu3yY/xaeu6E9rTDM73LN8/tn9EKCir7g56Unn4HmZZwu0Wr2JyGk/ItVvqU066y+F5e7ZOY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2dayaVbOIXyhClOYCZNA5eAi71b4Nb1WAxU0c0FDcwBnTkGAl
 EkgqM8lvHx+CT5jMd0kfdyn9GXRoZFdb2Y1VhChjBC0fHPb0WRdaBWvw
X-Gm-Gg: ATEYQzzVOodZDHUM4dxj/UZErMQ88THYhXJqyblpaOwBk+QZxT6+oN4zXwOuosnBUkv
 GDNtUumn+Ewz2knXkSwmSFLPbJI1rZkgw/m9f/UyzQIR/DggRDvMmK6rPu2ryIuT/23aU7CCN2Z
 09COe1zVWYXzM7kVTUNiDkEg0fGQzxolZ3/pg/XVO4VjjPIGg/WxPLFJyMGp+x6FaRlepm5+Dpf
 Jql399F6TKM8cUl69/d/OuydrbKXw0QTbo1pIn1P1wl+bJmq+jEPbXMfyGZX5KFqCvxX0I2jbJ6
 ngh5I3moteJlYYCeU0XDNrRIT1ndaxkj3Wgt9STOr4YGikNuff6nmPVkoo/MsofL1s15WQ4hN//
 7ch+syHr3bLHRCoAiUI9FgG0B6uffXPUACjZpx11nDgs+PutCjRpwJ2FCLX5heedVGSCFgzpJIg
 f3/yb1X1M9YwhuTT9BxOxZCuPFefFCEOdJ+qoHFpq8aUGRAiY6Q5aoAl+GgvP4YTDYnRHfkLmE4
 GuPMT6wSg5dhGevqFUdIJli713mjLPYvW1ctzkF1HkXcbxbqTRUDcNmKla4ZiO/imSv6W5kzooz
 ZtgbLBpFjT/Z
X-Received: by 2002:a17:902:d504:b0:2ad:ad0f:bbbe with SMTP id
 d9443c01a7336-2adad0fbdf7mr2732295ad.29.1771907904441; 
 Mon, 23 Feb 2026 20:38:24 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:dc23:55cf:823b:5fde?
 ([2601:1c0:5780:9200:dc23:55cf:823b:5fde])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad7503d406sm85286315ad.75.2026.02.23.20.38.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 20:38:24 -0800 (PST)
Message-ID: <bda58fc8-0c59-48b4-8a8d-fb05f72b49f5@gmail.com>
Date: Mon, 23 Feb 2026 20:38:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: novatek-nt36672a: Convert to
 mipi_dsi_*_multi() helpers
To: Doug Anderson <dianders@chromium.org>
Cc: sumit.semwal@linaro.org, neil.armstrong@linaro.org,
 jesszhan0024@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260223043441.5295-1-chintanlike@gmail.com>
 <CAD=FV=WtjW5WWmjeb2zwF2PjiJeZv1jZS_UKZ0bT1658=CkwVA@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAD=FV=WtjW5WWmjeb2zwF2PjiJeZv1jZS_UKZ0bT1658=CkwVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:sumit.semwal@linaro.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2A070181B11
X-Rspamd-Action: no action


> 
> I won't insist since it's a matter of opinion, but IMO get rid of the
> `err` local variable and consistently use `dsi_ctx.accum_err` to store
> the error code in this function. Yeah, it's a bit awkward, but having
> the separate `err` variable just makes it too easy to mess up and use
> it. As one example of where that happened, see commit 61ce50fd8196
> ("drm/panel: jdi-lpm102a188a: Fix error code in jdi_panel_prepare()").
> 
> Also: instead of returning right away, I think you want to make sure
> that the GPIO gets set to 0 like the old code did, don't you? I'd be a
> little hesitant changing this unless we can truly prove that the GPIO
> set is not needed or unless we're certain that the GPIO set was
> incorrect (in which case we should fix it in a separate patch).
> 
> ...nicely, if you use `dsi_ctx.accum_err` you don't even need a
> "goto". You can just let the "_multi" functions all run and be
> no-ops...
> 
> -Doug
Thank you Doug! Those were good points! Will work on v2.
