Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C189371519
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 14:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E806E0B9;
	Mon,  3 May 2021 12:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1012C6E8B0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 12:13:42 +0000 (UTC)
Date: Mon, 03 May 2021 12:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1620044020;
 bh=/+Uui9Hgpk+QynuM+bEkYRSPZ/IUi3/Z5yoU5LfCVc8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Vmg1ohMwqVYlk0tZdMzAe8IX+buDMbWqIHX01AXjUGwMgmz5nb8cPJ9/XWpyGUus7
 t/JWDCDw9cMMO7RYv0PCuUI1WH493F+UKgx+wUHg6YkKOhfhjRRx/tzLlOvpPTsV0D
 9mZrvZJdhsAc+9cvlLSHwYWtXmwdnWBvlxfFdtVc=
To: Simon Ser <contact@emersion.fr>
From: Caleb Connolly <caleb@connolly.tech>
Subject: Re: Display notch support
Message-ID: <c0cdabab-74b6-b2e6-4a4d-edd737d5ae6a@connolly.tech>
In-Reply-To: <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
References: <f8747f99-0695-5be0-841f-4f72ba5d5da3@connolly.tech>
 <ck2MR5NpcE5l0NZuJnX7O7DLXBGxiFr_1LCqlDlsC0GNC3PEtTEcx1-vfIp8ZLyMhfxmv4_MyGaYBjZBawdTaWzButF0qkbdc-9EYhVFZYk=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Cc: martijn@brixit.nl, dri-devel@lists.freedesktop.org,
 dri-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2021 8:21 am, Simon Ser wrote:
>> A solution to make this configuration generic and exposed by the kernel
>> would standardise this across Linux
> Having a KMS property for this makes sense to me.
>
> Chatting with Jani on IRC, it doesn't seem like there's any EDID or
> DisplayID block for this.
>
> Note, Android exposes a data structure [1] with:
>
> - Margin of the cut-out for each edge of the screen
> - One rectangle per edge describing the cut-out region
> - Size of the curved area for each edge of a waterfall display
>
> I haven't found anything describing the rounded corners of the display.
>
> [1]: https://developer.android.com/reference/android/view/DisplayCutout

It looks like rounded corners only get a developer facing API in Android 
12 [1].

However from a vendor perspective it's possible to set padding for 
rounded corners [2], although this seems to mostly be a hack.

It seems like it would make sense to deal with cutouts and rounded 
corners separately, cutouts are always convex where rounded corners are 
always concave, they have different implications on how content should 
be adjusted.

[1]: 
https://developer.android.com/about/versions/12/features#rounded_corner_apis

[2]: 
https://github.com/LineageOS/android_device_oneplus_enchilada/commit/923c86a13b5ffb58683206a73a0813783e71e3fb





_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
