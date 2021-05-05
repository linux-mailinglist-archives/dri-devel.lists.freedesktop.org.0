Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E213738B2
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A6489AC9;
	Wed,  5 May 2021 10:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9196C89AC9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620211335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTN0y4oCcFWbB08r7lkZ4UjVsFr6S/2p9fg9DPkTRUA=;
 b=f7ieV3PsBlgkdaZUZkq3M2w9iSPaJpnjCUrT/Jr/+Roxr7P7P1gQPugd/yIbb0P4zgNYOO
 lzNTKPfpg8nFNe+Q70WpQfIxR0FncsRXOEb5eNi+eaCzjKajluhVYLpcLQlCEuxQzeLX+d
 XQKHTIoLbWoyIDPoj7HU/pF7oZ1C8uY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-oJnff9rFO3-eKdzQtE0xyg-1; Wed, 05 May 2021 06:42:14 -0400
X-MC-Unique: oJnff9rFO3-eKdzQtE0xyg-1
Received: by mail-ej1-f72.google.com with SMTP id
 r14-20020a1709062cceb0290373a80b4002so284675ejr.20
 for <dri-devel@lists.freedesktop.org>; Wed, 05 May 2021 03:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mTN0y4oCcFWbB08r7lkZ4UjVsFr6S/2p9fg9DPkTRUA=;
 b=F2L+eIVbBsMOlU6HohL6asT2aC2wzeqD9EAu2t2XtDVNtOiuInqjag2ag/D1wMBitv
 VVko6lfmn+nzlELG7+zmZO2Kjdn1/HqSzml+xWU9+ofvxOzP9uW+nMKhVaNhSJNaXvLm
 Km87oBAhIggUIxdjXliSDCu9IfKjOHMc5hmxWpr8FzbOvGmGaEI9ylFnA7sFaXBrPQEI
 mPKVvqguiuQjZHnNuf/qnLhH32lCJ5W3XZVDihvtmMW3v6YR/unY9LPauFS+P8pNXpiX
 HZIQm+xyb+nVx6UbgBZxLLxxvjPbwE94+yHOUsTCiAAG5vBDtdf3qSk0444QTdE2uB1o
 muig==
X-Gm-Message-State: AOAM532Aw3aRk4U0V5b4d0r/Dlq9htG8E1x5nDhX3oay9gsEH4PteddN
 7wAXelFm//d7s1x/wCuc7gYKa72u1pF1mqezIiHgkF18/kSy2MYS0eIEE8mteWIRT/qXGCwZ83B
 6q57lslfst5E5ywGz7wTej0gZ3ZuQ
X-Received: by 2002:a17:906:abcc:: with SMTP id
 kq12mr10305571ejb.97.1620211332825; 
 Wed, 05 May 2021 03:42:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT5NzeVG+LfxMtGXKXQs9mkRuGS75LOBk4BPyRER/VEFGmrGVCJeDof9BEBpxs3KV/LWSyYw==
X-Received: by 2002:a17:906:abcc:: with SMTP id
 kq12mr10305549ejb.97.1620211332659; 
 Wed, 05 May 2021 03:42:12 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id d15sm2632188ejj.42.2021.05.05.03.42.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 03:42:12 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug
 notification (v2)
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-5-hdegoede@redhat.com>
 <YJFj5Vk7xOcj+ISZ@kuha.fi.intel.com>
 <326621fe-cc4e-ad77-c87e-922a655bfbc8@redhat.com>
 <YJJqeVzS8do3F8wx@kuha.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a56b7d60-39a0-8520-8b38-82c0789e4442@redhat.com>
Date: Wed, 5 May 2021 12:42:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJJqeVzS8do3F8wx@kuha.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/5/21 11:50 AM, Heikki Krogerus wrote:
> On Tue, May 04, 2021 at 05:35:49PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/4/21 5:10 PM, Heikki Krogerus wrote:
>>>> +/**
>>>> + * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
>>>> + * @connector: connector to report the event on
>>>> + * @data: data related to the event
>>>> + *
>>>> + * On some hardware a hotplug event notification may come from outside the display
>>>> + * driver / device. An example of this is some USB Type-C setups where the hardware
>>>> + * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
>>>> + * status bit to the GPU's DP HPD pin.
>>>> + *
>>>> + * This function can be used to report these out-of-band events after obtaining
>>>> + * a drm_connector reference through calling drm_connector_find_by_fwnode().
>>>> + */
>>>> +void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
>>>> +				     struct drm_connector_oob_hotplug_event_data *data)
>>>> +{
>>>> +	struct drm_connector *connector;
>>>> +
>>>> +	connector = drm_connector_find_by_fwnode(connector_fwnode);
>>>> +	if (IS_ERR(connector))
>>>> +		return;
>>>> +
>>>> +	if (connector->funcs->oob_hotplug_event)
>>>> +		connector->funcs->oob_hotplug_event(connector, data);
>>>> +
>>>> +	drm_connector_put(connector);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
>>>
>>> So it does looks like the "data" parameter is not needed at all:
>>
>> Well Imre did indicate that having the number of lanes is useful, so
>> for the next version I'll drop the orientation but I plan to keep
>> the number of lanes if that is ok with you.
>>
>> Not having passing along this info was one of the reasons why my
>> previous attempt at this was nacked, so dropping it all together
>> feels wrong.
> 
> If you need to pass any information to the function, then you need to
> pass all the information that we have. Don't start with abstraction.
> First create a dedicated API, and then, only if we really have another
> user for it, we can add an abstraction layer that both users can use.
> All cases are going to be different. We don't know how the abstraction
> / generalisation should look like before we have at least two real
> users (ideally more than two, actually). Right now we can not even say
> for sure that generalising the API is even possible.
> 
> I would not make a huge deal out of this unless I wasn't myself being
> told by guys like Greg KH in the past to drop my attempts to
> "generalize" things from the beginning when I only had a single user.
> By doing so you'll not only force all ends, the source of the data
> (the typec drivers in this case) as well as the consumer (i915), to be
> always changed together, it will also confuse things. We are not
> always going to be able to tell the lane count for example like we can
> with USB Type-C, so i915 can't really rely on that information.
> 
> Right now we also don't know what exact details i915 (or what ever GPU
> driver) needs. We can only say for sure that some details are going to
> be needed. Trying to guess and cherry-pick the details now does not
> makes sense because of that reason too.
> 
> So just make this API USB Type-C DP Alt Mode specific API first, and
> supply it everything we have.

Hmm, ok I'll just drop the data argument all together for now (as you
already suggested); and then we can see what is best once an actual user
for the info shows up.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
