Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E23856E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB30989B48;
	Fri,  7 Jun 2019 07:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABED08967F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 18:44:48 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s22so2104191qkj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 11:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i7+8VVGKVPXEVnSFQY2/eN+heRnF32oClEuR9RZcz4c=;
 b=KRgz3atLIpNI4DZ4HDyFz54BFSJjVqALStKL+3Qq9H04JDRlCC/Og+227gBsW6asee
 ds5wgFR1tDK/ShBt4OR/vlGiRlkQNRiJso2Ka+ksg8C5yF4mDaVOwBvJICmArDKxPDob
 7wkhfn7YeEZjgRFVZmYdBos2q4CR+z6I6m1v2Xg2yojJjZw0tgrktNB72tAZ2RW9XHaA
 pMhU7rekChTOSGuWH5bo1V+PLbtc2Acp/SETwPqW/mcqfiM2GuzU53OcQLe0x6zzQUQu
 6pcQpQ40AUFMjwDHHwsV7+uJRfc+nf/qFegQKE0bSglhR0MuEnn9KQlFSausdoS8Q9EV
 7H9Q==
X-Gm-Message-State: APjAAAXnA04PimTEE9m3z7QxwaUhZ0CaXX4+9i2M2s0TcLKjr27Q4Kug
 5oC6TIGN3K74P2SmICoNuDYKBQ==
X-Google-Smtp-Source: APXvYqzcNAbWl+BqHtgTaqiaVwnoaAOHy/kM0yjt/wGvoT6pCtDHNXa8FJTB1/3g0VUWQOgRUAVd7Q==
X-Received: by 2002:a05:620a:1ee:: with SMTP id
 x14mr39905952qkn.70.1559846687875; 
 Thu, 06 Jun 2019 11:44:47 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id f6sm1303617qkk.79.2019.06.06.11.44.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 11:44:46 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hYxNV-0008IT-Km; Thu, 06 Jun 2019 15:44:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 05/11] mm/hmm: Remove duplicate condition test before
 wait_event_timeout
Date: Thu,  6 Jun 2019 15:44:32 -0300
Message-Id: <20190606184438.31646-6-jgg@ziepe.ca>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606184438.31646-1-jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i7+8VVGKVPXEVnSFQY2/eN+heRnF32oClEuR9RZcz4c=;
 b=awv3zzYYkAzknK7/NkCAiHR5B250y04djNp+WoYpexe7Uej2IPZ5cqDxrJR0439HDp
 Ip+tkYncoM6synNyttQstYPfXOCfvqJ+MFaPA020vji6f3V+ijeewe00T5WLlGVbBkip
 ta/ZcbdijmmX7p+PqFRh9FOoQWxBygNZCZjmbhPstNfn/mX4xsgnW1BaTUSYo/a8jPup
 YkMIRPOwMicKl54A6Y5BoXPtSil+jxKqN6rTDrLm8CETdgRy4WQzp8exudHeoEcxgA4t
 JqZxvdcH0B1B5+3aq+YyPAmAifoH1FgyXvEu+EF0wwHDyoaCdNCX+I1ObXgN34um9W9p
 meJg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIHdhaXRfZXZlbnRf
dGltZW91dCBtYWNybyBhbHJlYWR5IHRlc3RzIHRoZSBjb25kaXRpb24gYXMgaXRzIGZpcnN0CmFj
dGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBhbm90aGVyIHZlcnNpb24g
b2YgdGhpcywgYWxsCnRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnZ2lu
ZyBpbiBjb21tb24gY2FzZXMsIHdoaWNoIGlzCm5vdCBoZWxwZnVsLgoKRnVydGhlciwgYmFzZWQg
b24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vIHNpbXBsaWZ5IHRoZSByZXF1aXJlZCBjb25kaXRp
b24KdGVzdDoKIC0gSWYgcmFuZ2UgaXMgdmFsaWQgbWVtb3J5IHRoZW4gc28gaXMgcmFuZ2UtPmht
bQogLSBJZiBobW1fcmVsZWFzZSgpIGhhcyBydW4gdGhlbiByYW5nZS0+dmFsaWQgaXMgc2V0IHRv
IGZhbHNlCiAgIGF0IHRoZSBzYW1lIHRpbWUgYXMgZGVhZCwgc28gbm8gcmVhc29uIHRvIGNoZWNr
IGJvdGguCiAtIEEgdmFsaWQgaG1tIGhhcyBhIHZhbGlkIGhtbS0+bW0uCgpBbHNvLCBhZGQgdGhl
IFJFQURfT05DRSBmb3IgcmFuZ2UtPnZhbGlkIGFzIHRoZXJlIGlzIG5vIGxvY2sgaGVsZCBoZXJl
LgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZp
ZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9obW0uaCB8IDEyICsrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0u
aCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXggNGVlM2FjYWJlNWVkMjIuLjJhYjM1YjQwOTky
YjI0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgv
aG1tLmgKQEAgLTIxOCwxNyArMjE4LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGht
bV9yYW5nZV9wYWdlX3NpemUoY29uc3Qgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiBzdGF0aWMg
aW5saW5lIGJvb2wgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoc3RydWN0IGhtbV9yYW5nZSAq
cmFuZ2UsCiAJCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgdGltZW91dCkKIHsKLQkvKiBDaGVjayBp
ZiBtbSBpcyBkZWFkID8gKi8KLQlpZiAocmFuZ2UtPmhtbSA9PSBOVUxMIHx8IHJhbmdlLT5obW0t
PmRlYWQgfHwgcmFuZ2UtPmhtbS0+bW0gPT0gTlVMTCkgewotCQlyYW5nZS0+dmFsaWQgPSBmYWxz
ZTsKLQkJcmV0dXJuIGZhbHNlOwotCX0KLQlpZiAocmFuZ2UtPnZhbGlkKQotCQlyZXR1cm4gdHJ1
ZTsKLQl3YWl0X2V2ZW50X3RpbWVvdXQocmFuZ2UtPmhtbS0+d3EsIHJhbmdlLT52YWxpZCB8fCBy
YW5nZS0+aG1tLT5kZWFkLAorCXdhaXRfZXZlbnRfdGltZW91dChyYW5nZS0+aG1tLT53cSwgcmFu
Z2UtPnZhbGlkLAogCQkJICAgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KSk7Ci0JLyogUmV0dXJu
IGN1cnJlbnQgdmFsaWQgc3RhdHVzIGp1c3QgaW4gY2FzZSB3ZSBnZXQgbHVja3kgKi8KLQlyZXR1
cm4gcmFuZ2UtPnZhbGlkOworCXJldHVybiBSRUFEX09OQ0UocmFuZ2UtPnZhbGlkKTsKIH0KIAog
LyoKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
