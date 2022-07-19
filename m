Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1456757950F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EA611A663;
	Tue, 19 Jul 2022 08:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0285311A663
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658218439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Vk/qh1lraPzWeoR8YLdDUU7h+SZ7xDsOZa0DCPNH6U=;
 b=Cw5RXO1A/9X7zbNpgmAz4r6b5V4vaeABWlIU/Ui6cbESmg7bDJXbZSKCpWQkpScbuj5laB
 zdRhrJshJHFhkpEOhSrpDSycQuFbBxHQ8zL82A9z6ByQgwDm4mTOtGBHvm1afl0Nrd/7ce
 AecT+rSZ5jKO86OCZn2NsAvh4ad5pb8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-yYttTYOvP-CKCulHL3G1iA-1; Tue, 19 Jul 2022 04:13:58 -0400
X-MC-Unique: yYttTYOvP-CKCulHL3G1iA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k27-20020a05600c1c9b00b003a2fee19a80so8925456wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 01:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2Vk/qh1lraPzWeoR8YLdDUU7h+SZ7xDsOZa0DCPNH6U=;
 b=PQn1mJmArGXAW2lVU8x13oLGTnHgS/+V/7CH52P8zw7Or+BHi5zzdCfEEjhqr1aZgN
 SFIs03KcxCbBx0jE7nxxVEZYWiBYE+uEvhIObJguOhH5cmZjgTFQvqKkc49wI+kB1jc4
 WTMr2OCgzoAY63ck+DMc9Yy9WTqmrV90aqcFuDWQLeKMps52Ws6LYZDGs5gATC+8MW1H
 2MJDzZTIspPSLRxLiOy/iD3I8se6YMUiq1KNIPDu3FnEYTu3JzV+EgoSn+eyd8JQ58Yh
 aA93zlvNjTFwvJ2ThfD3c+h1LTpat4Z+x6z0aot3vX9Ay9XhdijDsiUbV3VQ53ZY7oSJ
 GCSw==
X-Gm-Message-State: AJIora8iFhAjDpthjJ1T3qpvUGQBt2jfak8AXCZmpSCL/RWj+Rz7URK6
 k9EGgERYOrT5W2h34HdKNUWxEdxq2UbyrGDvIF3xT6ge0zD7Si/SF6rpfzhuhadwc0WPobePPRp
 Q1dtbRAGZDMzvuI9T1alrJGt2Nr+u
X-Received: by 2002:a05:6000:2c6:b0:21d:be55:d311 with SMTP id
 o6-20020a05600002c600b0021dbe55d311mr24260390wry.154.1658218437062; 
 Tue, 19 Jul 2022 01:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tF83xb0qJHS+irRdry2gGPyed91OxX9RQANgySymd+7uXy6257n61a5ZISvIpYLFB0SnCn7Q==
X-Received: by 2002:a05:6000:2c6:b0:21d:be55:d311 with SMTP id
 o6-20020a05600002c600b0021dbe55d311mr24260375wry.154.1658218436876; 
 Tue, 19 Jul 2022 01:13:56 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k6-20020adfd846000000b0021d8b1656dfsm12639819wrl.93.2022.07.19.01.13.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:13:56 -0700 (PDT)
Message-ID: <37162e6d-1056-cc4c-da4f-95d1b124d907@redhat.com>
Date: Tue, 19 Jul 2022 10:13:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
 <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
 <b7bd3635-56c7-a1af-4d9e-70ad2c91f388@redhat.com>
 <YtZjhaFVHJJi5OSo@ravnborg.org>
 <9ac4096e-454a-59c7-d0c1-e377b4dd2ec8@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <9ac4096e-454a-59c7-d0c1-e377b4dd2ec8@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/22 10:05, Thomas Zimmermann wrote:

>>> [...]
>>
>> I will update the series with the following:
>> - Drop drm/dri1/
>> - Keep the CONFIG_DRM_* change and keep the DRIVER_DRI1 change
>> - All config options for DRI1 drivers will get a CONFIG_DRM_DRI1_*
>>    prefix
>> - Convert at least some of the drivers to single file drivers named
>>    foo_dri1.
>> - I may add SPDX for licenses when I am touching the files
>> - I may try to concatenate all dri1 specific drm core files to drm_dri1.
>>    It is easy to do but I will take a look at the result before posting
>>    anything.
>>
>> When I have posted the above let's see what we all agree on.
>> May take a couple of days before I get back to it.
> 
> Sounds like a plan to me.
> 

Sounds good to me as well.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

