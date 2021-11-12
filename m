Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A398644EC06
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 18:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603346E948;
	Fri, 12 Nov 2021 17:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81FD6E948;
 Fri, 12 Nov 2021 17:33:07 +0000 (UTC)
Received: from pps.filterd (m0050093.ppops.net [127.0.0.1])
 by m0050093.ppops.net-00190b01. (8.16.1.2/8.16.1.2) with ESMTP id
 1ACEa4Ps002486; Fri, 12 Nov 2021 17:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=FTlTtb3zf+ArAjPKIlpds0r2Pc/R15ABpwRa+8kNx84=;
 b=Qrku+j2FDb2T7/JmMNGQ2mv2vlFdhF6hqFjwF1Fq3FKW8o2YjSRtVKGqfmP2AelRdZ8s
 lsj6/aPejEpLyBQvimPJs1zgzO46h80TyrEOErCxUMLqfKe83hj40XY5XqJyOE1AQiZR
 kCFdqFjL2gtLX4v0515fB6n4osEADBgS5S3wC6Xyn/TcT6mX/qWzS0wFtEgqQ44Bb5t6
 w5qj7G3vorPJ8ISSDqeZYZmk936QqH/F0nMaonYn0MaqDE99wXHnRxuOK8nEZoRUml8U
 4+95GVpu49sERr+PXbHpx7c/pMoRnbS3XuhHhZC5wttSpC6XYpK+hwquxUfjRZ4Gkzut yg== 
Received: from prod-mail-ppoint6 (prod-mail-ppoint6.akamai.com [184.51.33.61]
 (may be forged))
 by m0050093.ppops.net-00190b01. (PPS) with ESMTPS id 3c98cd39x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Nov 2021 17:32:25 +0000
Received: from pps.filterd (prod-mail-ppoint6.akamai.com [127.0.0.1])
 by prod-mail-ppoint6.akamai.com (8.16.1.2/8.16.1.2) with SMTP id
 1ACH53PX024205; Fri, 12 Nov 2021 12:32:24 -0500
Received: from prod-mail-relay11.akamai.com ([172.27.118.250])
 by prod-mail-ppoint6.akamai.com with ESMTP id 3c81umn6j7-1;
 Fri, 12 Nov 2021 12:32:24 -0500
Received: from [0.0.0.0] (prod-ssh-gw01.bos01.corp.akamai.com [172.27.119.138])
 by prod-mail-relay11.akamai.com (Postfix) with ESMTP id 9B1E627A16;
 Fri, 12 Nov 2021 17:32:23 +0000 (GMT)
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
To: Steven Rostedt <rostedt@goodmis.org>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211112120721.3a4827ce@gandalf.local.home>
From: Jason Baron <jbaron@akamai.com>
Message-ID: <cfbc074c-73a5-b6be-580b-dae398d95d6b@akamai.com>
Date: Fri, 12 Nov 2021 12:32:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211112120721.3a4827ce@gandalf.local.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.790
 definitions=2021-11-12_05:2021-11-11,
 2021-11-12 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=799 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111120096
X-Proofpoint-ORIG-GUID: whcCdKJ9XqGmPezo_Z88Q4exD-BG-aSS
X-Proofpoint-GUID: whcCdKJ9XqGmPezo_Z88Q4exD-BG-aSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-12_05,2021-11-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxlogscore=842 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111120097
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
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 amd-gfx@lists.freedesktop.org, mingo@redhat.com, daniel.vetter@ffwll.ch,
 arnd@arndb.de, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, sean@poorly.run,
 Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, quic_psodagud@quicinc.com,
 mathieu.desnoyers@efficios.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/12/21 12:07 PM, Steven Rostedt wrote:
> On Fri, 12 Nov 2021 10:08:41 -0500
> Jason Baron <jbaron@akamai.com> wrote:
> 
>>> A key difference between that patchset and this patch (besides that
>>> small fact that I used +x instead of +T) was that my patchset allowed
>>> the dyndbg trace to be emitted to the main buffer and did not force them
>>> to be in an instance-specific buffer.  
>>
>> Yes, I agree I'd prefer that we print here to the 'main' buffer - it seems to keep things simpler and easier to combine the output from different
>> sources as you mentioned.
> 
> I do not want anything to print to the "main buffer" that can not be
> filtered or turned off by the tracing infrastructure itself (aka tracefs
> file system).
> 
> Once we allow that, then the trace file will become useless because
> everything will write to the main buffer and fill it with noise.
> 
> Events that can be enabled and disabled from tracefs are fine, as they can
> be limited. This is why I added that nasty warning if people leave around
> trace_printk(), because it does exactly this (write to the main buffer).
> It's fine for debugging a custom kernel, but should never be enabled in
> something that is shipped, or part of mainline.
> 
> -- Steve
> 

Ok, it looks like Vincent's patch defines a dyndbg event and then uses
'trace_dyndbg()' to output to the 'main' log. So all dynamic output to
the 'main' ftrace buffer goes through that event if I understand it
correctly. Here's a pointer to it for reference:

https://lore.kernel.org/lkml/20200825153338.17061-3-vincent.whitchurch@axis.com/

Would you be ok with that approach?

Thanks,

-Jason

