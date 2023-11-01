Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0377DE001
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 12:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 369FE10E6BB;
	Wed,  1 Nov 2023 11:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F3410E06F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698836497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vm1BwKNi8e5t5w7ZYq67+woBP2OFa3LMEQGgYfYQf2A=;
 b=aic7A1tIGbkBdkljiSyPxOI85Tg13dbqXBE+3x24clIJW4G1FJ5dlalYTxYkeKQ2Lccn0w
 OpCI0LsecvF1cCyEPC5CTcLXq1/m6EhnvzIsCesPQC0nZIDWL7U3wGBB0Hc3SRu88WQCS5
 FxG+ioHYoISESNvXMANyVMo/PN49jDw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-OX1x_2SmOKmp24G4TvU7uA-1; Wed, 01 Nov 2023 07:01:34 -0400
X-MC-Unique: OX1x_2SmOKmp24G4TvU7uA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9d25d0788b8so237004466b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 04:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698836493; x=1699441293;
 h=in-reply-to:references:cc:to:from:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Fy6tkWm0y2Nkm2fnSFyjz6gKBn3YQc+IQZWdr7dI69s=;
 b=mxJxBa1PURfPSnI0b5u3h3otKuXOKqXAkvFHCsw/PjWgc3vdHgct3qXUKFJtDD9IvY
 4yEwbjFDC6akWtYZUwG717fUiWRibR/FfYE0FT47sF1cS4YTaJiIvutgsDwD30Bq7zC9
 g2ZMCImy7/xeo2mISzOIJwHHsUTBhwvzbiZiTujH06GFtG/6XhS9RlY1REiRKvIh2mWC
 id5HHGB7SrJpB8q9Ia/Q+aLVBWlh5CG3qEMtn/HwTYGHpIlQ95OGvDz8CnXqGfBGZiDD
 rpcMKrztQ3ZzktQqWQeI0llNpvR/lR6G29KUbKZcIf5dDwOyR0D5cyNwouNNQNK/vt4S
 sA0w==
X-Gm-Message-State: AOJu0YwDnP2RiBU1kz2SDnDOKHldCWx1vCYGIf6ucHHwf5lIiB1bRsKW
 QLE7om0JTRpsM2EhFpBJkS6s2JkjV2w/Q5ssDWSo7uFDzljVYy+JGK4qcq8q70WJtPRpfQGCIWn
 LkbN+dD0xEVNB54uKMkSV24ZuxwO3
X-Received: by 2002:a17:907:a05:b0:9d0:4b8f:3da3 with SMTP id
 bb5-20020a1709070a0500b009d04b8f3da3mr1451508ejc.30.1698836492991; 
 Wed, 01 Nov 2023 04:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl/nZcawUVb9gBJs5xh5/8zg6t/uv24ePaA8CiOaMsOmeN778WCQ+7btjVgAW+jf0CABRfew==
X-Received: by 2002:a17:907:a05:b0:9d0:4b8f:3da3 with SMTP id
 bb5-20020a1709070a0500b009d04b8f3da3mr1451486ejc.30.1698836492643; 
 Wed, 01 Nov 2023 04:01:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 t17-20020a17090616d100b0099cb349d570sm2264480ejd.185.2023.11.01.04.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 04:01:31 -0700 (PDT)
Message-ID: <437a20fe-121e-0d8c-04a0-da30db71d2ea@redhat.com>
Date: Wed, 1 Nov 2023 12:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 6/7] drm/i915/dsi: Replace poking of CHV GPIOs behind
 the driver's back
From: Hans de Goede <hdegoede@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
 <20231024155739.3861342-7-andriy.shevchenko@linux.intel.com>
 <ZTfssxRsrDxhzSQ6@smile.fi.intel.com>
 <b489675d-e9de-4bca-9622-78545aa8606d@redhat.com>
 <16e533e2-81bb-47ba-9e23-460a626bcad7@redhat.com>
 <ZUIbPtEEbl6pjdqg@smile.fi.intel.com>
 <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
