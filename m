Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D19525506D3
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 23:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C3D10E8A3;
	Sat, 18 Jun 2022 21:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55F7610E8A3
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655588212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8T/wpTfwFVsW4YYZ+EF9H0NEFSa6wtNsm+7+zS7JCo=;
 b=d/7PSUkW7KPK5Hx1NOPaf4aWApnrHTvItJiDxGLQiTtxUC9D4Lwh4NE6Ly0vit2uwDBUxB
 +jmu2Amj4+ZcT3JOtVASbD0aWiM1pO8mmKwlp1uh739NJ/6W2+wfXSEsnfIxDdEWxUjfP0
 2V+WYPDnaie0TRBlqIgjDyZ3zjdozoA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-7_SOxoYKM5S5YvwQ5GWuuA-1; Sat, 18 Jun 2022 17:36:51 -0400
X-MC-Unique: 7_SOxoYKM5S5YvwQ5GWuuA-1
Received: by mail-ed1-f69.google.com with SMTP id
 f9-20020a056402354900b0042ded146259so5727227edd.20
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jun 2022 14:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N8T/wpTfwFVsW4YYZ+EF9H0NEFSa6wtNsm+7+zS7JCo=;
 b=Gn3tKYB3TWTbbsPftjPNhcXrnPAIuYdWsIC0XlqnUyghqX/aSifewr2w0DjC/+tMi2
 u44nYJRz6h0s1FX9BlGi7K/rX7ZGDnTo5asSAuGacvPf/9yangDCEshSv0SWm7HKw0q1
 WkpD7ItLmojqJodj30M8rL7Y5fpFQbR+CeZblwVE6OH1KwTMkl+bH6eubhcVmqPyy0fu
 NaeS5zUXqdtLaQLnGpkHgRnLuOD0DdSffHe9xtSmvAhxXHQDlffkGhNRzZaxTbSU/+P4
 +esfSKYborwV/ZAoh0FK439MkbJzl6AMjXB30SNRgk07xEsrQpV3X1Y89eqgbWHrRw+Z
 yJgQ==
X-Gm-Message-State: AJIora8ApdBRluNEPaA3iVfL1D9GdXzvOHj8suIKhFXqVIeJ+Y9ZIivW
 TXVRnhoXUheEwCuGVzLiVWwUJAn7Y//zwsUTXmBLaWQjUDIzs77oVBudL7MnkROps9JfN2xNa14
 FNWUhzEBStKbvmvZlmST27tEscfrd
X-Received: by 2002:a05:6402:3046:b0:42e:fee1:c2dd with SMTP id
 bs6-20020a056402304600b0042efee1c2ddmr20533056edb.29.1655588210286; 
 Sat, 18 Jun 2022 14:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t7Cs52CUm22UksO8lfTW8bsjliLJlYRclJIqNKKixv+475//U0NJZSbv9ZXTrEuzvNU+vOQw==
X-Received: by 2002:a05:6402:3046:b0:42e:fee1:c2dd with SMTP id
 bs6-20020a056402304600b0042efee1c2ddmr20533028edb.29.1655588209932; 
 Sat, 18 Jun 2022 14:36:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 hf27-20020a1709072c5b00b006fee961b9e0sm3825795ejc.195.2022.06.18.14.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jun 2022 14:36:49 -0700 (PDT)
Message-ID: <371f0f29-3c6e-34f9-75fd-31a9cdb8df6d@redhat.com>
Date: Sat, 18 Jun 2022 23:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: drm: panel-orientation-quirks: Add quirk for Aya Neo Next
To: Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20220611103911.9417-1-maccraft123mc@gmail.com>
 <2573aee8-e1cd-cb62-c87f-f841a173220c@redhat.com>
 <CAO_Mup+xuh5EpniYG37qZxk_jJ9VoObWj2Muxd7JB+bC0DYTpg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAO_Mup+xuh5EpniYG37qZxk_jJ9VoObWj2Muxd7JB+bC0DYTpg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: airlied@linux.ie, tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/18/22 23:08, Maya Matuszczyk wrote:
