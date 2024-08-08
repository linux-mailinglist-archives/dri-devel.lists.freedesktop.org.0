Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E494B858
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 09:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C23F10E685;
	Thu,  8 Aug 2024 07:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="mRmjICj0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5AE10E683;
 Thu,  8 Aug 2024 07:57:59 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4WffXz4Qytz9slv;
 Thu,  8 Aug 2024 09:57:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1723103875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zzZFMfNuViTfYHwErDY5YyAjZNT6A7h+prXOvsPN5Wk=;
 b=mRmjICj00ijZHMKicvNtcdbgW3F4At4Vy+l6gTzgbEmHoaJ77xFit2rpUeYRO23tuL0ro/
 2hGA5tAPaGZdPlBI3BXsgLvaPMHYMxxsluIg65WSdIpO8mHtKU7w9NS8J3G2cIUEkjqbgg
 3PWqib532ZU2JxgFOiPowwlbVwbZc7ujle8zwK3vqe4QxbRVMJUKpuK76NemhAPR1rsfeh
 UElJ2l8YsW9/610oo9212/Mv1cFHTPoGdZ8hHg6Wm0pYaQABVloMRz1asJNXjeqoiP/SvE
 G6Wl5u/wIVzobY4KGtR0VwSFD0WXpzbYoZC2kj4B9pY6qarIx415KsNEhPMC4Q==
Message-ID: <3c887552-282d-403d-8581-4cbcd8ad9069@mailbox.org>
Date: Thu, 8 Aug 2024 09:57:52 +0200
MIME-Version: 1.0
Subject: Re: [RFC] amdgpu: Add a context flag to disable implicit sync
To: Joshua Ashton <joshua@froggi.es>, amd-gfx@lists.freedesktop.org,
 Faith Ekstrand <faith@gfxstrand.net>, dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20240807153941.3668940-1-faith.ekstrand@collabora.com>
 <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA, de-CH-frami
In-Reply-To: <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: r8a6xjyz36uf8thdcrw3txoof9yj5bzn
X-MBO-RS-ID: f72af90d3347ddf28ed
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

On 2024-08-07 21:23, Joshua Ashton wrote:
> I was thinking about this more recently. I was initially considering "maybe this should be a per-BO import," but I couldn't think of anything in the GL model that would actually benefit given its not "true" bindless and there's no update-after-bind there.
> 
> Worth others more familiar with GL asking that question to themselves also. I am definitely not totally up on what's possible there.
> 
> Overall, I think I am OK with this approach, even though I think mixing implicit and explicit sync is gross, and I want the pain that is implicit sync to just go away forever. :-)

It can never go away, at least not in the drivers which have ever supported it. We can never break compatibility.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

