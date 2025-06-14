Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D3AD9E81
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 19:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CF210E126;
	Sat, 14 Jun 2025 17:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="egkRgq2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5984310E126;
 Sat, 14 Jun 2025 17:31:53 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7c5f720c717so449068285a.0; 
 Sat, 14 Jun 2025 10:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749922313; x=1750527113; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9vAD1Oo4GIgsQJodLIxN5GNTdvfpBs5Y2Vi4v397QZQ=;
 b=egkRgq2t3eMuD7IrarKf23NBr+wSQLaitq2bBzmmwdROPjvjXabmIM3N/GlYzjnj8B
 87Hdn8qL4+r/PXqOby9QrLnmvCEqKcLqQGh4q7FZPGMwX+tKoARUFsrCOCYXN5x2HqJx
 K6YfcPe5sRLaGJcw7flyxUAmsShUJrzqzeKOm77RhWAWS+owLqmqF2mWewIP3QM9d/uH
 iaQdeB1VRZXNb4EkEGtkw4veSQEpSnX+a91fp/Bt3koeWwo8FjSLabOyxV8EVLGKos7J
 cW7rlGEajpxtc67glktePVPq9sjJhUblLniaQYKsddxcvXSa4/4pFTzxS7ix/TJ7gZN4
 Gi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749922313; x=1750527113;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9vAD1Oo4GIgsQJodLIxN5GNTdvfpBs5Y2Vi4v397QZQ=;
 b=t0QqL2fRC50I//6D0kxreqp+BtMjeCSLwTpu2J16oFFz9o3Dox4vrEaUvXDW4YlSDa
 E6eFwBNFyHvHQ8CzGHGcJh2VUzPt2WouFKDxaB0lHg2GyMmeYeZCU/C1DA241/RVImTK
 6BAb5dSbLPJATntu4y/7JfGvTJu4/asIcGC0Gd1eyCPw7NaSUwor5aYYHWhxzgUKmoz7
 T7DcZZ7W6HKM25wUIWZKZzOv0pQEBpds7m3owI9gvJjHghjMUVJ/AXC6JtbwyHt2bICU
 KUJlNadvVPHqd/0X6yl7ifC7SaNM4nw5yQRtgprzMbRoWqYw3U+MA8j9hjpVK+sAsSTU
 +m0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbwG6/DpXxtDqbVTswQ1tOPRb1UJUkb8EboVElsv0h8jFoMn8vPPjTb5cnN2EfkgxmueJME0JvIQ==@lists.freedesktop.org,
 AJvYcCVgKb6Y4p+YhcqIIMEyYtBQwRNyyTaiL5RDKQOh0MeU3WKg6wKSWJTuFf3Lj7JolrF2x3dJP/hBkQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI5cta3Ze41MSIzZ96+2KUMDSa+3iJ+k8RhhwHKJEm3yDKQkTM
 xBHUg3PwpITCbe1LgWenUWybpBgQRD5TrOA8+fi+vhVPXMtHwZOQ4Oym
X-Gm-Gg: ASbGnct2xSPfqNsFuFf4S97SFCMUZO5GzWIZ4/RcENCN8wbW9uimSeoduGV5tIdg4eF
 wOgm+q46Ro5jtunieLJnZcsCCwgcGD1UUgVGoww0NUSNgdHBaIiBX+1Kp/9jUvMhbYUtibsGh61
 YnWvMc9fjlRCTNnILT3WPAWqASMKMThLn/Wtc7Yruu1sU+Wu8QCgsI+21TWSXY7Cp7mIHnY+uFc
 ygQwE7HWlP1NIa4GsJ7lhYMcXW6rb1CoiRtnykLDwQtLsLVNhhlcwC4RSz2bgz9/cMBWOETp2Me
 yla1Qcgu+3aZGCq8dSXtBCv3fY81p3DSFlOGPlsnElI7EoWs+hf+LkBRpkMAbYMEArwcyiAQ0/z
 O8itp5IkDago+2heC2DPVfLRd9tzk6m/fzSnGE3kTi78/mqssfbC4GTl+sZxl25c=
