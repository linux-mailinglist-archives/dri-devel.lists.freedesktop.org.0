Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA872A915D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443CB6EA7F;
	Fri,  6 Nov 2020 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942466E9FC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:45:10 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CRdsw1Q1Zz1rwDp;
 Thu,  5 Nov 2020 10:45:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CRdsw0TMgz1qrfs;
 Thu,  5 Nov 2020 10:45:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SOK1wU8IuNZ2; Thu,  5 Nov 2020 10:45:06 +0100 (CET)
X-Auth-Info: dZUxt/XeKAi3SvXTXM+BYnQnzwS+lbbpLTOi5g18l38=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  5 Nov 2020 10:45:06 +0100 (CET)
Subject: Re: [PATCH] drm/stm: Enable RPM during fbdev registration
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201104125200.259639-1-marex@denx.de>
 <20201105093945.GS401619@phenom.ffwll.local>
From: Marek Vasut <marex@denx.de>
Message-ID: <e7bdd094-2109-34f1-77dc-165ff2706d20@denx.de>
Date: Thu, 5 Nov 2020 10:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105093945.GS401619@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Alexandre Torgue <alexandre.torgue@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/20 10:39 AM, Daniel Vetter wrote:
> On Wed, Nov 04, 2020 at 01:52:00PM +0100, Marek Vasut wrote:
>> Enable runtime PM before registering the fbdev emulation and disable it
>> afterward, otherwise register access to the LTDC IP during the fbdev
>> emulation registration might hang the system.
>>
>> The problem happens because RPM is activated at the end of ltdc_load(),
>> but the fbdev emulation registration happens only after that, and ends
>> up calling ltdc_crtc_mode_set_nofb(), which checks whether RPM is active
>> and only if it is not active, calls pm_runtime_get_sync() to enable the
>> clock and so on. If the clock are not enabled, any register access in
>> ltdc_crtc_mode_set_nofb() could hang the platform completely.
>>
>> This patch makes sure that ltdc_crtc_mode_set_nofb() is called within
>> pm_runtime_get_sync(), so with clock enabled.

[...]

> This looks like you're papering over a bug in your modeset code. If
> userspace later on does a setpar on the fbdev chardev, the exact same
> thing could happen. You need to fix your modeset code to avoid this, not
> sprinkle temporary rpm_get/put all over some top level entry points,
> because you can't even patch those all.

I have a feeling all those pm_runtime_active() checks in the driver 
might be the root cause of this ? I wonder why the code doesn't use 
pm_runtime_{get,put}_sync() only when accessing registers. Thoughts?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
