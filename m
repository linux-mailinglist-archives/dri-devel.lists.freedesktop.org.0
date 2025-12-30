Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E79ACEA602
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 18:59:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A3B10E2B8;
	Tue, 30 Dec 2025 17:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YMr3ch/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BE310E2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 17:59:36 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2a0eaf55d58so64465505ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767117576; x=1767722376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/CHIgKSfibsVDyynvS5htdSQz4K+hlBg8dyDuvjuAZc=;
 b=YMr3ch/cN8wvKorlFyRHctNZzD8fWBMt0/MqRSz8Ee4Dqihh43LG5z4oVgQc65LGxa
 S19fVnwQ2NMMJr0dsDJiWHZSoGuCmDsr/ptlA8nINODX+6fFMRmkD57A8gJOa7mWAEP/
 WypIWE0GLcvdGVqBckfQT2iwdNNwqL+vDTwSMEmh1Vm2gdMIoKmOfqU5Qpfl00IZo4p+
 65yAi1RJVVDVYxDaCWtrnUGRo3c+44L5GFQhd+lRIQ9Vy3NL93shUTzpXM/DzwAq8Z/z
 vX7qfqnmZrjGT32nxdZwazm5AKAlrS25zViqQiJ2rC59XyvNZ/XkjULzN0rfTeOQJ8+/
 oXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767117576; x=1767722376;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/CHIgKSfibsVDyynvS5htdSQz4K+hlBg8dyDuvjuAZc=;
 b=Cd+kqVmhrouwYeKyAVXGk7l635Ffr0drtaIuWqlkyLH5J0GUBDtKhMmGsdOMtK0+Qi
 3WXuIPoOVVWuXrKT0j5Q29zpsW3zpJm9ANT0ufxyQCa0bXE80+iOHGnLWyjdt0lsG1Sp
 HAAMYYNj7EI6ULvt//n9Vq2pZq79sobp/z0gP6V2vVjCBQvnfGN8DqPRA5kVnRNu6l/i
 VvuLb8IReMYP3nSSdgNzlvjgGxNr61uhfZFTD+FF38dhOuGzRDrqcKhWYtuR3OCWxWAf
 45DEKDdcZlMYO8VTg8WH9UCMXA5flmHTgeWXOoiSOmM7G7UjREnnjjFcDXsMM6cliYNc
 CUag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXM2V+TwqnY/5zaoZJjIM13epUSxqOOlhJz/JFpB71zGAntlhSez2hzB2LdtnwS1CMGfT3UqafjVA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3eLKm6saM3ltxDWP9wm6J2ePY+apHh/sglkXGjGfqq82/r5SG
 K//h+sMYViiESGcr+m+ju/9TXUmVu/Mwe5eLKZL55yBJ24bkBqL7lfHR
X-Gm-Gg: AY/fxX6jad4B1GU60ztU3LEBa0eqJyNfhyTEOQzJPIMyZA9E9D88Xtv4+Br55iji35o
 RssF3lmbqgsdo2Rl4K8MpFJm7YuVOozIn2NccB/LiMDFEsl50Cp72m0fYc+iVMhV0xq86Rmx4K2
 YN9lnwNylq+uPNi1XK4b8gBt8vzKIiJ6tPrG5+v+Mi8JHURpXI1gJRZ45QJB1KQhbPaEjs6hXEO
 5UBdPdwWsMZXISOiYB8gwGYZIs5s5BQMgW+Z7KLyK+OHkwv5TlwpaMsi1yf5b2JBb6Qx/ZTAHaY
 reFtR855RP9eXZQcwB8Kk9rIWkcRzIIX33oAzPTjN9v8epE0Pp8qHL5aJ9QviV5EOKMl1IGcWBG
 HlH9/tYyiJ7AF3H7C12M5Pfq6sEqfckLbdmW93wdZdrxa6gY1xjf4Lv3YFr+CyFKTbDZbRCZ1/V
 PF/neCXlE3l6I0XXS23N3C3vLT37avsidB/gANRQa12zIs8FxM9VYXJsC7Jdy0
X-Google-Smtp-Source: AGHT+IHFngs68Viy0QIud4OyKUMML0W7Abh6BiK0CuBqkEfCHrIFWmwGVVieu+bTWVJ/P4u+tamC4Q==
X-Received: by 2002:a17:903:4b30:b0:2a0:de67:9704 with SMTP id
 d9443c01a7336-2a2f0d2daa8mr301443375ad.19.1767117576143; 
 Tue, 30 Dec 2025 09:59:36 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd?
 ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3d4cb48sm308258165ad.64.2025.12.30.09.59.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Dec 2025 09:59:35 -0800 (PST)
Message-ID: <7ded1cc9-71bb-4ad3-8804-477b4317a6b3@gmail.com>
Date: Tue, 30 Dec 2025 09:59:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <aVO4pslXIvnc00J3@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVO4pslXIvnc00J3@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 12/30/25 03:33, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 09:28:18PM -0800, Chintan Patel wrote:
>> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
>> it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
>> remove hard FB_DEVICE dependencies.
>>
>> The series introduces a small helper, dev_of_fbinfo(), which returns
>> NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
>> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
>> full compile-time syntax checking.
> 
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>> Changes in v3:
>> - Use PTR_IF() to conditionally include overlay_sysfs_group in
>>    overlay_sysfs_groups
>> - Decouple variable definition and assignment in fbtft_sysfs_init/exit
> 
> Any particular reasons you ignored my tag from v2?
> 
Ah.. This is typo. I see what happened now. Looks like my script picked 
wrong or old patches instead of new updated one. Should I send v4 or v4 
is fine?
