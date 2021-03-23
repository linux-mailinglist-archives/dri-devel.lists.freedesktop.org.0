Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D473460D9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F39089E7B;
	Tue, 23 Mar 2021 14:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CC189E7B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:02:24 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b14so13530177lfv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ku+levvVxBeqKSuHI7QAU6DJ1TT9V2yW8FV3fTDnwwo=;
 b=Y4sDWZnWLFkjeVLPKdcxZ9yafDLWRrvFZTzPiEKg8gxPfH70ZCk6lCglyy8tJqxPpm
 AU4lNcx4+faeYBwKzIlFF4T6qnIGRbykR42u3VFqxtPO6JWxnNVvInx9PdC3LF06Ts+6
 DKLmuVRW3PKiaxdZjTm3r+/OS+peiAm9T0HuWfdibI8MUHClff3qHkYl3gLpx35sgFUV
 AugfY7kpJMUBLhaJrR0nfZ24txNcRqwFz2+Tu948DmtkSPGT3zsHP0iaQlibIA+4VTm7
 VMWQTj+XtpOKOy7fsBkZYAsUp9saldvz1XzJaer6qj266b4DYlaqDf0unUa+0cftwsFy
 wCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ku+levvVxBeqKSuHI7QAU6DJ1TT9V2yW8FV3fTDnwwo=;
 b=i2V4oIOUbbatbFbcH6bqsix7iKZhIKiCnedFG4gJr2dzq9v+GXWGvgiQrWsLxSyDas
 vncnc4VLRLmQhC6CEuOWsv4WJhigN02DxBA4xmMU6g84bwcypT8QrV9XMlI6YR6on6/X
 3gfkyIOSwKiFp0yHk3pmBGFDDbVFskd6Gs0lEuQsiJiZWT3AN1fLXE42TXo9ciIWVT/d
 qzLi5Z+hW5N6k9TtqYt/ZGmdDvPqI0uGrmenqTuCxN0Ub7MfWEqpcBqjTBf9YHAI2Y2J
 aR3BIVrIRfVGOO4Jl+ss/EDx35Sx3xX0Yg8FPE8d3yLTjIdrn1zCSeueYr3zYVGXacqz
 PkGA==
X-Gm-Message-State: AOAM530Buh0Hzq/tUeKGjRPszt2+o1UCbTBTvM9oG5aOZERQ+5PePBwR
 br+sYGI7IHKbF+woQs74r6dmYte7ciV2h6y02W0=
X-Google-Smtp-Source: ABdhPJysRw/CzY1wTwDNpPh0ik6UsRhl1MsyNfGxru2rIW2RG1tLkFLSGaeMeUgUm0BNDEhNCX9AVH9Ht53tDcclgd8=
X-Received: by 2002:a05:6512:3996:: with SMTP id
 j22mr2564356lfu.443.1616508143271; 
 Tue, 23 Mar 2021 07:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210323130550.2289487-1-arnd@kernel.org>
In-Reply-To: <20210323130550.2289487-1-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 23 Mar 2021 11:02:12 -0300
Message-ID: <CAOMZO5AUJ=OjBwB=GA4Y0dy+oheHyzK3eVq+YCgT4HKEaQJhNw@mail.gmail.com>
Subject: Re: [PATCH] drm/imx: fix out of bounds array access warning
To: Arnd Bergmann <arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Liu Ying <victor.liu@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Tue, Mar 23, 2021 at 10:05 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_OF is disabled, building with 'make W=1' produces warnings
> about out of bounds array access:
>
> drivers/gpu/drm/imx/imx-ldb.c: In function 'imx_ldb_set_clock.constprop':
> drivers/gpu/drm/imx/imx-ldb.c:186:8: error: array subscript -22 is below array bounds of 'struct clk *[4]' [-Werror=array-bounds]

What about making the driver depend on OF instead (like it is done in
DRM_IMX_HDMI) ?

--- a/drivers/gpu/drm/imx/Kconfig
+++ b/drivers/gpu/drm/imx/Kconfig
@@ -27,7 +27,7 @@ config DRM_IMX_TVE

 config DRM_IMX_LDB
        tristate "Support for LVDS displays"
-       depends on DRM_IMX && MFD_SYSCON
+       depends on DRM_IMX && MFD_SYSCON && OF
        depends on COMMON_CLK
        select DRM_PANEL
        help
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
