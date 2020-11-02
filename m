Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251112A2BCB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851B76E512;
	Mon,  2 Nov 2020 13:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176150.mail.qiye.163.com (m176150.mail.qiye.163.com
 [59.111.176.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC58E6E513
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 13:14:04 +0000 (UTC)
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
 by m176150.mail.qiye.163.com (Hmail) with ESMTP id 0DED61A3AFD;
 Mon,  2 Nov 2020 21:13:30 +0800 (CST)
Message-ID: <APsA*wDGDQPaL*xHM6wdLqpj.3.1604322810049.Hmail.bernard@vivo.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gZ3B1L2RybTogbWFrZSBjcnRjIGNoZWNrIGJlZm9yZSBuZXdfY29ubmVjdG9yIGNpcmNsZQ==?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.124
In-Reply-To: <20201102101724.GO401619@phenom.ffwll.local>
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.124) ] by ajax-webmail (
 [127.0.0.1] ) ; Mon, 2 Nov 2020 21:13:30 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Mon, 2 Nov 2020 21:13:30 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSkNIHkhDGE9OGkJOVkpNS09ISUlDSktKSUpVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU5CT0JOT09KQkNMN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Kwg6UQw*PD8qKxo3UQMzNk0MHzcKCxFVSFVKTUtPSElJQ0pLT0JIVTMWGhIXVRkeCRUaCR87
 DRINFFUYFBZFWVdZEgtZQVlKTkxVS1VISlVKSU9ZV1kIAVlBTUtNQjcG
X-HM-Tid: 0a75891758cf93b4kuws0ded61a3afd
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: opensource.kernel@vivo.com, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



From: Daniel Vetter <daniel@ffwll.ch>
Date: 2020-11-02 18:17:24
To:  Bernard Zhao <bernard@vivo.com>
Cc:  Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,Maxime Ripard <mripard@kernel.org>,Thomas Zimmermann <tzimmermann@suse.de>,David Airlie <airlied@linux.ie>,Daniel Vetter <daniel@ffwll.ch>,dri-devel@lists.freedesktop.org,linux-kernel@vger.kernel.org,opensource.kernel@vivo.com
Subject: Re: [PATCH] gpu/drm: make crtc check before new_connector circle>On Sun, Nov 01, 2020 at 06:58:51PM -0800, Bernard Zhao wrote:
>> In function prepare_signaling, crtc check (c==0) is not related
>> with the next new_connector circle, maybe we can put the crtc
>> check just after the crtc circle and before new_connector circle.
>> This change is to make the code to run a bit first.
>
>I'm a bit confused here with your explanation, I'm not understanding why
>you do this change ... Can you pls elaborate? Maybe give an example or
>something of the problem this patch solves, that often helps.
>
>Thanks, Daniel

Hi:

This change is to make the function return error earlier when run into the error branch:
if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
    return -EINVAL;
There two main FOR circles in this function, and the second FOR circle never changes the if condition("(c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))") variable`s value, like c & arg->flags.
So I think maybe we can check this condition before the second for circle, and return the error earlier when run into this error branch.

BR//Bernard

>> 
>> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>> ---
>>  drivers/gpu/drm/drm_atomic_uapi.c | 13 ++++++-------
>>  1 file changed, 6 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 25c269bc4681..566110996474 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1182,6 +1182,12 @@ static int prepare_signaling(struct drm_device *dev,
>>  
>>  		c++;
>>  	}
>> +	/*
>> +	 * Having this flag means user mode pends on event which will never
>> +	 * reach due to lack of at least one CRTC for signaling
>> +	 */
>> +	if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
>> +		return -EINVAL;
>>  
>>  	for_each_new_connector_in_state(state, conn, conn_state, i) {
>>  		struct drm_writeback_connector *wb_conn;
>> @@ -1220,13 +1226,6 @@ static int prepare_signaling(struct drm_device *dev,
>>  		conn_state->writeback_job->out_fence = fence;
>>  	}
>>  
>> -	/*
>> -	 * Having this flag means user mode pends on event which will never
>> -	 * reach due to lack of at least one CRTC for signaling
>> -	 */
>> -	if (c == 0 && (arg->flags & DRM_MODE_PAGE_FLIP_EVENT))
>> -		return -EINVAL;
>> -
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.29.0
>> 
>
>-- 
>Daniel Vetter
>Software Engineer, Intel Corporation
>http://blog.ffwll.ch


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
