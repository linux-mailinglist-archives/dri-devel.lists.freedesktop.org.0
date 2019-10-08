Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A936CF42D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997376E0C6;
	Tue,  8 Oct 2019 07:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333286E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:48:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o18so18087468wrv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 00:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QF+MCcIV1ioc5xu/kdZzoZqX+5uryu1YOTjuH3YAzmA=;
 b=kZEf1BA1rqDmocGhNsbzLnZvcCnfLPVWAuk80DqSuHBbB+NvxhxX8HBg5BrMPFkyBO
 K8njrPHhHkrWuwOfa0BCQPclBYn/B11sHIJVJ+ep1FmojZhWjRF5J+798NV3RvJfLT5U
 3gsOz3ZdyCSaFSJbJRVUX+PR+6o7dVPqb7KGJtyB3w5g2aAFyy6gCM1Eof2WGLNMCsQp
 8/wKxo6bKWWPiUaoERsnHFFF+vD0ZCUwQCoUezTpfY570PWC7PkroRtTe4AW2JExSnqT
 lAxjHYmVs3+zVEFyK4K2Hc/yaCAJ9Kfz1PmjZUnGYYgPAqMZ23JZ9jwIAGDm3h65+15m
 97vw==
X-Gm-Message-State: APjAAAXoLIc1C6khmnQ4kg/7wG5EcwTY18jP+hnIPtvL9hOdHkGlB689
 Wf8WKnQrvRmJ6ycpdQixbsftrg==
