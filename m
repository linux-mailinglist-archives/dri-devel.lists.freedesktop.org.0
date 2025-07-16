Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92032B073A5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 12:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA42610E275;
	Wed, 16 Jul 2025 10:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="B7hYPd0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB7710E275
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 10:40:41 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bhsys4LmDz9t74;
 Wed, 16 Jul 2025 12:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1752662437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wXRQmJDPVKJRTM9t2/aWWBgsSj1CebZBIyG26mAoACM=;
 b=B7hYPd0sXGdusAka78IUvduxe0Ci1p+1oHluDY03ol10uUz+fenwc70EG27+o+sdiki/p9
 grQxAW1HOEmefALZQMCJ/ZgxucS/k9m4RqwN5KSc6MfiDautBp1TkkdZRLdeON/L1tUb/6
 NIbUDCHgpxodT8SJ3mKpvFij4FcvvPpfQ82hWzMA5+kZRquCmcofle1igFv/vY8utkgFer
 2CnLWIFGPHE9D3TY+zyU6aOY81+9vjN3MoB36XLSTvTfqBmcJRGjvwfz41yP5YUNvt+6sc
 U3j4qLvOQmelWWEjZjiHTTZJ7ks2TyANAdnoUDC9fMQvyg/ZB3+MVKdnxZQ4wA==
Message-ID: <fd46ca0c-e484-4bf8-b74e-0139ecc7deae@mailbox.org>
Date: Wed, 16 Jul 2025 12:40:35 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
To: phasta@kernel.org, "cao, lin" <lin.cao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a53cba667e746d60af1
X-MBO-RS-META: sfpp931esq7hpzddyk8yf3iqdnpiykeq
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

On 16.07.25 11:57, Philipp Stanner wrote:
> On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
>>
>> Hi Philipp,
>>
>>
>> Thank you for the review. I found that this optimization was
>> introduced 9 years ago in commit
>> 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu: drop a dummy
>> wakeup scheduler").
>>
>>
>> Given that the codebase has undergone significant changes over these
>> 9 years. May I ask if I still need to include the Fixes: tag?
> 
> Yes. It's a helpful marker to see where the problem comes from, and it
> adds redundancy helping the stable-kernel maintainers in figuring out
> to which kernels to backport it to.
> 
> If stable can't apply a patch to a very old stable kernel because the
> code base changed too much, they'll ping us and we might provide a
> dedicated fix.
> 
> So like that:
> 
> Cc: stable@vger.kernel.org # v4.6+
> Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")

FWIW, Fixes: alone is enough for getting backported to stable branches, Cc: stable is redundant with it.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
