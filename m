Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A19A03D7B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 12:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A4D10E0EE;
	Tue,  7 Jan 2025 11:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="DxVuWNkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A7410E0EE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 11:23:19 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YS7v95txYz9scD;
 Tue,  7 Jan 2025 12:22:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736248965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44aNB5j+TX12Z1oDDQ7C0lwmkQkPN65yo4pclEdU2EQ=;
 b=DxVuWNkW57UO33OJIAcnvagFDpz76wxW/3M/Hny6nK5+Lq5BqffzRyI9Hpo87XtBiZ5eN5
 8aub3bdiAigy3CZI42z3mNEvUKwEhSgTouuoK3n4Qvqs+OmLxJ8KeOcklz4btfxNajABN7
 HpaBbdnrnh3xdk6Lcem7pfwh7EA52UAYefaZrah0tnECaZldrbGIrXIf/9aAMzi7AvRJPo
 W/eOe6yNgwfHno4IvHjPO8KLLmF1PVO2oD/yOw39iR0M+K3a7Gs4TZs7VYSNHPOxC+0WhI
 M7vQCBTaEyhTdHDeFop9G89ksTSTZvWtMlGXwpGDRK+3EcJsNeRagnhIxdVZFg==
Message-ID: <74add524-2254-4259-9418-668310ad75cf@mailbox.org>
Date: Tue, 7 Jan 2025 12:22:44 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 3/6] drm/syncobj: Do not allocate an array to store zeros
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250102194418.70383-1-tursulin@igalia.com>
 <20250102194418.70383-4-tursulin@igalia.com>
 <1eaea60f-fda1-423c-a109-18481958d00d@mailbox.org>
 <e3341eea-ef5f-4796-b859-2881b7d93f31@igalia.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <e3341eea-ef5f-4796-b859-2881b7d93f31@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4bbcaf3b2a03376c35d
X-MBO-RS-META: b5zpgh5nazoh5gweqqjy4ipp8rzdqp7b
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

On 2025-01-07 10:29, Tvrtko Ursulin wrote:
> 
> On 06/01/2025 17:16, Michel Dänzer wrote:
>> On 2025-01-02 20:44, Tvrtko Ursulin wrote:
>>>
>>> "vkgears -present-mailbox" average framerate:
>>>
>>>    Before: 21410.1089
>>>    After:  21609.7225
>>>
>>> With a disclaimer that measuring with vkgears feels a bit variable,
>>> nevertheless it did not look like noise.
>>
>> That's ~1% difference. IME the frame rate can easily vary more than that during a single run.
>>
>> The frame rate surely varies by more than 1 fps during each run, so comparing such large average values down to 4 digits after the decimal point doesn't seem very useful.
>>
>> Doing multiple (at least 3 or more each) before & after runs and comparing the distribution of individual measured values using something like ministat might confirm it's essentially noise, or give more confidence it's not.
> 
> I did multiple runs and I thought from the code changes it would be obvious there is some code there which should go.

FWIW, I didn't question that, in fact I don't have any particular opinion on the actual code changes. Claims of performance differences based on two numbers are just a pet peeve of mine. :)


> But fair enough, I agree ministat is common practice so I re-did it. Five ~100 second runs each kernel. Absolute numbers are a bit different before I turned on some kernel hardening options since.
> 
> x before
> + after
> +------------------------------------------------------------+
> |                          x         +                       |
> |                   x      x         +                       |
> |                   x      xx      ++++                      |
> |                 x x      xx x    ++++                      |
> |                 x xx   x xx x+   ++++                      |
> |                xxxxx   xxxxxx+   ++++ + +                  |
> |                xxxxxxx xxxxxx+x  ++++ +++                  |
> |              x xxxxxxxxxxx*xx+* x++++++++   ++             |
> |        x x   xxxxxxxxxxxx**x*+*+*++++++++ ++++ +           |
> |       xx x   xxxxxxxxxx*x****+***+**+++++ ++++++           |
> |x     xxx x   xxxxx*x****x***********+*++**+++++++   +  +  +|
> |               |_______A______|                             |
> |                             |______A_______|               |
> +------------------------------------------------------------+
>     N           Min           Max        Median           Avg        Stddev
> x 135      21697.58     22809.467     22321.396     22307.707     198.75011
> + 118     22200.746      23277.09       22661.4     22671.442     192.10609
> Difference at 95.0% confidence
>     363.735 +/- 48.3345
>     1.63054% +/- 0.216672%
>     (Student's t, pooled s = 195.681)
> 
> It's a small difference but every little helps.

This gives a lot of confidence in the performance gain, thanks! Would be great if you could incorporate at least a summary of this into a commit log somehow.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
