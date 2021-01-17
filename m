Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 287F82F9B32
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDDA6E183;
	Mon, 18 Jan 2021 08:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Sun, 17 Jan 2021 05:13:50 UTC
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289CD89DD2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 05:13:50 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6003c65c0000>; Sat, 16 Jan 2021 21:08:44 -0800
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Sun, 17 Jan 2021 05:08:40 +0000
Date: Sun, 17 Jan 2021 07:08:37 +0200
From: Eli Cohen <elic@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Change eats memory on my server
Message-ID: <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610860124; bh=JrsBm7aNqqxyNiyrOmOkq8jRIaxsMN/hYLiE7Px1Mk8=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:User-Agent:
 X-Originating-IP:X-ClientProxiedBy;
 b=QC/QsC6/XXaPbIZYmOi9rRiqpdU5JXbtyZ4O/AB/4hf6bJOQ9ZBkJlZBuBOBxUA3D
 NcnRD0DfD0sFO/q4U5TYsOdFr+rJJrQW9LmiDAZqZmaArW6YzF+MXZIX7+VUO8dTab
 1o4YsWrN9EDhg+Apl2u9r2xSvkWZ9dXukGzqVGdk7RQFjZ0fxUP3/ts1INl56mUtOi
 YRu/2eKqJDpJl2RbFBH5r2vlFNkI+XNK4zDHtNnBRcNmmr7KfMOpMYEBYEL9YbJDjp
 0h6mOuyjKXmPtspAdBhbmpQBy8MBnh6uFmdCcVQpwd7+8bGncZ7K4q/BVeCtQkyhJR
 ymkMLfTHeqyeg==
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 15, 2021 at 10:03:50AM +0100, Thomas Zimmermann wrote:
> 
> Could you please double-check that 3fb91f56aea4 ("drm/udl: Retrieve USB
> device from struct drm_device.dev") works correctly

Checked again, it does not seem to leak.

> and that 823efa922102
> ("drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()") is broken?
>

Yes, this one leaks, as does the one preceding it: 

1086db71a1db ("drm/vram-helper: Remove invariant parameters from internal kmap function")
 
> For one of the broken commits, could you please send us the output of
> 
>   dmesg | grep -i drm
> 
> after most of the memory got leaked?
> 

I ran the following script in the shell:

while true; do cat /proc/meminfo | grep MemFree:; sleep 5; done

and this is what I saw before I got disconnected from the shell:

MemFree:          148208 kB
MemFree:          148304 kB
MemFree:          146660 kB
Connection to nps-server-24 closed by remote host.
Connection to nps-server-24 closed.


I also mointored the output of dmesg | grep -i drm
The last output I was able to save on disk is this:

[   46.140720] ast 0000:03:00.0: [drm] Using P2A bridge for configuration
[   46.140737] ast 0000:03:00.0: [drm] AST 2500 detected
[   46.140754] ast 0000:03:00.0: [drm] Analog VGA only
[   46.140772] ast 0000:03:00.0: [drm] dram MCLK=800 Mhz type=7 bus_width=16
[   46.153553] [drm] Initialized ast 0.1.0 20120228 for 0000:03:00.0 on minor 0
[   46.165097] fbcon: astdrmfb (fb0) is primary device
[   46.391381] ast 0000:03:00.0: [drm] fb0: astdrmfb frame buffer device
[   56.097697] systemd[1]: Starting Load Kernel Module drm...
[   56.343556] systemd[1]: modprobe@drm.service: Succeeded.
[   56.350382] systemd[1]: Finished Load Kernel Module drm.
[13319.469462] [   2683] 70889  2683    55586        0    73728      138             0 tdrm
[13320.658386] [   2683] 70889  2683    55586        0    73728      138             0 tdrm
[13321.800970] [   2683] 70889  2683    55586        0    73728      138             0 tdrm
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
