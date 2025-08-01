Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369DB17EB5
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 11:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C3810E804;
	Fri,  1 Aug 2025 09:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AI2d9u7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BFF10E804
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 09:00:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DD98443F5C;
 Fri,  1 Aug 2025 09:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E0EC4CEE7;
 Fri,  1 Aug 2025 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754038817;
 bh=fWPKNnaX5uTj9m87UtZaRk7qwv0U/J5aGdkXKnx0kmk=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=AI2d9u7GEhdHDUvT62m95R0mTiBVyzjU3eMhjNV0RIKDjCQmTY83/1ELsYyMZm7Ig
 nyRUvDbnOOuhBTG3F5ANWyrergDXiGgiHbM/Jsll4uTJkwBYDhmf2RtAJ6pzA7Nxny
 tyEE5wusDL5llWMoTty194W8AUW4SgIB6bRdRdvf9gTeR5nhzpp/dgiUlXXvyFhj/3
 IRMkrMlLW2/Jol63ECWaACUow3X6uRVslrJKOFq6jE9wb9LNpoS8sSh2EnJZd55iIT
 tKO5vY37kcS5ewvVilysUUHMQa1ptd0K7iEMnVZ6BoOJiJqgs2dZSLbom2Lz/J9gUe
 K8h4JZnsIuybg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Aug 2025 11:00:12 +0200
Message-Id: <DBQYV65GPE9H.34LFC8IDBDIWQ@kernel.org>
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] rust: drm: remove pin annotations from drm::Device
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-4-dakr@kernel.org>
 <DBQGW0NIQJRX.MU0QD5GMFJYM@kernel.org>
 <DBQY1S7V8IIS.3NCGOZ8ALU7QG@kernel.org>
In-Reply-To: <DBQY1S7V8IIS.3NCGOZ8ALU7QG@kernel.org>
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

On Fri Aug 1, 2025 at 10:21 AM CEST, Danilo Krummrich wrote:
> On Thu Jul 31, 2025 at 8:54 PM CEST, Benno Lossin wrote:
>> On Thu Jul 31, 2025 at 5:48 PM CEST, Danilo Krummrich wrote:
>>>  #[repr(C)]
>>> -#[pin_data]
>>>  pub struct Device<T: drm::Driver> {
>>>      dev: Opaque<bindings::drm_device>,
>>> -    #[pin]
>>>      data: T::Data,
>>
>> Looking at this code again, I also noticed that it was wrong before this
>> patch: `Device<T>` implemented `Unpin` if `T::Data` did which is most
>> likely wrong (or is `drm_device` not address sensitive?).
>
> It is, but as mentioned above a drm::Device only ever exists as
> ARef<drm::Device>.

Yeah the `Unpin` thing isn't a problem for `ARef`, but we are
theoretically allowed to implement moving out of an `ARef` (given that
it is unique) when the type is `Unpin`.

Thanks for confirming.

---
Cheers,
Benno
