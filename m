Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9816EAA69D3
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 06:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F70D10E178;
	Fri,  2 May 2025 04:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.b="OEyEgfhc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CD310E178
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 04:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=W75ohiwgzQ2b4Y0vvPNQDeN3F8noVVK8UMQcA0s5vW0=; b=OEyEgfhcNYmmukh/cCmF4Bur9J
 5TTFFRKRoVZ1LiLz7O7//pNumoM24E8Wx8vZhRuvwWy43xbSQ1eS6SC9bBM2caxDUEYVSFjT1w47X
 mfbtBNqT90EZBKa2Tyac93FtVBihVucsJvBfOxhUWHPXnBY6Nvwoyk+UvL56AafW1RcdBzneytf66
 DRycb8i1SmCr4CqHlBHS3uZrSpwmGdsCgf1L7xrgmOF2Dkc459bOOnSyKrTMS0coNy/1xpNjfRiP0
 EQr6KhDUW8txsF5hMzriQ+EklzGxzfLDABykVEeQQPWHcjB3f/0AYPCtViTNQcdxWWjyeTrlsh8iO
 AgVJ5zGA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat
 Linux)) id 1uAi3x-0000000FpJU-2zcC; Fri, 02 May 2025 04:31:49 +0000
Date: Fri, 2 May 2025 05:31:49 +0100
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
Message-ID: <20250502043149.GW2023217@ZenIV>
References: <20250502002437.it.851-kees@kernel.org>
 <aBQqOCQZrHBBbPbL@lstrano-desk.jf.intel.com>
 <20250502023447.GV2023217@ZenIV>
 <aBRJcXfBuK29mVP+@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBRJcXfBuK29mVP+@lstrano-desk.jf.intel.com>
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

On Thu, May 01, 2025 at 09:26:25PM -0700, Matthew Brost wrote:

> I;m fairly certain is just aliasing... but I do understand a file cannot
> be embedded. Would comment help here indicating no other fields should
> be added to ttm_backup without struct file be converted to pointer or
> that just to risky?

What exactly are you trying to do there?  IOW, is that always supposed to
be a struct file, or something dependent upon something in struct ttm_tt
instance, or...?

And what is the lifecycle of that thing?  E.g. what is guaranteed about
ttm_backup_fini() vs. functions accessing the damn thing?  Are they
serialized on something/tied to lifecycle stages of struct ttm_tt?
