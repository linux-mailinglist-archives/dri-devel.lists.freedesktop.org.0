Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431499C6AB5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 09:40:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF87C10E694;
	Wed, 13 Nov 2024 08:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linumiz.com header.i=@linumiz.com header.b="AozN/N0l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Tue, 12 Nov 2024 17:21:02 UTC
Received: from omta36.uswest2.a.cloudfilter.net
 (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5048510E607
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 17:21:02 +0000 (UTC)
Received: from eig-obgw-6005a.ext.cloudfilter.net ([10.0.30.201])
 by cmsmtp with ESMTPS
 id AqBktycgTqvuoAuSgttgoY; Tue, 12 Nov 2024 17:13:54 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182]) by cmsmtp with ESMTPS
 id AuSdt0POGxK8vAuSetb7vv; Tue, 12 Nov 2024 17:13:53 +0000
X-Authority-Analysis: v=2.4 cv=T/9HTOKQ c=1 sm=1 tr=0 ts=67338cd1
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10
 a=oM_t_NHKBYUYTEO7nXEA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
 ; s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+KnGx3ACBnnMv2BmaDE1d3Gtw8+1dg1ljAPNkRzxM8c=; b=AozN/N0l9750TXxMIZV9dyrYzr
 pGPwMXEErQkZbfhuE2qJSjqeSI2GOs9LzqRhJEH5WTyajpDDai0UnZ+8/gsiQTPcKEv6hQRRLg/0s
 +7xHFVam1tSusiES8SgHsXFvRuI3b0orNqK4EI8x96i9NrCOiE0wckzlUPE/Dj0CVXyXdWMvJf6g3
 uBde9UXDm6TfRxDipncRac4MNAhLLPpl3QQ4sCps0Bd3XvDWMudY974mZj5fy8CUKOt8AaTxI0t7S
 OrMFf6kEML+ZhRAg4M/+KfEyr0iSPIO0yQCcgN9DsX5S4ejK5HFDkMrk2JqSUt7/KfMPRAf+1dAiO
 8e7zUG+Q==;
Received: from [122.165.245.213] (port=53470 helo=[192.168.1.5])
 by md-in-79.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <parthiban@linumiz.com>) id 1tAuSY-000Tbs-1d;
 Tue, 12 Nov 2024 22:43:46 +0530
Message-ID: <f0d5b314-cfcc-4856-8d6e-09e437c075ec@linumiz.com>
Date: Tue, 12 Nov 2024 22:43:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
To: John Watts <contact@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan> <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
 <Zy4c9BFcrz2JVU6k@titan> <ZzNCsFiAiACFrQhE@titan>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <ZzNCsFiAiACFrQhE@titan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tAuSY-000Tbs-1d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:53470
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 4
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCA4q4y/xcTkpSVStpuVuCpK8Ignw6VbWYSLxL/biVbjFtoCEpfhUl6eYz2cAxkradKBVDTZ2LWe1JHuzBYzMxT0IQYbq9I2dFMIAm8Fg0cHjUP3xpQS
 QA03hNcizrP2zDKtD8tJN+oyQ1kGLXaaF7febu8klEc16q+AlJ4u2mWKqH1mQ1wfmE5RjT6jcL86U2sigEQgjYw/QvBz3ZAJQN0i5S++adS4BKNkeCC3skVa
X-Mailman-Approved-At: Wed, 13 Nov 2024 08:40:38 +0000
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

On 11/12/24 5:27 PM, John Watts wrote:
> Hey everyone,
> 
> I'm not sure exactly where to add this but I discussed some of this with
> Parthiban on #linux-sunxi a few days ago, so I want to write it down
> before I work on the next version of the patch.
> 
> I had assumed for some reason in my mind that DE0 and DE1 here referred
> to mixers, but they actually refer to chips that have multiple DEs. It
> looks like at least with the A133 it has two DEs instead of two mixers.
> 
> This can be found by looking at the Allwinner BSP: SUN50IW10 requires
> CONFIG_INDEPENDENT_DE and has a device tree with an extra reg and clock:
> 
> <0x0 0x06800000 0x0 0x3fffff>,/*de1*/
> <&clk_dpss_top1>

Independent DE is unique to A133/A100 AFAIK.

> 
> However the tcon-top code seems to conflate mixers and DE in the
> mainline code and the Allwinner code. So ... It seems like 'DE0' and
> 'DE1' really do mean mixers in this case. It's probably best to note

#define TCON_TOP_PORT_DE0_MSK                   GENMASK(1, 0)
#define TCON_TOP_PORT_DE1_MSK                   GENMASK(5, 4)

references towards DE0 and DE1 is for DE itself, not the mixers in the
current implementation.

Handling for mixer0 <-> lcd1 and mixer1 <-> lcd0 also needs to set
DE2TCON_MUX in de clock, which is missing now.

> that down.
> 
> I thought a bit more about how to solve this properly- setting two
> mixers to the same output is something people probably won't do in
> practice, so the only way you could really arrive at this bugged state
> is by setting it as the default state. This patch may be the correct
> solution after all.

sun8i_tcon_top_set_hdmi_src for R40 already sets these values via quirks.
i.e controlling the port muxing. Also D1 quirks is same as R40. So the
original changes to make the DE1 point to TVx can also done in this quirk
without hardcoded value?

Thanks,
Parthiban

> 
> John Watts
> 
> On Sat, Nov 09, 2024 at 01:15:16AM +1100, John Watts wrote:
>> On Fri, Nov 08, 2024 at 07:36:16PM +0530, Parthiban wrote:
>>> To add, 0x20 will be DE0 <--> LCD0 and DE1 <--> TV0. Below note (copied from
>>> R40) states the priority of the DE selection, which fails to work? Not sure,
>>> may be disabling CORE1_SCLK_GATE and CORE1_HCLK_GATE in de2-clk helps.
>>>
>>> With A133 following the same as T113 with single mixer without TV, still
>>> sets 0x20 in vendor kernel.
>>>
>>> copied from R40:
>>> Note: The priority of DE0 is higher than DE1.
>>> If TCON_LCD0 selects DE0 and DE1 as source at the same time, then
>>> DE0 will be used for the source of TCON_LCD0.
>>
>> Hi there,
>>
>> Yes that was a pretty bad typo, I meant to say DE1 to TV0
>> The prioritization seems broken in the T113 at least, it's racy from
>> what I see in testing. I should note this in the patch too.
>>
>> I looked at the datasheets and kernel code briefly: I can't seem to
>> figure out what SCLK/HCLK gating does and I don't think the kernel
>> touches these registers which are gated by default.
>>
>>> Thanks,
>>> Parthiban
>>
>> John Watts

