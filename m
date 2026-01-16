Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAE4D30EDB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF32510E0E9;
	Fri, 16 Jan 2026 12:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EWu+nsTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2AA10E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768565593; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KKIVjL9n5ING5WxL8u7XxH+016IGX0NrHj39ZQuK4gRxq+J2oNUVts4rZFHUqCE44nZdSJv7Y7LU5yVzM1MpWlpLkD9uHkr8fBJAx8/vVD+EhPaPmR43vagJ5gGw4UISYApgLUCVdNASFdncC0G1hTyrcTWduClxyZNiDl8O0+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768565593;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=RNeCv4Rf1urTMAh77DfhohHAVI+5NfICl+BvxyyMAZQ=; 
 b=hly6RuWRTQL05rNJo+VGCKr4k0M4bZkzwjbP17wa6KhmfOycNeIDDHGRweodIV0o4isMf36imXDCBP41FT7zfkO66RtnJwj6ycfRaer5OWQ4U9O75O0VcozcBTuapOOC1unzbpR20rcBnuXXcNeht1VNnCpNwnrXiBqDAfq8lUE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768565593; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=RNeCv4Rf1urTMAh77DfhohHAVI+5NfICl+BvxyyMAZQ=;
 b=EWu+nsTYjmqyKx2Jj/rzibyeF6HtOkIkik7Ot35CSryOKfYoVVqvH7ocSPSkuZij
 qaEdDYNoWFvkwfz29uWglijr6x1pyPOfudyKuZn1bwwvBCFR/g+6pHKGJUXm28Yc6bp
 3d6rRAcytCQed6r1XhS3MMao6uE8uMqS8Fp0t77Q=
Received: by mx.zohomail.com with SMTPS id 1768565590957333.70803249877406;
 Fri, 16 Jan 2026 04:13:10 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <2517b7be-af5b-48a8-a444-07e45701a48b@arm.com>
Date: Fri, 16 Jan 2026 09:12:53 -0300
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <84AA9AFD-4B0B-4036-92A2-CC0D21BAC8B2@collabora.com>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <2517b7be-af5b-48a8-a444-07e45701a48b@arm.com>
To: Steven Price <steven.price@arm.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External
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

Hi Steven, thanks for the review.

The things you pointed out are things I indeed missed. I=E2=80=99ll fix =
them on v2.

=E2=80=94 Daniel=
