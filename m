Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DBD51DDAA
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5624610EEEE;
	Fri,  6 May 2022 16:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49C910E9AF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651854790; x=1683390790;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NUSDpDYK9LHoRDYP/GAG5zI9+n9lXCiukOajpSWRp7U=;
 b=SCMfjvm7IPTy3aeW2103g5sLBIX2xC9SxjzYQQkcDoKpJnNW/H59zZd+
 ZbdPuR+s3/HfqWCQEF2R8mG22kOyX7zbvK/mReS4+9lnhlImX8L27Wb8L
 mKb/f3AR6w9wcDDXgKNE/opK3ZRvUzQWE4DK1jcRPxqW84WM/j8btgpAZ Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 06 May 2022 09:33:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 09:33:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 6 May 2022 09:33:09 -0700
Received: from [10.111.168.240] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 6 May 2022
 09:33:04 -0700
Message-ID: <8ea03441-b835-f5db-5cc3-85e5330dfe3f@quicinc.com>
Date: Fri, 6 May 2022 09:33:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PATCH] drm/edid: drm_add_modes_noedid() should set lowest
 resolution as preferred
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, Doug Anderson
 <dianders@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20220426132121.RFC.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <CAD=FV=XViHtOoQH3fm4yoRcUAkLkf0Wf4zPXUH0Zq5_09tZmjw@mail.gmail.com>
 <874k22lxmh.fsf@intel.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <874k22lxmh.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani

On 5/6/2022 4:16 AM, Jani Nikula wrote:
> On Thu, 05 May 2022, Doug Anderson <dianders@chromium.org> wrote:
>> Ville,
>>
>> On Tue, Apr 26, 2022 at 1:21 PM Douglas Anderson <dianders@chromium.org> wrote:
>>>
>>> If we're unable to read the EDID for a display because it's corrupt /
>>> bogus / invalid then we'll add a set of standard modes for the
>>> display. When userspace looks at these modes it doesn't really have a
>>> good concept for which mode to pick and it'll likely pick the highest
>>> resolution one by default. That's probably not ideal because the modes
>>> were purely guesses on the part of the Linux kernel.
>>>
>>> Let's instead set 640x480 as the "preferred" mode when we have no EDID.
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>>   drivers/gpu/drm/drm_edid.c | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>
>> Someone suggested that you might have an opinion on this patch and
>> another one I posted recently [1]. Do you have any thoughts on it?
>> Just to be clear: I'm hoping to land _both_ this patch and [1]. If you
>> don't have an opinion, that's OK too.
>>
>> [1] https://lore.kernel.org/r/20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid
> 
> There are a number of drivers with combos:
> 
> 	drm_add_modes_noedid()
> 	drm_set_preferred_mode()
> 
> which I think would be affected by the change. Perhaps you should just
> call drm_set_preferred_mode() in your referenced patch?
> So it seems like many drivers handle the !edid case within their 
respective get_modes() call which probably is because they know the max 
capability of their connector and because they know which mode should be 
set as preferred. But at the same time, perhaps the code below which 
handles the count == 0 case should be changed like below to make sure we 
are within the max_width/height of the connector (to handle the first 
condition)?

diff --git a/drivers/gpu/drm/drm_probe_helper.c 
b/drivers/gpu/drm/drm_probe_helper.c
index 682359512996..6eb89d90777b 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -517,7 +517,8 @@ int drm_helper_probe_single_connector_modes(struct 
drm_connector *connector,

         if (count == 0 && (connector->status == 
connector_status_connected ||
                            connector->status == connector_status_unknown))
-               count = drm_add_modes_noedid(connector, 1024, 768);
+               count = drm_add_modes_noedid(connector, 
connector->dev->mode_config.max_width,
+                               connector->dev->mode_config.max_height);
         count += drm_helper_probe_add_cmdline_mode(connector);
         if (count == 0)
                 goto prune;


> Alternatively, perhaps drm_set_preferred_mode() should erase the
> previous preferred mode(s) if it finds a matching new preferred mode.
> 

But still yes, even if we change it like above perhaps for other non-DP 
cases its still better to allow individual drivers to pick their 
preferred modes.

If we call drm_set_preferred_mode() in the referenced patch, it will not 
address the no EDID cases because the patch comes into picture when 
there was a EDID with some modes but not with 640x480.

So i think the second proposal is a good one. It will cover existing 
users of drm_set_preferred_mode() as typically its called after 
drm_add_modes_noedid() which means the existing users want to "override" 
their preferred mode.

> 
> BR,
> Jani.
> 
