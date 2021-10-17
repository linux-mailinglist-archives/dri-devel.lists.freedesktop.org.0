Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55265430BEA
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 22:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A252C6E529;
	Sun, 17 Oct 2021 20:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
 [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240256E027;
 Sun, 17 Oct 2021 20:04:00 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout3.hostsharing.net (Postfix) with ESMTPS id DD8E6100CF137;
 Sun, 17 Oct 2021 22:03:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id BC299233EA6; Sun, 17 Oct 2021 22:03:55 +0200 (CEST)
Date: Sun, 17 Oct 2021 22:03:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Nirmoy Das <nirmoy.das@amd.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/4] vgaswitcheroo: do not check for NULL debugfs dentry
Message-ID: <20211017200355.GA3480@wunner.de>
References: <20211013183601.16514-1-nirmoy.das@amd.com>
 <20211013183601.16514-4-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013183601.16514-4-nirmoy.das@amd.com>
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

On Wed, Oct 13, 2021 at 08:36:01PM +0200, Nirmoy Das wrote:
> Debugfs APIs returns encoded error on failure so use
> debugfs_lookup() instead of checking for NULL.

The commit message no longer matches up with the patch itself
(debugfs_lookup() isn't called).

My suggestion would be something like:

  Retry creation of the vga_switcheroo debugfs if a previous
  invocation of debugfs_create_dir() returned an error code.

With that addressed,
Reviewed-by: Lukas Wunner <lukas@wunner.de>

Thanks,

Lukas

> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>  drivers/gpu/vga/vga_switcheroo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
> index 365e6ddbe90f..07ab8d85e899 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -914,7 +914,7 @@ static void vga_switcheroo_debugfs_fini(struct vgasr_priv *priv)
>  static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
>  {
>  	/* already initialised */
> -	if (priv->debugfs_root)
> +	if (priv->debugfs_root && !IS_ERR(priv->debugfs_root))
>  		return;
> 
>  	priv->debugfs_root = debugfs_create_dir("vgaswitcheroo", NULL);
> --
> 2.32.0
