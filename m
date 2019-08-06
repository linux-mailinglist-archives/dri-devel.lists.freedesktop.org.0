Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB74582DC6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 10:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1941C6E32F;
	Tue,  6 Aug 2019 08:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A72188FA0;
 Tue,  6 Aug 2019 08:33:53 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id m8so57859098vsj.0;
 Tue, 06 Aug 2019 01:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L3laO+k8rafvoIENNnOkb7QDUkGKtpfBuwQzQEPVcpk=;
 b=lNd++5cXwAruVoAs5xEEFdNvQHkd7hFLaTKO73psbEAV/bOsmWxir5reyx3jKTBvkE
 85sbopSUzm5qNJe7U1pYkLSFaI8W7vjb9EUhpvbFVpeE3GdDR0QPpJi2wgBXmTemuvIR
 xxXRG86WDis2UfTEc7YPcEL1ZrDeiYT3I0MsQCqKlvu8U60cXK3gqRZ9vpH/lI81I41o
 f+Snz/duJ9t14XTdFMrYLIjasZOCvM2DkG+GrYZgyowNR5REvKxBh8vBSD/gQqRxagkk
 GPA0PvZHXgMpDFRhjaZOKTzLttg1WkPtMm44IboChDy5haj1p4wnjaJ9zEdBmmu+TMJX
 +UXw==
X-Gm-Message-State: APjAAAVGYfTS9duj6LmC3op1bXS/IFMs8yJ5JuJkgJ5Qz8P0+0beUnc9
 W4qQ2CaQRN/M95vwdKZ7NJPh/afBOjM+RQWHeDI=
X-Google-Smtp-Source: APXvYqxKu72JAW2RGZxe7DiW01lI2DmuzDe2HpznDq1juAM1vrYh+aMD/Tbtq+3dWIh9uqqTzDYnPm88keMhsQByGds=
X-Received: by 2002:a67:e3d5:: with SMTP id k21mr1519155vsm.172.1565080432608; 
 Tue, 06 Aug 2019 01:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190802200705.GA10110@ziepe.ca>
 <c59ebe8b-9b18-24b8-b02c-8ccaa7df4dc9@amd.com>
 <20190806073105.GA20575@infradead.org>
In-Reply-To: <20190806073105.GA20575@infradead.org>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 6 Aug 2019 11:33:26 +0300
Message-ID: <CAFCwf10aRHeXuOg+5o6=VgzM1dhFQde=b0jZSmgF4DfibYcp_A@mail.gmail.com>
Subject: Re: [PATCH hmm] drm/amdkfd: fix a use after free race with
 mmu_notififer unregister
To: Christoph Hellwig <hch@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=L3laO+k8rafvoIENNnOkb7QDUkGKtpfBuwQzQEPVcpk=;
 b=SzqphmH9Xcr/8QNjmRCurEieXSoyqucXzM/i0jQtfbn7fCyXLgcnseGNHc6O2zl0H8
 lcXNVaaPPFwrjISof3c2HskBLmzDayr30vm+Qic8693HY+xSJZSrxgebQJ66vpu9D/Eq
 vQkLuOeWxkEuWjQUPFyc/vmh3iGJQgTI2NTzHt5n2Zxk6utihlQvgJuoPQh/WsEFNuYY
 tpX2Vz3PLkto6LaLhBGh7VJXzWoigJWHVsrd09RKw7dK7au28CNsw1fRB6UcV4P62b5V
 ln+954kRxd9UlqSh7T3eMX/xRSj1iLKCZOI/4sDOi2f4lKvulstRs6VTYv3pBuqxzkrE
 4vtg==
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
Cc: Ben Goz <ben.goz@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxMDozMSBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+IHdyb3RlOgo+Cj4gQnR3LCB3aG8gbWFpbnRhaW5zIGFta2ZkIHRoZXNlIGRh
eXM/ICBNQUlOVEFJTkVSUyBzdGlsbCBsaXN0cwo+IE9kZWQsIGJ1dCBoZSBzZWVtcyB0byBoYXZl
IG1vdmVkIG9uIHRvIEhhYmFuYWxhYnMgYW5kIG1haW50YWlucyB0aGF0Cj4gZHJpdmVycyBub3cg
d2hpbGUgbm90IGhhdmluZyBhbnkgYWN0aW9uIG9uIGFtZGtmZCBmb3Igb3ZlciBhIHllYXIuCgpJ
J3ZlIHNlbnQgYSBwYXRjaCB0byB1cGRhdGUgdGhlIE1BSU5UQUlORVJTIGZpbGUgYSBtb250aCBh
Z28gdG8KZHJpLWRldmVsIGFuZCBEYXZlCihodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9h
cmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdWx5LzIyNTI3Mi5odG1sKQoKVGhhbmtzLApPZGVkCgpP
ZGVkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
