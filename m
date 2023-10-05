Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD38B7BAEA6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 00:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F019310E499;
	Thu,  5 Oct 2023 22:10:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7413710E499
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 22:10:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D3B1561B6C;
 Thu,  5 Oct 2023 22:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB93C433C7;
 Thu,  5 Oct 2023 22:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696543851;
 bh=UoU4cn3m/iQDeTvZ6sJCJc+J83ON7noH/i6xOi4WLLw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=N+1tqzKxM8k5U6oPZNf+PbjiiKdMm854tLVYikTTC5eIDDeVyg+N+NTEIrli6XAe9
 AYJvP4opqpuj/fwoMKh9l3oTV2QNACLfQNXHsca4VUbGX/t7yMWk1ahpiMV16G3KI2
 gVxDw5TYrM003BVXZYcEqNJi6Vf6nVXVw44yULSR14G2i/UPDrXwH3zM2QxvlfqlaT
 vKWPyNRZK4xcdUICXbjPso4zu+95Lit1pfcb3uTNBnaEqfpU0++MC6xignIlkdGzMh
 lJLcoGIjhWwBePNWlzuSPrTtXJkEPpJFxq3ht7XnhWrObZP78PjziFHLMjYQ0GcThX
 Ikd5tEHIkCbqA==
Date: Thu, 5 Oct 2023 17:10:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [-next 4/5] drm/virgpu: Switch to pci_is_vga()
Message-ID: <20231005221049.GA793091@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005215714.GA792609@bhelgaas>
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

On Thu, Oct 05, 2023 at 04:57:14PM -0500, Bjorn Helgaas wrote:
> In subject: "drm/virtio" to match previous history.
> 
> On Wed, Aug 30, 2023 at 07:15:31PM +0800, Sui Jingfeng wrote:
> > From: Sui Jingfeng <suijingfeng@loongson.cn>
> > 
> > Should be no functional change, just for cleanup purpose.
> > 
> > Cc: David Airlie <airlied@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> > Cc: Chia-I Wu <olvaffe@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > index add075681e18..3a368304475a 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > @@ -51,7 +51,7 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev)
> >  {
> >  	struct pci_dev *pdev = to_pci_dev(dev->dev);
> >  	const char *pname = dev_name(&pdev->dev);
> > -	bool vga = (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
> > +	bool vga = pci_is_vga(pdev);
> 
> This *is* a functional change: Previously "vga" was only true for
> PCI_CLASS_DISPLAY_VGA (0x0300).  Now it will be true for both
> PCI_CLASS_DISPLAY_VGA (0x0300) and PCI_CLASS_DISPLAY_OTHER (0x0380).

Oops, sorry, my mistake here.  I meant PCI_CLASS_NOT_DEFINED_VGA, not
PCI_CLASS_DISPLAY_OTHER.  pci_is_vga() is true for either of:

  PCI_CLASS_DISPLAY_VGA       0x0300
  PCI_CLASS_NOT_DEFINED_VGA   0x0001

(PCI_CLASS_NOT_DEFINED_VGA is defined in the PCI Code and Assignment
spec r1.15, sec 1.1; PCI_CLASS_DISPLAY_VGA is sec 1.4.)

> Is that desirable?  I can't tell.  Maybe the GPU folks will chime in.
> 
> >  	int ret;
> >  
> >  	DRM_INFO("pci: %s detected at %s\n",
> > -- 
> > 2.34.1
> > 
