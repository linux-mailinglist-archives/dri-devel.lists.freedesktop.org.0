Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC5F79DB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 18:25:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94CF6E95D;
	Mon, 11 Nov 2019 17:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D18896E95D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 17:25:38 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-OBPNvFzQN6iUMHKn6xDw6w-1; Mon, 11 Nov 2019 12:25:36 -0500
Received: by mail-wr1-f71.google.com with SMTP id m17so10279140wrb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 09:25:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WKB2HryQIqlNIRR+rNo5e2G1rTVv/dbjaRg3rwVLp3c=;
 b=djx5+RjIuHXBDFoJgvBYk59oLrFlLtKmzprXM8ZXiPy3EvxZ+7f1jtNpoxLYi/lySi
 wfhoTvfQ0EBjrEUxqrUwidIaCDM3RthI5lP22WUq8NjTjIFFiFuSiJyZl8Q1ZoSkAm4X
 xhELhezNm8DfbhmAFFt6gJDRdFfULD161b5uTKig7c+jgEoLPMSl4PTUpNqpedS9dEbW
 i8KI640Kos7n5CD2sFZD2W//xkktWx9jUVg7ku6rwCEYhW0+tOfTd0llh21PR7L7MZoI
 OzYwq8GP3W7yGLulsTfWooor9rAaaD48FVTgmfId+FR1C83gzoDRWpSuk8cAYTBjGQl8
 ANSQ==
X-Gm-Message-State: APjAAAWnEOstSk1FPLIerWQ7gxk7inEknpkLfvZj/wB7i8dN2KpAXEtd
 yXnWjTCAP06DXUNbfvGWBG3kGa4pgFEerFV6QcAR90VcDSnj/0I4uUhM39xZQULTaT2xUjPXcZe
 itB2e1SXdqqg/ZBnGnhY/oOogQEQU
X-Received: by 2002:a1c:e308:: with SMTP id a8mr71775wmh.55.1573493135114;
 Mon, 11 Nov 2019 09:25:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqy4jr1j9SbWEy23sDgGUBXtUFgUw3vZlXJHHY8PoSCVdsyBpHSpBymBY7X5DTg8YRr8dBFr9w==
X-Received: by 2002:a1c:e308:: with SMTP id a8mr71755wmh.55.1573493134900;
 Mon, 11 Nov 2019 09:25:34 -0800 (PST)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id x6sm15801461wrw.34.2019.11.11.09.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2019 09:25:34 -0800 (PST)
Subject: Re: [PATCH 09/12] drm/modes: parse_cmdline: Add support for
 specifying panel_orientation
To: Maxime Ripard <mripard@kernel.org>
References: <20191110154101.26486-1-hdegoede@redhat.com>
 <20191110154101.26486-10-hdegoede@redhat.com>
 <20191111125358.GP4345@gilmour.lan>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7f0bf3c5-50cb-108a-fbb0-d3933b12643c@redhat.com>
Date: Mon, 11 Nov 2019 18:25:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191111125358.GP4345@gilmour.lan>
Content-Language: en-US
X-MC-Unique: OBPNvFzQN6iUMHKn6xDw6w-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573493137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i82fm/U6/fY4+oEKtFB4N/Iauhs3hQtqhm7oFUpY/FU=;
 b=eNaTxY3AwjYTP8Y6EJNPf3bIsSR3yTg0PcNvb79UpwJPbnXFYgkHi/6WwsWfIOnmLeDLoX
 2mkKSYRyLA+ICB+S3bP2DPKk2Qmh8/UaXv55K6vLKKvYbOLHj4VPXqE/oM+Py5GEg8BaEH
 1O73aXceJYgKuiAlNhZQr8+sApPPi7c=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Mathieu_Alexandre-T=c3=a9treault?= <alexandretm@amotus.ca>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMS0xMS0yMDE5IDEzOjUzLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+IEhpIEhhbnMs
