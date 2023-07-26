Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CED762F52
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 10:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4810E437;
	Wed, 26 Jul 2023 08:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1066F10E437
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690359006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ft1H5gA4I/hTx55vO1WDvnxdaLrADTH2N7MswVb0grs=;
 b=cSdHoUbSPxaHiWBnD7mOdHCmW52iUgKRpLc2xBbHe5hhHONEajvcbxcmOisLnExiQWjrpk
 XbVt+2OxuulYmjvo32RjEBO7q53BkW54Le7SI8wcssJL0HEpPWMP0dILhQ7j+VvbOZTZPb
 C+wMaVR1DSrfPl6YPBEAYobuiYRXePI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-NBbNaW15NKW4-PdQRUGz5A-1; Wed, 26 Jul 2023 04:10:04 -0400
X-MC-Unique: NBbNaW15NKW4-PdQRUGz5A-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3143ac4a562so3151006f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 01:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690359003; x=1690963803;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ft1H5gA4I/hTx55vO1WDvnxdaLrADTH2N7MswVb0grs=;
 b=DraFTODFISFuxMAgECa/fA5iFbemuXAV1+STcAz/hF6e9Y+RWAKwtHKxz68p1gsQsu
 sJChcJEf2RYBZxvPBvodiGZdzwhFq/Y8+kSmTwKSeRjv+WO1w8uUwzF0l62r1Hcu2r3A
 NU2BBK8aHbv9dXUN81eQW7sVduR73qSHd93niKdt/sQ5ANpR9yxyGY6VHYOmHSgocJ5V
 IH6M+8imq5GI6baUJwbD9cAwj/MV1yHgYIF6/VQw8E+9AvZvPAF6hQMImfjfC/ofvE56
 MLX0hElTDIhjqaKYy855RDhtoq/vmZOncvWfm+b1XXZuy0d0FsXRO5J5CwvN+j60xrIv
 iT8Q==
X-Gm-Message-State: ABy/qLb8QKJ2Ji/t+mUzZL49SvWUC8+7k9H/FK4Y7bzDlnQBONlTs4yv
 UAHQKAo3M0KFUNMAmLZ2mGIWmruSgQzh+GhhGs2KGPnJxC0q7PSAIADVNBUrrqBHf4ohsmy0WMV
 41oSy/JzMI9xDcJcm4BK5bJoI5s8HDMQ+vXD2
X-Received: by 2002:a05:6000:1819:b0:317:6cca:a68a with SMTP id
 m25-20020a056000181900b003176ccaa68amr808394wrh.41.1690359003259; 
 Wed, 26 Jul 2023 01:10:03 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGz331MyBKyTQkRSCWMqpFTjlW02ps2a8kZnvuklIi8MTv86jMCdPz8aA6Cn8hWK+Z6DlG5fQ==
X-Received: by 2002:a05:6000:1819:b0:317:6cca:a68a with SMTP id
 m25-20020a056000181900b003176ccaa68amr808379wrh.41.1690359002885; 
 Wed, 26 Jul 2023 01:10:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a5d4d8d000000b0031417fd473csm5721972wru.78.2023.07.26.01.10.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 01:10:02 -0700 (PDT)