In-Reply-To: <f68dca47-d9ed-a146-b152-c19bcc9d8828@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------ut2CYh1xth06y9kfNtp1tqdw"
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
--------------ut2CYh1xth06y9kfNtp1tqdw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/1/23 11:20, Hans de Goede wrote:
> Hi,
> 
> On 11/1/23 10:32, Andy Shevchenko wrote:
>> On Tue, Oct 31, 2023 at 10:15:52PM +0100, Hans de Goede wrote:
>>> On 10/31/23 17:07, Hans de Goede wrote:
>>>> On 10/24/23 18:11, Andy Shevchenko wrote:
>>>>> On Tue, Oct 24, 2023 at 06:57:38PM +0300, Andy Shevchenko wrote:
>>
>> ...
>>
>>>> As for the CHT support, I have not added that to my tree yet, I would
>>>> prefer to directly test the correct/fixed patch.
>>>
>>> And I hit the "jackpot" on the first device I tried and the code needed
>>> some fixing to actually work, so here is something to fold into v3 to
>>> fix things:
>>
>> Thanks!
>>
>> But let me first send current v3 as it quite differs to v2 in the sense
>> of how I do instantiate GPIO lookup tables.
> 
> The problem is there already is a GPIO lookup table registered for
> the "0000:00:02.0" device by intel_dsi_vbt_gpio_init() and there can
> be only be one GPIO lookup table per device. So no matter how you
> instantiate GPIO lookup tables it will not work.
> 
> The solution that I chose is to not instantiate a GPIO lookup table
> at all and instead to extend the existing table with an extra entry.
> 
> Although thinking more about it I must admit that this is racy.
> 
> So a better idea would be to unregister the GPIO lookup
> table registered by intel_dsi_vbt_gpio_init() after getting
> the GPIOs there, that would allow instantiating a new one
> from soc_exec_opaque_gpio() as it currently does and that
> would be race free.
> 
>> Meanwhile I will look into the change you sent (and hopefully we can
>> incorporate something in v3 for v4).
> 
> Ok, lets go with your v3.
> 
> I'll prepare a patch  to move the unregistering of the existing
> conflicting GPIO lookup from intel_dsi_vbt_gpio_cleanup()
> to the end of intel_dsi_vbt_gpio_init() to avoid the conflict
> we have there.

Attached is this patch, this should probably be one of
the first patches in the v3 submission.

Note that if you go with Ville's suggestion to preparse
the MIPI sequences, things will change significantly
and then the attached patch will likely be unnecessary.

Regards,

Hans




