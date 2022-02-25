Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC4B4C520F
	for <lists+dri-devel@lfdr.de>; Sat, 26 Feb 2022 00:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90810E1F6;
	Fri, 25 Feb 2022 23:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F78710E1E4;
 Fri, 25 Feb 2022 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645831619; x=1677367619;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QrWlnCsGic0hH9M/Mrb6hVymZpL3Bw56AzZSFjM2iis=;
 b=q6wWRQr7280IT61cujK+IE+BbW5DnGV88IHbce8oezG4BT2kCcMFx/G5
 aglo9HOXRAja9L05T9JKiwZRu3OC4jjvzLdQVZACR+H5qeNxba7TunjTG
 2pt1dMFyJF7tGhjV3DJEEjBqz0H3qIPqPyHfzVNxAi9fOX5bcrFBzULnQ c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 25 Feb 2022 15:26:59 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 15:26:58 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 15:26:48 -0800
Received: from [10.110.44.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Fri, 25 Feb
 2022 15:26:47 -0800
Message-ID: <d0677cbd-64f1-eb13-7aea-3de599134d09@quicinc.com>
Date: Fri, 25 Feb 2022 15:26:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220202085429.22261-1-suraj.kandpal@intel.com>
 <20220202085429.22261-6-suraj.kandpal@intel.com>
 <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com> <87y22ts948.fsf@intel.com>
 <CAA8EJprrhPtDkWRk8+6Wf+OoQi4u8m_t7G5guJQW+SNuttOSgQ@mail.gmail.com>
 <87sft1s1m5.fsf@intel.com>
 <MWHPR11MB17412030E65D4E4821549E24E33C9@MWHPR11MB1741.namprd11.prod.outlook.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <MWHPR11MB17412030E65D4E4821549E24E33C9@MWHPR11MB1741.namprd11.prod.outlook.com>
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
Cc: "carsten.haitzler@arm.com" <carsten.haitzler@arm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Suraj

On 2/22/2022 10:17 PM, Kandpal, Suraj wrote:
> Hey,
> 
>> The connector/encoder funcs you do have to pass to
>> drm_writeback_connector_init() can't use any of the shared driver
>> infrastructure that assume a certain inheritance.
>>
>> See also my reply to Laurent [1].
>>
>>> It well might be that we all misunderstand your design. Do you have a
>>> complete intel drm_writeback implementation based on this patchset? It
>>> would be easier to judge if the approach is correct seeing your
>>> target.
>>
>> That would be up to Suraj Kandpal.
> I have floated the intel drm_writeback implementation.
> Please refer to [1] to get a better understanding of how we are implementing
> writeback functionality.
> 
> [1] https://patchwork.freedesktop.org/series/100617/
> 
> Thanks,
> Suraj Kandpal

Based on the discussion in this thread [1] , it seems like having 
drm_encoder as a pointer seems to have merits for both of us and also in 
agreement with the folks on this thread and has a better chance of an ack.

However drm_connector is not.

I had a brief look at your implementation. Any reason you need to go 
through intel_connector here and not drm_writeback_connector directly?

The reason I ask is that I see you are not using prepare_writeback_job 
hook. If you use that, you can use the drm_writeback_connector passed on 
from there instead of looping through your list like you are doing in 
intel_find_writeback_connector.

Also, none of the other entries of struct intel_connector are being used 
for the writeback implementation. So does the drm_writeback_connector in 
your implementation need to be an intel_connector when its anyway not 
using other fields? Why cant it be just stored as a 
drm_writeback_connector itself in your struct intel_wd.

@@ -539,6 +540,8 @@  struct intel_connector {
  	struct work_struct modeset_retry_work;

  	struct intel_hdcp hdcp;
+
+	struct drm_writeback_connector wb_conn;
  };

[1] 
https://patchwork.kernel.org/project/dri-devel/patch/20220202085429.22261-6-suraj.kandpal@intel.com/#24747889

If you are in agreement with this, do you think you can re-spin the 
series only with the drm_encoder as a pointer without the drm_connector 
part.
