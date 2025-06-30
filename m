Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D8AEE2F1
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 17:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2593D10E49C;
	Mon, 30 Jun 2025 15:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a4ylB0Au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC2010E0B5;
 Mon, 30 Jun 2025 15:43:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EDDA745D2B;
 Mon, 30 Jun 2025 15:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BBBC4CEE3;
 Mon, 30 Jun 2025 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751298231;
 bh=FOffP837AZnxr3Cf3oXVoWZpuKRjIGbq0zA+f2kxS84=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a4ylB0AuIbou16df+1m7yjyLB8eVWeIJO2yvajmw6JYBRiP1WMMPflnAsna06GNjA
 Sqw+n0UBzQRjF1LwWjkPC1mHh1AyHbvjHw7UGsn0NxwfzU5rSkHXVZEhIll3q8uNQe
 Ingvk07sB2oU3zV+yaJkVw7+j54y+SeSdpyVNz+04U7SJ9TnYxYnJs5z22zlz4YQHp
 MyJ1MqpGzTdpIfBaLWNx/6AN8yUrwpYjs6JpPWtDC3IDW64Yvl3n8qMa5nEmyOOtro
 FvO/EEOH7d8lqu7ljW1GaI7cQzSE/LdkWoEHPTxkwFSs4bpRTvGCcM/784SgyjPOrK
 RKr+yRjFie5Lw==
Message-ID: <324c842b-e110-4e15-b058-9238a9ee598a@kernel.org>
Date: Mon, 30 Jun 2025 17:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/24] nova-core: run FWSEC-FRTS to perform first stage
 of GSP initialization
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Benno Lossin <lossin@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>, Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
 <aFnArVIFkHCUzNqe@pollux> <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DAUFC932W5MR.Q13BFD3CYEKJ@nvidia.com>
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

On 6/24/25 4:56 AM, Alexandre Courbot wrote:
> On Tue Jun 24, 2025 at 6:01 AM JST, Danilo Krummrich wrote:
>> There's one thing that would be nice to fix subsequently, which is properly
>> resetting the GPU. Currently, it needs a power cycle to be able to probe
>> successfully after unbinding the driver.
> 
> Yes, what I usually do is the following after unloading Nova:
> 
>      echo 1 | sudo tee /sys/bus/pci/devices/0000:01:00.0/reset
> 
> and this allows it to probe again. Maybe we want to add some equivalent
> programmatically in the driver probe function?

Probably -- how are things implemented on the GPU side of things? Is the GPU
firmware surviving a FLR?
