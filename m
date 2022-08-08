Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FB558CE20
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C5D1123D0;
	Mon,  8 Aug 2022 18:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD81010FB99
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=znjEl5VfC+8Kaxye8Js4NPDQxl9vLldFAak2/swvHqo=;
 b=GtQqhoHAZQN5+X66fu82JLWoBx6jsaDo4f6PJOQWpzMMwn0uSiyDxqatFus+UHqprWZc4XQy6bfPk
 aJ6/vEpGo9oRO0A+FM4E1wzKwpuD/B6Cdo//NkGSnMjp0ctS2yJuf/7l7usDfVzTZBKHf7I+JDwwxy
 08D55tBMGKczIpUh/c6rsayjD/gc/lVV3XDq1+FA1GniotyHiiFITWMSzHvjwtqI0i3d4MEcPdpHR1
 U6QeRKxUaB/2VmDanQOwhzFLi2k+xrkr/XPZ9YQ4BBB+qjUau8z4MPclwrxby8ManSEVRpYS4hIIyB
 Gyn4X8iHzWeqiUIs7qSkEGRbEhcXe6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=znjEl5VfC+8Kaxye8Js4NPDQxl9vLldFAak2/swvHqo=;
 b=Lg6i8ut8jnH97SkyD0rutzDuY6+02W2opCKRClkUXVgv9giahUcr4WCo35+sMkDbkIRWD/02IUp5A
 cOMNZRaDQ==
X-HalOne-Cookie: 86a13594f40cf3c3d336840213eb4d6a9dddbf2f
X-HalOne-ID: 3c007d1e-174a-11ed-be82-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3c007d1e-174a-11ed-be82-d0431ea8bb03;
 Mon, 08 Aug 2022 18:45:12 +0000 (UTC)
Date: Mon, 8 Aug 2022 20:45:10 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/14] drm/format-helper: Convert drm_fb_swab() to
 struct iosys_map
Message-ID: <YvFZtnKaeOoDSCVD@ravnborg.org>
References: <20220808125406.20752-1-tzimmermann@suse.de>
 <20220808125406.20752-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808125406.20752-5-tzimmermann@suse.de>
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com, airlied@linux.ie,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 virtualization@lists.linux-foundation.org, drawat.floss@gmail.com,
 noralf@tronnes.org, kraxel@redhat.com, jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Aug 08, 2022 at 02:53:56PM +0200, Thomas Zimmermann wrote:
> Convert drm_fb_swab() to use struct iosys_map() and convert users. The
> new interface supports multi-plane color formats, but implementation
> only supports a single plane for now.
> 
> v2:
> 	* use drm_format_info_bpp() (Sam)
> 	* update documentation (Sam)
> 	* add TODO on vaddr location (Sam)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

