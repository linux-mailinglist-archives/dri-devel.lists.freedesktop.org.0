Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BF2520E1E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FC110F084;
	Tue, 10 May 2022 06:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1735 seconds by postgrey-1.36 at gabe;
 Mon, 09 May 2022 12:46:50 UTC
Received: from www259.your-server.de (www259.your-server.de [188.40.28.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1043E10F075
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 12:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=waldheinz.de; s=default1911; h=MIME-Version:Content-Type:Subject:To:From:
 Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=Z/An/lFEf1vw4Zee5IWPk+ECsxc/KsyyKiiT/g08Hic=; b=asLD8Ox7p90MDOMSBbIwKE0PLU
 bgnlkY3/4+IPzSP6yLRfP5iHP5ShpaQ1cUsPkFBlKLy5KhaC0zE/uZ5XEUc+aNHoUFVVE3Og/Aeye
 TOMWif57qgvl3FfQPIJfLNbVG0zybEHhWqLT6cXtUhEQvF76K8S20Qple5b8J9mUBtzsAPpmjv3K7
 PGnkthLzYz5ajBiSHUhi+B74GFEg1WVLA+CR4gp+I5M1UKfAF4NLm8ke+Ww4LN/8dfGmxpY4r04vx
 rpx1IXSJURCPcSwcm7/VIchF0VbdTiPawNNpG9cJYln0sRfaE96q6Tx3qJgXVTI6weZWo/LWhOFTC
 bbnhE+4w==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www259.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <mt@waldheinz.de>) id 1no2Km-000Gto-Rm
 for dri-devel@lists.freedesktop.org; Mon, 09 May 2022 14:17:52 +0200
Received: from [192.168.0.32] (helo=mail.your-server.de)
 by sslproxy03.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (Exim 4.92)
 (envelope-from <mt@waldheinz.de>) id 1no2Km-00043m-O7
 for dri-devel@lists.freedesktop.org; Mon, 09 May 2022 14:17:52 +0200
Received: from [2a02:810a:8100:11a6:b62e:99ff:fe6e:6b28]
 ([2a02:810a:8100:11a6:b62e:99ff:fe6e:6b28]) by mail.your-server.de (Horde
 Framework) with HTTPS; Mon, 09 May 2022 14:17:52 +0200
Date: Mon, 09 May 2022 14:17:52 +0200
Message-ID: <20220509141752.Horde.58_XnvI-dT6nhIkF6cnY2-R@mail.your-server.de>
From: Matthias Treydte <mt@waldheinz.de>
To: dri-devel@lists.freedesktop.org
Subject: Understanding i915 rps boost
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-Authenticated-Sender: mt@waldheinz.de
X-Virus-Scanned: Clear (ClamAV 0.103.5/26536/Mon May  9 10:04:57 2022)
X-Mailman-Approved-At: Tue, 10 May 2022 06:50:04 +0000
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

Hello,

I'm trying to understand why our application does not play well with  
the i915 driver. We're trying to drive a 4k/60Hz display using an  
OpenGL ES application, the GL context being derived directly from the  
DRM device. Depending on the GPU load we generate, we quite frequently  
manage to get stuck with an GPU clocked just a smidge too low to  
actually hit the 60Hz target.

E.g. right now I'm looking at less than ideal animations because the  
time to complete a frame is 17.1ms, causing every other vsync to be  
missed. This is while the GPU, according to intel_gpu_top, is 50.4%  
busy with rendering and the video decoder is at 6.7%. I'm pretty sure  
there is room for improvement because decoding a higher bitrate video  
*will* cause the GPU to clock up, then hitting the 60Hz no problem.

While investigating this I discovered the concept of "wait boost",  
although I'm not really sure what triggers it. To my understanding  
there are two ways to benefit from it:

   * calling glFinish() (gave it a try, makes no difference)
   * tying the render job to a pending vsync event using an  
IN_FENCE_FD, we do that but it does not help either

Manual intervention using /sys/class/drm/card0/gt_min_freq_mhz is not  
very effective either, causing the long-time average clocks jump to  
501 MHz, up from 495 MHz. Those extra 6 MHz really don't cut it. The  
reported maximum is 900 MHz, which was also written to gt_min_freq_mhz.

The output of /sys/kernel/debug/dri/0/i915_rps_boost_info alternates  
between two states:

> RPS enabled? yes
> RPS active? no
> GPU busy? no
> Boosts outstanding? 0
> Interactive? 2
> Frequency requested 867, actual 300
>   min hard:300, soft:900; max soft:900, hard:900
>   idle:300, efficient:300, boost:900
> Wait boosts: 0

and

> RPS enabled? yes
> RPS active? yes
> GPU busy? yes
> Boosts outstanding? 0
> Interactive? 2
> Frequency requested 900, actual 900
>   min hard:300, soft:900; max soft:900, hard:900
>   idle:300, efficient:300, boost:900
> Wait boosts: 0

This is on Linux 5.17.5 with Mesa 22.0.2, but we're seeing this  
problem since at least two years so the exact version seems not to  
matter very much. It may be worth to mention that this behavior can be  
reproduced using the Weston Wayland compositor, and according the some  
mailing list there are Kodi users suffering from this too.

I'm really out of ideas here, is there anything obvious wrong with our  
approach?


Kind regards,
-Matthias


