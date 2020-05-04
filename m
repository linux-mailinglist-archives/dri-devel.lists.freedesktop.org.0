Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAC81C389F
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 13:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88C76E3A4;
	Mon,  4 May 2020 11:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D326E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 11:53:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x18so20566733wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 04:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=5qnwIYGk3+7csMDGhDfT78y1tC0I7zaU/dNEhm/Gdrw=;
 b=dugK3r3ZitE29ERypoY8YadxZqPS0Z+2R4hMbiT7dJ25vLFnA6kxaL+ncVer9maN7O
 2gqsaoqR2kWjRjaJt8EqT7v11TIRWMyAZJvYbv0juk18RmDrJCFIt0iB8gIGIosYlgV3
 fGfpeQ0X8InFpU6T6j4q1RJZG2w8qCaKA0Vxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=5qnwIYGk3+7csMDGhDfT78y1tC0I7zaU/dNEhm/Gdrw=;
 b=TkXc4s02O64tDVkTfwYbGtu97eInq1I3rkiKqYaBboPRr141PBNzTnlYl38c4DazfJ
 AN8kfllilcr+3E/5JFv0SE5bcYyhMmI7crzhDWfeGVaeB90RVNtfIBhvL2RYj41IWyOl
 Q1f58+rlyZ11ORZhICE2u6V8QuOi2AmXAWrk2vR9911GHEZg97S+TCKcMei0SDCtwGNB
 kSp0yFp2RNmOOW7UUfO8pbrVrTiOKs4D4eJQ5jgCDNZ4bnGn6g+s8JO4ghmalD/dTUsu
 poT/oiEXr2at5kHZX1Gkki3ALwXWWLcc9h1+OZyhs/sMHRswz2eIUQbfiaGvyIPrwNNH
 /N0w==
X-Gm-Message-State: AGi0PubWlhq23wn/1ZokXWe8tfPi9t/GZ05EG2sZRKCOHG5H8IZzcJEN
 hrCDvwohdW1YERz8BMH3vIPmdg==
X-Google-Smtp-Source: APiQypJKrPt1EEj1YrXlvddxBnrFJ498AdAVqWgFS3O09/aRctH1Z/cFuyy4O+/CRgLba4NfdGW58g==
X-Received: by 2002:a05:6000:8b:: with SMTP id
 m11mr18909418wrx.168.1588593192240; 
 Mon, 04 May 2020 04:53:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g10sm6178750wrx.4.2020.05.04.04.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:53:11 -0700 (PDT)
Date: Mon, 4 May 2020 13:53:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?utf-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>
Subject: Re: [PATCH] drm: Replace drm_modeset_lock/unlock_all with
 DRM_MODESET_LOCK_ALL_* helpers
Message-ID: <20200504115309.GJ10381@phenom.ffwll.local>
Mail-Followup-To: =?utf-8?B?TWljaGHFgiBPcnplxYI=?= <michalorzel.eng@gmail.com>, 
 Sean Paul <seanpaul@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <1588093804-30446-1-git-send-email-michalorzel.eng@gmail.com>
 <875zdiacv2.fsf@intel.com>
 <CAOw6vbK69aWzti9a7MXNmAfVfJXzzC5g74p4ukSE49MhaV_b3g@mail.gmail.com>
 <CAKMK7uEzTn2nKyEaxMcd6602tprwkdnBrmrFYO+_Hi7FY39jAw@mail.gmail.com>
 <520d517e-5e8f-a6c7-1c8a-38d1a368a79f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <520d517e-5e8f-a6c7-1c8a-38d1a368a79f@gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMDEsIDIwMjAgYXQgMDU6NDk6MzNQTSArMDIwMCwgTWljaGHFgiBPcnplxYIg