Cj4gCj4gVGhhbmtzIGZvciB0aGlzIHNlcmllcyAoYW5kIHRoYW5rcyBmb3IgYm91bmNpbmcgdGhl
IG1haWxzIHRvbykuCj4gCj4gQWxsIHRoZSBwcmV2aW91cyBwYXRjaGVzIGFyZQo+IEFja2VkLWJ5
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CgpUaGFuayB5b3UgZm9yIHRoZSBy
ZXZpZXcuCgo+IE9uIFN1biwgTm92IDEwLCAyMDE5IGF0IDA0OjQwOjU4UE0gKzAxMDAsIEhhbnMg
ZGUgR29lZGUgd3JvdGU6Cj4+IFNvbWV0aW1lcyB3ZSB3YW50IHRvIG92ZXJyaWRlIGEgY29ubmVj
dG9yJ3MgcGFuZWxfb3JpZW50YXRpb24gZnJvbSB0aGUKPj4ga2VybmVsIGNvbW1hbmRsaW5lLiBF
aXRoZXIgZm9yIHRlc3RpbmcgYW5kIGZvciBzcGVjaWFsIGNhc2VzLCBlLmcuIGEga2lvc2sKPj4g
bGlrZSBzZXR1cCB3aGljaCB1c2VzIGEgVFYgbW91bnRlZCBpbiBwb3J0cmFpdCBtb2RlLgo+Pgo+
PiBVc2VycyBjYW4gYWxyZWFkeSBzcGVjaWZ5IGEgInJvdGF0ZSIgb3B0aW9uIHRocm91Z2ggYSB2
aWRlbz0ga2VybmVsIGNtZGxpbmUKPj4gb3B0aW9uLiBCdXQgdGhhdCBvbmx5IHN1cHBvcnRzIDAv
MTgwIGRlZ3JlZXMgKHNlZSBkcm1fY2xpZW50X21vZGVzZXQgVE9ETykKPj4gYW5kIG9ubHkgd29y
a3MgZm9yIGluIGtlcm5lbCBtb2Rlc2V0IGNsaWVudHMsIG5vdCBmb3IgdXNlcnNwYWNlIGttcyB1
c2Vycy4KPj4KPj4gVGhlICJwYW5lbC1vcmllbnRhdGlvbiIgY29ubmVjdG9yIHByb3BlcnR5IE9U
T0ggZG9lcyBzdXBwb3J0IDkwLzI3MCBkZWdyZWVzCj4+IGFzIGl0IGxlYXZlcyBkZWFsaW5nIHdp
dGggdGhlIHJvdGF0aW9uIHVwIHRvIHVzZXJzcGFjZSBhbmQgdGhpcyBkb2VzIHdvcmsKPj4gZm9y
IHVzZXJzcGFjZSBrbXMgY2xpZW50cyAoYXQgbGVhc3QgdGhvc2Ugd2hpY2ggc3VwcG9ydCB0aGlz
IHByb3BlcnR5KS4KPj4KPj4gQnVnTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L3BseW1vdXRoL3BseW1vdXRoL21lcmdlX3JlcXVlc3RzLzgzCj4+IFNpZ25lZC1vZmYtYnk6IEhh
bnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4+IC0tLQo+PiAgIERvY3VtZW50YXRp
b24vZmIvbW9kZWRiLnJzdCAgICAgICAgICAgICAgICAgICB8ICAzICsrCj4+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV9tb2Rlcy5jICAgICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysr
KysrKwo+PiAgIC4uLi9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaCB8
ICAxICsKPj4gICAuLi4vZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9jbWRsaW5lX3BhcnNlci5jICAg
fCAyMiArKysrKysrKysrKysrCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAg
ICAgICAgICAgICAgIHwgIDggKysrKysKPj4gICA1IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlv
bnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmIvbW9kZWRiLnJzdCBiL0Rv
Y3VtZW50YXRpb24vZmIvbW9kZWRiLnJzdAo+PiBpbmRleCA5YzRlM2ZkMzllNmQuLjYyNGQwOGZk
Mjg1NiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9mYi9tb2RlZGIucnN0Cj4+ICsrKyBi
L0RvY3VtZW50YXRpb24vZmIvbW9kZWRiLnJzdAo+PiBAQCAtNjUsNiArNjUsOSBAQCBWYWxpZCBv
cHRpb25zIGFyZTo6Cj4+ICAgICAtIHJlZmxlY3RfeSAoYm9vbGVhbik6IFBlcmZvcm0gYW4gYXhp
YWwgc3ltbWV0cnkgb24gdGhlIFkgYXhpcwo+PiAgICAgLSByb3RhdGUgKGludGVnZXIpOiBSb3Rh
dGUgdGhlIGluaXRpYWwgZnJhbWVidWZmZXIgYnkgeAo+PiAgICAgICBkZWdyZWVzLiBWYWxpZCB2
YWx1ZXMgYXJlIDAsIDkwLCAxODAgYW5kIDI3MC4KPj4gKyAgLSBwYW5lbF9vcmllbnRhdGlvbiwg
b25lIG9mICJub3JtYWwiLCAidXBzaWRlX2Rvd24iLCAibGVmdF9zaWRlX3VwIiwgb3IKPj4gKyAg
ICAicmlnaHRfc2lkZV91cCIuIEZvciBLTVMgZHJpdmVycyBvbmx5LCB0aGlzIHNldHMgdGhlICJw
YW5lbCBvcmllbnRhdGlvbiIKPj4gKyAgICBwcm9wZXJ0eSBvbiB0aGUga21zIGNvbm5lY3RvciBh
cyBoaW50IGZvciBrbXMgdXNlcnMuCj4gCj4gRXZlbiB0aG91Z2ggdGhlIHNlbWFudGljIGlzIGEg
Yml0IGRpZmZlcmVudCwgSSB0aGluayB3ZSBzaG91bGQgcmVtYWluCj4gY29uc2lzdGVudCBhbmQg
aGF2ZSB0aGUgc2FtZSBhcmd1bWVudCB0aGFuIGZvciByb3RhdGUgKGllLCBzdGVwcyBpbgo+IGNs
b2Nrd2lzZSByb3RhdGlvbiBpbiBzdGVwcyBvZiA5MCBkZWdyZWVzKS4KCldlbGwgdGhlIGtlcm5l
bCBrbXMgZGVmaW5lcyBmb3Igcm90YXRpb24gYWxzbyB0YWxrIGFib3V0IDkwICAvIDE4MCAvIDI3
MCI6CgojZGVmaW5lIERSTV9NT0RFX1JPVEFURV8wICAgICAgICgxPDwwKQojZGVmaW5lIERSTV9N
T0RFX1JPVEFURV85MCAgICAgICgxPDwxKQojZGVmaW5lIERSTV9NT0RFX1JPVEFURV8xODAgICAg
ICgxPDwyKQojZGVmaW5lIERSTV9NT0RFX1JPVEFURV8yNzAgICAgICgxPDwzKQoKV2hlcmUgYXMg
dGhlIHBhbmVsIG9yaWVudGF0aW9uIHVzZXMgc3RyaW5ncyBsaWtlIHJpZ2h0X3NpZGVfdXAsIHdo
aWNoIG1lYW5zCnRoYXQgdGhlIHNpZGUgb2YgdGhlIHBhbmVsIHdoaWNoIG5vcm1hbGx5IGlzIHRo
ZSByaWdodCBzaWRlIG9mIHRoZSBwYW5lbAppcyBub3cgcG9pbnRpbmcgdXAgYXMgdGhlIHBhbmVs
IGlzIG1vdW50ZWQgOTAgZGVncmVlcyByb3RhdGVkIHdpdGggaXRzCm9yaWdpbmFsIHJpZ2h0IHNp
ZGUgbm93IHBvaW50aW5nIHVwLiBUaGlzIElNSE8gaXMgbXVjaCBjbGVhcmVyIHRoZW4KOTAgLyAy
NzAgZGVncmVlcyB3aGljaCBhcmUgYW1iaWd1b3VzIGFuZCBwZXJoYXBzIG1vcmUgaW1wb3J0YW50
bHkgdGhpcwptYXRjaGVzIHRoZSBrZXJuZWwgZGVmaW5lcyBmb3IgcGFuZWwtb3JpZW50YXRpb24g
YW5kIG1hdGNoZXMgdGhlClN0cmluZyB2YWx1ZXMgZW51bWVyYXRlZCBieSB0aGUgZW51bSB0eXBl
IHBhbmVsLW9yaWVudGF0aW9uIGNvbm5lY3Rvcgpwcm9wZXJ0eToKCnN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX3Byb3BfZW51bV9saXN0IGRybV9wYW5lbF9vcmllbnRhdGlvbl9lbnVtX2xpc3RbXSA9
IHsKICAgICAgICAgeyBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9OT1JNQUwsICAgICJOb3Jt
YWwiICAgICAgICB9LAogICAgICAgICB7IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX0JPVFRP
TV9VUCwgIlVwc2lkZSBEb3duIiAgIH0sCiAgICAgICAgIHsgRFJNX01PREVfUEFORUxfT1JJRU5U
QVRJT05fTEVGVF9VUCwgICAiTGVmdCBTaWRlIFVwIiAgfSwKICAgICAgICAgeyBEUk1fTU9ERV9Q
QU5FTF9PUklFTlRBVElPTl9SSUdIVF9VUCwgICJSaWdodCBTaWRlIFVwIiB9LAp9OwoKU28gSSB3
b3VsZCBwcmVmZXIgdG8gc3RpY2sgdG8gdGhlIHN0cmluZ3MuCgpSZWdhcmRzLAoKSGFucwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
