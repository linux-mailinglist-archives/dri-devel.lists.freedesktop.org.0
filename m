Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5A03A5A4
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E056D892FF;
	Sun,  9 Jun 2019 12:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C628954A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 13:31:09 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id a27so1230224qkk.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 06:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zyyI11Z3twoMqyf467AVpMwpHxurGKneH7RYfifhIWc=;
 b=S42AxOXZubKdxbnnTblltMc/s5nCjO+rBI5PdoOF3017aktFaCI5AXi4wrbiTWSRwC
 OgkFAQN/6TgSe7aBeSjkJaue6QqErU1hUQUzCa1LpSOr3by0w7NXJQBqHXqdeEhImZIm
 Fs6ExfCIS4NQMMJEFHd+S3h9A7okMI9BxS0sk0LpdlZUWJ03YMLa+NJzY0fip0rLQfhl
 4v0uUHYOQaDUvAhrqinZseJ9f2e7EZgXB2cFrr+CGqQMNjq62DAIWInr38d7zveR8v+K
 BfLX6LFm/6V4LIosLlLr9/u0emR2QxhHiM/Jwz5l6P6cSokB8O3YTIGjh86zZAXQC33b
 95eg==
X-Gm-Message-State: APjAAAW3ReXIjc451kinAk5zwPp3fzDfKADk4uiFpnMEkJFKzRMUzxtJ
 M3cZODXLdZnYBzgjHYkGGkIoXg==
X-Google-Smtp-Source: APXvYqxiNRSOLULUOOVL1v/Vkw7sprKOSUyk24LlCfBwSCfz+nugTDkDj+dcDkV3fQgXrssqVlWltA==
X-Received: by 2002:a37:5d44:: with SMTP id r65mr36792567qkb.73.1559914268352; 
 Fri, 07 Jun 2019 06:31:08 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.55.100])
 by smtp.gmail.com with ESMTPSA id z12sm920156qkf.20.2019.06.07.06.31.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 06:31:07 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hZExX-0007wK-Fu; Fri, 07 Jun 2019 10:31:07 -0300
Date: Fri, 7 Jun 2019 10:31:07 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 hmm 05/11] mm/hmm: Remove duplicate condition test before
 wait_event_timeout
Message-ID: <20190607133107.GF14802@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-6-jgg@ziepe.ca>
 <86962e22-88b1-c1bf-d704-d5a5053fa100@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86962e22-88b1-c1bf-d704-d5a5053fa100@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zyyI11Z3twoMqyf467AVpMwpHxurGKneH7RYfifhIWc=;
 b=XgOcttxFtSt4H5m5uTCUVVYtTNFhZHmzuEIcILLOVnJTu+kol297oc8jfVHnMOgYN9
 KVEhxjN9bHA5zi86oSYRpPBOLol1xW6VGzKyzKOv70gX/o8vASgRfjhKpeATGGiqi8p2
 XV9oIhpp7n0dBZ+VcT3Ff1tVvGN74BzHYOdaSZZrBG0ZxI7UWy4T5qOcP/C4WH3Ycm4Y
 lP9tn3aHO6VWRdFJP59ZySBW8Q29pZmHb8PDxgcfNSvjw/TLR1TF/3PqNNu/lSeFsfDM
 CdiCDVyFP6EYfwN3gNesdEq1ky1h+HmPF/DKvbPP6G+zZ68XUx8LDhlgAyCmkYu0Z+ko
 Ll/w==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHdhaXRfZXZlbnRfdGltZW91dCBtYWNybyBhbHJlYWR5IHRlc3RzIHRoZSBjb25kaXRpb24g
