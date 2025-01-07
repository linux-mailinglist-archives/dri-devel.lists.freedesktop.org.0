Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91171A03F66
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2310E31A;
	Tue,  7 Jan 2025 12:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DTLBk/tM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7C410E31A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y4ncJLUfLn2WMup4JspQXThBjJOSsytCJPyG4l+YQAc=; b=DTLBk/tMAi/9yKIUH3z6UGfzUW
 wVC0QZNXrfcNETGIWAXvEeF3pHpaw8fGVSEU6jA1NRtDmw4seS9UsU7GSgNiH639pVYNxrcK1vYNS
 7LHSoBvqWiGRmzXsF/8eM+hn7ewNfgYEoaBFnsVCvPlO4tKLkFdzI6xtYENHxqZqaU7wTlIoG2cMp
 Ng2NExmo9TXERYJDblW8sT35EhTYpkOMD4AUok7Gp3HcvNl7XJDn+VqFiIDUSgpPZ8EDaIHKbS/O6
 iPCozrfDbutVKK6FgEktYqebl8xVhT7ZM+gzThJJrCcXGqanCdZyqkR/ybp2HLRu4LyPYR6PG0vS2
 0qZEPRHA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tV8q4-00CjNl-Iw; Tue, 07 Jan 2025 13:37:40 +0100
Message-ID: <5103f308-c6dc-47d3-9e4a-1a5abb619d58@igalia.com>
Date: Tue, 7 Jan 2025 12:37:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/syncobj: Do not allocate an array to store zeros
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250102194418.70383-1-tursulin@igalia.com>
 <20250102194418.70383-4-tursulin@igalia.com>
 <1eaea60f-fda1-423c-a109-18481958d00d@mailbox.org>
 <e3341eea-ef5f-4796-b859-2881b7d93f31@igalia.com>
 <74add524-2254-4259-9418-668310ad75cf@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <74add524-2254-4259-9418-668310ad75cf@mailbox.org>
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


On 07/01/2025 11:22, Michel Dänzer wrote:
> On 2025-01-07 10:29, Tvrtko Ursulin wrote:
>>
>> On 06/01/2025 17:16, Michel Dänzer wrote:
>>> On 2025-01-02 20:44, Tvrtko Ursulin wrote:
>>>>
>>>> "vkgears -present-mailbox" average framerate:
>>>>
>>>>     Before: 21410.1089
>>>>     After:  21609.7225
>>>>
>>>> With a disclaimer that measuring with vkgears feels a bit variable,
>>>> nevertheless it did not look like noise.
>>>
>>> That's ~1% difference. IME the frame rate can easily vary more than that during a single run.
>>>
>>> The frame rate surely varies by more than 1 fps during each run, so comparing such large average values down to 4 digits after the decimal point doesn't seem very useful.
>>>
>>> Doing multiple (at least 3 or more each) before & after runs and comparing the distribution of individual measured values using something like ministat might confirm it's essentially noise, or give more confidence it's not.
>>
>> I did multiple runs and I thought from the code changes it would be obvious there is some code there which should go.
> 
> FWIW, I didn't question that, in fact I don't have any particular opinion on the actual code changes. Claims of performance differences based on two numbers are just a pet peeve of mine. :)
> 
> 
>> But fair enough, I agree ministat is common practice so I re-did it. Five ~100 second runs each kernel. Absolute numbers are a bit different before I turned on some kernel hardening options since.
>>
>> x before
>> + after
>> +------------------------------------------------------------+
>> |                          x         +                       |
>> |                   x      x         +                       |
>> |                   x      xx      ++++                      |
>> |                 x x      xx x    ++++                      |
>> |                 x xx   x xx x+   ++++                      |
>> |                xxxxx   xxxxxx+   ++++ + +                  |
>> |                xxxxxxx xxxxxx+x  ++++ +++                  |
>> |              x xxxxxxxxxxx*xx+* x++++++++   ++             |
>> |        x x   xxxxxxxxxxxx**x*+*+*++++++++ ++++ +           |
>> |       xx x   xxxxxxxxxx*x****+***+**+++++ ++++++           |
>> |x     xxx x   xxxxx*x****x***********+*++**+++++++   +  +  +|
>> |               |_______A______|                             |
>> |                             |______A_______|               |
>> +------------------------------------------------------------+
>>      N           Min           Max        Median           Avg        Stddev
>> x 135      21697.58     22809.467     22321.396     22307.707     198.75011
>> + 118     22200.746      23277.09       22661.4     22671.442     192.10609
>> Difference at 95.0% confidence
>>      363.735 +/- 48.3345
>>      1.63054% +/- 0.216672%
>>      (Student's t, pooled s = 195.681)
>>
>> It's a small difference but every little helps.
> 
> This gives a lot of confidence in the performance gain, thanks! Would be great if you could incorporate at least a summary of this into a commit log somehow.

Thanks! Now lets hope someone can spare the time to review.

I pasted the graph into a reply to cover letter of v2 of the series. 
That's my best idea since it is a series with a few small improvements 
which add up to a total.

Regards,

Tvrtko
