Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD58CC9EBA0
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 11:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2605810E768;
	Wed,  3 Dec 2025 10:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IYnkZBxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD2510E768
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PpUfdJHwdojNrfkXdTCuNur4bUbvxmOOvLtJ5J61PEQ=; b=IYnkZBxibqVbt89a0LmY6ikYLW
 iDSzwUx6vpM+1PV0Mr7OnQlgwTa80zvbGBZuO+ba/J6kY8sDfNnWPSBc4yybrtLd4nygF0wFSSlqM
 0GfP5dX/D8kcRTFy+qpSa2Qgk3LhG3cr/a7IuP9J0k+YuOFOPE6hFCG1aOXAsTD1M8TxpBpMY8mNC
 UwtxC6jF0ooVUkxPCEsWXl94cKeEj91gq0bxa7UyowMCQIKb5HHpfxn1bbbGFcoXedvt+5AeQWhe6
 SKplobogoN3NIa0xGs3X1vtQ/yhyUvBBBxgSN6nqSaeUIt9v09qY5UaQyBF7jwcGbzFqsQirF2QW/
 qbtuO/PQ==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vQkBu-008E8N-Bg; Wed, 03 Dec 2025 11:34:34 +0100
Message-ID: <caaf2e08-0770-4808-8872-e432e2ff5ec4@igalia.com>
Date: Wed, 3 Dec 2025 10:34:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] efi: sysfb_efi: Fix efidrmfb and simpledrmfb on
 Valve Steam Deck
To: Thomas Zimmermann <tzimmermann@suse.de>, Ard Biesheuvel <ardb@kernel.org>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Melissa Wen <mwen@igalia.com>, linux-efi@vger.kernel.org
References: <20251203090706.53778-1-tvrtko.ursulin@igalia.com>
 <20251203090706.53778-5-tvrtko.ursulin@igalia.com>
 <5ecc23ed-929f-4e60-a7a1-d4bd759e9af2@suse.de>
 <CAMj1kXEVq65rBQraKn8kcCiA6wU7tPfCCbf2Bma4F3p0As3ToQ@mail.gmail.com>
 <e5acaa09-a92f-48d1-b2af-64a120242de9@suse.de>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <e5acaa09-a92f-48d1-b2af-64a120242de9@suse.de>
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


On 03/12/2025 10:29, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.12.25 um 11:13 schrieb Ard Biesheuvel:
>> On Wed, 3 Dec 2025 at 11:05, Thomas Zimmermann <tzimmermann@suse.de> 
>> wrote:
>>> Hi
>>>
>>> Am 03.12.25 um 10:07 schrieb Tvrtko Ursulin:
>>>> Valve Steam Deck has a 800x1280 portrait screen installed in a 
>>>> landscape
>>>> orientation. The firmware offers a software rotated 1280x800 mode which
>>>> GRUB can be made to switch to when displaying a boot menu. If this mode
>>>> was selected frame buffer drivers will see this fake mode and fbcon
>>>> rendering will be corrupted.
>>>>
>>>> Lets therefore add a selective quirk inside the current "swap with and
>>>> height" handling, which will detect this exact mode and fix it up 
>>>> back to
>>>> the native one.
>>>>
>>>> This will allow the DRM based frame buffer drivers to detect the 
>>>> correct
>>>> mode and, apply the existing panel orientation quirk, and render the
>>>> console in landscape mode with no corruption.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: Ard Biesheuvel <ardb@kernel.org>
>>>> Cc: Melissa Wen <mwen@igalia.com>
>>>> Cc: linux-efi@vger.kernel.org
>>>> ---
>>>>    drivers/firmware/efi/sysfb_efi.c | 56 +++++++++++++++++++++++++++ 
>>>> ++---
>>>>    1 file changed, 51 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/ 
>>>> efi/sysfb_efi.c
>>>> index eacf9a50eab2..566492e67798 100644
>>>> --- a/drivers/firmware/efi/sysfb_efi.c
>>>> +++ b/drivers/firmware/efi/sysfb_efi.c
>>>> @@ -231,16 +231,42 @@ static const struct dmi_system_id 
>>>> efifb_dmi_system_table[] __initconst = {
>>>>        {},
>>>>    };
>>>>
>>>> +struct efifb_mode_fixup {
>>>> +     unsigned int width;
>>>> +     unsigned int height;
>>>> +     unsigned int linelength;
>>>> +};
>>>> +
>>>>    static int __init efifb_swap_width_height(const struct 
>>>> dmi_system_id *id)
>>> It's something different now. Can this please become a separate list
>>> with a separate callback?
>>>
>> Why? That means we have to introduce another dmi_check_system() call,
>> and manually implement the logic to ensure that it is not called
>> redundantly, i.e., after the first one already found a match.
> 
> If the separate list isn't feasible, let's at least have a separate 
> callback.

Ard asked for that already so in v3 it is already separate.

I have also locally changed 2/4 to use 
__screen_info_lfb_bits_per_pixel() and if now everyone is happy I can 
send out a v4 with that?

Regards,

Tvrtko

