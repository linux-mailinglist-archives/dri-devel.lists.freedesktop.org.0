Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42976CE0FD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 13:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891F06E5BD;
	Mon,  7 Oct 2019 11:57:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94BD6E5BD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 11:57:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id b24so11998697wmj.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 04:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=B0q2SXnY7pAxin67ut4lnZBcx7ln61mIYC68maemLHk=;
 b=sqBwrxHAtpQREfQmtqvpADGOBHUSHK9t4HXT8tWKIOv66suAbCaVD5ftBx3apWrxCU
 2ocr3Sc919q+bDKTQNQMjH/lgyzLPbZdjSUBNBMtgx1cFwKPYL86BOm2bMVeuy/TrhU1
 HUypLYq/HEatWxQmR13R28BnhffK+lGKPeAGnZov47OUg79pZI/f58lzE4ZpWm3cQImP
 wShqwHK9jobPfTTC3gc4qYBD+gr3QUWoUbrXCupDpKaMNLdRSrQ8vuRzugwxM6GZL/fA
 DSf1JgfPPd3O7HtXD4YPjZROHpSkQENy0DFxZzq0xHgS8IMVjh2/+QLCQTGTRg0ZoWFI
 L0Lg==
X-Gm-Message-State: APjAAAUwcK66GxJSTAQC/BGLHT2aAaKZvDIW9j91ycxyiS6tFXFnA+Vh
 GHbxaUXSCXJZK/vdlpTdbAwlYg==
X-Google-Smtp-Source: APXvYqyVfjnxAijw5tnWnJhbAh1DjXRsxqUt+4mtnh/TiJHJrIrqGcypYsybS4IyumRlrkVVJ8FLQA==
X-Received: by 2002:a05:600c:248a:: with SMTP id
 10mr20199658wms.97.1570449474109; 
 Mon, 07 Oct 2019 04:57:54 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm24800791wmf.48.2019.10.07.04.57.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 04:57:53 -0700 (PDT)
Subject: Re: [PATCH v2 RESEND] drm/bridge: dw-hdmi: Restore audio when setting
 a mode
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20191003041438.194224-1-cychiang@chromium.org>
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
Message-ID: <b8ad03db-b93f-44e0-ccd6-fc8bda1af223@baylibre.com>
Date: Mon, 7 Oct 2019 13:57:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003041438.194224-1-cychiang@chromium.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=B0q2SXnY7pAxin67ut4lnZBcx7ln61mIYC68maemLHk=;
 b=rjkLkkBfq1GZvIV/uQvsk9JV2Zz1kiFmG1dxKOGmb0SVH5v84yHVq5twm54lHwGPMq
 ypsFVEtkSTOlVNOiigDAFh+WRwAOZB0hnKoIjIItLgTVeT86p1cthIvvmPIR7TEJqlpy
 YIAFzqVZqCblpE/ZHnXWV8DZ1KSJcuGGf6WzKk8Q7B1KSLpFoXO46NdkKXsAkSo7r20l
 fX2Ou7tURT/zOJjDJdrXXV03fIIpIUHO5l9WUCNZjpbRJ8Ynw0RojjQPEj7zf5WVmNZf
 aelNT5a45miFk3f2r635jaq83jCp1CH/AufihsdtzDNjqiLaIK/g05jDDzM9ei1Xsu/n
 DiwA==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, tzungbi@chromium.org,
 alsa-devel@alsa-project.org, Jonas Karlman <jonas@kwiboo.se>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Yakir Yang <ykk@rock-chips.com>,
 dgreid@chromium.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAwMy8xMC8yMDE5IDA2OjE0LCBDaGVuZy1ZaSBDaGlhbmcgd3JvdGU6Cj4gRnJvbTog
