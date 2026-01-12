Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C7DD11B20
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 11:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E301310E0DC;
	Mon, 12 Jan 2026 10:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GLo7Tw3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846CC10E316
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1768212170;
 bh=l0pv5pZ/xVnRRZcmyOOTRtfEyklwaw4RDdM9CvaIT6Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GLo7Tw3KqP3Eh/veXc8DC7dOZX+4jgHJWeF18Yvc4sh759WqvuvrF8qrNzWchqdCK
 tO8EuvRyNVkCZG0KMoQHKws7I+PnQXNu7+jJP0bgA6hYMifdqz6MxaoVda5wYi7+zi
 LqYXEID5y0VUy3+DYZPrS58ISnelsQktyrIaaQI65EU4EFo0dQMfBUPnwJ/zZr6Db7
 V+9rsm2hH2NNnep2Yb9tOrQnk3duF+mBUB+k4N8q0Z8lItbBHU/hqGfeM3UVeweIfD
 CTQ+YV1mDCNTU0XyZLgrjen1/0F7ZJlas98kueO8HO0BXv4TPBCsftK0d5Iyto95YO
 immHd3GawtijQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F34E17E0E30;
 Mon, 12 Jan 2026 11:02:49 +0100 (CET)
Date: Mon, 12 Jan 2026 11:02:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 "=?UTF-8?B?QWRyacOhbg==?= Larumbe" <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dmitry
 Osipenko <dmitry.osipenko@collabora.com>, Chris Diamand
 <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?="
 <thomas.hellstrom@linux.intel.com>, kernel@collabora.com
Subject: Re: [PATCH v1 1/9] drm/gem: Consider GEM object reclaimable if
 shrinking fails
Message-ID: <20260112110243.6d2a762b@fedora>
In-Reply-To: <aWS98P5ocWn8GmJk@google.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-2-boris.brezillon@collabora.com>
 <aWS98P5ocWn8GmJk@google.com>
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

On Mon, 12 Jan 2026 09:25:04 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Fri, Jan 09, 2026 at 02:07:53PM +0100, Boris Brezillon wrote:
> > If the object wasn't moved to a different LRU after the shrink callback
> > is called, it means the buffer is still reclaimable. Update the remaining
> > counter to reflect that.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Should this have a Fixes:?

If we wanted one, that would be e7c2af13f811 ("drm/gem: Add LRU/shrinker
helper"), but I'm still not sure what the original intent was, so let's
wait for Rob to confirm that a transient reclaim failures (most likely
an inner lock that couldn't be acquired with a _try_lock()) should count
as reclaimable.
