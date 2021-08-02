Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF13DCEBB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 04:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6377C6E20A;
	Mon,  2 Aug 2021 02:39:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD066E0E3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 02:39:31 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e21so18015145pla.5
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Aug 2021 19:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=M3ir0QsVPlZsChLxF6JkqrS0QNqX7owWvReJNCEoiME=;
 b=Z/9g47BciTCpi52/Jzr3ZQXQfAn6bp6tW3fQuMhsBKcvO+iEAJ4Uz//buwzbPcGl8t
 fkNMDK5eItuIpAFyg0mqq8z6yUs5T7coOfZde/pComs3vebLDOxChSQ5FdHduDTqI9XJ
 QOBEWPsCHxHI8IwVmUf7zQD30vYFfJ32AvGcddr7mR8bPClU2eWRKX6YN9++x7nVnu54
 G8pSEJm8CyHKePTJeGMO369bwlkpgq368FHZ6M02iGBncM9N0iyJS7EpL8zdDLUFy4+n
 86TUA7nB3BBQjsw44dZ9I/Z5DWc0Rvettm4U0oMn3fwftaE+Z8yKC0Rks7csyD/cGdhL
 TIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=M3ir0QsVPlZsChLxF6JkqrS0QNqX7owWvReJNCEoiME=;
 b=G5ThVyppQqPS4ILULgBdm14O6Dv9/OZYLFJ0JJgGecPKtgzkBFo4Kf0zqOQEBv/N6Q
 mTmIzlw2OmQu0WOJUNvhYYqs9N8cLvhqAUbHArisHHLjDjPMd8yomQOujbYxb3qx5fvW
 1L1a0z44hLTW6mkz3SVa6bDK0o7Yl6wesTIB0JAX9QRG3kS1lkNxgwNZ9jUe/9uxCPdo
 KWvbUElL2ZjYLDZUhD4gRHa85QQF0gyeXZxbUTVfoHXJbtDzub4FY78PlTVaRj5BQ23F
 UBz2APOx17lcIF3btagDGuu9NeB64EEUQ6ZSeFlsa1BqKutNgvlS8hfDXt6fsCcwLGok
 qWZw==
X-Gm-Message-State: AOAM5339EH4PJ7rPS2yu2/Y6zEXGMm5IbPzntlb9K2HOX8M+JFDJOXsu
 jBh3Qmm4JvnGbmOCSNSVQ84=
X-Google-Smtp-Source: ABdhPJxOhBBdXJyKRTXbSAaLcLx5s/3DiTbdF1BojP+s+MxabrKAsck405Ib05DHNHVBhmrbdk0jgA==
X-Received: by 2002:a17:90a:e289:: with SMTP id
 d9mr14784155pjz.186.1627871970709; 
 Sun, 01 Aug 2021 19:39:30 -0700 (PDT)
Received: from [10.106.0.86] ([45.135.186.29])
 by smtp.gmail.com with ESMTPSA id 136sm8464962pge.77.2021.08.01.19.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Aug 2021 19:39:30 -0700 (PDT)
Subject: Re: [BUG] video: fbdev: sis: possible uninitialized-variable access
 in SiS_SetCRT2FIFO_300()
To: Sam Ravnborg <sam@ravnborg.org>
Cc: thomas@winischhofer.net, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com
References: <e0f988f3-f010-6299-d000-5c035e5f2e2e@gmail.com>
 <YQbg5yt0QUOC9dop@ravnborg.org>
From: Li Tuo <islituo@gmail.com>
Message-ID: <9d510290-a55e-4a04-0e73-3ad070167b2b@gmail.com>
Date: Mon, 2 Aug 2021 10:39:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQbg5yt0QUOC9dop@ravnborg.org>
Content-Type: multipart/alternative;
 boundary="------------06005925B98B29105B301991"
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

This is a multi-part message in MIME format.
--------------06005925B98B29105B301991
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for your feedback! Should I commit a patch to fix this problem?

Best wishes,
Tuo Li


On 2021/8/2 1:59, Sam Ravnborg wrote:
> Hi Tuo Li,
>
> On Sat, Jul 31, 2021 at 02:28:39PM +0800, Li Tuo wrote:
>> Hello,
>>
>> Our static analysis tool finds a possible uninitialized-variable access in
>> the sis driver in Linux 5.14.0-rc3:
>>
>> At the beginning of the function SiS_SetCRT2FIFO_300(), the variable
>> modeidindex is not initialized.
>> If the following conditions are false, it remains uninitialized.
>> 5346:    if(!SiS_Pr->CRT1UsesCustomMode)
>> 5438:    if(!SiS_Pr->UseCustomMode)
>>
>> But it is accessed at:
>> 5466:    colorth = SiS_GetColorDepth(SiS_Pr,CRT2ModeNo,modeidindex) >> 1;
>>
>> I am not quite sure whether this possible uninitialized-variable access is
>> real and how to fix it if it is real.
>> Any feedback would be appreciated, thanks!
> First, the report looks correct. There is a path where modeindex may not
> be initilized.
> But I find it very hard to care for such an ancient driver.
> If this was somethign we hit is real life we had heard about it - and
> the risk of introducing bugs is higher than the the cance that this
> fixes a real life bug.
>
> So my advice, find something more relevant to look at.
>
> 	Sam


--------------06005925B98B29105B301991
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Thanks for your feedback! Should I commit a patch to fix this problem?

Best wishes,
Tuo Li
</pre>
    <br>
    <div class="moz-cite-prefix">On 2021/8/2 1:59, Sam Ravnborg wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:YQbg5yt0QUOC9dop@ravnborg.org">
      <pre class="moz-quote-pre" wrap="">Hi Tuo Li,

On Sat, Jul 31, 2021 at 02:28:39PM +0800, Li Tuo wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hello,

Our static analysis tool finds a possible uninitialized-variable access in
the sis driver in Linux 5.14.0-rc3:

At the beginning of the function SiS_SetCRT2FIFO_300(), the variable
modeidindex is not initialized.
If the following conditions are false, it remains uninitialized.
5346:    if(!SiS_Pr-&gt;CRT1UsesCustomMode)
5438:    if(!SiS_Pr-&gt;UseCustomMode)

But it is accessed at:
5466:    colorth = SiS_GetColorDepth(SiS_Pr,CRT2ModeNo,modeidindex) &gt;&gt; 1;

I am not quite sure whether this possible uninitialized-variable access is
real and how to fix it if it is real.
Any feedback would be appreciated, thanks!
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
First, the report looks correct. There is a path where modeindex may not
be initilized.
But I find it very hard to care for such an ancient driver.
If this was somethign we hit is real life we had heard about it - and
the risk of introducing bugs is higher than the the cance that this
fixes a real life bug.

So my advice, find something more relevant to look at.

	Sam
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------06005925B98B29105B301991--
