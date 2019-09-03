Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8522DA6CBF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 17:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D229892BE;
	Tue,  3 Sep 2019 15:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856228957D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 15:18:54 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c19so5017174edy.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 08:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=M/MgUkf0bO2y1PXvF3i03lzNOLBm92Qd4oy/UMB5kQA=;
 b=GmmQ0n4k+rtZtmcp7E7BBx+ZI6cOpJUQpXpHa7MyV0BNgtoEH4he8NBtmnisVyjWuz
 H1zPrrNkvbIPu2sZsK92ayP+uV0Jb9gBXaKA+gUlYcOfQbMU1RwNs62PJOedQ/ivF0BY
 /mJkutdWz9I725YJpednZGQVOFz4W8+6u943O/UMQrMgrdccp6KaQLwhcSfE+VOqsORQ
 8csOpBHL9i4eSuHWW4Fgn5k1byB7d2dwaZKuUTQf7WI0dom4DVyPCNQUvT19T1IJ4S1M
 EnIHHXQF/eKhJi38T9JoGik4jksvHizFCtai8Zxj92mCGLPF5XUHqFiylZdnYmZfVhR1
 KHlw==
X-Gm-Message-State: APjAAAUNBb4y7Sv6j2YJz1giVxB/GMvWjZ/CKD4+zAEndnOcxgWDIIbN
 9acNUkPruCB/ruA8RywXD0Piuw==
X-Google-Smtp-Source: APXvYqwZYMPuR026foAliFROtcKkxtxin7G2+x5wezCSiXYr6+gpxIU+tlEuN6Cd2MU96aGSP0aElw==
X-Received: by 2002:a05:6402:894:: with SMTP id
 e20mr36411232edy.69.1567523933187; 
 Tue, 03 Sep 2019 08:18:53 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id m22sm3381056edp.50.2019.09.03.08.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 08:18:52 -0700 (PDT)
Date: Tue, 3 Sep 2019 17:18:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v2 0/4] Have TTM support SEV encryption with coherent
 memory
Message-ID: <20190903151850.GB2112@phenom.ffwll.local>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?=
 <thomas_os@shipmail.org>, 
 dri-devel@lists.freedesktop.org, pv-drivers@vmware.com,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org
References: <20190903131504.18935-1-thomas_os@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190903131504.18935-1-thomas_os@shipmail.org>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=M/MgUkf0bO2y1PXvF3i03lzNOLBm92Qd4oy/UMB5kQA=;
 b=EvTOIWYVWgrd7AbgV5YsYOXbSXD4jwxgmejN3UTHIJhGn03ikVBqZeHHeW7u9lqI34
 /MjiQvOoCtQU/+TI25Ks7pHxMntaHG7efrJjU8krFLkWkYKQEcCc2e+qk5E4xrAi3uEH
 2tcPUTv5f5FovKVuc7SvXkwXE/nB1wU1AczuA=
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
Cc: pv-drivers@vmware.com, linux-graphics-maintainer@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDM6MTU6MDBQTSArMDIwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKFZNd2FyZSkgd3JvdGU6Cj4gV2l0aCBTRVYgbWVtb3J5IGVuY3J5cHRpb24gYW5kIGluIHNv
bWUgY2FzZXMgYWxzbyB3aXRoIFNNRSBtZW1vcnkKPiBlbmNyeXB0aW9uLCBjb2hlcmVudCBtZW1v
cnkgaXMgdW5lbmNyeXB0ZWQuIEluIHRob3NlIGNhc2VzLCBUVE0gZG9lc24ndAo+IHNldCB1cCB0
aGUgY29ycmVjdCBwYWdlIHByb3RlY3Rpb24uIEZpeCB0aGlzIGJ5IGhhdmluZyB0aGUgVFRNCj4g
Y29oZXJlbnQgcGFnZSBhbGxvY2F0b3IgY2FsbCBpbnRvIHRoZSBwbGF0Zm9ybSBjb2RlIHRvIGRl
dGVybWluZSB3aGV0aGVyCj4gY29oZXJlbnQgbWVtb3J5IGlzIGVuY3J5cHRlZCBvciBub3QsIGFu
ZCBtb2RpZnkgdGhlIHBhZ2UgcHJvdGVjdGlvbiBpZgo+IGl0IGlzIG5vdC4KPiAKPiB2MjoKPiAt
IFVzZSBmb3JjZV9kbWFfdW5lbmNyeXB0ZWQoKSByYXRoZXIgdGhhbiBzZXZfYWN0aXZlKCkgdG8g
Y2F0Y2ggYWxzbyB0aGUKPiAgIHNwZWNpYWwgU01FIGVuY3J5cHRpb24gY2FzZXMuCgpXZSBzaG91
bGQgcHJvYmFibHkgY2MgQ2hyaXN0b3BoIEhlbGx3aWcgb24gdGhpcyAuLi4gYmV0dGVyIHRvIGhl
YXIgaGlzCnNjcmVhbXMgYmVmb3JlIG1lcmdpbmcgdGhhbiBhZnRlcndhcmRzLiBBcyBtdWNoIGFz
IEkgZG9uJ3Qgc3VwcG9ydApzY3JlYW1pbmcgbWFpbnRhaW5lcnMsIHRoYXQgc2VlbXMgdGhlIGxl
YXN0IGJhZCBvcHRpb24gaGVyZS4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBF
bmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
