Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F0049EF2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 13:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 985656E136;
	Tue, 18 Jun 2019 11:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F76A6E136
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 11:09:25 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r12so18929061edo.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 04:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=Uk40UhexmdEkWRPW8aWJEctkTMOanHrquMubXf3T9Dw=;
 b=umLMnRajmc5HwTc/lyUcNNB3TueRDN3sVHcd49cGXYBWQ4E1NDGELpNCMYN6To6Jp6
 L00uxA1ZXtffIE/8Fspo9dF06Tl8Ub3aQ7ab6psLnql/wE7v4DA4+Fty3qdjlaTXwzk+
 5Svu6KWb2r9pAUxuPWYYbw1K2tfiC4zE485N1P3EmJPGNieR9SeNSvTU5L8KmR6/7LnU
 LjGU7APNZG8OswcNLGHi43umtZ+LsTQqDGUg2SUAyEO8Pcqyt7CjyA8cVtP9bHoCZ0Ao
 kZ3RGFeUwILsuIsl2eIHf2B/w0UDLWppdH3EnJpCwSGVHhGCbsJ5SGa7jlNnu5T+JQ3i
 +lbg==
X-Gm-Message-State: APjAAAWWPzLRJ5gPuq3Pshd+JGwp7vvebCHxdTaqtrjgTYnYRrdM7G2P
 WliF/escczaiW8QWd7Bz3aiGbg==
X-Google-Smtp-Source: APXvYqxDAdIWhEhz4so6nZF5fEOV/XaepK/UWiijVodzL7WD5Tp5cQOXhr6kUBRkeMz38o7msif/xQ==
X-Received: by 2002:a50:8825:: with SMTP id b34mr46675030edb.22.1560856163828; 
 Tue, 18 Jun 2019 04:09:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t15sm2157524ejj.25.2019.06.18.04.09.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 04:09:23 -0700 (PDT)
Date: Tue, 18 Jun 2019 13:09:20 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH V2 4/5] drm/vkms: Use index instead of 0 in possible crtc
Message-ID: <20190618110920.GT12905@phenom.ffwll.local>
Mail-Followup-To: Simon Ser <contact@emersion.fr>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Brian Starkey <brian.starkey@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <cover.1560820888.git.rodrigosiqueiramelo@gmail.com>
 <971da2ede86d11357e6822409bef23cb03869f83.1560820888.git.rodrigosiqueiramelo@gmail.com>
 <innWfwO1f7V6XAA8IXBBqGMw-4_upKRtjsPG8kg19Pl9b2Hf3Bd4V20Ow7GWhfzNUmij1uVwMuHbOp3zGderuXZGhunI0y_-khuFTOStOkI=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <innWfwO1f7V6XAA8IXBBqGMw-4_upKRtjsPG8kg19Pl9b2Hf3Bd4V20Ow7GWhfzNUmij1uVwMuHbOp3zGderuXZGhunI0y_-khuFTOStOkI=@emersion.fr>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Uk40UhexmdEkWRPW8aWJEctkTMOanHrquMubXf3T9Dw=;
 b=jpinsjW0qcygBTIUeWTLASX3k+7oqGLP4M9Q+dpKl8sjJMw6G0cFj4V6ZjdHwPYk/P
 xWsD5MxoYxor/OVbE21kjxVSQGCBA539AxgenHOoaKCnxKKaDBqomzJXTlhQlJLtXz8Y
 tJmEA9ANcXu+8KVckS5IWixebtK/KxxX3oxmE=
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDc6NTY6MjNBTSArMDAwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IEludGVyZXN0aW5nbHksIGV2ZW4gd2l0aCB0aGUgcHJldmlvdXMgY29kZSwgcG9zc2libGVf
Y3J0Y3M9MSB3YXMKPiBleHBvc2VkIHRvIHVzZXJzcGFjZSBbMV0uIEkgdGhpbmsgdGhpcyBpcyBi
ZWNhdXNlIG9mIGEgc2FmZWd1YXJkIGluCj4gZHJtX2NydGNfaW5pdF93aXRoX3BsYW5lcyAoZHJt
X2NydGMuYzoyODQpIHdoaWNoIHNldHMgdGhlIHByaW1hcnkgYW5kCj4gY3Vyc29yIHBsYW5lJ3Mg
cG9zc2libGVfY3J0Y3MgdG8gdGhlIGZpcnN0IENSVEMgaWYgemVyby4KPiAKPiBJZiB3ZSB3YW50
IHRvIHdhcm4gb24gcG9zc2libGVfY3J0Y3M9MCwgd2Ugc2hvdWxkIHByb2JhYmx5IHJlbW92ZSB0
aGlzCj4gc2FmZWd1YXJkLiBDaGVja2luZyBmaXJzdCB3aGV0aGVyIHRoaXMgc2FmZWd1YXJkIGlz
IHVzZWQgYnkgYW55IGRyaXZlcgo+IGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhLgo+IAo+IFsxXTog
aHR0cHM6Ly9kcm1kYi5lbWVyc2lvbi5mci9kZXZpY2VzL2YyMThkMTI0MjcxNAoKWWVhaHQgaXQn
cyBhIGJpdCBhIG1lc3MsIHRoYXQncyB3aHkgSSd2ZSBzdWdnZXN0ZWQgd2Ugc2hvdWxkIGJpdGUg
dGhpcwpidWxsZXQgYW5kIGZpeCBpdCBmb3IgcmVhbC4gVGhlcmUncyBhIGJ1bmNoIG90aGVycyBz
dWNoIGJpdG1hc2tzIHRoYXQgbWFueQpkcml2ZXJzIHNlZW0gdG8gbm90IHNldCBjb3JyZWN0bHku
Ci1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBv
cmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
