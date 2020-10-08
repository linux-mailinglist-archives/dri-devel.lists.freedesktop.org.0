Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C928839C
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3954F6EC5F;
	Fri,  9 Oct 2020 07:30:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA53B6EA96
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 16:44:56 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 098GWc25119610; Thu, 8 Oct 2020 12:44:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=DOjfJtmqn0RgphxiIiG0Kv2UKoYLCpYcT9ErIqcce6E=;
 b=Wg15T8U9KQDXgs4QwB8A79tlx7vkXl3sj9pFh/1cOPLlDjrtMPxkA1D6agqTMMOzRLf7
 NUnasH/5LgKXjRmsfdo8cPf3xCzwhbuxs2Z8DTZRnSWg8WMLVLxLDsVASnHBlnfZGWD5
 nrHVw4Mrev3JAPk1tZjw4hdG2ZoVozDpaXbDoW6prAYwvRRF53bIbj4IQ+PJoDUQZgJ/
 f6GjUgeB+MO2nhKeRhvObJsiHly0uBtE1AQCa31NxixXKdyjB9iU/pTGQ4Mz3rer6W96
 eRSBZOyfkkXDhLNgYJTHugguwBIeLDnByF/lWwzsCaKdh5SLKVgxMPNkdzNTGJCVQ2v3 1g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34263q8xd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 12:44:48 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 098GgIad150220;
 Thu, 8 Oct 2020 12:44:47 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34263q8xbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 12:44:47 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 098Gclfr009991;
 Thu, 8 Oct 2020 16:44:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 33xgx7tw34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 16:44:45 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 098GigqX33817070
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Oct 2020 16:44:42 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9995A405F;
 Thu,  8 Oct 2020 16:44:42 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23192A4065;
 Thu,  8 Oct 2020 16:44:42 +0000 (GMT)
Received: from thinkpad (unknown [9.171.64.67])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  8 Oct 2020 16:44:42 +0000 (GMT)
Date: Thu, 8 Oct 2020 18:44:40 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 08/13] s390/pci: Remove races against pte updates
Message-ID: <20201008184440.4c3bebed@thinkpad>
In-Reply-To: <20201007164426.1812530-9-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-9-daniel.vetter@ffwll.ch>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_11:2020-10-08,
 2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=2 mlxscore=0 impostorscore=0
 clxscore=1011 phishscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010080120
