Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC09C3704FC
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 04:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B0D6F649;
	Sat,  1 May 2021 02:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B80D6F646;
 Sat,  1 May 2021 02:20:12 +0000 (UTC)
IronPort-SDR: tY70FO71sU+VJawJg0spo0XBUpll6LUc506xt2an3XYATzJM9HccIQqHYuMQzndUKFC7CsknQv
 tZdYoLOllyVg==
X-IronPort-AV: E=McAfee;i="6200,9189,9970"; a="258686042"
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="258686042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 19:20:11 -0700
IronPort-SDR: PLwmUjL+6BeX/E1+qv88AA/wPG1xmL5KFN5SJ9Zbg69VeUgpgQL2fQtkdogBtJjjYWHNrCc+e6
 79P950qwC4Rg==
X-IronPort-AV: E=Sophos;i="5.82,264,1613462400"; d="scan'208";a="404815065"
Received: from orsosgc001.ra.intel.com ([10.23.184.150])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2021 19:20:11 -0700
Date: Fri, 30 Apr 2021 19:19:59 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 1/1] i915/query: Correlate engine and cpu timestamps with
 better accuracy
Message-ID: <20210501021959.GA50683@orsosgc001.ra.intel.com>
References: <20210429003410.69754-1-umesh.nerlige.ramappa@intel.com>
 <20210429003410.69754-2-umesh.nerlige.ramappa@intel.com>
 <CAOFGe95O_Q09p4c5Sru0_5E-tBG3DFGm+f-uX-_YHx-UHLOBUA@mail.gmail.com>
 <20210430222609.GC38093@orsosgc001.ra.intel.com>
 <87czubbco1.wl-ashutosh.dixit@intel.com>
 <179255a3b48.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179255a3b48.2817.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMzAsIDIwMjEgYXQgMDc6MzU6NDFQTSAtMDUwMCwgSmFzb24gRWtzdHJhbmQg
d3JvdGU6Cj4gICBPbiBBcHJpbCAzMCwgMjAyMSAxODowMDo1OCAiRGl4aXQsIEFzaHV0b3NoIiA8
YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPgo+ICAgd3JvdGU6Cj4KPiAgICAgT24gRnJpLCAzMCBB
cHIgMjAyMSAxNToyNjowOSAtMDcwMCwgVW1lc2ggTmVybGlnZSBSYW1hcHBhIHdyb3RlOgo+Cj4g
ICAgICAgTG9va3MgbGlrZSB0aGUgZW5naW5lIGNhbiBiZSBkcm9wcGVkIHNpbmNlIGFsbCB0aW1l
c3RhbXBzIGFyZSBpbiBzeW5jLgo+ICAgICAgIEkKPiAgICAgICBqdXN0IGhhdmUgb25lIG1vcmUg
cXVlc3Rpb24gaGVyZS4gVGhlIHRpbWVzdGFtcCBpdHNlbGYgaXMgMzYgYml0cy4KPiAgICAgICDC
oFNob3VsZAo+ICAgICAgIHRoZSB1YXBpIGFsc28gcmVwb3J0IHRoZSB0aW1lc3RhbXAgd2lkdGgg
dG8gdGhlIHVzZXIgT1Igc2hvdWxkIEkganVzdAo+ICAgICAgIHJldHVybiB0aGUgbG93ZXIgMzIg
Yml0cyBvZiB0aGUgdGltZXN0YW1wPwo+Cj4gICBZZWFoLCBJIHRoaW5rIHJlcG9ydGluZyB0aGUg
dGltZXN0YW1wIHdpZHRoIGlzIGEgZ29vZCBpZGVhIHNpbmNlIHdlJ3JlCj4gICByZXBvcnRpbmcg
dGhlIHBlcmlvZC9mcmVxdWVuY3kgaGVyZS4KCkFjdHVhbGx5LCBJIGZvcmdvdCB0aGF0IHdlIGFy
ZSBoYW5kbGluZyB0aGUgb3ZlcmZsb3cgYmVmb3JlIHJldHVybmluZyAKdGhlIGNzX2N5Y2xlcyB0
byB0aGUgdXNlciBhbmQgb3ZlcmZsb3cgaGFuZGxpbmcgd2FzIHRoZSBvbmx5IHJlYXNvbiBJIAp0
aG91Z2h0IHVzZXIgc2hvdWxkIGtub3cgdGhlIHdpZHRoLiBXb3VsZCB5b3Ugc3RpbCByZWNvbW1l
bmQgcmV0dXJuaW5nIAp0aGUgd2lkdGggaW4gdGhlIHVhcGk/CgpUaGFua3MsClVtZXNoCgoKPgo+
ICAgICBIb3cgd291bGQgZXhwb3Npbmcgb25seSB0aGUgbG93ZXIgMzIgYml0cyBvZiB0aGUgdGlt
ZXN0YW1wIHdvcms/Cj4gICAgIFRoZSB3YXkgdG8gYXZvaWQgZXhwb3NpbmcgdGhlIHdpZHRoIHdv
dWxkIGJlIHRvIGV4cG9zZSB0aGUgdGltZXN0YW1wIGFzCj4gICAgIGEKPiAgICAgcmVndWxhciA2
NCBiaXQgdmFsdWUuIEluIHRoZSBrZXJuZWwgZW5naW5lIHN0YXRlLCBoYXZlIGEgdmFyaWFibGUg
Zm9yCj4gICAgIHRoZQo+ICAgICBjb3VudGVyIGFuZCBrZWVwIG9uIGFjY3VtdWxhdGluZyB0aGF0
IChvbiBlYWNoIHF1ZXJ5KSB0byBmdWxsIDY0IGJpdHMgaW4KPiAgICAgc3BpdGUgb2YgdGhlIDM2
IGJpdCBIVyBjb3VudGVyIG92ZXJmbG93Lgo+Cj4gICBUaGF0J3MgZG9lc24ndCBhY3R1YWxseSB3
b3JrIHNpbmNlIHlvdSBjYW4gcXVlcnkgdGhlIDY0LWJpdCB0aW1lc3RhbXAKPiAgIHZhbHVlIGZy
b20gdGhlIEdQVS4gVGhlIHdheSB0aGlzIGlzIGhhbmRsZWQgaW4gVnVsa2FuIGlzIHRoYXQgdGhl
IG51bWJlcgo+ICAgb2YgdGltZXN0YW1wIGJpdHMgaXMgcmVwb3J0ZWQgdG8gdGhlIGFwcGxpY2F0
aW9uIGFzIGEgcXVldWUgcHJvcGVydHkuCj4gICAtLUphc29uCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
