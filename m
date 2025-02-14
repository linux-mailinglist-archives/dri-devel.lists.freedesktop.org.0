Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FAA36598
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 19:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7715B10E360;
	Fri, 14 Feb 2025 18:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="ZNaaWneq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2C310E4AD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1739557078; x=1740161878; i=deller@gmx.de;
 bh=YQ0pNsXGxoBBiD3cpRwz1HATWWEmWXXdcqf0ksPmgOQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZNaaWneqYmLp984FJVGcnvplaOshMRV1I/RsjPyl+WFsl161H172XRGIj5VsWCbh
 QuSI2LPY5deTiEmxVeVXjqMXLxFda87yfMhTspu9CYkVxkG1jR5wRHPfF+bOF3PYi
 8QvFP4A9U21lavr4hJeRBz3dix/j0ewbX9JjXjkzDwft/vPjHo9o8Omp8/9cwHefV
 KXGCqPVQdtGHYpTMA0WwSMOkBU5f9Ir0A0DQHX/zgwtMrieqZxaaDK62JQNosygX8
 E/vqx43vuUFNeOmEe3TVeNqjJSjhSGHxQi/j59gK6xT2THgnvYk2X7xXkbjtxcYF7
 OEvBNKV5bIXyF7wXXQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([134.255.192.195]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6llE-1tjZHs0dtm-0039rz; Fri, 14
 Feb 2025 19:17:58 +0100
Message-ID: <b2a79cd7-ac07-4d92-b249-191d8519403c@gmx.de>
Date: Fri, 14 Feb 2025 20:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de> <ZvUwCVNPzp1UGY6h@intel.com>
 <34a7d276-ee26-4a8d-b996-87faa5b224c4@gmx.de> <Z64EzooZqdfLg0pM@intel.com>
 <f075b0f7-3d01-4eb7-b772-825de7a1e001@gmx.de> <Z6-ASitAVCBD4QP-@intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <Z6-ASitAVCBD4QP-@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZatDGrZJ+55iLU0qmunqJJMkSX+PD4Dd2x5JqjgVFRKAt8Lj1DL
 2MbFFh/+V2BLEeiZaoBxnOLh6f8Nhy+oHscA74OAs8cAM4eo4h8pyrOKIPbdVVplhvE+SSr
 +cfFSPb+WCMGGMwZYW1lCJsjTXZCdGt7Tu5ZWlT9iEnziocYO8MGE8AFuWcTOPj0Yt1P3e1
 iNHxRN2xgHZhO/bptY21w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Z4SMIobfb+g=;m/xjsCLkcMK0G4ptDocIQIwnWU9
 eqcpF//d0F9R6OFKWuMkJoxnXwHQANGaDpvKb+qz3Z3XXl39iR1Wf25j7dGJKz3b1eD3Tnkje
 q9jP98tgnCO6siIOVzy8l7RysnOrdihm0nY25gIpnx0aOMYftb3dTA1xAbjnv+sKxkqk8+Cjq
 BqtXSMS5DH6oJ07sQuj+hgaK3A65YK78EgQMORuRLLuwpWmOi7P5vAA+w3TIG5YpYApN9DF4W
 Sp5oqnVa/KQi66NSSOVVlfqhOKa2SDQYkNeY/KmkgX9qwM3TyyT6EBgfbKyqrfrAP563svsqN
 RNxH3JozBna5vtaiMWmLjEgvuIVCbELGapJPXmzClsDrZlqy7ofhiOKtrSVnd7V7uhSV13lQm
 69T6gCpK0gbLtIH9VlH4K6wJLk4FPs7UovfhKt3Acy9FLbb/SokvoUWqzPXj+IitFInNnntS3
 FqFi4HQ4YcJSZ++uRYnydtWCA7+Q0YET+M/DqTQpdPIJh68vlxJjS1K64Gem1gk0eQ1QlgeDO
 fyToDp52Ize2Yuyv779+ZFM/YdWbtG0VAnHNpQ9QFed0G3JKs5qYgBhpc32Me4ES6+rgGJ5Cn
 oPMw21VSL0rauS2pymA1p2GwQ2IYjgceAuRdLx+c5PUVDczs3k2Dl92WKN1gh2iiw368DlXkq
 Z9DVsjTgQhNNx/NJpdFwsm3rRu3yGgCzzn8CjQ/eH0cU3sBfPFRf+NkhujpZDDqN4z1BQ/YkF
 tgPswJ6dLggKLMf+mM6kGviUltg1LE8yIa2cu/O5HqIdoJLo82VegVAhqVLEQbnVvEbunECub
 dc2eOUbDqB59qZ1Mazjy0duxTf75x1LbIrYamQzcU4nlBiNL1AN3xMDl4R6lXE45KSTGiV3Ns
 eFyNDU/TVvxzh2MCbI6ZUzrnjcm6acuaOgbjBsrIqq0hO1MSp2MYkSuVF9Rr1iKJXXaruy05W
 W5WQsDS42MSwrfPC4Iff0IVpVp0GWMDGzFEJwuzAcULNLPgAkPaWZO1bqKzKNqsbP1t7PdqHa
 BNcWpcJ6s7c+E1fd9e2cMnFM5yqWowMpLih6DbIxOom2EceMEMgZpXQ6ukXzNnNZzyKA3Cdep
 zMVf5O0+/hchoq+7XYo6yJNbQHmsdYVwaHJZlRfmZ/HWFGRcG0htw/VnmpFe/uRx0Pn4MLPjD
 FbSRboyzzuxowsWxSEFPSMuef441Q4AIspcjs6eEBVrw57I0JOZlpW5P6joN5voxlEaC5/Tz/
 HnCO+3cOuQWuKTPtTzfDpHSrhTHrHZMZeb6UwOY0QwLxmG6Yb6WKBU+kqPkv/1WKXz7MGallW
 XAc++VhUDcuS9QNWbMnmoHekd9aycVejcP5JTzna9g1QqygTlvSbs7GlQjWmtmSxrIARC1cqP
 oNvfNhA9QsqL62iB6laspM79Y7ZxLzek2QG6kB5g7FA5nehfWmQbsuL+nf
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

On 2/14/25 18:41, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Thu, Feb 13, 2025 at 11:47:42PM +0100, Helge Deller wrote:
>> On 2/13/25 15:42, Ville Syrj=C3=A4l=C3=A4 wrote:
>>> On Thu, Sep 26, 2024 at 12:13:04PM +0200, Helge Deller wrote:
>>>> On 9/26/24 11:57, Ville Syrj=C3=A4l=C3=A4 wrote:
>>>>> On Thu, Sep 26, 2024 at 08:08:07AM +0200, Helge Deller wrote:
>>>>>> Hi Ville,
>>>>>>
>>>>>> On 9/23/24 17:57, Ville Syrjala wrote:
>>>>>>> Currently setting cursor_blink attribute to 0 before any fb
>>>>>>> devices are around does absolutely nothing. When fb devices appear
>>>>>>> and fbcon becomes active the cursor starts blinking. Fix the probl=
em
>>>>>>> by recoding the desired state of the attribute even if no fb devic=
es
>>>>>>> are present at the time.
>>>>>>>
>>>>>>> Also adjust the show() method such that it shows the current
>>>>>>> state of the attribute even when no fb devices are in use.
>>>>>>>
>>>>>>> Note that store_cursor_blink() is still a bit dodgy:
>>>>>>> - seems to be missing some of the other checks that we do
>>>>>>>       elsewhere when deciding whether the cursor should be
>>>>>>>       blinking or not
>>>>>>> - when set to 0 when the cursor is currently invisible due
>>>>>>>       to blinking, the cursor will remains invisible. We should
>>>>>>>       either explicitly make it visible here, or wait until the
>>>>>>>       full blink cycle has finished.
>>>>>>
>>>>>> are you planning to send follow-up patches to address those shortco=
mings?
>>>>>
>>>>> Nope. I don't really care about those as I never plan to
>>>>> turn the cursor blinking back on after turning it off via
>>>>> udev.
>>>>
>>>> Sad, but OK. I will look into this when I find time.
>>>> I'd hoped to push those patches upstream during this merge window,
>>>> but then I think I have to delay them at least until kernel 6.13.
>>>
>>> What happened to these? Not seeing them anywhere...
>>
>> The issues above are not fixed yet, so they are still parked in my for-=
next-next tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git/=
log/?h=3Dfor-next-next
>
> Those issues are already present in the current code, so
> I'm sure what's the point of holding this up due to them.

Let's try to fix it while we touch it.

Helge
