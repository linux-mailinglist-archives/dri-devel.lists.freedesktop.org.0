Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C063B8E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 21:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE8C6E09C;
	Tue,  9 Jul 2019 19:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3CB6E094
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2019 19:00:19 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id a93so10566391pla.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2019 12:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7VTnoQhILwKHLps+gGfkisxkuSKBxEyo68mEBQUHAaY=;
 b=M9IaHS2PzQujHKp0gHfRU95R4i068TVh4UhlKzM0EzVfnQ984AjGuKNBNmxCdonWne
 B6HF3Pbty91FxWtmGtBC7f9c8QbiaOabiW1SPTkDn0DANgPqeq15F9zwnCBOL1voISkG
 XsiSMuPH0LKCcKVxsY8kVweexAXn8pXS4q6EcftGz6G9eaCIfEPgLqOHQSZR5q3Q1+dy
 /ldBgNjz53stg1eP/0TjBSGVE9FSneaMGu8W/PzXYN4skz6U8xcdSaYWoiQ1dgc3ivvb
 5G1HCDfw9pLEYaeEPywGC67TdV3PRGd2gJg/2Q9bmRpGzeckxDIIiPnz8FXn2mI3KVyP
 Dvhw==
X-Gm-Message-State: APjAAAWtVlifvXM/pzNqqt6DO4YXx4I9eVBpY9Ma9O/AgdIFHis49j+B
 KGTFjgpNAYcx+8z5V63tNMOH+w==
X-Google-Smtp-Source: APXvYqyFxcn+t9rWGoWrMrwk7IGCCiVhSunnF0u4fJQLec9Z7/8us2QIzzEsGo2V3Ixk/lZr9QooRQ==
X-Received: by 2002:a17:902:29e6:: with SMTP id
 h93mr32447140plb.297.1562698818959; 
 Tue, 09 Jul 2019 12:00:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
 by smtp.gmail.com with ESMTPSA id v63sm8391683pfv.174.2019.07.09.12.00.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 12:00:18 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v3 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Date: Tue,  9 Jul 2019 12:00:07 -0700
