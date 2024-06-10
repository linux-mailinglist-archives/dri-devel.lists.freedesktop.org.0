Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A0B901F04
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 12:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAA210E042;
	Mon, 10 Jun 2024 10:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Pk0DguIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB77F10E474
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718014317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAGfg58Q9+5VbZsXPAiErocuXPUKP6IBatfDvKZopjM=;
 b=Pk0DguIisfzPahpbOfIuplX3nB+GhOJgzgBNJvol9VE34SUzLRfGAThnrZ2cyDdyUjaPoR
 bxJJR0bjosBaHoSo6J6d2ajkXSncAbIwxaXWKikfk7U4B09edQ/AgNh1xQVEPryk8UQmdq
 iRSaOB/GWn2LB2vfkbVA9vW6fLJtbUg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-Rtgno_PsO7mGz8i5SHXHtA-1; Mon, 10 Jun 2024 06:11:56 -0400
X-MC-Unique: Rtgno_PsO7mGz8i5SHXHtA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a6f2662d050so16079066b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 03:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718014315; x=1718619115;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HAGfg58Q9+5VbZsXPAiErocuXPUKP6IBatfDvKZopjM=;
 b=AdnilY9o2BU4F9jQsglaPyqncmnkV7tlxlxMkggoy4wpbE/x+RC1efKaOLikUUxLjV
 LquBc1Q5+2PoKiuSq6MxFnzvENfXQ5bQJ3GXNaP4DJNlvA2NOueGHUGVWoLIoehcxiVY
 SeRXaupSlPhZAH5YuJpO0cIYeg4FpghNqQ5YkFE5US4uiv8GL+5O8UWuUMIkucQJEQlm
 uvwr70x6o4j/vO3x74bkcFoi5aSLWjoAuSNIk4CMOYd8W5+2+efufUxDYWYcsQrBI4xs
 ivJMKidGvH+20N8r1Ev1W2TyB8OnjrKlRJFLgiNEUh+r2/hFuYIeePETdFBpKJKle2Va
 bqpA==
X-Gm-Message-State: AOJu0Yy1Eonlb8VcdCXTxkYA/QJvqaZUKC1hEl4MixHKicqEWr/W5htJ
 GozR4y1G5Mdw3AcE3ED587sDVdU2yLzvOOqq0DcBpCy2Ff4lnJi9tJUi/WEM2aOvBRdy/bW+RUA
 gaxR/hVldQu5kRWy7tEYkgJN/XYHiU5FRmKadriWRkNo7tYi+OQl0LsrW1HpD0yQkZg==
X-Received: by 2002:a50:cd8a:0:b0:57c:5996:cfc7 with SMTP id
 4fb4d7f45d1cf-57c5996d14fmr5167534a12.30.1718014315093; 
 Mon, 10 Jun 2024 03:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqF9FyN44n+ZfeTQ80xQpEd5VG379Y/6+PGq7u5HQg3UFxxA2nbTtUQGPuhUsZ6CmsJ5PNNg==
X-Received: by 2002:a50:cd8a:0:b0:57c:5996:cfc7 with SMTP id
 4fb4d7f45d1cf-57c5996d14fmr5167524a12.30.1718014314700; 
 Mon, 10 Jun 2024 03:11:54 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae0cc1a2sm7155270a12.23.2024.06.10.03.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 03:11:54 -0700 (PDT)
Message-ID: <0b21129a-3cde-4b0f-a588-9069da4c14c6@redhat.com>
Date: Mon, 10 Jun 2024 12:11:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drm: panel-orientation-quirks: Add quirk for Aya
 Neo KUN
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240310220401.895591-1-tjakobi@math.uni-bielefeld.de>
 <a4069a85-b990-42b4-8cde-8906a740ec27@math.uni-bielefeld.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a4069a85-b990-42b4-8cde-8906a740ec27@math.uni-bielefeld.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tobias,

On 5/31/24 9:04 PM, Tobias Jakobi wrote:
> On 3/10/24 23:04, tjakobi@math.uni-bielefeld.de wrote:
> 
>> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>
>> Similar to the other Aya Neo devices this one features
>> again a portrait screen, here with a native resolution
>> of 1600x2560.
>>
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> index 3d92f66e550c..5d3fb11fd45f 100644
>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>> @@ -196,6 +196,12 @@ static const struct dmi_system_id orientation_data[] = {
>>             DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
>>           },
>>           .driver_data = (void *)&lcd800x1280_rightside_up,
>> +    }, {    /* AYA NEO KUN */
>> +        .matches = {
>> +          DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>> +          DMI_MATCH(DMI_BOARD_NAME, "KUN"),
>> +        },
>> +        .driver_data = (void *)&lcd1600x2560_rightside_up,
>>       }, {    /* Chuwi HiBook (CWI514) */
>>           .matches = {
>>               DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> 
> Trying yet another ping! Also adding Hans to the list of recipients, as he committed the last quirk for an Ayaneo device. Someone pick this up, pretty please! :-)

Thank you for Cc-ing me and thank you for your patch.

This looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll go and merge this into drm-misc-fixes now. Note I've not done a build
for drm-misc-fixes in a while and I'm on a laptop atm, so it will be a while
before this shows up as I'll do a (slow) test-build before pusing out the changes.

Regards,

Hans

