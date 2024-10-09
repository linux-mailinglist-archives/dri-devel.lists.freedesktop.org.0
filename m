Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D79965FD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 11:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1210E6B7;
	Wed,  9 Oct 2024 09:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="GGI1ajZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3F910E6B7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 09:53:10 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 75C8D2FC006B;
 Wed,  9 Oct 2024 11:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1728467588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvIbC9Tll3rSI2pUSYplq++x3vSDNfJrCYLsdY90IZ0=;
 b=GGI1ajZwz7LftSx5f9+yOgSDoS8dCryXQ+iUi2L4L6gFSyn+3hLBUHp+ElELQR0PGpFmv5
 N9Q/DtG1ILAIxMSUEXq1XmeJukVxI+bhdLD2mCifbghrarK6ch83YfPH1PikKjxKFtXqG6
 dU6rSluNPrkqP4LoavMPDT0YlMuUKek=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <7a966790-ae72-4132-bed2-b460a93dce04@tuxedocomputers.com>
Date: Wed, 9 Oct 2024 11:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
To: Lee Jones <lee@kernel.org>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, hdegoede@redhat.com, 
 jelle@vdwaa.nl, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, cs@tuxedo.de
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
 <20241003075927.GI7504@google.com>
 <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
 <20241007125813.GA17897@google.com>
 <86936252-f3b6-46c2-9244-ce0cfebf3c42@tuxedocomputers.com>
 <20241008153300.GA11264@google.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20241008153300.GA11264@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

Am 08.10.24 um 17:33 schrieb Lee Jones:
> On Mon, 07 Oct 2024, Werner Sembach wrote:
>
>> Am 07.10.24 um 14:58 schrieb Lee Jones:
>>> On Fri, 04 Oct 2024, Werner Sembach wrote:
>>>
>>>> Am 03.10.24 um 09:59 schrieb Lee Jones:
>>>>> On Wed, 02 Oct 2024, Werner Sembach wrote:
>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Am 02.10.24 um 14:52 schrieb Lee Jones:
>>>>>>> On Fri, 27 Sep 2024, Werner Sembach wrote:
>>>>>>>
>>>>>>>> Hi,
>>>>>>>> first revision integrating Armins feedback.
>>>>>>>>
>>>>>>>> Stuff I did not yet change and did not comment on previously:
>>>>>>>> - Still have to ask Christoffer why the mutex is required
>>>>>>>> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
>>>>>>>> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
>>>>>>>>
>>>>>>>> Let me know if my reasoning is flawed
>>>>>>> Use `git format-patch`'s --annotate and --compose next time please.
>>>>>>>
>>>>>> I did but --compose does not automatically insert the subject line, that's
>>>>>> why i copied it but forgot to change it to 0/1
>>>>>>
>>>>>> Sorry for the flawed subject line
>>>>> And the missing diff-stat?
>>>>>
>>>> Also not automatically created by git send-email --compose. is there a flag
>>>> I'm not aware of?
>>> As above.  I use "--annotate --compose".  See if that works.
>>>
>> nope, the cover letter has no change summary with these options
> Oh, my mistake.  I'm getting confused with `git send-email`.
>
> You want this:
>
>    `mkdir patches && git format-patch --cover-letter -M -o patches`
>
ah ok thanks, will note it down for the next patch.

Regards,

Werner

