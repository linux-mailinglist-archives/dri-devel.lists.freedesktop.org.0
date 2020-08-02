Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6AF235A42
	for <lists+dri-devel@lfdr.de>; Sun,  2 Aug 2020 21:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E86C6E192;
	Sun,  2 Aug 2020 19:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E56B6E192
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Aug 2020 19:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596397387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4/Mw3KkAAcPCK4zYXwpvO5LLtv+hmKDZL07Q/dYPuw=;
 b=gs24Kwr2cuXfGZopPInP9zPTHjYq5/zYWU8aonpwh4ZzUR/Cjg5eq0/5w47rvFymoebUyD
 bTvZ+4lTODe3FcX+iLGEGlL/wSzOAvjxCAJcaRqHNVaGdjwl4fn/yFbpexvv58XPNhHMc0
 7X5WPRemuBYq7WtOsB+9hZpagSAIcFc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-QnKUCc79NwGcccu3OwOnWw-1; Sun, 02 Aug 2020 15:43:05 -0400
X-MC-Unique: QnKUCc79NwGcccu3OwOnWw-1
Received: by mail-ed1-f71.google.com with SMTP id i3so12152770edq.21
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Aug 2020 12:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U4/Mw3KkAAcPCK4zYXwpvO5LLtv+hmKDZL07Q/dYPuw=;
 b=UXDtP/6/oeHZXgYcYVIMCwQcpt7QNxCQt350/D/ycm49vm8Fuw4y3TkkxvBTnHmWAA
 +d9Je1ap4Ks4IZazxqnWdiJqtmqTr6uLI6o6gvkw8GB+4EPyaWmtMXSG8jJm4v6O/NVQ
 ilYalfqsdFZId1J7XlJlalziCoaf9Ex2qQwOZS6zbTu6hSiSypRkgp2J4+JLlvAKdY9+
 6QUhgkN6dUUalopGX4WtcsOt7XB1T4TnvOZzzKeEimhjzWmowGShJ+d8ZEuU1hSVO/cT
 yRjWICgKqnXdQlvqJf0BFTRYUzY1cLjosFABVaFDYeRxgPWbiSpPBomk8vH34BqtcNIa
 q6Ng==
X-Gm-Message-State: AOAM530O+5qHrqCI6w0dSDodSDO4vW2FrGEzmRvNy1VbKtRD/qqjJmVx
 0ifYgxHDHiC7PcArtFb8ZRplIYrhlLpqyth/Rka9QaENy8TQxJJqV/p/qQK9jpMkws6H4E1SkLJ
 Ljk0npk8hw1nQUV9P1BUE88XK1flJ
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr13098226eds.226.1596397384488; 
 Sun, 02 Aug 2020 12:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynUhl0t0uuVDdTx6s58FiK7ReUpSYAlLkZ1s/9i/K4l82iijURkAOZIpAIJo7qPwgJDtnWkQ==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr13098209eds.226.1596397384275; 
 Sun, 02 Aug 2020 12:43:04 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id ay5sm14253189edb.2.2020.08.02.12.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Aug 2020 12:43:03 -0700 (PDT)
Subject: Re: [PATCH v5 00/16] acpi/pwm/i915: Convert pwm-crc and i915 driver's
 PWM code to use the atomic PWM API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200717133753.127282-1-hdegoede@redhat.com>
 <20200729105436.GT3703480@smile.fi.intel.com>
 <e8f93474-1775-b20c-f9f2-e33592a02028@redhat.com>
 <20200802112524.GS3703480@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3d66505a-3550-e81f-d6dc-250dba87e820@redhat.com>
Date: Sun, 2 Aug 2020 21:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200802112524.GS3703480@smile.fi.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/2/20 1:25 PM, Andy Shevchenko wrote:
> On Sat, Aug 01, 2020 at 04:38:16PM +0200, Hans de Goede wrote:
>> On 7/29/20 12:54 PM, Andy Shevchenko wrote:
>>> On Fri, Jul 17, 2020 at 03:37:37PM +0200, Hans de Goede wrote:
> 
> ...
> 
>>> One comment to consider, though. There are three channels in that PWM AFAIU.
>>> One of them is backlight control, another one can be attached to haptics. The
>>> concern is how this series may (or may not?) affect haptics behaviour.
>>
>> When you say "in that PWM" do you mean the LPSS one or the CRC one ?
> 
> CRC one. I have read it from PMIC spec, that's why the question.

Ah I see, well the kernel driver only implements support for 1 PWM output,
the one which is used for the backlight brighness control.

So this series should not affect haptics behavior, since it looks like
the haptic functionality is not supported in the mainline kernel at all.

And I'm also not aware of any tablets with a CRC PMIC which have
(non working) haptic support.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
