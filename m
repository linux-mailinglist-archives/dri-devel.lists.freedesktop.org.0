Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E0C5F4C35
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE4410E2A5;
	Tue,  4 Oct 2022 22:50:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DD510E2A5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664923816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prKNXqP1u7bbMnl0WESVb0l7mQsnoo+Yuy57/03lhJo=;
 b=gn3WQMJTRpzhejrC1Q89AIb4g+7/9OeJ/F7IwdZ9IHrQZ4tNGyKcZ9jOIGS+oojdn5Z1PJ
 TpBiuV47i8LDlDWQZdQizwy/FubnA9atnOWl+FrsTA6vOESG0FBVTsWjf3Q3g/UCvgTkg3
 3/eeZfw7XOzabAYrWVfRzAS8XC+RxUU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-Kht5IV_UOYOnsKUvuHrakQ-1; Tue, 04 Oct 2022 18:50:15 -0400
X-MC-Unique: Kht5IV_UOYOnsKUvuHrakQ-1
Received: by mail-io1-f71.google.com with SMTP id
 j20-20020a6b3114000000b006a3211a0ff0so9843475ioa.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=prKNXqP1u7bbMnl0WESVb0l7mQsnoo+Yuy57/03lhJo=;
 b=nGfQ2aJZKyT+lzkP1tFQ9iFmKntvdP/O/Wg4j+QkJo21XzCXgEmC+dJ3Vqbbunay+a
 XwTlZxC+ft7troyGT9mSdU26IM9IlxSYF6JYnbfCep/EUFU/dXsDXV8hvh9/t/oiD0xX
 FNaRRiWweaLd05fJ/pJy1jmUujTfG1rwBXZOBwQuzOX1Lyy////UkqiEe84q7FPbyoH0
 Qlo4YvS8HPrvcAbJuE+3VUT3VEp+AuK12uKxrDbu9MGaZIAAAbNWbCZPB7iIuGBFxUVO
 1NSDzUPlMPLB4p2VRIXyfVbU2JgD6pINHKNWgC9crkxuPuIuT5u/oWwv3IsmVZtZhDH/
 qd5g==
X-Gm-Message-State: ACrzQf3Cl0omrucFSNdnX8aj2F6a2ID6XFefowZ+wyvKwHS22/r7R5A+
 PaZeveB7vc8EF90L9uRj+s1rWCMhAgSpIi7etjIOGwoMe0cVr2xUMD+80IvWuVHnF3vROJFjTNg
 C19SlQ9TwfmsWLepzvZkMO3XNwJom
X-Received: by 2002:a92:cdaf:0:b0:2fa:27e1:727a with SMTP id
 g15-20020a92cdaf000000b002fa27e1727amr2616364ild.135.1664923815253; 
 Tue, 04 Oct 2022 15:50:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4UZFi0KhCPWY5BEIx+bOXJmt8m6kdmknXq2Xcca41Wa2mBFhab0LxH89NIW1zyyVbgU3yORg==
X-Received: by 2002:a92:cdaf:0:b0:2fa:27e1:727a with SMTP id
 g15-20020a92cdaf000000b002fa27e1727amr2616355ild.135.1664923815043; 
 Tue, 04 Oct 2022 15:50:15 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 l9-20020a056e0212e900b002f9f44625fbsm2013415iln.52.2022.10.04.15.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:50:14 -0700 (PDT)
Message-ID: <fe7ae779-64e6-8f0a-9dc4-93ea74ece7ce@redhat.com>
Date: Wed, 5 Oct 2022 00:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 12/16] drm/udl: Add constants for display-mode registers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-13-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-13-tzimmermann@suse.de>
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

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Add constants for the registers the contain various display-mode
> parameters and update the mode-setting function. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