X-Google-Smtp-Source: APXvYqwdRrGqQkg+5BHEgo4ci1/p+vaJqkBfzpIWnIhpQnIJ4SA4i83A298Sr3JG2hyf2fe352ZO0w==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr12464952wrv.2.1570520912500; 
 Tue, 08 Oct 2019 00:48:32 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o4sm36817536wre.91.2019.10.08.00.48.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 00:48:31 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Handle resetting on timeout better
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
References: <20191007125014.12595-1-steven.price@arm.com>
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
Message-ID: <769293a3-e244-a2a9-98fa-afdfd92c5cf4@baylibre.com>
Date: Tue, 8 Oct 2019 09:48:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007125014.12595-1-steven.price@arm.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=QF+MCcIV1ioc5xu/kdZzoZqX+5uryu1YOTjuH3YAzmA=;
 b=njdKTP+whTSV+mcB9q7dhAIpZnAyy0fro9oO2CPh+rloMlvbWTMbB5cfxgC9GvyqhX
 ZRaqd/rimHnJ9Hew49gEUX2JBHi4fgw3XV/25BDbuCpvXGlqtmEiRB2kTpU1Tamqv7j8
 9oX2Tv+qq1s9z6DWN7aZSblW1b2nXs3PRNMkKOVuseLJv/flPlLugBC7EAn6ozKHwB1o
 Ix8lRe+ugvrmj2a/N/QF8iWB/uztDnCc+wCzs0hbs+WcSTIyHPT4uFw2izTsaVwxuHR4
 K424lMZRT6+Qw0ENTcU/X3pYg0gJqbmUJsVoAwH3trlCos26JfFdH3kF6gK4nsubd378
 ZZkg==
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMTAvMjAxOSAxNDo1MCwgU3RldmVuIFByaWNlIHdyb3RlOgo+IFBhbmZyb3N0IHVzZXMg
bXVsdGlwbGUgc2NoZWR1bGVycyAob25lIGZvciBlYWNoIHNsb3QsIHNvIDIgaW4gcmVhbGl0eSks
Cj4gYW5kIG9uIGEgdGltZW91dCBoYXMgdG8gc3RvcCBhbGwgdGhlIHNjaGVkdWxlcnMgdG8gc2Fm
ZWx5IHBlcmZvcm0gYQo+IHJlc2V0LiBIb3dldmVyIG1vcmUgdGhhbiBvbmUgc2NoZWR1bGVyIGNh
biB0cmlnZ2VyIGEgdGltZW91dCBhdCB0aGUgc2FtZQo+IHRpbWUuIFRoaXMgcmFjZSBjb25kaXRp
b24gcmVzdWx0cyBpbiBqb2JzIGJlaW5nIGZyZWVkIHdoaWxlIHRoZXkgYXJlCj4gc3RpbGwgaW4g
dXNlLgo+IAo+IFdoZW4gc3RvcHBpbmcgb3RoZXIgc2xvdHMgdXNlIGNhbmNlbF9kZWxheWVkX3dv
cmtfc3luYygpIHRvIGVuc3VyZSB0aGF0Cj4gYW55IHRpbWVvdXQgc3RhcnRlZCBmb3IgdGhhdCBz
bG90IGhhcyBjb21wbGV0ZWQuIEFsc28gdXNlCj4gbXV0ZXhfdHJ5bG9jaygpIHRvIG9idGFpbiBy
ZXNldF9sb2NrLiBUaGlzIG1lYW5zIHRoYXQgb25seSBvbmUgdGhyZWFkCj4gYXR0ZW1wdHMgdGhl
IHJlc2V0LCB0aGUgb3RoZXIgdGhyZWFkcyB3aWxsIHNpbXBseSBjb21wbGV0ZSB3aXRob3V0IGRv
aW5nCj4gYW55dGhpbmcgKHRoZSBmaXJzdCB0aHJlYWQgd2lsbCB3YWl0IGZvciB0aGlzIGluIHRo
ZSBjYWxsIHRvCj4gY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCkpLgo+IAo+IFdoaWxlIHdlJ3Jl
IGhlcmUgYW5kIHNpbmNlIHRoZSBmdW5jdGlvbiBpcyBhbHJlYWR5IGRlcGVuZGVudCBvbgo+IHNj
aGVkX2pvYiBub3QgYmVpbmcgTlVMTCwgbGV0J3MgcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBjaGVj
a3MsIGFsb25nCj4gd2l0aCBhIGNvbW1lbnRlZCBvdXQgY2FsbCB0byBwYW5mcm9zdF9jb3JlX2R1
bXAoKSB3aGljaCBoYXMgbmV2ZXIKPiBleGlzdGVkIGluIG1haW5saW5lLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+Cj4gLS0tCj4gVGhpcyBp
cyBhIHRpZGllZCB1cCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBvcmdpbmFsbHkgcG9zdGVkIGhlcmU6
Cj4gaHR0cDovL2xrbWwua2VybmVsLm9yZy9yLzI2YWUyYTRkLThkZjEtZThkYi0zMDYwLTQxNjM4
ZWQ2M2UyYSU0MGFybS5jb20KPiAKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2pvYi5jIHwgMTcgKysrKysrKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9qb2IuYwo+IGluZGV4IGE1ODU1MTY2OGQ5YS4uZGNjOWE3NjAzNjg1IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwo+IEBAIC0zODEsMTMgKzM4MSwxOSBA
QCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9qb2JfdGltZWRvdXQoc3RydWN0IGRybV9zY2hlZF9qb2Ig
KnNjaGVkX2pvYikKPiAgCQlqb2JfcmVhZChwZmRldiwgSlNfVEFJTF9MTyhqcykpLAo+ICAJCXNj
aGVkX2pvYik7Cj4gIAo+IC0JbXV0ZXhfbG9jaygmcGZkZXYtPnJlc2V0X2xvY2spOwo+ICsJaWYg
KCFtdXRleF90cnlsb2NrKCZwZmRldi0+cmVzZXRfbG9jaykpCj4gKwkJcmV0dXJuOwo+ICAKPiAt
CWZvciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NMT1RTOyBpKyspCj4gLQkJZHJtX3NjaGVkX3N0b3Ao
JnBmZGV2LT5qcy0+cXVldWVbaV0uc2NoZWQsIHNjaGVkX2pvYik7Cj4gKwlmb3IgKGkgPSAwOyBp
IDwgTlVNX0pPQl9TTE9UUzsgaSsrKSB7Cj4gKwkJc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpz
Y2hlZCA9ICZwZmRldi0+anMtPnF1ZXVlW2ldLnNjaGVkOwo+ICsKPiArCQlkcm1fc2NoZWRfc3Rv
cChzY2hlZCwgc2NoZWRfam9iKTsKPiArCQlpZiAoanMgIT0gaSkKPiArCQkJLyogRW5zdXJlIGFu
eSB0aW1lb3V0cyBvbiBvdGhlciBzbG90cyBoYXZlIGZpbmlzaGVkICovCj4gKwkJCWNhbmNlbF9k
ZWxheWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsKPiArCX0KPiAgCj4gLQlpZiAoc2No
ZWRfam9iKQo+IC0JCWRybV9zY2hlZF9pbmNyZWFzZV9rYXJtYShzY2hlZF9qb2IpOwo+ICsJZHJt
X3NjaGVkX2luY3JlYXNlX2thcm1hKHNjaGVkX2pvYik7Cj4gIAo+ICAJc3Bpbl9sb2NrX2lycXNh
dmUoJnBmZGV2LT5qcy0+am9iX2xvY2ssIGZsYWdzKTsKPiAgCWZvciAoaSA9IDA7IGkgPCBOVU1f
Sk9CX1NMT1RTOyBpKyspIHsKPiBAQCAtMzk4LDcgKzQwNCw2IEBAIHN0YXRpYyB2b2lkIHBhbmZy
b3N0X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKQo+ICAJfQo+
ICAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcGZkZXYtPmpzLT5qb2JfbG9jaywgZmxhZ3MpOwo+
ICAKPiAtCS8qIHBhbmZyb3N0X2NvcmVfZHVtcChwZmRldik7ICovCj4gIAo+ICAJcGFuZnJvc3Rf
ZGV2ZnJlcV9yZWNvcmRfdHJhbnNpdGlvbihwZmRldiwganMpOwo+ICAJcGFuZnJvc3RfZGV2aWNl
X3Jlc2V0KHBmZGV2KTsKPiAKCkl0IHJhbiBzdWNjZXNzZnVsbHkgMTAgZEVRUCB0ZXN0cyB3aXRo
b3V0IGNyYXNoaW5nIHRoZSBBbWxvZ2ljIFM5MTIgd2l0aCBNYWxpIFQ4MjA6ClRlc3RlZC1ieTog
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
