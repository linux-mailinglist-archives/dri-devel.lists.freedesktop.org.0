Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 928F7BFF97B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 09:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA2010E897;
	Thu, 23 Oct 2025 07:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="NhUe1TTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EF510E75B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:23:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so37808375e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1761132207; x=1761737007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kjPYwjUGUBLIRYRVo/Xv8w6fNKMNsLf3PLH0iArVM50=;
 b=NhUe1TThLVgiE5F84UYnLZO/QBlilg+//PO7IGX4dejPPM4C7znjZR0HWWG1QV6VGl
 rjzIjl37Eku5Uc8GyIsCH44zHlfkTOTpYSAt62dELeTb09rdIJsr4LBm/9JJAqFNlFcR
 Sf6XXIxaRuB6RMqANyKEXdBWqcWZXtiAzZCIsYyR35w/NZ40vyBwYaOAAzCExyuhYUno
 U9/OOfg+rk9Tqqnm1bKs0tnwblIms69PPn/p2hn33KRjPfQKLViqTBW/bnot6HihfpSA
 9RXCeu4KtoRY1oozaRLZ1jO3e1VYQPuDop/dykILV1GNWUTnLpdqFDoH96VlDkdMi9G0
 ZzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761132207; x=1761737007;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kjPYwjUGUBLIRYRVo/Xv8w6fNKMNsLf3PLH0iArVM50=;
 b=mmEvAN9vuTGLd1wL9u49s2lu76Mb+z/9bGtIab0DYk9k/U9W3HAs5+UoDNFoH1+ETc
 2b06solA5uefGFiGyiZX43KqECVdKhNeK3vzZDdQPHK5vFAFPC9iANlThd+9DxZtAu0A
 eMB7/FF3MHZ3F4B9D84aJLFqZ4vMRTGu8bckyj3pXZJnAmy3liOsosv2X4WO1jqMfun3
 2AqsBRInnQk0qyn0O2s1O9DB/9zbYIyLLVm0muE/KTF2SJybR1Ycmtn2OvEbxuEaIKl4
 YM6DTgORXlgHMCfMMpbTk7oF3x0daF/zKv2X5CIzJhASWuffS7ji0DbTcGklkehixcFz
 jNiw==
X-Gm-Message-State: AOJu0YyvSuyezA4KHsVmP+1W/c4OcVd8F4odD38lJBgX2WM4rZT9iZE+
 Y1F6i33xvCw2l8DNP81vBTTtYcirpnu1Ikrsuuj7vDkPUaoACDeHyQo=
X-Gm-Gg: ASbGnctF+2Dks8ybwQ7XStBlDa37o106LKzt0YlUq2NBPNtgetwqll/E+Czm+CdqoV9
 jmazETbjDnfwS8MKvwJ8gm12nm3uSho4qdowvJX+nc0SmbeDdvAo0WqAmbALt5HfCuJ6GoQ9iZy
 p5hfp4FA5keOI2btk0nDqCbdEjtOXNSOygo69K86Bqk4GVCBtbwFeaO/WZ3GpSjK9Jy8kgp1ja6
 ofXbQsrim47msUiCm/wtlvTmxb2z4SkFMUwESTcDlILuvyK1PGnwQrG84Q3Ttle972RoABaX1Em
 AJy4Ee07MnxTyotgwd7NDpTQKxB0KAaq9LX24m1YwIZRXDaOTA7y1+MxNrdYUI35GIyjxOH64DZ
 VMnOJxGvmoCcVUXsGxWL5h9T7k8m8zWPrC/aePmcsrXLf0fpXP+4aeX4Qrq9jvtHzJR6007GmrC
 1kmN+OHr6YjHjcoWwJqbCaOvZZ+cefNMcGpfyh5WXt77QqwGN5Bqt7+NzuKgwNWA==
X-Google-Smtp-Source: AGHT+IHvaWk6lF5t+4jkEZNj4fCR2v2SPRQO7ACJdqn9xWJPRqdmrWzxShh0nYRVjV+WCcz+aSXGQA==
X-Received: by 2002:a05:600c:6291:b0:470:fcdf:418 with SMTP id
 5b1f17b1804b1-47117911694mr151571175e9.27.1761132206345; 
 Wed, 22 Oct 2025 04:23:26 -0700 (PDT)
