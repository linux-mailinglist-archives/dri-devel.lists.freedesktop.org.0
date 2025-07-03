Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331CAAF6707
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 02:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4815F10E0E0;
	Thu,  3 Jul 2025 00:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="xRx/Dkyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE6610E0E0
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 00:56:17 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3df303e45d3so25207085ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 17:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751504176; x=1752108976;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Gla6qP1t7YkfAtEHd9+jQ2W8xSnenoBZz1/ucOZWmds=;
 b=xRx/Dkyt7KF2qwB0VWe0uOKwq48ruLIp2YM+B5VrKxiA+GJSCTSvZPYtEQ0iAPKcnv
 aEp5hydsuZ/dRQma/GeifcYkYOrmgH7xZSU/1kNFKnP8TJVs/h+DrBgRxJkhRSnnjYuP
 cP1UkLUGN/BS9r43X3Z5inf9ZORxmrOPvz1lGUn1qgxzoSLoswCrpdJJK5oPdrklA4Zf
 7qwmy7NP5jprRJbGweX7r17lXrnUWE4ZbBLHj37oJatNGz7iMs7XPx6EprAH3SN5c9aa
 2rzyZNxtbUETm2kI2eZ1Qj/A5Kg/fI3LUHVSJVhTt4DFXMSOyhM683Ki2+ho4JWTGDn+
 RSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751504176; x=1752108976;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gla6qP1t7YkfAtEHd9+jQ2W8xSnenoBZz1/ucOZWmds=;
 b=LZwue7+K2D+972I0VIHVI1jt/Cd9+G/0ldEKGuXGJl7CrFHnm3IVpSGNHnC6exYwc4
 Mi0pLlYLHPOT9ZyrK5MV4DE8jnoGFBA6IZtbBwKxDc0B2Yc0ZcIH4wCpkufcAwJ+hiIV
 06U4c+qw1k6FyINLP/GaS52fK8hq9mmw6FqxhC1Bt54iCVIt9WkCu4i8IOsW3lKvJ21u
 FYBauNlZS7dMY00u1N1nupFqUJ9bZ/Nj0mVOSj9nOvGbjnWLWmohdPC726K/o35naqzz
 oouLT9wdSVgJCobtU0ITH65bZ1pMFp5k2z/H1KfzoeD7D8gT3O3qZQBJeDFJS4VCbbOs
 yYWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoQgUzmyxzbJuERtqqKJQq2RcqUWIVKq7INbRSmGpgc90VIZNCh44KYXeJBov6fHUttS6cqw5+N2U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3aGmx/w2XKAq9jAGmQCWUn8++luu84eKI1qFVU4K52ZIupWhy
 Z4DHN9CcZdcNK9cWHvPaZuMPRzOpeCySZqVaaTJ2w6QNFNHIcj8wD+g4BeQFDFWnj2g=
X-Gm-Gg: ASbGncuozM9pG446O1EbGehmiFZRuPYh6ggIBJjZLnpwR9R+52rZVpdWMTtKQZHhVgh
 SBPm3dLEc/4ruE+hy0IsYr9PNwxyeQe/RHjm48Lga6Ax31o5YJ88JRiVbd+oj+c+SdyRPeKE8Ug
 MOb+2qAx/fWtgqXSxyrOmEevNSjEx3Tjqw2vWAiQq+WndIdKcB72dOEQFtD/gzBMvdxwdswOsa1
 qJ/qCmAHg2ffstZMMc9Rmp0sBYgEHmphESEoIp82A9IjxnAhknIKPUFfTFrshQgcP/tdki5vn2j
 DDTTmX6iwPJHkYen86LYNEAmN3Wepzq1GQXQ0jAJJTRHAgBPAjtfG1PqVEs=
X-Google-Smtp-Source: AGHT+IHVeyE4FS4TVhh7Og7XFxFfwxtZOPNp0ZpGWvvrw7Wd/PRX6REYiRhsuDEP240fqLJ9kNxiKg==
X-Received: by 2002:a05:6e02:1987:b0:3df:4046:93a9 with SMTP id
 e9e14a558f8ab-3e054923dc4mr62019995ab.5.1751504176280; 
 Wed, 02 Jul 2025 17:56:16 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50204aae3ccsm3260651173.116.2025.07.02.17.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 17:56:15 -0700 (PDT)
Message-ID: <30afcf80-a49c-4c5a-9979-2f27142f7251@kernel.dk>
Date: Wed, 2 Jul 2025 18:56:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 01/11] zynqmp: don't bother with
 debugfs_file_{get,put}() in proxied fops
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250702211305.GE1880847@ZenIV> <20250702211408.GA3406663@ZenIV>
 <175149835231.467027.7368105747282893229.b4-ty@kernel.dk>
 <20250703002329.GF1880847@ZenIV>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250703002329.GF1880847@ZenIV>
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

On 7/2/25 6:23 PM, Al Viro wrote:
> On Wed, Jul 02, 2025 at 05:19:12PM -0600, Jens Axboe wrote:
>>
>> On Wed, 02 Jul 2025 22:14:08 +0100, Al Viro wrote:
>>> When debugfs file has been created by debugfs_create_file_unsafe(),
>>> we do need the file_operations methods to use debugfs_file_{get,put}()
>>> to prevent concurrent removal; for files created by debugfs_create_file()
>>> that is done in the wrappers that call underlying methods, so there's
>>> no point whatsoever duplicating that in the underlying methods themselves.
>>>
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [10/11] blk-mq-debugfs: use debugfs_get_aux()
>>         commit: c25885fc939f29200cccb58ffdb920a91ec62647
> 
> Umm...  That sucker depends upon the previous commit - you'll
> need to cast debugfs_get_aux() result to void * without that...

Gah ok - wasn't cleear since I wasn't CC'ed on the series, just the
single patch. If it's a single patch, I'm assuming it's good to go
if it looks good.

I'll just drop it.

-- 
Jens Axboe

