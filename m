Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4BE416843
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 00:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0AF6E11E;
	Thu, 23 Sep 2021 22:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 334 seconds by postgrey-1.36 at gabe;
 Thu, 23 Sep 2021 22:57:22 UTC
Received: from smtp2.de.opalstack.com (smtp2.de.opalstack.com
 [139.162.136.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C286E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 22:57:22 +0000 (UTC)
Received: from jason.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp2.de.opalstack.com (Postfix) with ESMTPSA id A004E129C6B;
 Thu, 23 Sep 2021 22:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boddie.org.uk;
 s=dkim; t=1632437506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4PZqbATcpFKvMSWvz2SaHStw0CXunL88V36uVDDWCY=;
 b=OFTg1Ac2UZUlbgTsGydnHAY5uSE+xsua3v4Eu4kFF4WcjRbWYKciC02F+5A+g7dE2bNapz
 Hao6cKqlHFp5+P6PBp3gBtnU8Bsnz0r48kzs6hX4DhqnbiPATRl3LslnOK09sxVH7NM5il
 MaJLXl9igFrtG5dr0huIBpR37G8bPC0=
From: Paul Boddie <paul@boddie.org.uk>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
Date: Fri, 24 Sep 2021 00:51:39 +0200
Message-ID: <4366739.KZ8Jxz7LyS@jason>
In-Reply-To: <B7B431EC-BC73-4B39-A03C-003347D8C239@goldelico.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <IXJWZQ.BZQ2M7FHYVJM@crapouillou.net>
 <B7B431EC-BC73-4B39-A03C-003347D8C239@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.28
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

On Thursday, 23 September 2021 22:23:28 CEST H. Nikolaus Schaller wrote:
> 
> > Am 23.09.2021 um 21:39 schrieb Paul Cercueil <paul@crapouillou.net>:
> > 
> > Start by wiring things properly, like in my previously linked DTS, and
> > *test*. If it fails, tell us where it fails.
>
> Well, I tell where drm_bridge_attach fails with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR...

I tried to piece together this entire discussion from the mailing list 
archives, but there appear to be two approaches that "work", in that they 
activate the LCD controller with the HDMI peripheral:

1. Nikolaus's approach, which involves getting the Synopsys driver to create a 
connector and then avoiding the call to drm_bridge_connector_init in the 
Ingenic DRM driver.

2. My approach, which just involves changing the Synopsys driver to set the 
bridge type in dw_hdmi_probe like this:

  hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;

Otherwise, I don't see how the bridge's (struct drm_bridge) type will be set. 
And this causes drm_bridge_connector_init to fail because it tests the bridge 
type.

Now, I just reintroduced the HDMI connector to the device tree as follows:

        hdmi_connector {
                compatible = "hdmi-connector";
                label = "hdmi";

                type = "a";

                port {
                        hdmi_connector_in: endpoint {
                                remote-endpoint = <&dw_hdmi_out>;
                        };
                };
        };

And then I added a second port to the HDMI peripheral node as follows:

                port@1 {
                        reg = <1>;
                        dw_hdmi_out: endpoint {
                                remote-endpoint = <&hdmi_connector_in>;
                        };
                };

And I removed any of the above hacks. What I observe, apart from an inactive 
LCD controller (and ingenic-drm driver), is the following in /sys/devices/
platform/10180000.hdmi/:

consumer:platform:13050000.lcdc0
consumer:platform:hdmi_connector

Maybe I don't understand the significance of "consumer" here, but the LCD 
controller and the HDMI connector obviously have rather different roles. Then 
again, the device tree is defining bidirectional relationships, so maybe this 
is how they manifest themselves.

> > Because your "it doesn't work" arguments have zero weight otherwise.
> 
> I hope I still can find it. So I can't promise anything.
> We have had it complete in DTS and added code to parse it.
> It may have been wiped out by cleaning up patch series during rebase.

I suppose the question is whether this is actually handled already. I would 
have thought that either the DRM framework would be able to identify such 
relationships in a generic way or that the Synopsys driver would need to do 
so. This might actually be happening, given that the sysfs entries are there, 
but I might also imagine that something extra would be required to set the 
bridge type.

I did start writing some code to look up a remote endpoint for the second 
port, find the connector type, and then set it, but it was probably after 
midnight on that occasion as well. Short-circuiting this little dance and 
setting the bridge type indicated that this might ultimately be the right 
approach, but it would probably also mean introducing a point of 
specialisation to the Synopsys driver so that device-specific drivers can 
define a function to set the connector type.

Otherwise, I can't see the Synopsys driver working for devices like the 
JZ4780, but then again, it seems that all the other devices seem to 
incorporate the Synopsys functionality in a different way and do not need to 
deal with connectors at all.

> > If I can find some time this weekend I will test it myself.
> 
> You may be faster than me.

So, when I wrote about approaches that "work", I can seemingly get the LCD 
controller and HDMI peripheral registers set up to match a non-Linux 
environment where I can demonstrate a functioning display, and yet I don't get 
a valid signal in the Linux environment.

Nikolaus can actually get HDMI output, but there may be other factors 
introduced by the Linux environment that frustrate success for me, whereas my 
non-Linux environment is much simpler and can reliably reproduce a successful 
result.

For me, running modetest yields plenty of information about encoders, 
connectors (and the supported modes via the EDID, thanks to my HDMI-A hack), 
CRTCs, and planes. But no framebuffers are reported.

Paul


