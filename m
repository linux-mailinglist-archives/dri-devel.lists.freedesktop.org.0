Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9E5D24FB9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 15:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD39810E76E;
	Thu, 15 Jan 2026 14:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="XoS+K99P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6276E10E76E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768487853;
 bh=jJVP0yFbsXRRt29hclR7GFaexk+4oCXVqvZMbdruvHw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XoS+K99PYD97ummEjcA6o+M8RnrIovvXEgqtDG2Wtf+RHxydDLfTLfoojRK3GGjhZ
 eqanstnh2jMitpVH+6j/Mv+8yWKBwh0+JEhyoP+Ol1pYdQB9VZHOpgrsNMZTX8jire
 g6xnJeNVxpEnxZcempfzFBZ+yx38EVvDZ0qE+Z0DD+VZHld6+fdfEKfBjgui3uhAPf
 tqVIPWaS/w3POmllhdMlm7EM3BQJQj4s9NB1rqbIO5updqGZysfIyeUamedvX9RF/E
 FS81CbpHNhuNGJXHeJaH4ejLtpN8s06w8mPYWcZIs83UO18smn/tBdivlWFhH4QSBg
 hh6BNjZ9ja7rA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 40DDE17E10F8;
 Thu, 15 Jan 2026 15:37:32 +0100 (CET)
Date: Thu, 15 Jan 2026 15:37:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean
 Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P
 Oommen <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v1 9/9] drm/panthor: Add a GEM shrinker
Message-ID: <20260115153727.0641bb38@fedora>
In-Reply-To: <b92d0548-25ed-4530-99cc-6b8a9fbe70b3@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-10-boris.brezillon@collabora.com>
 <b92d0548-25ed-4530-99cc-6b8a9fbe70b3@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 15 Jan 2026 13:56:42 +0000
Akash Goel <akash.goel@arm.com> wrote:

> > +int panthor_gem_shrinker_init(struct panthor_device *ptdev)
> > +{
> > +	struct shrinker *shrinker;
> > +
> > +	drmm_mutex_init(&ptdev->base, &ptdev->reclaim.lock);  
> 
> Please consider checking the return value of drmm_mutex_init().

I will.
