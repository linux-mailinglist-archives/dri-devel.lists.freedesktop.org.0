Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 564624FD2D7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 10:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED5A10FD7F;
	Tue, 12 Apr 2022 08:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3D10FD7F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 08:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649751157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zFHlbK0japjHffg40bdXVsPfsdU3+EFcf4YoUEiJmSg=;
 b=Kqb2l7gBcGEFiUfxKjagipWfiXpQ8b3lnau5+NHFSDT71QxyVQi2W0GIb2hgUKN9DpCtuq
 RqffnswzJ4meLzeTrFTxJ4s9vvZZ+5OPDCEQsXj/ILFbyzidqGnR75crf4wiFgyzDMttS6
 U0lNNXY0w+nu8d6HXgqE4UmS19Du2XE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-ADQJL43mNWOFEqC8Q0gLTw-1; Tue, 12 Apr 2022 04:12:35 -0400
X-MC-Unique: ADQJL43mNWOFEqC8Q0gLTw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r83-20020a1c4456000000b0038ebc45dbfcso1450417wma.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 01:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zFHlbK0japjHffg40bdXVsPfsdU3+EFcf4YoUEiJmSg=;
 b=K7MCVY60B5HrVH48JoxA5E08onCTHM4s/8lZY7xvgA6ZOkIN38XZEOmZ5vDP+yQC4U
 yjeggptu20WP1+VAyvj9WXdHe82go9RNvJKIIekrbQbeM+L8Lwm1zNwuTMvxzVrVSVFu
 DT9mEm4KD9LtPgDRs0kvkuUSmTX1aoBWZwa1q/bbNkCHbhnEPxzBlj3U67p4roBcjff3
 OEXzWHTSsgaAEZK7SHa4UKF++WTyeWlbf8meFJqkxIhqw7nsbqFjMKjraS5oenHvL/zi
 F5Ns261Iwuqm9Ny8KrhA+lArWj+DFNl5d+6jHKAW8+SnjhRO3cf/uE137Tc/TKaC6K3I
 F69w==
X-Gm-Message-State: AOAM532BaKQfgyE4ImIOrwCQKAhrdnVBR43lXtqeOltFNxZ7GKkvYPIP
 NTCDkbT01GHzgiNBPIx3YLduD+Q428e9aiPhcxcc3cTUk6h2d0fmXhHcr2UM4wNtf9Lw4KWFJGP
 QgOvhVLL8ILjVpkQs98SxKEDfwth1
X-Received: by 2002:a05:6000:1d82:b0:207:adeb:b797 with SMTP id
 bk2-20020a0560001d8200b00207adebb797mr1928065wrb.324.1649751154630; 
 Tue, 12 Apr 2022 01:12:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxt98E//kt764pUHc3CVnmZDCrv78xLuC2Tfbz+tDxYuSTUqiaZB/q3FZcTJYIYyWPsTk0KGw==
X-Received: by 2002:a05:6000:1d82:b0:207:adeb:b797 with SMTP id
 bk2-20020a0560001d8200b00207adebb797mr1928045wrb.324.1649751154440; 
 Tue, 12 Apr 2022 01:12:34 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 p3-20020adfaa03000000b00207a1db96cfsm7503196wrd.71.2022.04.12.01.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 01:12:34 -0700 (PDT)
Message-ID: <c3287f86-636d-33dc-c763-1f28803704f5@redhat.com>
Date: Tue, 12 Apr 2022 10:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/5] dt-bindings: display: ssd1307fb: Extend schema for
 SPI controllers
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-3-javierm@redhat.com>
 <CAMuHMdVuivPSRooR5CqTX6GQtxO6RQYwKUqfOK36zsiN8-v6kg@mail.gmail.com>
 <d37de4b1-55f7-ff4d-6230-6f0b6e65799c@redhat.com>
 <CAMuHMdV_4Gp2fqfCTeUigVxK=J4NF=SqJVd1hKAWpyuUv0Pnzw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdV_4Gp2fqfCTeUigVxK=J4NF=SqJVd1hKAWpyuUv0Pnzw@mail.gmail.com>
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
Cc: Chen-Yu Tsai <wens@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/22 10:07, Geert Uytterhoeven wrote:
> Hi Javier,

[snip]

>>
>> Do you have any hints here on how I should enforce this in the schema ?
>>
>> Or if you think that a comment is enough, then I will add it in v3.
> 
> I don't know how to make it required for SPI, if possible at all.
>

I see. Let's go with a comment then and we can later enforce it, if someone
knows if is possible / how to do it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

