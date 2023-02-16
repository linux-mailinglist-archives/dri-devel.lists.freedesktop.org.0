Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A611F699B85
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 18:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9C10E149;
	Thu, 16 Feb 2023 17:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1552 seconds by postgrey-1.36 at gabe;
 Thu, 16 Feb 2023 17:47:16 UTC
Received: from mx0b-00190b01.pphosted.com (mx0b-00190b01.pphosted.com
 [IPv6:2620:100:9005:57f::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9725810E149;
 Thu, 16 Feb 2023 17:47:16 +0000 (UTC)
Received: from pps.filterd (m0122330.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31GEZ3Un025145; Thu, 16 Feb 2023 17:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=po1mytrc3hGhewQZJTcWp8dBR/9WcyX5DTv6Q2tYDWo=;
 b=WM3f14GuKAHQGpQjNmQZoBbiM2ql3S2f3qF4CYY+mpzMFgjkJIUO7+h0cbg+6uv94Scj
 yO6rAcSsh8ktrYcQy/wggtZ20DOVb+Uo0TU41stNZg8PQWNLkSXfVNshYIqn+gxNuLU6
 Gichax9EThpFI9k7UFXnKolhpkrBh9agd0egPL5p2SmvIhxaYGiiq16c+2blYaNUy6CO
 OM7EdVoPCZYxOQ7hhgZhKHMMn9FdWjJ4nsCkt7fEDgWuCmPwduDH70iqX2b50Uv357oa
 FDjTu7E1a+nKHOt+Y76iuYTzFYN1gvFTHfY6oAbrP1KfZCkATrzATfJ2HpYyTXnTMD4Y 1Q== 
Received: from prod-mail-ppoint4
 (a72-247-45-32.deploy.static.akamaitechnologies.com [72.247.45.32] (may be
 forged))
 by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3np3j7w1ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Feb 2023 17:21:09 +0000
Received: from pps.filterd (prod-mail-ppoint4.akamai.com [127.0.0.1])
 by prod-mail-ppoint4.akamai.com (8.17.1.19/8.17.1.19) with ESMTP id
 31GH2bZI003816; Thu, 16 Feb 2023 12:21:08 -0500
Received: from prod-mail-relay19.dfw02.corp.akamai.com ([172.27.165.173])
 by prod-mail-ppoint4.akamai.com (PPS) with ESMTP id 3np783pxg5-1;
 Thu, 16 Feb 2023 12:21:08 -0500
Received: from [172.19.46.2] (bos-lpa4700a.bos01.corp.akamai.com [172.19.46.2])
 by prod-mail-relay19.dfw02.corp.akamai.com (Postfix) with ESMTP id 40F1060278; 
 Thu, 16 Feb 2023 17:21:07 +0000 (GMT)
Message-ID: <8ca08fba-1120-ca86-6129-0b33afb4a1da@akamai.com>
Date: Thu, 16 Feb 2023 12:21:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 20/20] jump_label: RFC - tolerate toggled state
To: Peter Zijlstra <peterz@infradead.org>, Jim Cromie <jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
 <20230113193016.749791-21-jim.cromie@gmail.com>
 <Y8aNMxHpvZ8qecSc@hirez.programming.kicks-ass.net>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <Y8aNMxHpvZ8qecSc@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_13,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160150
X-Proofpoint-ORIG-GUID: erwF1POyva0bWaz2e82KJguAff2y8qIj
X-Proofpoint-GUID: erwF1POyva0bWaz2e82KJguAff2y8qIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-16_13,2023-02-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 spamscore=0 clxscore=1011 bulkscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302160150
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/17/23 6:57 AM, Peter Zijlstra wrote:
> On Fri, Jan 13, 2023 at 12:30:16PM -0700, Jim Cromie wrote:
>> __jump_label_patch currently will "crash the box" if it finds a
>> jump_entry not as expected.  ISTM this overly harsh; it doesn't
>> distinguish between "alternate/opposite" state, and truly
>> "insane/corrupted".
>>
>> The "opposite" (but well-formed) state is a milder mis-initialization
>> problem, and some less severe mitigation seems practical.  ATM this
>> just warns about it; a range/enum of outcomes: warn, crash, silence,
>> ok, fixup-continue, etc, are possible on a case-by-case basis.
>>
>> Ive managed to create this mis-initialization condition with
>> test_dynamic_debug.ko & _submod.ko.  These replicate DRM's regression
>> on DRM_USE_DYNAMIC_DEBUG=y; drm.debug callsites in drivers/helpers
>> (dependent modules) are not enabled along with those in drm.ko itself.
>>
> 
>> Ive hit this case a few times, but havent been able to isolate the
>> when and why.
>>
>> warn-only is something of a punt, and I'm still left with remaining
>> bugs which are likely related; I'm able to toggle the p-flag on
>> callsites in the submod, but their enablement still doesn't yield
>> logging activity.
> 
> Right; having been in this is state is bad since it will generate
> inconsistent code-flow. Full on panic *might* not be warranted (as it
> does for corrupted text) but it is still a fairly bad situation -- so
> I'm not convinced we want to warn and carry on.
> 
> It would be really good to figure out why the site was skipped over and
> got out of skew.
> 
> Given it's all module stuff, the 'obvious' case would be something like
> a race between adding the new sites and flipping it, but I'm not seeing
> how -- things are rather crudely serialized by jump_label_mutex.

Indeed, looks like dynamic debug introduces a new path in this series to 
that tries to toggle the jump label sites before they have been 
initialized, which ends up with the jump label key enabled but only some 
of the sites in the correct state. Then when the key is subsequently 
disabled it finds some in the wrong state. I just posted a patch for 
dynamic debug to use the module callback notifiers so it's ordered 
properly against jump label.

Note this isn't an issue in the current tree b/c there is no path to 
toggle the sites currently before they are initialized, but Jim's series 
here adds such a path.

Thanks,

-Jason


> 
> The only other option I can come up with is that somehow the update
> condition in jump_label_add_module() is somehow wrong.
> 
