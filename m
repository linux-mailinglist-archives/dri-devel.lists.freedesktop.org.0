Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BF34F2D2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 23:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A046E983;
	Tue, 30 Mar 2021 21:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CB06E981
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 21:12:14 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id d13so4888826lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dm71ZieA9ZB7ge1ol10am2Znew0nDw7ySgXhHMyKoWw=;
 b=P7FwY80scTh+AZuDelUQ2acmWIswjipAe8pTO/H2dqmCQspsjq74SbRQV0V6zPD5ke
 V3kgpBRJt3/+Kc1v2tRTZDMUtDTD2GmpM/QjFXnnvkvjiyYzaPVrGSPmZoORTtrDOCH9
 +f6HBQTQ/LBJ8YXVN9fluLfTdJLioIg0Fw2h6yEM1vLOE4aWDsnfdltqxyyhix5SEAdZ
 OmW0zLVAS4i+rgaM4SaD6GlIpNFtD2GaOwa5Vxs0Ha01P90ooyKRNZLHCJjvZvH0SwHr
 wFHbp0n9oCi3ffJckC0DwwJNZshrl5z0Ka94WQ/f6OS9TMuiQV/9m/jWuw8bANyR6dPC
 BJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dm71ZieA9ZB7ge1ol10am2Znew0nDw7ySgXhHMyKoWw=;
 b=N7n65iZUpXONeMRYs5Km69nWSTN+z87VNIXiaCBgywl2SKuaTmXNLTYPky5dSHiH/x
 e0GZfEeYmPa3X3wpslTRK12/TirZigmoxAJiLmZtYur6OLgKF0IIH6/fSm8VT/FN1B5N
 1PbNuFvkTuEXNQs/HA1jAngqCBxYnlJTAjDhYMgtnBDNdBQmpC9xjIeE2cj6sABk2DKY
 ISCvD6OHkcZWJTdiNSq6iN1FOU2prMlsZdP9naBrNcKgjUW/ygSL6QDU0RaT3S1ykfAa
 Blsaxk1qaAtNHaKnL+fYE+Sil74X+VblfIpZtnpQK9Sz94XIJaQuSVgtVVE098oMlAiE
 7UNA==
X-Gm-Message-State: AOAM533pW41EnjpgyrTfjjYeRW2MZm2nS283xkDk7635gdKbGvy5andy
 ksMuCL/htJHxG6UbGXKker99S+OXtrM=
X-Google-Smtp-Source: ABdhPJwsyeB5bJNOdZS1Hb5dmfPxDSLYKAprsDi3pNdEkKJdc7WQaCda6Sr1xo57jfEbsZkk8JQiFw==
X-Received: by 2002:a05:6512:38d0:: with SMTP id
 p16mr57132lft.208.1617138732563; 
 Tue, 30 Mar 2021 14:12:12 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-98.dynamic.spd-mgts.ru.
 [109.252.193.98])
 by smtp.googlemail.com with ESMTPSA id j8sm2924589lji.8.2021.03.30.14.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 14:12:12 -0700 (PDT)
Subject: Re: [PATCH v6 05/10] gpu: host1x: Use HW-equivalent syncpoint
 expiration check
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
References: <20210329133836.2115236-1-mperttunen@nvidia.com>
 <20210329133836.2115236-6-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <61e24311-7b61-64af-e7ee-61e5aa776bab@gmail.com>