Message-Id: <20190709190007.91260-5-mka@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190709190007.91260-1-mka@chromium.org>
References: <20190709190007.91260-1-mka@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7VTnoQhILwKHLps+gGfkisxkuSKBxEyo68mEBQUHAaY=;
 b=kfV/7/kvbkaJ7UsIzdsFDRlAMdzpK6L6mf+hCSJgo/ppqnLdG493pA1TwsgBo8gqI+
 4m8IhLpUYafypQV62VutcuQ/xBvf5+Qfw9xSrUk4r15c6IIY+l2X2T26Z72GsIoqOOBe
 J11qlTxGksNKv6aSrfL+fr+Nca1CmutGbOxRA=
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
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hlY2sgaWYgYSBicmlnaHRuZXNzIGN1cnZlIHNwZWNpZmllZCBpbiB0aGUgZGV2aWNlIHRyZWUg
aXMgbGluZWFyIG9yCm5vdCBhbmQgc2V0IHRoZSBjb3JyZXNwb25kaW5nIHByb3BlcnR5IGFjY29y
ZGluZ2x5LiBUaGlzIG1ha2VzIHRoZQpzY2FsZSB0eXBlIGF2YWlsYWJsZSB0byB1c2Vyc3BhY2Ug
dmlhIHRoZSAnc2NhbGUnIHN5c2ZzIGF0dHJpYnV0ZS4KClRvIGRldGVybWluZSBpZiBhIGN1cnZl
IGlzIGxpbmVhciBpdCBpcyBjb21wYXJlZCB0byBhIGludGVycG9sYXRlZCBsaW5lYXIKY3VydmUg
YmV0d2VlbiBtaW4gYW5kIG1heCBicmlnaHRuZXNzLiBUaGUgY3VydmUgaXMgY29uc2lkZXJlZCBs
aW5lYXIgaWYKbm8gdmFsdWUgZGV2aWF0ZXMgbW9yZSB0aGFuICsvLTUlIG9mICR7YnJpZ2h0bmVz
c19yYW5nZX0gZnJvbSB0aGVpcgppbnRlcnBvbGF0ZWQgdmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KQWNrZWQtYnk6IERhbmllbCBUaG9t
cHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VzIGluIHYzOgotIG5v
bmUKCkNoYW5nZXMgaW4gdjI6Ci0gdXNlIDEyOCAocG93ZXIgb2YgdHdvKSBpbnN0ZWFkIG9mIDEw
MCBhcyBmYWN0b3IgZm9yIHRoZSBzbG9wZQotIGFkZCBjb21tZW50IGFib3V0IG1heCBxdWFudGl6
YXRpb24gZXJyb3IKLSBhZGRlZCBEYW5pZWwncyAnQWNrZWQtYnknIHRhZwotLS0KIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdt
X2JsLmMKaW5kZXggN2M2ZGZjNGE2MDFkLi5mZWY5OGJlYjhiN2UgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0
L3B3bV9ibC5jCkBAIC00MDQsNiArNDA0LDMxIEBAIGludCBwd21fYmFja2xpZ2h0X2JyaWdodG5l
c3NfZGVmYXVsdChzdHJ1Y3QgZGV2aWNlICpkZXYsCiB9CiAjZW5kaWYKIAorc3RhdGljIGJvb2wg
cHdtX2JhY2tsaWdodF9pc19saW5lYXIoc3RydWN0IHBsYXRmb3JtX3B3bV9iYWNrbGlnaHRfZGF0
YSAqZGF0YSkKK3sKKwl1bnNpZ25lZCBpbnQgbmxldmVscyA9IGRhdGEtPm1heF9icmlnaHRuZXNz
ICsgMTsKKwl1bnNpZ25lZCBpbnQgbWluX3ZhbCA9IGRhdGEtPmxldmVsc1swXTsKKwl1bnNpZ25l
ZCBpbnQgbWF4X3ZhbCA9IGRhdGEtPmxldmVsc1tubGV2ZWxzIC0gMV07CisJLyoKKwkgKiBNdWx0
aXBseWluZyBieSAxMjggbWVhbnMgdGhhdCBldmVuIGluIHBhdGhvbG9naWNhbCBjYXNlcyBzdWNo
CisJICogYXMgKG1heF92YWwgLSBtaW5fdmFsKSA9PSBubGV2ZWxzIHRoZSBlcnJvciBhdCBtYXhf
dmFsIGlzIGxlc3MKKwkgKiB0aGFuIDElLgorCSAqLworCXVuc2lnbmVkIGludCBzbG9wZSA9ICgx
MjggKiAobWF4X3ZhbCAtIG1pbl92YWwpKSAvIG5sZXZlbHM7CisJdW5zaWduZWQgaW50IG1hcmdp
biA9IChtYXhfdmFsIC0gbWluX3ZhbCkgLyAyMDsgLyogNSUgKi8KKwlpbnQgaTsKKworCWZvciAo
aSA9IDE7IGkgPCBubGV2ZWxzOyBpKyspIHsKKwkJdW5zaWduZWQgaW50IGxpbmVhcl92YWx1ZSA9
IG1pbl92YWwgKyAoKGkgKiBzbG9wZSkgLyAxMjgpOworCQl1bnNpZ25lZCBpbnQgZGVsdGEgPSBh
YnMobGluZWFyX3ZhbHVlIC0gZGF0YS0+bGV2ZWxzW2ldKTsKKworCQlpZiAoZGVsdGEgPiBtYXJn
aW4pCisJCQlyZXR1cm4gZmFsc2U7CisJfQorCisJcmV0dXJuIHRydWU7Cit9CisKIHN0YXRpYyBp
bnQgcHdtX2JhY2tsaWdodF9pbml0aWFsX3Bvd2VyX3N0YXRlKGNvbnN0IHN0cnVjdCBwd21fYmxf
ZGF0YSAqcGIpCiB7CiAJc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gcGItPmRldi0+b2Zfbm9k
ZTsKQEAgLTU2Nyw2ICs1OTIsMTEgQEAgc3RhdGljIGludCBwd21fYmFja2xpZ2h0X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAkJCXBiLT5sZXZlbHMgPSBkYXRhLT5sZXZl
bHM7CiAJCX0KKworCQlpZiAocHdtX2JhY2tsaWdodF9pc19saW5lYXIoZGF0YSkpCisJCQlwcm9w
cy5zY2FsZSA9IEJBQ0tMSUdIVF9TQ0FMRV9MSU5FQVI7CisJCWVsc2UKKwkJCXByb3BzLnNjYWxl
ID0gQkFDS0xJR0hUX1NDQUxFX05PTl9MSU5FQVI7CiAJfSBlbHNlIGlmICghZGF0YS0+bWF4X2Jy
aWdodG5lc3MpIHsKIAkJLyoKIAkJICogSWYgbm8gYnJpZ2h0bmVzcyBsZXZlbHMgYXJlIHByb3Zp
ZGVkIGFuZCBtYXhfYnJpZ2h0bmVzcyBpcwotLSAKMi4yMi4wLjQxMC5nZDhmZGJlMjFiNS1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
