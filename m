Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB7A2EDC0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B3410E538;
	Mon, 10 Feb 2025 13:27:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="L007ozbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC1F10E538
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1739194051; x=1739798851; i=wahrenst@gmx.net;
 bh=1LAndy7n0C4Lxo4u/cPhCxiTw6C/CYRO0fFrF/3UcWU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=L007ozbv+kGvkB9uodmucR36YrhO0JLEe4/+pdJDglFrKU6a51UO7ouvorkqj2P6
 W3XCncMgtv5jSROPlukK33aAb9cpWYrkNjYdqYcjk/mWloHlVBJzCqhY6NH9Xkpbw
 Z8GnRqP8iumzZCr/dZ8CJ2EiukQNwpzeSR56CkqA1YnotE+nHfrlje0VmnW6ucC7q
 R94TlzixPuL8mCjKkhlKgnhXpcGB+LOKPRoQJYUV0OupVU5VdZt/1gXtbCmMf5mIB
 5M2bR+5w8/ku8VXziRRVI1uvusjjWAT6/Kp4TgLwb5Mn25WQU+mjfZeDzJxCbO/Oh
 hJ8ri31tVe9ebwHypw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59GA-1tiZkd05f2-008GZE; Mon, 10
 Feb 2025 14:27:31 +0100
Message-ID: <29a5d5a4-7671-41c3-8317-07eb9589c16e@gmx.net>
Date: Mon, 10 Feb 2025 14:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Add clock handling
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-list@raspberrypi.com
References: <20250201125046.33030-1-wahrenst@gmx.net>
 <e1bd620c-a5d7-47f8-bc07-c41418c0c34c@igalia.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <e1bd620c-a5d7-47f8-bc07-c41418c0c34c@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/OyJbdyDseZXQ6OZw6vM5iRZx2QRFUzaIo57ZTYXBAEh8WIln8O
 y1F2JjsepGPDaW8XBRe3o7zfhH4uzTiOIp/dWlmeT2IV0gpCVSF/nzZ5LtuNtKtS/SFUHld
 xxhjr+i7V4Veu/C4taHE8TyDdBJLdp1W5zHJWB9RoqT+T9r47mdZUexjlI4xt31oO3ezuoP
 hVeCOr/V+N566weQZMdQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:byI6bWIrSXI=;JoI/A3KypsDvarrsqZ32R1Nq+7m
 UYgYzEkYnarB/0RtAF+PUiaj0jzT0QZer824/wb1NCZvyMyi/TzMdIUkG5+RK0+32P1SmlJ9y
 llZDFFqU6B6Q75exg3DM3dvzXnxnRptHJLEHop2Gv32Bbc1WpnAGc1IvAPM1Glw35DeNVUXTX
 VjiFnKe6WmxZI7vrw3PzSsrn2/lTsKCp/DWTObGAnuwBn0JtXLs4Qkbo08dVRjINCNu09jxYM
 HXctUANEmGGZN8VMMWCrf7YDXiGY0IMjiY3yNpV8w6c1LKkyPwGdnOqLv4JEcFc8rLqtT3vTu
 JKsqPjwR+9kkdEVn4VeaD6NqagjPjlwfkMPEnh+N2G5G+ytJmGfmVnrsnM5YDG1oRRUKGRAFq
 KgYhKz8WhetIzCt05IyJId0MHl78xtVni3S8p0ZjT1+13Rg9SghNRgMC0FI87cBuf+0ttxJRe
 tFKRuF1vZOgs/JKvujmDVREs+G35rzPWYDIvaoxnGhvNpYXhBGvU9H8vxCbb2SgQjNR3TOO1s
 Md4EliA1Egq+cebsLsUZN/WV2jMkdAddKG2WUOqMj/UzLK+rbQvKlj59Y4QggSHT9KDVf1iQG
 k2LoY2IEInsMRkFa53CCWP236v2pMdgvHVCpzv1pSZQFCW5CQNbeOQYqwkr1tnC9n48vIq44Q
 rc9RYWPbvhKLsd1C5vX8yLb4PWXqlF8h4hQgYeqQaBanszP2C//B4whjBHpM4xaN/gmIRdBmC
 Aeh3TlN1QAF0v3T6rtFphIcsafOgIzI1sJCGMouOZCaC6fnvi7CKvL+WvyGcUTZyBUhrM5ofv
 X/GilygqmhiL6KIq46HTrrDDskALiPUEWi0YPKeP5pQZnQ+fEZ+QS8QuDV2milFtFkAmG673w
 bGrtP3YuwYH0V/ZxvYk7S7KoMcA1R6R2p9Z2kgtc/N2bpFQlHcZdaztHAE6+DAvO7UrPhF8yZ
 rxmQP2eb8qJNUysSdb3ML8nw+oEQAxPu5dDvF0TnhnLbPZA+UGBs8dRT5EeNS1Kiy2D8W0VdA
 e2SNalt1B3G0Y++RlPo088CUJpw/SsKJpUnK+EqIy+qHaUYeZzBrvnn2PbGPJh8eGKzlumaP8
 Vsl6TaXDV56rxOOJIRCMGZeEL4ARSlKD0lCPf10yv4TPDz/hM+z/Pd61HWH1QCzaU0Wh1Gx1e
 UcODGB93h+u/zcchTQVW714uaL4vDVlRB4WL9Yf8NvP18eq+Wqoj3NBuUT/NAu1i6D5Vpd76L
 SsR3raJwkrmaqoa6/6rAHNv5bU1OV0Z8BTgwRgO/27hfOa0JclsmmYMBOeV8kIfjbpGrNLOsu
 NVsLpPN5CG43w2HHf0cpcPDg4QKqknU1/84qcsZQvqpC8yFy9+FPJm/zScVQX0Onp0PbfCYcO
 Ipf3TitiupAuTpCFPe+5i6rblVVKMtAChWRCOs6l+azEke1kuoJyUiwOmJ
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

Hi Ma=C3=ADra,

Am 10.02.25 um 13:23 schrieb Ma=C3=ADra Canal:
> Hi Stefan,
>
> Thanks for your patch!
>
> On 01/02/25 09:50, Stefan Wahren wrote:
>> Since the initial commit 57692c94dcbe ("drm/v3d: Introduce a new DRM
>> driver
>> for Broadcom V3D V3.x+") the struct v3d_dev reserved a pointer for
>> an optional V3D clock. But there wasn't any code, which fetched it.
>> So add the missing clock handling before accessing any V3D registers.
>
> Actually, I believe we should remove `v3d->clk`. In the past, we used
> `v3d->clk` for PM management, but we removed PM management a while ago
> (it was somewhat broken).
I disagree. Clock handling and power management are not the same things.
Btw the brokeness partly based on the missing clock handling, but this
not my point here. The DT binding of the Broadcom V3D GPU describe an
optional clock, so the Linux kernel should ensure that before accessing
any V3D registers, the relevant clock must be enabled. Please compare
with VC4, which does the same thing.

At the end we had just luck because the GPU firmware enabled the clock
at boot?
>
> I believe the best move would be to remove `v3d->clk`. If we decide to
> use the clock at some point, we can reintroduce the variable to the
> struct. Right now, it doesn't make sense to add clock handling if we
> don't use it.
clk_prepare_enable() / clk_disable_unprepare() is actually using the
clock. There is no need to set some kind of rate, in case you expecting
this.

Best regards
