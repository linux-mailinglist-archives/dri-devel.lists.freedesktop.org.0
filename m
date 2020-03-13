Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921FA186074
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 00:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDC16E2E2;
	Sun, 15 Mar 2020 23:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8CD26EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 16:52:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5818631B;
 Fri, 13 Mar 2020 09:52:00 -0700 (PDT)
Received: from [10.37.12.40] (unknown [10.37.12.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 019813F534;
 Fri, 13 Mar 2020 09:51:49 -0700 (PDT)
Subject: Re: [PATCH v4 4/4] drm/panfrost: Register devfreq cooling and attempt
 to add Energy Model
To: Steven Price <steven.price@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
References: <20200309134117.2331-1-lukasz.luba@arm.com>
 <20200309134117.2331-5-lukasz.luba@arm.com>
 <9747ca5c-ba4c-521f-11c1-45ee6a5018e3@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <c7453e1e-cb23-8e2a-d209-c618da9ffbbd@arm.com>
Date: Fri, 13 Mar 2020 16:51:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9747ca5c-ba4c-521f-11c1-45ee6a5018e3@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 15 Mar 2020 23:19:06 +0000
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
Cc: "nm@ti.com" <nm@ti.com>, "juri.lelli@redhat.com" <juri.lelli@redhat.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "bsegall@google.com" <bsegall@google.com>,
 Morten Rasmussen <Morten.Rasmussen@arm.com>,
 "amit.kucheria@verdurent.com" <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "khilman@kernel.org" <khilman@kernel.org>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 Javi Merino Cacho <Javi.MerinoCacho@arm.com>,
 "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
 "mingo@redhat.com" <mingo@redhat.com>, "mgorman@suse.de" <mgorman@suse.de>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "alyssa.rosenzweig@collabora.com" <alyssa.rosenzweig@collabora.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <Orjan.Eide@arm.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 "qperret@google.com" <qperret@google.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "agross@kernel.org" <agross@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Sudeep Holla <Sudeep.Holla@arm.com>,
 "patrick.bellasi@matbug.net" <patrick.bellasi@matbug.net>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 3/9/20 2:15 PM, Steven Price wrote:
> On 09/03/2020 13:41, Lukasz Luba wrote:
>> Register devfreq cooling device and attempt to register Energy Model. This
>> will add the devfreq device to the Energy Model framework. It will create
>> a dedicated and unified data structures used i.e. in thermal framework.
>> The last NULL parameter indicates that the power model is simplified and
>> created based on DT 'dynamic-power-coefficient', voltage and frequency.
>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> 
> LGTM!
> 
> Reviewed-by: Steven Price <steven.price@arm.com>

Thank you Steven. I will collect it for v5.

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
