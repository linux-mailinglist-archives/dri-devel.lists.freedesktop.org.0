Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD0B4D2DE0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 12:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5910E42E;
	Wed,  9 Mar 2022 11:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B5510E42E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646824916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=axxJQPKDz/ZKFzx7js+EM+U1rMdue7zxP8Cr6MBe+XM=;
 b=El6MM3OeyKYvwTg6GPUK5FAaGy5WE6Gur8kUTOhaLZ2jejkcggW/gxEawwshzB6UxRvEgr
 F8/6oYCco7DU3yNPwlx5uMloLIapFKVeG4iVh1YNVRWPiuH4TMa0f8VE2jAvrWOcu9ZeOR
 bRSEmDEmXXS4sTUbPRX++grmZN0PA6A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-VVPr5hPrN9i92di0Y0SsLg-1; Wed, 09 Mar 2022 06:21:55 -0500
X-MC-Unique: VVPr5hPrN9i92di0Y0SsLg-1
Received: by mail-wr1-f70.google.com with SMTP id
 m18-20020a5d4a12000000b00203731460e6so656042wrq.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 03:21:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=axxJQPKDz/ZKFzx7js+EM+U1rMdue7zxP8Cr6MBe+XM=;
 b=mzroxlnlkPpLNtUR3Cj26nCIfW4hmKj+pXtM9BG5duKLSIChbF7SmKp3HdAC9WPiLO
 PH6GHGK6Z7MSis5YsUFIYt551gldaMZGlxGs4NujXNRRdLgpGLUuRJ/73IGT1QKe30EX
 HNhp78oab/TF3pZOodLItLp30KNN1Myl+fj+tmfSf8Jbp/vConU5pjMhRf4TXGP5VxfX
 XWw+8YFlHhNOaciW6Fa7r9+AOKFaCoseV/7zmdkKBws0IHrsXO5g3IJrWxlfzvxrYpKY
 C+yvdIJ6WtPab/asW48028SI9SE2daykR6jSnkoCyZvhxBv9HwuNd30HpxRhn9BcIhi1
 R+5w==
X-Gm-Message-State: AOAM531jPPrAE4awUbX49NOyGfwPPe0b1inVkFcnsWUlGVcJq9RwhfTZ
 qHd1T9Y9HSNykfoXnfKLEB+rkuXX6GTtegcMYab20ZBavGGk1mJ7uoWUPeOpLYf4jglFSynGDeh
 7kPgUTlWuI0Ta9JZPAYukGHyWdMJp
X-Received: by 2002:a5d:6405:0:b0:1f1:faf1:a48f with SMTP id
 z5-20020a5d6405000000b001f1faf1a48fmr9546220wru.684.1646824914263; 
 Wed, 09 Mar 2022 03:21:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdqAEqF3qLcKLuYFsHLZlnN18Wpty0xUyufZbpPlI3IiACoue56r06p5xuvHPwTYE1rxu7kg==
X-Received: by 2002:a5d:6405:0:b0:1f1:faf1:a48f with SMTP id
 z5-20020a5d6405000000b001f1faf1a48fmr9546205wru.684.1646824914048; 
 Wed, 09 Mar 2022 03:21:54 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b001f1d72a6f97sm1384827wru.50.2022.03.09.03.21.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 03:21:53 -0800 (PST)
Message-ID: <7599362f-4c66-673b-7cd4-cbb3e81c8755@redhat.com>
Date: Wed, 9 Mar 2022 12:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/9] fbdev: Track deferred-I/O pages in pageref struct
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-4-tzimmermann@suse.de>
 <291426e8-32ed-ba0b-4d23-38218d450c93@redhat.com>
 <0dcc965e-fbda-fbe7-fac0-31f0df9f3234@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <0dcc965e-fbda-fbe7-fac0-31f0df9f3234@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 3/9/22 09:36, Thomas Zimmermann wrote:

[snip]

> 
> I thought about using pageref->offset in fbdev drivers as well. It would 
> be more correct, but didn't want to add unnecessary churn. Especially 
> since I cannot test most of the fbdev drivers. If you think it's worth 
> it, I'd change the drivers as well.
>

Thanks for the explanation. No, I don't think is worth it or at least as
as part of this series.
 
> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

