Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A29BD7BAE3A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7672910E496;
	Thu,  5 Oct 2023 21:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F2310E496
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 21:57:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2369A61BB9;
 Thu,  5 Oct 2023 21:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2377FC433C7;
 Thu,  5 Oct 2023 21:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696543036;
 bh=vaHJxIHe4zRt2ghkUleXPakGs+EDbrcTc1rXqc3MsKg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KAE6vQh542k4VeuofajcdFNi7UAR0AHGTAwk6fcvUpWM5DwqusqTcyZnRQoWRSIR0
 wYjFVNuURnB1QjY/Qb9DF6Diq7rsAUmimE/zSlLYtW3USLdRgg3FEQIf6bVS/XGpfO
 I3WqidB3O7HNh59ixD49Rii8SrxWj9EhBNVYvMMhwFTMyWgl96grV8AbY0IkP+GTR+
 jU+Fo0j6zuMdYCTgMoYsXStu3ZbFLm8B7bomR77EVstC3H4dxtITqujpsNzF8Gf/D4
 hH+2Q9BqVILErLxtzHhW2TlCJLG7E/Z7A4yUhP7cErgkT0vFZqzp1dSM9sBTqlO04S
 +7f70D4DMQ42A==
Date: Thu, 5 Oct 2023 16:57:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [-next 4/5] drm/virgpu: Switch to pci_is_vga()
Message-ID: <20231005215714.GA792609@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230830111532.444535-5-sui.jingfeng@linux.dev>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In subject: "drm/virtio" to match previous history.

On Wed, Aug 30, 2023 at 07:15:31PM +0800, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> Should be no functional change, just for cleanup purpose.
> 
> Cc: David Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index add075681e18..3a368304475a 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -51,7 +51,7 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev->dev);
>  	const char *pname = dev_name(&pdev->dev);
> -	bool vga = (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
> +	bool vga = pci_is_vga(pdev);

This *is* a functional change: Previously "vga" was only true for
PCI_CLASS_DISPLAY_VGA (0x0300).  Now it will be true for both
PCI_CLASS_DISPLAY_VGA (0x0300) and PCI_CLASS_DISPLAY_OTHER (0x0380).

Is that desirable?  I can't tell.  Maybe the GPU folks will chime in.

>  	int ret;
>  
>  	DRM_INFO("pci: %s detected at %s\n",
> -- 
> 2.34.1
> 
