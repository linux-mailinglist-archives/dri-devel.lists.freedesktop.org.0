Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF552EFCB
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 17:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D55310E70D;
	Fri, 20 May 2022 15:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1389 seconds by postgrey-1.36 at gabe;
 Fri, 20 May 2022 15:56:51 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF6D10E70D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3hmYwiverMb1N0J61Fi+8bzNM2DByfoLQaNKfPSLJ9k=; b=Ql9Sep6+YZYzeNT4c/2jhSUvgk
 pu0cmPSjxKPfjL6DXri1z6i9804pTe+syIlCTXqR/QGA7ydZOV0hX1S/ExFEsalEIuAHjRZkjXyoR
 l4brXxjojKL01gM75PAybV2oeWIcfcdpnsu1zbEAdiYJ9npo/V+Zq47sn7Wp4XvbIL9TuWmpxc3qz
 38U6YAwnEWq5NKnTqAObF0dVKw2stIQQ/7vuC5Ix6qlVEDl5YukGLOzfrhmww72MeUmb/HoGlH72Y
 iZFsZ1IiFTZkmyaJlAYX0eZsylJvWO6hfUevE1LEK+B2UD0l+vXYoiV8YCe9CbU03g64AM8q4ml5C
 eU28VhJw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:45970 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <david@lechnology.com>) id 1ns4d4-0003zy-OF;
 Fri, 20 May 2022 11:33:40 -0400
Message-ID: <cb4aadab-0724-35d6-0a97-dc4425f31bb9@lechnology.com>
Date: Fri, 20 May 2022 10:33:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/st7735r: Fix module autoloading for Okaya RH128128T
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220520091602.179078-1-javierm@redhat.com>
From: David Lechner <david@lechnology.com>
In-Reply-To: <20220520091602.179078-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/20/22 4:16 AM, Javier Martinez Canillas wrote:
> The SPI core always reports a "MODALIAS=spi:<foo>", even if the device was
> registered via OF. This means that the st7735r.ko module won't autoload if
> a DT has a node with a compatible "okaya,rh128128t" string.
> 
> In that case, kmod expects a "MODALIAS=of:N*T*Cokaya,rh128128t" uevent but
> instead will get a "MODALIAS=spi:rh128128t", which is not present in the
> list of aliases:
> 
>    $ modinfo drivers/gpu/drm/tiny/st7735r.ko | grep alias
>    alias:          of:N*T*Cokaya,rh128128tC*
>    alias:          of:N*T*Cokaya,rh128128t
>    alias:          of:N*T*Cjianda,jd-t18003-t01C*
>    alias:          of:N*T*Cjianda,jd-t18003-t01
>    alias:          spi:jd-t18003-t01
> 
> To workaround this issue, add in the SPI table an entry for that device.
> 
> Fixes: d1d511d516f7 ("drm: tiny: st7735r: Add support for Okaya RH128128T")
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---

Acked-by: David Lechner <david@lechnology.com>

