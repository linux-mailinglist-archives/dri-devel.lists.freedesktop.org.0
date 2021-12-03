Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CBA467CED
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 19:03:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C185E6FDCF;
	Fri,  3 Dec 2021 18:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050::465:101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5D56FDCF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 18:03:17 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4J5LKH3TYGzQlCQ;
 Fri,  3 Dec 2021 19:03:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1638554593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgKbzRGAgEnnhDWMbkKCfokdG5mTh0JMqVV4eALHqnU=;
 b=ZWaicA8TbRi3Jk8RP+CPJeELTAmTTCDxxzBLH75IvqFyC5KXAzQu5bavilnNiVfqNCAnQk
 +OcfJtCBUKGMJvy0KZA0hjFHQ8l+hqTAH/WkARHkwV3xfUHTuHPJjpaPjQcgNCsTaRVyHm
 vLb+T0ybc9ZF4RTtk1OaPQ24jFGihVpUh5fc/q/NZq92ktsbaibotdNLnrMx/HR6t1QYCV
 KtYZDZw7B7dalznQQaWzKW0LK5T0FTRi/QAEbFry/BnqX1OopohfjNxvXWOyipKog+Kb0I
 e/eASfMqXcS06j0okM05jam2tdjLrV65wH5+RsFhK9nl3vUAAylU828flDFGqg==
Message-ID: <35169619-479d-24f4-c830-a95a9ef49bb1@mailbox.org>
Date: Fri, 3 Dec 2021 19:03:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm: send vblank event with the attached sequence rather
 than current
Content-Language: en-CA
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Mark Yacoub <markyacoub@chromium.org>, dri-devel@lists.freedesktop.org
References: <20211202151200.3125685-1-markyacoub@chromium.org>
 <392a239a-14da-c544-a1f9-09d8b25d3e07@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <392a239a-14da-c544-a1f9-09d8b25d3e07@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: chunkuang.hu@kernel.org, David Airlie <airlied@linux.ie>,
 jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org, tzungbi@google.com,
 seanpaul@chromium.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-03 16:58, Matthias Brugger wrote:
> Hi Mark,
> 
> On 02/12/2021 16:11, Mark Yacoub wrote:
>> From: Mark Yacoub <markyacoub@google.com>
>>
> 
> please make sure to add the linux-mediatek mailinglist in any follow-up communication.
> 
> Regards,
> Matthias
> 
>> [Why]
>> drm_handle_vblank_events loops over vblank_event_list to send any event
>> that is current or has passed.
>> More than 1 event could be pending with past sequence time that need to
>> be send. This can be a side effect of drivers without hardware vblank
>> counter and they depend on the difference in the timestamps and the
>> frame/field duration calculated in drm_update_vblank_count. This can
>> lead to 1 vblirq being ignored due to very small diff,

That sounds like the real issue which needs to be addressed. As Ville wrote, the sequence value in the event is supposed to be the current sequence, not the one which was specified originally by user space. So this change would basically break the universe. ;)


>> resulting in a subsequent vblank with 2 pending vblank events to be sent, each with a
>> unique sequence expected by user space.
>>
>> [How]
>> Send each pending vblank event with the sequence it's waiting on instead
>> of assigning the current sequence to all of them.
>>
>> Fixes igt@kms_flip "Unexpected frame sequence"
>> Tested on Jacuzzi (MT8183)
>>
>> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>> ---
>>   drivers/gpu/drm/drm_vblank.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 3417e1ac79185..47da8056abc14 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1902,7 +1902,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
>>             list_del(&e->base.link);
>>           drm_vblank_put(dev, pipe);
>> -        send_vblank_event(dev, e, seq, now);
>> +        send_vblank_event(dev, e, e->sequence, now);
>>       }
>>         if (crtc && crtc->funcs->get_vblank_timestamp)
>>



-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer
