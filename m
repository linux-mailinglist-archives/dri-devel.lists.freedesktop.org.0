Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7604AEC2A7
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F2B10E0C7;
	Fri, 27 Jun 2025 22:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jlktFWF4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2AF10E0C7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:39:14 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6ecf99dd567so4826056d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751063953; x=1751668753; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7g1bBXYrSy7vlenebLtkHlzOqTtWZZlLI9LeHsV4Peg=;
 b=jlktFWF4smZtiwukC1gJN4PdO2uYOlaVTNasvqhksHFIxD4UIa7uEQcSDuAghhYvbT
 biR10mG3jBKbvA1P/fyh3Q1zELf04Qbd/bTUDxNjRQNUEFxyaHWTUN7yXaTAT9E0qZSB
 A9FjxajFGxiZw671CabdbaGjojTyVwEvjqi1sZARE2mBjjOpkqowodbcwuRnNc0OTbZo
 xwHaU8BoHfeWa7ZehjaQSQ3GOWApb5wHcXPfRi0wsM4YqW+JRwNF5OKz+fleo1P8Q2r+
 BYO4Hl/MB41X3CZFdGIEHYfNWhScCQWWgZrUPUkkkPi5tzvwZCDv7d9kFULZrsVmGLR4
 O3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751063953; x=1751668753;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7g1bBXYrSy7vlenebLtkHlzOqTtWZZlLI9LeHsV4Peg=;
 b=vB+xEvUBobujyz/DCmOR/P0z5Fhvd3ZaP9b0SIEsE5X8utudPVALvT+FXVetqMM/E2
 9AEjK7lbljpL/OGgYH2kFeusbvPn44GeHVwNThyMIpc6i4/LUcmN9G28LjLALNUlseh6
 iwIYPAeEH0k4TAX4BU7R/rcHHvMq4WaR2C0mK5cGJ5ynlrWs5J8HqtBWzWrkD61DrczA
 TAVuqbyTooEd8t1GmSAU58CsNrD9q+LkKuvDbIWGU2I9Ij3nxr3ONxzBF5voyzquvdvk
 rxI7B0yo7B7ngnLiCr4kA2aLn3lnj/Scl18ioIeg7r/A6c9Vfl3Fr2/wGfnIhB4sZ2fH
 aIrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVst+9MxVcYEfLao7R0CE+T1WsNptZaPBMLsZ/VBMBOXT94cuTTx6ychY9J56TyqB5HojI4H5P+Z4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTFNWAtaJn0K51neBrxwNtDlMlyOrBHbN3RzZu0mTrm55Z0qfP
 KI4HfQCOP+DewgbObBMLNNVBHbBLg3XTlS3kBDknFjZOccgwIT6FbN5n
X-Gm-Gg: ASbGncvZu037v/JflJ8dRvNvfWY9abIseXRrDwNlhG23p4+Xekmbwvw2Xz2GNNDOYJX
 1yDyBlrqOm93jXbdn9NJ7/fI8amlKk7ezGK9AnPEm6fBWqaTKrcusajVThwbZfuofI8KvFHH9qZ
 rYFBTuL/Q3Kd/Vpt/MLzJISPCTZbhHEev1JOJUXl476jmbmhZbp4eGpC4ObbNdI4Sdybmbg4T/F
 tQ33DmngPhZfvBrP0gNl8TzoVUMheQNxZJK63gqdDiSiH2yoKUuZ+9eu78h7qmlIg5CNSNA+0D8
 M5OTDDRCQ4A1oPATXF50ZgLgRMb7tc133dxTlnTfDL1pSBxY1UNH4g0CC4Ozw3MexsK3QdqyO0y
 SugBNe++cdSPSbuLolg1rBOkz9MuNB30V0YXTopDPLZO9BiXjc1E4
X-Google-Smtp-Source: AGHT+IFWuNaj/OKb0RZH+IjgOcgGhXHGSzbx04zgmFEX8NtAwscJcxkqQnoNKbPXGS61cWBJnzOEbg==
X-Received: by 2002:a05:6214:c44:b0:6fa:fcd9:35bf with SMTP id
 6a1803df08f44-7001441b0c5mr66576126d6.42.1751063953388; 
 Fri, 27 Jun 2025 15:39:13 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com
 (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6fd771907c9sm28206756d6.2.2025.06.27.15.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 15:39:12 -0700 (PDT)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfauth.phl.internal (Postfix) with ESMTP id 480B5F40066;
 Fri, 27 Jun 2025 18:39:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Fri, 27 Jun 2025 18:39:12 -0400
X-ME-Sender: <xms:kB1faNOxkjtCFix6_w_rot87ViWsb8wjUo0vjkytxCHkAyDbLrzWwg>
 <xme:kB1faP9ks1nrAds7CC40G9qxQ16uAHReMZgFsGfWkgWwnz9Mw80v-84stSQQ0K3AH
 l2cMkqtagxbiwwAKQ>
X-ME-Received: <xmr:kB1faMRyk5IARiz87bUwzTbsBP09dC-ntralNRH4hDvIQ3-AJQL2cZS9e8lU6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnheptdegheelveffudejffegvdelgffhhfelkeeiieefgeevteejvdegveeuffeihefh
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
 hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
 jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
 drnhgrmhgvpdhnsggprhgtphhtthhopedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtg
 hpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdr
 tghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtth
 hopehtiihimhhmvghrmhgrnhhnsehsuhhsvgdruggvpdhrtghpthhtoheprghirhhlihgv
 ugesghhmrghilhdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpd
 hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgig
 rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihgh
 huohdrnhgvth
X-ME-Proxy: <xmx:kB1faJthd-tFGLJNLe-nAQkH56NVz9fnznKUgc35i602na4LkfS5kA>
 <xmx:kB1faFeVrSSzrp4_EhOMCv6cOJMhHQsgk2VXTa5is8g1ygAkalFc-Q>
 <xmx:kB1faF1cLzGjwOhN79n1-y9UhMuh_Bmx55O7BYqrZMyvlZ-8-eptWA>
 <xmx:kB1faB9zf7w4YiPdZlel3i--5a3DEese5OgyQt6-yKd_J3fNsj2C-Q>
 <xmx:kB1faA-r9s6UtJfP2rn4IH21a-4GoP9FU4sb8NYRru1M6R17cBKmSHFG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 18:39:11 -0400 (EDT)
Date: Fri, 27 Jun 2025 15:39:10 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>, Rob Herring <robh@kernel.org>,
 Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH] Introduce Tyr
Message-ID: <aF8djorZMkuw4CCq@tardis.local>
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <81B29EDF-B6FB-458E-BADC-F3708A9434BB@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81B29EDF-B6FB-458E-BADC-F3708A9434BB@collabora.com>
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

On Fri, Jun 27, 2025 at 07:36:33PM -0300, Daniel Almeida wrote:
> I´ll fix the missing "rust: drm:" tags on a v2.
> 

No worries. For a second I thought you meant to write "Introduce Tyrion"
;-)

Regards,
Boqun

> - Daniel