YXMgaXRzIGZpcnN0CmFjdGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBh
bm90aGVyIHZlcnNpb24gb2YgdGhpcywgYWxsCnRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdodF9z
bGVlcCgpIGRlYnVnZ2luZyBpbiBjb21tb24gY2FzZXMsIHdoaWNoIGlzCm5vdCBoZWxwZnVsLgoK
RnVydGhlciwgYmFzZWQgb24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vdyBzaW1wbGlmeSB0aGUg
cmVxdWlyZWQgY29uZGl0aW9uCnRlc3Q6CiAtIElmIHJhbmdlIGlzIHZhbGlkIG1lbW9yeSB0aGVu
IHNvIGlzIHJhbmdlLT5obW0KIC0gSWYgaG1tX3JlbGVhc2UoKSBoYXMgcnVuIHRoZW4gcmFuZ2Ut
PnZhbGlkIGlzIHNldCB0byBmYWxzZQogICBhdCB0aGUgc2FtZSB0aW1lIGFzIGRlYWQsIHNvIG5v
IHJlYXNvbiB0byBjaGVjayBib3RoLgogLSBBIHZhbGlkIGhtbSBoYXMgYSB2YWxpZCBobW0tPm1t
LgoKQWxsb3dpbmcgdGhlIHJldHVybiB2YWx1ZSBvZiB3YWl0X2V2ZW50X3RpbWVvdXQoKSAoYWxv
bmcgd2l0aCBpdHMgaW50ZXJuYWwKYmFycmllcnMpIHRvIGNvbXB1dGUgdGhlIHJlc3VsdCBvZiB0
aGUgZnVuY3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5v
eC5jb20+Ci0tLQp2MwotIFNpbXBsaWZ5IHRoZSB3YWl0X2V2ZW50X3RpbWVvdXQgdG8gbm90IGNo
ZWNrIHZhbGlkCi0tLQogaW5jbHVkZS9saW51eC9obW0uaCB8IDEzICsrLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmluZGV4IDFkOTdi
NmQ2MmM1YmNmLi4yNmU3YzQ3NzQ5MGM0ZSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9obW0u
aAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC0yMDksMTcgKzIwOSw4IEBAIHN0YXRpYyBp
bmxpbmUgdW5zaWduZWQgbG9uZyBobW1fcmFuZ2VfcGFnZV9zaXplKGNvbnN0IHN0cnVjdCBobW1f
cmFuZ2UgKnJhbmdlKQogc3RhdGljIGlubGluZSBib29sIGhtbV9yYW5nZV93YWl0X3VudGlsX3Zh
bGlkKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCQkJCQkgICAgICB1bnNpZ25lZCBsb25nIHRp
bWVvdXQpCiB7Ci0JLyogQ2hlY2sgaWYgbW0gaXMgZGVhZCA/ICovCi0JaWYgKHJhbmdlLT5obW0g
PT0gTlVMTCB8fCByYW5nZS0+aG1tLT5kZWFkIHx8IHJhbmdlLT5obW0tPm1tID09IE5VTEwpIHsK
LQkJcmFuZ2UtPnZhbGlkID0gZmFsc2U7Ci0JCXJldHVybiBmYWxzZTsKLQl9Ci0JaWYgKHJhbmdl
LT52YWxpZCkKLQkJcmV0dXJuIHRydWU7Ci0Jd2FpdF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0t
PndxLCByYW5nZS0+dmFsaWQgfHwgcmFuZ2UtPmhtbS0+ZGVhZCwKLQkJCSAgIG1zZWNzX3RvX2pp
ZmZpZXModGltZW91dCkpOwotCS8qIFJldHVybiBjdXJyZW50IHZhbGlkIHN0YXR1cyBqdXN0IGlu
IGNhc2Ugd2UgZ2V0IGx1Y2t5ICovCi0JcmV0dXJuIHJhbmdlLT52YWxpZDsKKwlyZXR1cm4gd2Fp
dF9ldmVudF90aW1lb3V0KHJhbmdlLT5obW0tPndxLCByYW5nZS0+dmFsaWQsCisJCQkJICBtc2Vj
c190b19qaWZmaWVzKHRpbWVvdXQpKSAhPSAwOwogfQogCiAvKgotLSAKMi4yMS4wCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
