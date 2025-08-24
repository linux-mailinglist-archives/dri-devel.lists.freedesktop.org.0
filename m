Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48127B32F3E
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 13:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2B810E035;
	Sun, 24 Aug 2025 11:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=grimler.se header.i=@grimler.se header.b="MUnsDqjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3010E035
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 11:11:45 +0000 (UTC)
Date: Sun, 24 Aug 2025 13:11:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
 t=1756033903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=We6UGgdPxyJeNBFY5QqZm6AJ0xgPztY160ftcv9K1hg=;
 b=MUnsDqjt0Xd7Q45ipZswGLTvK3HbeT6AnhjgST2U+aDvPG2SMNvARVQkWD+PpesG9R/Kh0
 2GRhvkstz199dlS1nGgwiJUHvElKTZHmUrv3W+PxmHQSNSXG+fHQvmHp0RO+jV5Tbh4TfD
 XJfw2Aol/nC6UQCurvxBg413PmiZehw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
 linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <20250824111129.GA37114@grimfrac.localdomain>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
 <ldhyfuczwtwydwnvno4xn6ppjtt7mtcj35fp52xrqaajtfbtpb@2pgkytczb5k5>
 <20250808095259.GA31443@grimfrac.localdomain>
 <r2u2odrkzfezohq44nh4jw6oj23j46gohuzsh6k7jpwnzojxqk@vdus4jj5lv7x>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <r2u2odrkzfezohq44nh4jw6oj23j46gohuzsh6k7jpwnzojxqk@vdus4jj5lv7x>
X-Migadu-Flow: FLOW_OUT
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

Hi Dmitry,

On Mon, Aug 18, 2025 at 03:42:07AM +0300, Dmitry Baryshkov wrote:
> On Fri, Aug 08, 2025 at 11:52:59AM +0200, Henrik Grimler wrote:
> > Hi Dmitry,
> > 
> > On Sun, Jul 27, 2025 at 08:07:37PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Jul 24, 2025 at 08:50:53PM +0200, Henrik Grimler wrote:
> > > > To use MHL we currently need the MHL chip to be permanently on, which
> > > > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > > > the MHL chip only if it detects an MHL cable.
> > > 
> > > Does HPD GPIO reflect the correct state of the cable?
> > 
> > Yes, the HPD gpio pin changes state from low to high when a mhl cable is
> > connected:
> > 
> > $ sudo cat /sys/kernel/debug/gpio|grep gpio-755
> >  gpio-755 (                    |hpd                 ) in  lo IRQ
> > $ sudo cat /sys/kernel/debug/gpio|grep gpio-755
> >  gpio-755 (                    |hpd                 ) in  hi IRQ
> > 
> > so that is described correctly.
> > 
> 
> Ack.
> 
> > 
> > and in captured trace I see that on cable connect we get an irq that
> > is handled through:
> > 1. max77693_muic_irq_handler
> > 2. max77693_muic_irq_work
> > 3. max77693_muic_adc_handler
> > 4. sii9234_extcon_notifier
> > 5. sii9234_extcon_work
> > 6. sii9234_cable_in
> > 7. hdmi_irq_thread
> > 
> > Raw captured trace dat file can be found here:
> > https://grimler.se/files/sii9234-mhl-connect-trace.dat
> > 
> > Maybe you were asking for some other type of order of events log
> > though, please let me know if I misunderstand.
> > 
> > > Should the sii9234 signal to Exynos HDMI that the link is established?
> > 
> > Maybe.. Sorry, I do not know enough about extcon and drm yet. I assume
> > you mean through drm_helper_hpd_irq_event() and
> > drm_bridge_hpd_notify(), I will experiment a bit and add it to the
> > driver and see if this improves it.
> 
> If you are getting the HDMI IRQ event, then I'd suggest checking that
> you are actually getting the 'plugged' event, etc. I was worried that
> you are hijacking the DRM chain. But if you are getting hotplug events,
> then it's fine (and most likely correct).

With some debugging in sii9234_extcon_notifier added:

--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -892,6 +892,8 @@ static int sii9234_extcon_notifier(struct notifier_block *self,
        struct sii9234 *ctx =
                container_of(self, struct sii9234, extcon_nb);
 
+       dev_info(ctx->dev, "extcon event %lu\n", event);
+
        schedule_work(&ctx->extcon_wq);
 
        return NOTIFY_DONE;

I see that sii9234 receives the hotplug event. On plug in:

[  532.132981] sii9234 15-0039: extcon event 0
[  532.136601] max77693-muic max77693-muic: external connector is attached (adc:0x00, prev_adc:0x0)
[  532.142777] sii9234 15-0039: RSEN_HIGH without RGND_1K
[  532.149815] sii9234 15-0039: extcon event 1
[  532.155662] max77693-charger max77693-charger: not charging. connector type: 13
[  532.164801] sii9234 15-0039: extcon event 0
[  532.168371] max77693-muic max77693-muic: external connector is detached(chg_type:0x0, prev_chg_type:0x0)
[  532.178370] sii9234 15-0039: extcon event 0
[  532.188250] max77693-charger max77693-charger: not charging. connector type: 13
[  533.097415] i2c i2c-15: sendbytes: NAK bailout.
[  533.100735] sii9234 15-0039: writebm:  TPI[0x3d] <- 0x3e
[  533.115161] sii9234 15-0039: writeb:  TPI[0x3d] <- 0x00

and disconnect:

[  547.195219] dwc2 12480000.usb: new device is full-speed
[  547.204912] max77693-muic max77693-muic: external connector is attached (adc:0x00, prev_adc:0x0)
[  547.212629] sii9234 15-0039: extcon event 1
[  547.218304] max77693-charger max77693-charger: not charging. connector type: 13
[  548.159257] i2c i2c-15: sendbytes: NAK bailout.
[  548.162602] sii9234 15-0039: writebm:  TPI[0x3d] <- 0x3e
[  548.167990] sii9234 15-0039: extcon event 0
[  548.172788] max77693-muic max77693-muic: external connector is attached (adc:0x00, prev_adc:0x0)
[  548.181336] sii9234 15-0039: extcon event 1
[  548.186510] max77693-charger max77693-charger: not charging. connector type: 13

It seems a bit weird to me that it receives multiple events, but maybe
that is expected. Will send a v3 shortly, thank you!

Best regards,
Henrik Grimler
