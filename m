Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A769EE45C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A4310ED50;
	Thu, 12 Dec 2024 10:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48A0710E417;
 Thu, 12 Dec 2024 10:40:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79EF9169E;
 Thu, 12 Dec 2024 02:41:25 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F7F3F58B;
 Thu, 12 Dec 2024 02:40:54 -0800 (PST)
Date: Thu, 12 Dec 2024 10:40:46 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Pavan Kondeti <quic_pkondeti@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Elliot Berman <quic_eberman@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
Message-ID: <Z1q9rnzOlB9J5dXb@J2N7QTR9R3>
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <87ed2fs03w.wl-maz@kernel.org>
 <92cee905-a505-4ce9-9bbc-6fba4cea1d80@quicinc.com>
 <86sequsdtp.wl-maz@kernel.org>
 <c197264b-3791-493a-b717-3dfd844de922@quicinc.com>
 <87bjxhs2t7.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjxhs2t7.wl-maz@kernel.org>
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

On Thu, Dec 12, 2024 at 08:50:12AM +0000, Marc Zyngier wrote:
> On Thu, 12 Dec 2024 05:31:00 +0000,
> Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > 
> > On Wed, Dec 11, 2024 at 10:40:02AM +0000, Marc Zyngier wrote:
> > > On Wed, 11 Dec 2024 00:37:34 +0000,
> > > Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:
> > > > 
> > > > On Tue, Dec 10, 2024 at 09:24:03PM +0000, Marc Zyngier wrote:
> > > > > > +static int a6xx_switch_secure_mode(struct msm_gpu *gpu)
> > > > > > +{
> > > > > > +	int ret;
> > > > > > +
> > > > > > +#ifdef CONFIG_ARM64
> > > > > > +	/*
> > > > > > +	 * We can access SECVID_TRUST_CNTL register when kernel is booted in EL2 mode. So, use it
> > > > > > +	 * to switch the secure mode to avoid the dependency on zap shader.
> > > > > > +	 */
> > > > > > +	if (is_kernel_in_hyp_mode())
> > > > > > +		goto direct_switch;
> > > > > 
> > > > > No, please. To check whether you are *booted* at EL2, you need to
> > > > > check for is_hyp_available(). Whether the kernel runs at EL1 or EL2 is
> > > > > none of the driver's business, really. This is still absolutely
> > > > > disgusting from an abstraction perspective, but I guess we don't have
> > > > > much choice here.
> > > > > 
> > > > 
> > > > Thanks Marc. Any suggestions on how we can make is_hyp_mode_available()
> > > > available for modules? Do you prefer exporting
> > > > kvm_protected_mode_initialized and __boot_cpu_mode symbols directly or
> > > > try something like [1]?
> > > 
> > > Ideally, neither. These were bad ideas nine years ago, and they still
> > > are. The least ugly hack I can come up with is the patch below, and
> > > you'd write something like:
> > > 
> > > 	if (cpus_have_cap(ARM64_HAS_EL2_OWNERSHIP))
> > > 		blah();
> > > 
> > > This is obviously completely untested.
> > > 
> > 
> > I have tested your patch. It works as intended. Thanks Marc.
> 
> Note that you will probably get some push-back from the arm64
> maintainers on this front, because this is a fairly incomplete (and
> fragile) solution.
> 
> It would be much better if the discriminant came from the device tree.
> After all, the hypervisor is fscking-up^W^Wchanging the programming
> model of the GPU, and that should be reflected in the DT. Because for
> all intent and purposes, this is not the same hardware anymore.

FWIW I agree 100%, this should be described in DT.

The cpucap doesn't describe the actual property we care about, and it
cannot in general (e.g. for nested virt). I would strongly prefer to not
have that as it's setting ourselves up for failure.

> The GPU isn't the only device that needs fixing in that way: the
> SMMUv3 needs to be exposed to the OS, and the PCIe ports need to be
> linked to it and the ITS. So at the end of the day, detecting EL2 only
> serves a limited purpose. You need to handle these cases, and might as
> well put the GPU in the same bag.
> 
> Which means that you'd either have a pair of static DTs (one that
> exposes the brokenness of the firmware, and one that doesn't), or you
> go the dtbhack route to compose the DT at boot time.

Liekwise, agreed on all of this.

Mark.
