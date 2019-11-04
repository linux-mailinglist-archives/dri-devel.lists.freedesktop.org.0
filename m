Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23228EDC6C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 11:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6AB6E266;
	Mon,  4 Nov 2019 10:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB576E266
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 10:24:49 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e6so14530278wrw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 02:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Hvkk7RONc9SrfQNrWrK3s3UYcl8AIEq79yP2mzZcaZA=;
 b=N4d8tIk83ybvZposQv1hRuRdbtTF3i2RnVRNmZSF8EJGLdNs6ujNtIyc6HLgDu3O6m
 3KaWHP6gHWE2TceZlNVrv64dZ+JAP4i5paNtdm57dhtkrbPGKcfs6aae+QZep6asDgfM
 3LuLj2B/lL43uDdytQShuo2vOhHH/r4B9i29m1e2fCgH0C54TbNlPZcEhu8L5Jitk0aV
 WXIpOPxOgzTv2iklOocZgSTOd9S7XTgqHLKnbEer7ZjZcY/ooaBnuU9SPp6k/1Th6HWS
 FHrjwApDf20RbhtncL3jwUE4Md4mxlOODhwrOxpT2LioIB2K0oOkj2WsihSByTwTG6CR
 8olg==
X-Gm-Message-State: APjAAAVN8IEotCmjpe3sb8NsgV0KcGBVJ+DqVrhYc69uezZCMQF8tABb
 psw/8J+Row3LLche325mc29Chg==
X-Google-Smtp-Source: APXvYqyrMVjUdiJaQjzgMyOTS8FWPykBYXOG+rwf6O+oLUfiLei6jNj6k8cIGflHK7qS8E+0dnsDOg==
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr20907185wrn.24.1572863087835; 
 Mon, 04 Nov 2019 02:24:47 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v16sm17579034wrc.84.2019.11.04.02.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 02:24:47 -0800 (PST)
Date: Mon, 4 Nov 2019 11:24:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [RFC][PATCH 2/2] dma-buf: heaps: Allow system & cma heaps to be
 configured as a modules
Message-ID: <20191104102445.GE10326@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Sandeep Patil <sspatil@google.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>,
 Liam Mark <lmark@codeaurora.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>
References: <20191025234834.28214-1-john.stultz@linaro.org>
 <20191025234834.28214-3-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191025234834.28214-3-john.stultz@linaro.org>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Hvkk7RONc9SrfQNrWrK3s3UYcl8AIEq79yP2mzZcaZA=;
 b=eSNWnwv3fB7Fj0a7kurApPAHHox5dFhx/NM3EAsFGjte7RLs9BE5V64dy8FlNtLzEW
 6KxCKQQP9FfDdFQbjmXcpbvyWk+JY0eAuXm+Rq3ubuLbfl43Nx0vFV+MWOsHq//iw+ZO
 0iYtdKt8PWGTGIndD4hc5wcMHW+maRs2aRUlc=
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
Cc: Sandeep Patil <sspatil@google.com>, Chenbo Feng <fengc@google.com>,
 Alistair Strachan <astrachan@google.com>, Liam Mark <lmark@codeaurora.org>,
 lkml <linux-kernel@vger.kernel.org>, Yue Hu <huyue2@yulong.com>,
 dri-devel@lists.freedesktop.org, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMjUsIDIwMTkgYXQgMTE6NDg6MzRQTSArMDAwMCwgSm9obiBTdHVsdHogd3Jv
