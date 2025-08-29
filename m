Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F9B3B487
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E47310EB5F;
	Fri, 29 Aug 2025 07:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SRcbM9vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4914610EB55;
 Fri, 29 Aug 2025 07:40:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2699F6013F;
 Fri, 29 Aug 2025 07:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87859C4CEF0;
 Fri, 29 Aug 2025 07:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756453217;
 bh=Z94i9gHZhK9qlGBUPoapzmHdUDOpAXEMUEdUsunkD08=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SRcbM9vkSelOwSq6IZP2PMazztxRZDnSUI06RLcqTPbFfwmwKHXmmeFWSHRrIGTGD
 1ME9fJNxk4TcpvmyX8AJL6vGE8TzvwgRJoKt3QKn4YJh5/qPk+jWiwxjSf6FhL7X/w
 WSKs+i7C2OhJzVNWclwpoU3abXHOM/8lCPKrBADgcElIUTyCGCE4IYzpAM+Uxob7TQ
 uOMDkV1NBZq72uDieKHsWCMKEl73SH8uTEAwcJSol9U9sb4cuUV5PcOSpoWKcItyoJ
 uWAVHWnEXqIPEvWH+bLjDPXYhJXUh8z5FcuJmss7EhD/PD2xXy3Wf1rT44vlr8NmC/
 0lmo796T1dE5g==
Message-ID: <6f32c400-1f8c-4367-8be9-f7082ea87626@kernel.org>
Date: Fri, 29 Aug 2025 09:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] gpu: nova-core: Boot GSP to RISC-V active
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, apopple@nvidia.com,
 a.hindborg@kernel.org, airlied@gmail.com, alex.gaynor@gmail.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dri-devel@lists.freedesktop.org, gary@garyguo.net, jhubbard@nvidia.com,
 joelagnelf@nvidia.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, simona@ffwll.ch, tmgross@umich.edu,
 ttabi@nvidia.com, tzimmermann@suse.de,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20250827082015.959430-1-apopple@nvidia.com>
 <20250828083737.22214-1-ojeda@kernel.org>
 <DCEKTF8CP2GF.ED9G9ECQMBHM@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DCEKTF8CP2GF.ED9G9ECQMBHM@nvidia.com>
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

On 8/29/25 5:03 AM, Alexandre Courbot wrote:
> On Thu Aug 28, 2025 at 5:37 PM JST, Miguel Ojeda wrote:
>> On Wed, 27 Aug 2025 18:19:57 +1000 Alistair Popple <apopple@nvidia.com> wrote:
>>>
>>> This series builds on top of Alex's series[1] to continue initialising the GSP
>>> into a state where it becomes active and it starts communicating with the host.
>>
>> No big deal, but in case it helps since probably it was not intentional given
>> the rest of the people is there: the rust-for-linux Cc is missing.
> 
> This did happen to me once as well - should we add the rust-for-linux
> list to the Nova MAINTAINERS entry to protect against this?

I'm happy about every potential additional reviewer for Nova, but I'm not sure
it scales very well for the rust-for-linux if we get more drivers. :)
