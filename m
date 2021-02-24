Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F38323633
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 04:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49626E433;
	Wed, 24 Feb 2021 03:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z11.mailgun.us (z11.mailgun.us [104.130.96.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BCD6E433
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 03:49:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614138558; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Gz/nJPrGJP7gB6ntnx6Dmk5y7Vmp4Se23+LdipuUkhg=;
 b=UXrCy/jqRum7KuNdNGQgoVpldAtJ1FbUZU6FJmIID0YMKOoKwSE/SXIM025W6t6QzUezXb5C
 myW38QgqcDQ9H6o78LoG1GRbQSv64uh/wZNZsbS3pheEw3JHQpss3SEpBrcwwHS6NpxuypQ1
 99Ma7T+BIRElfPpvlkySIwlmsBE=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6035ccaf2a8ee88ea5204d2b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 03:49:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BE798C43462; Wed, 24 Feb 2021 03:49:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: kgunda)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44506C433C6;
 Wed, 24 Feb 2021 03:49:03 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 24 Feb 2021 09:19:03 +0530
From: kgunda@codeaurora.org
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH V1 0/2] Fix WLED FSC Sync and brightness Sync settings
In-Reply-To: <20210219180839.GB8596@duo.ucw.cz>
References: <1613743659-4726-1-git-send-email-kgunda@codeaurora.org>
 <20210219180839.GB8596@duo.ucw.cz>
Message-ID: <1fcacbe5de8dd7d3a0df2b6108d734f6@codeaurora.org>
X-Sender: kgunda@codeaurora.org
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org, jacek.anaszewski@gmail.com,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-19 23:38, Pavel Machek wrote:
> Hi!
> 
>> The FSC (Full scale current) setting is not updated properly due to 
>> the
>> wrong register toggling for WLED5. Also the ILED_SYNC toggle and 
>> MOD_SYNC
>> toggle sequence is updated as per the hardware team recommendation to 
>> fix
>> the FSC update and brightness update issue.
> 
> If this is phone hardware, it might make sense to cc:
> phone-devel@vger...
> 
Yes. it is for phone hardware. Will cc the email.
> Best regards,
> 									Pavel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
