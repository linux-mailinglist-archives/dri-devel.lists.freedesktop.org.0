Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3476CBA7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 13:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C0510E09D;
	Wed,  2 Aug 2023 11:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9440910E171
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 11:20:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F059361935;
 Wed,  2 Aug 2023 11:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B07C433C7;
 Wed,  2 Aug 2023 11:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690975240;
 bh=WD+SSKvIiKPnRV7ZbrF3+/bXbHW9DvArsnTM6PE24VM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tek8esPJJh9XQS8B0tcf6QyBaku+4neVNlvdcUr/r74juDQhTl4aW4iMsWU0e3hDG
 p8WdPuk67yh/hYUeefVfwit7ExitogrqiEbizRLV//AQah0M4lPH29dSXjxkjn1lL3
 O7y307dB7ku3LXBbKrQGbRPaAcJjt0lgfPveVmOTUTbSCFBkaEGwZLesZhtUCsq7/g
 rJH2n2quyjf66jDdFaCZQ0Z443pExWqhfA8t0r9UNs6G0MbInknzXQxSaC7JqR3LNa
 mxbz99QcP5eQAD9i2jhdl9cvc6byz5+8wT3rxNlBNSM/s57Begy/Q/3sfchOMgQrWi
 J6sUZoFLomOtw==
Date: Wed, 2 Aug 2023 16:50:28 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 0/2] Add MHI quirk for QAIC
Message-ID: <20230802112028.GG57374@thinkpad>
References: <20230519163902.4170-1-quic_jhugo@quicinc.com>
 <20230608115928.GA5672@thinkpad>
 <507f4cc2-15c2-8323-878e-4da00505bc45@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <507f4cc2-15c2-8323-878e-4da00505bc45@quicinc.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mhi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 26, 2023 at 11:15:56AM -0600, Jeffrey Hugo wrote:
> On 6/8/2023 5:59 AM, Manivannan Sadhasivam wrote:
> > On Fri, May 19, 2023 at 10:39:00AM -0600, Jeffrey Hugo wrote:
> > > With the QAIC driver in -next, I'd like to suggest some MHI changes that
> > > specific to AIC100 devices, but perhaps provide a framework for other
> > > device oddities.
> > > 
> > > AIC100 devices technically violate the MHI spec in two ways. Sadly, these
> > > issues comes from the device hardware, so host SW needs to work around
> > > them.
> > > 
> > > Thie first issue, presented in this series, has to do with the
> > > SOC_HW_VERSION register. This register is suposed to be initialized by the
> > > hardware prior to the MHI being accessable by the host to contain a
> > > version string for the SoC of the device. This could be used by the host
> > > MHI controller software to identify and handle version to version changes.
> > > The AIC100 hardware does not initialize this register, and thus it
> > > contains garbage.
> > > 
> > > This would not be much of a problem normally - the QAIC driver would just
> > > never use it. However the MHI stack uses this register as part of the init
> > > sequence and if the controller reports that the register is inaccessable
> > > then the init sequence fails.  On some AIC100 cards, the garbage value
> > > ends up being 0xFFFFFFFF which is PCIe spec defined to be a special value
> > > indicating the access failed.  The MHI controller cannot tell if that
> > > value is a PCIe link issue, or just garbage.
> > > 
> > > QAIC needs a way to tell MHI not to use this register. Other buses have a
> > > quirk mechanism - a way to describe oddities in a particular
> > > implementation that have some kind of workaround. Since this seems to be
> > > the first need for such a thing in MHI, introduce a quirk framework.
> > > 
> > > The second issue AIC100 has involves the PK Hash registers. A solution for
> > > this is expected to be proposed in the near future and is anticipated to
> > > make use of the quirk framework proposed here. With PK Hash, there are two
> > > oddities to handle. AIC100 does not initialize these registers until the
> > > SBL is running, which is later than the spec indicates, and in practice
> > > is after MHI reads/caches them. Also, AIC100 does not have enough
> > > registers defined to fully report the 5 PK Hash slots, so a custom
> > > reporting format is defined by the device.
> > > 
> > 
> > Looking at the two issues you reported above, it looks to me that they can be
> > handled inside the aic100 mhi_controller driver itself. Since the MHI stack
> > exports the read_reg callback to controller drivers, if some registers are not
> > supported by the device, then the callback can provide some fixed dummy data
> > emulating the register until the issue is fixed in the device (if at all).
> > 
> > Quirk framework could be useful if the device misbehaves against the protocol
> > itself but for the register issues like this, I think the controller driver can
> > handle itself.
> > 
> > What do you think?
> 
> I think for the HW_VERSION register, your suggestion is very good, and
> something I plan to adopt.
> 
> For the PK Hash registers, I don't think it quite works.
> 
> HW_VERSION I can hard code to a valid value, or just stub out to 0 since
> that appears to be only consumed by the MHI Controller, and we don't use it.
> 
> The PK Hash registers are programmed into the SoC, and can be unique from
> SoC to SoC.  I don't see how the driver can provide valid, but faked
> information for them.  Also, the user consumes this data via sysfs.  We'd
> like to give the data to the user, and we can't fake it. Also the data is
> dynamic.
> 
> Lets start with the dynamic data issue.  Right now MHI reads these registers
> once, and caches the values.  I would propose a quirk to change that
> behavior for AIC100, but does MHI really need to operate in a "read once"
> mode?  Would something actually break if MHI read the registers every time
> the sysfs node is accessed?  Then sysfs would display the latest data, which
> would be beneficial to AIC100 and should not be a behavior change for other
> devices which have static data (MHI just displays the same data because it
> hasn't changed).
> 
> Do you recall the reason behind making the PK Hash registers read once and
> cached?
> 

I don't see an issue with reading the PK hash dynamically. I think the intention
for caching mostly come from the fact it was a static data.

So you can dynamically read it all the time.

- Mani

> > 
> > - Mani
> > 
> > > v2:
> > > -Fix build error
> > > -Fix typo in commit text
> > > 
> > > Jeffrey Hugo (2):
> > >    bus: mhi: host: Add quirk framework and initial quirk
> > >    accel/qaic: Add MHI_QUIRK_SOC_HW_VERSION_UNRELIABLE
> > > 
> > >   drivers/accel/qaic/mhi_controller.c |  1 +
> > >   drivers/bus/mhi/host/init.c         | 13 +++++++++----
> > >   include/linux/mhi.h                 | 18 ++++++++++++++++++
> > >   3 files changed, 28 insertions(+), 4 deletions(-)
> > > 
> > > -- 
> > > 2.40.1
> > > 
> > > 
> > 
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
