Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2C2345F92
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:25:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 763816E90E;
	Tue, 23 Mar 2021 13:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6D66E8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:25:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m12so26594721lfq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2fvU8g8FZ+pWQ8+xisQgBdUFaE3PI9xWKuCuHFrhelw=;
 b=lAP9yE52rMzH022EukemJdb0L8hc5shqMj26/U6KyGoPlcLbZYdrMTweocgjqq0K2k
 Zp3Jte03uRa7cT8IP74VsCKZ0vcULwGx+5F+P7DAGhZjZp7YMMuwDeIMvfS35y53fUuC
 md+p/QMJGaQineJYO4W/E+pH8wbGsRTDo0p0l9zF9hrY97KHV+sYdUoAn/V2KbnMYwWG
 jt7Xb7f+Z+0vCXdCmnuv4IqGI0w/gRHi9bVPhQrRRcICfjSme1SEKE4EndFe7W7YXA8J
 ch/u7LLnS4M4jEyBPhqgYTHhdw3mqmUSBL06SwETYXOYLTqT/hQXTdk7ItqHA22w3wLw
 k27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2fvU8g8FZ+pWQ8+xisQgBdUFaE3PI9xWKuCuHFrhelw=;
 b=jvKAE9AaoOcfeMDGLIYR+VsPT+/xDWuVYHUvE0DV0IgyniJqqc5etM8lX+LTBWtYF+
 55SAh3kjfXIy7/qqPb6pD7QW9cd5PbH4FR4XjykiiL1fygaDhLJTEVw8ttALEWV9p5fN
 iaBuboHF2jrbgytlQ26bFkc8I7GBIon55LygA+aLeMI3zHtJhEZM/eWnkIsytB1k8utb
 kZOo2LckAIVz8+IggruL23Sq8DahE1wk5FWcCFqmyOo/FscWPjBNbzl0zHOh1DgyPmUy
 uOD2GtqKcDH7ZAM31s5Px6yAjr3HKg94merjfg9PemmtFJjQcIryEruHGWYSmSrvx6Xt
 UFmw==
X-Gm-Message-State: AOAM533/m6Xt/kyDwsM5aLrF2OK5FLtRNnqQuaHEptclnAxXcXJUI3SX
 0cMkZJRPcExreByfZKFB31U=
X-Google-Smtp-Source: ABdhPJzVDxNo3t5cd+AXEWslovHMAxTGuWHteBcxtagcsTZqrv+ZYSn3NWYVJsojToTzRSjyr1G0MA==
X-Received: by 2002:a19:c14c:: with SMTP id r73mr2678763lff.581.1616505903009; 
 Tue, 23 Mar 2021 06:25:03 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru.
 [109.252.193.60])
 by smtp.googlemail.com with ESMTPSA id o1sm1844780lfu.299.2021.03.23.06.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 06:25:02 -0700 (PDT)
Subject: Re: [PATCH v5 01/21] gpu: host1x: Use different lock classes for each
 client
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-2-mperttunen@nvidia.com>
 <YFitsk3I2l7IBnLR@orome.fritz.box>
 <6615105f-ccf1-7833-512c-090817c47952@gmail.com>
 <645366c2-c500-efcc-f44c-b933f6f470c4@nvidia.com>
 <6dec95ac-bd92-9434-76ba-eb7fcb316f49@gmail.com>
 <YFnA2HW4EuxaN6Kn@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <302ce6b9-8bb1-db6f-929b-c103a29435cc@gmail.com>
