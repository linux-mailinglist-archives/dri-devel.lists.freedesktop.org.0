Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE918D694
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 16:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D812A89DE1;
	Wed, 14 Aug 2019 14:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA13489DE1;
 Wed, 14 Aug 2019 14:50:37 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 207so4852381wma.1;
 Wed, 14 Aug 2019 07:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=/DXlUZnAnppcVmvRaCvG45NAF6K209fxQvIeSZzOmy4=;
 b=It6A9P95gKxOebkJqP7BHoS8ZZYb9j4v64tOf6sxyrWlyHZS+RCqqfJYCsWjqJsDQg
 gbe6EEREvP8LGo56BWqbkOEEQSnApwCDlV4IYFMHWqDPf4bMYV3xjLt8F9kpOO6zXJjD
 k1KftbxuQHsmC8l/bCLSEpriz/TDSHpqBcEh3jIBoI1hdwk5xO7NuIy7hPyT5fjktiN2
 o3cLrqsYmcpVyyR6P21R432ichaJPKKBz/KpvbYcKXzFB94Nc7sLLGnf4yRa9RhP0oRg
 TIZPnbLy0jdNelDry/NjBJpQf2mYpOP8t4V/amN/fuvm3vJcrrVkhSLFEubnfWIw2eo4
 tSEg==
X-Gm-Message-State: APjAAAWiz4/Ggu3QXxzJzIcParkBfDiT9My0Lev8lrtP3s8am6fNowgr
 0kX+7wUCDDGDmAs9eQ6Ej4Y=
X-Google-Smtp-Source: APXvYqzoe9W3VA/sAzPxBxLK/CY1XdtfCqCC8uiIxtC44+YlxqrDtNJOaniUqy9vvtFN3+P4u+PPwA==
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr9053044wmi.48.1565794236524; 
 Wed, 14 Aug 2019 07:50:36 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id t198sm7911434wmt.39.2019.08.14.07.50.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 07:50:35 -0700 (PDT)
Date: Wed, 14 Aug 2019 16:50:33 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com
Subject: DMA-API: cacheline tracking ENOMEM, dma-debug disabled due to
 nouveau ?
Message-ID: <20190814145033.GA11190@Red>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=/DXlUZnAnppcVmvRaCvG45NAF6K209fxQvIeSZzOmy4=;
 b=pcnVgWDPpVIKvEGcoQm5OxaoBVqYZbMOQiqkZ3wTAZr8Y6ocDyeakMLA8Im1Y+g99D
 POTgttsWlFnHPGAOzmL9x63nQingz9nYI4tmdXIrqRiCxn+kPG3T16a2nvIYG8GQ2Vzs
 Wce7Jnayh7CiIlLHBB2wEP03uzF21zbs288aBwspAfbTH7jE/zAGLwIiABldEZ0t2MFl
 7g+sqkueLUfkGGO7etvOXVSscsbkaSLTKp6TuYRkN4eneuKFf/g2q7u1xTmiXRL4QSi9
 08axMg8aBPXjCpcOkD6x6gdVVXu3E7WHEH7t0kz1SSsDjvHpa4CY59KwF9g2UEt0zSR3
 HS0g==
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
Cc: nouveau@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGVsbG8KClNpbmNlIGxvdCBvZiByZWxlYXNlIChhdCBsZWFzdCBzaW5jZSA0LjE5KSwgSSBoaXQg
dGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdlOgpETUEtQVBJOiBjYWNoZWxpbmUgdHJhY2tpbmcg
RU5PTUVNLCBkbWEtZGVidWcgZGlzYWJsZWQKCkFmdGVyIGhpdHRpbmcgdGhhdCwgSSB0cnkgdG8g
Y2hlY2sgd2hvIGlzIGNyZWF0aW5nIHNvIG1hbnkgRE1BIG1hcHBpbmcgYW5kIHNlZToKY2F0IC9z
eXMva2VybmVsL2RlYnVnL2RtYS1hcGkvZHVtcCB8IGN1dCAtZCcgJyAtZjIgfCBzb3J0IHwgdW5p
cSAtYwogICAgICA2IGFoY2kKICAgIDI1NyBlMTAwMGUKICAgICAgNiBlaGNpLXBjaQogICA1ODkx
IG5vdXZlYXUKICAgICAyNCB1aGNpX2hjZAoKRG9lcyBub3V2ZWF1IGhhdmluZyB0aGlzIGhpZ2gg
bnVtYmVyIG9mIERNQSBtYXBwaW5nIGlzIG5vcm1hbCA/CgpSZWdhcmRzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
