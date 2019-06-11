Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1478D41CE7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC82B892EF;
	Wed, 12 Jun 2019 06:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CDB891C1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:21:26 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id go2so5380111plb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 10:21:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BqY+/YK4he+mJtH+liZ691VHoEXekm5Z7axwayEiyqI=;
 b=mFGf1JDSOjPDqCoy0fQzlhdlPBMRH50aj3sw0gOrh0qfGRF5NCOKE4bhrUFcpNlZxy
 YNNWsgX51B6emj3PyeHiJvXv4hqV6glU31u9Ek0j3HbFAWRs7d6fItKo83HhT7XP1zhj
 31LykwamalNeVRny39/WpN9HQeiVTpVumgol4U8IIxBlHVbtY1LCUYQ53K+zzXb1ayzV
 4as0O8EI1W/DD5ftnXj5Eg2oT+7IRrFslGxn+8TyF98LkbC/ohOToqZ4hrBEWiGptO6s
 qDn/d5Jcj4jZLAsdCVrRCJZerMMvklAHiBbGSJvQkOBLZypLsLYBKKU4QntVkSkuRUPd
 n2/A==
X-Gm-Message-State: APjAAAUinSdlr0M/SX/eOkgWD7UjaCyRaezn5XZGHWexbqHwmVyOfxGu
 gr8hAFdOwpBJ6yujzc91slk=
X-Google-Smtp-Source: APXvYqz7uI2Qmwz9JEnpIliJNayf/qQ2faVw+nEuOaS5Sof99wLkycZSvOoPTTHh6/ipSo8bsJvhbA==
X-Received: by 2002:a17:902:9b81:: with SMTP id
 y1mr52592445plp.194.1560273685452; 
 Tue, 11 Jun 2019 10:21:25 -0700 (PDT)
Received: from [10.2.189.129] ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id z3sm2940090pjn.16.2019.06.11.10.21.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 10:21:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v4 3/9] mm: Add write-protect and clean utilities for
 address space ranges
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20190611122454.3075-4-thellstrom@vmwopensource.org>
Date: Tue, 11 Jun 2019 10:21:22 -0700
Message-Id: <1CDAE797-4686-4041-938F-DE0456FFF451@gmail.com>
References: <20190611122454.3075-1-thellstrom@vmwopensource.org>
 <20190611122454.3075-4-thellstrom@vmwopensource.org>
To: =?utf-8?Q?=22Thomas_Hellstr=C3=B6m_=28VMware=29=22?=
 <thellstrom@vmwopensource.org>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BqY+/YK4he+mJtH+liZ691VHoEXekm5Z7axwayEiyqI=;
 b=qwjMMotTsYQLcBdOxTImLWEPM7dYSviXaJ3bwpIH5bTHBV5rk8kXbLfsovR4nh5X+r
 jmRE7ph/ZEy3MAYKVes4N8c6/Ktxl1Ush2MtVhNHnam3/dlDrWXNDSOQhmlKsgj2BnmC
 voQbsoYr6uu+ISBkpnOyTZuGn17P/VWEBcINluDLEycw/epbUsdx2IQU4UhQXLYSQW93
 X4WqYogjsuzpBa5UA18rS6bogmqexa27OLXTOqzJhdZtHNSIURqb0imdA4LOhwZg+rp6
 nhYgMtpXEKINSVCHlODqmLFeeTgv3/cDI9bgiWud03UUBrGA52iID7O/JTKm7RoFWyJt
 TcaA==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com, Matthew Wilcox <willy@infradead.org>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ralph Campbell <rcampbell@nvidia.com>, Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBPbiBKdW4gMTEsIDIwMTksIGF0IDU6MjQgQU0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
