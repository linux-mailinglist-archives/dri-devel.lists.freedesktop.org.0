Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5FF7DF500
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D5210E8DA;
	Thu,  2 Nov 2023 14:29:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8636510E8D3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698935342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3TJSNNUfhv9lNCGxoqczQuSmLk+IEIpe0A6r0tdpkzQ=;
 b=RgulTXP8c3kv4mCvajwh0MIE+OSNM5aQEy+stVpHi923PGrGMrGiC0lpAn28fLw96PKlRd
 1GkUvfqnEht2Qyjj1BXSayFSW+VgX3aIJtXW7e28th2FdXTamSDB9rxwbpDrJUCjqMfyJh
 rk/vTsQ4wz0nvmd2qfneIzJDbhgSEEw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-qF4po0G7PSW5yHbnfy-cPw-1; Thu, 02 Nov 2023 10:28:57 -0400
X-MC-Unique: qF4po0G7PSW5yHbnfy-cPw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9a681c3470fso76949666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 07:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698935336; x=1699540136;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Tgr6D1BZg4DELT6k9Jshl8Q647baCv/R63fV2D1EpT4=;
 b=CnrYseHUOg4sspQ0G9Cz+Kbv2XmALFQoNgAKM/+k2MKlRzb+SCflZHI0N+0tGgnDnV
 r4cZ9xOGvdJayKhaL6jlWKpM5eei7xr+7rC0xNaDkpQruMWHZjAEvIreS4MOQjex9JvL
 DGWz9D0eHMnGh23F5aUD8+N2/IvF510VW3pNEEcqz0zVd3K2CTDxfWSQ1Q2XIE+nl1Hp
 kcVaVspkufzy9iflKTA0HokDM5/wkvBAgu5taj3CWUTtpfyojokFUiOIwV1Ns9t8IgNg
 e6LnFAd2LZPNHwW9P0GZW+/ddjh/pCaMjX5b48ihTYZnF293fTD2wrBwLjKJTzwRIwrH
 S8Sg==
X-Gm-Message-State: AOJu0YysfUZQB07gTWjyAx+VPmHYC3Lp5O2kP1IL5PmkIpH4n4q7ewN3
 UctS3E4zOUc2kXORc8+xs/a0r+tzEVHat7Le53kJRc45ZtzLD2pJo5SOousFcL3DZ4ynO9pZzC5
 NU4SESkz6NL2NCDJxnqvR1kb5XrXo
X-Received: by 2002:a17:906:794d:b0:9be:705:d7d0 with SMTP id
 l13-20020a170906794d00b009be0705d7d0mr4485999ejo.0.1698935336604; 
 Thu, 02 Nov 2023 07:28:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4poVnLD0XD4/8r1MWwKjmLqh7ADhGy8kgs7Bz66kuVWfNYXAxB6/spjZ4Z0qzzGabzY5zwg==
X-Received: by 2002:a17:906:794d:b0:9be:705:d7d0 with SMTP id
 l13-20020a170906794d00b009be0705d7d0mr4485981ejo.0.1698935336251; 
 Thu, 02 Nov 2023 07:28:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 lh23-20020a170906f8d700b009adc5802d08sm1201944ejb.190.2023.11.02.07.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 07:28:55 -0700 (PDT)
Message-ID: <f9a5fda5-30db-f805-f079-a53a9c0218ce@redhat.com>
Date: Thu, 2 Nov 2023 15:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
 <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
 <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
 <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
 <ZUOwAn158pUELTBq@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZUOwAn158pUELTBq@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------GnluoRzsnuYax0s2uyTESTIh"
