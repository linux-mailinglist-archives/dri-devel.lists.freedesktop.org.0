Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D47428997
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 11:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095086E455;
	Mon, 11 Oct 2021 09:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C596E455;
 Mon, 11 Oct 2021 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633944198;
 bh=U/shT+7l0cuBfb2Az0GVIwtLNaXjsil9vuzWuDDckSw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=K9M2dP3MxUpy0IuJATs8fpi7G9QGf6dQeRmBUNbHODjDk1RMp1wzwh8684aqyDF/R
 aI0KML94b4Ufpm3eHZnNvRHiYi3J1xqb66v+fgtVJJga630bEZHf+NHYRSAAkDxaLt
 /7yTTDxdgX+9RIRyKbBv1ml7DLAjQas07JJP+MPg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([79.150.72.99]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mv2xO-1mrfQT3jTU-00r1qI; Mon, 11
 Oct 2021 11:23:18 +0200
Date: Mon, 11 Oct 2021 11:23:04 +0200
From: Len Baker <len.baker@gmx.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Prefer struct_size over open coded arithmetic
Message-ID: <20211011092304.GA5790@titan>
References: <20211003104258.18550-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211003104258.18550-1-len.baker@gmx.com>
X-Provags-ID: V03:K1:qB41EdUOsFZuYV3ml4IEx+V8zljlxj5AcR10VQSG2G0KC4NSufx
 EVfLMr72fxNHAetLb+CjeNmh06lR3j1ygkpmj1aTeYajVmigaqqfQltDT5BaFLKoBDMpBkF
 JkVP6qrlxNpxqISrXWVUCRyOc2+2T3MydQsryZsJJHftgl/WMPyuxw7oUYeKOTPH07v1U3z
 ppEUK8veKOEhshP0mNV3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n3aBajBwyFg=:fbkv52sPN3R+NBkzOIhfgr
 wKEwFGA+6tvS1hf9vux674WdWdYDAUdl/1rHjB+Q3OfpROOE/BafCD+y0BETdU0D8iXICXU85
 8ZaO4LayBVas4vHXWp3YxXlTb0C4/PhdTY4NRO6ZCJFdmgHpx7yTgTUlFvHqxdiFWc3r4akDy
 eUdV7BiRjFPDohB/Q4C1u4VKKr4tq9kPnv4w7E45aQcKA95SjI/PNjJWYAIKPpO9iTZ+K7BKd
 as8hVxGJXU+ROIHr1qz/hI+zjojMolVdB27WEegacTpvlpwps+1nJswDPOGc35X339Gd58sKy
 YJozSBdrfx+6EQB4xYsix4FHBZBfYmR0ceedUvF1Wr/pm2FN9yPGeRIxxrpHRRvJ8+G/tChvy
 USDxwYAviP+3qJM5eYQRZSKPVNvNd6MQgnXA3Jy0QShI31w7DYxkV9zpjbUeQ4oyFCBkMagEJ
 ZMdd0u4CZFJKhyCE2hpkC9ZUHQei6bk+i8QQ3NsRJMD/ky7EnTk8EOCHt+oWqkcjytC5DNxG7
 qpNRxcZGA1/JIOXWiDXYklMRlDRuy02xEelNr6AK0S6x7sBm3q/iWiC1eQ2fbpfMge9Tl+18a
 hwXzLn3QuIfnnvSaVFpOlVddExlSBmw6XPs2kLAzvGFcGB+V7BvJ4LBsn3A8+5B0WviTOtdzV
 oy07G7iikBpdKa1FQNle1oGMafnx94W/ypputXs81QDfHekgewbqdFXr09t4UmXsCAGk4txYo
 WTa8YJ3krCbYEhMxLxn0Eb7z0xva4AxZT3nqfDBbsHVsE0uFjmYZP/sQ3P4hUP3A1lXNYToLK
 0Ou7riL5Hlv4owvXK5x9wTy4mp7fLW18bwHZIunu2Sbl1K3YxpNEAEGjttc9YOjCe3f2FvVnl
 BS4Car48IJSpKE0kFKxYTOKdfnt6pXDavJsPOHzTzF6k3RiiHCjbrjNb4xen2NGVbCUaySI2z
 YCyynUtfm3vQrSW/l9CZ7GSkTi+yxrcmr+3SOPJcLTayvUCPS2T8+JBBpnH6i2CqJZsn+ZTnX
 0GIcOY64olYND3VFEmo4IgyLqvjFe6VDdL9UniVCw5/EqrAfM0IgMyRGAvwjXwaZq/Ki6uzY3
 3a5B7XNOU3vJWg=
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Sun, Oct 03, 2021 at 12:42:58PM +0200, Len Baker wrote:
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
>
> In this case these are not actually dynamic sizes: all the operands
> involved in the calculation are constant values. However it is better to
> refactor them anyway, just to keep the open-coded math idiom out of
> code.
>
> So, add at the end of the struct i915_syncmap a union with two flexible
> array members (these arrays share the same memory layout). This is
> possible using the new DECLARE_FLEX_ARRAY macro. And then, use the
> struct_size() helper to do the arithmetic instead of the argument
> "size + count * size" in the kmalloc and kzalloc() functions.
>
> Also, take the opportunity to refactor the __sync_seqno and __sync_child
> making them more readable.
>
> This code was detected with the help of Coccinelle and audited and fixed
> manually.
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#open-=
coded-arithmetic-in-allocator-arguments
>
> Signed-off-by: Len Baker <len.baker@gmx.com>
> ---
>  drivers/gpu/drm/i915/i915_syncmap.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

I received a mail telling that this patch doesn't build:

=3D=3D Series Details =3D=3D

Series: drm/i915: Prefer struct_size over open coded arithmetic
URL   : https://patchwork.freedesktop.org/series/95408/
State : failure

But it builds without error against linux-next (tag next-20211001). Agains=
t
which tree and branch do I need to build?

Regards,
Len
