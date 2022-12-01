Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F00863F293
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 15:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD65E10E084;
	Thu,  1 Dec 2022 14:20:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3510E084
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669904412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UL+11YzwRMq0T/IKO+WwZ5npDM0ydsEBdf1xuseJVSI=;
 b=Fxz2pkzD9daWevmSlldIs1INK2+7sgbhoP8jzyQVPpohQgHy5ApTkFQTrKTxrFgUiE7tSe
 7LwiGTbnzBPik1ILt9vlb67HbP+XdJi1FG4KOQZQjj1wF6Hk6I+MHyzZfB9Kt++dhHoJgP
 0OyAg9QwRUxeWqfLPOSp+bj9Eyb4hyk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-531-YRKLFRUVNleyFOdNgDc85Q-1; Thu, 01 Dec 2022 09:20:11 -0500
X-MC-Unique: YRKLFRUVNleyFOdNgDc85Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b003cfa148576dso913423wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 06:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UL+11YzwRMq0T/IKO+WwZ5npDM0ydsEBdf1xuseJVSI=;
 b=3c95Ds4SS7UrigTYUKjMa7NmYJHRfE0ns2zNwKYgBtNSVbzQN0M74rNNmi7R0M0I/v
 qeNcVeLpk9kxq2faKy6QxhS0HkqwrIj4tuMpxCv0IhhSs9ZfK0GsoD71wmnWqjWztJ7M
 YUOVqO+VowXDB4BDSqd8RMFz2A4Gn209okuCTHkb64eOsKFrhHS9rsZD2pi4wRMQ1y18
 is+oeNhKsIXiwPpau5aFnEVJ950iTWMll8IO68DnJiUN9xd/liwoqmXZTGqKj6GsawvW
 xbhJDxoFm/QOpTMqkdrwMzPTolPjAt9X2uzSCzwtHwLu+ranhpqc0Xr9uRTljfa9IqkZ
 nXlg==
X-Gm-Message-State: ANoB5pmXBj/fwNLTBHfklOmbEEOMBGTqWhmPL5V5vznRIDuwtB0w+34Z
 tq1PvwoaxyxNDM3y8Og8gOz3pBtaiU16ocob31600cuQ1+iUGgTAA1dsNj/6pAmb6Opstnr52La
 0w3PNNU6WUpcMBjhuAuJle+lbzSTW
X-Received: by 2002:a5d:48c3:0:b0:241:784b:1b7f with SMTP id
 p3-20020a5d48c3000000b00241784b1b7fmr42307355wrs.38.1669904410169; 
 Thu, 01 Dec 2022 06:20:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf78vmNhN2aYjpR2i9zkuJGtaJbQex0dRKMP7qjt1YqKFKbZfo/c3YA99Qo6fthHMotc960Kow==
X-Received: by 2002:a5d:48c3:0:b0:241:784b:1b7f with SMTP id
 p3-20020a5d48c3000000b00241784b1b7fmr42307338wrs.38.1669904409959; 
 Thu, 01 Dec 2022 06:20:09 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 hg6-20020a05600c538600b003a6125562e1sm5451655wmb.46.2022.12.01.06.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 06:20:09 -0800 (PST)
Message-ID: <9521d865-7b65-9f38-6bef-7a79fdebb0b6@redhat.com>
Date: Thu, 1 Dec 2022 15:20:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
 <20221201141642.uvonbrny4rhuacl5@meerkat.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221201141642.uvonbrny4rhuacl5@meerkat.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 tools@linux.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/1/22 15:16, Konstantin Ryabitsev wrote:
> On Thu, Dec 01, 2022 at 02:34:41PM +0100, Javier Martinez Canillas wrote:
>>>> Konstantin,
>>>>
>>>> Can you add a rule in b4 to exclude stable@vger.kernel.org
>>>> (stable@kernel.org as well?) from getting the whole patchset?
>>>
>>> stable@kernel.org is a pipe to /dev/null so that's not needed to be
>>> messed with.
>>>
>>> As for this needing special casing in b4, it's rare that you send out a
>>> patch series and only want 1 or 2 of them in stable, right?
>>>
>>
>> Not really, it's very common for a patch-series to contain fixes (that could
>> go to stable if applicable) and change that are not suitable for stable. The
>> problem as Noralf mentioned is that the b4 tool doesn't seem to allow Cc'ing
>> individual patches to different recipients, and everyone get the whole set.
>>
>> So either b4 needs to have this support, exclude stable@vger.kernel.org when
>> sending a set or stable@vger.kernel.org ignore patches without a Fixes: tag.
> 
> I think what I can do is a special logic for Cc: trailers:
> 
> - Any Cc: trailers we find in the cover letter receive the entire series
> - Any Cc: trailers in individual patches only receive these individual patches
>

I think that make sense. It's similar to how for example patman works.
 
> Thank you for being patient -- we'll get this right, I promise.
> 

On the contrary, thanks a lot for working on this tool and for being
that responsive to the feedback.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

