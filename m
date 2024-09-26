Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A9D986C45
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 08:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D6310EA95;
	Thu, 26 Sep 2024 06:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="rbUmQHNG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCC010EA95
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 06:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727330888; x=1727935688; i=deller@gmx.de;
 bh=IremGlvVIqzA4dnjB3gFMQY077nAgEBf48AK4cDSyB8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=rbUmQHNGYF5OA3nyen2ruCg/ocTeusny3wTGr/NRmhkB1Ajn4zQWH8v/0y+ylGmi
 h2FXgELr1Cbk2hdk7dEO3Ll1+jDrHuo/LJ9fizbxgB3vUI9xCmzyMqKlDE+W2eQgh
 4ap3GjzUQZAbMdJXN/JRAgbCqZAPbUaUlIt2KV6+YLEuV3tn50mSsIdDRHsyiwp75
 EEI7TyFoeIlLiDBKy8+SJ1qY3xabm6F2ILpIcrJFpM/rhjsALDA0k6W4jRvUzjALZ
 H1gs2PVL4GW/ZSxnsGvdNBvcSppaM3VOzbTsM0n0iYnhU3rgN+8ZQrXwKsEDbdA+Q
 Mh29yRNbeeQdBRVLrA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MYeMj-1sPboJ2oJX-00Qshu; Thu, 26
 Sep 2024 08:08:08 +0200
Message-ID: <92ed9455-b175-46ef-b0c6-7c79e2b78371@gmx.de>
Date: Thu, 26 Sep 2024 08:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240923155749.30846-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/DiZ4Wx9j3zjrFGlqGtk1TwqKvH9R51UDG14jSz0b4aJ1Ccpd+f
 serSZQIneYsJLB3lqYvQPUkyABt+fw8Z+a8mwcvzkHBzyqdl425iE5xw/eIIvJs4iy60IYO
 Ji3ZKU7tXgVozCVrLkSISn6Biv0q+GFa+0wNJ+Vkyy6J3tx/pz3nwKwIVoc5po8M31BAa+G
 dhwwPtM5vurNCn4k81zAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NoO8cMt4tv0=;b+hBYvtDbW7DvJ4BrM7coxL7eqx
 RPSQotgajXGnJLaSoB7hpuq0ljvJcW+kjCv0O0KufZhzyDc+oaQACuO5LXcTjBU8VPfi3m00W
 gKJ9qOhP4KsnOfxREm1tBJcCjKnWeUl876nc0wY6PxiHZk3WPhhbFCJp+5hhzGrfhkN6PMrmg
 yrcGQvTde6/r6LKw/5Z4t86F6zZnsBvuLLs+wzFm4T2N/TMGUbBIwlXDQitB5cEoWOB6e/Lv6
 ci6DfGqvc7G1z4KcYSqIuIOhkopn6azYgpsJhZTRy2+hc9DDLdjVZl2mCM/2oylqNuaaEO6iJ
 JDewzcX7dLcyiCPfowGq+0R2trNb6qDa9R3SO83OURKDPHD/9TSfgweG6peqrxwgmWqpJm05c
 5uQRyPEbhw2vMeUA4G/1eo3yMSj7irgluNcbMw9LrInmHqfFWqYJkgaZ6+uryYNbjzeimoDR8
 oTuuR6SAyk4pTfrdAU0V9sFPwxmbo2Z/nMU6J4rOd3UBkIjsVF10tfcZvVkqGHbNke5wZgOI+
 yGTEpcVZbnI4gdZQ6JHl3KWU0YepZHHeuJiJekl9BvL/B0KlSr5lhgu+xOYohHeWDZ3k19PBS
 Ace9c9KXQ2khBN6HUkVya/D9AzObQQsoWH4Dt8gLOyRzdYyvyfuCR1qxmHkFWqcIW5dVXf05E
 JTwuD19vILftjMbh1/F8E4BQhrA1VwKzh4wCwwyz8oabNzwPJSJXmop8AnOqVVXWtmDFr/fM7
 vFTTpwWFSb1CBS5J8lkpMi77qbhK1BBh1H/QzuZSbbJUvU6dp1owY4d8vqPCxDsEJ1niTWyAn
 IX6ygD2V6nj6u4mNMAwfEVew==
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

Hi Ville,

On 9/23/24 17:57, Ville Syrjala wrote:
> Currently setting cursor_blink attribute to 0 before any fb
> devices are around does absolutely nothing. When fb devices appear
> and fbcon becomes active the cursor starts blinking. Fix the problem
> by recoding the desired state of the attribute even if no fb devices
> are present at the time.
>
> Also adjust the show() method such that it shows the current
> state of the attribute even when no fb devices are in use.
>
> Note that store_cursor_blink() is still a bit dodgy:
> - seems to be missing some of the other checks that we do
>    elsewhere when deciding whether the cursor should be
>    blinking or not
> - when set to 0 when the cursor is currently invisible due
>    to blinking, the cursor will remains invisible. We should
>    either explicitly make it visible here, or wait until the
>    full blink cycle has finished.

are you planning to send follow-up patches to address those shortcomings?

Helge
