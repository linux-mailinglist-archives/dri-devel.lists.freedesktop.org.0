Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474CBCBB06E
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 15:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA7610E06E;
	Sat, 13 Dec 2025 14:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hao6so9U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9537810E446
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Dec 2025 14:22:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E33040DB0;
 Sat, 13 Dec 2025 14:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AABC4CEF7;
 Sat, 13 Dec 2025 14:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765635721;
 bh=6Mgkd/yRdIfvJMvm76bdPGVcyJ1ZtJ1fJtloZBjY12M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hao6so9UIxWjXJdlS1RrB7FQ9Aa5SG8yzyrjaj+dLGfmW3CJ565WGhhcluj8IkE0h
 ScCkQG4rtVumC8LHOa6PszNQyg6uPfMDB40gQiohYtd/JLNZ20xNvnRY5SZXZy8vZo
 iDfhJPLghLXjFOo/vYnln+OQ6w2z82OqPFmDjCA7I8W5qfW1ZVI+CBDR4ju6vhoQQM
 63XLlzi6VJnYCsf445wX9STiAged4zYIBXcJc92b1hbCw3i6nOzK6XfMzgQYfeOy+X
 cIcTi2FvpMq5sWVge+4o26ZY1hj9FGNMf2KLO/iu46m3csaOzuNdidKX4eOzYlPzVC
 D4svwDpMPgs0Q==
Date: Sat, 13 Dec 2025 06:22:00 -0800
From: Kees Cook <kees@kernel.org>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: Helge Deller <deller@gmx.de>, Andrew Morton <akpm@linux-foundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Frank Li <Frank.Li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Subject: Re: [PATCH] fbdev: arkfb: Request legacy VGA I/O region
Message-ID: <202512130621.7FE2C04639@keescook>
References: <20251213154937.104301-1-swarajgaikwad1925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213154937.104301-1-swarajgaikwad1925@gmail.com>
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

On Sat, Dec 13, 2025 at 03:49:32PM +0000, Swaraj Gaikwad wrote:
> The arkfb driver uses the legacy VGA I/O range (0x3c0+) but does not
> request it. This can cause conflicts with other drivers that try to
> reserve these ports.

Eek, nice catch!

> 
> Fix this by using devm_request_region() during the probe function.
> This ensures the region is properly reserved and automatically released
> on driver detach.
> 
> Signed-off-by: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
> ---
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
> +	if (!devm_request_region(&dev->dev, vga_res.start, 64 * 1024, "arkfb-vga")) {

I was expecting to see vga_res.end as the third argument instead of
repeating the open-coded value.

-Kees

> +		dev_err(info->device, "cannot reserve legacy VGA ports\n");
> +		rc = -EBUSY;
> +		goto err_find_mode;
> +	}
> +
>  	par->state.vgabase = (void __iomem *) (unsigned long) vga_res.start;
> 
>  	/* FIXME get memsize */
> 
> base-commit: a859eca0e4cc96f63ff125dbe5388d961558b0e9
> --
> 2.52.0
> 

-- 
Kees Cook
