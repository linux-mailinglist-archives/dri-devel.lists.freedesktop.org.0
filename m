Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E152FB442
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 09:38:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FC66E853;
	Tue, 19 Jan 2021 08:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD4F89233
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 09:13:12 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B600551270001>; Mon, 18 Jan 2021 01:13:11 -0800
Received: from mtl-vdi-166.wap.labs.mlnx (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3; Mon, 18 Jan 2021 09:13:05 +0000
Date: Mon, 18 Jan 2021 11:13:02 +0200
From: Eli Cohen <elic@nvidia.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Change eats memory on my server
Message-ID: <20210118091302.GB40909@mtl-vdi-166.wap.labs.mlnx>
References: <20210114151529.GA79120@mtl-vdi-166.wap.labs.mlnx>
 <23cf7712-1daf-23b8-b596-792c9586d6b4@suse.de>
 <20210117050837.GA225992@mtl-vdi-166.wap.labs.mlnx>
 <83f74a11-b3c0-db2e-8301-4292d60d803b@amd.com>
 <2ea2630b-8782-c662-91fe-683d8b5d6c99@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2ea2630b-8782-c662-91fe-683d8b5d6c99@suse.de>
User-Agent: Mutt/1.9.5 (bf161cf53efb) (2018-04-13)
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1610961191; bh=Ur2WqqNyQiU3Rvke8jG05EHK8Z0gPrqFQ88JrB8FehE=;
 h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:Content-Transfer-Encoding:
 In-Reply-To:User-Agent:X-Originating-IP:X-ClientProxiedBy;
 b=ZZGpEAMCfV7AZEd8nSEJmDs8YoR9vTXrIbQTmRSbQzuiQnWDoSf0iql9+2D83fR56
 VfzjU82UUaowTkfFzLdIK/DhYDNqz6tZBMBSh8zX54JR6WFAFUIoQrV8Rzbya/iH0V
 sSAQnpJ2JkhjwNbu26iLrbDCTmQo+fM6CCimaVA2eoixEhb/5cvCiCYylJDbx60Xih
 +x1tgbvzEjDeHmVKl/LIxWm1tatKIhpNEBKd25baarXZz74Yyx0Is82tIlbyvABO24
 cCOM5Ghlsgs7mxBieB3bW6QK4AMtygWyBjZM2XD9IswP1cFLwEhpuAg6Gm1wltcB+8
 bbYW8GHNNL5ag==
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:25 +0000
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 08:54:07AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 18.01.21 um 08:43 schrieb Christian K=F6nig:
> > Hi Eli,
> > =

> > have you already tried using kmemleak?
> > =

> > This sounds like a leak of memory allocated using kmalloc(), so kmemleak
> > should be able to catch it.
> =

> I have an idea what happens here. When the refcount is 0 in kmap, a new p=
age
> mapping for the BO is being established. But VRAM helpers unmap the previ=
ous
> pages only on BO moves or frees; not in kunmap. So the old mapping might
> still be around. I'll send out a test patch later today.
> =


Great! Looking forward to test it.

> Best regards
> Thomas
> =

> > =

> > Regards,
> > Christian.
> > =

> > Am 17.01.21 um 06:08 schrieb Eli Cohen:
> > > On Fri, Jan 15, 2021 at 10:03:50AM +0100, Thomas Zimmermann wrote:
> > > > Could you please double-check that 3fb91f56aea4 ("drm/udl: Retrieve=
 USB
> > > > device from struct drm_device.dev") works correctly
> > > Checked again, it does not seem to leak.
> > > =

> > > > and that 823efa922102
> > > > ("drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()") is brok=
en?
> > > > =

> > > Yes, this one leaks, as does the one preceding it:
> > > =

> > > 1086db71a1db ("drm/vram-helper: Remove invariant parameters from
> > > internal kmap function")
> > > > For one of the broken commits, could you please send us the output =
of
> > > > =

> > > > =A0=A0 dmesg | grep -i drm
> > > > =

> > > > after most of the memory got leaked?
> > > > =

> > > I ran the following script in the shell:
> > > =

> > > while true; do cat /proc/meminfo | grep MemFree:; sleep 5; done
> > > =

> > > and this is what I saw before I got disconnected from the shell:
> > > =

> > > MemFree:=A0=A0=A0=A0=A0=A0=A0=A0=A0 148208 kB
> > > MemFree:=A0=A0=A0=A0=A0=A0=A0=A0=A0 148304 kB
> > > MemFree:=A0=A0=A0=A0=A0=A0=A0=A0=A0 146660 kB
> > > Connection to nps-server-24 closed by remote host.
> > > Connection to nps-server-24 closed.
> > > =

> > > =

> > > I also mointored the output of dmesg | grep -i drm
> > > The last output I was able to save on disk is this:
> > > =

> > > [=A0=A0 46.140720] ast 0000:03:00.0: [drm] Using P2A bridge for confi=
guration
> > > [=A0=A0 46.140737] ast 0000:03:00.0: [drm] AST 2500 detected
> > > [=A0=A0 46.140754] ast 0000:03:00.0: [drm] Analog VGA only
> > > [=A0=A0 46.140772] ast 0000:03:00.0: [drm] dram MCLK=3D800 Mhz type=
=3D7
> > > bus_width=3D16
> > > [=A0=A0 46.153553] [drm] Initialized ast 0.1.0 20120228 for 0000:03:0=
0.0
> > > on minor 0
> > > [=A0=A0 46.165097] fbcon: astdrmfb (fb0) is primary device
> > > [=A0=A0 46.391381] ast 0000:03:00.0: [drm] fb0: astdrmfb frame buffer=
 device
> > > [=A0=A0 56.097697] systemd[1]: Starting Load Kernel Module drm...
> > > [=A0=A0 56.343556] systemd[1]: modprobe@drm.service: Succeeded.
> > > [=A0=A0 56.350382] systemd[1]: Finished Load Kernel Module drm.
> > > [13319.469462] [=A0=A0 2683] 70889=A0 2683=A0=A0=A0 55586=A0=A0=A0=A0=
=A0=A0=A0 0=A0=A0=A0 73728
> > > 138=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0 tdrm
> > > [13320.658386] [=A0=A0 2683] 70889=A0 2683=A0=A0=A0 55586=A0=A0=A0=A0=
=A0=A0=A0 0=A0=A0=A0 73728
> > > 138=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0 tdrm
> > > [13321.800970] [=A0=A0 2683] 70889=A0 2683=A0=A0=A0 55586=A0=A0=A0=A0=
=A0=A0=A0 0=A0=A0=A0 73728
> > > 138=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0 tdrm
> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
