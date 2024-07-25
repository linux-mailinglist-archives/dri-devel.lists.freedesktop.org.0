Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D293C10B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 13:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BECC10E13B;
	Thu, 25 Jul 2024 11:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BD0C610E13B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 11:42:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9BFB1007;
 Thu, 25 Jul 2024 04:43:13 -0700 (PDT)
Received: from [10.1.196.44] (unknown [10.1.196.44])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D16E3F5A1;
 Thu, 25 Jul 2024 04:42:46 -0700 (PDT)
Message-ID: <68f0fdfc-8bc2-462d-9d0d-4d0ad41c6811@foss.arm.com>
Date: Thu, 25 Jul 2024 12:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
To: Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>, ojeda@kernel.org,
 Danilo Krummrich <dakr@redhat.com>, lyude@redhat.com, lina@asahilina.net,
 mcanal@igalia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
 <20240723180642.73502856@collabora.com>
 <6ce8fd12-b175-4a8f-8ea9-6221a555b69c@arm.com>
 <CAL_Jsq+Dr5zO5MKEGq0dW9SuTuawaJMhHziFd73Ef_S1zbOkXw@mail.gmail.com>
 <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
Content-Language: en-US
From: Carsten Haitzler <carsten.haitzler@foss.arm.com>
Organization: Arm Ltd.
In-Reply-To: <6b60a83d-8416-4cf8-b373-dc3c697c788a@arm.com>
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


>> We did discuss this, but I've come to the conclusion that's the wrong
>> approach. Converting is going to need to track kernel closely as there
>> are lots of dependencies with the various rust abstractions needed. If
>> we just copy over the C driver, that's an invitation to diverge and
>> accumulate technical debt. The advice to upstreaming things is never
>> go work on a fork for a couple of years and come back with a huge pile
>> of code to upstream. I don't think this situation is any different. If
>> there's a path to do it in small pieces, we should take it.
> 
> I'd be quite keen for the "fork" to live in the upstream kernel. My
> preference is for the two drivers to sit side-by-side. I'm not sure
> whether that's a common view though.

I agree that a panthor.rs should to exist side by side with the C for 
some time. I guess it's going to be in the order of a year or so (or 
maybe more) and not a few weeks, so keeping the C and Rust in sync will 
be important.

My take is that such drivers probably belong in non-mainline dev trees 
until they settle a bit, are at least fully functional and we're down to 
arguing finer details. Especially since the other Rust infra they depend 
on not mainline yet either.

Given that, my opinion is this patch probably needs to be originally in 
C then with a rust idiomatic port in the in-progress rust rewrite, or 
there needs to be a lot more effort to building the right panthor layers 
such as better register abstractions for example as part of this which 
certainly will raise the workload to get this in.
