Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD68065F8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 05:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C736710E664;
	Wed,  6 Dec 2023 04:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC0C10E661
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 04:08:41 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SlP5y3W6mz9sbC;
 Wed,  6 Dec 2023 05:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=owenh.net; s=MBO0001; 
 t=1701835718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tHKdQ0J5iT5fwEMnNKTPB4w/ZnjVg983tzlHAk/F6g=;
 b=wT3khbfO9H/TaacQ5aL+cvBIYjl+eR+b35Ai0l7Vrntg74jMOx4LGb/IWaJFQPT2kLEHA4
 ToVaqsC32nBEj57aDgY04oGHzvuqkH3aKMg0NvLqXD1XjpECgvyNOp92dlRZZcK4oACUJp
 oUJwV5Pg3NsxILQaynj+Hl/UqvIEWlQttRsI7FcaNcvzw5wTLEORM/kaUZurdzIzIn11bE
 VMEyPKH/UFA7UMXdsiA7VXuepG3VU8a0ZFYS20WZikNjCWpPWS2J2cVDdENMUYtEaYKgB5
 tARo3aSKnOCfr4pWGwVHnyEBmrb1KSGxZdECdCAZvHZkS3TMHI43eWvuxTefsA==
Message-ID: <652eec09-1942-4d29-bf90-2911d4223894@owenh.net>
Date: Tue, 5 Dec 2023 22:08:28 -0600
MIME-Version: 1.0
Subject: Re: [REGRESSION]: nouveau: Asynchronous wait on fence
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <6f027566-c841-4415-bc85-ce11a5832b14@owenh.net>
 <5ecf0eac-a089-4da9-b76e-b45272c98393@leemhuis.info>
 <6b7a71b4-c8a2-46f4-a995-0c63e7745ca3@owenh.net>
 <c72ca99e-8657-4ed8-9999-5702ebeb5b8c@leemhuis.info>
 <9bce5d00-8db6-4c8b-9817-06502492b44a@owenh.net>
 <c1dd675d-cb3e-4c4c-8dc4-dd561ef4950b@owenh.net>
 <66bf26bf-250e-43dd-ae70-e88bb709e272@leemhuis.info>
Content-Language: en-US
From: "Owen T. Heisler" <writer@owenh.net>
In-Reply-To: <66bf26bf-250e-43dd-ae70-e88bb709e272@leemhuis.info>
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
Cc: Sasha Levin <sashal@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thorsten and others,

On 12/5/23 06:33, Thorsten Leemhuis wrote:
> On 29.11.23 01:37, Owen T. Heisler wrote:
>> On 11/21/23 14:23, Owen T. Heisler wrote:
>>> On 11/21/23 09:16, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 15.11.23 07:19, Owen T. Heisler wrote:
>>>>> On 10/31/23 04:18, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>>> On 28.10.23 04:46, Owen T. Heisler wrote:
>>>>>>> #regzbot introduced: d386a4b54607cf6f76e23815c2c9a3abc1d66882
>>>>>>> #regzbot link:
>>>>>>> https://gitlab.freedesktop.org/drm/nouveau/-/issues/180
>>>>>>>
>>>>>>> 3. Suddenly the secondary Nvidia-connected display turns off and X
>>>>>>> stops responding to keyboard/mouse input.
>>
>>> I am currently testing v6.6 with the culprit commit reverted.
>>
>> - v6.6: fails
>> - v6.6 with the culprit commit reverted: works
>>
>> See <https://gitlab.freedesktop.org/drm/nouveau/-/issues/180> for full
>> details including a decoded kernel log.
> 
> Not sure about the others, but it's kind of confusing that you update
> the issue descriptions all the time and never add a comment to that ticket.

Thank you for the feedback; I will use comments more for future updates 
there. I didn't know anyone was following that issue (I haven't received 
any reply from nouveau developers on the nouveau list [1] or on gitlab 
[2]) so I have tried to keep that issue description succinct and 
up-to-date for anyone reading it for the first time.

[1]: 
<https://lists.freedesktop.org/archives/nouveau/2022-September/041001.html>
[2]: But Karol Herbst did add the "regression" label.

> Anyway: Nouveau maintainers, could any of you at least comment on this?
> Sure, it's the regression is caused by an old commit (6eaa1f3c59a707 was
> merged for v5.14-rc7) and reverting it likely is not a option, but it
> nevertheless it would be great if this could be solved somehow.

Also if anyone has any ideas about any stress-tests or anything else 
that I might be able to trigger the crash with, please share.

Thanks,
Owen

--
Owen T. Heisler
<https://owenh.net>
