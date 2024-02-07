Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618F584CE1A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 16:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1206810E7A4;
	Wed,  7 Feb 2024 15:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ezvTKNdK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E9910E7A4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 15:34:08 +0000 (UTC)
Message-ID: <3e7de0d3-226b-4036-a353-7c0edc0941af@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1707320046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F7QnNAiA4ba0BbyxZVm5Gu2UvxvN0HYH7Wen4NoGjq0=;
 b=ezvTKNdKpmxLtBjSo8tl+zn1oPRbuWua26J+OT1jfwZqSQz96gRtTAvHxVS3uugk8uYrGF
 t0F68Pf4p6vlOGzdQd+XyBvRxL966J0KM8FqTmLT546VezzCyJeu+fscYarvpLmvy+Iv4l
 rfKHwEod12TC+j5Gifl+9bZHElZoPHo=
Date: Wed, 7 Feb 2024 23:34:00 +0800
MIME-Version: 1.0
Subject: Re: [v2,3/8] firmware/sysfb: Set firmware-framebuffer parent device
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-4-tzimmermann@suse.de>
 <eb221db3-76b0-4c69-8736-df5576392717@linux.dev>
 <d429ddb0-4132-4476-b751-b59accaf0e8d@suse.de>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <d429ddb0-4132-4476-b751-b59accaf0e8d@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/2/5 16:24, Thomas Zimmermann wrote:
> Hi
>
> Am 02.02.24 um 16:23 schrieb Sui Jingfeng:
>> Hi,
>>
>>
>> On 2024/2/2 19:58, Thomas Zimmermann wrote:
>>> Set the firmware framebuffer's parent device, which usually is the
>>> graphics hardware's physical device. Integrates the framebuffer in
>>> the Linux device hierarchy and lets Linux handle dependencies among
>>> devices. For example, the graphics hardware won't be suspended while
>>> the firmware device is still active.
>>
>> This is a very nice benefit, I can't agree more!
>>
>> Because the backing memory of the firmware framebuffer occupied
>> belongs to the graphics hardware itself. For PCIe device, the
>> backing memory is typically the dedicated VRAM of the PCIe GPU.
>> But there are some exceptions, for example, the gma500. But I
>> think this can be fixed in the future, as majority(>99.9%) PCIe
>> GPU has the a dedicated VRAM.
>>
>>
>> For ARM and ARM64 platform device, the backing memory of the
>> firmware framebuffer may located at the system RAM. It's common
>> that the display controller is a platform device in the embedded
>> world. So I think the sysfb_parent_dev() function can be extended
>> to be able to works for platform device in the future.
>
> The current approach has been taken from efifb. It would already not 
> work reliably with gma500 or ARM SoCs. So there's no immediate loss of 
> functionality AFAICT. But with the patchset now have a correct device 
> hierarchy and PM for simpledrm, vesafb et al.
>
> In the long term, I want to employ some of the logic in vgaarb that 
> detects the firmware default device. That needs additional work, though.
>

Good ideas, try to be impressive.
I probably could help to test if I'm online.


> Best regards
> Thomas
>
>>
>
