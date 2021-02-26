Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB35325E8D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 09:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BC56EDA9;
	Fri, 26 Feb 2021 08:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E346EDA9;
 Fri, 26 Feb 2021 08:02:01 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id h19so9839024edb.9;
 Fri, 26 Feb 2021 00:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=FcgGpHwkjwZclOHGIc/VdfNxbm0a2VpyB+fvz1qQlVQ=;
 b=nid1VKeQeds/6v6IF5Xjly1IHekuCJp5XSOcGn5t+SJUoN9+ebS5YDfRKb9ewCMEiW
 RKDTDwx6SCxxFHDGsunYlw1H37P0mnZSz1f91L+G2DA6MQAi+kpr+PIbpthazdkX1Wyy
 jlvB4EqI8S5y2DyrurK5Rwer9wfgbJNYtdkmhNMdLDqu1G5PnJgsl11G5b6klDnBtUaM
 4I3NDRpHd/xC+96K/lfAhWibIw1ydJBXhx8+YLUk0oEOcdZxQb2KeZWKUgB4ChSmWJ9Z
 TF6vwEjnnhybua7A8mv6t5ZtE+JUGy+QWpmcHLN2FCuAQLtFeu2MOQrI9DnCoJGrMnqM
 1ZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=FcgGpHwkjwZclOHGIc/VdfNxbm0a2VpyB+fvz1qQlVQ=;
 b=tvIHxpVGOhd56rY7/afl4Ave7FbPvFTJUc4C3e/zlvM1hcz2pybMTBbeIq+qIWPBEW
 HexqJx57wLHg8aiWDqMeQ2OaZ6GSa9iWn1yXMaQ60F+nP01aJ+6kEcO78qiKG/wrfEme
 QActMDfIMLYHTBGMymG2zFdxYALZdOPeV3FXHwIEMm/fEIEt4WaMZB3UavT2/Ot4V16l
 Vh7crfzUjzzJUOjJfDKgMldhcUee8c6NfAmJ8HdbrdJjvpCLqQoj0w/NryYpvO+bmhnA
 Qb00Vjalf/Cr1kfTEGa1Ywd7uzp0ml0nS/V8w57GfC1i9WXl4iFMpgDODBGD6iRLmSs4
 T+7w==
X-Gm-Message-State: AOAM531HQS5EK1RzT2Qz91r2Ple/suxwXR5Cb4V0VyUncc35Gp7D6vsx
 rnrud9kimGGjMewohwr2VRkfdAdc7QkU6w==
X-Google-Smtp-Source: ABdhPJyyQUxA1htU8Y7cBb1fFeyCv9ULtlRRXFTVT9HvfeHLKeYPuSAfiij2IP+g599dsFGuJBgtFw==
X-Received: by 2002:a50:bec3:: with SMTP id e3mr1933126edk.290.1614326520650; 
 Fri, 26 Feb 2021 00:02:00 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:bcf6:4057:c09:be71?
 ([2a02:908:1252:fb60:bcf6:4057:c09:be71])
 by smtp.gmail.com with ESMTPSA id d26sm5093584eds.71.2021.02.26.00.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 00:01:59 -0800 (PST)
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
 <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
 <bf874237-033c-8eb2-336c-ec79ae9ef941@gmail.com>
 <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
 <e0e05866-ac73-0534-f0b0-60c3fa211eee@amd.com>
 <85d4cf33-b8b9-23f6-7ca4-abdb98f0cd5e@gmail.com>
 <c6e9ed57-fb7f-8dec-ce2a-187d5bd7b1a9@amd.com>
 <aea77d09-57f3-88ce-606a-933eacafca64@gmail.com>
 <e4440f37-5b6a-a60f-7719-f505c9045ed7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7d230b96-76f1-7480-e0ff-7c62433585ef@gmail.com>
