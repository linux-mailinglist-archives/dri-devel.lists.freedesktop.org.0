Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8572A39F2A9
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931C26EB7E;
	Tue,  8 Jun 2021 09:42:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7B76EB7E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 09:42:10 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l2so20857778wrw.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=ED+rNKhSo+4uo4/0lZ+U57kEnEAOq3OqyZ1ir2uYffQ=;
 b=h+bGW/dcLB8Zb+Jp3uad8Vb7etGQHuQjNGue0XWzgeF5US4NsCZII/03cvia2Ze9j6
 3MBwcuMCrVfUfxOd1QnLz750YFwxOg+lISXD42tRofNeVI/bIJRdu6ZLqlZeHVYm89xq
 yVSDVdNN3voymFLZoB7uPoaKo8yQqhQDACqdKarCD9mPHE91tQ8L11vSeFBCEQZs3SdW
 sSjofoYg0Fs4xzaZz33LjyaYKD1Y2XB+cPsGmgaYkiN90l+fzWLLySUozP9uZjeLVuFh
 5KEwM9tzGbQUFmiGhtXRSdaiZ2X4bXyGm1SVxf7OnUqN14Y7//KNxxWZj3L9WzBA6HZD
 ibXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ED+rNKhSo+4uo4/0lZ+U57kEnEAOq3OqyZ1ir2uYffQ=;
 b=XtF011/A1Ugi5vxagz37mXx1IuzsqrTWvD4eVkzln/dVZuoe17LjgiJ5wAsIrxAyHI
 koqyWXUs5KBtReWv80Rb5TT8OLPg1Tomk8yLQpYYal5Ij7MlVA5OXHm9Ox3rrZItNRwE
 CnN1tstTeie3wAhg6lQ7hlV5/LcHDfp280WEsSHgcgdGcrSjrNzdiS1qG+LPTbODJ4Mt
 uxw91JfqPQUB5HRVOI6WRgEQrfCextx0xEKGUIuS5qDJ+UFI2Q8jLjHR3tCP4HgSZO40
 trHGA0RRDZDsh367NyAztsL30+QJbWeLZZN4D90RQQokfXZFhrNT49l+BIBDNwf0C//R
 W96Q==
X-Gm-Message-State: AOAM532Fs81r+U9VBvCynkWiazx/Taa6UZ+u5kS0fwXdaCd/hUF3/VGi
 x2xhaNZcG5BvCt/zGqzNGsjy6a7Nzx4=
X-Google-Smtp-Source: ABdhPJxtEEzbKF1V7xV1q6labpWAgKBMvbet08EUaiHIGELOVbsaoUKtsgbR3MA+W+51Rb6hflZWEg==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr21702731wrv.131.1623145329040; 
 Tue, 08 Jun 2021 02:42:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:197a:8536:afbe:3762?
 ([2a02:908:1252:fb60:197a:8536:afbe:3762])
 by smtp.gmail.com with ESMTPSA id 125sm2473346wmb.34.2021.06.08.02.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 02:42:08 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: "Das, Nirmoy" <nirmoy.das@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
 <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
 <6d316dfe-0378-8284-1f8e-29caf5619e34@gmail.com>
 <a08db95b-7c75-d998-7443-73d809121e47@shipmail.org>
 <aa1d9fea-d425-608d-6696-96e437acd08c@gmail.com>
 <59e3ccb8-5c6a-e44b-41d7-9d15dc3c63f5@shipmail.org>
 <adb183d0-fdcb-5b78-a814-76683b6200ff@gmail.com>
 <552ba90e-0136-1008-2f0d-5501006b007f@amd.com>
 <df1b9679-1780-3905-4b25-9e73c1ca1320@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <500fba95-7ad6-d842-fb0e-9cee7f852cc1@gmail.com>
Date: Tue, 8 Jun 2021 11:42:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <df1b9679-1780-3905-4b25-9e73c1ca1320@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.06.21 um 11:40 schrieb Das, Nirmoy:
>
> On 6/8/2021 11:38 AM, Das, Nirmoy wrote:
>>
>> On 6/8/2021 9:21 AM, Christian König wrote:
>>>
>>>
>>> Am 08.06.21 um 09:17 schrieb Thomas Hellström (Intel):
>>>> [SNIP]
>>>>> Do you have the log to double check?
>>>>
>>>> Unfortunately not, but IIRC it was directly from vmw_move().
>>>
>>> Nirmoy do you still have your vmwgfx test environment?
>>
>>
>> Yes!
>
>
> I will test this series on my vmwgfx setup.

Since it is already pushed (and we fixed a bunch of its fallout) can you 
please test drm-misc-next instead?

Thanks,
Christian.

>
>>
>>
>>>
>>> Thanks,
>>> Christian.
>>>
>>>>
>>>> /Thomas
>>>>
>>>>
>>>

