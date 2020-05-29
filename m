Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF21E1E902A
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD846E9CF;
	Sat, 30 May 2020 09:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B0236E924
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 15:00:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D452F1045;
 Fri, 29 May 2020 08:00:58 -0700 (PDT)
Received: from [10.37.12.52] (unknown [10.37.12.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C41F73F718;
 Fri, 29 May 2020 08:00:48 -0700 (PDT)
Subject: Re: [PATCH v8 0/8] Add support for devices in the Energy Model
To: rjw@rjwysocki.net
References: <20200527095854.21714-1-lukasz.luba@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <8fca24a1-93f7-f859-bd1f-b7bf484737f4@arm.com>
Date: Fri, 29 May 2020 16:00:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200527095854.21714-1-lukasz.luba@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, daniel.lezcano@linaro.org, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rafael,


On 5/27/20 10:58 AM, Lukasz Luba wrote:
> Hi all,
> 
> Background of this version:
> This is the v8 of the patch set and is has smaller scope. I had to split
> the series into two: EM changes and thermal changes due to devfreq
> dependencies. The patches from v7 9-14 which change devfreq cooling are
> going to be sent in separate patch series, just after this set get merged
> into mainline. These patches related to EM got acks and hopefully can go
> through linux-pm tree. The later thermal patches will go through thermal
> tree.
> 
> The idea and purpose of the Energy Model framework changes:
> This patch set introduces support for devices in the Energy Model (EM)
> framework. It will unify the power model for thermal subsystem. It will
> make simpler to add support for new devices willing to use more
> advanced features (like Intelligent Power Allocation). Now it should
> require less knowledge and effort for driver developer to add e.g.
> GPU driver with simple energy model. A more sophisticated energy model
> in the thermal framework is also possible, driver needs to provide
> a dedicated callback function. More information can be found in the
> updated documentation file.
> 
> First 7 patches are refactoring Energy Model framework to add support
> of other devices that CPUs. They change:
> - naming convention from 'capacity' to 'performance' state,
> - API arguments adding device pointer and not rely only on cpumask,
> - change naming when 'cpu' was used, now it's a 'device'
> - internal structure to maintain registered devices
> - update users to the new API
> Patch 8 updates OPP framework helper function to be more generic, not
> CPU specific.
> 
> The patch set is based on linux-pm branch linux-next 813946019dfd.
> 

Could you take the patch set via your linux-pm?

Regards,
Lukasz
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
