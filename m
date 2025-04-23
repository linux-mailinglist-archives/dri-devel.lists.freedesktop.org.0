Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D7BA986CC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 12:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB73E10E678;
	Wed, 23 Apr 2025 10:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MsNxFvHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2234B10E678;
 Wed, 23 Apr 2025 10:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s2eCtmfOmTzeDrwqg2IblJsu4TJiDRVJHiz8t8i45lg=; b=MsNxFvHgStw+2qqiRpo+d2Oyx7
 jdAJCtcSrzGYxkHbKSZb9h0N+i9XjLVukoF0p+J4YpTyZRBrxp6DjABlERqJIeHjm2rbN+15hxWKS
 9g1oEnoxDNpsrgVWRAEmUu5O55JCvEpoZRDUFq0xVY04GAaT+0GEv7BY1gOjQ6/PhSRvkzooCi2VN
 ReWvZlctNjWFf22WSjF2NLl+MVcxCOIlh3OvGPvbAf3fDgPjSQwdITrDqzMlqSj00SfVUkUigKjR4
 zwK7FUcWTR6re7Wtdl3y0D8IRO2MRXYqx16dhRT/wEjVulfB9+JPyBOrYVlBUmw2R84gPeZjtAM9E
 yLWUizrA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u7X48-006rXZ-Dz; Wed, 23 Apr 2025 12:10:52 +0200
Message-ID: <893b1d5e-7940-4abb-97bb-57f9ee2916cc@igalia.com>
Date: Wed, 23 Apr 2025 11:10:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: Danilo Krummrich <dakr@kernel.org>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
 <aAetRm3Sbp9vzamg@cassiopeiae>
 <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com> <aAipUTTQuv9MXoTA@pollux>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aAipUTTQuv9MXoTA@pollux>
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


On 23/04/2025 09:48, Danilo Krummrich wrote:
> On Wed, Apr 23, 2025 at 08:34:08AM +0100, Tvrtko Ursulin wrote:
>>
>> IMO it is better to leave it. Regardless of whether it was added because
>> some driver is actually operating like that, it does describe a _currently_
>> workable option to avoid memory leaks. Once a better method is there, ie.
>> FIXME is addressed, then it can be removed or replaced.
> 
> I'm not willing to sign off on encouraging drivers to rely on scheduler
> internals -- also not in this case, sorry.
> 
> Our primary goal with the scheduler is to *remove* such broken contracts where
> drivers rely on scheduler internal implementation details, mess with scheduler
> internal data structures etc. This is clearly a step back.
> 
> And AFAICT, as by now drivers either do a) or simply nothing (with the exception
> of the mock scheduler). Drivers can do a) in the meantime, there's no reason at
> all to additionally offer b).

What mechanism do we currently have to enable using a), and which you 
would not consider needing knowledge of scheduler internals?

Regards,

Tvrtko

