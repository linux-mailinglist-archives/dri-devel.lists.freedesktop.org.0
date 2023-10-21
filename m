Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEBA7D1BED
	for <lists+dri-devel@lfdr.de>; Sat, 21 Oct 2023 11:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7454D10E113;
	Sat, 21 Oct 2023 09:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CEC10E113
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697879307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Duv/vRzaqiVheQFpKN6BpeiI42/H7vnpG0VOqBtei/A=;
 b=IkQ68IauB3aI2rTrH0F3TqDpwaBuX3Tr//V8G087haTLkWxe1F/lBYNzhNrclH2vst8GQu
 ROCFxxVA4NG8DMPIBNEmmLPmqovnuAheJql9tL0EcFG/fzRYokMNmOM3XPC1nTR9d5qQfn
 /LCQLLAKDkFA2ibJylVad0oCBfBklEs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-hRZNSlnaP4WMrOLmBJaCSA-1; Sat, 21 Oct 2023 05:08:26 -0400
X-MC-Unique: hRZNSlnaP4WMrOLmBJaCSA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9ba247e03aeso102347366b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Oct 2023 02:08:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697879305; x=1698484105;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Duv/vRzaqiVheQFpKN6BpeiI42/H7vnpG0VOqBtei/A=;
 b=kwVfaI6Nt38/Ob0pm163TrAK3t6j8w9A51vFrAAISGT8EMb3oaHfNjcJTEULuwBXxO
 gfNjh+Z7zeSIZqMyCxKSlFq3UB5yD4J2qaauxUsZafwgFuI6gzRLLpJL9pRamRImnsul
 vQcTCem0QEwzjl+wmJswdIkrSUsIfirOU2+7zsYihUqmaMrX+3/Y/UPyI5xJgYMJ4vsH
 0v9pT9gSGo5bPUDmCK57U6paX75a077vRl9BBO4dqmDqfiGZiAFkUDDpggJ+o+fvp31P
 Ai40Ro+X8K5Y41EAk7VeAOuZDWOC4WxrphFO1pfXJa+7zk6PqRq+SrErBBEZZzlWD29B
 mjjw==
X-Gm-Message-State: AOJu0Yzvw0lNLM1OCwnM0UbvluQuMS4KC2a5Mdoo2RsPrJ01txfp7guz
 af4CPkg0vWICz6VHHfSPLFzSqZiijRZT0fh9BCP6qIDT6682NuiXaximsX6HRu17U4++55Wm4+D
 pI2SJVygY1lM1WcadOr4YgJ3FRtrz
X-Received: by 2002:a17:907:2cc4:b0:9c3:d356:ad0c with SMTP id
 hg4-20020a1709072cc400b009c3d356ad0cmr3284628ejc.24.1697879305117; 
 Sat, 21 Oct 2023 02:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNqtW+MndTr+TWmmj2VbzRQsCnDbztAGvz9JDMu9I4Oq15U8bQsUZjmiRgthR6bMx8lB0Nzg==
X-Received: by 2002:a17:907:2cc4:b0:9c3:d356:ad0c with SMTP id
 hg4-20020a1709072cc400b009c3d356ad0cmr3284603ejc.24.1697879304753; 
 Sat, 21 Oct 2023 02:08:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a1709061c0900b0099ce025f8ccsm3201413ejg.186.2023.10.21.02.08.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Oct 2023 02:08:23 -0700 (PDT)
Message-ID: <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
Date: Sat, 21 Oct 2023 11:08:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
 <20231019105118.64gdzzixwqrztjir@pengutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231019105118.64gdzzixwqrztjir@pengutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Cc: linux-fbdev@vger.kernel.org, Sean Young <sean@mess.org>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-input@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, intel-gfx@lists.freedesktop.org,
 Mark Gross <markgross@kernel.org>, Mark Brown <broonie@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On 10/19/23 12:51, Uwe Kleine-König wrote:
> On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
>> Hi Sean,
>>
>> On 10/17/23 11:17, Sean Young wrote:
>>> Some drivers require sleeping, for example if the pwm device is connected
>>> over i2c. The pwm-ir-tx requires precise timing, and sleeping causes havoc
>>> with the generated IR signal when sleeping occurs.
>>>
>>> This patch makes it possible to use pwm when the driver does not sleep,
>>> by introducing the pwm_can_sleep() function.
>>>
>>> Signed-off-by: Sean Young <sean@mess.org>
>>
>> I have no objection to this patch by itself, but it seems a bit
>> of unnecessary churn to change all current callers of pwm_apply_state()
>> to a new API.
> 
> The idea is to improve the semantic of the function name, see
> https://lore.kernel.org/linux-pwm/20231013180449.mcdmklbsz2rlymzz@pengutronix.de
> for more context.

Hmm, so the argument here is that the GPIO API has this, but GPIOs
generally speaking can be set atomically, so there not being able
to set it atomically is special.

OTOH we have many many many other kernel functions which may sleep
and we don't all postfix them with _can_sleep.

And for PWM controllers pwm_apply_state is IMHO sorta expected to
sleep. Many of these are attached over I2C so things will sleep,
others have a handshake to wait for the current dutycycle to
end before you can apply a second change on top of an earlier
change during the current dutycycle which often also involves
sleeping.

So the natural/expeected thing for pwm_apply_state() is to sleep
and thus it does not need a postfix for this IMHO.

> I think it's very subjective if you consider this
> churn or not.

I consider it churn because I don't think adding a postfix
for what is the default/expected behavior is a good idea
(with GPIOs not sleeping is the expected behavior).

I agree that this is very subjective and very much goes
into the territory of bikeshedding. So please consider
the above my 2 cents on this and lets leave it at that.

> While it's nice to have every caller converted in a single
> step, I'd go for
> 
> 	#define pwm_apply_state(pwm, state) pwm_apply_cansleep(pwm, state)
> 
> , keep that macro for a while and convert all users step by step. This
> way we don't needlessly break oot code and the changes to convert to the
> new API can go via their usual trees without time pressure.

I don't think there are enough users of pwm_apply_state() to warrant
such an exercise.

So if people want to move ahead with the _can_sleep postfix addition
(still not a fan) here is my acked-by for the drivers/platform/x86
changes, for merging this through the PWM tree in a single commit:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