> sob., 18 cze 2022 o 22:57 Hans de Goede <hdegoede@redhat.com> napisał(a):
>>
>> Hi Maya,
>>
>> On 6/11/22 12:39, Maccraft123 wrote:
>>> From: Maya Matuszczyk <maccraft123mc@gmail.com>
>>>
>>> The device is identified by "NEXT" in board name, however there are
>>> different versions of it, "Next Advance" and "Next Pro", that have
>>> different DMI board names.
>>> Due to a production error a batch or two have their board names prefixed
>>> by "AYANEO" and that's how we ended up with 6 different entries for
>>> what's basically one device with different hardware specifications.
>>>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> ---
>>>  .../gpu/drm/drm_panel_orientation_quirks.c    | 36 +++++++++++++++++++
>>>  1 file changed, 36 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>>> index 4e853acfd1e8..62fc7eb69341 100644
>>> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
>>> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
>>> @@ -152,6 +152,42 @@ static const struct dmi_system_id orientation_data[] = {
>>>                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "AYA NEO 2021"),
>>>               },
>>>               .driver_data = (void *)&lcd800x1280_rightside_up,
>>> +     }, {    /* AYA NEO NEXT */
>>> +             .matches = {
>>> +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
>>> +             },
>>> +             .driver_data = (void *)&lcd800x1280_rightside_up,
>>> +     },
>>
>> If you change:
>>
>>                   DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT"),
>>
>> to:
>>
>>                   DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
>>
>> Then the matching code will do a substring search for "NEXT"
>> in DMI_BOARD_NAME. IOW it will do a strstr using DMI_BOARD_NAME
>> as the haystack and "NEXT" as the needle.
>>
>> And since all 6 board-names contain "NEXT", this single entry
>> will then match all 6 variants.
>>
>> So please respin this patch using just a single entry with:
>>
>>                   DMI_MATCH(DMI_BOARD_NAME, "NEXT"),
>>
> I considered this and decided against it because if "Aya Neo Next 2" was
> released it would likely have "NEXT 2" as DMI board name, and if it had
> screen rotated differently this patch would rotate it in a wrong way.

Hmm, I understand but I'm not sure what is the best thing to do.

There also is the resolution check. So if a new "NEXT 2" is released
then this really only is an issue if it too uses a 800x1280 screen,
but then with its left-side-up.

If it uses a normal landscape 1280x800 screen the resolution won't
match the 800x1280 the quirk checks for so nothing happens.

If it again uses a 800x1280 portrait screen in landscape mode
with its right-side-up then the quirk matching actualy is
a good thing.

So the only bad scenario is a 800x1280 screen which is left-side-up,
which the quirk will then turn from being on its side to being
upside-down. The question then is though if upside-down is much
worse then on its side, neither is really usable, so we would
need a quirk for this screen then anyways...

So I understand where you are coming from, but I see the chances
of this becoming a problem as pretty small (and we can fix it
when it does happen). OTOH the dmi_system_id table we are
discussing is almost always built into the vmlinuz image.
So growing it will cause extra disk/RAM uses for every Linux
user out there (not just Aya Neo Next users).

So IMHO going with only using 1 entry with the small risc of
needing to revisit this later is the better solution here.

Regards,

Hans



> 
> 
>> Thanks & Regards,
>>
>> Hans
>>
>>
>>
>>  {      /* AYA NEO NEXT Advance */
>>> +             .matches = {
>>> +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Advance"),
>>> +             },
>>> +             .driver_data = (void *)&lcd800x1280_rightside_up,
>>> +     }, {    /* AYA NEO NEXT Pro */
>>> +             .matches = {
>>> +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "NEXT Pro"),
>>> +             },
>>> +             .driver_data = (void *)&lcd800x1280_rightside_up,
>>> +     }, {    /* AYA NEO NEXT (Batch with different board name) */
>>> +             .matches = {
>>> +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT"),
>>> +             },
>>> +             .driver_data = (void *)&lcd800x1280_rightside_up,
>>> +     }, {    /* AYA NEO NEXT Advance (Batch with different board name) */
>>> +             .matches = {
>>> +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Advance"),
>>> +             },
>>> +             .driver_data = (void *)&lcd800x1280_rightside_up,
>>> +     }, {    /* AYA NEO NEXT Pro (Batch with different board name) */
>>> +             .matches = {
>>> +               DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>>> +               DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO NEXT Pro"),
>>> +             },
>>> +             .driver_data = (void *)&lcd800x1280_rightside_up,
>>>       }, {    /* Chuwi HiBook (CWI514) */
>>>               .matches = {
>>>                       DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
>>
> 

