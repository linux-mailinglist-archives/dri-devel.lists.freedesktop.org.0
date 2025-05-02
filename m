Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A81AA6A33
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 07:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2F010E0C8;
	Fri,  2 May 2025 05:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="nHiTyhPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2CC10E0C8
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 05:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hzgdBBFVb2afs7rV1/nonnhn5rBLC4WuS1ohmWy9rS4=; b=nHiTyhPmVDGGP9m2sWl/Lr9UVR
 d/IfvdDgm84kuFzmT4ag21cNVTYWNxYCJXJC5SWb8Res4OqI2kkTb1LOgQ0/7yyyWz4laPYeKsZea
 aSnLtZMAQniv3cnXHMioDIcqj3cAJfQfXOeSQjn+MGME9qssELtNtlN7YQSMKD8A3IzMfj3G+BO3J
 9tPSyXg9y7FM39wR3kx4D1YA6BAIVtFh3g851GsZL7WwmZA5+qHvDZ+fuUQlCTO0tkQieLwtC5aVu
 r+sFESrff9cy145Q2qav74k0ATmjRw66bS/1Goqoq/+JJ2mvI60vomry1Y+wy6CITYzHrPrDGj/Ne
 Eoku8xYw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uAj1D-0000000G9G0-4AEJ; Fri, 02 May 2025 05:33:04 +0000
Date: Fri, 2 May 2025 06:33:03 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Kees Cook <kees@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v2] drm/ttm: Silence randstruct warning about casting
 struct file
Message-ID: <20250502053303.GX2023217@ZenIV>
References: <20250502002437.it.851-kees@kernel.org>
 <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
 <20250502023447.GV2023217@ZenIV>
 <aBRJcXfBuK29mVP+@lstrano-desk.jf.intel.com>
 <20250502043149.GW2023217@ZenIV>
 <aBRPeLVgG5J5P8SL@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBRPeLVgG5J5P8SL@lstrano-desk.jf.intel.com>
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

On Thu, May 01, 2025 at 09:52:08PM -0700, Matthew Brost wrote:
> On Fri, May 02, 2025 at 05:31:49AM +0100, Al Viro wrote:
> > On Thu, May 01, 2025 at 09:26:25PM -0700, Matthew Brost wrote:

> > And what is the lifecycle of that thing?  E.g. what is guaranteed about
> > ttm_backup_fini() vs. functions accessing the damn thing?  Are they
> > serialized on something/tied to lifecycle stages of struct ttm_tt?
> 
> I believe the life cycle is when ttm_tt is destroyed or api allows
> overriding the old backup with a new one (currently unused).

Umm...  So can ttm_tt_setup_backup() be called in the middle of
e.g. ttm_backup_drop() or ttm_backup_{copy,backup}_page(), etc.?

I mean, if they had been called by ttm_backup.c internals, it would
be an internal business of specific implementation, with all
serialization, etc. warranties being its responsibility;
but if it's called by other code that is supposed to be isolated
from details of what ->backup is pointing to...

Sorry for asking dumb questions, but I hadn't seen the original
threads.  Basically, what prevents the underlying shmem file getting
torn apart while another operation is using it?  It might very well
be simple, but I had enough "it's because of... oh, bugger" moments
on the receiving end of such questions...
