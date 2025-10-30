Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1E1C20BAF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F7D10E9D0;
	Thu, 30 Oct 2025 14:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eQk1KEPL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BFA10E9CF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 14:51:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 209D5611A5;
 Thu, 30 Oct 2025 14:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A797C4CEF1;
 Thu, 30 Oct 2025 14:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761835912;
 bh=WKwjBQEqXFPKO+WzYJAtU397ptDKk7qO+md5aDf4qeI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eQk1KEPLZSr8AEWd/EU8u+Rrrky9aVBOpC7OJb24MtNAy8lk0RV3tvhMD4m4ACHgr
 fMlATft9Er2BS36a8xMX9gPc8K4bBTSuSpOK5p3EBHonicaJ4mGIeI7f3kztqcEmTe
 SRD8UsdgXC55zByvBL2GPf9BGZR+5Z6bCWvWJ48Guof+RmgX8uZh/na2+7gRavwx5/
 5rqNlDqOvtDtHZ7DFY/4iS63rM4nUKvfa0DBlZL9xCA/LxOOXy0Wuh1dST1pH8CTe/
 Ds9vTfVN/js3WH8pZd2wSp+qSUJy5qicslENSC1jFjvj8vnfDDjb5Z40aSUNg9UkYL
 AfUfkjCtX7Bqg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Oliver Mangold <oliver.mangold@pm.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Benno
 Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman
 <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, Leon
 Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Asahi Lina
 <lina+kernel@asahilina.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, Oliver Mangold
 <oliver.mangold@pm.me>
Subject: Re: [PATCH v12 0/4] New trait OwnableRefCounted for ARef<->Owned
 conversion.
In-Reply-To: <20251001-unique-ref-v12-0-fa5c31f0c0c4@pm.me>
References: <20251001-unique-ref-v12-0-fa5c31f0c0c4@pm.me>
Date: Thu, 30 Oct 2025 15:51:38 +0100
Message-ID: <87v7jw8mth.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
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

Hi Oliver,
Oliver Mangold <oliver.mangold@pm.me> writes:

> This allows to convert between ARef<T> and Owned<T> by
> implementing the new trait OwnedRefCounted.
>
> This way we will have a shared/unique reference counting scheme
> for types with built-in refcounts in analogy to Arc/UniqueArc.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>

I rebased your series on top of v6.18-rc3 and pushed it here [1]. I also
added some commits with review feedback.

Best regards,
Andreas Hindborg

[1] https://github.com/metaspace/linux/tree/ownable-v12

