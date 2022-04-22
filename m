Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1611B50BEC2
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 19:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAFE10E064;
	Fri, 22 Apr 2022 17:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F5310E064;
 Fri, 22 Apr 2022 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1650648921; x=1682184921;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0fpFqQYd/Wbv3V4oC9q2pZUt7Qc5kv653iWEvAomgFI=;
 b=XchOxQzDHZp+AuuEh9zTL+U7Sa+fQdNsYLaRKuSsSaBySdnrNDEPODrq
 zeCnfb3CyzVeukTPoFtpPdcg56OHoUpHjUpuNHxRH4S5C0g/s2EhCdhYl
 e3l5IgXsWR6MZ3KikjXBUXefiJ4TzBjQW/RqrswszZrISJ9wJwZefZ4GE I=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Apr 2022 10:35:21 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 10:35:20 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 22 Apr 2022 10:35:18 -0700
Received: from [10.111.175.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 22 Apr
 2022 10:35:15 -0700
Message-ID: <c68e92ea-ee92-6aeb-1d51-5e265052ef43@quicinc.com>
Date: Fri, 22 Apr 2022 10:35:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and REPLUG
 interrupts for eDP
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=WWa8n0MJB8ks7bgrSj1Qop1Z5hvfEAOWtFcmsz38eR_w@mail.gmail.com>
 <83129bad-44a9-bec7-f931-8067ef1b9d4d@quicinc.com>
 <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 4/22/2022 9:10 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 22, 2022 at 9:05 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Doug
>>
>> For the lockdep error, the splat looks similar to what kuogee fixed
>> recently.
>>
>> Can you please check if below patch is present in your tree?
>>
>> https://patchwork.freedesktop.org/patch/481396/
> 
> Indeed I did have that in my tree already, but the lockdep splat is
> still there. I think the problem is that we're now calling
> dp_hpd_plug_handle() directly in dp_bridge_enable()
> 
> -Doug

Yes, now i understood this particular issue better and not sure how this 
wasn't caught. Perhaps some difference in the USE flags. Sankeerth didnt 
have lockdebug and thats why didnt hit this.

I have discussed with kuogee about why this change is needed and why 
this wasnt being done in get_modes().

It seems like originally, this was done for a quirk in the DP compliance 
equipment that it did not publish the fail safe mode ( even though some 
other modes were present ). Typically, any sink (as long as EDID read 
went through ) adds the 640x480 fail safe mode.

We could have done it in get_modes() even earlier but not sure how it 
was missed or was there some other reason.

Nonetheless, kuogee will post the change to move this to get_modes() 
shortly.

Thanks

Abhinav
