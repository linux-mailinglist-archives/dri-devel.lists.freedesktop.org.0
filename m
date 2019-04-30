Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDB105CF
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 942AA8938C;
	Wed,  1 May 2019 07:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9C7891AB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 13:25:46 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id b67so11748096qkc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 06:25:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XhTfun6kQ0RRzRGxeYV1Lxl9M9fvGqRUvmzO5QW1/Iw=;
 b=g4baeqXoUjCw1CLH1OqCq9xwdvYLLLxMSJugzsK4anVrNgRNUHYHeA0okiVoQKbMWG
 OcCOzKEq6qjqruiYRFAg1o8m+4a03P6sm2+iCQXtJbVqS6hzlkzDPAZr7meK21F3UkIy
 rc6kucQTmI1+1tJfhC7mXpHliFB0EUfnPXqlRT1glGZ+zGlsv75XcVpBNgK5uHZBw5DY
 EqIBIyitQ34ONcDbaZVmBZudtT5r8YqqnAHaVS55Bl9eUxgK5yqe527WnV9TwF3Ttdcg
 ygYngPVnuyJSeiiHGoCbWxX6Bry2GjiNlogwEtUe3o60Bpn2c/fifRp1ORI53CpyLUMT
 EzRw==
X-Gm-Message-State: APjAAAXiEXCb+I+jrkOSJUWlE5wuQEAjgK/aeY4bTttGrrmO+Gm7PixI
 ZI5Y1+aitKoTqaJab+ZM53cXmAkAVxouQOO2
X-Google-Smtp-Source: APXvYqznoxmsWRf0TRsMetoUzYzE4dAnT0nzUuom4UB8P1UAcmj3+/tm6hiTUWLYkHc/SM6nPM/1vvtkZ4BWAaOU
X-Received: by 2002:a37:b683:: with SMTP id g125mr147309qkf.249.1556630745179; 
 Tue, 30 Apr 2019 06:25:45 -0700 (PDT)
Date: Tue, 30 Apr 2019 15:25:05 +0200
In-Reply-To: <cover.1556630205.git.andreyknvl@google.com>
Message-Id: <f7a89f69f95e471f161e4000d0e13f57364bc90d.1556630205.git.andreyknvl@google.com>
Mime-Version: 1.0
References: <cover.1556630205.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v14 09/17] fs, arm64: untag user pointers in copy_mount_options
From: Andrey Konovalov <andreyknvl@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org, 
 linux-media@vger.kernel.org, kvm@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailman-Approved-At: Wed, 01 May 2019 07:18:43 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=XhTfun6kQ0RRzRGxeYV1Lxl9M9fvGqRUvmzO5QW1/Iw=;
 b=wJdQ1UGK5yN+4uNr4h/B5QAZg4CL5PwyVx/Pw0wXlRL/1oGZsU8xxjXpZhWnko4SRI
 fd58gicIFCILzVPy4t7gpYBYkZYkBR3FmblDk49rQtqjc+3RWgZP2PESfhPKYuSabBw/
 B0hXw+/teu1vbGfMkq/9KC8ilccnVzEvxDboYdIBbHp/DJQFCI0D5tDe+o/VISE54DyV
 St7L+ZfiWURBvKb49SaxC44tIWiHtqDmkV/TM32oplri8v6dnEdHN+6rXyhwe32Swezt
 x0OHZZDCsWZFgoiC74TFCi6OtAop9i/h8/+cUKSH3r+foqub7XosNX+XNvDEf+4uDkZz
 /4Vg==
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
Cc: Mark Rutland <mark.rutland@arm.com>, Koenig@google.com,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Chintan Pandya <cpandya@codeaurora.org>,
 Felix <Felix.Kuehling@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Kuehling@google.com, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>, Deucher@google.com,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBpcyBhIHBhcnQgb2YgYSBzZXJpZXMgdGhhdCBleHRlbmRzIGFybTY0IGtlcm5l
bCBBQkkgdG8gYWxsb3cgdG8KcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9w
IGJ5dGUgc2V0IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCnRoYW4gMHgwMCkgYXMgc3lzY2FsbCBh
cmd1bWVudHMuCgpJbiBjb3B5X21vdW50X29wdGlvbnMgYSB1c2VyIGFkZHJlc3MgaXMgYmVpbmcg
c3VidHJhY3RlZCBmcm9tIFRBU0tfU0laRS4KSWYgdGhlIGFkZHJlc3MgaXMgbG93ZXIgdGhhbiBU
QVNLX1NJWkUsIHRoZSBzaXplIGlzIGNhbGN1bGF0ZWQgdG8gbm90CmFsbG93IHRoZSBleGFjdF9j
b3B5X2Zyb21fdXNlcigpIGNhbGwgdG8gY3Jvc3MgVEFTS19TSVpFIGJvdW5kYXJ5LgpIb3dldmVy
IGlmIHRoZSBhZGRyZXNzIGlzIHRhZ2dlZCwgdGhlbiB0aGUgc2l6ZSB3aWxsIGJlIGNhbGN1bGF0
ZWQKaW5jb3JyZWN0bHkuCgpVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJhY3RpbmcuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Ci0t
LQogZnMvbmFtZXNwYWNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9mcy9uYW1lc3BhY2UuYyBiL2ZzL25hbWVzcGFj
ZS5jCmluZGV4IGM5Y2FiMzA3ZmE3Ny4uYzI3ZTU3MTNiZjA0IDEwMDY0NAotLS0gYS9mcy9uYW1l
c3BhY2UuYworKysgYi9mcy9uYW1lc3BhY2UuYwpAQCAtMjgyNSw3ICsyODI1LDcgQEAgdm9pZCAq
Y29weV9tb3VudF9vcHRpb25zKGNvbnN0IHZvaWQgX191c2VyICogZGF0YSkKIAkgKiB0aGUgcmVt
YWluZGVyIG9mIHRoZSBwYWdlLgogCSAqLwogCS8qIGNvcHlfZnJvbV91c2VyIGNhbm5vdCBjcm9z
cyBUQVNLX1NJWkUgISAqLwotCXNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZylkYXRh
OworCXNpemUgPSBUQVNLX1NJWkUgLSAodW5zaWduZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKGRhdGEp
OwogCWlmIChzaXplID4gUEFHRV9TSVpFKQogCQlzaXplID0gUEFHRV9TSVpFOwogCi0tIAoyLjIx
LjAuNTkzLmc1MTFlYzM0NWUxOC1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
