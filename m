Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D17873094DC
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AEAE6ECC5;
	Sat, 30 Jan 2021 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A047B6EC7F
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 02:00:07 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id m6so7361903pfk.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 18:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squareup.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=83BGZrgiNBtf2HpHYA3huRBYyscfozlNKzPdwrXaPyM=;
 b=Tb2s6Ek8oTj0J/p1phYDamGzIXjcF/3+Xnpz5Mkz78Z+7sSZ7QHKCVWxkc/UL5N8Yw
 NK8jlUCQJojL9or/+XvI7qRKDIj6T7ArW2Q40/NKacIoQKYspHXBq2GBhXNTlotge0ma
 fLLnX8xSuTuy0lywtth7yzH6tDJPJM4M89ix0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=83BGZrgiNBtf2HpHYA3huRBYyscfozlNKzPdwrXaPyM=;
 b=o2acvLEwaRzHInt6mSRFtB8DtSerDjdHGDFQQ10WWypq61brNzHsmCrs0BZf72fZ/q
 jdVoTmF4Q/I5dlfs1J6oTgoCqLb+K3ZHwqK6Xtg40yyaD4knagrcyjsCSEm70q2vxxt/
 0rMb1PqWwmlmceIyrPvJRa6oX3g5TAMT2Zo58eq7YsYPgVa7tMjSUdsUeicSVNI+N/im
 2Ovx1w51R6SPzqwjxn4JyLCChkuCRxTpNtiiC3nw9Ri+jcyCYB8Pg7xALcpnqN8XIrOe
 Gd+Ej/H3CjoonHB8GS5QPFl4xMQBpW2AnUl7m7/XvdNHencWbWdEgCKPtW6HGBCcUPb0
 BMzQ==
X-Gm-Message-State: AOAM531YU+7XH/Q8TNiS03mPGrPhNNPSxaoCFiR+HhHEcGaV3HECfZI8
 +a3sk6kD5pCkQrZ/fGe21hVvlw==
X-Google-Smtp-Source: ABdhPJzzRHJTltKDkyuuKbIHmJ6PmrxJocGWpBLCqvqhabxzHF6lx6ptLhoy0flFHE7TzqAxPpylZg==
X-Received: by 2002:a05:6a00:148a:b029:1ae:6d20:fbb3 with SMTP id
 v10-20020a056a00148ab02901ae6d20fbb3mr6722703pfu.55.1611972007047; 
 Fri, 29 Jan 2021 18:00:07 -0800 (PST)
Received: from benl-m5lvdt.local ([2600:1700:87d0:94f:65bd:6864:3edc:1e8f])
 by smtp.gmail.com with ESMTPSA id f13sm11033259pjj.1.2021.01.29.18.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 18:00:06 -0800 (PST)
Subject: Re: [PATCH] drm/msm/dsi: save PLL registers across first PHY reset
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
 sean@poorly.run
References: <010101750064e17e-3db0087e-fc37-494d-aac9-2c2b9b0a7c5b-000000@us-west-2.amazonses.com>
 <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org>
