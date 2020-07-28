Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2722312AE
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF836E3A4;
	Tue, 28 Jul 2020 19:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73B56E0F2;
 Tue, 28 Jul 2020 09:22:14 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4ADE82002EE3C;
 Tue, 28 Jul 2020 11:22:12 +0200 (CEST)
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
To: Mazin Rezk <mnrzk@protonmail.com>, Duncan <1i5t5.duncan@cox.net>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
 <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
 <202007241016.922B094AAA@keescook>
 <3c92db94-3b62-a70b-8ace-f5e34e8f268f@molgen.mpg.de>
 <_vGVoFJcOuoIAvGYtkyemUvqEFeZ-AdO4Jk8wsyVv3MwO-6NEVtULxnZzuBJNeHNkCsQ5Kxn5TPQ_VJ6qyj9wXXXX8v-hc3HptnCAu0UYsk=@protonmail.com>
 <20200724215914.6297cc7e@ws>
 <c7mHa5xU_kh7K9KM5P1UJoCY00b3Oxj3s_y3vr0LGQzUPtWlhv5JjjhT4CnnbDhuTZhCuHT2uMbjdDCZ-JLmHVlS7B_k-wj1OTmZpMD7cg4=@protonmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <0b0fbe35-75cf-ec90-7c3d-bdcedbe217b7@molgen.mpg.de>
Date: Tue, 28 Jul 2020 11:22:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c7mHa5xU_kh7K9KM5P1UJoCY00b3Oxj3s_y3vr0LGQzUPtWlhv5JjjhT4CnnbDhuTZhCuHT2uMbjdDCZ-JLmHVlS7B_k-wj1OTmZpMD7cg4=@protonmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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
Cc: anthony.ruhier@gmail.com, Kees Cook <keescook@chromium.org>,
 sunpeng.li@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, regressions@leemhuis.info,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, mphantomx@yahoo.com.br,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Linux folks,


Am 25.07.20 um 07:20 schrieb Mazin Rezk:
> On Saturday, July 25, 2020 12:59 AM, Duncan wrote:
> 
>> On Sat, 25 Jul 2020 03:03:52 +0000 Mazin Rezk wrote:
>>
>>>> Am 24.07.20 um 19:33 schrieb Kees Cook:
>>>>
>>>>> There was a fix to disable the async path for this driver that
>>>>> worked around the bug too, yes? That seems like a safer and more
>>>>> focused change that doesn't revert the SLUB defense for all
>>>>> users, and would actually provide a complete, I think, workaround
>>>
>>> That said, I haven't seen the async disabling patch. If you could
>>> link to it, I'd be glad to test it out and perhaps we can use that
>>> instead.
>>
>> I'm confused. Not to put words in Kees' mouth; /I/ am confused (which
>> admittedly could well be just because I make no claims to be a
>> coder and am simply reading the bug and thread, but I'd appreciate some
>> "unconfusing" anyway).
>>
>> My interpretation of the "async disabling" reference was that it was to
>> comment #30 on the bug:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=207383#c30
>>
>> ... which (if I'm not confused on this point too) appears to be yours.
>> There it was stated...
>>
>> I've also found that this bug exclusively occurs when commit_work is on
>> the workqueue. After forcing drm_atomic_helper_commit to run all of the
>> commits without adding to the workqueue and running the OS, the issue
>> seems to have disappeared.
>> <<<<
>>
>> Would not forcing all commits to run directly, without placing them on
>> the workqueue, be "async disabling"? That's what I /thought/ he was
>> referencing.
> 
> Oh, I thought he was referring to a different patch. Kees, could I get
> your confirmation on this?
> 
> The change I made actually affected all of the DRM code, although this could
> easily be changed to be specific to amdgpu. (By forcing blocking on
> amdgpu_dm's non-blocking commit code)
> 
> That said, I'd still need to test further because I only did test it for a
> couple of hours then. Although it should work in theory.
> 
>> OTOH your base/context swap idea sounds like a possibly "less
>> disturbance" workaround, if it works, and given the point in the
>> commit cycle... (But if it's out Sunday it's likely too late to test
>> and get it in now anyway; if it's another week, tho...)
> 
> The base/context swap idea should make the use-after-free behave how it
> did in 5.6. Since the bug doesn't cause an issue in 5.6, it's less of a
> "less disturbance" workaround and more of a "no disturbance" workaround.

Sorry for bothering, but is there now a solution, besides reverting the 
commits, to avoid freezes/crashes *without* performance regressions?


Kind regards,

Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
