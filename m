Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1A2BAD0C7
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D3A10E0ED;
	Tue, 30 Sep 2025 13:26:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LshjHvtV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEFA10E0ED;
 Tue, 30 Sep 2025 13:26:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7AED240063;
 Tue, 30 Sep 2025 13:26:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EC5C4CEF0;
 Tue, 30 Sep 2025 13:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759238795;
 bh=9uUYAkvXqfJcBpvMO9hdwqzS2RzQlSDU/JccIeYevuA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LshjHvtVDNooSgvjmioIVN1ImWG59r81OXRd4hBWekJqFLE0HCZT9quaNlzyLD46o
 p/8TdIpFyrpSCmG1TYZ/DnTw3DUWFb3DVKgPyL8heAp6H1CmBoSBI0mrL7sQpM+Xnu
 mFg2XBxtwl+QpoSzgKl7iBHSwrKV/XKJeKEszxrlOF3H7V+TmCQ75ZfnA19WjyvjNV
 9v83yEQ1HA+NL1VoYgop0ogMl+8IzO+9HrJWHYMFc6X2OjSQpAFSejtTfgWRgHHYKt
 vP5Cu8/41lq4WwwotmDWpmBnqG8teEjd79MS1+O/+ZhBkD/bY6vqm8vdu6cxQ70IKH
 BwpejWhVkOn8A==
Message-ID: <fcd4a013-0eb7-4a3a-b916-1dc6c444225d@kernel.org>
Date: Tue, 30 Sep 2025 15:26:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/13] gpu: nova-core: Boot GSP to RISC-V active
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
References: <20250930131648.411720-1-apopple@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
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

On 9/30/25 3:16 PM, Alistair Popple wrote:
> Changes since v2:
> 
> The main change since v2 has been to make all firmware bindings
> completely opaque. It has been made clear this is a pre-requisite for
> this series to progress upstream as it should make supporting
> different firmware versions easier in future.
> 
> Overall the extra constructors and accessors add a couple of hundred
> lines of code and a few extra unsafe statements.

A bit of additional code is expected, but it's not clear to me why this would
require additional unsafe blocks.

Can you please elaborate?
