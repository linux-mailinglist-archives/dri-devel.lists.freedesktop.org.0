Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604C044EAE6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 16:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A676EB85;
	Fri, 12 Nov 2021 15:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2957 seconds by postgrey-1.36 at gabe;
 Fri, 12 Nov 2021 15:58:32 UTC
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63FA6EB2E;
 Fri, 12 Nov 2021 15:58:32 +0000 (UTC)
Received: from pps.filterd (m0122331.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ACCV105004786;
 Fri, 12 Nov 2021 15:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=Tc1oqeLZzfNhAszq2bpTX2swrtLZAsuMR3FfV9S+7XQ=;
 b=greD1YrC0B++LQXw2t40C+Al8yoOF4w3jDAlVOkGmQQr/WSHw8hE7xbeRoNazshoypPL
 5nEgSPPbrQ1Glm4HrH5thJPAvj8Vs8536O+/wM/1i0d/zKHaab12n1Ho10Pm/BjCDirl
 Nt4ML1KC8V3Gjh1s7w0MWIkECUMODFCP+Pvf9VdIzIqjnVgMqR7k4UtAzHBlYVOSJa+e
 0CrTMzx0QRdmRNzfF07wcdcIy7k77/c8q/cUAv80+vfCY3WfB6gmm6H+Q+rjwYqiDZCS
 NaWBtC9h0tLa9xDjXpAJOuQhY+jZ8J+IUgT2eyYXiO+9QgvTf/hZFeyNVpuGH9pqMRWM Jw== 
Received: from prod-mail-ppoint7
 (a72-247-45-33.deploy.static.akamaitechnologies.com [72.247.45.33] (may be
 forged))
 by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3c9rbgaw4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 15:08:44 +0000
Received: from pps.filterd (prod-mail-ppoint7.akamai.com [127.0.0.1])
 by prod-mail-ppoint7.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 1ACF45Mu022259; Fri, 12 Nov 2021 10:08:44 -0500
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
 by prod-mail-ppoint7.akamai.com with ESMTP id 3c7tffmun3-1;
 Fri, 12 Nov 2021 10:08:43 -0500
Received: from [0.0.0.0] (unknown [172.27.119.138])
 by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id 24FAB57B;
 Fri, 12 Nov 2021 15:08:42 +0000 (GMT)
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Jim Cromie <jim.cromie@gmail.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
Date: Fri, 12 Nov 2021 10:08:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211112114953.GA1381@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-11-12_05:2021-11-11,
 2021-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111120086
X-Proofpoint-GUID: uhHmDAKu5ii3jEYUIQwvrN1aMKrmTEYA
X-Proofpoint-ORIG-GUID: uhHmDAKu5ii3jEYUIQwvrN1aMKrmTEYA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111120086
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
Cc: quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 dri-devel@lists.freedesktop.org, will@kernel.org, maz@kernel.org,
 amd-gfx@lists.freedesktop.org, mingo@redhat.com, daniel.vetter@ffwll.ch,
 arnd@arndb.de, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rostedt@goodmis.org, seanpaul@chromium.org,
 intel-gvt-dev@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 sean@poorly.run, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 quic_psodagud@quicinc.com, mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/12/21 6:49 AM, Vincent Whitchurch wrote:
> On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:
>> Sean Paul proposed, in:
>> https://urldefense.com/v3/__https://patchwork.freedesktop.org/series/78133/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRA8Dki4A$ 
>> drm/trace: Mirror DRM debug logs to tracefs
>>
>> His patchset's objective is to be able to independently steer some of
>> the drm.debug stream to an alternate tracing destination, by splitting
>> drm_debug_enabled() into syslog & trace flavors, and enabling them
>> separately.  2 advantages were identified:
>>
>> 1- syslog is heavyweight, tracefs is much lighter
>> 2- separate selection of enabled categories means less traffic
>>
>> Dynamic-Debug can do 2nd exceedingly well:
>>
>> A- all work is behind jump-label's NOOP, zero off cost.
>> B- exact site selectivity, precisely the useful traffic.
>>    can tailor enabled set interactively, at shell.
>>
>> Since the tracefs interface is effective for drm (the threads suggest
>> so), adding that interface to dynamic-debug has real potential for
>> everyone including drm.
>>
>> if CONFIG_TRACING:
>>
>> Grab Sean's trace_init/cleanup code, use it to provide tracefs
>> available by default to all pr_debugs.  This will likely need some
>> further per-module treatment; perhaps something reflecting hierarchy
>> of module,file,function,line, maybe with a tuned flattening.
>>
>> endif CONFIG_TRACING
>>
>> Add a new +T flag to enable tracing, independent of +p, and add and
>> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
>> the flag checks.  Existing code treats T like other flags.
> 
> I posted a patchset a while ago to do something very similar, but that
> got stalled for some reason and I unfortunately didn't follow it up:
> 
>  https://urldefense.com/v3/__https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/__;!!GjvTz_vk!HcKnMRByYkIdyF1apqQjlN5aBIomzJR1an3YWXM6KXs0EftVMQdrewRGytKHPg$ 
> 
> A key difference between that patchset and this patch (besides that
> small fact that I used +x instead of +T) was that my patchset allowed
> the dyndbg trace to be emitted to the main buffer and did not force them
> to be in an instance-specific buffer.

Yes, I agree I'd prefer that we print here to the 'main' buffer - it seems to keep things simpler and easier to combine the output from different
sources as you mentioned.

Thanks,

-Jason

> 
> That feature is quite important at least for my use case since I often
> use dyndbg combined with function tracing, and the latter doesn't work
> on non-main instances according to Documentation/trace/ftrace.rst.
> 
> For example, here's a random example of a bootargs from one of my recent
> debugging sessions:
> 
>  trace_event=printk:* ftrace_filter=_mmc*,mmc*,sd*,dw_mci*,mci*
>  ftrace=function trace_buf_size=20M dyndbg="file drivers/mmc/* +x"
> 
