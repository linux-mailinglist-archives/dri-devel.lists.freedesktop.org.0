Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLhIGC6cp2ksigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:42:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE81F9F4B
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020BD10E926;
	Wed,  4 Mar 2026 02:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="dhGu8X04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881F510E927
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 02:42:47 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7d596a5be31so5399307a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 18:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1772592167; x=1773196967;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=;
 b=dhGu8X04ap716HJkpF78VDTeCXLGc+mgnOVwTUgqy/RYTH38PSdp6CAN2pYzIojhMY
 O+mtDUC8laiUIzmMW0R2d6a/oTM2SLOK14kVYJD5+blTe9rmVcdSExS/mevlME464TaK
 zrhgE95st+hMHD+PwttjVAZ38wmou93+ppBvuf3jCmj18LVpUWCONW/ElCSLwg2ZP4LA
 stvhYTxWVZATAdgkpFeX1GR2YjP2tUtUto92iTuHQW9FAacVkM4Zttz38jGEJ7+Nf5fu
 nDbCIZazvUrzcgaP76h2Iohxg4Ft8a2wtrBjzwyE6i0fXADrKck1gVKvGfADCymSDWC5
 LMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772592167; x=1773196967;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7dycZCW1i0wVXbu5i6p68JSQ3h2ubeTDMrk86ISU5M=;
 b=LDIhPwZYZfFtEyu+R8gGMOw1+QS0TxcrB7DSGq2EkvhetLbOoT/ezwLSNXnAbsx5+B
 D4IVARrsE86fcgnCYCIF3vfES2nue+GBvLiy0ny2KBIW/9hHBxeGcFKtFCEITK11rmgA
 W+scFDS/U42oKHM+Wv3ziypfWnbVcmXKW+06158lfXhaYme8dgc1p3YJ3vOGBX3oCfxp
 FN6wNTVc9oTNhGPAZLky6FlVvEVNOMkuZyhor/BIpaTXsFcICAEq+KEN+VKPMnzNDKKx
 7JWa+xigWD/9/AJMPL5qzTStK4a7PcRfVYozr1E2EknmgR10H9EJF2pGmQBviqlVwDsZ
 8J/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1IH5cNiD+L1OnfD43t9n8slTyXhup07pRtrF5npIFb7klm3RtF3t2ChcO81p8MtTu7SeQeJZ0Ivc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwWE6tBDCaUZvAPA6sK8D/u/lANIfKZS913Grk3lEi/xxH30PI
 J90aaRAQocktIDJ43OoXTzh1jSRV88B/L9lmLkeRdaxPE4h9hgX0lKAw3+jlFR1P01I=
X-Gm-Gg: ATEYQzyl1nkFxSUSLG0bMHc3F65aCdNRBYEaScvqhcs9Kj3O0GJDw2gHI69bKj7yBDH
 TEO86QHsCMee9YSPF/VNlm5ZxIM8+99rnuW69EPxQ40BhOiBMR6SFHP/5iwTFHD9KA/kAxGwBtK
 Bcet+9Ue3jVkOPZ+q83Z3wkWHIjtE51uljkQ5IAlBOXd8Dfkwjf/zZgyHweoneMDo8UkeUKaHUD
 N+/XcJv0cKgla3l3Eh+e2gJYi4d8U610ZMiL9GncFao4WVCGLbIX6RRnuwJcesXBdbZFcNo/+u2
 z6OLJ8UCtG+9I4Fs3fuPiWM+/up0nb5mwLaqm7+g0dV6/1Or53ZKRU7C4AClQiNjY0RAvCFEEYD
 nauPEbJ/k5AXAlh3DOOLqb3c+GBfs7BirfxzI0MN2y+OntSiDpJTIGSj6tsgv/Hj4ZFPPmHaLfW
 A5SxgQyOfbWdj36DHVMd/03WkNv83nGpndpcFWvPQH0hzo8V/X+Cmj/n5U7YCzGDYRvPTouj0SI
 Dv7NbiVHQ==
X-Received: by 2002:a05:6820:4a8e:b0:66a:1886:e4bf with SMTP id
 006d021491bc7-67b17703546mr346906eaf.22.1772592166871; 
 Tue, 03 Mar 2026 18:42:46 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-679f2bfee3csm12574800eaf.7.2026.03.03.18.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 18:42:45 -0800 (PST)