IDx0aGVsbHN0cm9tQHZtd29wZW5zb3VyY2Uub3JnPiB3cm90ZToKPiAKPiBGcm9tOiBUaG9tYXMg
SGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4gCgpbIHNuaXAgXQoKPiArLyoqCj4g
KyAqIGFwcGx5X3B0X3dycHJvdGVjdCAtIExlYWYgcHRlIGNhbGxiYWNrIHRvIHdyaXRlLXByb3Rl
Y3QgYSBwdGUKPiArICogQHB0ZTogUG9pbnRlciB0byB0aGUgcHRlCj4gKyAqIEB0b2tlbjogUGFn
ZSB0YWJsZSB0b2tlbiwgc2VlIGFwcGx5X3RvX3Bmbl9yYW5nZSgpCj4gKyAqIEBhZGRyOiBUaGUg
dmlydHVhbCBwYWdlIGFkZHJlc3MKPiArICogQGNsb3N1cmU6IFBvaW50ZXIgdG8gYSBzdHJ1Y3Qg
cGZuX3JhbmdlX2FwcGx5IGVtYmVkZGVkIGluIGEKPiArICogc3RydWN0IGFwcGx5X2FzCj4gKyAq
Cj4gKyAqIFRoZSBmdW5jdGlvbiB3cml0ZS1wcm90ZWN0cyBhIHB0ZSBhbmQgcmVjb3JkcyB0aGUg
cmFuZ2UgaW4KPiArICogdmlydHVhbCBhZGRyZXNzIHNwYWNlIG9mIHRvdWNoZWQgcHRlcyBmb3Ig
ZWZmaWNpZW50IHJhbmdlIFRMQiBmbHVzaGVzLgo+ICsgKgo+ICsgKiBSZXR1cm46IEFsd2F5cyB6
ZXJvLgo+ICsgKi8KPiArc3RhdGljIGludCBhcHBseV9wdF93cnByb3RlY3QocHRlX3QgKnB0ZSwg
cGd0YWJsZV90IHRva2VuLAo+ICsJCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsCj4gKwkJCSAg
ICAgIHN0cnVjdCBwZm5fcmFuZ2VfYXBwbHkgKmNsb3N1cmUpCj4gK3sKPiArCXN0cnVjdCBhcHBs
eV9hcyAqYWFzID0gY29udGFpbmVyX29mKGNsb3N1cmUsIHR5cGVvZigqYWFzKSwgYmFzZSk7Cj4g
KwlwdGVfdCBwdGVudCA9ICpwdGU7Cj4gKwo+ICsJaWYgKHB0ZV93cml0ZShwdGVudCkpIHsKPiAr
CQlwdGVfdCBvbGRfcHRlID0gcHRlcF9tb2RpZnlfcHJvdF9zdGFydChhYXMtPnZtYSwgYWRkciwg
cHRlKTsKPiArCj4gKwkJcHRlbnQgPSBwdGVfd3Jwcm90ZWN0KG9sZF9wdGUpOwo+ICsJCXB0ZXBf
bW9kaWZ5X3Byb3RfY29tbWl0KGFhcy0+dm1hLCBhZGRyLCBwdGUsIG9sZF9wdGUsIHB0ZW50KTsK
PiArCQlhYXMtPnRvdGFsKys7Cj4gKwkJYWFzLT5zdGFydCA9IG1pbihhYXMtPnN0YXJ0LCBhZGRy
KTsKPiArCQlhYXMtPmVuZCA9IG1heChhYXMtPmVuZCwgYWRkciArIFBBR0VfU0laRSk7Cj4gKwl9
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gKy8qKgo+ICsgKiBzdHJ1Y3QgYXBwbHlfYXNf
Y2xlYW4gLSBDbG9zdXJlIHN0cnVjdHVyZSBmb3IgYXBwbHlfYXNfY2xlYW4KPiArICogQGJhc2U6
IHN0cnVjdCBhcHBseV9hcyB3ZSBkZXJpdmUgZnJvbQo+ICsgKiBAYml0bWFwX3Bnb2ZmOiBBZGRy
ZXNzX3NwYWNlIFBhZ2Ugb2Zmc2V0IG9mIHRoZSBmaXJzdCBiaXQgaW4gQGJpdG1hcAo+ICsgKiBA
Yml0bWFwOiBCaXRtYXAgd2l0aCBvbmUgYml0IGZvciBlYWNoIHBhZ2Ugb2Zmc2V0IGluIHRoZSBh
ZGRyZXNzX3NwYWNlIHJhbmdlCj4gKyAqIGNvdmVyZWQuCj4gKyAqIEBzdGFydDogQWRkcmVzc19z
cGFjZSBwYWdlIG9mZnNldCBvZiBmaXJzdCBtb2RpZmllZCBwdGUgcmVsYXRpdmUKPiArICogdG8g
QGJpdG1hcF9wZ29mZgo+ICsgKiBAZW5kOiBBZGRyZXNzX3NwYWNlIHBhZ2Ugb2Zmc2V0IG9mIGxh
c3QgbW9kaWZpZWQgcHRlIHJlbGF0aXZlCj4gKyAqIHRvIEBiaXRtYXBfcGdvZmYKPiArICovCj4g
K3N0cnVjdCBhcHBseV9hc19jbGVhbiB7Cj4gKwlzdHJ1Y3QgYXBwbHlfYXMgYmFzZTsKPiArCXBn
b2ZmX3QgYml0bWFwX3Bnb2ZmOwo+ICsJdW5zaWduZWQgbG9uZyAqYml0bWFwOwo+ICsJcGdvZmZf
dCBzdGFydDsKPiArCXBnb2ZmX3QgZW5kOwo+ICt9Owo+ICsKPiArLyoqCj4gKyAqIGFwcGx5X3B0
X2NsZWFuIC0gTGVhZiBwdGUgY2FsbGJhY2sgdG8gY2xlYW4gYSBwdGUKPiArICogQHB0ZTogUG9p
bnRlciB0byB0aGUgcHRlCj4gKyAqIEB0b2tlbjogUGFnZSB0YWJsZSB0b2tlbiwgc2VlIGFwcGx5
X3RvX3Bmbl9yYW5nZSgpCj4gKyAqIEBhZGRyOiBUaGUgdmlydHVhbCBwYWdlIGFkZHJlc3MKPiAr
ICogQGNsb3N1cmU6IFBvaW50ZXIgdG8gYSBzdHJ1Y3QgcGZuX3JhbmdlX2FwcGx5IGVtYmVkZGVk
IGluIGEKPiArICogc3RydWN0IGFwcGx5X2FzX2NsZWFuCj4gKyAqCj4gKyAqIFRoZSBmdW5jdGlv
biBjbGVhbnMgYSBwdGUgYW5kIHJlY29yZHMgdGhlIHJhbmdlIGluCj4gKyAqIHZpcnR1YWwgYWRk
cmVzcyBzcGFjZSBvZiB0b3VjaGVkIHB0ZXMgZm9yIGVmZmljaWVudCBUTEIgZmx1c2hlcy4KPiAr
ICogSXQgYWxzbyByZWNvcmRzIGRpcnR5IHB0ZXMgaW4gYSBiaXRtYXAgcmVwcmVzZW50aW5nIHBh
Z2Ugb2Zmc2V0cwo+ICsgKiBpbiB0aGUgYWRkcmVzc19zcGFjZSwgYXMgd2VsbCBhcyB0aGUgZmly
c3QgYW5kIGxhc3Qgb2YgdGhlIGJpdHMKPiArICogdG91Y2hlZC4KPiArICoKPiArICogUmV0dXJu
OiBBbHdheXMgemVyby4KPiArICovCj4gK3N0YXRpYyBpbnQgYXBwbHlfcHRfY2xlYW4ocHRlX3Qg
KnB0ZSwgcGd0YWJsZV90IHRva2VuLAo+ICsJCQkgIHVuc2lnbmVkIGxvbmcgYWRkciwKPiArCQkJ
ICBzdHJ1Y3QgcGZuX3JhbmdlX2FwcGx5ICpjbG9zdXJlKQo+ICt7Cj4gKwlzdHJ1Y3QgYXBwbHlf
YXMgKmFhcyA9IGNvbnRhaW5lcl9vZihjbG9zdXJlLCB0eXBlb2YoKmFhcyksIGJhc2UpOwo+ICsJ
c3RydWN0IGFwcGx5X2FzX2NsZWFuICpjbGVhbiA9IGNvbnRhaW5lcl9vZihhYXMsIHR5cGVvZigq
Y2xlYW4pLCBiYXNlKTsKPiArCXB0ZV90IHB0ZW50ID0gKnB0ZTsKPiArCj4gKwlpZiAocHRlX2Rp
cnR5KHB0ZW50KSkgewo+ICsJCXBnb2ZmX3QgcGdvZmYgPSAoKGFkZHIgLSBhYXMtPnZtYS0+dm1f
c3RhcnQpID4+IFBBR0VfU0hJRlQpICsKPiArCQkJYWFzLT52bWEtPnZtX3Bnb2ZmIC0gY2xlYW4t
PmJpdG1hcF9wZ29mZjsKPiArCQlwdGVfdCBvbGRfcHRlID0gcHRlcF9tb2RpZnlfcHJvdF9zdGFy
dChhYXMtPnZtYSwgYWRkciwgcHRlKTsKPiArCj4gKwkJcHRlbnQgPSBwdGVfbWtjbGVhbihvbGRf
cHRlKTsKPiArCQlwdGVwX21vZGlmeV9wcm90X2NvbW1pdChhYXMtPnZtYSwgYWRkciwgcHRlLCBv
bGRfcHRlLCBwdGVudCk7Cj4gKwo+ICsJCWFhcy0+dG90YWwrKzsKPiArCQlhYXMtPnN0YXJ0ID0g
bWluKGFhcy0+c3RhcnQsIGFkZHIpOwo+ICsJCWFhcy0+ZW5kID0gbWF4KGFhcy0+ZW5kLCBhZGRy
ICsgUEFHRV9TSVpFKTsKPiArCj4gKwkJX19zZXRfYml0KHBnb2ZmLCBjbGVhbi0+Yml0bWFwKTsK
PiArCQljbGVhbi0+c3RhcnQgPSBtaW4oY2xlYW4tPnN0YXJ0LCBwZ29mZik7Cj4gKwkJY2xlYW4t
PmVuZCA9IG1heChjbGVhbi0+ZW5kLCBwZ29mZiArIDEpOwo+ICsJfQo+ICsKPiArCXJldHVybiAw
OwoKVXN1YWxseSwgd2hlbiBhIFBURSBpcyB3cml0ZS1wcm90ZWN0ZWQsIG9yIHdoZW4gYSBkaXJ0
eS1iaXQgaXMgY2xlYXJlZCwgdGhlClRMQiBmbHVzaCBtdXN0IGJlIGRvbmUgd2hpbGUgdGhlIHBh
Z2UtdGFibGUgbG9jayBmb3IgdGhhdCBzcGVjaWZpYyB0YWJsZSBpcwp0YWtlbiAoaS5lLiwgd2l0
aGluIGFwcGx5X3B0X2NsZWFuKCkgYW5kIGFwcGx5X3B0X3dycHJvdGVjdCgpIGluIHRoaXMgY2Fz
ZSkuCgpPdGhlcndpc2UsIGluIHRoZSBjYXNlIG9mIGFwcGx5X3B0X2NsZWFuKCkgZm9yIGV4YW1w
bGUsIGFub3RoZXIgY29yZSBtaWdodApzaG9ydGx5IGFmdGVyIChiZWZvcmUgdGhlIFRMQiBmbHVz
aCkgd3JpdGUgdG8gdGhlIHNhbWUgcGFnZSB3aG9zZSBQVEUgd2FzCmNoYW5nZWQuIFRoZSBkaXJ0
eS1iaXQgaW4gc3VjaCBjYXNlIG1pZ2h0IG5vdCBiZSBzZXQsIGFuZCB0aGUgY2hhbmdlIGdldAps
b3N0LgoKRG9lcyB0aGlzIGZ1bmN0aW9uIHJlZ2FyZHMgYSBjZXJ0YWluIHVzZS1jYXNlIGluIHdo
aWNoIGRlZmVycmluZyB0aGUgVExCCmZsdXNoZXMgaXMgZmluZT8gSWYgc28sIGFzc2VydGlvbnMg
YW5kIGRvY3VtZW50YXRpb24gb2YgdGhlIHJlbGF0ZWQKYXNzdW1wdGlvbiB3b3VsZCBiZSB1c2Vm
dWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