X-Mailman-Approved-At: Fri, 09 Oct 2020 07:29:53 +0000
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAgNyBPY3QgMjAyMCAxODo0NDoyMSArMDIwMApEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPiB3cm90ZToKCj4gV2F5IGJhY2sgaXQgd2FzIGEgcmVhc29uYWJsZSBh
c3N1bXB0aW9ucyB0aGF0IGlvbWVtIG1hcHBpbmdzIG5ldmVyCj4gY2hhbmdlIHRoZSBwZm4gcmFu
Z2UgdGhleSBwb2ludCBhdC4gQnV0IHRoaXMgaGFzIGNoYW5nZWQ6Cj4gCj4gLSBncHUgZHJpdmVy
cyBkeW5hbWljYWxseSBtYW5hZ2UgdGhlaXIgbWVtb3J5IG5vd2FkYXlzLCBpbnZhbGlkYXRpbmcK
PiBwdGVzIHdpdGggdW5tYXBfbWFwcGluZ19yYW5nZSB3aGVuIGJ1ZmZlcnMgZ2V0IG1vdmVkCj4g
Cj4gLSBjb250aWd1b3VzIGRtYSBhbGxvY2F0aW9ucyBoYXZlIG1vdmVkIGZyb20gZGVkaWNhdGVk
IGNhcnZldG91dHMgdG8KPiBjbWEgcmVnaW9ucy4gVGhpcyBtZWFucyBpZiB3ZSBtaXNzIHRoZSB1
bm1hcCB0aGUgcGZuIG1pZ2h0IGNvbnRhaW4KPiBwYWdlY2FjaGUgb3IgYW5vbiBtZW1vcnkgKHdl
bGwgYW55dGhpbmcgYWxsb2NhdGVkIHdpdGggR0ZQX01PVkVBQkxFKQo+IAo+IC0gZXZlbiAvZGV2
L21lbSBub3cgaW52YWxpZGF0ZXMgbWFwcGluZ3Mgd2hlbiB0aGUga2VybmVsIHJlcXVlc3RzIHRo
YXQKPiBpb21lbSByZWdpb24gd2hlbiBDT05GSUdfSU9fU1RSSUNUX0RFVk1FTSBpcyBzZXQsIHNl
ZSAzMjM0YWM2NjRhODcKPiAoIi9kZXYvbWVtOiBSZXZva2UgbWFwcGluZ3Mgd2hlbiBhIGRyaXZl
ciBjbGFpbXMgdGhlIHJlZ2lvbiIpCj4gCj4gQWNjZXNzaW5nIHBmbnMgb2J0YWluZWQgZnJvbSBw
dGVzIHdpdGhvdXQgaG9sZGluZyBhbGwgdGhlIGxvY2tzIGlzCj4gdGhlcmVmb3JlIG5vIGxvbmdl
ciBhIGdvb2QgaWRlYS4gRml4IHRoaXMuCj4gCj4gU2luY2UgenBjaV9tZW1jcHlfZnJvbXx0b2lv
IHNlZW1zIHRvIG5vdCBkbyBhbnl0aGluZyBuZWZhcmlvdXMgd2l0aAo+IGxvY2tzIHdlIGp1c3Qg
bmVlZCB0byBvcGVuIGNvZGUgZ2V0X3BmbiBhbmQgZm9sbG93X3BmbiBhbmQgbWFrZSBzdXJlCj4g
d2UgZHJvcCB0aGUgbG9ja3Mgb25seSBhZnRlciB3ZSd2ZSBkb25lLiBUaGUgd3JpdGUgZnVuY3Rp
b24gYWxzbyBuZWVkcwo+IHRoZSBjb3B5X2Zyb21fdXNlciBtb3ZlLCBzaW5jZSB3ZSBjYW4ndCB0
YWtlIHVzZXJzcGFjZSBmYXVsdHMgd2hpbGUKPiBob2xkaW5nIHRoZSBtbWFwIHNlbS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBD
YzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFu
Lmoud2lsbGlhbXNAaW50ZWwuY29tPgo+IENjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBD
YzogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IENjOiBKw6lyw7RtZSBHbGlz
c2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBD
YzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IGxpbnV4LW1t
QGt2YWNrLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBD
YzogbGludXgtc2Ftc3VuZy1zb2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBOaWtsYXMgU2NobmVsbGUgPHNjaG5lbGxlQGxpbnV4LmlibS5j
b20+Cj4gQ2M6IEdlcmFsZCBTY2hhZWZlciA8Z2VyYWxkLnNjaGFlZmVyQGxpbnV4LmlibS5jb20+
Cj4gQ2M6IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGFyY2gvczM5MC9wY2kv
cGNpX21taW8uYyB8IDk4ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQoKTG9v
a3MgZ29vZCwgdGhhbmtzLiBBbHNvIHN1cnZpdmVkIHNvbWUgYmFzaWMgZnVuY3Rpb24gdGVzdC4g
T25seSBzb21lCm1pbm9yIG5pdHBpY2ssIHNlZSBiZWxvdy4KClJldmlld2VkLWJ5OiBHZXJhbGQg
U2NoYWVmZXIgPGdlcmFsZC5zY2hhZWZlckBsaW51eC5pYm0uY29tPgoKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9zMzkwL3BjaS9wY2lfbW1pby5jIGIvYXJjaC9zMzkwL3BjaS9wY2lfbW1pby5jCj4g
aW5kZXggNDAxY2Y2NzBhMjQzLi40ZDE5NGNiMDkzNzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9zMzkw
L3BjaS9wY2lfbW1pby5jCj4gKysrIGIvYXJjaC9zMzkwL3BjaS9wY2lfbW1pby5jCj4gQEAgLTEx
OSwzMyArMTE5LDE1IEBAIHN0YXRpYyBpbmxpbmUgaW50IF9fbWVtY3B5X3RvaW9faW51c2VyKHZv
aWQgX19pb21lbSAqZHN0LAo+ICAJcmV0dXJuIHJjOwo+ICB9Cj4gIAo+IC1zdGF0aWMgbG9uZyBn
ZXRfcGZuKHVuc2lnbmVkIGxvbmcgdXNlcl9hZGRyLCB1bnNpZ25lZCBsb25nIGFjY2VzcywKPiAt
CQkgICAgdW5zaWduZWQgbG9uZyAqcGZuKQo+IC17Cj4gLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYTsKPiAtCWxvbmcgcmV0Owo+IC0KPiAtCW1tYXBfcmVhZF9sb2NrKGN1cnJlbnQtPm1tKTsK
PiAtCXJldCA9IC1FSU5WQUw7Cj4gLQl2bWEgPSBmaW5kX3ZtYShjdXJyZW50LT5tbSwgdXNlcl9h
ZGRyKTsKPiAtCWlmICghdm1hKQo+IC0JCWdvdG8gb3V0Owo+IC0JcmV0ID0gLUVBQ0NFUzsKPiAt
CWlmICghKHZtYS0+dm1fZmxhZ3MgJiBhY2Nlc3MpKQo+IC0JCWdvdG8gb3V0Owo+IC0JcmV0ID0g
Zm9sbG93X3Bmbih2bWEsIHVzZXJfYWRkciwgcGZuKTsKPiAtb3V0Ogo+IC0JbW1hcF9yZWFkX3Vu
bG9jayhjdXJyZW50LT5tbSk7Cj4gLQlyZXR1cm4gcmV0Owo+IC19Cj4gLQo+ICBTWVNDQUxMX0RF
RklORTMoczM5MF9wY2lfbW1pb193cml0ZSwgdW5zaWduZWQgbG9uZywgbW1pb19hZGRyLAo+ICAJ
CWNvbnN0IHZvaWQgX191c2VyICosIHVzZXJfYnVmZmVyLCBzaXplX3QsIGxlbmd0aCkKPiAgewo+
ICAJdTggbG9jYWxfYnVmWzY0XTsKPiAgCXZvaWQgX19pb21lbSAqaW9fYWRkcjsKPiAgCXZvaWQg
KmJ1ZjsKPiAtCXVuc2lnbmVkIGxvbmcgcGZuOwo+ICsJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWE7Cj4gKwlwdGVfdCAqcHRlcDsKPiArCXNwaW5sb2NrX3QgKnB0bDsKPiAgCWxvbmcgcmV0Owo+
ICAKPiAgCWlmICghenBjaV9pc19lbmFibGVkKCkpCj4gQEAgLTE1OCw3ICsxNDAsNyBAQCBTWVND
QUxMX0RFRklORTMoczM5MF9wY2lfbW1pb193cml0ZSwgdW5zaWduZWQgbG9uZywgbW1pb19hZGRy
LAo+ICAJICogV2Ugb25seSBzdXBwb3J0IHdyaXRlIGFjY2VzcyB0byBNSU8gY2FwYWJsZSBkZXZp
Y2VzIGlmIHdlIGFyZSBvbgo+ICAJICogYSBNSU8gZW5hYmxlZCBzeXN0ZW0uIE90aGVyd2lzZSB3
ZSB3b3VsZCBoYXZlIHRvIGNoZWNrIGZvciBldmVyeQo+ICAJICogYWRkcmVzcyBpZiBpdCBpcyBh
IHNwZWNpYWwgWlBDSV9BRERSIGFuZCB3b3VsZCBoYXZlIHRvIGRvCj4gLQkgKiBhIGdldF9wZm4o
KSB3aGljaCB3ZSBkb24ndCBuZWVkIGZvciBNSU8gY2FwYWJsZSBkZXZpY2VzLiAgQ3VycmVudGx5
Cj4gKwkgKiBhIHBmbiBsb29rdXAgd2hpY2ggd2UgZG9uJ3QgbmVlZCBmb3IgTUlPIGNhcGFibGUg
ZGV2aWNlcy4gIEN1cnJlbnRseQo+ICAJICogSVNNIGRldmljZXMgYXJlIHRoZSBvbmx5IGRldmlj
ZXMgd2l0aG91dCBNSU8gc3VwcG9ydCBhbmQgdGhlcmUgaXMgbm8KPiAgCSAqIGtub3duIG5lZWQg
Zm9yIGFjY2Vzc2luZyB0aGVzZSBmcm9tIHVzZXJzcGFjZS4KPiAgCSAqLwo+IEBAIC0xNzYsMjEg
KzE1OCwzNyBAQCBTWVNDQUxMX0RFRklORTMoczM5MF9wY2lfbW1pb193cml0ZSwgdW5zaWduZWQg
bG9uZywgbW1pb19hZGRyLAo+ICAJfSBlbHNlCj4gIAkJYnVmID0gbG9jYWxfYnVmOwo+ICAKPiAt
CXJldCA9IGdldF9wZm4obW1pb19hZGRyLCBWTV9XUklURSwgJnBmbik7Cj4gKwlyZXQgPSAtRUZB
VUxUOwo+ICsJaWYgKGNvcHlfZnJvbV91c2VyKGJ1ZiwgdXNlcl9idWZmZXIsIGxlbmd0aCkpCj4g
KwkJZ290byBvdXRfZnJlZTsKPiArCj4gKwltbWFwX3JlYWRfbG9jayhjdXJyZW50LT5tbSk7Cj4g
KwlyZXQgPSAtRUlOVkFMOwo+ICsJdm1hID0gZmluZF92bWEoY3VycmVudC0+bW0sIG1taW9fYWRk
cik7Cj4gKwlpZiAoIXZtYSkKPiArCQlnb3RvIG91dF91bmxvY2tfbW1hcDsKPiArCXJldCA9IC1F
QUNDRVM7Cj4gKwlpZiAoISh2bWEtPnZtX2ZsYWdzICYgVk1fV1JJVEUpKQo+ICsJCWdvdG8gb3V0
X3VubG9ja19tbWFwOwo+ICsJaWYgKCEodm1hLT52bV9mbGFncyAmIChWTV9JTyB8IFZNX1BGTk1B
UCkpKQo+ICsJCWdvdG8gb3V0X3VubG9ja19tbWFwOwoKVGhhdCBjaGVjayBmb3IgVk1fSU8gfCBW
TV9QRk5NQVAgd2FzIHByZXZpb3VzbHkgaGlkZGVuIGluc2lkZSBmb2xsb3dfcGZuKCksCmFuZCB0
aGF0IHdvdWxkIGhhdmUgcmV0dXJuZWQgLUVJTlZBTCBpbiB0aGlzIGNhc2UuIFdpdGggeW91ciBj
aGFuZ2UsIHdlCm5vdyByZXR1cm4gLUVBQ0NFUy4gTm90IHN1cmUgaG93IGltcG9ydGFudCB0aGF0
IGlzLCBidXQgaXQgZmVlbHMgd3JvbmcuCk1heWJlIG1vdmUgdGhlIFZNX0lPIHwgVk1fUEZOTUFQ
IGNoZWNrIHVwLCBiZWZvcmUgdGhlIHJldCA9IC1FQUNDRVM/CgpbLi4uXQo+IEBAIC0zMDYsMjIg
KzMwNiwzOCBAQCBTWVNDQUxMX0RFRklORTMoczM5MF9wY2lfbW1pb19yZWFkLCB1bnNpZ25lZCBs
b25nLCBtbWlvX2FkZHIsCj4gIAkJYnVmID0gbG9jYWxfYnVmOwo+ICAJfQo+ICAKPiAtCXJldCA9
IGdldF9wZm4obW1pb19hZGRyLCBWTV9SRUFELCAmcGZuKTsKPiArCW1tYXBfcmVhZF9sb2NrKGN1
cnJlbnQtPm1tKTsKPiArCXJldCA9IC1FSU5WQUw7Cj4gKwl2bWEgPSBmaW5kX3ZtYShjdXJyZW50
LT5tbSwgbW1pb19hZGRyKTsKPiArCWlmICghdm1hKQo+ICsJCWdvdG8gb3V0X3VubG9ja19tbWFw
Owo+ICsJcmV0ID0gLUVBQ0NFUzsKPiArCWlmICghKHZtYS0+dm1fZmxhZ3MgJiBWTV9XUklURSkp
Cj4gKwkJZ290byBvdXRfdW5sb2NrX21tYXA7Cj4gKwlpZiAoISh2bWEtPnZtX2ZsYWdzICYgKFZN
X0lPIHwgVk1fUEZOTUFQKSkpCj4gKwkJZ290byBvdXRfdW5sb2NrX21tYXA7CgpTYW1lIGhlcmUg
d2l0aCBWTV9JTyB8IFZNX1BGTk1BUCBhbmQgLUVJTlZBTC4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