Date: Wed, 31 Mar 2021 00:12:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210329133836.2115236-6-mperttunen@nvidia.com>
Content-Language: en-US
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjkuMDMuMjAyMSAxNjozOCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gTWFrZSBzeW5j
cG9pbnQgZXhwaXJhdGlvbiBjaGVja3MgYWx3YXlzIHVzZSB0aGUgc2FtZSBsb2dpYyB1c2VkIGJ5
Cj4gdGhlIGhhcmR3YXJlLiBUaGlzIGVuc3VyZXMgdGhhdCB0aGVyZSBhcmUgbm8gcmFjZSBjb25k
aXRpb25zIHRoYXQKPiBjb3VsZCBvY2N1ciBiZWNhdXNlIG9mIHRoZSBoYXJkd2FyZSB0cmlnZ2Vy
aW5nIGEgc3luY3BvaW50IGludGVycnVwdAo+IGFuZCB0aGVuIHRoZSBkcml2ZXIgZGlzYWdyZWVp
bmcuCj4gCj4gT25lIHNpdHVhdGlvbiB3aGVyZSB0aGlzIGNvdWxkIG9jY3VyIGlzIGlmIGEgam9i
IGluY3JlbWVudGVkIGEKPiBzeW5jcG9pbnQgdG9vIG1hbnkgdGltZXMgLS0gdGhlbiB0aGUgaGFy
ZHdhcmUgd291bGQgdHJpZ2dlciBhbgo+IGludGVycnVwdCwgYnV0IHRoZSBkcml2ZXIgd291bGQg
YXNzdW1lIHRoYXQgYSBzeW5jcG9pbnQgdmFsdWUKPiBncmVhdGVyIHRoYW4gdGhlIHN5bmNwb2lu
dCdzIG1heCB2YWx1ZSBpcyBpbiB0aGUgZnV0dXJlLCBhbmQgbm90Cj4gY2xlYW4gdXAgdGhlIGpv
Yi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtrbyBQZXJ0dHVuZW4gPG1wZXJ0dHVuZW5AbnZpZGlh
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvaG9zdDF4L3N5bmNwdC5jIHwgNTEgKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCA0OSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9z
dDF4L3N5bmNwdC5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L3N5bmNwdC5jCj4gaW5kZXggZjA2MWRm
ZDViYmM3Li44ZGE0YmJjZThiOWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvaG9zdDF4L3N5
bmNwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvaG9zdDF4L3N5bmNwdC5jCj4gQEAgLTMyMSw1OSAr
MzIxLDEyIEBAIEVYUE9SVF9TWU1CT0woaG9zdDF4X3N5bmNwdF93YWl0KTsKPiAgYm9vbCBob3N0
MXhfc3luY3B0X2lzX2V4cGlyZWQoc3RydWN0IGhvc3QxeF9zeW5jcHQgKnNwLCB1MzIgdGhyZXNo
KQo+ICB7Cj4gIAl1MzIgY3VycmVudF92YWw7Cj4gLQl1MzIgZnV0dXJlX3ZhbDsKPiAgCj4gIAlz
bXBfcm1iKCk7Cj4gIAo+ICAJY3VycmVudF92YWwgPSAodTMyKWF0b21pY19yZWFkKCZzcC0+bWlu
X3ZhbCk7Cj4gLQlmdXR1cmVfdmFsID0gKHUzMilhdG9taWNfcmVhZCgmc3AtPm1heF92YWwpOwo+
IC0KPiAtCS8qIE5vdGUgdGhlIHVzZSBvZiB1bnNpZ25lZCBhcml0aG1ldGljIGhlcmUgKG1vZCAx
PDwzMikuCj4gLQkgKgo+IC0JICogYyA9IGN1cnJlbnRfdmFsID0gbWluX3ZhbAk9IHRoZSBjdXJy
ZW50IHZhbHVlIG9mIHRoZSBzeW5jcG9pbnQuCj4gLQkgKiB0ID0gdGhyZXNoCQkJPSB0aGUgdmFs
dWUgd2UgYXJlIGNoZWNraW5nCj4gLQkgKiBmID0gZnV0dXJlX3ZhbCAgPSBtYXhfdmFsCT0gdGhl
IHZhbHVlIGMgd2lsbCByZWFjaCB3aGVuIGFsbAo+IC0JICoJCQkJICBvdXRzdGFuZGluZyBpbmNy
ZW1lbnRzIGhhdmUgY29tcGxldGVkLgo+IC0JICoKPiAtCSAqIE5vdGUgdGhhdCBjIGFsd2F5cyBj
aGFzZXMgZiB1bnRpbCBpdCByZWFjaGVzIGYuCj4gLQkgKgo+IC0JICogRHRmID0gKGYgLSB0KQo+
IC0JICogRHRjID0gKGMgLSB0KQo+IC0JICoKPiAtCSAqICBDb25zaWRlciBhbGwgY2FzZXM6Cj4g
LQkgKgo+IC0JICoJQSkgLi4uLi5jLi50Li5mLi4uLi4JRHRmIDwgRHRjCW5lZWQgdG8gd2FpdAo+
IC0JICoJQikgLi4uLi5jLi4uLi5mLi50Li4JRHRmID4gRHRjCWV4cGlyZWQKPiAtCSAqCUMpIC4u
dC4uYy4uLi4uZi4uLi4uCUR0ZiA+IER0YwlleHBpcmVkCSAgIChEY3QgdmVyeSBsYXJnZSkKPiAt
CSAqCj4gLQkgKiAgQW55IGNhc2Ugd2hlcmUgZj09YzogYWx3YXlzIGV4cGlyZWQgKGZvciBhbnkg
dCkuCUR0ZiA9PSBEY2YKPiAtCSAqICBBbnkgY2FzZSB3aGVyZSB0PT1jOiBhbHdheXMgZXhwaXJl
ZCAoZm9yIGFueSBmKS4JRHRmID49IER0YyAoYmVjYXVzZSBEdGM9PTApCj4gLQkgKiAgQW55IGNh
c2Ugd2hlcmUgdD09ZiE9YzogYWx3YXlzIHdhaXQuCQlEdGYgPCAgRHRjIChiZWNhdXNlIER0Zj09
MCwKPiAtCSAqCQkJCQkJCUR0YyE9MCkKPiAtCSAqCj4gLQkgKiAgT3RoZXIgY2FzZXM6Cj4gLQkg
Kgo+IC0JICoJQSkgLi4uLi50Li5mLi5jLi4uLi4JRHRmIDwgRHRjCW5lZWQgdG8gd2FpdAo+IC0J
ICoJQSkgLi4uLi5mLi5jLi50Li4uLi4JRHRmIDwgRHRjCW5lZWQgdG8gd2FpdAo+IC0JICoJQSkg
Li4uLi5mLi50Li5jLi4uLi4JRHRmID4gRHRjCWV4cGlyZWQKPiAtCSAqCj4gLQkgKiAgIFNvOgo+
IC0JICoJICAgRHRmID49IER0YyBpbXBsaWVzIEVYUElSRUQJKHJldHVybiB0cnVlKQo+IC0JICoJ
ICAgRHRmIDwgIER0YyBpbXBsaWVzIFdBSVQJKHJldHVybiBmYWxzZSkKPiAtCSAqCj4gLQkgKiBO
b3RlOiBJZiB0IGlzIGV4cGlyZWQgdGhlbiB3ZSAqY2Fubm90KiB3YWl0IG9uIGl0LiBXZSB3b3Vs
ZCB3YWl0Cj4gLQkgKiBmb3JldmVyIChoYW5nIHRoZSBzeXN0ZW0pLgo+IC0JICoKPiAtCSAqIE5v
dGU6IGRvIE5PVCBnZXQgY2xldmVyIGFuZCByZW1vdmUgdGhlIC10aHJlc2ggZnJvbSBib3RoIHNp
ZGVzLiBJdAo+IC0JICogaXMgTk9UIHRoZSBzYW1lLgo+IC0JICoKPiAtCSAqIElmIGZ1dHVyZSB2
YWx1ZWlzIHplcm8sIHdlIGhhdmUgYSBjbGllbnQgbWFuYWdlZCBzeW5jIHBvaW50LiBJbiB0aGF0
Cj4gLQkgKiBjYXNlIHdlIGRvIGEgZGlyZWN0IGNvbXBhcmlzb24uCj4gLQkgKi8KPiAtCWlmICgh
aG9zdDF4X3N5bmNwdF9jbGllbnRfbWFuYWdlZChzcCkpCj4gLQkJcmV0dXJuIGZ1dHVyZV92YWwg
LSB0aHJlc2ggPj0gY3VycmVudF92YWwgLSB0aHJlc2g7Cj4gLQllbHNlCj4gLQkJcmV0dXJuIChz
MzIpKGN1cnJlbnRfdmFsIC0gdGhyZXNoKSA+PSAwOwo+ICsKPiArCXJldHVybiAoKGN1cnJlbnRf
dmFsIC0gdGhyZXNoKSAmIDB4ODAwMDAwMDBVKSA9PSAwVTsKPiAgfQo+ICAKPiAgaW50IGhvc3Qx
eF9zeW5jcHRfaW5pdChzdHJ1Y3QgaG9zdDF4ICpob3N0KQo+IAoKVGVzdGVkLWJ5OiBEbWl0cnkg
T3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
