Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NW8ECwsgmlFQAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:11:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD2DDC8C8
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3AB10E701;
	Tue,  3 Feb 2026 17:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=shenghaoyang.info header.i=@shenghaoyang.info header.b="deWlgnZp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7475A10E701
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:11:01 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a929763b57so1009575ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Feb 2026 09:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shenghaoyang.info; s=google; t=1770138661; x=1770743461;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=owmQT0EpyuXv4DDM0C3vDuY2oTYu3b1b8nzeGAtahIg=;
 b=deWlgnZp7ZirQEa8YjnTFjV8hMA9tH2yvC8N9QMq9qCn4Vr/45USm/eNVEfAN+fEen
 5YsMUJK926rSisidgbkX+MqhgycTi5dZ+dOZN0QSYE8pyyE+w7kPvozGCgPwftsWU9Dq
 Sbatb/QeMSpPYDVYIp70BrK792FhGtTjiUky5p70QswsUE+fEzXhf7Mj+ldcbk6uCQSb
 AachJG20nHVyEocAqutzuI5ZoNa0LnDg/kI1yohfVXRr8iEtBZrjyCVvpxDLVwtsv+vt
 P7JJ+nLponXcxHebrjFVW2Bl36ck3i1btuKQNlEcbmdqjLAkenOdwXHwi2DCBybyG5FP
 of2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770138661; x=1770743461;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=owmQT0EpyuXv4DDM0C3vDuY2oTYu3b1b8nzeGAtahIg=;
 b=q/T+0UlZwDoc20m6G2lWaPQTZkH79RDzJO1XxXf49CUVjO7Xmn1WO6AqrIadaTP0JD
 sjl/Uo3qa+n2XwaZfuwdHEoMRL6O9+rWFQ9dqw3HqUIIPDDElG2+9K1WGctZHeutxfyE
 GWoH6apSvYkXHUgrQLtv3X+xX8PxbKhFq+82d48kdOVbkqeQx5xmeQLhXOqZBNGiJQX/
 vKHZtd7BE/FDfxO8g/njWKBMaqKnGBuDH3aTbKJjzy0UoJoCJ4nZvEr+05BUFlU9kNEW
 cjItYE3IFgi2VpwdWhHm/CQOyomkOPqVkuCuInFjNgzVqWGdBlHZCs5gp7rXrKcIyXVS
 YBiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV08qRREO0pjsfbjlWFCmsiOMo1k//nP/e7qt0QOcmZdM8W+R+jAv3hZBNUtlpsYBXr19kxOvHazYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzovh0s6kyZN9TxQdEapxXuEpnCIB/8W+vNhsaRPtXKa/Jv9r/n
 39aH+mnfrGHjsNnIZ1KZnU8a0jK26X3gPgufPN7b6t3RTp4vvRQqPvSMGoMMJYuXOpY=
X-Gm-Gg: AZuq6aLTZlDXfVOrk0whcDkIb0DYS22S/hFrlIFI3z9ZE9ZpYf+rSgtF10B4AGXp3OF
 4mNqFqzn/QRXBJFIofjmDBAmZamOo0qCtYn/KTJPUHwd8y9Ls9RAOUfigYRVNmHC9W3tcgsNZ1L
 tNTddpiWVoqCm4pyfPQupFo9tmK/hOC0IyY1eruZMu0FnMFn7r5+BpR3lqZ9L032GH5wHIenLNp
 PWWDmuCJGPCtOBkPthmgNWgWjDkayJSe+oJsIg4G9aiEIyMKYF+aquAyugkZGdZ0Zr9Ff98GA4M
 swNLM0xahG9mj+ZvWFDt5TO+SB9HnQk/VYBYHrL2BYSfIkClvx//32cDh9Vg/mgwiAJbBKV/O7I
 zhAKQkzJ9Fv6PzRq2Rf/aP65hQhKkyJO838oS/yQjcIvBgFYd7C3RnbXVxpwAISTJHKrd7jtNt8
 sK4kx/zOiKOa+6
X-Received: by 2002:a17:90b:4d8d:b0:34a:b4a2:f0b5 with SMTP id
 98e67ed59e1d1-3543b3cdd55mr11280201a91.5.1770138660855; 
 Tue, 03 Feb 2026 09:11:00 -0800 (PST)
Received: from [10.0.0.178] ([132.147.84.99]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c642afbeaf3sm17637993a12.33.2026.02.03.09.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 09:11:00 -0800 (PST)
Message-ID: <b2834300-c1b4-4bc0-b6d8-d8bdd581be0a@shenghaoyang.info>
Date: Wed, 4 Feb 2026 01:10:49 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2] drm/gud: fix NULL crtc dereference on display disable
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ruben Wauters <rubenru09@aol.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable+noautosel@kernel.org, kernel test robot <lkp@intel.com>
References: <20260201095956.21042-1-me@shenghaoyang.info>
 <aYB4jhjqC4ij5LBO@stanley.mountain>
Content-Language: en-US
From: Shenghao Yang <me@shenghaoyang.info>
In-Reply-To: <aYB4jhjqC4ij5LBO@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[shenghaoyang.info,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[shenghaoyang.info:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[aol.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,intel.com];
	FORGED_RECIPIENTS(0.00)[m:dan.carpenter@linaro.org,m:rubenru09@aol.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:stable+noautosel@kernel.org,m:lkp@intel.com,m:stable@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[shenghaoyang.info:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@shenghaoyang.info,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,noautosel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 1CD2DDC8C8
X-Rspamd-Action: no action

Hi,

> Why are you adding this?
> 
> I suspect it's because checkpatch complains that commits with BUG: in
> the commit message should be CC'd to stable.  (Although, I can't trigger
> that warning now.  Weird).

> Are you planning to manually backport it? If so, you could CC stable
> and then when you get the email that it doesn't apply, then you can do
> the manual backport.  Or you could ignore it.
> 
> Or if you think it's not worth backporting, you could explain why.
> 
> Cc: <stable+noautosel@kernel.org> # too risky for low benefit

Ah - I added that to try and avoid the failed apply email! It's a bug
that only exists in 6.18 and that stable tree will be EOL soon with the 6.19
release, so I figured it's not worth a manual backport.

> If a patch doesn't apply, then the stable scripts aren't going to apply
> it.  It's not necessary to tell the scripts not to try.  To me the
> "noautosel" basically means that it's important to not backport the
> patch.  Maybe the API has changed so backporting it will cause a subtle
> breakage.

Thanks! I wasn't aware of that connotation - I'll resend without it.

Shenghao 