From: Benjamin Li <benl@squareup.com>
Message-ID: <eda75757-5cf2-14a7-3de4-ca57eb099cfd@squareup.com>
Date: Fri, 29 Jan 2021 18:00:03 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <508ae9e2-5240-2f43-6c97-493bb7d9fbe8@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:30 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Anibal Limon <anibal.limon@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konradybcio@gmail.com>, zhengbin <zhengbin13@huawei.com>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEwLzMwLzIwIDY6NTUgQU0sIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gMDcvMTAvMjAyMCAwMzoxMCwgYmVubC1rZXJuZWxwYXRjaGVzQHNxdWFyZXVwLmNvbSB3
cm90ZToKPj4gRnJvbTogQmVuamFtaW4gTGkgPGJlbmxAc3F1YXJldXAuY29tPgo+Pgo+PiBUYWtl
IGFkdmFudGFnZSBvZiBwcmV2aW91c2x5LWFkZGVkIHN1cHBvcnQgZm9yIHBlcnNpc3RpbmcgUExM
Cj4+IHJlZ2lzdGVycyBhY3Jvc3MgRFNJIFBIWSBkaXNhYmxlL2VuYWJsZSBjeWNsZXMgKHNlZSAz
MjhlMWE2Cj4+ICdkcm0vbXNtL2RzaTogU2F2ZS9SZXN0b3JlIFBMTCBzdGF0dXMgYWNyb3NzIFBI
WSByZXNldCcpIHRvCj4+IHN1cHBvcnQgcGVyc2lzdGluZyBhY3Jvc3MgdGhlIHZlcnkgZmlyc3Qg
RFNJIFBIWSBlbmFibGUgYXQKPj4gYm9vdC4KPiAKPiBJbnRlcmVzdGluZyBlbm91Z2gsIHRoaXMg
YnJlYWtzIGV4YWN0bHkgb24gODAxNi4gT24gREI0MTBjIHdpdGggbGF0ZXN0IGJvb3Rsb2FkZXIg
YW5kIHcvbyBzcGxhc2ggc2NyZWVuIHRoaXMgcGF0Y2ggY2F1c2VzIGJvb3QgZnJlZXplLiBXaXRo
b3V0IHRoaXMgcGF0Y2ggdGhlIGJvYXJkIHdvdWxkIHN1Y2Nlc3NmdWxseSBib290IHdpdGggZGlz
cGxheSByb3V0ZWQgdG8gSERNSS4KCkhpIERpbXRyeSwKClRoYW5rcyBmb3IgeW91ciBmaXggZm9y
IHRoZSBEQjQxMGMgYnJlYWthZ2UgKCJkcm0vbXNtL2RzaTogZG8gbm90CnRyeSByZWFkaW5nIDI4
bm0gdmNvIHJhdGUgaWYgaXQncyBub3QgZW5hYmxlZCIpIHRoYXQgdGhpcyBwYXRjaApjYXVzZXMu
CgpJIHJlLXRlc3RlZCBteSBwYXRjaCBvbiB0b3Agb2YgcWNvbS9saW51eCBmb3ItbmV4dCAoM2U2
YThjZTA5NDc1OSkKd2hpY2ggbm93IGhhcyB5b3VyIGZpeCwgb24gYSBEQjQxMGMgd2l0aCBIRE1J
IGRpc3BsYXkgYW5kIG5vIHNwbGFzaAood2hpY2ggc2VlbXMgdG8gYmUgdGhlIGRlZmF1bHQgdXNp
bmcgdGhlIExpbmFybyBTRCBjYXJkIGltYWdlJ3MgTEspLAphbmQgaW5kZWVkIGl0IGlzIGZpeGVk
LgoKSSBhc3N1bWUgeW91IGFscmVhZHkgYWxzbyBkaWQgdGhlIHNhbWUgJiBhcmUgb2theSB3aXRo
IHRoaXMgZ29pbmcgaW4uCkFwcHJlY2lhdGUgdGhlIHRlc3RpbmchCgpCZW4KCj4gCj4+IFRoZSBi
b290bG9hZGVyIG1heSBoYXZlIGxlZnQgdGhlIFBMTCByZWdpc3RlcnMgaW4gYSBub24tZGVmYXVs
dAo+PiBzdGF0ZS4gRm9yIGV4YW1wbGUsIGZvciBkc2lfcGxsXzI4bm0uYyBvbiA4eDE2Lzh4Mzks
IHRoZSBieXRlCj4+IGNsb2NrIG11eCdzIHBvd2VyLW9uIHJlc2V0IGNvbmZpZ3VyYXRpb24gaXMg
dG8gYnlwYXNzIERJVjEsIGJ1dAo+PiBkZXBlbmRpbmcgb24gYmFuZHdpZHRoIHJlcXVpcmVtZW50
c1sxXSB0aGUgYm9vdGxvYWRlciBtYXkgaGF2ZQo+PiBzZXQgdGhlIERJVjEgcGF0aC4KPj4KPj4g
V2hlbiB0aGUgYnl0ZSBjbG9jayBtdXggaXMgcmVnaXN0ZXJlZCB3aXRoIHRoZSBnZW5lcmljIGNs
b2NrCj4+IGZyYW1ld29yayBhdCBwcm9iZSB0aW1lLCB0aGUgZnJhbWV3b3JrIHJlYWRzICYgY2Fj
aGVzIHRoZSB2YWx1ZQo+PiBvZiB0aGUgbXV4IGJpdCBmaWVsZCAodGhlIGluaXRpYWwgY2xvY2sg
cGFyZW50KS4gQWZ0ZXIgUEhZIGVuYWJsZSwKPj4gd2hlbiBjbGtfc2V0X3JhdGUgaXMgY2FsbGVk
IG9uIHRoZSBieXRlIGNsb2NrLCB0aGUgZnJhbWV3b3JrCj4+IGFzc3VtZXMgdGhlcmUgaXMgbm8g
bmVlZCB0byByZXBhcmVudCwgYW5kIGRvZXNuJ3QgcmUtd3JpdGUgdGhlCj4+IG11eCBiaXQgZmll
bGQuIEJ1dCBQSFkgZW5hYmxlIHJlc2V0cyBQTEwgcmVnaXN0ZXJzLCBzbyB0aGUgbXV4Cj4+IGJp
dCBmaWVsZCBhY3R1YWxseSBzaWxlbnRseSByZXZlcnRlZCB0byB0aGUgRElWMSBieXBhc3MgcGF0
aC4KPj4gVGhpcyBjYXVzZXMgdGhlIGJ5dGUgY2xvY2sgdG8gYmUgb2ZmIGJ5IGEgZmFjdG9yIG9m
IGUuZy4gMiBmb3IKPj4gb3VyIHRlc3RlZCBXWEdBIHBhbmVsLgo+Pgo+PiBUaGUgYWJvdmUgaXNz
dWUgbWFuaWZlc3RzIGFzIHRoZSBkaXNwbGF5IG5vdCB3b3JraW5nIGFuZCBhCj4+IGNvbnN0YW50
IHN0cmVhbSBvZiBGSUZPL0xQMCBjb250ZW50aW9uIGVycm9ycy4KPj4KPj4gWzFdIFRoZSBzcGVj
aWZpYyByZXF1aXJlbWVudCBmb3IgdHJpZ2dlcmluZyB0aGUgRElWMSBwYXRoIChhbmQKPj4gdGh1
cyB0aGlzIGlzc3VlKSBvbiAyOG5tIGlzIGEgcGFuZWwgd2l0aCBwaXhlbCBjbG9jayA8MTE2LjdN
SHoKPj4gKG9uZS10aGlyZCB0aGUgbWluaW11bSBWQ08gc2V0dGluZykuIEZIRC8xMDgwcCAofjE0
NU1IeikgaXMgZmluZSwKPj4gV1hHQS8xMjgweDgwMCAofjc1TUh6KSBpcyBub3QuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IEJlbmphbWluIExpIDxiZW5sQHNxdWFyZXVwLmNvbT4KPj4gLS0tCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgfCAxNiArKysrKysrKysrKysr
KysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYwo+PiBpbmRleCAwMDlmNWI4NDNkZDEuLjEzOWI0YTVh
YWY4NiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHku
Ywo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jCj4+IEBAIC02
MjEsNiArNjIxLDIyIEBAIHN0YXRpYyBpbnQgZHNpX3BoeV9kcml2ZXJfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBoeS0+cGxsID0gTlVM
TDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogQXMgZXhw
bGFpbmVkIGluIG1zbV9kc2lfcGh5X2VuYWJsZSwgcmVzZXR0aW5nIHRoZSBEU0kgUEhZIChhcyBk
b25lCj4+ICvCoMKgwqDCoCAqIGluIGRzaV9tZ3JfcGh5X2VuYWJsZSkgc2lsZW50bHkgY2hhbmdl
cyBpdHMgUExMIHJlZ2lzdGVycyB0byBwb3dlci1vbgo+PiArwqDCoMKgwqAgKiBkZWZhdWx0cywg
YnV0IHRoZSBnZW5lcmljIGNsb2NrIGZyYW1ld29yayBtYW5hZ2VzIGFuZCBjYWNoZXMgc2V2ZXJh
bAo+PiArwqDCoMKgwqAgKiBvZiB0aGUgUExMIHJlZ2lzdGVycy4gSXQgaW5pdGlhbGl6ZXMgdGhl
c2UgY2FjaGVzIGF0IHJlZ2lzdHJhdGlvbgo+PiArwqDCoMKgwqAgKiB0aW1lIHZpYSByZWdpc3Rl
ciByZWFkLgo+PiArwqDCoMKgwqAgKgo+PiArwqDCoMKgwqAgKiBBcyBhIHJlc3VsdCwgd2UgbmVl
ZCB0byBzYXZlIERTSSBQTEwgcmVnaXN0ZXJzIG9uY2UgYXQgcHJvYmUgaW4gb3JkZXIKPj4gK8Kg
wqDCoMKgICogZm9yIHRoZSBmaXJzdCBjYWxsIHRvIG1zbV9kc2lfcGh5X2VuYWJsZSB0byBzdWNj
ZXNzZnVsbHkgYnJpbmcgUExMCj4+ICvCoMKgwqDCoCAqIHJlZ2lzdGVycyBiYWNrIGluIGxpbmUg
d2l0aCB3aGF0IHRoZSBnZW5lcmljIGNsb2NrIGZyYW1ld29yayBleHBlY3RzLgo+PiArwqDCoMKg
wqAgKgo+PiArwqDCoMKgwqAgKiBTdWJzZXF1ZW50IFBMTCByZXN0b3JlcyBkdXJpbmcgbXNtX2Rz
aV9waHlfZW5hYmxlIHdpbGwgYWx3YXlzIGJlCj4+ICvCoMKgwqDCoCAqIHBhaXJlZCB3aXRoIFBM
TCBzYXZlcyBpbiBtc21fZHNpX3BoeV9kaXNhYmxlLgo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDC
oCBtc21fZHNpX3BsbF9zYXZlX3N0YXRlKHBoeS0+cGxsKTsKPj4gKwo+PiDCoMKgwqDCoMKgIGRz
aV9waHlfZGlzYWJsZV9yZXNvdXJjZShwaHkpOwo+PiDCoCDCoMKgwqDCoMKgIHBsYXRmb3JtX3Nl
dF9kcnZkYXRhKHBkZXYsIHBoeSk7Cj4+Cj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
