Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCD2177104
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223EA6E9F6;
	Tue,  3 Mar 2020 08:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BE16E4AF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 03:37:48 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id h22so2084555qke.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 19:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ew0N9FJRwZlJbbn0yvtd0IVRnzNLNP0ZDU/5N/1+/Do=;
 b=qXE1PWqNfmbKe+i4550vCxA9kHHdqqyW+N6gntSu2k8T+Hdaz/T0tYMh+q9XExOZBN
 VU1TWUxScOrvpR+OnAlecqSffYsGVwDgpek1okjGLeuLK5QOcXbzgsJqVpPNiPAGzYhj
 7VweaVzk4DuajwUd4rpNMCz9dw/pmqd0fT+hdNFRYQe46XeW04sn49Fcvbsk/6BU/iQV
 45bGrzmz4XB0XyatI+1fPZzLnPg8flwEAe2Li5dHCwTWKnn/LGsXCtAZ6HSKrfOoXiFl
 tVIDn9928lHd/PsWZ+OD1LzG4WvcDCnkowP9ffPMTfqaoiMNCYn+8jrBMIb+qjRqaoVy
 ITRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ew0N9FJRwZlJbbn0yvtd0IVRnzNLNP0ZDU/5N/1+/Do=;
 b=FoPdQDeu27AQD6KznKo/Xu3vHKgxC0jAhBRs+FN+VEyPQctrrHOeCYnIF6HAeY7q/Y
 dAT7xHryiic8vcq3CmNb/BrPl9ZBAqyiFa4+eAYQt1dUgihvewAvO8SgzgweTBKF6RGI
 08HrfKHKtoitjd7LFtSkTECtOr1GjWzc0eAEsurLn6HZxOUxgdI9nqeDiwtMlquKetKi
 eriXIj97eYXi1L2KD55V8RsGvf4CyNGz5ydwyGoS/WopBDIMK4XY5iFdCYtxox4QFP26
 H5zWBB0KtKT7aSZjMQpDUWqmFaBvYAjACuO8Dzy2mpOXnfZD+noglZ8QlhoH5QvJTemh
 2Vww==
X-Gm-Message-State: ANhLgQ2RrPJcSUYPnRrtYR5I0p01KynPcc2uSbY8BxNafNg18IqXNzio
 TbSyfHdGJywF2OCRxD0JSpYgwcWNwZs=
X-Google-Smtp-Source: ADFU+vuiZRbRRiM0qVJR/tANpoejVwBPDD3zquQlE+h7xdCgcHNBrnRsjGNGVdQa3SrjOmwj9ReHYA==
X-Received: by 2002:a05:620a:1092:: with SMTP id
 g18mr2334846qkk.80.1583206667595; 
 Mon, 02 Mar 2020 19:37:47 -0800 (PST)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id 127sm4665357qkj.97.2020.03.02.19.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 19:37:47 -0800 (PST)
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
From: Jonathan Marek <jonathan@marek.ca>
To: Brian Masney <masneyb@onstation.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
 <20200303031335.GA7208@onstation.org>
 <8f47109f-796e-8cd5-d05e-8cdf2d0665ed@marek.ca>
