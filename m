Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE69CBB48D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 23:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6564510E035;
	Sat, 13 Dec 2025 22:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ravnborg.org header.i=@ravnborg.org header.b="M+mvJRvr";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="nwz0TLxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 963 seconds by postgrey-1.36 at gabe;
 Sat, 13 Dec 2025 22:54:58 UTC
Received: from mailrelay-egress4.pub.mailoutpod2-cph3.one.com
 (mailrelay-egress4.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238BF10E035
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 22:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1765665532;
 x=1766270332; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=AGTupz+Pclwt+J47h8KMxZjHtngDo80UP2S/FxfkJ9A=;
 b=M+mvJRvrwMMGQo968yNDjATJymPOjG8pYGYCnY8thshjrwr4YSiz1srs3tBXQJo8LT4fihNr/znwB
 AIO1stBFjWlhAchezvTAcqMmWgKvl8gK6FTaK4RhWFu8PP1+O3AHrjj6a6td6xCoKHuY0+cDoNs2PH
 yJi6+GKdwMPNkTicUEPBTNIR1yr8Qner63k5BSea3gbWMQLqjMZeNsSRcxI7cqsacP9JqS41LpJqkt
 wA+ZCMa8DX8DiKaiGLqaqRnN7/gqzm+hx2JK8phQDQ3rHsUnHhxGGs2UGuOYxRf9AD5UqgYyPsNf/H
 Aos7cS9yzet1vj/N2YGs11JgokNx5xQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1765665532;
 x=1766270332; d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=AGTupz+Pclwt+J47h8KMxZjHtngDo80UP2S/FxfkJ9A=;
 b=nwz0TLxi6qRatp5o1I1mUKI7IqFVd2zy+F31RFJALsZ7ynofpfB9LO5C7a5gDiVncnPhcVkWWc8w+
 xMVEzUDAw==
X-HalOne-ID: 7e017289-d874-11f0-9f68-c9fa7b04d629
Received: from ravnborg.org (unknown [2a00:fd01:81e9:6100:cbc5:f170:b0ba:1217])
 by mailrelay1.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 7e017289-d874-11f0-9f68-c9fa7b04d629;
 Sat, 13 Dec 2025 22:38:52 +0000 (UTC)
Date: Sat, 13 Dec 2025 23:38:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Zi Yan <ziy@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>, Yann Dirson <ydirson@free.fr>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Kees Cook <kees@kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Subject: Re: [PATCH v2] fbdev: arkfb: Request legacy VGA I/O region
Message-ID: <20251213223850.GA419250@ravnborg.org>
References: <20251213202239.8772-1-swarajgaikwad1925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213202239.8772-1-swarajgaikwad1925@gmail.com>
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

Hi Swaraj,

On Sat, Dec 13, 2025 at 08:22:34PM +0000, Swaraj Gaikwad wrote:
> The arkfb driver uses the legacy VGA I/O range (0x3c0+) but does not
> request it. This can cause conflicts with other drivers that try to
> reserve these ports.
> 
> Fix this by using devm_request_region() during the probe function.
> This ensures the region is properly reserved and automatically released
> on driver detach.
> 
> v1: https://lore.kernel.org/lkml/20251213154937.104301-1-swarajgaikwad1925@gmail.com/
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
> ---
> v2:
>  - Use resource_size(&vga_res) instead of hardcoded 64 * 1024.
>  - (Feedback from Kees Cook)
> 
> Compile-tested only on x86_64.
> 
>  drivers/video/fbdev/arkfb.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
> index ec084323115f..24e4c20d1a32 100644
> --- a/drivers/video/fbdev/arkfb.c
> +++ b/drivers/video/fbdev/arkfb.c
> @@ -1018,6 +1018,12 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> 
>  	pcibios_bus_to_resource(dev->bus, &vga_res, &bus_reg);
> 
> +	if (!devm_request_region(&dev->dev, vga_res.start, resource_size(&vga_res), "arkfb-vga")) {
> +		dev_err(info->device, "cannot reserve legacy VGA ports\n");
> +		rc = -EBUSY;
> +		goto err_find_mode;
> +	}
> +
>  	par->state.vgabase = (void __iomem *) (unsigned long) vga_res.start;

Any explanation why devm_request_region() is the right choice here?
As per the line above vga_res.start is iomem, and I had expected to see
devm_request_mem_region() used.
I looked only briefly, so I may be wrong.

	Sam
