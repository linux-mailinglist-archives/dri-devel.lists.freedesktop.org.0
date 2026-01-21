Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHxtETAXcWmodQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:13:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB65B1A7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32B610E851;
	Wed, 21 Jan 2026 18:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="va3Wo3uc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC2B10E853
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 18:13:00 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-8c53198a65fso9616885a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 10:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google; t=1769019179; x=1769623979;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
 b=va3Wo3uc4PCH9CBrnqiRI4nd8mCaa1V4xh6Eb1Ixahcv/Y1G/cJskLPUutHYMn+LjN
 D3U9jbUClVAkqVeqTw7xf8y3RS8NPpvKQnmSxRjuzy52kUBb42r6DAyZN8x+1p/gpMAI
 DCGKqE9S/PRZXdxT1TEd6Rrnr1sA6t7PDxkCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769019179; x=1769623979;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odBgMeGleRPkwApB129VpN2tHRH7cELn9wuHglowA3c=;
 b=Le8B/SAbwiD/6gKSiTyCsibecYo5yvPWT088D7kj33BHtgQErAvWnYB5gALp/vfWRq
 /aMzhMKHg5n0ytNDsm7G9K7hDsucf1XXzasfuE8thLw+8E8TpAvNeEEFN7JxA0pI8Q4S
 Ev3PDt7C+2ar9QzPlBuTWuCTfIullbZi6GXaO3nesUcJrOvFM5a3G5i1KCRfFyRoG0vw
 X4kWPuJHvS3CAvXDqrHmKc3RoYNnPwYj9SI8kzaMNlXlTicgKPXxJ93W5IUZgNAJbeZe
 +VCEKA8sp1sucdZFBbh29LYt2ia4adoayUXFeiQRqr+8mDaUtci3nmblRu3NvTudKGBr
 92Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJPx8u3dMS6xvccslNz4OiPf9IOupwtGsX6W3pT0sH2/V+uVaRIFYcKu6WzcfCXWwvTn7YryunAy8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrlFwmhky2198vNJYmpT+5RK4UnGmExHtOgAe8T2cLSnUEaCnG
 uyFVFSYULuEKwXwvJDvzXHm0ourZQxKF6hkrECpC72t9YFRM9nCLqh7Um517iiaTWHo=
X-Gm-Gg: AZuq6aIsJnhA7mkd2545sm5Irj81yifpKS8U7MkBBLTlT9+9tgu5ut0BS4Mb4f8iHnM
 S6ugW6mNd6b/YcTwmqv9hlxOzypCrW83rXmwB8V+/qyAZP/FntCZ0hQKYyrrguoePEIqKusTj+0
 +NE0yOANOscOcWOxzsbrzNP/ysexkSBsWIzjFtDe0aEBEsZEsefLELLDW2Q2h8tGO/nhbyIyqo9
 Ve6tE+yaEqAMDB2fp6pw5IW1Ytd5MXob39jskAVIFDNk2N58nkfdxNF2RxMvz5YWIi2kG7Dfjar
 +zkNTPdJcc/u58ay0ekbDiEOYf/2wFy2HEctiPRxLTg/AFU9vyXWAijTZNvJP0/r99U8p7ZCI31
 q+g7L0ZRKV85+llH4CwzEONmPAF782RIzhEfDqlzhgsZCyN0uGV9t2z75WRZ/OObknsP9ByI2QS
 /usurHGl1RoZVuDnOfIQlYy10EEQ==
X-Received: by 2002:a05:620a:2d90:b0:8c6:a790:cd09 with SMTP id
 af79cd13be357-8c6a790cd9cmr1883910285a.40.1769019178697; 
 Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Received: from [192.168.0.99] ([71.219.3.177])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6a71ab288sm1356284885a.6.2026.01.21.10.12.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jan 2026 10:12:58 -0800 (PST)
Message-ID: <237f94cc-dde6-4d91-b942-4854e62eeebb@joelfernandes.org>
Date: Wed, 21 Jan 2026 13:12:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
 linked lists
To: Zhi Wang <zhiw@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
 <20260121092730.3628d290.zhiw@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joel@joelfernandes.org>
In-Reply-To: <20260121092730.3628d290.zhiw@nvidia.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[joelfernandes.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:zhiw@nvidia.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:lucas.demarchi@intel.com,m:thomas.hellstrom@linux.intel.com,m:deller@gmx.de,m:dakr@kernel.org,m:aliceryhl@google.com,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:jhubbard@nvidia.com,m:apopple@nvidia.com,m:ttabi@nvidia.com,m:epeer@nvidia.com,m:acourbot@nvidia.com,m:arighi@nvidia.com,m:aritger@nvidia.com,m:alexeyi@nvidia.com,m:balbirs@nvidia.com,m:phasta@kernel.org,m:elle@weathered-steel.dev,
 m:daniel.almeida@collabora.com,m:nouveau@lists.freedesktop.org,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:paulmck@kernel.org,m:alexgaynor@gmail.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[joelfernandes.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[joel@joelfernandes.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[joelfernandes.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[53];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joel@joelfernandes.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: A0EB65B1A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/21/2026 2:27 AM, Zhi Wang wrote:
> 
>> +/// Initialize a `list_head` object to point to itself.
>> +///
>> +/// # Safety
>> +///
>> +/// `list` must be a valid pointer to a `list_head` object.
>> +#[inline]
>> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
>> +    // SAFETY: Caller guarantees `list` is a valid pointer to a
>> `list_head`.
>> +    unsafe {
>> +        (*list).next = list;
>> +        (*list).prev = list;
>> +    }
>> +}
>> +
>
> Might be better to have a C helper? since INIT_LIST_HEAD() has WRITE_ONCE()
> for memory ordering. This one seems not equal to it.

WRITE_ONCE() is not really about CPU memory ordering though, it is about
compiler optimizations. On the C side, I think it is needed in case of
list_for_each_entry_rcu(), to avoid the case of invented stores or store fusing,
but here we are not doing RCU-based iteration.

Anyway, if we want to future proof that, I am Ok with adding the helper back
(which I actually initially had but feedback from past review was to just inline
it into rust).

But I am not sure if we have this issue for the Rust compiler, like we do for C.
Rust does not allow raw pointers to be concurrently read/written using plain
accesses, so should be already protected due to the borrow checker and compiler
itself right?

Adding some interested folks as well to CC for the topic of _ONCE, +Boqun +Paul.

--
Joel Fernandes

