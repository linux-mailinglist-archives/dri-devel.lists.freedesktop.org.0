Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B0D146353
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8840B6FB31;
	Thu, 23 Jan 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E636F9A6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 04:55:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1579755326; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=99PdJyM1Ez87NeZe2HjnZWq1VMrDCTFIbcSGdc8l8U4=;
 b=kNus4cw4gXcsrgRXyAuKuoDZefq9JJIcobicRkETh9YmBMtKrGTvpxLErZn6slWwY5Z2+/yQ
 qy5pLQqhHrPSxxJ0pYImBvu0eMrb5m7If3G4A+6Sm9BaYa7SLLjelwoSj7Rw80Ix/c18Rqzd
 FQ7ZExurchwmGnQVgkz21sOCjwQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e29273d.7fb053648880-smtp-out-n02;
 Thu, 23 Jan 2020 04:55:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8F802C447A1; Thu, 23 Jan 2020 04:55:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 99255C43383;
 Thu, 23 Jan 2020 04:55:24 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 23 Jan 2020 10:25:24 +0530
From: kgunda@codeaurora.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH -next v2] backlight: qcom-wled: fix unsigned comparison to
 zero
In-Reply-To: <20200122105540.w5vrvs34zxmhkjae@holly.lan>
References: <20200122013240.132861-1-chenzhou10@huawei.com>
 <20200122105540.w5vrvs34zxmhkjae@holly.lan>
Message-ID: <c9da004a1110b51d1737fe773901678b@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 Chen Zhou <chenzhou10@huawei.com>, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 lee.jones@linaro.org, linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-01-22 16:25, Daniel Thompson wrote:
> On Wed, Jan 22, 2020 at 09:32:40AM +0800, Chen Zhou wrote:
>> Fixes coccicheck warning:
>> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
>> 	WARNING: Unsigned expression compared with zero: string_len > 0
>> 
>> The unsigned variable string_len is assigned a return value from the 
>> call
>> to of_property_count_elems_of_size(), which may return negative error 
>> code.
>> 
>> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for 
>> WLED3")
>> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
Reviewed-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>> 
>> changes in v2:
>> - fix commit message description.
>> 
>> ---
>>  drivers/video/backlight/qcom-wled.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/video/backlight/qcom-wled.c 
>> b/drivers/video/backlight/qcom-wled.c
>> index d46052d..3d276b3 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -956,8 +956,8 @@ static int wled_configure(struct wled *wled, int 
>> version)
>>  	struct wled_config *cfg = &wled->cfg;
>>  	struct device *dev = wled->dev;
>>  	const __be32 *prop_addr;
>> -	u32 size, val, c, string_len;
>> -	int rc, i, j;
>> +	u32 size, val, c;
>> +	int rc, i, j, string_len;
>> 
>>  	const struct wled_u32_opts *u32_opts = NULL;
>>  	const struct wled_u32_opts wled3_opts[] = {
>> --
>> 2.7.4
>> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