Message-ID: <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
Date: Wed, 26 Jul 2023 10:10:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/07/2023 21:37, Thomas Zimmermann wrote:
> Hi Roger,
> 
> thanks for all the information.
> 
> Am 24.07.23 um 22:57 schrieb Roger Sewell:
>> Thomas,
>>
>> Hello, I'm the user who reported the issue. Definitely happy to help you
>> sort this out if I can, though my response speed will decrease when term
>> restarts in October.
>>
>>> I'd be interested in the exact model and the unique_rev_id
>>> (you said A, rev1 ?)
>>
>> The machine is an Intel SR1625URR server including an S5520UR
>> motherboard.
>>
>> Table 10 in the following document says that  1440x900@60Hz is supported:
>> https://www.intel.com/content/dam/support/us/en/documents/motherboards/server/s5520ur/sb/e44031012_s5520ur_s5520urt_tps_r1_9.pdf
> 
> That manual says that the resolution is only supported with at most 
> 24-bit colors. The old X code still supports that to some extend, but 
> modern userspace doesn't.
> 
> It's not a Wayland thing, but applications now use Mesa for drawing, 
> which doesn't like 24-bit color mode much. Userspace is slowly loosing 
> the ability to work with anything less the 32-bit colors.
> 
>>
>> lspci -v returns:
>>
>> 07:00.0 VGA compatible controller: Matrox Electronics Systems Ltd. MGA 
>> G200e [Pilot] ServerEngines (SEP1) (rev 02) (prog-if 00 [VGA controller])
>>     Subsystem: Intel Corporation Device 0101
>>     Physical Slot: 5
>>     Flags: bus master, fast devsel, latency 0, IRQ 16
>>     Memory at b0000000 (32-bit, prefetchable) [size=16M]
>>     Memory at b1800000 (32-bit, non-prefetchable) [size=16K]
>>     Memory at b1000000 (32-bit, non-prefetchable) [size=8M]
>>     Expansion ROM at 000c0000 [disabled] [size=128K]
>>     Capabilities: <access denied>
>>     Kernel driver in use: mgag200
>>     Kernel modules: mgag200
>>
>> so in particular the chip is said to be a G200e, not the G200SE-A that
>> the kernel module seems to be interpreting it as. In the lspci return it
> 
> It actually is the G200SE-A. It's just named differently by lspci. The 
> PCI device id should be 0x0522.
> 
>> calls itself "rev 02", but the unique_rev_id returned is 0x01, not 02,
>> and not 00. (My originally suggested solution was that "rev 02" might
>> correspond to unique_rev_id=0x01 and that one should add 1 to the
>> unique_rev_id, but Jocelyn indicated that isn't right.)
> 
> That rev 02 if the PCI revision number. Matrox also has another revision 
> ID named 'unique_rev_id' in the code. Who knows why...
> 
>>
>> I instrumented a version of the new code by adding printk statements to
>> a version of the module embodied in a kmod-mgag200 package and observing
>> messages in the /var/log/messages file. These tell me that:
>>
>>> and if the early-out branches in mga_vga_calculate_mode_bandwidth()
>>> are being taken.
>>
>> In the "old" code the options to return 0 are NOT being taken, and the
>> bandwidth returned is the expected value of 30318019.
>>
>> In the *new* code the options to return 0 are NOT being taken, and the
>> bandwidth returned is the expected value of 30318019.
>>
>>> Can you figure out how exactly the CPU moves through
>>> mga_vga_mode_valid().
>>
>> In the "old" code we enter the true part of the if (IS_G200_SE(mdev)),
>> then the true part of the if (unique_rev_id == 0x01), then return
>> MODE_BANDWIDTH (i.e. MODE_BAD) at the third if statement in that block.
> 
> So the old kernel already did the right thing.
> 
>>
>> In the *new* code the nearest-named function I could see 
>> issys/class/drm/card1-eDP-1/modes
>> mgag200_mode_config_mode_valid, which returns MODE_OK at the end of the
>> function if the bandwidth limit is increased to 30100, and returns
>> MODE_BAD three lines higher up if it is left at 24400.
> 
> Nothing has changed in the new kernel.

That's not completely true, as if I understand correctly, changing only 
the kernel with the same userspace, breaks the 1440x900 resolution. 
(Even if MODE_BAD is returned in both cases).

> 
>>
>> Moreover if when using the old code we switch to Wayland instead of
>> Xorg, it doesn't let me pick the 1440x900@60Hz mode at all, but it does
>> with Xorg (one of the reasons I hadn't used Wayland).
> 
> You can do
> 
>    cat /sys/class/drm/card1-VGA-1/modes
> 
> on the old and new kernel. With a monitor connector, it will tell you 
> the supported resolutions.
> 
>>
>> Therefore I think the reason that the old code allowed use of
>> 1440x900@60Hz was that Xorg somehow didn't properly check the return
>> value from mga_vga_mode_valid, but Wayland did. Moreover I think that
>> the latest version of the Xorg stuff does PARTIALLY check that return
>> value, to the extent that it won't let you actually use that mode, but
>> does nonetheless present it as a choice when you go to Settings->Display
>> - and then saves the values it didn't allow you to take in
>> ~/.config/monitors.xml, and on relogin refuses to give you any graphics
>> at all because it doesn't like those values. But that, of course, is
>> nothing to do with the mgag200 driver (if it is indeed true - I haven't
>> looked at the Xorg source code at all).
>>
>> The issue from the point of view of my usage case is that the chip works
>> just fine in the 1440x900@60Hz mode, even though 30318019 > 1024*24400.
> 
> I don't want to increase that limit in the driver, as it might have 
> consequences for a lot of other hardware. And if you assume that 
> 30318019 * 3 / 4 ~= 22738514 , 24-bit color mode fits into the current 
> limit.

There are no public hardware specifications, so it's pretty hard to know 
if the 24400 limit is legitimate or not. At least one hardware is able 
to overcome that.

I've already sent a patch to use internally 24bit colors, when userspace 
can use 32bit that would solve this issue as well. In the end, on the 
VGA link, 24 or 32 bit colors are the same. That would allow modern 
userspace to work on par with Xorg. So maybe we can reconsider it ?
https://patchwork.freedesktop.org/series/116381/
I would need to update the bandwidth test to accommodate for 24bit.

> 
> Jocelyn, should we attempt to make extra resolutions available for 16- 
> and 24-bit modes? We could do the bandwith test in the primary plane's 
> atomic_check, where we know the resolution and the color format. The 
> general mode test would use bpp=8.  IDK how userspace reacts to that, so 
> it would require some testing.

That will only work for old userspace (Xorg) able to do 16 or 24 bit 
modes. Also the driver don't do 8bit, so 16bit is the minimum, and can 
be used in the general mode test. I can still give it a try.

Best regards,

-- 

Jocelyn
> 
>>
>> If I haven't made anything sufficiently clear, or if you need more info,
>> please ask.
> 
> Your reply was very helpful. Thank you.
> 
> Best regards
> Thomas
> 
>>
>> Best wishes,
>> Roger.
> 

