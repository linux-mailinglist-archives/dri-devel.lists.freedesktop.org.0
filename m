Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294EB517777
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 21:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AC910F3E7;
	Mon,  2 May 2022 19:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1276810F3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651519960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbzfCdBFw8cpcp6GNfnwnh69uQicOecp+JCBFEKL4KQ=;
 b=UUPmXtcxnlgBTwaI65TAL08jjo0I07Wr+ZP61jIpoNCVz1Wcsj+Vt3zXePof2uUebndmWA
 3k0sf41gdm5zBXNk5kDlIWDIyt14l2Jby0XU9B7zQMXqxqDoxzoVyWQ0/aJDOg0Hdm9WLe
 FujPqTTcADzZd8CJqnjFiabG2AK73cs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-ussGqln4PyqpE74siAeGmA-1; Mon, 02 May 2022 15:32:39 -0400
X-MC-Unique: ussGqln4PyqpE74siAeGmA-1
Received: by mail-wr1-f69.google.com with SMTP id
 w11-20020adf8bcb000000b0020c550ba8d7so2052032wra.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 12:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nbzfCdBFw8cpcp6GNfnwnh69uQicOecp+JCBFEKL4KQ=;
 b=mFJ+eBdsMNXcr37zRZVE5NY4sKvuH02lBHlglI9ahyLNWdqbt7mZPtS95v74hbr+Oj
 JKaR9rgOMxkRrSAjmaOK6jYxa+TxUuiKOc94iR7kkXHjCxZSkj7d9S7Ny/wIcRZkgYZQ
 OmBTEjQpmXi4qKowZOLl6EZ3VWEyw7bBgZYOXKJ1ew/Xsz/yOEEraPFHz9jLgjBHTSnY
 qe3UGwb4lrSWf7/YBE8puwlwA4DqCO1n6Zsc8JljcSLpD2seOPy37VqKiaQAihoR/CGI
 +yBLHNnIkgNsu21Y164H2qEq60uOQVo36/YwfYaKGxfDGNZMNyVvTmIvpmADtJIwktho
 k9JA==
X-Gm-Message-State: AOAM533Ud3VMf+AuJLxKm2OPxSdkIh4FeKzCjSTUlssxmxSPl/7Hz6g+
 Z+YHzYrjBy5vSlgOuvOONv/ruRV6EfgaGFNSXO8HlpUlkexmePpivuraMR5Qqc01kePBoWvxyWU
 5zBnQab22rUYKK5MfwN/55beht+Y9
X-Received: by 2002:a05:6000:1f91:b0:20c:54e5:fbbb with SMTP id
 bw17-20020a0560001f9100b0020c54e5fbbbmr9326946wrb.557.1651519957823; 
 Mon, 02 May 2022 12:32:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVs7B+6rPqXsNNGufzXcbZnvxHD2Rc2poBCZFUtJFhTChFFutVIbK6j6FDqD2fufd2ssjz+A==
X-Received: by 2002:a05:6000:1f91:b0:20c:54e5:fbbb with SMTP id
 bw17-20020a0560001f9100b0020c54e5fbbbmr9326938wrb.557.1651519957563; 
 Mon, 02 May 2022 12:32:37 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d920sm10135342wrd.108.2022.05.02.12.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 12:32:37 -0700 (PDT)
Message-ID: <5691bc75-4085-d70d-a0ad-2dc450065c81@redhat.com>
Date: Mon, 2 May 2022 21:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 3/3] drm: Allow simpledrm to setup its emulated FB as
 firmware provided
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-4-javierm@redhat.com>
 <YnAEDlikr+d8cvy4@pendragon.ideasonboard.com>
 <9556f080-d309-f396-6d28-1190bc94cc38@redhat.com>
 <YnAcj9O3l/qLc5ss@pendragon.ideasonboard.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnAcj9O3l/qLc5ss@pendragon.ideasonboard.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Laurent,

On 5/2/22 20:01, Laurent Pinchart wrote:
> Hi Javier,

[snip]

>>>> +	fb_helper->firmware = firmware;
>>>
>>> I'd get rid of the local variable and write
>>>
>>
>> I actually considered that but then decided to add a local variable to
>> have both options set in the same place, since I thought that would be
>> easier to read and also consistent with how preferred_bpp is handled.
>>
>> Maybe I could go the other way around and rework patch 2/3 to also not
>> require a preferred_bpp local variable ? That patch won't be as small
>> as it's now though. -- 
> 
> Up to you, or you could ignore the comment, it's minor. If you want to
> keep the variable, you could also make it const, it's a good practice to
> show it isn't intended to be modified.
> 

Right. I'll also do the same for the preferred_bpp variable in patch 2/3
if I choose to keep them in v3.

Thanks again for your feedback and comments!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

