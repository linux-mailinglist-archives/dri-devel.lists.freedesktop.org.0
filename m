Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB248F6CAE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF966E825;
	Mon, 11 Nov 2019 02:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E0F6E226
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 17:01:14 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id t5so9460804ljk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Nov 2019 09:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YsEdvLSqshkQAKsr6hOPBmd5nkHl6aHOD1uqXbjxBps=;
 b=sK6Y17AnZoquyklBBc1Z56YwaVtdp/9evuuqssv+CUzkP6gVMXM0uFmae0WYwZOEH1
 6kmglGlP4NBpxvunaQSxK9Ea2LKtSKeoq30YV/+UzybmVNOgAXIOaRoJeINgOp8GE5A3
 FZGnR224Qb0qFzov6tBidHLzrMRg6YQQVhxEHDBJmNYj5q5iOpMffe04njUVna7xDFrE
 RouvKu9NE/sCl2/kjGrdALntngVQg/dL55Ff6zlGpj0oL2cGl8Goc7C/ZwB2ybEPJ000
 VirenVjwvV1iIT6ydZpDo+OPUI2Y3bD7cNuqfbF0BkOcYNqMgNh3kniSobiSzWN5u8VI
 5Z3w==
X-Gm-Message-State: APjAAAVItcsKdfiYbgW62dPUraVdxl4dYe9OoAVwc0dw8/RdCW5+A/G9
 3ZcnKfZDNrXmiSjAHEAsZe0=
X-Google-Smtp-Source: APXvYqyE/ix40hJWKggx9LGza4SIxbY2YL0VAbnM8y5of/UN4Kqt8hK8dapqqmS5eMVVL0XyTlfu5Q==
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr3225729ljj.56.1573318872490; 
 Sat, 09 Nov 2019 09:01:12 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id u27sm4069847lfl.34.2019.11.09.09.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Nov 2019 09:01:11 -0800 (PST)
Subject: Re: [PATCH v2] drm/tegra: Turn off and reset hardware across
 suspend-resume
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
References: <20190811183932.15850-1-digetx@gmail.com>
Message-ID: <4280db25-98cb-b47b-06c8-0666f364dea3@gmail.com>
Date: Sat, 9 Nov 2019 20:01:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20190811183932.15850-1-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YsEdvLSqshkQAKsr6hOPBmd5nkHl6aHOD1uqXbjxBps=;
 b=I8Gl2ifBFWfJa9BHh/OMpGqvpjGAvjkKvzGZXl2wGEjzByDTV9+oVfqGX+n7e/h5Vx
 5v+C5gqGK/Ux1wHWk9/UJxx9Y82hE287cxPSeT8va0780dpZY2gGPzydvg7MO5fYY2Oh
 kLd3KHBZBB/1tfYKDqwN0gFEsJp7xf2+cwfWDoajhIcOOU5SC/pUDJaIFwCgw/RIrR5l
 SyDpPQ5k0o8lsPn1jQGd+ABar8AF/rNnBZDHzHo1ZI/ORdO51LXW1Mgx2hr2Tp7Eo9Vm
 1Kcak02my7uDQsxsGUUAwF568E+y1KHEecZYVoyykE5pU+i4bDUlWyhyHCXkful8sA/z
 m1pQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMDguMjAxOSAyMTozOSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gVGhlIGRyaXZl
cnMgY29yZSBidW1wcyBydW50aW1lIFBNIHJlZmNvdW50IGR1cmluZyBvZiBlbnRlcmluZyBpbnRv
Cj4gc3VzcGVuZCB0byB3b3JrYXJvdW5kIHNvbWUgcHJvYmxlbSB3aGVyZSBwYXJlbnQgZGV2aWNl
IG1heSBiZWNvbWUgdHVybmVkCj4gb2ZmIGJlZm9yZSBpdHMgY2hpbGRyZW4uIEluIG9yZGVyIHRv
IGRpc2FibGUgYW5kIHJlc2V0IENSVENzL0hETUkvZXRjCj4gaGFyZHdhcmUsIHRoZSBydW50aW1l
IFBNIG5lZWRzIHRvIGJlICJmb3JjZWQiIGludG8gc3VzcGVuZCBtb2RlLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPiAtLS0KCkhlbGxvIFRo
aWVycnksCgpJcyB0aGVyZSBhbnkgcGFydGljdWxhciByZWFzb24gd2h5IHlvdSdyZSBza2lwcGlu
ZyB0aGlzIHBhdGNoPwpUaGUgZHJpdmVyJ3Mgc3VzcGVuZC1yZXN1bWUgZG9lc24ndCB3b3JrIHBy
b3Blcmx5IHdpdGhvdXQgaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
