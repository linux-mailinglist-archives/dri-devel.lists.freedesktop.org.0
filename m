Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090427DCED1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 15:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6A610E4EF;
	Tue, 31 Oct 2023 14:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C1E10E4EF;
 Tue, 31 Oct 2023 14:14:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4SKXFF4XkLz9ssn;
 Tue, 31 Oct 2023 15:14:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1698761649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bqC9c+sU9JDTiZJ7qIux6Y3JOwE5dKCDYKG8uunM9Y=;
 b=HjXIDCSt8CywpkFG+F33xwf2Hm83z33SefUPMG/KMhgbuUBfWVoeW4P6vkEHmmpEAV6weN
 b5sjP0REhuarGVW/QXcun5exnJx0VVgXSSQsrSeJ6os0Gn/dRGphR2f+Gen/Zsb6q1zDrB
 Ghh+7x6NEL3146RXF8J9lnSXtkOLYNQWaWt5eVQqjCG4eu5FeUNsJCQBwVSXZouAEXD6Cf
 9SUKkGQGNYd7+L+AivARrNdPR9D4o8AEiG+RPB2vSLXZrGzRYVEkhHK5Wxf3/Z6+6XdFHl
 DEAM+VqwwxAsXsIH9ulGDf2xhQsSDXUh4y/n2J+AiIPUMoV0Aa8hsmo1rDpqlg==
Message-ID: <454e7d7f-8a23-58bd-8822-55c13beba97f@mailbox.org>
Date: Tue, 31 Oct 2023 15:14:07 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 5/6] drm/amdgpu: Add flag to disable implicit sync for GEM
 operations.
Content-Language: en-CA
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-6-ishitatsuyuki@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20231031134059.171277-6-ishitatsuyuki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: j43hxay7skeyn1g3ym1b5xqsmce6ixi6
X-MBO-RS-ID: 5c0d9d222a7955de2b2
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/31/23 14:40, Tatsuyuki Ishi wrote:
> In Vulkan, it is the application's responsibility to perform adequate
> synchronization before a sparse unmap, replace or BO destroy operation.
> Until now, the kernel applied the same rule as implicitly-synchronized
> APIs like OpenGL, which with per-VM BOs made page table updates stall the
> queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag allows
> drivers to opt-out of this behavior, while still ensuring adequate implicit
> sync happens for kernel-initiated updates (e.g. BO moves).
> 
> We record whether to use implicit sync or not for each freed mapping. To
> avoid increasing the mapping struct's size, this is union-ized with the
> interval tree field which is unused after the unmap.
> 
> The reason this is done with a GEM ioctl flag, instead of being a VM /
> context global setting, is that the current libdrm implementation shares
> the DRM handle even between different kind of drivers (radeonsi vs radv).

Different drivers always use separate contexts though, even with the same DRM file description, don't they?

FWIW, RADV will also want explicit sync in the CS ioctl.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

