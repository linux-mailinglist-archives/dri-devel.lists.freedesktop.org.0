Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7230549EB0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 12:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3117C6E129;
	Tue, 18 Jun 2019 10:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FD96E129
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 10:56:13 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id f9so13385278wre.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 03:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=IUeAzyE4fLieRVDjLg1HKkctsm3ow3UMKool0nOhnbI=;
 b=OXCNveRXRU/pppvFmnl8Vre4wyDsLmARlJfx6xDQn0njk10uQeAvYyEel7wunjk67Q
 egYjVHQqhTe46qflWTYu7c9HToiTYfYpfegtid9mlkvdVs8ho0brs5GVnan1I5Yq6c+o
 SBXERGnmTTO7M6OvPRIOxD60B14atQBiCx0EbFGAB1o1HINRdWr1jiHQp/ykvYYSKG+S
 HJ1QqWapRGPB0HWmxrYZ1gY4eMKWYW1ifxbMpzmG9uzJrHLmlBVFHuXlcFxmxwNxzd/n
 MEWJuSVGBwfb8Raelzne4iGMNhk5NYvE44MTQfNpTPFSrJUUqx16HDlnVfLJvUe8QpUP
 p1Bg==
X-Gm-Message-State: APjAAAWEOliDaWeRp0NFKr1nR83F3jdq8DZkCR8CPFEPLgh3camXpG3L
 F92Mjr89fvKRAKrePsytPKY=
X-Google-Smtp-Source: APXvYqyPGXFLTUoXzyX2xiAmWUJ7y8OiPqioNrSfsCq7dfuI4H1gEitO33fy+gQx9tr4isAINfJ5vw==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr19379071wrq.151.1560855371933; 
 Tue, 18 Jun 2019 03:56:11 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id n3sm9864935wro.59.2019.06.18.03.56.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 03:56:11 -0700 (PDT)
Date: Tue, 18 Jun 2019 11:54:08 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas@shipmail.org>
Subject: Re: [PATCH 1/4] drm/vmwgfx: Assign eviction priorities to resources
Message-ID: <20190618105408.GB29642@arch-x1c3>
References: <20190618062442.14647-1-thomas@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618062442.14647-1-thomas@shipmail.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=IUeAzyE4fLieRVDjLg1HKkctsm3ow3UMKool0nOhnbI=;
 b=EGoxzGeGvofXISef1NqSJIQ32CBsZVp39SqLQkmJy/REnVklsL8kr5N9B8BN3DfWo7
 wCT9CeTP9oo84UzJKL9Dioda5Bq/Du/x6NWJpoVqGGIWIty3ZFukQGweAqGUo281QCC7
 Voh8LkRyCl66g2ni68Rb9kPAwlKTu0EK6Lxh8R85hfBZf8o52n4VkR8SysYTg1X9MVq4
 m8Ir5YfaqgbJvzR2QoRhrbPtBugJNiMcVyqNZHGMVZn8M14vnevMSUpPGjhuzQzQ4hSW
 XuwobRYSAHRHrrgCf4phZHSu3kfB5Ew8fzUvfaKB/OtvgssiM3e/0ioWfxqp/ihLnTL5
 LG9A==
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thellstrom@vmware.com>,
 Deepak Rawat <drawat@vmware.com>, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gMjAxOS8wNi8xOCwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3Jv
dGU6Cj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+IAo+
IFRUTSBwcm92aWRlcyBhIG1lYW5zIHRvIGFzc2lnbiBldmljdGlvbiBwcmlvcml0aWVzIHRvIGJ1
ZmZlciBvYmplY3QuIFRoaXMKPiBtZWFucyB0aGF0IGFsbCBidWZmZXIgb2JqZWN0cyB3aXRoIGEg
bG93ZXIgcHJpb3JpdHkgd2lsbCBiZSBldmljdGVkIGZpcnN0Cj4gb24gbWVtb3J5IHByZXNzdXJl
Lgo+IFVzZSB0aGlzIHRvIG1ha2Ugc3VyZSBzdXJmYWNlcyBhbmQgaW4gcGFydGljdWxhciBub24t
ZGlydHkgc3VyZmFjZXMgYXJlCj4gZXZpY3RlZCBmaXJzdC4gRXZpY3RpbmcgaW4gcGFydGljdWxh
ciBzaGFkZXJzLCBjb3RhYmxlcyBhbmQgY29udGV4dHMgaW1wbHkKPiBhIHNpZ25pZmljYW50IHBl
cmZvcm1hbmNlIGhpdCBvbiB2bXdnZngsIHNvIG1ha2Ugc3VyZSB0aGVzZSByZXNvdXJjZXMgYXJl
Cj4gZXZpY3RlZCBsYXN0Lgo+IFNvbWUgYnVmZmVyIG9iamVjdHMgYXJlIHN1Yi1hbGxvY2F0ZWQg
aW4gdXNlci1zcGFjZSB3aGljaCBtZWFucyB3ZSBjYW4gaGF2ZQo+IG1hbnkgcmVzb3VyY2VzIGF0
dGFjaGVkIHRvIGEgc2luZ2xlIGJ1ZmZlciBvYmplY3Qgb3IgcmVzb3VyY2UuIEluIHRoYXQgY2Fz
ZQo+IHRoZSBidWZmZXIgb2JqZWN0IGlzIGdpdmVuIHRoZSBoaWdoZXN0IHByaW9yaXR5IG9mIHRo
ZSBhdHRhY2hlZCByZXNvdXJjZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJv
bSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+IFJldmlld2VkLWJ5OiBEZWVwYWsgUmF3YXQgPGRy
YXdhdEB2bXdhcmUuY29tPgpGd2l3IHBhdGNoZXMgMS0zIGFyZToKUmV2aWV3ZWQtYnk6IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CgpQYXRjaCA0IGlzOgpBY2tlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkh1Z2UgdGhhbmtz
IGZvciBzb3J0aW5nIHRoaXMgb3V0LgpFbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
