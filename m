Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D11AA10D5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 17:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD2410E42F;
	Tue, 29 Apr 2025 15:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="xxb8BlVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5FA10E41C;
 Tue, 29 Apr 2025 15:45:53 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4Zn4R1679vz9sWv;
 Tue, 29 Apr 2025 17:45:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1745941549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTYjbV/MDAWDkS2/t+aK1fFbqy8CSFFW73mvCcl3Oj0=;
 b=xxb8BlVjq4sbTXLHAn/dIJjs7tRP1TwQs9vQFnWCPX0huwWmXcX1Vv/g0Gook67/Xe2jjC
 frWwoHnEV012xtbmndd5phBgjeXZ3jtMMyqmAPTGfdqDqwDSGR9Gis4+GDuMbEJx1ZUnkD
 Gd11ZsbLnxl+wQazh6YNYuqDx+5GKT20Nj2gtEe/+5WcTzufiKc6OTEeLaiO8ukeFaDGZV
 +4bTPnuR5BVxbf/+5B8FifjhyjTuGzzFtzUh63b29P8zTX9Syz3DUuH1T+je+cjxcW/iDR
 cWj8DV7S2aIjmYoR9M05eMJ4r+C4ULYXIXFTfbvj6rl7APjYoubZ95VswqkjGg==
Message-ID: <14d92cbe-fea0-478e-8b82-bc3a4ba26609@mailbox.org>
Date: Tue, 29 Apr 2025 17:45:47 +0200
MIME-Version: 1.0
Subject: Re: [RFC v4 01/16] drm/sched: Add some scheduling quality unit tests
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-2-tvrtko.ursulin@igalia.com>
 <10501127-0315-45bc-96ed-f48c3af957ef@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <10501127-0315-45bc-96ed-f48c3af957ef@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8pfxagbd88njzyftbhygzk4qim7qkyse
X-MBO-RS-ID: a94099c060815072b35
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

On 2025-04-29 17:03, Christian König wrote:
> On 4/25/25 12:20, Tvrtko Ursulin wrote:
>> Note that the PCT and CPS metrics are irrelevant for "unsync" clients
>> since they manage to complete all of their cycles instantenuously.
> 
> Typo instantanuously.

Make that "instantaneously".


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
