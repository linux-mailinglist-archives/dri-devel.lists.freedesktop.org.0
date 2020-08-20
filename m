Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9724C21B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:24:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EC36E96B;
	Thu, 20 Aug 2020 15:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97E16E962;
 Thu, 20 Aug 2020 15:24:08 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k20so1933522wmi.5;
 Thu, 20 Aug 2020 08:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xlhZ7D6LG8POf6m6tTiEw4edQEzukZYGW8e7JkwZDXc=;
 b=k6prsj/LId46ioyFhhcXkT/0dKD3NE0WJm0t0xt9rQwBsbmmsYLgPSMCC4qeg0Iwgl
 XWbkfwLTIZGbOgWybYgxYdfRlRv3NENvtOKru0kj1+xXhN1xf5xOC13bicPj+TXVpGOG
 IQ7PcL+bg5M8MM9LEVwmyFfMBOwKjJ/WOciHskMf7fovnQ7N/aQ+nURCNICBJHIMsyM1
 qS54QjGcyqgBnnlgqgD9uODl6P4P8XZHd83XoVOl5KKTRawOyffm9/XxLeafLc1otr+o
 zbrz/EdxRFE/TB1EeiohLuVaeqtj96htP634P8m/rP8tlS5AK/pBVh9xW5Ug5T08cxns
 YgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xlhZ7D6LG8POf6m6tTiEw4edQEzukZYGW8e7JkwZDXc=;
 b=un6luLgomUnAz5vxSoXT9WU1JB0BsFnYWs/gX1+g+zp7E8xbCrQwY0n0PEuKqiVqM8
 khip1zxH8xoc35+KGpWy6NnP66vc8BHceNbmcyODFDvBTzqqAYxULrk6lQU/WFeTdSkE
 s7JBVgP5o5mihilYsvImVxyh8cgGEdnM8LihO+ggH9FmzgtFk9owbAh5mYdQuQKzn5HO
 daAGUPshsd9w2RbZArfLHL5MLgIpr+qRAqGjabe7LQsjGxQBrHrV7HF6wLywcbdWCR3M
 NylYW3qXOjff3nwujx408YX9T3PKidLCrfN8M1dTz6MmIPu2pVv/KGejkl4TYN7dszaF
 eEdg==
X-Gm-Message-State: AOAM531u7toHe1WCdeFubTT7cmqe3p1h2+pcf0MZ6Ks4/SfMZsD75bEe
 hbfYldJafhrJMvoFyhq6L6A=
X-Google-Smtp-Source: ABdhPJz83ngcqU3V7tkrGsex0oehZ4fhpZ7mld9HzYBZnOzyGN2lLNUMSDJ3CLsqZgcwcJ80dfYExQ==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr3979071wmk.86.1597937047442; 
 Thu, 20 Aug 2020 08:24:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6f64:e393:bd4a:2d65])
 by smtp.gmail.com with ESMTPSA id t189sm5320708wmf.47.2020.08.20.08.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 08:24:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com, skeggsb@gmail.com, dri-devel@lists.freedesktop.org,
 Nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: fix broken merge between drm-next and
 drm-misc-next
Date: Thu, 20 Aug 2020 17:24:03 +0200
Message-Id: <20200820152404.22774-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200820152404.22774-1-christian.koenig@amd.com>
References: <20200820152404.22774-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtLW5leHQgcmV2ZXJ0ZWQgdGhlIGNoYW5nZXMgdG8gdHRtX3R0X2NyZWF0ZSgpIHRvIGRvIHRo
ZQpOVUxMIGNoZWNrIGluc2lkZSB0aGUgZnVuY3Rpb24sIGJ1dCBkcm0tbWlzYy1uZXh0IGFkZHMg
bmV3CnVzZXJzIG9mIHRoaXMgYXBwcm9hY2guCgpSZS1hcHBseSB0aGUgTlVMTCBjaGVjayBjaGFu
Z2UgaW5zaWRlIHRoZSBmdW5jdGlvbiB0byBmaXggdGhpcy4KClNpZ25lZC1vZmYtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IERhdmUg
QWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9wYXRjaC8zODY2MjgvCi0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCA0ICsrKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
CmluZGV4IDk3YWM2NjJhNDdjYi4uZTM5MzFlNTE1OTA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAg
LTExODAsNyArMTE4MCw3IEBAIGludCB0dG1fYm9fdmFsaWRhdGUoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibywKIAkvKgogCSAqIFdlIG1pZ2h0IG5lZWQgdG8gYWRkIGEgVFRNLgogCSAqLwot
CWlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0gJiYgYm8tPnR0bSA9PSBOVUxM
KSB7CisJaWYgKGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSkgewogCQlyZXQgPSB0
dG1fdHRfY3JlYXRlKGJvLCB0cnVlKTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fdHQuYwppbmRleCA5YWE0ZmJlMzg2ZTYuLjFjY2YxZWYwNTBkNiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV90dC5jCkBAIC01MCw2ICs1MCw5IEBAIGludCB0dG1fdHRfY3JlYXRlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sIGJvb2wgemVyb19hbGxvYykKIAogCWRtYV9yZXN2X2Fzc2VydF9oZWxk
KGJvLT5iYXNlLnJlc3YpOwogCisJaWYgKGJvLT50dG0pCisJCXJldHVybiAwOworCiAJaWYgKGJk
ZXYtPm5lZWRfZG1hMzIpCiAJCXBhZ2VfZmxhZ3MgfD0gVFRNX1BBR0VfRkxBR19ETUEzMjsKIApA
QCAtNjcsNyArNzAsNiBAQCBpbnQgdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLCBib29sIHplcm9fYWxsb2MpCiAJCXBhZ2VfZmxhZ3MgfD0gVFRNX1BBR0VfRkxBR19T
RzsKIAkJYnJlYWs7CiAJZGVmYXVsdDoKLQkJYm8tPnR0bSA9IE5VTEw7CiAJCXByX2VycigiSWxs
ZWdhbCBidWZmZXIgb2JqZWN0IHR5cGVcbiIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
