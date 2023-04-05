Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C100C6D82D8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 18:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E371B10E13E;
	Wed,  5 Apr 2023 16:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C73C10E9FD;
 Wed,  5 Apr 2023 15:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1680709058; x=1712245058;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=QSFaPQEqFWauuwq5wK1tuBUPV8rypqU+umcss/29/Qo=;
 b=BSVurwVHjPYmzJ1VUMxJr7R+HZIyyI52nz/01pVGHpmVoS2i9Kxn50PH
 +iAf4cy3/rLdqhOZenkGFKWPe6ax4ofbQ/iVEqpxHiwQAL4n3gC5YxLoQ
 Q8+FcIPd8DQDEKE14TVibTyl9khtvC3pBNaEqu15Y800Ew2Nb5SMfSb4t 4=;
X-IronPort-AV: E=Sophos;i="5.98,321,1673913600"; d="scan'208";a="326412703"
Subject: Re: [PATCH] drm/msm: Check for the GPU IOMMU during bind
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2a-m6i4x-d47337e0.us-west-2.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-9102.sea19.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 15:37:37 +0000
Received: from EX19MTAUWC001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2a-m6i4x-d47337e0.us-west-2.amazon.com (Postfix)
 with ESMTPS id 83D7F60AEF; Wed,  5 Apr 2023 15:37:35 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 5 Apr 2023 15:37:35 +0000
Received: from amazon.com (10.88.210.141) by EX19D047UWB002.ant.amazon.com
 (10.13.138.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.26; Wed, 5 Apr 2023
 15:37:33 +0000
Date: Wed, 5 Apr 2023 09:37:31 -0600
From: Jordan Crouse <jorcrous@amazon.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20230405153731.7pd2qygz2psowkeh@amazon.com>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230309222049.4180579-1-jorcrous@amazon.com>
 <e08cad22-09fe-1c65-a329-802b116e7503@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e08cad22-09fe-1c65-a329-802b116e7503@linaro.org>
X-Originating-IP: [10.88.210.141]
X-ClientProxiedBy: EX19D035UWA003.ant.amazon.com (10.13.139.86) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
Precedence: Bulk
X-Mailman-Approved-At: Wed, 05 Apr 2023 16:03:52 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <sean@poorly.run>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Ricardo Ribalda <ribalda@chromium.org>, "Joel
 Fernandes \(Google\)" <joel@joelfernandes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 01:05:36AM +0200, Dmitry Baryshkov wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> On 10/03/2023 00:20, Jordan Crouse wrote:
> > While booting with amd,imageon on a headless target the GPU probe was
> > failing with -ENOSPC in get_pages() from msm_gem.c.
> > 
> > Investigation showed that the driver was using the default 16MB VRAM
> > carveout because msm_use_mmu() was returning false since headless devices
> > use a dummy parent device. Avoid this by extending the existing is_a2xx
> > priv member to check the GPU IOMMU state on all platforms and use that
> > check in msm_use_mmu().
> 
> I wonder if we can fix this by setting 'dummy_dev'->of_node to adreno's
> of_node. Did you check that possibility?

I said I would check and then never looped back around. This will stick
on my todo list for now and I'll check on the next cycle. If anybody
else wants to jump in the meantime then please go for it.

Jordan
