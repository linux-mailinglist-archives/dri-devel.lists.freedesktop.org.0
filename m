Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB11288451
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1C36EC75;
	Fri,  9 Oct 2020 08:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6585F6EC75
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:59:59 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f21so8841774wml.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uX5hiQf2/6+JGMu7ibulF4yjLrHkS7bzKXomqQaTHWE=;
 b=LUs8gW8poh/U88b/yPCV1unTccMuHSzIpHlM9z2+BrGZRpT9/SgX900ntWxsVp0THA
 6pATcrsdZsxLyB+PObFVC/LN2SqZ3pUmcbdagnolKeMah/pcR69O+r6i8uxjKGpoKgMW
 IouGPHyDlnYWeMW6lK51rglfKepWnaslSuqQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uX5hiQf2/6+JGMu7ibulF4yjLrHkS7bzKXomqQaTHWE=;
 b=ASkfgya8N/IPb+OCuevYregs/0NxkVamp8PWRzOsohxHO8T4/Wdpi4Q34nfvcm3pIv
 B4+UZL3Lr4Ktnn48q8O+csNOs2a3IMjEs00NFirFImAm76Ag9Ka31NoU3gZjBgQ3keYq
 DFJKpJ0u1NJnMAc//uluVIw1akS+DQE0WiRKaO1IWS277nuilgeyMN2QVv++q3pmFVSo
 6cn8A25BfQKIbpeP4sZypDUFeLD0Qc3Q1ZivfEr+hxaII96068ndENmmswPNOi4tLGDK
 HmMoidD5uL+Um2CNBSHWR2PR7YUO7dtps8CdriPXGVtL03KEdTZg5605Tg4bS09didQs
 bzLA==
X-Gm-Message-State: AOAM531LckCSveOFXR2fLshs58ewpQlVSywUOj+xoTF2m9GSny2Wt0U2
 sNSUWrwcljGT9tPgyClJzWAk9BMlNsAPpGUn
X-Google-Smtp-Source: ABdhPJzgf8p51mqg8LMpEmZ8q3ui41jSdEp5wqDSyAI+GdHX93E/LMoGG5UPxz3MA259SCYbT0mGJw==
X-Received: by 2002:a7b:c14f:: with SMTP id z15mr13474049wmi.73.1602230397816; 
 Fri, 09 Oct 2020 00:59:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 00:59:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 04/17] misc/habana: Use FOLL_LONGTERM for userptr
Date: Fri,  9 Oct 2020 09:59:21 +0200
Message-Id: <20201009075934.3509076-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Pawel Piskorski <ppiskorski@habana.ai>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ofir Bitton <obitton@habana.ai>, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, Omer Shpigelman <oshpigelman@habana.ai>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Moti Haimovski <mhaimovski@habana.ai>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIHBlcnNpc3RlbnQsIG5vdCBqdXN0IGZvciB0aGUgZHVyYXRpb24gb2YgYSBkbWEg
b3BlcmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
Q2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogT2RlZCBHYWJiYXkgPG9kZWQu
Z2FiYmF5QGdtYWlsLmNvbT4KQ2M6IE9tZXIgU2hwaWdlbG1hbiA8b3NocGlnZWxtYW5AaGFiYW5h
LmFpPgpDYzogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPgpDYzogVG9tZXIgVGF5YXIg
PHR0YXlhckBoYWJhbmEuYWk+CkNjOiBNb3RpIEhhaW1vdnNraSA8bWhhaW1vdnNraUBoYWJhbmEu
YWk+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFBhd2VsIFBpc2tv
cnNraSA8cHBpc2tvcnNraUBoYWJhbmEuYWk+Ci0tLQogZHJpdmVycy9taXNjL2hhYmFuYWxhYnMv
Y29tbW9uL21lbW9yeS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21t
b24vbWVtb3J5LmMgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9jb21tb24vbWVtb3J5LmMKaW5k
ZXggMzI3YjY0NDc5Zjk3Li43NjdkMzY0NGMwMzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWlzYy9o
YWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYworKysgYi9kcml2ZXJzL21pc2MvaGFiYW5hbGFicy9j
b21tb24vbWVtb3J5LmMKQEAgLTEyODgsNyArMTI4OCw4IEBAIHN0YXRpYyBpbnQgZ2V0X3VzZXJf
bWVtb3J5KHN0cnVjdCBobF9kZXZpY2UgKmhkZXYsIHU2NCBhZGRyLCB1NjQgc2l6ZSwKIAkJcmV0
dXJuIC1FTk9NRU07CiAJfQogCi0JcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucGFn
ZXMsIEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFLAorCXJjID0gcGluX3VzZXJfcGFnZXNfZmFzdChz
dGFydCwgbnBhZ2VzLAorCQkJCSBGT0xMX0ZPUkNFIHwgRk9MTF9XUklURSB8IEZPTExfTE9OR1RF
Uk0sCiAJCQkJIHVzZXJwdHItPnBhZ2VzKTsKIAogCWlmIChyYyAhPSBucGFnZXMpIHsKLS0gCjIu
MjguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
