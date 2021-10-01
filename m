Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BCF41F56B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 21:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2868A6F37F;
	Fri,  1 Oct 2021 19:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6F16F37F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 19:04:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633115054; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ztpbbep24qDfIgL0za8IxIXoVxFrEu0ZThZtqBlDFC4=;
 b=nG7rY7rn7bHrSD6X5hVA1tf4/Kb+Lf9VWtuk4aeFOTDtQBKxn0H9h13/ZIpE9JWrsjPbz3Pp
 RxwOQLI7hnYqg34YC+cngSvbGv3hDjhNA0pvsLkVG6LXJW84N2w5f8u7N0N+Tr00E/LpYeIy
 gJyop1gLIRAEtv9vVsKlHaMmQU0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61575b89fc6e34f8cdf5199c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 19:03:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4464CC4360C; Fri,  1 Oct 2021 19:03:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B62E9C4338F;
 Fri,  1 Oct 2021 19:03:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Oct 2021 12:03:36 -0700
From: jesszhan@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: jsanka@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: Add SDM845 DPU support
In-Reply-To: <20211001135033.GZ2083@kadam>
References: <20211001134912.GA9248@kili> <20211001135033.GZ2083@kadam>
Message-ID: <aee1c5723cf0be018c8f9b8bcbd834f0@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
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

Hey Dan,

Thanks for the report, will take care of it.

On 2021-10-01 06:50, Dan Carpenter wrote:
> On Fri, Oct 01, 2021 at 04:49:12PM +0300, Dan Carpenter wrote:
>> Hello Jeykumar Sankaran,
>> 
>> This is a semi-automatic email about new static checker warnings.
>> 
>> The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
>> 27, 2018, leads to the following Smatch complaint:
>> 
>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:422 
>> _dpu_hw_sspp_setup_scaler3()
>>     warn: variable dereferenced before check 'ctx->cap->sblk' (see 
>> line 421)
>> 
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>    420		(void)pe;
>>                 ^^^^^^^^^
>> You should file a bug report with your compiler devs instead of adding
>> these sorts of statements to your code.  This function is used as a
>> function pointer so unused parameters are normal.
>> 
>>    421		if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || 
>> !sspp
>>                     ^^^^^^^^^^^^^^^^^^^^
>> The _sspp_subblk_offset() dereferenced "ctx" before it is checked and
>> then it also derefereces "ctx->cap->sblk" without checking.
>> 
>>    422			|| !scaler3_cfg || !ctx || !ctx->cap || !ctx->cap->sblk)
>>                                            
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> So these will have already crashed before we reach this point.
>> 
> 
> Same thing later as well.
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:591 
> dpu_hw_sspp_setup_creq_lut()
> warn: variable dereferenced before check 'ctx->cap' (see line 588)
> 
> regards,
> dan carpenter

Best,
Jessica Zhang
