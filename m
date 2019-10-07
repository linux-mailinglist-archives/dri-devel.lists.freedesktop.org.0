Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8DCE6FE
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 17:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9716E5FC;
	Mon,  7 Oct 2019 15:13:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510946E5F9
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 15:13:23 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 7so13114982wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 08:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zZhWwemYig8kkhxldGf4LKemMdD16O7Dc8IYXL4Z9nQ=;
 b=OYZy57GQGgvkvo8VG+ajNlueMS0zPQYnVrrXBAuoy4AlblVZoNvl996iiO2ocniEME
 nhNgeClsBdfCfuk6KDm8152AOQJVeVw/1ozIMBty4M1b2Jdvoh6bWjJmbmbPcbQ+qQKR
 tfzJFgagW50AgPMXS/LzcpeBslSv7zT/shAATwKN77impj+Q3j+rBvgz5CSjvQfQyEQB
 lG8mrqqeqJBSZKkyxsfa6ltPaPNcEbcC0jXeie/4YN8v9VZEKrrcFt0z6R9/uL1beZYL
 EhpSMgleCLpVhjswR4PHE/tg9bw2Y/6bciN9Von735oXHDDcNzzdQbvQXwlAZ6jplMS0
 9xgA==
X-Gm-Message-State: APjAAAUeUNkSyVDVjCcIRvLzJyZeqxg8gTlVdEFXR9OOyqRaURBYrds2
 ub2mRiRxRXZPHaOq/e9T9DrcOg==
X-Google-Smtp-Source: APXvYqyoB84wgf2m2ZiN/nCRXnW//WyCx1S1jxPL+K+bYrlRxCFhQyVxnrvMqqjqFYdzzvEJ6AVRAA==
X-Received: by 2002:a7b:c148:: with SMTP id z8mr12606425wmi.95.1570461201869; 
 Mon, 07 Oct 2019 08:13:21 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a3sm28051120wmc.3.2019.10.07.08.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:21 -0700 (PDT)
Date: Mon, 7 Oct 2019 16:13:19 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 2/5] backlight: pwm_bl: eliminate a 64/32 division
Message-ID: <20191007151319.de6ko7n5dypqgyce@holly.lan>
References: <20190919140620.32407-1-linux@rasmusvillemoes.dk>
 <20190919140620.32407-2-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190919140620.32407-2-linux@rasmusvillemoes.dk>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zZhWwemYig8kkhxldGf4LKemMdD16O7Dc8IYXL4Z9nQ=;
 b=TtfturaR8liADnZGl/3TkUOAnWRUKqPN60ooxnYYL6Va4SHdSH7tCSecNi7Y8dNBVv
 Sih8Zsx/P0NdmRovUTDJe4OefM0M3fYYZkH4Ua62ocK1kMsPnqFa7Jd7GlevAYguTp8W
 XGGqQNl9SfdSzxtH9TLnymc2P6hPk/2NiYyKUnEGd4D/dnQH8a7AYyfhHKZ+gSY2rhs0
 f+Kp+YX+VBKSaaD4RCxkq1pJfGPNK5hjrT6zv/Q2jqxp3rScWis3JE7VYfsz9L5mpSK3
 AJIWz6NA29ya4ZFpE6PfdJ1qGWzJ1SRoQjz583M8TK5FJWxbHjLuKCHxNOdeu1MiCL7R
 Cc1A==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTksIDIwMTkgYXQgMDQ6MDY6MTdQTSArMDIwMCwgUmFzbXVzIFZpbGxlbW9l
cyB3cm90ZToKPiBsaWdodG5lc3MqMTAwMCBpcyBub3doZXJlIG5lYXIgb3ZlcmZsb3dpbmcgMzIg
Yml0cywgc28gd2UgY2FuIGp1c3QgdXNlCj4gYW4gb3JkaW5hcnkgMzIvMzIgZGl2aXNpb24sIHdo
aWNoIGlzIG11Y2ggY2hlYXBlciB0aGFuIHRoZSA2NC8zMiBkb25lCj4gdmlhIGRvX2RpdigpLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxlbW9l
cy5kaz4KClJldmlld2VkLWJ5OiBEYW5pZWwgVGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5h
cm8ub3JnPgoKPiAtLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L3B3bV9ibC5jCj4gaW5kZXggYmUzNmJlMWNhY2I3Li45MjUyZDUxZjMxYjkg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKPiArKysgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwo+IEBAIC0xNzcsNyArMTc3LDcgQEAgc3Rh
dGljIHU2NCBjaWUxOTMxKHVuc2lnbmVkIGludCBsaWdodG5lc3MsIHVuc2lnbmVkIGludCBzY2Fs
ZSkKPiAgCSAqLwo+ICAJbGlnaHRuZXNzICo9IDEwMDsKPiAgCWlmIChsaWdodG5lc3MgPD0gKDgg
KiBzY2FsZSkpIHsKPiAtCQlyZXR2YWwgPSBESVZfUk9VTkRfQ0xPU0VTVF9VTEwobGlnaHRuZXNz
ICogMTAsIDkwMzMpOwo+ICsJCXJldHZhbCA9IERJVl9ST1VORF9DTE9TRVNUKGxpZ2h0bmVzcyAq
IDEwLCA5MDMzKTsKPiAgCX0gZWxzZSB7Cj4gIAkJcmV0dmFsID0gaW50X3BvdygobGlnaHRuZXNz
ICsgKDE2ICogc2NhbGUpKSAvIDExNiwgMyk7Cj4gIAkJcmV0dmFsID0gRElWX1JPVU5EX0NMT1NF
U1RfVUxMKHJldHZhbCwgKHNjYWxlICogc2NhbGUpKTsKPiAtLSAKPiAyLjIwLjEKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
