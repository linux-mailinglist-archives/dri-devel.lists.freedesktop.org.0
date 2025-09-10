Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F85B514B1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 13:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732E589289;
	Wed, 10 Sep 2025 11:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C5kWhs7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D16389289
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 11:01:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B83E4419D;
 Wed, 10 Sep 2025 11:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DD8C4CEF0;
 Wed, 10 Sep 2025 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757502101;
 bh=qRp4pA5nON73sZoZuwHZjsYpT6fTz3KV68ATUmBpd0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C5kWhs7uRbjrhU3OblOuu5C+TfXSxcOCdkT2WiL7/QOf10JWmfTDYDvKqDID/E1yy
 ObPvEzotdtt+kzCI07FWfjVc5bENBjAEYF47BTwcwUPdOLS51ONtOUPERTIQF5cJ4i
 UOrJcm13TF+HKb1Cag/puKy+j3v1y5kkMIhdcmtAs4K/oo/vxkFp1ZCbMD9PGxrET3
 AJCQ91v492I5Z7Rtf+AScc9wSZgq3j0j2JzxY/UDZ1ZIUFdYG3eizBf/onQXnF/iuU
 lZveG9hX3odkpQV8Ky5yihZAhVkmeUjDAZF+nA1swi+rITQEHFFrGh2X6YmoiUUUR+
 77W9FN90hx9Ew==
Date: Wed, 10 Sep 2025 07:01:39 -0400
From: Sasha Levin <sashal@kernel.org>
To: Brett A C Sheffield <bacs@librecast.net>
Cc: Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
 Murad Masimov <m.masimov@mt-integration.ru>,
 Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] Revert "fbdev: Disable sysfb device registration
 when removing conflicting FBs"
Message-ID: <aMFak8Oj-UoCrgBH@laps>
References: <20250910095124.6213-3-bacs@librecast.net>
 <20250910095124.6213-5-bacs@librecast.net>
 <87frcuegb7.fsf@minerva.mail-host-address-is-not-set>
 <aMFYeV4UdD7NnrSC@karahi.gladserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aMFYeV4UdD7NnrSC@karahi.gladserv.com>
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

On Wed, Sep 10, 2025 at 12:52:41PM +0200, Brett A C Sheffield wrote:
>On 2025-09-10 12:46, Javier Martinez Canillas wrote:
>> Brett A C Sheffield <bacs@librecast.net> writes:
>>
>> Hello Brett,
>>
>> > This reverts commit 13d28e0c79cbf69fc6f145767af66905586c1249.
>> >
>> > Commit ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
>> > removing conflicting FBs") was backported to 5.15.y LTS. This causes a
>> > regression where all virtual consoles stop responding during boot at:
>> >
>> > "Populating /dev with existing devices through uevents ..."
>> >
>> > Reverting the commit fixes the regression.
>> >
>> > Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
>> > ---
>>
>> In the other email you said:
>>
>> > Newer stable kernels with this
>> > patch (6.1.y, 6.6.y, 6.12,y, 6.15.y, 6.16.y) and mainline are unaffected.
>>
>> But are you proposing to revert the mentioned commit in mainline too
>> or just in the 5.15.y LTS tree ?
>
>Only the 5.15.y tree. Sorry - that could have been clearer.  There's no
>regression anywhere else. Mainline and other stable kernels are all ok.

Thanks for investigating this! I'll queue it up for 5.15.

-- 
Thanks,
Sasha
