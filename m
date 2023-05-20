Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF9370A88C
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 16:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA7910E04C;
	Sat, 20 May 2023 14:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id D66DA10E04C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 May 2023 14:46:55 +0000 (UTC)
Received: (qmail 73303 invoked by uid 1000); 20 May 2023 10:46:54 -0400
Date: Sat, 20 May 2023 10:46:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: udlfb: Use usb_control_msg_send()
Message-ID: <2093306b-1d12-4f10-8dbd-c9ae149d50e3@rowland.harvard.edu>
References: <20230519211625.1072966-1-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519211625.1072966-1-deller@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 11:16:25PM +0200, Helge Deller wrote:
> Use the newly introduced usb_control_msg_send() instead of usb_control_msg()
> when selecting the channel.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>  drivers/video/fbdev/udlfb.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
> index 256d9b61f4ea..dabc30a09f96 100644
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -1543,24 +1543,16 @@ static const struct device_attribute fb_device_attrs[] = {
>  static int dlfb_select_std_channel(struct dlfb_data *dlfb)
>  {
>  	int ret;
> -	void *buf;
>  	static const u8 set_def_chn[] = {
>  				0x57, 0xCD, 0xDC, 0xA7,
>  				0x1C, 0x88, 0x5E, 0x15,
>  				0x60, 0xFE, 0xC6, 0x97,
>  				0x16, 0x3D, 0x47, 0xF2  };
> 
> -	buf = kmemdup(set_def_chn, sizeof(set_def_chn), GFP_KERNEL);
> -
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	ret = usb_control_msg(dlfb->udev, usb_sndctrlpipe(dlfb->udev, 0),
> -			NR_USB_REQUEST_CHANNEL,
> +	ret = usb_control_msg_send(dlfb->udev, 0, NR_USB_REQUEST_CHANNEL,
>  			(USB_DIR_OUT | USB_TYPE_VENDOR), 0, 0,
> -			buf, sizeof(set_def_chn), USB_CTRL_SET_TIMEOUT);
> -
> -	kfree(buf);
> +			&set_def_chn, sizeof(set_def_chn), USB_CTRL_SET_TIMEOUT,
> +			GFP_KERNEL);
> 
>  	return ret;
>  }

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