d3JvdGU6Cj4gCj4gCj4gT24gMzAuMDQuMjAyMCAyMDozMCwgRGFuaWVsIFZldHRlciB3cm90ZToK
PiA+IE9uIFRodSwgQXByIDMwLCAyMDIwIGF0IDU6MzggUE0gU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gV2VkLCBBcHIgMjksIDIwMjAgYXQgNDo1
NyBBTSBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPiB3cm90ZToKPiA+
Pj4KPiA+Pj4gT24gVHVlLCAyOCBBcHIgMjAyMCwgTWljaGFsIE9yemVsIDxtaWNoYWxvcnplbC5l
bmdAZ21haWwuY29tPiB3cm90ZToKPiA+Pj4+IEFzIHN1Z2dlc3RlZCBieSB0aGUgVE9ETyBsaXN0
IGZvciB0aGUga2VybmVsIERSTSBzdWJzeXN0ZW0sIHJlcGxhY2UKPiA+Pj4+IHRoZSBkZXByZWNh
dGVkIGZ1bmN0aW9ucyB0aGF0IHRha2UvZHJvcCBtb2Rlc2V0IGxvY2tzIHdpdGggbmV3IGhlbHBl
cnMuCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIE9yemVsIDxtaWNoYWxvcnpl
bC5lbmdAZ21haWwuY29tPgo+ID4+Pj4gLS0tCj4gPj4+PiAgZHJpdmVycy9ncHUvZHJtL2RybV9t
b2RlX29iamVjdC5jIHwgMTAgKysrKysrLS0tLQo+ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9k
ZV9vYmplY3QuYwo+ID4+Pj4gaW5kZXggMzVjMjcxOS4uOTAxYjA3OCAxMDA2NDQKPiA+Pj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZV9vYmplY3QuYwo+ID4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jCj4gPj4+PiBAQCAtNDAyLDEyICs0MDIsMTMgQEAg
aW50IGRybV9tb2RlX29ial9nZXRfcHJvcGVydGllc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCB2b2lkICpkYXRhLAo+ID4+Pj4gIHsKPiA+Pj4+ICAgICAgIHN0cnVjdCBkcm1fbW9kZV9v
YmpfZ2V0X3Byb3BlcnRpZXMgKmFyZyA9IGRhdGE7Cj4gPj4+PiAgICAgICBzdHJ1Y3QgZHJtX21v
ZGVfb2JqZWN0ICpvYmo7Cj4gPj4+PiArICAgICBzdHJ1Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9j
dHggY3R4Owo+ID4+Pj4gICAgICAgaW50IHJldCA9IDA7Cj4gPj4+Pgo+ID4+Pj4gICAgICAgaWYg
KCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKQo+ID4+Pj4gICAg
ICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPj4+Pgo+ID4+Pj4gLSAgICAgZHJtX21v
ZGVzZXRfbG9ja19hbGwoZGV2KTsKPiA+Pj4+ICsgICAgIERSTV9NT0RFU0VUX0xPQ0tfQUxMX0JF
R0lOKGRldiwgY3R4LCAwLCByZXQpOwo+ID4+Pgo+ID4+PiBJIGNyeSBhIGxpdHRsZSBldmVyeSB0
aW1lIEkgbG9vayBhdCB0aGUgRFJNX01PREVTRVRfTE9DS19BTExfQkVHSU4gYW5kCj4gPj4+IERS
TV9NT0RFU0VUX0xPQ0tfQUxMX0VORCBtYWNyb3MuIDooCj4gPj4+Cj4gPj4+IEN1cnJlbnRseSBv
bmx5IHNpeCB1c2Vycy4uLiBidXQgdGhlcmUgYXJlIH42MCBjYWxscyB0bwo+ID4+PiBkcm1fbW9k
ZXNldF9sb2NrX2FsbHssX2N0eH0gdGhhdCBJIHByZXN1bWUgYXJlIHRvIGJlIHJlcGxhY2VkLiBJ
IHdvbmRlcgo+ID4+PiBpZiB0aGlzIHdpbGwgY29tZSBiYWNrIGFuZCBoYXVudCB1cy4KPiA+Pj4K
PiA+Pgo+ID4+IFdoYXQncyB0aGUgYWx0ZXJuYXRpdmU/IFNlZW1zIGxpa2UgdGhlIG9wdGlvbnMg
d2l0aG91dCB0aGUgbWFjcm9zIGlzCj4gPj4gdG8gdXNlIGluY29ycmVjdCBzY29wZSBvciBoYXZl
IGEgYnVuY2ggb2YgcmV0cnkvYmFja29mZiBjYXJnby1jdWx0Cj4gPj4gZXZlcnl3aGVyZSAoYW5k
IGhvcGUgdGhlIGNvcHkgc291cmNlIGlzIGRvbmUgY29ycmVjdGx5KS4KPiA+IAo+ID4gWWVhaCBT
ZWFuICYgbWUgaGFkIGEgYnVuY2ggb2YgYmlrZXNoZWRzIGFuZCB0aGlzIGlzIHRoZSBsZWFzdCB3
b3JzdAo+ID4gb3B0aW9uIHdlIGNvdWxkIGNvbWUgdXAgd2l0aC4gWW91IGNhbid0IG1ha2UgaXQg
YSBmdW5jdGlvbiBiZWNhdXNlIG9mCj4gPiB0aGUgY29udHJvbCBmbG93LiBZb3UgZG9uJ3Qgd2Fu
dCB0byBvcGVuIGNvZGUgdGhpcyBiZWNhdXNlIGl0J3MgdHJpY2t5Cj4gPiB0byBnZXQgcmlnaHQs
IGlmIGFsbCB5b3Ugd2FudCBpcyB0byBqdXN0IGdyYWIgYWxsIGxvY2tzLiBCdXQgaXQgaXMKPiA+
IG1hZ2ljIGhpZGRlbiBiZWhpbmQgYSBtYWNybywgd2hpY2ggb2NjYXNpb25hbGx5IGVuZHMgdXAg
aHVydGluZy4KPiA+IC1EYW5pZWwKPiBTbyB3aGF0IGFyZSB3ZSBkb2luZyB3aXRoIHRoaXMgcHJv
YmxlbT8gU2hvdWxkIHdlIHJlcGxhY2UgYXQgb25jZSBhcHByb3guIDYwIGNhbGxzPwoKSSdtIGNv
bmZ1c2VkIGJ5IHlvdXIgcXVlc3Rpb24gLSBkcmFkdWFsIGNvbnZlcnNpb24gaXMgZW50aXJlbHkg
b3J0aG9nb25hbAp0byB3aGF0IGV4YWN0bHkgd2UncmUgY29udmVydGluZyB0b28uIEFsbCBJIGFk
ZGVkIGhlcmUgaXMgdGhhdCB3ZSd2ZQpkaXNjdXNzZWQgdGhpcyBhdCBsZW5ndGgsIGFuZCB0aGUg
bWFjcm8gaXMgdGhlIGJlc3QgdGhpbmcgd2UndmUgY29tZSB1cAp3aXRoLiBJIHN0aWxsIHRoaW5r
IGl0J3MgdGhlIGJlc3QgY29tcHJvbWlzZS4KCkZsYWctZGF5IGNvbnZlcnNpb24gZm9yIG92ZXIg
NjAgY2FsbHMgZG9lc24ndCB3b3JrLCBubyBtYXR0ZXIgd2hhdC4KLURhbmllbAoKPiAKPiBNaWNo
YWwKPiA+IAo+ID4+IFNlYW4KPiA+Pgo+ID4+PiBCUiwKPiA+Pj4gSmFuaS4KPiA+Pj4KPiA+Pj4K
PiA+Pj4+Cj4gPj4+PiAgICAgICBvYmogPSBkcm1fbW9kZV9vYmplY3RfZmluZChkZXYsIGZpbGVf
cHJpdiwgYXJnLT5vYmpfaWQsIGFyZy0+b2JqX3R5cGUpOwo+ID4+Pj4gICAgICAgaWYgKCFvYmop
IHsKPiA+Pj4+IEBAIC00MjcsNyArNDI4LDcgQEAgaW50IGRybV9tb2RlX29ial9nZXRfcHJvcGVy
dGllc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAo+ID4+Pj4gIG91
dF91bnJlZjoKPiA+Pj4+ICAgICAgIGRybV9tb2RlX29iamVjdF9wdXQob2JqKTsKPiA+Pj4+ICBv
dXQ6Cj4gPj4+PiAtICAgICBkcm1fbW9kZXNldF91bmxvY2tfYWxsKGRldik7Cj4gPj4+PiArICAg
ICBEUk1fTU9ERVNFVF9MT0NLX0FMTF9FTkQoY3R4LCByZXQpOwo+ID4+Pj4gICAgICAgcmV0dXJu
IHJldDsKPiA+Pj4+ICB9Cj4gPj4+Pgo+ID4+Pj4gQEAgLTQ0OSwxMiArNDUwLDEzIEBAIHN0YXRp
YyBpbnQgc2V0X3Byb3BlcnR5X2xlZ2FjeShzdHJ1Y3QgZHJtX21vZGVfb2JqZWN0ICpvYmosCj4g
Pj4+PiAgewo+ID4+Pj4gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IHByb3AtPmRldjsK
PiA+Pj4+ICAgICAgIHN0cnVjdCBkcm1fbW9kZV9vYmplY3QgKnJlZjsKPiA+Pj4+ICsgICAgIHN0
cnVjdCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eCBjdHg7Cj4gPj4+PiAgICAgICBpbnQgcmV0ID0g
LUVJTlZBTDsKPiA+Pj4+Cj4gPj4+PiAgICAgICBpZiAoIWRybV9wcm9wZXJ0eV9jaGFuZ2VfdmFs
aWRfZ2V0KHByb3AsIHByb3BfdmFsdWUsICZyZWYpKQo+ID4+Pj4gICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiA+Pj4+Cj4gPj4+PiAtICAgICBkcm1fbW9kZXNldF9sb2NrX2FsbChkZXYp
Owo+ID4+Pj4gKyAgICAgRFJNX01PREVTRVRfTE9DS19BTExfQkVHSU4oZGV2LCBjdHgsIDAsIHJl
dCk7Cj4gPj4+PiAgICAgICBzd2l0Y2ggKG9iai0+dHlwZSkgewo+ID4+Pj4gICAgICAgY2FzZSBE
Uk1fTU9ERV9PQkpFQ1RfQ09OTkVDVE9SOgo+ID4+Pj4gICAgICAgICAgICAgICByZXQgPSBkcm1f
Y29ubmVjdG9yX3NldF9vYmpfcHJvcChvYmosIHByb3AsIHByb3BfdmFsdWUpOwo+ID4+Pj4gQEAg
LTQ2OCw3ICs0NzAsNyBAQCBzdGF0aWMgaW50IHNldF9wcm9wZXJ0eV9sZWdhY3koc3RydWN0IGRy
bV9tb2RlX29iamVjdCAqb2JqLAo+ID4+Pj4gICAgICAgICAgICAgICBicmVhazsKPiA+Pj4+ICAg
ICAgIH0KPiA+Pj4+ICAgICAgIGRybV9wcm9wZXJ0eV9jaGFuZ2VfdmFsaWRfcHV0KHByb3AsIHJl
Zik7Cj4gPj4+PiAtICAgICBkcm1fbW9kZXNldF91bmxvY2tfYWxsKGRldik7Cj4gPj4+PiArICAg
ICBEUk1fTU9ERVNFVF9MT0NLX0FMTF9FTkQoY3R4LCByZXQpOwo+ID4+Pj4KPiA+Pj4+ICAgICAg
IHJldHVybiByZXQ7Cj4gPj4+PiAgfQo+ID4+Pgo+ID4+PiAtLQo+ID4+PiBKYW5pIE5pa3VsYSwg
SW50ZWwgT3BlbiBTb3VyY2UgR3JhcGhpY3MgQ2VudGVyCj4gPiAKPiA+IAo+ID4gCgotLSAKRGFu
aWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Js
b2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
