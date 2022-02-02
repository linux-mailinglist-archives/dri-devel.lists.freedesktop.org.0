Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6964A6D06
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF83810FA14;
	Wed,  2 Feb 2022 08:38:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE3310FA12
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643791122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=162v2xzxQ3u4een4KbGtcbrsH49dUuDX0sFGI3OoKaM=;
 b=VDcxrsbyxypitIEdzaX6d1MmcEHv7vu4CLFGK76XuPtxHiTGXdh5ogbqBmLzte+2h1ccLE
 Ezr28fFbkMo20SCMP6rxOfiFW0D9rJcLcTPQ9lQYqRfOBIpnTc31SXgwiE59m/csNEIkhY
 /7n4xp/QElZKGguCjxmw7xxDumRx7MU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-y8tk4XSlNNivhL4kf-bhSA-1; Wed, 02 Feb 2022 03:38:40 -0500
X-MC-Unique: y8tk4XSlNNivhL4kf-bhSA-1
Received: by mail-ed1-f69.google.com with SMTP id
 p17-20020aa7c891000000b004052d1936a5so10033802eds.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 00:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=162v2xzxQ3u4een4KbGtcbrsH49dUuDX0sFGI3OoKaM=;
 b=iii0Yyx+0vLm4BH/+YMcTQ09jiFwh8kfTFqf/jjpgTmAHgh02+NU3eSSF7tWePWaaY
 8Q77ZgvH4YjAuBj9JCYJ4JB0DJn/YJUX646Da3CgRLhr777pSjJiIsNh97tFVJomiRKI
 mTOcBgVP2VyV6UP/MVEF18s2RwHGQcVMXeWcyxwKt7aHfuYb7ljkarsVqJC+Vu+MqokG
 BZaVv0Kzoo5p+ag1tqQivyD1lam4kB8E6sFlD/Mx7Ak4iEmfZmXWqtwi5FBo9zWeWdNj
 6wsq3d3t32iNyd3h70eYiZxuiEGY/LOJz6yQ++3eD5J+CynvTbAslDscal+2s3SNmVFp
 vVPw==
X-Gm-Message-State: AOAM530q7mJnhf9SLFLbugDfKGXw1wb0jtOc8cCdWb/s+L5ChcZxzFtO
 ygWnhMXGscvoEUM0DDl4qP5bBb5U+9da2w6MBGpXMC0vwF6g1iYrCZPR/DM1eKTTPWlZZtTmNqQ
 MnIvkkDZGWGkZIw7z14kgq1gPT44c
X-Received: by 2002:a17:906:2758:: with SMTP id
 a24mr23315048ejd.433.1643791119156; 
 Wed, 02 Feb 2022 00:38:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEdyJNA8q1uNmHWvFYEP/YNkKz8zxzVGxoUKfJxYwDg29nVRSAIrzftsT2br720j5xsvp4tQ==
X-Received: by 2002:a17:906:2758:: with SMTP id
 a24mr23315040ejd.433.1643791119012; 
 Wed, 02 Feb 2022 00:38:39 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id lf16sm15322042ejc.25.2022.02.02.00.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 00:38:38 -0800 (PST)
Message-ID: <f50d5044-7192-bdb3-7ca9-7217ed311787@redhat.com>
Date: Wed, 2 Feb 2022 09:38:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: linux-next: build warning after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20220202150201.290c7d3d@canb.auug.org.au>
 <20220202150320.3e9bdd62@canb.auug.org.au>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220202150320.3e9bdd62@canb.auug.org.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rajat Jain <rajatja@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/2/22 05:03, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 2 Feb 2022 15:02:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the drm tree, today's linux-next build (htmldocs) produced
>> this warning:
>>
>> drivers/gpu/drm/drm_privacy_screen.c:X: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'
> 
> Actually:
> 
> drivers/gpu/drm/drm_privacy_screen.c:392: warning: Function parameter or member 'data' not described in 'drm_privacy_screen_register'

Thank you for reporting this, I will prepare a patch fixing this.

Regards,

Hans

