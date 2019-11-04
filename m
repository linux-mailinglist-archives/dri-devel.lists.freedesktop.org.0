Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B81EE423
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B770C6E5CF;
	Mon,  4 Nov 2019 15:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0CB6E5CD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 15:46:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q13so17653878wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 07:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GcYuPs1cNrrP4kTbD7o/yf87/Vd3ph8WcfwcPZc9pRc=;
 b=PdoZf6WU/+10+gkcf/IdM/VLx9QiL/UI+6mDL/54UFl/SU1/T704c3z5InQLOR3+IJ
 nP66VZPPTyl9vP1cfCMR1uXvFdSJCIHgG6ga/CXHjd6NvXzTXoSb9DjcKcMjFvIqaSuW
 ZfZSiLFpMtV00QMIfXTb9Zi31/E6cZIEpAGtr711ch0taXsjETaMGe/5xdqLKCTweQQu
 gru5OgWcwPQnrqkSNdUy1DL8K1ZAXcCHwpJWC10IGDVtOrbNdkjrBPxfuD1BB58o5cxz
 DNQeGyocsAFZyBcNaya6a0Npo9ZeRHbs717P7evp3TsQrM02egCLeGqE2AqCRj+t5A1b
 a7Sg==
X-Gm-Message-State: APjAAAWtTP8o9uFb641sTi7YiuT2aC1JAQJSEjfvDS+qX0lz17zWDACF
 bCtbzh2XH3IgUMmv07TYvzt6sg==
X-Google-Smtp-Source: APXvYqxUQiqp7+jF6njQK2or7Uil2dOr133Khama4oVWlQf4wrnorykSfR1lTfV+gc2T7HfRX/v5zg==
X-Received: by 2002:adf:e8cf:: with SMTP id k15mr12603822wrn.256.1572882405948; 
 Mon, 04 Nov 2019 07:46:45 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id u21sm21354436wmu.27.2019.11.04.07.46.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Nov 2019 07:46:45 -0800 (PST)
Subject: Re: [PATCH 1/4] drm: bridge: dw_mipi_dsi: access registers via a
 regmap
To: Adrian Ratiu <adrian.ratiu@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org
References: <20191031142633.12460-1-adrian.ratiu@collabora.com>
 <20191031142633.12460-2-adrian.ratiu@collabora.com>
 <974be8e9-fcb4-4457-8831-40b2fa834ae2@baylibre.com>
 <87v9rz97bn.fsf@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3b3bbf68-a19e-77ea-7e7c-770f75a81a21@baylibre.com>
Date: Mon, 4 Nov 2019 16:46:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87v9rz97bn.fsf@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GcYuPs1cNrrP4kTbD7o/yf87/Vd3ph8WcfwcPZc9pRc=;
 b=Rg9NHtHURZKPJxkIfhuDYWOC0aC+Y72USxYEw0qVX/H/8jtKHh9JUbWAzLLXimFsSm
 VYAYvbZRVM60FIo0tzSKz/a9WS0gDqF4A7LnGh9QTQUUv8Xstk5bbYomRuj8lgkTmiDZ
 nt3bkJIXDfAGR+rLQeqBo0dmKhagP7CdYVmDlI2N3Ner4CfiBzM8APtm7J8vHrBfDoxu
 ZiN1L4VddnE+CBUxIvRjAMDMwQqrmofRSiX3Gjd0JHlyfzkiK5FfGh6LomAMIp2/VI33
 5m7vappwWPuIAORc94EhNdbSUN50bljunqNbTyJREUx39Fq15DLzLtfLeebOyh7zPK1E
 vTQA==
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWRyaWFuLAoKT24gMDQvMTEvMjAxOSAxMzowMywgQWRyaWFuIFJhdGl1IHdyb3RlOgo+IE9u
IE1vbiwgMDQgTm92IDIwMTksIE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT4gd3JvdGU6Cj4+IE9uIDMxLzEwLzIwMTkgMTU6MjYsIEFkcmlhbiBSYXRpdSB3cm90ZToKPj4K
Pj4gT0sgZm9yIHRoZSBkdy1taXBpLWRzaSBjaGFuZ2VzLCBidXQgd2h5IHNob3VsZCB0aGUgZHdf
bWlwaV9kc2ktc3RtIGJlIGNoYW5nZWQgYXN3ZWxsID8KPj4gQUZBSUsgdGhlc2UgYXJlIGluZGVw
ZW5kZW50Lgo+IAo+IEkgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhleSBhcmUgaW5kZXBlbmRlbnQu
IElzbid0IHRoZSBzdG0gZHJpdmVyIGFsc28gdXNpbmcgdGhlIHNhbWUgZHctbWlwaS1kc2kgYnJp
ZGdlIGFzIHJvY2tjaGlwIGFuZCBub3cgaW14IHNpbmNlIGl0IHdhcyBmaXJzdCBhZGRlZCBpbiBj
b21taXQKPiBjMWMwMjZkYmMxODMgKCJkcm0vc3RtOiBBZGQgU1RNMzIgRFNJIGNvbnRyb2xsZXIg
ZHJpdmVyIikgPwo+IAo+IEkgZG9uJ3QgaGF2ZSB0aGUgaGFyZHdhcmUgdG8gdGVzdCB0aGUgc3Rt
IGRyaXZlciBvbiBhIGxpdmUgYm9vdCwgYnV0IGNvbXBpbGF0aW9uIGNlcnRhaW5seSBmYWlscyBp
ZiBJIGRvbid0IG1vZGlmeSBpdCA6KQoKSWdub3JlIG15IGNvbW1lbnQsIHRoaXMgcGF0Y2ggaXMg
ZmluZSwgcGxlYXNlIGtlZXA6ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+Cgp3aGVuIHJlc2VuZGluZy4KCk5laWwKCj4gCj4+Cj4+IE5laWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
