Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5515802A88
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 04:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4010510E18E;
	Mon,  4 Dec 2023 03:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE5610E18E;
 Mon,  4 Dec 2023 03:28:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D75D7CE0C27;
 Mon,  4 Dec 2023 03:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2CDC433C8;
 Mon,  4 Dec 2023 03:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701660482;
 bh=BJZz6nVmqz6quuK5mdvaIGmGVFLK9L9GYYYqfQvkeRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f1wLOVgCa20qtSBHiV2Si+qCvGDV2VbWtwRMqEiEe/hDan1nBoZEbNE0OoLfwMEfD
 Pq39pU04AMQCoKIfCyEzJa8Qa1vpkwxDRLswIhH1VGPNzn1VddRvXBkhbm/e3YcTSL
 J8Mr/CAMLS94Pj3T3evN+oKlLpTWP+HOcLth6yeyn3Rjh8uh6JMUa28oPkbH+g0rWx
 gP8vtult4bKwfPv8ZyAiNq8gSLd+ghPZH/cGfyGZXGzeez3WpE60yPwlmsIew5swTe
 8K3UDCSv5VUpVEtEpLGS3owcDgae9ikS0NSoFX7Qr90CXPjKLLoL8cwjZv3fX4z8lp
 qcBrJWOVPGEpg==
Date: Sun, 3 Dec 2023 19:31:25 -0800
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Message-ID: <knm2uvjuad47famhr5uzibxxx3reknxdpb5raj3fox2vlkarvc@w6xer6jo4yok>
References: <20231201014101.15802-1-quic_parellan@quicinc.com>
 <20231201014101.15802-3-quic_parellan@quicinc.com>
 <20231201034710.GB1766637@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqFya5H+4PPZ8A3CqqqRJXsJ3KKbbcfS=C13QTr1vAtSw@mail.gmail.com>
 <20231201162252.GG1766637@hu-bjorande-lv.qualcomm.com>
 <a78c42d1-6ce0-2c34-5513-c04948d2ff31@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a78c42d1-6ce0-2c34-5513-c04948d2ff31@quicinc.com>
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
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Paloma Arellano <quic_parellan@quicinc.com>,
 steev@kali.org, quic_jesszhan@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 11:43:36AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/1/2023 8:22 AM, Bjorn Andersson wrote:
> > On Fri, Dec 01, 2023 at 10:34:50AM +0200, Dmitry Baryshkov wrote:
> > > On Fri, 1 Dec 2023 at 05:47, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> > > > On Thu, Nov 30, 2023 at 05:40:55PM -0800, Paloma Arellano wrote:
> > [..]
> > > > > @@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> > > > >        dpu_enc->enabled = false;
> > > > >        mutex_init(&dpu_enc->enc_lock);
> > > > >        mutex_init(&dpu_enc->rc_lock);
> > > > > +     mutex_init(&dpu_enc->vblank_ctl_lock);
> > > > 
> > > > Is this somehow propagated to multiple different dpu_encoder_phys
> > > > instances, or why do you need to initialize it here and pass the pointer
> > > > through 2 different intermediate structures before assigning it to
> > > > phys_enc->vblank_ctl_lock below?
> > > 
> > > Yes, there can be two phys_enc instances for a single encoder, so this
> > > part is fine.
> > > 
> > 
> > Thanks for the clarification, Dmitry. Sounds like it make sense then.
> > 
> > But, if I read the code correctly the two instances will have separate
> > vblank_refcount copies, and the dpu_core_irq_*() interface does mutual
> > exclusion within. So why do we need shared mutual exclusion between the
> > two? (This is where a proper description of the problem in the commit
> > message would have been very helpful)
> > 
> 
> Are you suggesting we just have one vblank_ctl_lock per encoder and not have
> one vblank_ctl_lock per phys encoder? I cannot think of a display specific
> reason for that other than just the SW layout.
> 
> The reason its like this today is that control_vblank_irq is an encoder phys
> op because it does different things based on the type of encoder.
> 
> Because its an encoder phys op, it has the vblank_ctl_lock at the phys
> structure and not the encoder one.
> 
> Its just more about how the phys op is defined that each phys op operates on
> its phys's structure.
> 
> Generally, if we have one encoder with two physical encoders we anyways bail
> out early for the other encoder so this is mostly a no-op for the slave phys
> encoder.
> 
> Please take a look at below return point.
> 
> 715 	/* Slave encoders don't report vblank */
> 716 	if (!sde_encoder_phys_vid_is_master(phys_enc))
> 717 		goto end;
> 718
> 
> So technically its still providing protection for the same phys encoder but
> the catch is this control_vblank_irq can get called from different threads
> hence we need exclusion.
> 

The way I understand the code is that the atomic is used to refcount
when to enable/disable the interrupt, and the new lock protects this
refcount during concurrent updates. I have no concerns with this part.


What I'm seeing is that the refcount it per phys_enc, and as such there
would be no reason to have a common mutex to protect the two independent
refcounts.

But I'm probably misunderstanding something here...

Regards,
Bjorn