Received: from [192.168.1.3] (p5b057850.dip0.t-ipconnect.de. [91.5.120.80])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47496afd459sm36880475e9.1.2025.10.22.04.23.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 04:23:25 -0700 (PDT)
Message-ID: <3ca10b2e-fb9c-4495-9219-5e8537314751@googlemail.com>
Date: Wed, 22 Oct 2025 13:23:25 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [REGRESSION][BISECTED] Screen goes blank with ASpeed AST2300 in
 6.18-rc2
Content-Language: de-DE
To: Thomas Zimmermann <tzimmermann@suse.de>, regressions@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 jfalempe@redhat.com, airlied@redhat.com, dianders@chromium.org,
 nbowler@draconx.ca, Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20251014084743.18242-1-tzimmermann@suse.de>
 <a40caf8e-58ad-4f9c-af7f-54f6f69c29bb@googlemail.com>
 <43992c88-3a3a-4855-9f46-27a7e5fdec2e@suse.de>
 <798ba37a-41d0-4953-b8f5-8fe6c00f8dd3@googlemail.com>
 <bf827c5c-c4dd-46f1-962d-3a8e2a0a7fdf@suse.de>
 <5f8fba3b-2ee1-4a02-9b41-e6e1de1a507a@googlemail.com>
 <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
From: Peter Schneider <pschneider1968@googlemail.com>
In-Reply-To: <e2462c92-4049-486b-92d7-e78aaec4b05d@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 23 Oct 2025 07:29:39 +0000
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

Am 22.10.2025 um 12:20 schrieb Thomas Zimmermann:
> Hi
> 
> Am 22.10.25 um 11:16 schrieb Peter Schneider:
>> Am 22.10.2025 um 11:11 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 22.10.25 um 10:08 schrieb Peter Schneider:
>>>>
>>>> Your patch applied cleanly against 6.18-rc2 and the kernel built fine, but unfortunately it did not solve the issue: 
>>>> my console screen stays blank after booting. This is regardless whether I do a soft reboot, press the reset button 
>>>> or power cycle and do a cold boot. They are all the same.
>>>
>>> Just to be sure: you do see output at the early boot stages (BIOS, boot loader). It's at some later point during 
>>> boot, the driver loads and the display blanks out?
>>
>> Yes, that's correct.
>>
>>> There's another patch attached. does this make a difference?
>>
>> Do I have to apply that against base 6.18-rc2 or against 6.18-rc2 + your previous patch?
> 
> Base 6.18-rc2. All the patches are against this.

So with this new patch against 6.18-rc2, I first got this build error:

   CC [M]  drivers/gpu/drm/ast/ast_mode.o
drivers/gpu/drm/ast/ast_mode.c: In function ‘ast_crtc_helper_atomic_disable’:
drivers/gpu/drm/ast/ast_mode.c:857:12: error: unused variable ‘vgacr17’ [-Werror=unused-variable]
   857 |         u8 vgacr17 = 0xff;
       |            ^~~~~~~
cc1: all warnings being treated as errors


because I always do my kernel builds with CONFIG_WERROR=y. So then I commented out the now superfluous declaration in 
line 857 and the build succeeded. However, unfortunately the issue still persists. The screen still gets blanked on 
reboot (as clarified before, after BIOS/POST messages, Grub boot menu, initial boot messages).

Beste Grüße,
Peter Schneider

-- 
Climb the mountain not to plant your flag, but to embrace the challenge,
enjoy the air and behold the view. Climb it so you can see the world,
not so the world can see you.                    -- David McCullough Jr.

OpenPGP:  0xA3828BD796CCE11A8CADE8866E3A92C92C3FF244
Download: https://www.peters-netzplatz.de/download/pschneider1968_pub.asc
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@googlemail.com
https://keys.mailvelope.com/pks/lookup?op=get&search=pschneider1968@gmail.com