> Note you still need the first part of my patch which is
> an unrelated bugfix:
> 
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -219,8 +219,7 @@ static void soc_exec_gpio(struct intel_connector *connector, const char *con_id,
>  	} else {
>  		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
>  						 con_id, gpio_index,
> -						 value ? GPIOD_OUT_LOW :
> -						 GPIOD_OUT_HIGH);
> +						 value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
>  		if (IS_ERR(gpio_desc)) {
>  			drm_err(&dev_priv->drm,
>  				"GPIO index %u request failed (%pe)\n",
> 
> Regards,
> 
> Hans
> 
> 

--------------ut2CYh1xth06y9kfNtp1tqdw
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-i915-dsi-Remove-GPIO-lookup-table-at-the-end-of-.patch"
Content-Disposition: attachment;
 filename*0="0001-drm-i915-dsi-Remove-GPIO-lookup-table-at-the-end-of-.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjYjNjYzY1NmFkODlkOTg4MjRkMzhjMDdhMzUwMTljNTEyMjI3NjAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgpE
YXRlOiBXZWQsIDEgTm92IDIwMjMgMTE6NTQ6MTggKzAxMDAKU3ViamVjdDogW1BBVENIXSBkcm0v
aTkxNS9kc2k6IFJlbW92ZSBHUElPIGxvb2t1cCB0YWJsZSBhdCB0aGUgZW5kIG9mCiBpbnRlbF9k
c2lfdmJ0X2dwaW9faW5pdCgpCgpUbyBwcm9wZXJseSBkZWFsIHdpdGggR1BJT3MgdXNlZCBpbiBN
SVBJIHBhbmVsIHNlcXVlbmNlcyBhIHRlbXBvcmFyeQpHUElPIGxvb2t1cCB3aWxsIGJlIHVzZWQu
IFNpbmNlIHRoZXJlIGNhbiBvbmx5IGJlIDEgR1BJTyBsb29rdXAgdGFibGUKZm9yIHRoZSAiMDAw
MDowMDowMi4wIiBkZXZpY2UgdGhpcyB3aWxsIG5vdCB3b3JrIGlmIHRoZSBHUElPIGxvb2t1cAp0
YWJsZSB1c2VkIGJ5IGludGVsX2RzaV92YnRfZ3Bpb19pbml0KCkgaXMgc3RpbGwgcmVnaXN0ZXJl
ZC4KCkFmdGVyIGdldHRpbmcgdGhlICJiYWNrbGlnaHQiIGFuZCAicGFuZWwiIEdQSU9zIHRoZSBs
b29rdXAgdGFibGUKcmVnaXN0ZXJlZCBieSBpbnRlbF9kc2lfdmJ0X2dwaW9faW5pdCgpIGlzIG5v
IGxvbmdlciBuZWNlc3NhcnksCnJlbW92ZSBpdCBzbyB0aGF0IGFub3RoZXIgdGVtcG9yYXJ5IGxv
b2t1cC10YWJsZSBmb3IgdGhlICIwMDAwOjAwOjAyLjAiCmRldmljZSBjYW4gYmUgYWRkZWQuCgpT
aWduZWQtb2ZmLWJ5OiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNpX3ZidC5jIHwgMjUgKysrKysrKy0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNp
X3ZidC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2lfdmJ0LmMKaW5k
ZXggY2I2NDQ1NDkzMmQxLi5kOTY1YWUxZDJiMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNpX3ZidC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHNpX3ZidC5jCkBAIC05MjIsNiArOTIyLDcgQEAgdm9pZCBpbnRlbF9k
c2lfdmJ0X2dwaW9faW5pdChzdHJ1Y3QgaW50ZWxfZHNpICppbnRlbF9kc2ksIGJvb2wgcGFuZWxf
aXNfb24pCiAJc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gaW50ZWxfZHNpLT5h
dHRhY2hlZF9jb25uZWN0b3I7CiAJc3RydWN0IG1pcGlfY29uZmlnICptaXBpX2NvbmZpZyA9IGNv
bm5lY3Rvci0+cGFuZWwudmJ0LmRzaS5jb25maWc7CiAJZW51bSBncGlvZF9mbGFncyBmbGFncyA9
IHBhbmVsX2lzX29uID8gR1BJT0RfT1VUX0hJR0ggOiBHUElPRF9PVVRfTE9XOworCXN0cnVjdCBn
cGlvZF9sb29rdXBfdGFibGUgKmdwaW9kX2xvb2t1cF90YWJsZSA9IE5VTEw7CiAJYm9vbCB3YW50
X2JhY2tsaWdodF9ncGlvID0gZmFsc2U7CiAJYm9vbCB3YW50X3BhbmVsX2dwaW8gPSBmYWxzZTsK
IAlzdHJ1Y3QgcGluY3RybCAqcGluY3RybDsKQEAgLTkyOSwxMiArOTMwLDEyIEBAIHZvaWQgaW50
ZWxfZHNpX3ZidF9ncGlvX2luaXQoc3RydWN0IGludGVsX2RzaSAqaW50ZWxfZHNpLCBib29sIHBh
bmVsX2lzX29uKQogCiAJaWYgKChJU19WQUxMRVlWSUVXKGRldl9wcml2KSB8fCBJU19DSEVSUllW
SUVXKGRldl9wcml2KSkgJiYKIAkgICAgbWlwaV9jb25maWctPnB3bV9ibGMgPT0gUFBTX0JMQ19Q
TUlDKSB7Ci0JCWdwaW9kX2FkZF9sb29rdXBfdGFibGUoJnBtaWNfcGFuZWxfZ3Bpb190YWJsZSk7
CisJCWdwaW9kX2xvb2t1cF90YWJsZSA9ICZwbWljX3BhbmVsX2dwaW9fdGFibGU7CiAJCXdhbnRf
cGFuZWxfZ3BpbyA9IHRydWU7CiAJfQogCiAJaWYgKElTX1ZBTExFWVZJRVcoZGV2X3ByaXYpICYm
IG1pcGlfY29uZmlnLT5wd21fYmxjID09IFBQU19CTENfU09DKSB7Ci0JCWdwaW9kX2FkZF9sb29r
dXBfdGFibGUoJnNvY19wYW5lbF9ncGlvX3RhYmxlKTsKKwkJZ3Bpb2RfbG9va3VwX3RhYmxlID0g
JnNvY19wYW5lbF9ncGlvX3RhYmxlOwogCQl3YW50X3BhbmVsX2dwaW8gPSB0cnVlOwogCQl3YW50
X2JhY2tsaWdodF9ncGlvID0gdHJ1ZTsKIApAQCAtOTUxLDYgKzk1Miw5IEBAIHZvaWQgaW50ZWxf
ZHNpX3ZidF9ncGlvX2luaXQoc3RydWN0IGludGVsX2RzaSAqaW50ZWxfZHNpLCBib29sIHBhbmVs
X2lzX29uKQogCQkJCSJGYWlsZWQgdG8gc2V0IHBpbm11eCB0byBQV01cbiIpOwogCX0KIAorCWlm
IChncGlvZF9sb29rdXBfdGFibGUpCisJCWdwaW9kX2FkZF9sb29rdXBfdGFibGUoZ3Bpb2RfbG9v
a3VwX3RhYmxlKTsKKwogCWlmICh3YW50X3BhbmVsX2dwaW8pIHsKIAkJaW50ZWxfZHNpLT5ncGlv
X3BhbmVsID0gZ3Bpb2RfZ2V0KGRldi0+ZGV2LCAicGFuZWwiLCBmbGFncyk7CiAJCWlmIChJU19F
UlIoaW50ZWxfZHNpLT5ncGlvX3BhbmVsKSkgewpAQCAtOTY5LDE1ICs5NzMsMTMgQEAgdm9pZCBp
bnRlbF9kc2lfdmJ0X2dwaW9faW5pdChzdHJ1Y3QgaW50ZWxfZHNpICppbnRlbF9kc2ksIGJvb2wg
cGFuZWxfaXNfb24pCiAJCQlpbnRlbF9kc2ktPmdwaW9fYmFja2xpZ2h0ID0gTlVMTDsKIAkJfQog
CX0KKworCWlmIChncGlvZF9sb29rdXBfdGFibGUpCisJCWdwaW9kX3JlbW92ZV9sb29rdXBfdGFi
bGUoZ3Bpb2RfbG9va3VwX3RhYmxlKTsKIH0KIAogdm9pZCBpbnRlbF9kc2lfdmJ0X2dwaW9fY2xl
YW51cChzdHJ1Y3QgaW50ZWxfZHNpICppbnRlbF9kc2kpCiB7Ci0Jc3RydWN0IGRybV9kZXZpY2Ug
KmRldiA9IGludGVsX2RzaS0+YmFzZS5iYXNlLmRldjsKLQlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0
ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7Ci0Jc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29u
bmVjdG9yID0gaW50ZWxfZHNpLT5hdHRhY2hlZF9jb25uZWN0b3I7Ci0Jc3RydWN0IG1pcGlfY29u
ZmlnICptaXBpX2NvbmZpZyA9IGNvbm5lY3Rvci0+cGFuZWwudmJ0LmRzaS5jb25maWc7Ci0KIAlp
ZiAoaW50ZWxfZHNpLT5ncGlvX3BhbmVsKSB7CiAJCWdwaW9kX3B1dChpbnRlbF9kc2ktPmdwaW9f
cGFuZWwpOwogCQlpbnRlbF9kc2ktPmdwaW9fcGFuZWwgPSBOVUxMOwpAQCAtOTg3LDEzICs5ODks
NCBAQCB2b2lkIGludGVsX2RzaV92YnRfZ3Bpb19jbGVhbnVwKHN0cnVjdCBpbnRlbF9kc2kgKmlu
dGVsX2RzaSkKIAkJZ3Bpb2RfcHV0KGludGVsX2RzaS0+Z3Bpb19iYWNrbGlnaHQpOwogCQlpbnRl
bF9kc2ktPmdwaW9fYmFja2xpZ2h0ID0gTlVMTDsKIAl9Ci0KLQlpZiAoKElTX1ZBTExFWVZJRVco
ZGV2X3ByaXYpIHx8IElTX0NIRVJSWVZJRVcoZGV2X3ByaXYpKSAmJgotCSAgICBtaXBpX2NvbmZp
Zy0+cHdtX2JsYyA9PSBQUFNfQkxDX1BNSUMpCi0JCWdwaW9kX3JlbW92ZV9sb29rdXBfdGFibGUo
JnBtaWNfcGFuZWxfZ3Bpb190YWJsZSk7Ci0KLQlpZiAoSVNfVkFMTEVZVklFVyhkZXZfcHJpdikg
JiYgbWlwaV9jb25maWctPnB3bV9ibGMgPT0gUFBTX0JMQ19TT0MpIHsKLQkJcGluY3RybF91bnJl
Z2lzdGVyX21hcHBpbmdzKHNvY19wd21fcGluY3RybF9tYXApOwotCQlncGlvZF9yZW1vdmVfbG9v
a3VwX3RhYmxlKCZzb2NfcGFuZWxfZ3Bpb190YWJsZSk7Ci0JfQogfQotLSAKMi40MS4wCgo=
--------------ut2CYh1xth06y9kfNtp1tqdw--