X-Google-Smtp-Source: AGHT+IHWbXpaW0xQ8j3ub+miaPu23oUlnOGgckN1dXQ5JdCeAoLpuWN7nPvDlT0D04EFcpHoWTBq2g==
X-Received: by 2002:a05:620a:c4c:b0:7c0:af6d:a52a with SMTP id
 af79cd13be357-7d3c686ccf1mr615595885a.26.1749922312672; 
 Sat, 14 Jun 2025 10:31:52 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d3b8ece837sm315191785a.79.2025.06.14.10.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jun 2025 10:31:52 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfauth.phl.internal (Postfix) with ESMTP id 9AAB71200043;
 Sat, 14 Jun 2025 13:31:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Sat, 14 Jun 2025 13:31:51 -0400
X-ME-Sender: <xms:B7JNaALbphz8h8WwKiUCQdyMfGLK8128zaxxKmGulrkaZPyAdYvblw>
 <xme:B7JNaAIonQXfZpzu3ihyYXOzraU3oXmXXhf4hKZRFCixel4-p9rtbR_YHgUcLxaex
 YHN4CQ8vOppjnppwQ>
X-ME-Received: <xmr:B7JNaAstFCv3qXjz7_iMHX1CbApHaVF63wVuShqALpDU4f4WHolkTKmR3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
 necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
 drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
 ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
 ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
 hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvhedpmhho
 uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtg
 homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegr
 lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrg
 hrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgr
 ihhlrdgtohhmpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
 pehtmhhgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtohepuggrkhhrsehkvghrnh
 gvlhdrohhrgh
X-ME-Proxy: <xmx:B7JNaNZ7Fs0cWSwJTnBpxyC6017SCCSK54R6dN2bPoCzQzX1HGe3Rw>
 <xmx:B7JNaHbCYH9QSNvhCPgjcxPDufAr9Ah_6aS9wLpMbwHynjQsJVX7BQ>
 <xmx:B7JNaJBsl0SqeeNXa0IuPwIYbYvSquTyFEJipBKaWQ-_tu8ssz8nEw>
 <xmx:B7JNaNYqYKe6wznY-CIYskbHH-cA1_tz3bAfac15m8wZ8rkU8D8ikg>
 <xmx:B7JNaPpNZ8RNs8B0-hobud1ykDb-wQjKcTMF2RseMG5IxJnxKgeCHMSo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Jun 2025 13:31:51 -0400 (EDT)
Date: Sat, 14 Jun 2025 10:31:50 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Benno Lossin <lossin@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 04/23] rust: add new `num` module with `PowerOfTwo` type
Message-ID: <aE2xq_ikyUZ0JwCR@Mac.home>
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-nova-frts-v5-4-14ba7eaf166b@nvidia.com>
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

On Thu, Jun 12, 2025 at 11:01:32PM +0900, Alexandre Courbot wrote:
[...]
> +/// An unsigned integer which is guaranteed to be a power of 2.
> +#[derive(Debug, Clone, Copy)]
> +#[repr(transparent)]
> +pub struct PowerOfTwo<T>(T);
> +
[...]
> +impl<T> Deref for PowerOfTwo<T> {

Why do we need `impl Deref` (and the `impl Borrow` below)? A similar
concept `NonZero` in std doesn't impl them as well.

> +    type Target = T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &self.0
> +    }
> +}
> +
> +impl<T> PartialEq for PowerOfTwo<T>

Any reason you want to impl these manually instead of deriving? For
`NonZero`, the std wants to impl these traits only for
`ZeroablePrimitive` types, but we don't have a similar trait here.


Explaining the above in the comments is much appreciated.

Regards,
Boqun

> +where
> +    T: PartialEq,
> +{
> +    fn eq(&self, other: &Self) -> bool {
> +        self.0 == other.0
> +    }
> +}
> +
> +impl<T> Eq for PowerOfTwo<T> where T: Eq {}
> +
> +impl<T> PartialOrd for PowerOfTwo<T>
> +where
> +    T: PartialOrd,
> +{
> +    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
> +        self.0.partial_cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Ord for PowerOfTwo<T>
> +where
> +    T: Ord,
> +{
> +    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
> +        self.0.cmp(&other.0)
> +    }
> +}
> +
> +impl<T> Hash for PowerOfTwo<T>
> +where
> +    T: Hash,
> +{
> +    fn hash<H: core::hash::Hasher>(&self, state: &mut H) {
> +        self.0.hash(state);
> +    }
> +}
> +
> +impl<T> Borrow<T> for PowerOfTwo<T> {
> +    fn borrow(&self) -> &T {
> +        &self.0
> +    }
> +}
> 
> -- 
> 2.49.0
> 