dGU6Cj4gQWxsb3cgbG9hZGluZyBzeXN0ZW0gYW5kIGNtYSBoZWFwIGFzIGEgbW9kdWxlIGluc3Rl
YWQgb2YganVzdCBhcwo+IGEgc3RhdGljYWxseSBidWlsdCBpbiBoZWFwLgo+IAo+IFNpbmNlIHRo
ZXJlIGlzbid0IGEgZ29vZCBtZWNoYW5pc20gZm9yIGRtYWJ1ZiBsaWZldGltZSB0cmFja2luZwo+
IGl0IGlzbid0IHNhZmUgdG8gYWxsb3cgdGhlIGhlYXAgZHJpdmVycyB0byBiZSB1bmxvYWRlZCwg
c28gdGhlc2UKPiBkcml2ZXJzIGRvIG5vdCBpbXBsZW1lbnQgYW55IG1vZHVsZSB1bmxvYWRpbmcg
ZnVuY3Rpb25hbGl0eSBhbmQKPiB3aWxsIHNob3cgdXAgaW4gbHNtb2QgYXMgIltwZXJtYW5lbnRd
Ii4KCmRtYS1idWYgaXRzZWxmIGhhcyBhbGwgdGhlIHRyeV9tb2R1bGVfZ2V0IHdlJ2xsIG5lZWQg
Li4uIHdoeSBpcyB0aGlzIG5vdApwb3NzaWJsZT8KLURhbmllbAoKPiAKPiBUaGlzIHBhdGNoIGFs
c28gZXhwb3J0cyBrZXkgZnVuY3Rpb25zIGZyb20gZG1hYnVmIGhlYXBzIGNvcmUgYW5kCj4gdGhl
IGhlYXAgaGVscGVyIGZ1bmN0aW9ucyBzbyB0aGV5IGNhbiBiZSBhY2Nlc3NlZCBieSB0aGUgbW9k
dWxlLgo+IAo+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRAcmVkaGF0LmNvbT4KPiBDYzogQmVu
amFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4gQ2M6IExpYW0gTWFyayA8bG1hcmtA
Y29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFByYXRpayBQYXRlbCA8cHJhdGlrcEBjb2RlYXVyb3JhLm9y
Zz4KPiBDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3RhcmtleUBhcm0uY29tPgo+IENjOiBBbmRy
ZXcgRi4gRGF2aXMgPGFmZEB0aS5jb20+Cj4gQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+Cj4gQ2M6IFl1ZSBIdSA8aHV5dWUyQHl1bG9uZy5jb20+Cj4gQ2M6IE1p
a2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4KPiBDYzogQ2hlbmJvIEZlbmcgPGZlbmdj
QGdvb2dsZS5jb20+Cj4gQ2M6IEFsaXN0YWlyIFN0cmFjaGFuIDxhc3RyYWNoYW5AZ29vZ2xlLmNv
bT4KPiBDYzogU2FuZGVlcCBQYXRpbCA8c3NwYXRpbEBnb29nbGUuY29tPgo+IENjOiBIcmlkeWEg
VmFsc2FyYWp1IDxocmlkeWFAZ29vZ2xlLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5h
cm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyAgICAgICAgICAgfCAy
ICsrCj4gIGRyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnICAgICAgICB8IDQgKystLQo+ICBk
cml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgfCAyICsrCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5jCj4g
aW5kZXggOWE0MWI3M2U1NGI0Li4yYzRhYzcxYTcxNWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9k
bWEtYnVmL2RtYS1oZWFwLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWhlYXAuYwo+IEBA
IC0xNjEsNiArMTYxLDcgQEAgdm9pZCAqZG1hX2hlYXBfZ2V0X2RydmRhdGEoc3RydWN0IGRtYV9o
ZWFwICpoZWFwKQo+ICB7Cj4gIAlyZXR1cm4gaGVhcC0+cHJpdjsKPiAgfQo+ICtFWFBPUlRfU1lN
Qk9MX0dQTChkbWFfaGVhcF9nZXRfZHJ2ZGF0YSk7Cj4gIAo+ICBzdHJ1Y3QgZG1hX2hlYXAgKmRt
YV9oZWFwX2FkZChjb25zdCBzdHJ1Y3QgZG1hX2hlYXBfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQo+
ICB7Cj4gQEAgLTI0Myw2ICsyNDQsNyBAQCBzdHJ1Y3QgZG1hX2hlYXAgKmRtYV9oZWFwX2FkZChj
b25zdCBzdHJ1Y3QgZG1hX2hlYXBfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQo+ICAJa2ZyZWUoaGVh
cCk7Cj4gIAlyZXR1cm4gZXJyX3JldDsKPiAgfQo+ICtFWFBPUlRfU1lNQk9MX0dQTChkbWFfaGVh
cF9hZGQpOwo+ICAKPiAgc3RhdGljIGNoYXIgKmRtYV9oZWFwX2Rldm5vZGUoc3RydWN0IGRldmlj
ZSAqZGV2LCB1bW9kZV90ICptb2RlKQo+ICB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1
Zi9oZWFwcy9LY29uZmlnIGIvZHJpdmVycy9kbWEtYnVmL2hlYXBzL0tjb25maWcKPiBpbmRleCBh
NWVlZjA2YzQyMjYuLmUyNzNmYjE4ZmVjYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYv
aGVhcHMvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9LY29uZmlnCj4gQEAg
LTEsMTIgKzEsMTIgQEAKPiAgY29uZmlnIERNQUJVRl9IRUFQU19TWVNURU0KPiAtCWJvb2wgIkRN
QS1CVUYgU3lzdGVtIEhlYXAiCj4gKwl0cmlzdGF0ZSAiRE1BLUJVRiBTeXN0ZW0gSGVhcCIKPiAg
CWRlcGVuZHMgb24gRE1BQlVGX0hFQVBTCj4gIAloZWxwCj4gIAkgIENob29zZSB0aGlzIG9wdGlv
biB0byBlbmFibGUgdGhlIHN5c3RlbSBkbWFidWYgaGVhcC4gVGhlIHN5c3RlbSBoZWFwCj4gIAkg
IGlzIGJhY2tlZCBieSBwYWdlcyBmcm9tIHRoZSBidWRkeSBhbGxvY2F0b3IuIElmIGluIGRvdWJ0
LCBzYXkgWS4KPiAgCj4gIGNvbmZpZyBETUFCVUZfSEVBUFNfQ01BCj4gLQlib29sICJETUEtQlVG
IENNQSBIZWFwIgo+ICsJdHJpc3RhdGUgIkRNQS1CVUYgQ01BIEhlYXAiCj4gIAlkZXBlbmRzIG9u
IERNQUJVRl9IRUFQUyAmJiBETUFfQ01BCj4gIAloZWxwCj4gIAkgIENob29zZSB0aGlzIG9wdGlv
biB0byBlbmFibGUgZG1hLWJ1ZiBDTUEgaGVhcC4gVGhpcyBoZWFwIGlzIGJhY2tlZAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMgYi9kcml2ZXJzL2Rt
YS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKPiBpbmRleCA3NTBiZWY0ZTkwMmQuLmZiOTgzNTEy
Njg5MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMK
PiArKysgYi9kcml2ZXJzL2RtYS1idWYvaGVhcHMvaGVhcC1oZWxwZXJzLmMKPiBAQCAtMjQsNiAr
MjQsNyBAQCB2b2lkIGluaXRfaGVhcF9oZWxwZXJfYnVmZmVyKHN0cnVjdCBoZWFwX2hlbHBlcl9i
dWZmZXIgKmJ1ZmZlciwKPiAgCUlOSVRfTElTVF9IRUFEKCZidWZmZXItPmF0dGFjaG1lbnRzKTsK
PiAgCWJ1ZmZlci0+ZnJlZSA9IGZyZWU7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTF9HUEwoaW5pdF9o
ZWFwX2hlbHBlcl9idWZmZXIpOwo+ICAKPiAgc3RydWN0IGRtYV9idWYgKmhlYXBfaGVscGVyX2V4
cG9ydF9kbWFidWYoc3RydWN0IGhlYXBfaGVscGVyX2J1ZmZlciAqYnVmZmVyLAo+ICAJCQkJCSAg
aW50IGZkX2ZsYWdzKQo+IEBAIC0zNyw2ICszOCw3IEBAIHN0cnVjdCBkbWFfYnVmICpoZWFwX2hl
bHBlcl9leHBvcnRfZG1hYnVmKHN0cnVjdCBoZWFwX2hlbHBlcl9idWZmZXIgKmJ1ZmZlciwKPiAg
Cj4gIAlyZXR1cm4gZG1hX2J1Zl9leHBvcnQoJmV4cF9pbmZvKTsKPiAgfQo+ICtFWFBPUlRfU1lN
Qk9MX0dQTChoZWFwX2hlbHBlcl9leHBvcnRfZG1hYnVmKTsKPiAgCj4gIHN0YXRpYyB2b2lkICpk
bWFfaGVhcF9tYXBfa2VybmVsKHN0cnVjdCBoZWFwX2hlbHBlcl9idWZmZXIgKmJ1ZmZlcikKPiAg
ewo+IC0tIAo+IDIuMTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