Content-Language: en-US, nl
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------GnluoRzsnuYax0s2uyTESTIh
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/2/23 15:19, Andy Shevchenko wrote:
> On Wed, Nov 01, 2023 at 11:20:23AM +0100, Hans de Goede wrote:
>> On 11/1/23 10:32, Andy Shevchenko wrote:
>>> On Tue, Oct 31, 2023 at 10:15:52PM +0100, Hans de Goede wrote:
>>>> On 10/31/23 17:07, Hans de Goede wrote:
>>>>> On 10/24/23 18:11, Andy Shevchenko wrote:
>>>>>> On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
>> Note you still need the first part of my patch which is
>> an unrelated bugfix:
>>
>> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
>> @@ -219,8 +219,7 @@ static void soc_exec_gpio(struct intel_connector *connector, const char *con_id,
>>  	} else {
>>  		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
>>  						 con_id, gpio_index,
>> -						 value ? GPIOD_OUT_LOW :
>> -						 GPIOD_OUT_HIGH);
>> +						 value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
>>  		if (IS_ERR(gpio_desc)) {
>>  			drm_err(&dev_priv->drm,
>>  				"GPIO index %u request failed (%pe)\n",
> 
> Can you attach or send a formal submission, so I can incorporate it into one
> (v3) series among other changes?

I thought this fixed new code in your series and it is a trivial fix,
so my idea was that you would just fold the fix into the patch
introducing the code.

But I see now that this is existing code from bxt_exec_gpio().

A formal fix to use as a prep patch for your series is now attached,
this is based on top of drm-misc-next (I guess drm-intel-next
would be better but I had an up2date drm-misc-next handy).

Regards,

Hans


--------------GnluoRzsnuYax0s2uyTESTIh
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-i915-dsi-Fix-wrong-initial-value-for-GPIOs-in-bx.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-i915-dsi-Fix-wrong-initial-value-for-GPIOs-in-bx.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjMzAwZWQwZTA5ZDFmZDE0YmY5NjZkYzE3MmM2ZGI1NGI4ODhmYWYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBXZWQsIDEgTm92IDIwMjMgMTE6NDk6MDEgKzAxMDAKU3ViamVjdDogW1BBVENIXSBkcm0v
aTkxNS9kc2k6IEZpeCB3cm9uZyBpbml0aWFsIHZhbHVlIGZvciBHUElPcyBpbgogYnh0X2V4ZWNf
Z3BpbygpCgpGaXggd3JvbmcgaW5pdGlhbCB2YWx1ZSBmb3IgR1BJT3MgaW4gYnh0X2V4ZWNfZ3Bp
bygpLgoKU2lnbmVkLW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzaV92YnQuYyB8IDQgKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNpX3ZidC5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2lfdmJ0LmMKaW5kZXggZTU2ZWMzZjJk
ODRhLi4wNTg3Y2JjMmU1ODQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHNpX3ZidC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHNpX3ZidC5jCkBAIC0zNTYsOSArMzU2LDcgQEAgc3RhdGljIHZvaWQgYnh0X2V4ZWNfZ3Bp
byhzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yICpjb25uZWN0b3IsCiAJaWYgKCFncGlvX2Rlc2MpIHsK
IAkJZ3Bpb19kZXNjID0gZGV2bV9ncGlvZF9nZXRfaW5kZXgoZGV2X3ByaXYtPmRybS5kZXYsCiAJ
CQkJCQkgTlVMTCwgZ3Bpb19pbmRleCwKLQkJCQkJCSB2YWx1ZSA/IEdQSU9EX09VVF9MT1cgOgot
CQkJCQkJIEdQSU9EX09VVF9ISUdIKTsKLQorCQkJCQkJIHZhbHVlID8gR1BJT0RfT1VUX0hJR0gg
OiBHUElPRF9PVVRfTE9XKTsKIAkJaWYgKElTX0VSUl9PUl9OVUxMKGdwaW9fZGVzYykpIHsKIAkJ
CWRybV9lcnIoJmRldl9wcml2LT5kcm0sCiAJCQkJIkdQSU8gaW5kZXggJXUgcmVxdWVzdCBmYWls
ZWQgKCVsZClcbiIsCi0tIAoyLjQxLjAKCg==
--------------GnluoRzsnuYax0s2uyTESTIh--