RGFuaWVsIEt1cnR6IDxkamt1cnR6QGNocm9taXVtLm9yZz4KPiAKPiBXaGVuIHNldHRpbmcgYSBu
ZXcgZGlzcGxheSBtb2RlLCBkd19oZG1pX3NldHVwKCkgY2FsbHMKPiBkd19oZG1pX2VuYWJsZV92
aWRlb19wYXRoKCksIHdoaWNoIGRpc2FibGVzIGFsbCBoZG1pIGNsb2NrcywgaW5jbHVkaW5nCj4g
dGhlIGF1ZGlvIGNsb2NrLgo+IAo+IFdlIHNob3VsZCBvbmx5IChyZS0pZW5hYmxlIHRoZSBhdWRp
byBjbG9jayBpZiBhdWRpbyB3YXMgYWxyZWFkeSBlbmFibGVkCj4gd2hlbiBzZXR0aW5nIHRoZSBu
ZXcgbW9kZS4KPiAKPiBXaXRob3V0IHRoaXMgcGF0Y2gsIG9uIFJLMzI4OCwgdGhlcmUgd2lsbCBi
ZSBIRE1JIGF1ZGlvIG9uIHNvbWUgbW9uaXRvcnMKPiBpZiBpMnMgd2FzIHBsYXllZCB0byBoZWFk
cGhvbmUgd2hlbiB0aGUgbW9uaXRvciB3YXMgcGx1Z2dlZC4KPiBBQ0VSIEgyNzdIVSBhbmQgQVNV
UyBQQjI3OCBhcmUgdHdvIG9mIHRoZSBtb25pdG9ycyBzaG93aW5nIHRoaXMgaXNzdWUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIEt1cnR6IDxkamt1cnR6QGNocm9taXVtLm9yZz4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZYWtpciBZYW5nIDx5a2tAcm9jay1jaGlwcy5jb20+Cj4gLS0tCj4gIENoYW5n
ZSBmcm9tIHYxIHRvIHYyOgo+ICAgLSBVc2UgYXVkaW9fbG9jayB0byBwcm90ZWN0IGF1ZGlvIGNs
b2NrLgo+ICAgLSBGaXggdGhlIHBhdGNoIHRpdGxlLgo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyB8IDEzICsrKysrKysrKysrKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IGluZGV4IGFhN2VmZDRkYTFjOC4uNzQ5ZDhlNGM1
MzViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiBA
QCAtMTk4Miw2ICsxOTgyLDE3IEBAIHN0YXRpYyB2b2lkIGhkbWlfZGlzYWJsZV9vdmVyZmxvd19p
bnRlcnJ1cHRzKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+ICAJCSAgICBIRE1JX0lIX01VVEVfRkNf
U1RBVDIpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgdm9pZCBkd19oZG1pX2F1ZGlvX3Jlc3RvcmUoc3Ry
dWN0IGR3X2hkbWkgKmhkbWkpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gKwo+ICsJ
c3Bpbl9sb2NrX2lycXNhdmUoJmhkbWktPmF1ZGlvX2xvY2ssIGZsYWdzKTsKPiArCj4gKwloZG1p
X2VuYWJsZV9hdWRpb19jbGsoaGRtaSwgaGRtaS0+YXVkaW9fZW5hYmxlKTsKPiArCj4gKwlzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCZoZG1pLT5hdWRpb19sb2NrLCBmbGFncyk7CgpEdW1iIHF1ZXN0
aW9uLCB3aHkgaXMgdGhpcyBwcm90ZWN0ZWQgYnkgYSBzcGlubG9jayA/CgpOZWlsCgo+ICt9Cj4g
Kwo+ICBzdGF0aWMgaW50IGR3X2hkbWlfc2V0dXAoc3RydWN0IGR3X2hkbWkgKmhkbWksIHN0cnVj
dCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+ICB7Cj4gIAlpbnQgcmV0Owo+IEBAIC0yMDQ1LDcg
KzIwNTYsNyBAQCBzdGF0aWMgaW50IGR3X2hkbWlfc2V0dXAoc3RydWN0IGR3X2hkbWkgKmhkbWks
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQo+ICAKPiAgCQkvKiBIRE1JIEluaXRpYWxp
emF0aW9uIFN0ZXAgRSAtIENvbmZpZ3VyZSBhdWRpbyAqLwo+ICAJCWhkbWlfY2xrX3JlZ2VuZXJh
dG9yX3VwZGF0ZV9waXhlbF9jbG9jayhoZG1pKTsKPiAtCQloZG1pX2VuYWJsZV9hdWRpb19jbGso
aGRtaSwgdHJ1ZSk7Cj4gKwkJZHdfaGRtaV9hdWRpb19yZXN0b3JlKGhkbWkpOwo+ICAJfQo+ICAK
PiAgCS8qIG5vdCBmb3IgRFZJIG1vZGUgKi8KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
