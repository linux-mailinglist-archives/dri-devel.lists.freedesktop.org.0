Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FFC429826
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 22:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DCA6E959;
	Mon, 11 Oct 2021 20:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 369 seconds by postgrey-1.36 at gabe;
 Mon, 11 Oct 2021 20:30:40 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A846E959;
 Mon, 11 Oct 2021 20:30:40 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id B427F28071C43;
 Mon, 11 Oct 2021 22:24:29 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id A71CA5755E; Mon, 11 Oct 2021 22:24:29 +0200 (CEST)
Date: Mon, 11 Oct 2021 22:24:29 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Nirmoy Das <nirmoy.das@amd.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/4] vgaswitcheroo: do not check for NULL debugfs dentry
Message-ID: <20211011202429.GC14357@wunner.de>
References: <20211011190607.104618-1-nirmoy.das@amd.com>
 <20211011190607.104618-4-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011190607.104618-4-nirmoy.das@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Oct 11, 2021 at 09:06:07PM +0200, Nirmoy Das wrote:
> Debugfs APIs returns encoded error on failure so use
> debugfs_lookup() instead of checking for NULL.
[...]
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -914,7 +914,7 @@ static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv)
>  static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
>  {
>  	/* already initialised */
> -	if (priv->debugfs_root)
> +	if (debugfs_lookup("vgaswitcheroo", NULL))
>  		return;
> 
>  	priv->debugfs_root = debugfs_create_dir("vgaswitcheroo", NULL);

If debugfs_create_dir() returns an error code, it does make sense to
retry the call when another vga_switcheroo client registers later.
I like that.

However I'd prefer simply changing this to explicitly check for NULL, i.e.:

-	if (priv->debugfs_root)
+	if (priv->debugfs_root == NULL)

It's just as clear as calling debugfs_lookup() and it has way less
overhead.  Granted, this isn't a hot path, but it's called on boot,
and the less code we execute, the faster the machine boots.

Thanks,

Lukas
