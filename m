Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FC5BBF6E
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 21:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C7410E094;
	Sun, 18 Sep 2022 19:00:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC61110E094
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 19:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663527645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ntfG6m3XukpehMT9ynYAfOYGrRenT9mf+94yaoj+iew=;
 b=M2njh5MzayryADp9RB2I7xbD/V7yqtl9BKULjOjMwwAS0UPOH433qc9Or7QhQyA9J5YAHB
 CEi5/d6seZtKKBJPf8tLj4jMszbd7JjACcUMgoIMoGdvASo2lc5pvpb8SwVUh+hbIFNcpv
 VRAx3Zwmnn2aQGLlI9XaEr6v7mKwObk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-t0d1l71kOZShve0U4cxyqA-1; Sun, 18 Sep 2022 15:00:44 -0400
X-MC-Unique: t0d1l71kOZShve0U4cxyqA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b17-20020a056402351100b00453b19d9bd0so2338876edd.4
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 12:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=ntfG6m3XukpehMT9ynYAfOYGrRenT9mf+94yaoj+iew=;
 b=4sy0tMNNYj1c/XGmPcF1SpT3nG+YZh+60oC7cpmw1WnpZev6zAVrJ4NKrKsZchx/Vw
 NzE15jkuOho5U3px8RgOSLQY0mt35jc23g6tWjgOM2cLut8Ch1e+U5QA9UMqbEJF5GLT
 8dSaKYo1sAK+JV5jpfm29yGiLxqv0GkKbWYESBylK9XMBoVqWS21zIPdtExS7KQ0BOET
 GGoATYtt5Djk1m6GJSvGtZ97rAkys8yk6RkjBqNfS+oxiWiNglxpmVF0ocOFYaa9xeYn
 w26V/Zz57M92w+U9RnPYv0q57aDf3ijc2CcCzKMLNBOKeUngBS92XEbpCzOcfbCt+CFn
 ULNA==
X-Gm-Message-State: ACrzQf2IdSXgX9qFafJP2GcYEEzwUkSjPGbhbs7VbIvqKk6gDRuvJFmk
 79begdUJwjSI393io8NpdI49GCPebFtyRv2KEMOBzf6QfOJX/uZHG5q3fhoKcaRW9auVJwg7RPN
 KL4U9YzUgRI59R6mwcrZ0BqiuqSK9
X-Received: by 2002:a17:907:a052:b0:780:c4e4:1715 with SMTP id
 gz18-20020a170907a05200b00780c4e41715mr7105744ejc.55.1663527643059; 
 Sun, 18 Sep 2022 12:00:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6MqfZRF3v+ZZLGtIiNYXXd2sp5YCXMB1UO73izqgFJSJgOKV0+Tr5NF8T6PMrRQDFFniYvow==
X-Received: by 2002:a17:907:a052:b0:780:c4e4:1715 with SMTP id
 gz18-20020a170907a05200b00780c4e41715mr7105737ejc.55.1663527642915; 
 Sun, 18 Sep 2022 12:00:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 r28-20020a50aadc000000b0044ee18e5f79sm18686361edc.28.2022.09.18.12.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 12:00:42 -0700 (PDT)
Message-ID: <112e1e05-f80b-637b-c04b-3c84bc632fa6@redhat.com>
Date: Sun, 18 Sep 2022 21:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 0/5] drm/gma500: Backlight handling changes
To: Sam Ravnborg <sam@ravnborg.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220917205920.647212-1-hdegoede@redhat.com>
 <CAMeQTsZ3Z76QFWgCVPxKdaZ+=KK-9Dqxx9R0G3fs8i3Bob7B6Q@mail.gmail.com>
 <YydouJwGNWl6xoNA@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YydouJwGNWl6xoNA@ravnborg.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 9/18/22 20:51, Sam Ravnborg wrote:
> Hi Hans,
> 
>>> Changes in v3:
>>> - Fix unused variable warnings when CONFIG_BACKLIGHT is not selected by
>>>   marking the 2 variables as  __maybe_unused.
>>
>> This looks good to me. I don't have access to my DIM setup in a couple
>> of days so please push these yourself if possible.
>>
>> For the entire series:
>> Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> 
> I did not find time today - sorry.

No worries.

> I you want to wait then I can take a look in the weekend - but not until
> then.

I just got an Ack from Patrik for these and I'm going to push them
to drm-misc-next now. So another review is not necessary, thank you for
the offer though!

Regards,

Hans

