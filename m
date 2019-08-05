Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE28211F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FC06E4EC;
	Mon,  5 Aug 2019 16:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9406E4E1;
 Mon,  5 Aug 2019 16:03:38 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id u17so39975707pgi.6;
 Mon, 05 Aug 2019 09:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/atQO8upnSIxjZFWbzwjewwcU7Pl/S5HrTw3sMMSaWk=;
 b=GCcVlBv68ZSwKpiKSZD5tY7rYyd7ULBD+Zbyy9fmcFBA4cR67qBQLga5E+I07o99U/
 vmqjka1Y6RFXRWVne6R4RbnRDb/kDIR4N9f1Eiw8sxgh0pxlYp0ZNzetLbjneyiwlLTC
 KzoB27cyi5RvfYnxlPhNj/cEEB328kyvn+BqR2OVaqORqfQEGA1QC5/MAr7IdLsAAgSG
 bYBXyC4A+v9jHguh5YqzHL2SIyNLkAvygiRYV7pvFncQzloQTmcJMKYpBWqKggFkOoEM
 Agquv644cEw2EBSz7Lp7ze603fIBctsULWNm4e+jBPDwNCqKlcWu7sb4nW2ewP69J5+B
 xqfQ==
X-Gm-Message-State: APjAAAXZboW0fwKGugMSMaz5Gyx8gk/B0SnP5qR/eLcFI7HW0HTWuCqp
 ZzVQWWd6W/OGopo3jiHy8ko=
X-Google-Smtp-Source: APXvYqwUMiDt9hI1FWfkjg6AfQy18Y9cjnzyUO0I8M+djjPTHDl4u6c97cQ4l/WmELIE44LZd4B54w==
X-Received: by 2002:aa7:8817:: with SMTP id c23mr74674861pfo.146.1565021018143; 
 Mon, 05 Aug 2019 09:03:38 -0700 (PDT)
Received: from localhost.localdomain ([121.137.63.184])
 by smtp.gmail.com with ESMTPSA id n98sm17061262pjc.26.2019.08.05.09.03.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 09:03:37 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCHv2 3/3] i915: do not leak module ref counter
Date: Tue,  6 Aug 2019 01:03:07 +0900
Message-Id: <20190805160307.5418-4-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
References: <20190805160307.5418-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/atQO8upnSIxjZFWbzwjewwcU7Pl/S5HrTw3sMMSaWk=;
 b=br2qjvk4qVQV+0wLGSAL40ExMnkokkHbHdnkt7eeD89dKuOBSjW/HmWeXIgFxr+xJH
 GNZnp38Fnbq0wQa+IUgeC2QFTAExUJYAxt8OYs3y+16fv5Yop8b+27sI5k6dm78JQcAM
 yfip/ukg1EiNusqYh7t4qtFqTMh0Sw93A249CIZ0vq2ox1TzeX+Vy2i43JlxI9905zMF
 AmYFMhhVfJTvYudH5rsHdBJ9WICusBYw8Kb3ggFef0VaSpHgryF0HImG/6GuPKU7YrtA
 M/ozz7qA9fJBBmx1ZpJBpslL8Lit3syIctcM+7FQSZeKZYuWOzJ30jJhQmz2DBMgmbrI
 yLxg==
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cHV0X2ZpbGVzeXN0ZW0oKSBtdXN0IGZvbGxvdyBnZXRfZnNfdHlwZSgpLgoKU2lnbmVkLW9mZi1i
eTogU2VyZ2V5IFNlbm96aGF0c2t5IDxzZXJnZXkuc2Vub3poYXRza3lAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dl
bS9pOTE1X2dlbWZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jCmlu
ZGV4IGZlZWRjOTI0MjA3Mi4uOTNhYzM2NWNlOWNlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1mcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9p
OTE1X2dlbWZzLmMKQEAgLTI0LDYgKzI0LDcgQEAgaW50IGk5MTVfZ2VtZnNfaW5pdChzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKIAlnZW1mcyA9IGtl
cm5fbW91bnQodHlwZSk7CisJcHV0X2ZpbGVzeXN0ZW0odHlwZSk7CiAJaWYgKElTX0VSUihnZW1m
cykpCiAJCXJldHVybiBQVFJfRVJSKGdlbWZzKTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
