Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88648C9CC6F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 20:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FED710E161;
	Tue,  2 Dec 2025 19:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="W+6+eAw8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C6C10E161
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764704170; x=1765308970; i=deller@gmx.de;
 bh=DgBDeQuLL3+fD9ZSvI84nWSi7VpC5GiUgDp9TEw/0W4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=W+6+eAw8emCV0xonVQL3U2k4XXmanHU91Mt2sFv66a3yCVabBgUacVqeVvIhxV+7
 rD7wS7rU4Cr9sr9j7IcewgZotBsm9nsLrlWeqgoimR7ei2l6ytfPJbymkWCGVJkgJ
 UUhuoMjYiewXwN62HmvoQf5rY/o4xoy7exdGCcGFlLzy0PKnh0E9YjFputITcpzLE
 PsMGBxQA+uweUtpnyi28nJiXdBgUB/qSJYgz+9+YSxIS9sAfpqN3E33wdwvQs8Seg
 5HOiRuVOZC4YGR+HGcn8geLHgEzy9Wdk492CrXMDhvJlYubWYE6XP9R6Dh94Jp/b4
 NqbRmzLD+I4KY4lWeg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.47]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhlKs-1w4Edm0U8e-00pvqx; Tue, 02
 Dec 2025 20:36:10 +0100
Message-ID: <77ac64e5-709d-4eb5-8b47-9fc15e579d1a@gmx.de>
Date: Tue, 2 Dec 2025 20:36:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/pxafb: Fix multiple clamped values in
 pxafb_adjust_timing
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251202181600.511166-2-thorsten.blum@linux.dev>
 <a7213b69-f6ae-4975-8c8b-2783dbe9f9b3@gmx.de>
 <C3FDBCE7-14D9-4999-B463-C2E3E384E7DB@linux.dev>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <C3FDBCE7-14D9-4999-B463-C2E3E384E7DB@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yicRZxTD8Gkojxm1keKz2HrnodkjCv0OiWY7CV0BqKhfVCAXXEr
 2jZDGex94X90K+Qgii5sn3WfYUQVDD6gSzCMN5eK20Xc68CX1ktTkmwA5B+ZANZNX43utCf
 GpFPb3wpgQaWvE7s4WoT9q4eCMNZtrR0Oa7ffMgV0kHmuEJtsZYK14w87afdq1CGyJv5jVm
 5RBIlLVAQDjamaOXQELIg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F/DwIrfBzk0=;rH3nivq83gZGCex5QLquWlif/8Y
 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
 +t+Z/gx6e8dsQY4fw=
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

On 12/2/25 19:36, Thorsten Blum wrote:
> On 2. Dec 2025, at 19:28, Helge Deller wrote:
>> On 12/2/25 19:15, Thorsten Blum wrote:
>>> The variables were never clamped because the return value of clamp_val=
()
>>> was not used. Fix this by assigning the clamped values, and use clamp(=
)
>>> instead of clamp_val().
>>> Cc: stable@vger.kernel.org
>>> Fixes: 3f16ff608a75 ("[ARM] pxafb: cleanup of the timing checking code=
")
>>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>>> ---
>>>   drivers/video/fbdev/pxafb.c | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> Thanks for the patch!
>> It looks good, so I'll include it in the fbdev tree.
>> Out of curiosity:
>> How did you notice? Do you actually have the hardware and tested it?
>=20
> I only compile-tested it.
>=20
> I stumbled upon another driver with the same bug and then used grep to
> search for other instances and found about 6 or 7, including this one.

Ok. But this then means, maybe the clamping isn't needed (since nobody com=
plained),
or that nobody noticed because nobody uses the driver any longer.
Anyway, I believe the patch is correct, so I leave it in.

Thank you!
Helge
