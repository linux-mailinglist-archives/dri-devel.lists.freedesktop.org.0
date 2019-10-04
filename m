Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7140CCB2B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2266E393;
	Sat,  5 Oct 2019 16:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E186EB4A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 11:36:33 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id q24so2994476plr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 04:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nOCYZTp0wlW16jrmBzFl+zhQm0PaZWf4IPrpoghz8Yo=;
 b=g77QfIjx4gMSGkv2ckN9X1+hyvveGQe0KNtSkqjx1k63YpprDVWBe0g+Ip/3U5D+cP
 OmokKH7nNXNCoVi842gkByhRDI+82cvS88/sAdtwNIyxisQFCyioZvH+LG0gUPW3vzqD
 Qke2oxn4UmRNZgyv68CrI4YRrNJE9NW7UtPoAdUyhZAHc0nMJJrQmW3lj+Dy+rdabUMQ
 j4JP83MVDNmwOUhKuM5F4jXO+dL3xFOS+MM7QWDayDN6MitB6gzH8cXvg0EVQMbnlINJ
 gyMKz5WcOQqpC1OdrPtjMkTKLVUoQ1GbH/J6PfP0OoahBhznvSwQk32HHrgy8PmlnLbv
 wkSA==
X-Gm-Message-State: APjAAAVP58njR+nqieYtw2Vel7uUNeGmwf1QZfLP3ZWMRZoYODsrsBm9
 n3zMq9FJ24iUc3DC0EZ1Xw21JA==
X-Google-Smtp-Source: APXvYqycHeOHIdMYTzA5mukhrOH4bcwhg8D6NWJcmxV+oLSJ8CZYEOinQHT3+LzyKtJ5O8kGHo7eRg==
X-Received: by 2002:a17:902:6b4c:: with SMTP id
 g12mr15170702plt.80.1570188992416; 
 Fri, 04 Oct 2019 04:36:32 -0700 (PDT)
Received: from google.com ([2620:15c:2cd:202:668d:6035:b425:3a3a])
 by smtp.gmail.com with ESMTPSA id ev20sm5730991pjb.19.2019.10.04.04.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 04:36:30 -0700 (PDT)
Date: Fri, 4 Oct 2019 04:36:28 -0700
From: Michel Lespinasse <walken@google.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 03/11] drm/amdgpu: convert amdgpu_vm_it to half closed
 intervals
Message-ID: <20191004113628.GA260828@google.com>
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003201858.11666-4-dave@stgolabs.net>
 <dc9cc8c4-7275-43be-5bed-91384e3246ae@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc9cc8c4-7275-43be-5bed-91384e3246ae@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:36:37 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=nOCYZTp0wlW16jrmBzFl+zhQm0PaZWf4IPrpoghz8Yo=;
 b=K+HIkB/DaYwobnDZtGi3XYvBspVWPMRJiBUETqqpwYTvQp9tFBZOt4UE5me6R4KH5S
 Mpx9ZDpyd8o1w0mVzmm8xGfSJnTlB+fk7/XqioTy3S4hbK3Z5kH0ZqyrjIOzsB8/tH4D
 pfUcTKQjyTZzSqwORuc9ZViuQQAwesVIU9ynZ29agbbAhvnjEeoO4Q3XkX0ZgukyrWyx
 OlvSrz0HxL/0J8NRos64LcHFpCF7MEyzvjVw1ZWrt38q+v1BvfwltyrXUM8IdBp68K2O
 qjUllfapLPCmx63lB2GJHG7VgeZVpYLRyL6TEoYakOevapQZBNzNwj6pu5yuCvW2iDrV
 mrHQ==
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
Cc: Davidlohr Bueso <dave@stgolabs.net>, Davidlohr Bueso <dbueso@suse.de>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMDQsIDIwMTkgYXQgMDY6NTQ6NTRBTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cj4gQW0gMDMuMTAuMTkgdW0gMjI6MTggc2NocmllYiBEYXZpZGxvaHIgQnVlc286
Cj4gPiBUaGUgYW1kZ3B1X3ZtIGludGVydmFsIHRyZWUgcmVhbGx5IHdhbnRzIFthLCBiKSBpbnRl
cnZhbHMsCj4gCj4gTkFLLCB3ZSBleHBsaWNpdGx5IGRvIG5lZWQgYW4gW2EsIGJbIGludGVydmFs
IGhlcmUuCgpIaSBDaHJpc3RpYW4sCgpKdXN0IHdhbnRlZCB0byBjb25maXJtIHdoZXJlIHlvdSBz
dGFuZCBvbiB0aGlzIHBhdGNoLCBzaW5jZSBJIHRoaW5rCnlvdSByZWNvbnNpZGVyZWQgeW91ciBp
bml0aWFsIHBvc2l0aW9uIGFmdGVyIGZpcnN0IGxvb2tpbmcgYXQgOS8xMQpmcm9tIHRoaXMgc2Vy
aWVzLgoKSSBkbyBub3Qga25vdyB0aGUgYW1kZ3B1IGNvZGUgd2VsbCwgYnV0IEkgdGhpbmsgdGhl
IGNoYW5nZXMgc2hvdWxkIGJlCmZpbmUgLSBpbiBzdHJ1Y3QgYW1kZ3B1X2JvX3ZhX21hcHBpbmcs
IHRoZSAiZW5kIiBmaWVsZCB3aWxsIGhvbGQgd2hhdAp3YXMgcHJldmlvdXNseSBzdG9yZWQgaW4g
dGhlICJsYXN0IiBmaWVsZCwgcGx1cyBvbmUuIFRoZSBleHBlY3RhdGlvbgppcyB0aGF0IG92ZXJm
bG93cyBzaG91bGQgbm90IGJlIGFuIGlzc3VlIHRoZXJlLCBhcyAiZW5kIiBpcyBleHBsaWNpdGx5
CmRlY2xhcmVkIGFzIGFuIHVpbnQ2NCwgYW5kIGFzIHRoZSBjb2RlIHdhcyBwcmV2aW91c2x5IGNv
bXB1dGluZwoibGFzdCArIDEiIGluIG1hbnkgcGxhY2VzLgoKRG9lcyB0aGF0IHNlZW0gd29ya2Fi
bGUgdG8geW91ID8KClRoYW5rcywKCi0tIApNaWNoZWwgIldhbGtlbiIgTGVzcGluYXNzZQpBIHBy
b2dyYW0gaXMgbmV2ZXIgZnVsbHkgZGVidWdnZWQgdW50aWwgdGhlIGxhc3QgdXNlciBkaWVzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