Date: Fri, 26 Feb 2021 09:01:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e4440f37-5b6a-a60f-7719-f505c9045ed7@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyNS4wMi4yMSB1bSAyMjoyNyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Cj4gT24g
MjAyMS0wMi0yNSAxOjQyIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Cj4+Cj4+IEFt
IDI1LjAyLjIxIHVtIDE3OjAzIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pgo+Pj4gT24g
MjAyMS0wMi0yNSAyOjUzIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4gQW0gMjQu
MDIuMjEgdW0gMTY6MTMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4gUGluZwo+Pj4+
Cj4+Pj4gU29ycnksIEkndmUgYmVlbiBvbiB2YWNhdGlvbiB0aGlzIHdlZWsuCj4+Pj4KPj4+Pj4K
Pj4+Pj4gQW5kcmV5Cj4+Pj4+Cj4+Pj4+IE9uIDIwMjEtMDItMjAgNzoxMiBhLm0uLCBBbmRyZXkg
R3JvZHpvdnNreSB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBPbiAyLzIwLzIxIDM6MzggQU0sIENocmlz
dGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IEFtIDE4LjAyLjIxIHVt
IDE3OjQxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IE9uIDIv
MTgvMjEgMTA6MTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+PiBBbSAxOC4w
Mi4yMSB1bSAxNjowNSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4gT24gMi8xOC8yMSAzOjA3IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBBbSAxNy4wMi4yMSB1bSAyMjo1OSBzY2hyaWVi
IEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4+Pj4gUHJvYmxlbTogSWYgc2NoZWR1bGVyIGlz
IGFscmVhZHkgc3RvcHBlZCBieSB0aGUgdGltZSAKPj4+Pj4+Pj4+Pj4+IHNjaGVkX2VudGl0eQo+
Pj4+Pj4+Pj4+Pj4gaXMgcmVsZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkg
SSBlbmNvdW50cmVkCj4+Pj4+Pj4+Pj4+PiBhIGhhbmcgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVz
aC4gVGhpcyBpcyBiZWNhdXNlIAo+Pj4+Pj4+Pj4+Pj4gZHJtX3NjaGVkX2VudGl0eV9pc19pZGxl
Cj4+Pj4+Pj4+Pj4+PiBuZXZlciBiZWNvbWVzIGZhbHNlLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
Pj4+IEZpeDogSW4gZHJtX3NjaGVkX2ZpbmkgZGV0YWNoIGFsbCBzY2hlZF9lbnRpdGllcyBmcm9t
IHRoZQo+Pj4+Pj4+Pj4+Pj4gc2NoZWR1bGVyJ3MgcnVuIHF1ZXVlcy4gVGhpcyB3aWxsIHNhdGlz
ZnkgCj4+Pj4+Pj4+Pj4+PiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUuCj4+Pj4+Pj4+Pj4+PiBB
bHNvIHdha2V1cCBhbGwgdGhvc2UgcHJvY2Vzc2VzIHN0dWNrIGluIHNjaGVkX2VudGl0eSBmbHVz
aGluZwo+Pj4+Pj4+Pj4+Pj4gYXMgdGhlIHNjaGVkdWxlciBtYWluIHRocmVhZCB3aGljaCB3YWtl
cyB0aGVtIHVwIGlzIHN0b3BwZWQgCj4+Pj4+Pj4+Pj4+PiBieSBub3cuCj4+Pj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+Pj4gdjI6Cj4+Pj4+Pj4+Pj4+PiBSZXZlcnNlIG9yZGVyIG9mIGRybV9zY2hlZF9y
cV9yZW1vdmVfZW50aXR5IGFuZCBtYXJraW5nCj4+Pj4+Pj4+Pj4+PiBzX2VudGl0eSBhcyBzdG9w
cGVkIHRvIHByZXZlbnQgcmVpbnNlcmlvbiBiYWNrIHRvIHJxIGR1ZQo+Pj4+Pj4+Pj4+Pj4gdG8g
cmFjZS4KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+Pj4+Pj4+Pj4+IC0tLQo+Pj4+
Pj4+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAzMSAK
Pj4+Pj4+Pj4+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+Pj4+Pj4+Pj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
IAo+Pj4+Pj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+
Pj4+Pj4+Pj4+Pj4gaW5kZXggOTA4YjBiNS4uYzZiNzk0NyAxMDA2NDQKPj4+Pj4+Pj4+Pj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4+Pj4+Pj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+Pj4+Pj4+Pj4g
QEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+Pj4+
Pj4+Pj4+PiDCoMKgICovCj4+Pj4+Pj4+Pj4+PiDCoCB2b2lkIGRybV9zY2hlZF9maW5pKHN0cnVj
dCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4+Pj4+Pj4+Pj4+PiDCoCB7Cj4+Pj4+Pj4+Pj4+
PiArwqDCoMKgIGludCBpOwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2Vu
dGl0eSAqc19lbnRpdHk7Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEJUVzogUGxlYXNlIG9yZGVy
IHRoYXQgc28gdGhhdCBpIGlzIGRlY2xhcmVkIGxhc3QuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
PiDCoMKgwqDCoMKgIGlmIChzY2hlZC0+dGhyZWFkKQo+Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGt0aHJlYWRfc3RvcChzY2hlZC0+dGhyZWFkKTsKPj4+Pj4+Pj4+Pj4+IMKgICvCoMKg
wqAgLyogRGV0YWNoIGFsbCBzY2hlZF9lbnRpdGVzIGZyb20gdGhpcyBzY2hlZHVsZXIgb25jZSAK
Pj4+Pj4+Pj4+Pj4+IGl0J3Mgc3RvcHBlZCAqLwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBmb3IgKGkg
PSBEUk1fU0NIRURfUFJJT1JJVFlfQ09VTlQgLSAxOyBpID49IAo+Pj4+Pj4+Pj4+Pj4gRFJNX1ND
SEVEX1BSSU9SSVRZX01JTjsgaS0tKSB7Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGRybV9zY2hlZF9ycSAqcnEgPSAmc2NoZWQtPnNjaGVkX3JxW2ldOwo+Pj4+Pj4+Pj4+Pj4g
Kwo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghcnEpCj4+Pj4+Pj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCAvKiBMb29wIHRoaXMgd2F5IGJlY2F1c2UgcnEtPmxvY2sgaXMgdGFr
ZW4gaW4gCj4+Pj4+Pj4+Pj4+PiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSAqLwo+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fbG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHdoaWxlICgoc19lbnRpdHkgPSAKPj4+Pj4+Pj4+Pj4+IGxpc3RfZmly
c3RfZW50cnlfb3JfbnVsbCgmcnEtPmVudGl0aWVzLAo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkcm1fc2NoZWRfZW50aXR5LAo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxpc3QpKSkgewo+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPj4+
Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFByZXZl
bnQgcmVpbnNlcnRpb24gYW5kIHJlbW92ZSAqLwo+Pj4+Pj4+Pj4+Pj4gKyBzcGluX2xvY2soJnNf
ZW50aXR5LT5ycV9sb2NrKTsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNf
ZW50aXR5LT5zdG9wcGVkID0gdHJ1ZTsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KHJxLCBzX2VudGl0eSk7Cj4+Pj4+Pj4+Pj4+
PiArIHNwaW5fdW5sb2NrKCZzX2VudGl0eS0+cnFfbG9jayk7Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4+IFdlbGwgdGhpcyBzcGluX3VubG9jay9sb2NrIGRhbmNlIGhlcmUgZG9lc24ndCBsb29rIGNv
cnJlY3QgCj4+Pj4+Pj4+Pj4+IGF0IGFsbCBub3cuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IENo
cmlzdGlhbi4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSW4gd2hhdCB3YXkgPyBJ
dCdzIGluIHRoZSBzYW1lIHNhbWUgb3JkZXIgYXMgaW4gb3RoZXIgY2FsbCAKPj4+Pj4+Pj4+PiBz
aXRlcyAoc2VlIGRybV9zY2hlZF9lbnRpdHlfcHVzaF9qb2IgYW5kIAo+Pj4+Pj4+Pj4+IGRybV9z
Y2hlZF9lbnRpdHlfZmx1c2gpLgo+Pj4+Pj4+Pj4+IElmIGkganVzdCBsb2NrZWQgcnEtPmxvY2sg
YW5kIGRpZCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgCj4+Pj4+Pj4+Pj4gd2hpbGUgbWFudWFs
bHkgZGVsZXRpbmcgZW50aXR5LT5saXN0IGluc3RlYWQgb2YgY2FsbGluZwo+Pj4+Pj4+Pj4+IGRy
bV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5IHRoaXMgc3RpbGwgd291bGQgbm90IGJlIHBvc3NpYmxl
IAo+Pj4+Pj4+Pj4+IGFzIHRoZSBvcmRlciBvZiBsb2NrIGFjcXVpc2l0aW9uIGJldHdlZW4gc19l
bnRpdHktPnJxX2xvY2sKPj4+Pj4+Pj4+PiBhbmQgcnEtPmxvY2sgd291bGQgYmUgcmV2ZXJzZSBj
b21wYXJlZCB0byB0aGUgY2FsbCBzaXRlcyAKPj4+Pj4+Pj4+PiBtZW50aW9uZWQgYWJvdmUuCj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQWgsIG5vdyBJIHVuZGVyc3RhbmQuIFlvdSBuZWVkIHRoaXMgYmVj
YXVzZSAKPj4+Pj4+Pj4+IGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KCkgd2lsbCBncmFiIHRo
ZSBycSBsb2NrIGFnYWluIQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFByb2JsZW0gaXMgbm93IHdoYXQg
cHJldmVudHMgdGhlIGVudGl0eSBmcm9tIGJlaW5nIGRlc3Ryb3llZCAKPj4+Pj4+Pj4+IHdoaWxl
IHlvdSByZW1vdmUgaXQ/Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+Pgo+
Pj4+Pj4+PiBSaWdodCwgd2VsbCwgc2luY2UgKHVuZm9ydHVuYXRlbHkpIHNjaGVkX2VudGl0eSBp
cyBwYXJ0IG9mIAo+Pj4+Pj4+PiBhbWRncHVfY3R4X2VudGl0eSBhbmQgYW1kZ3B1X2N0eF9lbnRp
dHkgaXMgcmVmY291bnRlZAo+Pj4+Pj4+PiB0aGVyZSBpcyBhIHByb2JsZW0gaGVyZSB0aGF0IHdl
IGRvbid0IGluY3JlbWVudCAKPj4+Pj4+Pj4gYW1kZ3B1X2N0eC5yZWZjb3VudCB3aGVuIGFzc2ln
bmluZ8KgIHNjaGVkX2VudGl0eQo+Pj4+Pj4+PiB0byBuZXcgcnEgKGUuZy4gYmVmb3JlIGRybV9z
Y2hlZF9ycV9hZGRfZW50aXR5KSBhbmQgbm90IAo+Pj4+Pj4+PiBkZWNyZW1lbnQgYmVmb3JlIHJl
bW92aW5nLiBXZSBkbyBpdCBmb3IKPj4+Pj4+Pj4gYW1kZ3B1X2NzX3BhcnNlci5lbnRpdHkgZm9y
IGV4YW1wbGUgKGluIGFtZGdwdV9jc19wYXJzZXJfaW5pdCAKPj4+Pj4+Pj4gYW5kIGFtZGdwdV9j
c19wYXJzZXJfZmluaSBieQo+Pj4+Pj4+PiBjYWxsaW5nIGFtZGdwdV9jdHhfZ2V0IGFuZCBhbWRn
cHVfY3R4X3B1dCkuIEJ1dCB0aGlzIHNlZW1zIGEgCj4+Pj4+Pj4+IGJpdCB0cmlja3kgZHVlIHRv
IGFsbCB0aGUgZHJtX3NjaGVkX2VudGl0eV9zZWxlY3RfcnEKPj4+Pj4+Pj4gbG9naWMuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IEFub3RoZXIsIGtpbmQgb2YgYSBiYW5kIGFpZCBmaXgsIHdvdWxkIHByb2Jh
Ymx5IGJlIGp1c3QgbG9ja2luZyAKPj4+Pj4+Pj4gYW1kZ3B1X2N0eF9tZ3IubG9jayBhcm91bmQg
ZHJtX3NjaGVkX2ZpbmkKPj4+Pj4+Pj4gd2hlbiBmaW5hbGl6aW5nIHRoZSBmZW5jZSBkcml2ZXIg
YW5kIGFyb3VuZCBpZHIgaXRlcmF0aW9uIGluIAo+Pj4+Pj4+PiBhbWRncHVfY3R4X21ncl9maW5p
ICh3aGljaCBzaG91bGQgYmUgbG9jayBwcm90ZWN0ZWQKPj4+Pj4+Pj4gYW55d2F5IGFzIEkgc2Vl
IGZyb20gb3RoZXIgaWRyIHVzYWdlcyBpbiB0aGUgY29kZSkgLi4uIFRoaXMgCj4+Pj4+Pj4+IHNo
b3VsZCBwcmV2ZW50IHRoaXMgdXNlIGFmdGVyIGZyZWUuCj4+Pj4+Pj4KPj4+Pj4+PiBQdWgsIHRo
YXQncyByYXRoZXIgY29tcGxpY2F0ZWQgYXMgd2VsbC4gT2sgbGV0J3MgbG9vayBhdCBpdCBmcm9t
IAo+Pj4+Pj4+IHRoZSBvdGhlciBzaWRlIGZvciBhIG1vbWVudC4KPj4+Pj4+Pgo+Pj4+Pj4+IFdo
eSBkbyB3ZSBoYXZlIHRvIHJlbW92ZSB0aGUgZW50aXRpZXMgZnJvbSB0aGUgcnEgaW4gdGhlIGZp
cnN0IAo+Pj4+Pj4+IHBsYWNlPwo+Pj4+Pj4+Cj4+Pj4+Pj4gV291bGRuJ3QgaXQgYmUgc3VmZmlj
aWVudCB0byBqdXN0IHNldCBhbGwgb2YgdGhlbSB0byBzdG9wcGVkPwo+Pj4+Pj4+Cj4+Pj4+Pj4g
Q2hyaXN0aWFuLgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBBbmQgYWRkaW5nIGl0IGFzIGFub3RoZXLC
oCBjb25kaXRpb24gaW4gZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlID8KPj4+Pgo+Pj4+IFllcywg
SSB0aGluayB0aGF0IHNob3VsZCB3b3JrLgo+Pj4KPj4+Cj4+PiBJbiB0aGlzIGNhc2UgcmV2ZXJz
ZSBsb2NraW5nIG9yZGVyIGlzIGNyZWF0ZWQsIEluIAo+Pj4gZHJtX3NjaGVkX2VudGl0eV9wdXNo
X2pvYiBhbmQgZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBsb2NrIAo+Pj4gZW50aXR5LT5ycV9sb2Nr
IGxvY2tlZCBmaXJzdCBhbmQgcnEtPmxvY2sgbG9ja2VkIHNlY29uZC4gSW4gCj4+PiBkcm1fc2No
ZWRfZmluaSBvbiB0aGUgb3RoZXIgaGFuZCwgSSBuZWVkIHRvIGxvY2sgcnEtPmxvY2sgZmlyc3Qg
dG8gCj4+PiBpdGVyYXRlIHJxLT5lbnRpdGllcyBhbmQgdGhlbiBsb2NrIHNfZW50aXR5LT5ycV9s
b2NrIGZvciBlYWNoIGVudGl0eSAKPj4+IHRvIG1vZGlmeSBzX2VudGl0eS0+c3RvcHBlZC4gSSBn
dWVzcyB3ZSBjb3VsZCBjaGFuZ2UgCj4+PiBzX2VudGl0eS0+c3RvcHBlZCB0byBhdG9taWMgPwo+
Pgo+PiBHb29kIHBvaW50LiBCdXQgSSB0aGluayB0aGUgbWVtb3J5IGJhcnJpZXIgaW5zZXJ0ZWQg
YnkgCj4+IHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7IHNob3VsZCBiZSBzdWZm
aWNpZW50Lgo+Pgo+PiBJZiBJIHNlZSB0aGlzIGNvcnJlY3RseSB3ZSBoYXZlIHRoZSBlbnRpdHkt
PnJxX2xvY2sgbWFpbmx5IHRvIHByb3RlY3QgCj4+IGNvbmN1cnJlbnQgY2hhbmdlcyBvZiBlbnRp
dHktPnJxLgo+Pgo+PiBCdXQgd2hlbiB0d28gQ1BVcyBib3RoIHNldCBlbnRpdHktPnN0b3BwZWQg
dG8gdHJ1ZSBhdCB0aGUgc2FtZSB0aW1lIAo+PiB3ZSBkb24ndCByZWFsbHkgY2FyZSBhYm91dCBp
dCBhcyBsb25nIGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZSgpIHNlZXMgCj4+IGl0Lgo+Pgo+PiBS
ZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4KPgo+IEkgd2FzIG1vcmUgdGhpbmtpbmcgYWJvdXQgaW50
ZWdyaXR5IG9mIHJlYWRpbmcvd3JpdGluZyBlbnRpdHktPnN0b3BwZWQgCj4gZnJvbSBkaWZmZXJl
bnQgdGhyZWFkcy4gSSBndWVzcyBzaW5jZSBpdCdzIGJvb2wgaXQncyBndWFyYW50ZWVkIHRvIGJl
IAo+IGF0b21pYyBmcm9tIEhXIHBlcnNwZWN0aXZlIGFueXdheSA/CgpNb3JlIG9yIGxlc3MgeWVz
LiBUaGUga2V5IHBvaW50IGlzIHRoYXQgd2Ugb25seSBjaGFuZ2UgaXQgZnJvbSBmYWxzZSAtPiAK
dHJ1ZSBhbmQgbmV2ZXIgdGhlIG90aGVyIHdheSBhcm91bmQuIEFsbCB0aGF0IHlvdSBuZWVkIHRo
ZW4gZm9yIG90aGVyIApDUFVzIHRvIHNlZSB0aGUgdmFsdWUgaXMgYSBiYXJyaWVyLgoKQ2hyaXN0
aWFuLgoKPiBXaWxsIHNlbmQgVjMgc29vbi4KPgo+IEFuZHJleQo+Cj4KPj4KPj4+Cj4+PiBBbmRy
ZXkKPj4+Cj4+Pgo+Pj4+Cj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBB
bmRyZXkKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFuZHJleQo+Pj4+
Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEFuZHJleQo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gKwo+
Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7
Cj4+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHNwaW5fdW5sb2NrKCZycS0+bG9jayk7Cj4+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+PiAr
wqDCoMKgIH0KPj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgLyogV2FrZXVwIGV2
ZXJ5b25lIHN0dWNrIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2ggZm9yIAo+Pj4+Pj4+Pj4+Pj4g
dGhpcyBzY2hlZHVsZXIgKi8KPj4+Pj4+Pj4+Pj4+ICsgd2FrZV91cF9hbGwoJnNjaGVkLT5qb2Jf
c2NoZWR1bGVkKTsKPj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqAgLyogQ29u
ZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2UgCj4+Pj4+Pj4+Pj4+PiBz
dHJ1Y3R1cmVzICovCj4+Pj4+Pj4+Pj4+PiBjYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJnNjaGVk
LT53b3JrX3Rkcik7Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4KPj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
