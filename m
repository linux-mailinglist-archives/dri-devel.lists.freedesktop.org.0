Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A9C50BB8A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 17:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2BFB10E4CC;
	Fri, 22 Apr 2022 15:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDD010E4CC
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 15:17:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D8C82CE2C1E;
 Fri, 22 Apr 2022 15:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A523BC385A0;
 Fri, 22 Apr 2022 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650640671;
 bh=OQu2HnPIYsfQw0YtgkB3j0oCb5sAGQ5oTcK00sCNEoQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ziLUmyry5BXoBF9rZ5VdG5+lvPTU7ab5iiUsLrmyA/DfjkCh/W3oZv/EPJQTm2bSp
 x7937822JWbxTjtKGf/0GvPPWve40RfNLMDLl/deXWMwUbxprutwKZAsx/1HzJ1WHB
 xbCMyZG6JVxLqWl47+Nfiob9MOHr7SO/pLVBZbhw=
Date: Fri, 22 Apr 2022 17:17:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between
 fbmem and sysfb
Message-ID: <YmLHHCQyN03oAqr0@kroah.com>
References: <20220420085303.100654-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420085303.100654-1-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Yizhuo Zhai <yzhai003@ucr.edu>, Hans de Goede <hdegoede@redhat.com>,
 linux-fbdev@vger.kernel.org, Peter Jones <pjones@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Johan Hovold <johan@kernel.org>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 20, 2022 at 10:52:58AM +0200, Javier Martinez Canillas wrote:
> Hello,
> 
> The patches in this series are mostly changes suggested by Daniel Vetter
> to fix some race conditions that exists between the fbdev core (fbmem)
> and sysfb with regard to device registration and removal.
> 
> For example, it is currently possible for sysfb to register a platform
> device after a real DRM driver was registered and requested to remove the
> conflicting framebuffers.
> 
> A symptom of this issue, was worked around with by commit fb561bf9abde
> ("fbdev: Prevent probing generic drivers if a FB is already registered")
> but that's really a hack and should be reverted.
> 
> This series attempt to fix it more properly and revert the mentioned hack.
> That will also unblock a pending patch to not make the num_registered_fb
> variable visible to drivers anymore, since that's internal to fbdev core.
> 
> Patch #1 is just a trivial preparatory change.
> 
> Patch #2 add sysfb_disable() and sysfb_try_unregister() helpers for fbmem
> to use them.
> 
> Patch #3 changes how is dealt with conflicting framebuffers unregistering,
> rather than having a variable to determine if a lock should be take, it
> just drops the lock before unregistering the platform device.
> 
> Patch #4 fixes the mentioned race conditions and finally patch #5 is the
> revert patch that was posted by Daniel before but he dropped from his set.
> 
> The patches were tested on a rpi4 using different video configurations:
> (simpledrm -> vc4 both builtin, only vc4 builtin, only simpledrm builtin
> and simpledrm builtin with vc4 built as a module).
> 
> Best regards,
> Javier

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
