Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C38A36C07
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 05:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F6710E116;
	Sat, 15 Feb 2025 04:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S4UYX5nN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBB810E116
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 04:46:45 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2fc4418c0e1so226169a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 20:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739594805; x=1740199605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TlGkSHC+29Qdb3t6NyOcNTdZSBupXOOp5HcUMYyzx6Q=;
 b=S4UYX5nNHIOM4+5uAR3ug6AvnbRS4plvkwHsU/eGkO22O/Ksd1T6IgaJaMzkbG/K0u
 6h49Z4uTHjeO4JAwRQhZn0w/LG520K/49rQWY14Z5lGCyC55l2WItpHHyzWfdGYPLpDB
 3lNyQ1MXwtvyNt0wrl/SErZbwPQ9fnvmnmeREg1gsQmQnApRVUU2WrtKDQudSYsQtjlt
 gSTFWtcrIoP0E2Oyx5DJ7xOjLLpLJ9hvqluGfW/Eci1XFWVlz+51x4kNNeSvaCWBEvGg
 SLDG3H50E8uC28d/xXsvC0lCZFrI2IhsL8vKXz/oixa7py64eGNpO4m7aQf7g3On/N+F
 seYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739594805; x=1740199605;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TlGkSHC+29Qdb3t6NyOcNTdZSBupXOOp5HcUMYyzx6Q=;
 b=ZluZ/a9AYTTR41TcQaj0T/HCpqvMmdflg8wQFb6LilouszTM+FXRmNl1BHAuEIeQXQ
 4/+JPvYXruMMQ1yGF+Hw3BxVgGlu9cPTieSvsxZZg/RXZIT8g+J5magB8cef/RJ37Ls1
 MzmSxHLK3MoECn2/XWcb4GI7mJEzWccXjlGju+IyCBKzSXEHwmuI9p4o2Wx4NJOacN5z
 1qhzPLL1OuOq7jfxooD/82I0705mMZjKmhD/Q3TGmT5Zi4DPNGg3Q4jy2Kiqlf4jE1KG
 UiALbXPBZjGt6X+/KS27erV/REAM3HGzNZSVZ1w1XKAzYhJ7fWHIFwyN+JK6T12QRMRn
 F0Og==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7n71zhReZDYIgas5AotCb01S0SWo4eJBJtSIU0FgynVcxcHmkeqZkVriIAkoT9+z/aZz6Yv3Njkw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHzZ71f0yPygjrpTGWR8OTeaT+HlwF6RW3W94jOnsF30iMdEuU
 tJJUV7abU9wHxZfERu+bPuqw8IVXiyBhStUO+RN/YW+XOCPIvdD6DeB2U2WV
X-Gm-Gg: ASbGncvRJe6Bp+3geNwqWWmKNpnWRpHNvvC1l2/0CrEXKRgMi0BMVLkqIeLoHmMUpg4
 159X3VJTzFCwrf1kXe9PEOM7d2LyiAyzgGHTVM7CY7FRdTkx2v5goclm5pycowHcFIBtUSNVmTl
 NUOO2JCn4bX6msNPLB+aXlEGV/lS4aSfdMwkzPOxbnkinp6eGjoLpdyT09tK+HDL1hcsKRLKmug
 Ueqi6rSvfGPJXXVLJDlzPhUT6lIis2zQJC1uMOSS3B+hm6LazymjFU+TaB1IwAs7/Sz+oK6bUQC
 LFuJGORU6RC83U23DnIt
X-Google-Smtp-Source: AGHT+IHU0NxPN0WsVg2OChmjHxCLUmIhi80OjWz2ZHonA7rsDZ4Md+KHEPqpwXgkcNQb0PKNJdZCkA==
X-Received: by 2002:a05:6a00:4fd2:b0:730:949d:2d52 with SMTP id
 d2e1a72fcca58-73262158ademr2966681b3a.3.1739594805107; 
 Fri, 14 Feb 2025 20:46:45 -0800 (PST)
Received: from [10.3.72.248] ([103.4.222.252])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-adb5a92d302sm3768366a12.70.2025.02.14.20.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2025 20:46:44 -0800 (PST)
Message-ID: <260b1542-a9b3-4541-abbf-0edb796918f2@gmail.com>
Date: Sat, 15 Feb 2025 10:16:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: sony-td4353-jdi: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250214172958.81258-1-tejasvipin76@gmail.com>
 <20250214172958.81258-3-tejasvipin76@gmail.com>
 <CAD=FV=U22kToVeyCBy_TV5hNKuMZv-QBUg0WTyXsMSu=bHLd3g@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=U22kToVeyCBy_TV5hNKuMZv-QBUg0WTyXsMSu=bHLd3g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/15/25 6:12 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Feb 14, 2025 at 9:30 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>> Change the sony-td4353-jdi panel to use multi style functions for
>> improved error handling.
>>
>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
>> ---
>>  drivers/gpu/drm/panel/panel-sony-td4353-jdi.c | 107 ++++--------------
>>  1 file changed, 23 insertions(+), 84 deletions(-)
> 
> Nice diffstat and so much boilerplate error code removed. :-)
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

If I rebase both the patches into 1, should I still add the Reviewed-by
tag?

> 
> Note that I'm on vacation next week and it might take me a while to
> dig out of email when I get back. More than happy if someone else
> wants to land if the bisectability problems I talk about in patch #1
> are resolved. Otherwise I'll get back to this eventually.
> 
> 
> -Doug

-- 
Tejas Vipin