Message-ID: <f8d86743-6231-414d-a5e8-65e867123fea@kernel.dk>
Date: Tue, 3 Mar 2026 19:42:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] mm: globalize rest_of_page() macro
To: Jakub Kicinski <kuba@kernel.org>, Yury Norov <ynorov@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Carlos Maiolino <cem@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Christian Brauner <brauner@kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Eric Dumazet
 <edumazet@google.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, Linus Walleij <linusw@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>,
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Christopherson <seanjc@google.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, Zheng Gu <cengku@gmail.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-block@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dm-devel@lists.linux.dev, netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-crypto@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, v9fs@lists.linux.dev,
 virtualization@lists.linux.dev, linux-sound@vger.kernel.org
References: <20260304012717.201797-1-ynorov@nvidia.com>
 <20260303182845.250bb2de@kernel.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260303182845.250bb2de@kernel.org>
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
X-Rspamd-Queue-Id: 12AE81F9F4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[kernel-dk.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[axboe@kernel.dk,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:ynorov@nvidia.com,m:akpm@linux-foundation.org,m:davem@davemloft.net,m:mst@redhat.com,m:tytso@mit.edu,m:aou@eecs.berkeley.edu,m:alexanderduyck@fb.com,m:agordeev@linux.ibm.com,m:viro@zeniv.linux.org.uk,m:wintera@linux.ibm.com,m:adilger.kernel@dilger.ca,m:andrew+netdev@lunn.ch,m:anna@kernel.org,m:anton.yakovlev@opensynergy.com,m:acme@kernel.org,m:aswin@linux.ibm.com,m:bp@alien8.de,m:cem@kernel.org,m:catalin.marinas@arm.com,m:chao@kernel.org,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:imbrenda@linux.ibm.com,m:dave.hansen@linux.intel.com,m:airlied@gmail.com,m:asmadeus@codewreck.org,m:dongsheng.yang@linux.dev,m:edumazet@google.com,m:ericvh@kernel.org,m:hca@linux.ibm.com,m:herbert@gondor.apana.org.au,m:mingo@redhat.com,m:jaegeuk@kernel.org,m:jani.nikula@linux.intel.com,m:frankja@linux.ibm.com,m:perex@perex.cz,m:joonas.lahtinen@linux.intel.com,m:lucho@ionkov.net,m:linusw@kernel.org,m:maddy@linux.ibm.com,m:broonie@kernel.org,m:mpe@ellerman.i
 d.au,m:miklos@szeredi.hu,m:namhyung@kernel.org,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pbonzini@redhat.com,m:pjw@kernel.org,m:peterz@infradead.org,m:rodrigo.vivi@intel.com,m:seanjc@google.com,m:simona@ffwll.ch,m:tiwai@suse.com,m:tglx@kernel.org,m:trondmy@kernel.org,m:tursulin@ursulin.net,m:gor@linux.ibm.com,m:will@kernel.org,m:yury.norov@gmail.com,m:cengku@gmail.com,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-block@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dm-devel@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-spi@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-mm@kvack.org,m:linux-perf-users@vger.kernel.org,m:v9fs@lists.linux.dev,m:virtual
 ization@lists.linux.dev,m:linux-sound@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,davemloft.net,redhat.com,mit.edu,eecs.berkeley.edu,fb.com,linux.ibm.com,zeniv.linux.org.uk,dilger.ca,lunn.ch,kernel.org,opensynergy.com,alien8.de,arm.com,linux.intel.com,gmail.com,codewreck.org,linux.dev,google.com,gondor.apana.org.au,perex.cz,ionkov.net,ellerman.id.au,szeredi.hu,dabbelt.com,infradead.org,intel.com,ffwll.ch,suse.com,ursulin.net,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.sourceforge.net,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_GT_50(0.00)[85];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,kernel.dk:mid,kernel-dk.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

On 3/3/26 7:28 PM, Jakub Kicinski wrote:
> On Tue,  3 Mar 2026 20:27:08 -0500 Yury Norov wrote:
>> The net/9p networking driver has a handy macro to calculate the
>> amount of bytes from a given pointer to the end of page. Move it
>> to core/mm, and apply tree-wide. No functional changes intended.
>>
>> This series was originally introduced as a single patch #07/12 in:
>>
>> https://lore.kernel.org/all/20260219181407.290201-1-ynorov@nvidia.com/
>>
>> Split it for better granularity and submit separately.
> 
> I don't get what the motivation is here. Another helper developers
> and readers of the code will need to know about just to replace 
> obvious and easy to comprehend math.

I fully agree, I had the same thought reading this.

-- 
Jens Axboe
