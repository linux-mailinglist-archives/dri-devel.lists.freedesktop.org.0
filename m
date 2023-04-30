Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA476F2A37
	for <lists+dri-devel@lfdr.de>; Sun, 30 Apr 2023 20:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9323A10E085;
	Sun, 30 Apr 2023 18:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE3210E085
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Apr 2023 18:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kq/ffk5faKaJEZvlb+dnAi49OSKaAbhhxEnotu8V53A=;
 b=sQ22DXR59lNfS1Is3n/GofLwKpx8Z3kkXxg9JAEQvG1zqzk4x/0Rw7u7sVlxU0Edv5T4JgRDIHrYm
 9k+ky2YXIfq7Ud1a6wEP/anhlL+wLeHqfnOOVXi8R72ijzX5zcHCDET+J5ZCoGSIc5UN3DZnMCBQkA
 lhGk0UMaNHtDIPgrEEMe0RHWlOBFSeRNfZwYe7dDSQZ7ZBpGQxKWS6Wp9PkIwgRVAypyQ9rLV6+Qbq
 FufFn/Sgxmr5agQwkrpV9bcGDtWIOHZDZ8lnXdLyXQYebULWbqs14F1YQ1jQwAJBHJ1mguq1/zQ7YE
 ZXrw9H1HFhsKHXopi4tN6k/2IM74wNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=kq/ffk5faKaJEZvlb+dnAi49OSKaAbhhxEnotu8V53A=;
 b=JmK46QF3WtGoEdnDN9Yi9LIhPGUYG9UUdXKSyUz/saZXFsxJH/YH1S8wI8To3Xv0a6uPtn5GuqHGC
 rg1xaD+Dg==
X-HalOne-ID: 02db987e-e783-11ed-9ae6-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 02db987e-e783-11ed-9ae6-13111ccb208d;
 Sun, 30 Apr 2023 18:16:45 +0000 (UTC)
Date: Sun, 30 Apr 2023 20:15:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 19/19] drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
Message-ID: <20230430181539.GB96757@ravnborg.org>
References: <20230428122452.4856-1-tzimmermann@suse.de>
 <20230428122452.4856-20-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428122452.4856-20-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Sui Jingfeng <suijingfeng@loongson.cn>,
 teddy.wang@siliconmotion.com, deller@gmx.de, javierm@redhat.com,
 geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 28, 2023 at 02:24:52PM +0200, Thomas Zimmermann wrote:
> Implement DRM fbdev helpers for reading and writing framebuffer
> memory with the respective fbdev functions. Removes duplicate
> code.
> 
> v2:
> 	* rename fb_cfb_() to fb_io_() (Geert)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Sui Jingfeng <suijingfeng@loongson.cn>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Helge Deller <deller@gmx.de>

Nice cleanup.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
