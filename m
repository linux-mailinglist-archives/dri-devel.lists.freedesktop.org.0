Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 754AF21991D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44406E9C4;
	Thu,  9 Jul 2020 07:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Wed, 08 Jul 2020 10:11:02 UTC
Received: from script.cs.helsinki.fi (script.cs.helsinki.fi [128.214.11.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0840F6E1F4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 10:11:01 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Wed,
 08 Jul 2020 13:05:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:subject:message-id:mime-version:content-type; s=
 dkim20130528; bh=Qg6Xao2pwzjAULI/EFVcxSTEWpjokbB2z9SMl2dYU5o=; b=
 OQwaVvyntSp9UJKFpCu3y3tntti8nlpnejJ4hm3ts+DG6cAxNmhiuxas3XM9SCn/
 z5VbauPwliA3fUx57uiwPYG5nX67havwWdMBZsLkLcCL1/0aaO79eEQneiReOsF+
 kHPbJvfl87Nw839FJAXDyFrqJED1+cXH7aePv6mFwyQ=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Wed, 08 Jul 2020 13:05:53 +0300
 id 00000000005A2856.000000005F059A81.00005328
Date: Wed, 8 Jul 2020 13:05:53 +0300 (EEST)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: drm/ast something ate high-res modes (5.3->5.6 regression)
Message-ID: <alpine.DEB.2.20.2007081246050.12041@whs-18.cs.helsinki.fi>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

After upgrading kernel from 5.3 series to 5.6.16 something seems to 
prevent me from achieving high resolutions with the ast driver.

With 5.6.16:

$ xrandr
Screen 0: minimum 320 x 200, current 1600 x 1200, maximum 1920 x 2048
VGA-1 connected primary 1600x1200+0+0 (normal left inverted right x axis y axis) 519mm x 324mm
   1600x1200     60.00* 
   1680x1050     59.95  
   1280x1024     75.02    60.02  
   1440x900      59.89  
   1280x800      59.81  
   1024x768      75.03    60.00  
   800x600       75.00    60.32  
   640x480       75.00    59.94  
   1920x1200_60.0  59.95  

If I try to change to that manually added high-res mode, I get:
xrandr: Configure crtc 0 failed

With 5.3 series I've this:

Screen 0: minimum 320 x 200, current 1920 x 1200, maximum 1920 x 2048
VGA-1 connected primary 1920x1200+0+0 (normal left inverted right x axis y axis) 519mm x 324mm
   1920x1200     59.95*+
   1600x1200     60.00  
   1680x1050     59.95  
   1280x1024     75.02    60.02  
   1440x900      59.89  
   1280x800      59.81  
   1024x768      75.03    60.00  
   800x600       75.00    60.32  
   640x480       75.00    59.94  
   1920x1200_60.0  59.95  

As I've had issues in getting EDID reliably from the monitor, I provide it 
on kernel command-line (the one dumped from the monitor I use). In 
addition, I've another workaround for past issues related to EDID which 
always adds that 1920x1200_60.0 mode but now I cannot use even it to
enter a high-res mode.

If you need some additional info or want me to test a patch, just let me 
know (but some delay is expected in testing patches). Thanks.


-- 
 i.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
