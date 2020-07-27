Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D92922E72E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 10:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE05E898F0;
	Mon, 27 Jul 2020 08:01:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4495F8979F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 08:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595836869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kFPPskvXLtA3OM8boP9HcoOBUPstBcsqpRElLohYglg=;
 b=OC3kjwObRH6mvMcXyos1zj0fXKqINlEXR++kvJZv43zhXD+ltrenH7e7YtIRY0HkaV3VuG
 f+2pCXqAyOwHkUizN6uAcHoOXvaf6/PjH0mp8ggknsN0eGMFlkbfBDO0L54juHA/tC4vNt
 TS/yHYOSNHUt1M6xSK/L53c7Rmae44c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-TfzIlOpdPF6myWxB3Q8wdQ-1; Mon, 27 Jul 2020 04:01:00 -0400
X-MC-Unique: TfzIlOpdPF6myWxB3Q8wdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782F41DE2;
 Mon, 27 Jul 2020 08:00:57 +0000 (UTC)
Received: from [10.36.114.48] (ovpn-114-48.ams2.redhat.com [10.36.114.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C535072691;
 Mon, 27 Jul 2020 08:00:46 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] xen: add helpers to allocate unpopulated memory
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200724124241.48208-1-roger.pau@citrix.com>
 <20200724124241.48208-5-roger.pau@citrix.com>
 <1778c97f-3a69-8280-141c-879814dd213f@redhat.com>
 <1fd1d29e-5c10-0c29-0628-b79807f81de6@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <6bd01b60-2625-c46e-f9ff-95247700a8cc@redhat.com>
Date: Mon, 27 Jul 2020 10:00:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1fd1d29e-5c10-0c29-0628-b79807f81de6@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQuMDcuMjAgMTg6MzYsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPiBPbiA3LzI0LzIwIDEw
OjM0IEFNLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4gQ0NpbmcgRGFuCj4+Cj4+IE9uIDI0
LjA3LjIwIDE0OjQyLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy94ZW4vdW5wb3B1bGF0ZWQtYWxsb2MuYyBiL2RyaXZlcnMveGVuL3VucG9wdWxhdGVkLWFs
bG9jLmMKPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmFh
YTkxY2VmYmJmOQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvZHJpdmVycy94ZW4vdW5wb3B1
bGF0ZWQtYWxsb2MuYwo+Pj4gQEAgLTAsMCArMSwyMjIgQEAKPiAKPiAKPiAKPj4+ICsgKi8KPj4+
ICsKPj4+ICsjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KPj4+ICsjaW5jbHVkZSA8bGludXgvZ2Zw
Lmg+Cj4+PiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9t
bS5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51eC9tZW1yZW1hcC5oPgo+Pj4gKyNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+Cj4+PiArCj4+PiArI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4+PiArCj4+PiArI2lu
Y2x1ZGUgPHhlbi9wYWdlLmg+Cj4+PiArI2luY2x1ZGUgPHhlbi94ZW4uaD4KPj4+ICsKPj4+ICtz
dGF0aWMgREVGSU5FX01VVEVYKGxvY2spOwo+Pj4gK3N0YXRpYyBMSVNUX0hFQUQobGlzdCk7Cj4+
PiArc3RhdGljIHVuc2lnbmVkIGludCBjb3VudDsKPj4+ICsKPj4+ICtzdGF0aWMgaW50IGZpbGwo
dW5zaWduZWQgaW50IG5yX3BhZ2VzKQo+IAo+IAo+IExlc3MgZ2VuZXJpYyBuYW1lcz8gSG93IGFi
b3V0wqAgbGlzdF9sb2NrLCBwZ19saXN0LCBwZ19jb3VudCwKPiBmaWxsX3BnbGlzdCgpPyAoQnV0
IHRoZXNlIGFyZSBiYWQgdG9vLCBzbyBtYXliZSB5b3UgY2FuIGNvbWUgdXAgd2l0aAo+IHNvbWV0
aGluZyBiZXR0ZXIpCj4gCj4gCj4+PiArewo+Pj4gKwlzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFw
Owo+Pj4gKwl2b2lkICp2YWRkcjsKPj4+ICsJdW5zaWduZWQgaW50IGksIGFsbG9jX3BhZ2VzID0g
cm91bmRfdXAobnJfcGFnZXMsIFBBR0VTX1BFUl9TRUNUSU9OKTsKPj4+ICsJaW50IG5pZCwgcmV0
Owo+Pj4gKwo+Pj4gKwlwZ21hcCA9IGt6YWxsb2Moc2l6ZW9mKCpwZ21hcCksIEdGUF9LRVJORUwp
Owo+Pj4gKwlpZiAoIXBnbWFwKQo+Pj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4+PiArCj4+PiArCXBn
bWFwLT50eXBlID0gTUVNT1JZX0RFVklDRV9ERVZEQVg7Cj4+PiArCXBnbWFwLT5yZXMubmFtZSA9
ICJYRU4gU0NSQVRDSCI7Cj4gCj4gCj4gVHlwaWNhbGx5IGlvbWVtIHJlc291cmNlcyBvbmx5IGNh
cGl0YWxpemUgZmlyc3QgbGV0dGVycy4KPiAKPiAKPj4+ICsJcGdtYXAtPnJlcy5mbGFncyA9IElP
UkVTT1VSQ0VfTUVNIHwgSU9SRVNPVVJDRV9CVVNZOwo+Pj4gKwo+Pj4gKwlyZXQgPSBhbGxvY2F0
ZV9yZXNvdXJjZSgmaW9tZW1fcmVzb3VyY2UsICZwZ21hcC0+cmVzLAo+Pj4gKwkJCQlhbGxvY19w
YWdlcyAqIFBBR0VfU0laRSwgMCwgLTEsCj4+PiArCQkJCVBBR0VTX1BFUl9TRUNUSU9OICogUEFH
RV9TSVpFLCBOVUxMLCBOVUxMKTsKPiAKPiAKPiBBcmUgd2Ugbm90IGdvaW5nIHRvIGVuZCB1cCB3
aXRoIGEgd2hvbGUgYnVuY2ggb2YgIlhlbiBzY3JhdGNoIiByZXNvdXJjZQo+IHJhbmdlcyBmb3Ig
ZWFjaCBtaXNzIGluIHRoZSBwYWdlIGxpc3Q/IE9yIGRvIHdlIGV4cGVjdCB0aGVtIHRvIGdldCBt
ZXJnZWQ/Cj4gCgpBRkFJSywgbm8gcmVzb3VyY2VzIHdpbGwgZ2V0IG1lcmdlZCAoYW5kIGl0J3Mg
aW4gdGhlIGdlbmVyYWwgY2FzZSBub3QKc2FmZSB0byBkbykuIFRoZSBvbGQgYXBwcm9hY2ggKGFk
ZF9tZW1vcnlfcmVzb3VyY2UoKSkgd2lsbCBlbmQgdXAgd2l0aAp0aGUgc2FtZSBzaXR1YXRpb24g
KCJYZW4gU2NyYXRjaCIgdnMuICJTeXN0ZW0gUkFNIikgb25lIG5ldyByZXNvdXJjZSBwZXIKYWRk
ZWQgbWVtb3J5IGJsb2NrL3NlY3Rpb24uCgpGV0lXLCBJIGFtIGxvb2tpbmcgaW50byBtZXJnaW5n
IHNlbGVjdGVkIHJlc291cmNlcyBpbiB0aGUgY29udGV4dCBvZgp2aXJ0aW8tbWVtIF9hZnRlcl8g
YWRkaW5nIHN1Y2NlZWRlZCAobm90IGRpcmVjdGx5IHdoZW4gYWRkaW5nIHRoZQpyZXNvdXJjZSB0
byB0aGUgdHJlZSkuIEludGVyZmFjZSBtaWdodCBsb29rIHNvbWV0aGluZyBsaWtlCgp2b2lkIG1l
cmdlX2NoaWxkX21lbV9yZXNvdXJjZXMoc3RydWN0IHJlc291cmNlICpwYXJlbnQsIGNvbnN0IGNo
YXIgKm5hbWUpOwoKU28gSSBjYW4sIGZvciBleGFtcGxlLCB0cmlnZ2VyIG1lcmdpbmcgb2YgYWxs
ICJTeXN0ZW0gUkFNICh2aXJ0aW9fbWVtKSIKcmVzb3VyY2VzLCB0aGF0IGFyZSBsb2NhdGVkIHVu
ZGVyIGEgZGV2aWNlIG5vZGUgKGUuZy4sICJ2aXJ0aW8wIikuCgpJIGFsc28gdGhvdWdodCBhYm91
dCB0YWdnaW5nIGVhY2ggbWVyZ2VhYmxlIHJlc291cmNlIHZpYSBzb21ldGhpbmcgbGlrZQoiSU9S
RVNPVVJDRV9NRVJHRUFCTEUiIC0gd2hlcmVieSB0aGUgdXNlciBhZ3JlZXMgdGhhdCBpdCBkb2Vz
IG5vdCBob2xkCmFueSBwb2ludGVycyB0byBzdWNoIGEgcmVzb3VyY2UuIEJ1dCBJIGRvbid0IHNl
ZSB5ZXQgYSBjb3BlbGxpbmcgcmVhc29uCnRvIHNhY3JpZmljZSBzcGFjZSBmb3IgYSBuZXcgZmxh
Zy4KClNvIHdpdGggdGhpcyBpbiBwbGFjZSwgdGhpcyBjb2RlIGNvdWxkIGNhbGwgb25jZSBhZGRp
bmcgc3VjY2VlZGVkCgptZXJnZV9jaGlsZF9tZW1fcmVzb3VyY2VzKCZpb21lbV9yZXNvdXJjZSwg
IlhlbiBTY3JhdGNoIik7CgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