Message-ID: <836f8308-b648-52ff-aa71-448ff0130931@marek.ca>
Date: Mon, 2 Mar 2020 22:36:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <8f47109f-796e-8cd5-d05e-8cdf2d0665ed@marek.ca>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5vdGhlciB0aGluZzogZGlkIHlvdSB2ZXJpZnkgdGhhdCB0aGUgcGFuZWwgc3RpbGwgcnVucyBh
dCA2MGh6IChhbmQgbm90IApkcm9wcGluZyBmcmFtZXMgdG8gMzBoeik/IElJUkMgdGhhdCB3YXMg
dGhlIGJlaGF2aW9yIHdpdGggbG93ZXIgY2xvY2suCgpPbiAzLzIvMjAgMTA6MjggUE0sIEpvbmF0
aGFuIE1hcmVrIHdyb3RlOgo+IAo+IE9uIDMvMi8yMCAxMDoxMyBQTSwgQnJpYW4gTWFzbmV5IHdy
b3RlOgo+PiBPbiBNb24sIE1hciAwMiwgMjAyMCBhdCAwMzo0ODoyMlBNIC0wNTAwLCBKb25hdGhh
biBNYXJlayB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IFRoaXMgaXMgYSBjb21tYW5kIG1vZGUgcGFu
ZWwgYW5kIHRoZSB0aGUgbXNtL21kcDUgZHJpdmVyIHVzZXMgdGhlIAo+Pj4gdnJlZnJlc2gKPj4+
IGZpZWxkIGZvciB0aGUgYWN0dWFsIHJlZnJlc2ggcmF0ZSwgd2hpbGUgdGhlIGRvdGNsb2NrIGZp
ZWxkIGlzIHVzZWQgCj4+PiBmb3IgdGhlCj4+PiBEU0kgY2xvY2tzLiBUaGUgZG90Y2xvY2sgbmVl
ZGVkIHRvIGJlIGEgYml0IGhpZ2hlciB0aGFuIG5lY2Vzc2FyeSAKPj4+IG90aGVyd2lzZQo+Pj4g
dGhlIHBhbmVsIHdvdWxkIG5vdCB3b3JrLgo+Pj4KPj4+IElmIHlvdSB3YW50IHRvIGdldCByaWQg
b2YgdGhlIHNlcGFyYXRlIGNsb2NrL3ZyZWZyZXNoIGZpZWxkcyB0aGVyZSB3b3VsZAo+Pj4gbmVl
ZCB0byBiZSBzb21lIGNoYW5nZXMgdG8gbXNtIGRyaXZlci4KPj4+Cj4+PiAobm90ZSBJIGhhZG4n
dCBtYWRlIHRoZSBwYXRjaCB3aXRoIHVwc3RyZWFtaW5nIGluIG1pbmQsIHRoZSAxNTAwMDAgCj4+
PiB2YWx1ZSBpcwo+Pj4gbGlrZWx5IG5vdCBvcHRpbWFsLCBqdXN0IHNvbWV0aGluZyB0aGF0IHdv
cmtlZCwgdGhpcyBpcyBzb21ldGhpbmcgdGhhdAo+Pj4gc2hvdWxkIGhhdmUgYmVlbiBjaGVja2Vk
IHdpdGggdGhlIGRvd25zdHJlYW0gZHJpdmVyKQo+Pgo+PiBJcyB0aGlzIHRoZSByaWdodCBjbG9j
ayBmcmVxdWVuY3kgaW4gdGhlIGRvd25zdHJlYW0gTVNNIDMuNCBrZXJuZWwgdGhhdAo+PiB5b3Un
cmUgdGFsa2luZyBhYm91dD8KPj4KPj4gaHR0cHM6Ly9naXRodWIuY29tL0FJQ1Ava2VybmVsX2xn
ZV9oYW1tZXJoZWFkL2Jsb2IvbjcuMS9hcmNoL2FybS9tYWNoLW1zbS9jbG9jay04OTc0LmMjTDMz
MjYgCj4+Cj4+Cj4gCj4gTm8sIEknbSB0YWxraW5nIGFib3V0IHRoZSBEU0kgY2xvY2sgKHRoZSBk
cml2ZXIgZm9yIGl0IGlzIGluIAo+IGRybS9tc20vZHNpLykuIEZvciBhIGNvbW1hbmQgbW9kZSBw
YW5lbCB0aGUgZnJvbnQvYmFjayBwb3JjaGVzIGFyZW4ndCAKPiByZWxldmFudCwgYnV0IHRoZSBk
c2kgcGl4ZWwvYnl0ZSBjbG9jayBuZWVkIHRvIGJlIGEgYml0IGhpZ2hlciB0aGFuIAo+IDE5MjB4
MTA4MHg2MC4gU2luY2UgMTI1NDk4IGlzIGEgbGl0dGxlIGhpZ2hlciB0aGFuIDEyNDQxNiB0aGF0
IG1pZ2h0IGJlIAo+IGVub3VnaCAodGhlcmUgaXMgYWxzbyByb3VuZGluZyBvZiB0aGUgY2xvY2sg
dmFsdWVzIHRvIGNvbnNpZGVyKS4KPiAKPj4gSSBkb24ndCBzZWUgYW55IG9idmlvdXMgY2xvY2sg
dmFsdWVzIGluIHRoZSBkb3duc3RyZWFtIGNvbW1hbmQgbW9kZQo+PiBwYW5lbCBjb25maWd1cmF0
aW9uOgo+Pgo+PiBodHRwczovL2dpdGh1Yi5jb20vQUlDUC9rZXJuZWxfbGdlX2hhbW1lcmhlYWQv
YmxvYi9uNy4xL2FyY2gvYXJtL2Jvb3QvZHRzL21zbTg5NzQtaGFtbWVyaGVhZC9tc204OTc0LWhh
bW1lcmhlYWQtcGFuZWwuZHRzaSNMNTkxIAo+Pgo+Pgo+PiBBbnl3YXlzLCBJIHRyaWVkIFZpbGxl
J3MgcGF0Y2ggd2l0aCB0aGUgZnJhbWVidWZmZXIsIGttc2N1YmUsIGFuZCBYMTEKPj4gYW5kIGV2
ZXJ5dGhpbmcgYXBwZWFycyB0byBiZSB3b3JraW5nIGZpbmUuIFlvdSBjYW4gYWRkIG15IFRlc3Rl
ZC1ieSBpZgo+PiB5b3UgZW5kIHVwIGFwcGx5aW5nIHRoaXMuCj4+Cj4+IFRlc3RlZC1ieTogQnJp
YW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4+Cj4+IEJyaWFuCj4+Cj4+Cj4+PiBP
biAzLzIvMjAgMzozNCBQTSwgVmlsbGUgU3lyamFsYSB3cm90ZToKPj4+PiBGcm9tOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Pj4+Cj4+Pj4gVGhlIGN1
cnJlbnRseSBsaXN0ZWQgZG90Y2xvY2sgZGlzYWdyZWVzIHdpdGggdGhlIGN1cnJlbnRseQo+Pj4+
IGxpc3RlZCB2cmVmcmVzaCByYXRlLiBDaGFuZ2UgdGhlIGRvdGNsb2NrIHRvIG1hdGNoIHRoZSB2
cmVmcmVzaC4KPj4+Pgo+Pj4+IFNvbWVvbmUgdGVsbCBtZSB3aGljaCAoaWYgZWl0aGVyKSBvZiB0
aGUgZG90Y2xvY2sgb3IgdnJlcmVzaCBpcwo+Pj4+IGNvcnJlY3Q/Cj4+Pj4KPj4+PiBDYzogSm9u
YXRoYW4gTWFyZWsgPGpvbmF0aGFuQG1hcmVrLmNhPgo+Pj4+IENjOiBCcmlhbiBNYXNuZXkgPG1h
c25leWJAb25zdGF0aW9uLm9yZz4KPj4+PiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyICstCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtc2ltcGxlLmMKPj4+PiBpbmRleCBiMjRmZGYyMzk0NDAuLmY5NThkOGRmZDc2
MCAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMK
Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPj4+PiBAQCAt
Mzk5Niw3ICszOTk2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjX2RzaSAKPj4+
PiBwYW5hc29uaWNfdnZ4MTBmMDA0YjAwID0gewo+Pj4+IMKgwqAgfTsKPj4+PiDCoMKgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBsZ19hY3g0Njdha21fN19tb2RlID0gewo+
Pj4+IC3CoMKgwqAgLmNsb2NrID0gMTUwMDAwLAo+Pj4+ICvCoMKgwqAgLmNsb2NrID0gMTI1NDk4
LAo+Pj4+IMKgwqDCoMKgwqDCoCAuaGRpc3BsYXkgPSAxMDgwLAo+Pj4+IMKgwqDCoMKgwqDCoCAu
aHN5bmNfc3RhcnQgPSAxMDgwICsgMiwKPj4+PiDCoMKgwqDCoMKgwqAgLmhzeW5jX2VuZCA9IDEw
ODAgKyAyICsgMiwKPj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
