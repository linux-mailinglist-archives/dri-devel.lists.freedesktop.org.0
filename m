Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170E7421AB6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A946EAB6;
	Mon,  4 Oct 2021 23:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179CD6EAB6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:33:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633390424; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xKw3S4eVAnAe0PZH7ljLCajrK3JGrlSAHfv8BQOXCQQ=;
 b=RFiIpfVt5pabNYZ4BMJFvJ0BEkbUvPsBEDISj0/7J8NfZF1vvVzhjncPzpgDUfTDfPf2IKkB
 XhllFWcFXt9oQzzhi/ujEaRFxtSnWLD9j9f0j+O0YWAV6QmGA6OtoSDsapyBXQeihwPu380C
 FyqxqKO4DLq5e1EhJo+jIvW3L2Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 615b8f400d9325367bc6aaad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 23:33:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7D63CC43617; Mon,  4 Oct 2021 23:33:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 91DDAC4360C;
 Mon,  4 Oct 2021 23:33:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Oct 2021 16:33:19 -0700
From: abhinavk@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rob Clark <robdclark@gmail.com>, Jordan Crouse
 <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Bjorn
 Andersson <bjorn.andersson@linaro.org>, Kalyan Thota
 <kalyan_t@codeaurora.org>, Xu Wang <vulab@iscas.ac.cn>, Jonathan Marek
 <jonathan@marek.ca>, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: potential error pointer dereference in init()
In-Reply-To: <20211004103806.GD25015@kili>
References: <20211004103806.GD25015@kili>
Message-ID: <a4c3bb99f1a898dbb222c80f74b5bdf4@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-10-04 03:38, Dan Carpenter wrote:
> The msm_iommu_new() returns error pointers on failure so check for that
> to avoid an Oops.
> 
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ae48f41821cf..ad247c06e198 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -908,6 +908,10 @@ static int _dpu_kms_mmu_init(struct dpu_kms 
> *dpu_kms)
>  		return 0;
> 
>  	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
> +	if (IS_ERR(mmu)) {
> +		iommu_domain_free(domain);
> +		return PTR_ERR(mmu);
> +	}
>  	aspace = msm_gem_address_space_create(mmu, "dpu1",
>  		0x1000, 0x100000000 - 0x1000);
