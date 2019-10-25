Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6E0E4F34
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 16:34:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A0B6EA68;
	Fri, 25 Oct 2019 14:34:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BA66EA65
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 14:34:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so2582296wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 07:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PSJcWS8MY8EL3puEKrmMoYVqTBtFXBm5zLBgjZiVVdM=;
 b=H8/7prbRTxs9Pa9RVRMEpsSagozvLFlNjvH9d4qOPo7zszzsMKr51/fAF7kcbE6Oh3
 jx8QEN5hFpLSCXyVJVCCDn9HHcKpBkB4YjDHMdZyXE3MvLYPfeiGARqOjxpUbNMReiG5
 9zKfZeg/VMn0JkqGPzecLjdEHVdhCweX3HiuPXLEKqB9iJfz2KODDkxVfq6tJAwGZ74l
 bUqz+bZ+Pr8vzSnwy4dJmnQb2cOwnOEjIBT/ND87Fysm8pNOXBYY9rGdVjIlu1nsINqr
 8Bf2cIHZ6/6q3zvQJg5BRq+J9kjCdkSN0G6QXFIIudJE74TnmFJDWk8iKtgi99jQRhRM
 8JtQ==
X-Gm-Message-State: APjAAAX2uc7xYp8vNGR2w4iHIy+IfF5ZDsy2awjav0yfWCUNHucE+MF6
 qIlinFp2CwmwGqb+nWAQZEINZw==
X-Google-Smtp-Source: APXvYqwb8ueTYwnm7OD4vphE9tlyWgULIFgnD04KbqNixWbJKW3i1EX1ZL6mxrvFInQubKTQ6u29tw==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr3234612wrj.250.1572014048530; 
 Fri, 25 Oct 2019 07:34:08 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 q11sm2190568wmq.21.2019.10.25.07.34.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Oct 2019 07:34:07 -0700 (PDT)
Subject: Re: [PATCH v3 13/21] drm/bridge: Add the
 drm_bridge_chain_get_prev_bridge() helper
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-14-boris.brezillon@collabora.com>
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
Message-ID: <f1f3f76b-a488-2de2-385d-ab49f2da5cf8@baylibre.com>
Date: Fri, 25 Oct 2019 16:34:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023154512.9762-14-boris.brezillon@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PSJcWS8MY8EL3puEKrmMoYVqTBtFXBm5zLBgjZiVVdM=;
 b=oZOYCpyl/y8RmdCapgfhWm6vZXljkJ2n4Rk4elo97IroVvdJh+h85Dbk1qGHMmAOVz
 qBbbuCrCeFvVdon5eu4gc9PtnjBHgRoc5uRWZYUBSSOiPyTvTx00T7B19GNebnjyvvuT
 rYmsagx0lUjDjSC1fwHTfmvcHONjiXd/o0ihoIkkN8CaM1AStRtsvW23PeMxTRYQWvC7
 pRwfYLMoJusVaQjB1JRUjS4Z7y3b1Didu24FxRWMWkOEg31HdqQDJQTZdsq0fTaFYq4C
 QcXTHjR5G/Cmc015d92q254cpvGc6W+tScdU8qT7rxxxfFlUOX9qEYeXLPZZqXCCwyrX
 FLLg==
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMTAvMjAxOSAxNzo0NSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IFdpbGwgYmUgdXNl
ZnVsIGZvciBicmlkZ2UgZHJpdmVycyB0aGF0IHdhbnQgdG8gZG8gYnVzIGZvcm1hdAo+IG5lZ290
aWF0aW9uIHdpdGggdGhlaXIgbmVpZ2hib3Vycy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCb3JpcyBC
cmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+IENoYW5nZXMg
aW4gdjM6Cj4gKiBJbmxpbmUgZHJtX2JyaWRnZV9jaGFpbl9nZXRfcHJldl9icmlkZ2UoKQo+ICog
Rml4IHRoZSBkb2MKPiAKPiBDaGFuZ2VzIGluIHYyOgo+ICogRml4IHRoZSBrZXJuZWxkb2MKPiAq
IERyb3AgdGhlICFicmlkZ2UgfHwgIWJyaWRnZS0+ZW5jb2RlciBjaGVjawo+IC0tLQo+ICBpbmNs
dWRlL2RybS9kcm1fYnJpZGdlLmggfCAxNiArKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9i
cmlkZ2UuaCBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+IGluZGV4IDJiZWIxZWY5YTczMy4u
M2ZiNTE4NDk0NjQwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+ICsr
KyBiL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaAo+IEBAIC01MjYsNiArNTI2LDIyIEBAIGRybV9i
cmlkZ2VfY2hhaW5fZ2V0X25leHRfYnJpZGdlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCj4g
IAlyZXR1cm4gbGlzdF9uZXh0X2VudHJ5KGJyaWRnZSwgY2hhaW5fbm9kZSk7Cj4gIH0KPiAgCj4g
Ky8qKgo+ICsgKiBkcm1fYnJpZGdlX2NoYWluX2dldF9wcmV2X2JyaWRnZSgpIC0gR2V0IHRoZSBw
cmV2aW91cyBicmlkZ2UgaW4gdGhlIGNoYWluCj4gKyAqIEBicmlkZ2U6IGJyaWRnZSBvYmplY3QK
PiArICoKPiArICogUkVUVVJOUzoKPiArICogdGhlIHByZXZpb3VzIGJyaWRnZSBpbiB0aGUgY2hh
aW4sIG9yIE5VTEwgaWYgQGJyaWRnZSBpcyB0aGUgZmlyc3QuCj4gKyAqLwo+ICtzdGF0aWMgaW5s
aW5lIHN0cnVjdCBkcm1fYnJpZGdlICoKPiArZHJtX2JyaWRnZV9jaGFpbl9nZXRfcHJldl9icmlk
Z2Uoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiArewo+ICsJaWYgKGxpc3RfaXNfZmlyc3Qo
JmJyaWRnZS0+Y2hhaW5fbm9kZSwgJmJyaWRnZS0+ZW5jb2Rlci0+YnJpZGdlX2NoYWluKSkKPiAr
CQlyZXR1cm4gTlVMTDsKPiArCj4gKwlyZXR1cm4gbGlzdF9wcmV2X2VudHJ5KGJyaWRnZSwgY2hh
aW5fbm9kZSk7Cj4gK30KPiArCj4gIC8qKgo+ICAgKiBkcm1fYnJpZGdlX2NoYWluX2dldF9maXJz
dF9icmlkZ2UoKSAtIEdldCB0aGUgZmlyc3QgYnJpZGdlIGluIHRoZSBjaGFpbgo+ICAgKiBAZW5j
b2RlcjogZW5jb2RlciBvYmplY3QKPiAKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFy
bXN0cm9uZ0BiYXlsaWJyZS5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