Date: Tue, 23 Mar 2021 16:25:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFnA2HW4EuxaN6Kn@orome.fritz.box>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDMuMjAyMSAxMzoyMCwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE1h
ciAyMiwgMjAyMSBhdCAwNzowMTozNFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IDIyLjAzLjIwMjEgMTg6MTksIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+Pj4gT24gMjIu
My4yMDIxIDE2LjQ4LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+Pj4gMjIuMDMuMjAyMSAxNzo0
NiwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPj4+Pj4gT24gTW9uLCBKYW4gMTEsIDIwMjEg
YXQgMDI6NTk6NTlQTSArMDIwMCwgTWlra28gUGVydHR1bmVuIHdyb3RlOgo+Pj4+Pj4gVG8gYXZv
aWQgZmFsc2UgbG9ja2RlcCB3YXJuaW5ncywgZ2l2ZSBlYWNoIGNsaWVudCBsb2NrIGEgZGlmZmVy
ZW50Cj4+Pj4+PiBsb2NrIGNsYXNzLCBwYXNzZWQgZnJvbSB0aGUgaW5pdGlhbGl6YXRpb24gc2l0
ZSBieSBtYWNyby4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtrbyBQZXJ0dHVuZW4g
PG1wZXJ0dHVuZW5AbnZpZGlhLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUv
aG9zdDF4L2J1cy5jIHwgNyArKysrLS0tCj4+Pj4+PiDCoCBpbmNsdWRlL2xpbnV4L2hvc3QxeC5o
wqDCoCB8IDkgKysrKysrKystCj4+Pj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2hvc3QxeC9idXMuYyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYwo+Pj4+Pj4gaW5kZXgg
MzQ3ZmI5NjJiNmM5Li44ZmM3OWU5Y2I2NTIgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9ob3N0MXgvYnVzLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9idXMuYwo+Pj4+
Pj4gQEAgLTcxNSwxMyArNzE1LDE0IEBAIEVYUE9SVF9TWU1CT0woaG9zdDF4X2RyaXZlcl91bnJl
Z2lzdGVyKTsKPj4+Pj4+IMKgwqAgKiBkZXZpY2UgYW5kIGNhbGwgaG9zdDF4X2RldmljZV9pbml0
KCksIHdoaWNoIHdpbGwgaW4gdHVybiBjYWxsCj4+Pj4+PiBlYWNoIGNsaWVudCdzCj4+Pj4+PiDC
oMKgICogJmhvc3QxeF9jbGllbnRfb3BzLmluaXQgaW1wbGVtZW50YXRpb24uCj4+Pj4+PiDCoMKg
ICovCj4+Pj4+PiAtaW50IGhvc3QxeF9jbGllbnRfcmVnaXN0ZXIoc3RydWN0IGhvc3QxeF9jbGll
bnQgKmNsaWVudCkKPj4+Pj4+ICtpbnQgX19ob3N0MXhfY2xpZW50X3JlZ2lzdGVyKHN0cnVjdCBo
b3N0MXhfY2xpZW50ICpjbGllbnQsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgbG9ja19jbGFzc19rZXkgKmtleSkKPj4+Pj4KPj4+Pj4gSSd2ZSBzZWVuIHRoZSBr
YnVpbGQgcm9ib3Qgd2FybiBhYm91dCB0aGlzIGJlY2F1c2UgdGhlIGtlcm5lbGRvYyBpcyBub3cK
Pj4+Pj4gb3V0IG9mIGRhdGUuCj4+Pj4+Cj4+Pj4+PiDCoCB7Cj4+Pj4+PiDCoMKgwqDCoMKgIHN0
cnVjdCBob3N0MXggKmhvc3QxeDsKPj4+Pj4+IMKgwqDCoMKgwqAgaW50IGVycjsKPj4+Pj4+IMKg
IMKgwqDCoMKgwqAgSU5JVF9MSVNUX0hFQUQoJmNsaWVudC0+bGlzdCk7Cj4+Pj4+PiAtwqDCoMKg
IG11dGV4X2luaXQoJmNsaWVudC0+bG9jayk7Cj4+Pj4+PiArwqDCoMKgIF9fbXV0ZXhfaW5pdCgm
Y2xpZW50LT5sb2NrLCAiaG9zdDF4IGNsaWVudCBsb2NrIiwga2V5KTsKPj4+Pj4KPj4+Pj4gU2hv
dWxkIHdlIG1heWJlIGF0dGVtcHQgdG8gbWFrZSB0aGlzIHVuaXF1ZT8gQ291bGQgd2UgdXNlIHNv
bWV0aGluZyBsaWtlCj4+Pj4+IGRldl9uYW1lKGNsaWVudC0+ZGV2KSBmb3IgdGhpcz8KPj4+Pgo+
Pj4+IEknbSBjdXJpb3VzIHdobyB0aGUgbG9ja2RlcCB3YXJuaW5nIGNvdWxkIGJlIHRyaWdnZXJl
ZCBhdCBhbGwsIEkgZG9uJ3QKPj4+PiByZWNhbGwgZXZlciBzZWVpbmcgaXQuIE1pa2tvLCBjb3Vs
ZCB5b3UgcGxlYXNlIGNsYXJpZnkgaG93IHRvIHJlcHJvZHVjZQo+Pj4+IHRoZSB3YXJuaW5nPwo+
Pj4+Cj4+Pgo+Pj4gVGhpcyBpcyBwcmV0dHkgZGlmZmljdWx0IHRvIHJlYWQgYnV0IEkgZ3Vlc3Mg
aXQncyBzb21lIGludGVyYWN0aW9uCj4+PiByZWxhdGVkIHRvIHRoZSBkZWxheWVkIGluaXRpYWxp
emF0aW9uIG9mIGhvc3QxeCBjbGllbnRzPyBJbiBhbnkgY2FzZSwgSQo+Pj4gY29uc2lzdGVudGx5
IGdldCBpdCBhdCBib290ICh0aG91Z2ggaXQgbWF5IGJlIHRyaWdnZXJlZCBieSB2aWMgcHJvYmUK
Pj4+IGluc3RlYWQgb2YgbnZkZWMpLgo+Pj4KPj4+IEknbGwgZml4IHRoZSBrYnVpbGQgcm9ib3Qg
d2FybmluZ3MgYW5kIHNlZSBpZiBJIGNhbiBhZGQgYQo+Pj4gY2xpZW50LXNwZWNpZmljIGxvY2sg
bmFtZSBmb3IgdjYuCj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24hIFdlIG5v
dyBhY3R1YWxseSBoYXZlIGEgc2ltaWxhciBwcm9ibGVtIG9uIFRlZ3JhMjAgYWZ0ZXIgZml4aW5n
IHRoZSBjb3VwbGluZyBvZiBkaXNwbGF5IGNvbnRyb2xsZXJzIHVzaW5nIHRoZSBkYzFfY2xpZW50
LT5wYXJlbnQ9ZGMwX2NsaWVudCBhbmQgSSBzZWUgdGhlIHNhbWUgd2FybmluZyB3aGVuIERDMSBp
cyBlbmFibGVkLgo+PgouLi4KPiBTb3VuZHMgbGlrZSB3ZSBzaG91bGQgZGVjb3VwbGUgdGhpcyBm
cm9tIHRoZSBzZXJpZXMgYW5kIGZhc3QtdHJhY2sgdGhpcwo+IGZvciB2NS4xMywgb3IgcGVyaGFw
cyBldmVuIHY1LjEyIGFsb25nIHdpdGggdGhlIERDIGNvdXBsaW5nIGZpeD8KCkFncmVlIHRoYXQg
dGhlIHBhdGNoIHNob3VsZCBiZSBkZWNvdXBsZWQgc2luY2UgaXQgZml4ZXMgYSBzdGFuZGFsb25l
CnByb2JsZW0gdGhhdCBpc24ndCByZWxhdGVkIHRvIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzLgoK
SXQgYWxzbyBzaG91bGQgYmUgZ29vZCB0byBoYXZlIGl0IGJhY2twb3J0ZWQsIGFsdGhvdWdoIHRo
aXMgaXMgb3B0aW9uYWwuCklmIHRoZXJlIGFyZSBubyBtZXJnZSBjb25mbGljdHMgd2l0aCBzdGFi
bGUga2VybmVscyBmb3IgdGhpcyBwYXRjaCwgdGhlbgpJJ2QgYWRkIGEgc3RhYmxlIHRhZyB0byBp
dC4KCk1pa2tvLCBwbGVhc2UgdXBkYXRlIHRoaXMgcGF0Y2ggYW5kIHNlbmQgaXQgc2VwYXJhdGVs
eS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
