Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8C9A1061
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 19:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFAE10E0F9;
	Wed, 16 Oct 2024 17:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W9NqZ8a1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C8810E0F9;
 Wed, 16 Oct 2024 17:12:24 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7b1418058bbso3467885a.3; 
 Wed, 16 Oct 2024 10:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729098744; x=1729703544; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=SDw5CET4Wn2irdms8nAGtAOJ9ALGwQBRH1hXBGlKz1Q=;
 b=W9NqZ8a1ZsNPZdp31z09Y8jz0fYi/+BPYzfInmjXgNzhQpZNJHKuI4vr10CJAjq1Ds
 v420ZgCY1EE41xa1QCdHHt80r+fynaQdlDFQJam2Jw0qJRyBzRWRoaf34vaIG1yazxyI
 X7EB3rBVxC4g8r5ElMw0CnZput7ORXnvAbF9vnsfSdsS6G6iKThYnI3etEfyxdEzHCWs
 WmXB3QeIokV0xz6T4RQtW0Oyr4RsIaiS0GB0rikU6MqVqIkwyxxmK8b31YJNDrHkeNSn
 3MRt+jwHXLQknGf93YbtLUVsee9K/SXB4e46pAqJ4SS8J/VOBcs8QiEQuNSn4P0RvJSE
 qcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729098744; x=1729703544;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SDw5CET4Wn2irdms8nAGtAOJ9ALGwQBRH1hXBGlKz1Q=;
 b=c++767RfIAG3wgP2tC/9VQ4laa4+Qe2jABx1UWB4Co8A/Oz8LIHyoqePeBFcgi2GGo
 J3vJxTwiub0oQvRsqsHIXlJ9bPAvRa5jHs+uZNlPDoLOrHJVZYy/myTo60DRbTL7o3fm
 cWUo+z/l9pKcRXjK425N7P4u7UmmLNPxdf7wTqznL3sG5kLnPCDXgqVdJ66uUkt1xmgx
 wkiMXd9lvN1MM2tHIf6fHXrmz+7w6VJ4CTx/sSRftH7XvyLRDB5xgCLQJKZs6zYhs6Oe
 gHfaUNPvPtl46vyW7XwwMSAWWWfx6UW1sBjvKJvsX71o97aBUFA2JsQp9hCWJJwfCmQl
 z4Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaapKLfjV51uwSDqeKmS+xQ6WgTITLdlqPtcE/fLgyBFi/+IMUTHb7+VOMar5ow0yxieEq0xAkRHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymCg9/+ZQlWCrahtADeOi3I6yoU0bn9kHRsHfmbHh00nOlE+SO
 yHg00vZw3auv8dmvQhO+eLZBfJkqc/508Ml00GTnINH1f3YJLekz
X-Google-Smtp-Source: AGHT+IFZ3MGkp6pu06I/SQifhf7IL5905+DLPEdIRaBkpNinqRAdXE/2uh9rFD27+PcdRFQ+MW/9jQ==
X-Received: by 2002:a05:620a:2684:b0:7af:c632:dac0 with SMTP id
 af79cd13be357-7b12100893emr3008154985a.50.1729098743561; 
 Wed, 16 Oct 2024 10:12:23 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b1361661fesm209276785a.11.2024.10.16.10.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 10:12:23 -0700 (PDT)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfauth.phl.internal (Postfix) with ESMTP id 878EF1200070;
 Wed, 16 Oct 2024 13:12:22 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 16 Oct 2024 13:12:22 -0400
X-ME-Sender: <xms:9vMPZ4diqAOMH0KL40T0lqQ6pbY2L89neeQfaE4U_Z_zLZeyHYpI-w>
 <xme:9vMPZ6NZoQVivAXT5KQf8zGfMwPPu3Y69Omsa7E8SS9QegIOAient2mCPRROeHn_U
 A59oE7nkgfjXYNDXQ>
X-ME-Received: <xmr:9vMPZ5j030-43YgXkSTNB1utINefPWWJNFlgYpk_IRoaqZnT0cNSKxBBP2s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdegledguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
 udenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
 hlrdgtohhmqeenucggtffrrghtthgvrhhnpedtgeehleevffdujeffgedvlefghffhleek
 ieeifeegveetjedvgeevueffieehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
 lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
 hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhm
 ohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomh
 eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehinhhtvghlqdigvgeslhhi
 shhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehpvghtvghriiesih
 hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtgho
 mhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonh
 hgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnheslhgrnhhk
 hhhorhhsthdrshgvpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghnihhgsegrmh
 gurdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggv
 shhkthhophdrohhrgh
X-ME-Proxy: <xmx:9vMPZ98gH8mHBf3SkD01Mzeya0JOYRAdHpKaVAK79pk5ActtZ7WZCQ>
 <xmx:9vMPZ0sdoYVujZ3fBf80WV7ZB3k7L-mB7f5j2ya7JZTdQGRfLmj3ew>
 <xmx:9vMPZ0F39TGltIGg2tumc9mJzaQ9IUg8IiRKfLZKRg_yiKFnPosfpg>
 <xmx:9vMPZzO-MY_hLaAgrCLYGUuxTenWmZxq4j4akzAKvVDA1S2gn05BdQ>
 <xmx:9vMPZ5OaxEKMCIb5pWgWeVHz4bTG0sHVFfWhyA4f0NEPrqtUKx2odSBH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Oct 2024 13:12:21 -0400 (EDT)
Date: Wed, 16 Oct 2024 10:12:20 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Maarten Lankhorst <maarten@lankhorst.se>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] locking/ww_mutex: Adjust to lockdep nest_lock
 requirements
Message-ID: <Zw_z9FaTiXV090-b@Boquns-Mac-mini.local>
References: <20241009092031.6356-1-thomas.hellstrom@linux.intel.com>
 <Zw19sMtnKdyOVQoh@boqun-archlinux>
 <bf7632b74c075f2c430fdb98cefed486b4d9e74f.camel@linux.intel.com>
 <Zw6touohNwfqs3T0@boqun-archlinux>
 <ee955c4d3e63edd3d1e37b6467bf01c2c4efc827.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee955c4d3e63edd3d1e37b6467bf01c2c4efc827.camel@linux.intel.com>
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

On Wed, Oct 16, 2024 at 08:17:50AM +0200, Thomas Hellström wrote:
[...]
> > 
> > So even though first_lock_dep_map is a fake lock, it has to have the
> > same wait types as a real mutex.
> 
> Understood.
> > 
> > Does this make sense?
> 
> Yes it does. I'll update to a v3, and add a Tested-by: tag. Would you

I think you should send a v3 then after I test, I will send my
Tested-by.

> like a Co-developed-by: tag as well?

It's not a big change onto yours, but feel free to add it.

Regards,
Boqun

> 
> Thanks,
> Thomas
> 
> 
[...]
