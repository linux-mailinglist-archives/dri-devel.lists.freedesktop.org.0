Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2418FA987E0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 12:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CFE10E208;
	Wed, 23 Apr 2025 10:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VvJat+yN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A3810E208
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 10:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J5kO8HOcTIEVYwvohRyo6zyhFztvJgpIS0+e5/7HALg=; b=VvJat+yNygjhbneEzwboF6I8hh
 bFTLP43ULTlE6/FTi+JXvWGVjk2DoAVxQbqCoReoAqSFhM7f3arueKj+42VtB5Umg6pOG00Fhs4gD
 2e7EFwVjF7c3CKqMdwMKeP0BcxYBPuYSvvF6Zk7EZrGBWBvTCrWJFOAOv5T77DWJHz6vqGAtPfHLM
 nVdozT3kTu8UrWwauMaKJVb3jtF01sNAcqbQ+zQ/YrBYYVyFJaGiLzLGZQzq8ATDms+nJ0qzOmoD9
 WeQt2beE0vYp1S2hoheFgJuVZ5Bs4ftCQpANOProNLVvlUhLYfe4Uvpd81uu+NQWzjLq1o8BiOUpu
 lSI0TU+A==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u7Xhu-006sMM-Db; Wed, 23 Apr 2025 12:51:58 +0200
Message-ID: <a6c2baa7-521f-4c9f-b6f8-ff18e35dd941@igalia.com>
Date: Wed, 23 Apr 2025 07:51:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor
To: Jagath Jog J <jagathjog1996@gmail.com>, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250421085907.24972-1-jagathjog1996@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Jagath,

On 21/04/25 05:59, Jagath Jog J wrote:
> This patch updates the MIPI DBI driver to use drm_device.debugfs_root
> instead of drm_minor for creating debugfs files. The debugfs setup is now
> done earlier in probe(), before drm_dev_register(), and the drivers can
> avoid using the .debugfs_init callback.
> 
> This is an initial version, and only a few drivers are updated for now.
> 
> I noticed that some newer drivers or patches still use
> drm_debugfs_create_files(), which relies on drm_minor. I was wondering if
> there is a specific reason for this, or if there's a plan to switch to
> drm_debugfs_add_files? I can send patches to update more drivers if
> that helps.

Yes, there was a plan to switch to drm_debugfs_add_files(), as it
centers the debugfs files management on the drm_device instead of
drm_minor.

But, in the end, we concluded that we needed a few more changes in the
infrastructure to make things more generic. Here are some discussions
[1][2] and this was my plan to make things more generic [3], which
needed some improvements.

It would be create if you help us to cleanup debugfs and feel free to
use my patches as a base for it.

[1] 
https://lore.kernel.org/dri-devel/20230209081838.45273-1-christian.koenig@amd.com/
[2] https://lore.kernel.org/dri-devel/87eds0gm9b.fsf@intel.com/
[3] 
https://lore.kernel.org/dri-devel/20230131195825.677487-1-mcanal@igalia.com/

Best Regards,
- Maíra

> 
> This patch helps move toward the debugfs cleanup task listed here:
> https://docs.kernel.org/gpu/todo.html#clean-up-the-debugfs-support
> 
> Looking forward to your feedback.
> 
> Jagath Jog J (1):
>    drm/mipi-dbi: Use drm_device for debugfs, drop drm_minor and
>      .debugfs_init
> 
>   drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
>   drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
>   drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
>   include/drm/drm_mipi_dbi.h            | 4 ++--
>   4 files changed, 10 insertions(+), 8 deletions(-)
> 

