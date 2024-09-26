Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2417598710B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 12:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DC410EB95;
	Thu, 26 Sep 2024 10:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="astbiMQM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352F410EB95
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 10:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727345586; x=1727950386; i=deller@gmx.de;
 bh=NAO3q60prU3UxFVJOuVmRq7T7yWwvmWgwxqsl4a3IiY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=astbiMQMLlJfyAEdm7MbXokAymRxdNB0dulZKJ1yfZmjhcrp1Rg1mqY8pvbOSkN2
 hBlP8j2kwGUppeqCqQZYL/B+nizE9ASeRkdOibff0pWiRpR6lrWS1Y0qe5x7LZiYr
 GUCNAZ/mfKpByXcvhzmcbNfCnPxgcWv4WEtu6fCx1B8sYBn9cIqSbhkev9pLu/ROJ
 T4tplNYm7wFSa4ANuaxrd/F4xPiOo1W6K82x0JJJoQrEcUwtjpt3g6hKGFkpGTNrB
 nvBb4DbI9oV6Lkg2dJMP43gSl54v2L+sYPse/OspiVcxWW4i148kIPdX/J7rXN/TT
 24OXG4zoo0IdKK76Nw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1sUVw63C5U-00YrCC; Thu, 26
 Sep 2024 12:13:06 +0200
Message-ID: <34a7d276-ee26-4a8d-b996-87faa5b224c4@gmx.de>
Date: Thu, 26 Sep 2024 12:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de> <ZvUwCVNPzp1UGY6h@intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ZvUwCVNPzp1UGY6h@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:88zWRIVm6GH/U9lSAFXeVhyG8AOQdPdb8FOKz7/XzO+YSQ+lzBy
 G8MMX0ZOkirwy8VX+qLc8osZBm8yiC5A9JxZdJ4HCj5GDbVXYCqz6278xo7SFt9F9eNNTyJ
 Fw/rOPgodyaz0LxSUPOjZmEHdyC8+AYhpReWa7p0dY972/inrfovQU2J0P92x9uciSzgCaC
 iQqQH4Gm2YTvWI5pTNW7A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pyE3dNdhv+U=;HcdszWpQK3549sYFiVmVhIRSmr5
 xDzpcWqxeQ5OArzwMi+NmWhCTcniCCzbWGC15bS0lzF1t2/QqdSy4Ltrb+lQHtGlap482nCwT
 eOnPmfu3sxz7oRrArUEKAJyFsjrUKtO8g+af/h6do0dhp3VGaGaxOC0BJFe0la7XYDLopprku
 IERhRNqpN5j3uKi5NjoGQMuxvcGTojwL8F5sBotdnpw7F6+TzdTe3KHl/RoCuRiYSE90OfA/Z
 66s1fABb0XMPe6gPpnUR8hbOchRePRFPDIsBK9+KcRvC3wEfKaLdX8+wOGnf9Fx09jwO2tLdC
 bwzeVi0a4HM9jjgwlA9BM+yZCo18daanny+6T4i1QnyHDMsbp+uLSsHc7OqFz8jB2btVXOagL
 uYaT/1Uzpu1vdhbkKMrXOA5YjWQ1UM4vgI0UNJOLYYbhkF/mZVQiRkHdM/zp1o6oEzyRWYibU
 2QPXnyyI8MvjQNV2pVwQXaI6/S9sfdbqcWz/+p08kTV2JJ2n0miTu6njWyybd8uAMHYuGrOMQ
 BOy3KdGhrohNyDxkU1ZnOOBL3XocH5vUf0B3Dpq5SipKb7FQfxOnjoFlIPn3h27V0xJyqe/tH
 KoC5Au2s4ZOABF4JzoWoeKRaHp3OGUI0TwXW17PwLH3iqlRz3zAOJiyEDFTJEmL4hUOApv5bm
 UJeSUOndKJT7qO03vrxyzFTWscIRSUfZIXpMFH5ez6a0QY6atzWyZ78AETQIGMHTmcr5e6kkx
 csdzyXx8AgQ5ZgY3c0bJ8Tc+ptR0OldprTOQy/wYRBBcVwUQKuk2pbgtsI0ys2u79jb5eOhb/
 wVvsUahgC852lfvvQU99/QoA==
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

On 9/26/24 11:57, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Thu, Sep 26, 2024 at 08:08:07AM +0200, Helge Deller wrote:
>> Hi Ville,
>>
>> On 9/23/24 17:57, Ville Syrjala wrote:
>>> Currently setting cursor_blink attribute to 0 before any fb
>>> devices are around does absolutely nothing. When fb devices appear
>>> and fbcon becomes active the cursor starts blinking. Fix the problem
>>> by recoding the desired state of the attribute even if no fb devices
>>> are present at the time.
>>>
>>> Also adjust the show() method such that it shows the current
>>> state of the attribute even when no fb devices are in use.
>>>
>>> Note that store_cursor_blink() is still a bit dodgy:
>>> - seems to be missing some of the other checks that we do
>>>     elsewhere when deciding whether the cursor should be
>>>     blinking or not
>>> - when set to 0 when the cursor is currently invisible due
>>>     to blinking, the cursor will remains invisible. We should
>>>     either explicitly make it visible here, or wait until the
>>>     full blink cycle has finished.
>>
>> are you planning to send follow-up patches to address those shortcoming=
s?
>
> Nope. I don't really care about those as I never plan to
> turn the cursor blinking back on after turning it off via
> udev.

Sad, but OK. I will look into this when I find time.
I'd hoped to push those patches upstream during this merge window,
but then I think I have to delay them at least until kernel 6.13.

Thanks!
Helge
