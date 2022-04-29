Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6A351439D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3148D10FCA4;
	Fri, 29 Apr 2022 08:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D89A10FCA4
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651219619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DLGpZkEk0zrBfkXdyDNagV1Ot68Eefe6MnXYNDLKtfw=;
 b=QTjC2iFKVFQk6y/2r2Z7/mQuZ0pwzA7EYrbNajsQi0knxTNti1DXoVLccT/zvelepw4TXK
 U1Rmd6vM3NfSp+pYi/GkXW2y2dgFUYmEw7/AjxGb51vipjfZ6nhD61uLDz0NHHy5RRtf0d
 UBq3DTv7rvNQ64mpvMu1F6IKVoA070I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-TQhOGw52NhyDkT4yyIu7Xw-1; Fri, 29 Apr 2022 04:06:58 -0400
X-MC-Unique: TQhOGw52NhyDkT4yyIu7Xw-1
Received: by mail-wr1-f69.google.com with SMTP id
 g7-20020adfbc87000000b0020ac76d254bso2779341wrh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DLGpZkEk0zrBfkXdyDNagV1Ot68Eefe6MnXYNDLKtfw=;
 b=qhobchuYVrBVdRYelgDWF619U6nC3F1bOprjnd23tW5BvHr/d+bI8Xuq6CSEeM/pU9
 vn6AT/TrX76fPWnJ1bvokIaCZBY0iyxGwX+DBgUhwL17JaNrHL33q6pxqfWWXicJE2ca
 oXl7errIuVgdBwawhtb4Ox0rPfPMAwIDx7573krerv+2T9tZ8YJZElrvax72C5Z69S6P
 wx6u46yb9A/TOZm4H6pcEypUNS0TzEBlMreuEIsaTzliPVKFDqtpLc0Gg5k+otmHp7mX
 KkeKsrSJMbeRRUdS5xt+sMaMiZemcxS3xwzS6uMplLxwzBrzoYnl2adpWE652o8UMSyo
 JHjA==
X-Gm-Message-State: AOAM531SH05nhNk+6TVNugjeS4+pusXowL3NNWc/LY0g/8ipqAf6aG/4
 dH3irjk7STIwLCbDClBMtWtEi3RHIN2R+UA0RCF1cMFViyqQYyTQ2n1q3+7lhy4bHPCUXpANroW
 K7C/Mypf8HMyoCmfR8NYHBPRtWEHM
X-Received: by 2002:a05:600c:4ec6:b0:394:1f35:4c69 with SMTP id
 g6-20020a05600c4ec600b003941f354c69mr1623991wmq.61.1651219616597; 
 Fri, 29 Apr 2022 01:06:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4nhCTQSlkHFSNiSRmvTsdvHGIghcHcLc724I/E5mgFee4F74Ys2EQrG5GMimuyw2I7UjkHA==
X-Received: by 2002:a05:600c:4ec6:b0:394:1f35:4c69 with SMTP id
 g6-20020a05600c4ec600b003941f354c69mr1623967wmq.61.1651219616352; 
 Fri, 29 Apr 2022 01:06:56 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a7bc14b000000b0039419dfbb39sm2210341wmi.33.2022.04.29.01.06.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 01:06:54 -0700 (PDT)
Message-ID: <97339148-9876-cfc1-8df8-dbb21a9c3c7c@redhat.com>
Date: Fri, 29 Apr 2022 10:06:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between fbmem
 and sysfb
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Borislav Petkov <bp@suse.de>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Miaoqian Lin <linmq006@gmail.com>, Peter Jones <pjones@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Yizhuo Zhai <yzhai003@ucr.edu>, Zhen Lei <thunder.leizhen@huawei.com>,
 linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
 <093d742f-4c87-2ff3-e9fe-153cd734f8e4@suse.de>
 <220929be-91c4-d19c-b04f-312c5f7e9e40@redhat.com>
 <YmuYE2t51lPIRT8p@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YmuYE2t51lPIRT8p@phenom.ffwll.local>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 4/29/22 09:47, Daniel Vetter wrote:

[snip]

>>
>> Exactly, should be done when the device is registered rather than when
>> the driver is registered or a call is made to remove the conflicting FB.
>>
>> I'll rework this series with only the bits for sysfb_disable() and drop
>> the rest. We can go back to the discussion of the remaining parts later
>> if that makes sense (I still think that patch 3/5 is a better approach,
>> but let's defer that for a different series).
> 
> We need to kill sysfb _before_ the driver loads, otherwise you can have
> two drivers fighting over each another. And yes that means you might end
> up with black screen if the driver load goes wrong, but the two drivers
> fighting over each another can also result in black screens. And the
> latter isn't fixable any other way (in general at least) than by making
> sure the fw stuff is gone before driver load starts in earnest.

Yes, you are correct. I didn't realize all the possible cases when agreed
with Thomas about doing this but tried and found that it's not enough.

I've a full patch-set now and will post as a RFC so we can discuss more.

> -Daniel

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

