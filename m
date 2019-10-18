Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F320DD11E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 23:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E1F89B69;
	Fri, 18 Oct 2019 21:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AE889B69
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 21:23:02 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-tGCwkClZMvOkf4smeXTeHQ-1; Fri, 18 Oct 2019 17:22:59 -0400
Received: by mail-qk1-f199.google.com with SMTP id s14so6834436qkg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 14:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Edrw3qE6s6upffjv/gth6D/Ska9/WdpdSvWlgt5Cq/0=;
 b=SDT+OooWJJWHvzpR9m+SfIYU6rabQk3T91uvYTsyGGE2BHXxs/NBOMlDks77sMUkcR
 LCB7ZEbolhTy1k//Cj063SZ1wnpjM4Lt4M4RBSZzEY1WhyZ7MHrmbC5yETyklQuGbONy
 /EZS0V1Nd1FHEbdOXqFxmKaY0H2NBHHPM0EL9flvTnxUagkZGWlwdrIY7OAYsUD3fYRy
 Z13LjuvISRK83wkQy2AGlxYzkhUTZlWLyD6CTSmQY38X9HrevMcf7kZVVXiQBcK0DbN7
 Ru+5RRW0+PjLOqDs+bkG84AdYzCRJXwNrMj2W9b7ShizsPMYAtc2WGiltvCl4tSsYrm+
 P1uw==
X-Gm-Message-State: APjAAAXNcjCuk0rcBdxQKECP8KuzKI8iM5I+oM1y4IM7sJtXJw2wYMKC
 KRrhb/q9biAy44YLxAn7O/Ommdlg75syhAI0GuA1wdnSLrG9eZLRLPp0nb+eRofJO2TnEjToqd4
 le0AbYcC2+6ITLNpTbQTeRH9JgmPF
X-Received: by 2002:a05:6214:84e:: with SMTP id
 dg14mr12085802qvb.33.1571433779378; 
 Fri, 18 Oct 2019 14:22:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/G0MwZqJYcklPu6cbwamH9QwU3c0nVV1Ekk8CYhFRDxdyOqLXG0iEabSPLqUIkXC4kBVkoA==
X-Received: by 2002:a05:6214:84e:: with SMTP id
 dg14mr12085786qvb.33.1571433779104; 
 Fri, 18 Oct 2019 14:22:59 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id x13sm2797171qki.9.2019.10.18.14.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 14:22:58 -0700 (PDT)
Message-ID: <55aaa666d45de952841e83fdb091506a43c89559.camel@redhat.com>
Subject: Re: [PATCH 04/15] drm/dp: Add drm_dp_channel_coding_supported() helper
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Fri, 18 Oct 2019 17:22:57 -0400
In-Reply-To: <20191015143509.1104985-5-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
 <20191015143509.1104985-5-thierry.reding@gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: tGCwkClZMvOkf4smeXTeHQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571433781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FkOwgkYIDqH7b+ktlwtA4QS38+vELwGihq12yP33qvE=;
 b=XFrJ/YTI/OTS54szEllwBdU8Phwv1/E7X2ZE3n8ZXIlW82oIzlCqyWKaAOxFj9n7ZJQ8SQ
 HzS71mgsNEahIcyaxal85ptO9pxkY+wAHJYq/zKAQC0MnkIhApa721iSLbDT/ccvtYZ0jF
 jWjOYMovaWu9X08LbKd/2S2vPbr2xO8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+CgpPbiBUdWUsIDIwMTkt
MTAtMTUgYXQgMTY6MzQgKzAyMDAsIFRoaWVycnkgUmVkaW5nIHdyb3RlOgo+IEZyb206IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Cj4gCj4gQWRkIGEgaGVscGVyIHRvIGNoZWNr
IHdoZXRoZXIgdGhlIHNpbmsgc3VwcG9ydHMgQU5TSSA4Qi8xMEIgY2hhbm5lbAo+IGNvZGluZyBj
YXBhYmlsaXR5IGFzIHNwZWNpZmllZCBpbiBBTlNJIFgzLjIzMC0xOTk0LCBjbGF1c2UgMTEuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KPiAt
LS0KPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIHwgNyArKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gaW5kZXggZGVmM2Iz
YTU0M2EyLi43ZmY3YmYwZTc0MmQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gQEAgLTEzNyw2ICsx
MzcsNyBAQAo+ICAjIGRlZmluZSBEUF9ERVRBSUxFRF9DQVBfSU5GT19BVkFJTEFCTEUJICAgICgx
IDw8IDQpIC8qIERQSSAqLwo+ICAKPiAgI2RlZmluZSBEUF9NQUlOX0xJTktfQ0hBTk5FTF9DT0RJ
TkcgICAgICAgICAweDAwNgo+ICsjIGRlZmluZSBEUF9DQVBfQU5TSV84QjEwQgkJICAgICgxIDw8
IDApCj4gIAo+ICAjZGVmaW5lIERQX0RPV05fU1RSRUFNX1BPUlRfQ09VTlQJICAgIDB4MDA3Cj4g
ICMgZGVmaW5lIERQX1BPUlRfQ09VTlRfTUFTSwkJICAgIDB4MGYKPiBAQCAtMTI4Myw2ICsxMjg0
LDEyIEBAIGRybV9kcF9zaW5rX3N1cHBvcnRzX2ZlYyhjb25zdCB1OCBmZWNfY2FwYWJsZSkKPiAg
CXJldHVybiBmZWNfY2FwYWJsZSAmIERQX0ZFQ19DQVBBQkxFOwo+ICB9Cj4gIAo+ICtzdGF0aWMg
aW5saW5lIGJvb2wKPiArZHJtX2RwX2NoYW5uZWxfY29kaW5nX3N1cHBvcnRlZChjb25zdCB1OCBk
cGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKPiArewo+ICsJcmV0dXJuIGRwY2RbRFBfTUFJTl9M
SU5LX0NIQU5ORUxfQ09ESU5HXSAmIERQX0NBUF9BTlNJXzhCMTBCOwo+ICt9Cj4gKwo+ICAvKgo+
ICAgKiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbAo+ICAgKi8KLS0gCkNoZWVycywKCUx5dWRlIFBh
dWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
