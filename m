Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136434561E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E66B89996;
	Fri, 14 Jun 2019 07:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164D892F2;
 Fri, 14 Jun 2019 02:50:02 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id n2so631766pgp.11;
 Thu, 13 Jun 2019 19:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Gt/SvG7yRtKmiEMzK1FJXFm1wfYI/ZfBKJY7bniNfw0=;
 b=l7kM50uPYZZONz+uwEDIC63sLpCrpEtnoP/xN1kqHNkqAkgcDk0fiR3bwxdM0KtynU
 HYKMS5+/nng13KKLYXG/G6utK040fqzochb60hGDfuaB2bP4KQCBMgP+Yn1gd8JHrRxh
 KH+1EXT9MTc3nbdLOsyoR2dWlEVqvCH/Zc5S3VbPRNmACz75iKQidQnXD2nfyx9BFXLK
 QgAnd3+/M+uo3KborXPNobzGvI3Ne6C4L1/RVryqeP4pj9Tb7NmBJ1nS6RhSNUtpShYP
 IlW0xEntHZnmzCf4H64Cp3lv95Cb6PByUbapdruBk54Pj8cEVFles6fwY/0FJgNgQ7oE
 iXcA==
X-Gm-Message-State: APjAAAW1Wk5qYvRdv73O6wPWlTfbiOUkw4XP80J1aKs0QJ5657W/tku7
 vZmEYu8csqNTaNdY9o62qJU=
X-Google-Smtp-Source: APXvYqwUelCjdI/iBziKOHq8go5RgcYaj2UuHVhGitmfIpf2x4+NIcK1Gd/L6mXFGf10Am2WanFStA==
X-Received: by 2002:a63:ec42:: with SMTP id r2mr34433065pgj.262.1560480602071; 
 Thu, 13 Jun 2019 19:50:02 -0700 (PDT)
Received: from localhost ([175.223.34.99])
 by smtp.gmail.com with ESMTPSA id a22sm1027270pfn.173.2019.06.13.19.50.00
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 19:50:01 -0700 (PDT)
Date: Fri, 14 Jun 2019 11:49:57 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: nouveau: DRM: GPU lockup - switching to software fbcon
Message-ID: <20190614024957.GA9645@jagdpanzerIV>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=Gt/SvG7yRtKmiEMzK1FJXFm1wfYI/ZfBKJY7bniNfw0=;
 b=t69ygudK4onHNkRftxENnMyaFh8fdIivsMy6XkYJOsbAxe53KcP8W2UWVupaCBHCqJ
 QWBO8UUP6jES+xjT2YwaT/YuqZKI92fYIfkmq425dclZ3WogxMlUeEvZviEmVBSU/w0n
 XFyvkrSI/QSLaDq+ZYD//QUBdFTf0J0uuk/fFfbRsDtDwo1D/YtHrepuNWAt6JxdgH9H
 /sroemESdRdVmnX2ImmUMmjBkYo9nbJ26Sfdes4gbBX+BGwbq0+TsCAA6RHlabYz6Ymh
 sbzzpOqyPTNXNhBu4aBps0QVvR6p2sn3sdrxaLIUpOMkR6r9dabYNjAgPmpRdEE+u1X7
 4CHg==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NS4yLjAtcmM0LW5leHQtMjAxOTA2MTMKCmRtZXNnCgogbm91dmVhdSAwMDAwOjAxOjAwLjA6IERS
TTogR1BVIGxvY2t1cCAtIHN3aXRjaGluZyB0byBzb2Z0d2FyZSBmYmNvbgogbm91dmVhdSAwMDAw
OjAxOjAwLjA6IGZpZm86IFNDSEVEX0VSUk9SIDBhIFtDVFhTV19USU1FT1VUXQogbm91dmVhdSAw
MDAwOjAxOjAwLjA6IGZpZm86IHJ1bmxpc3QgMDogc2NoZWR1bGVkIGZvciByZWNvdmVyeQogbm91
dmVhdSAwMDAwOjAxOjAwLjA6IGZpZm86IGNoYW5uZWwgNToga2lsbGVkCiBub3V2ZWF1IDAwMDA6
MDE6MDAuMDogZmlmbzogZW5naW5lIDY6IHNjaGVkdWxlZCBmb3IgcmVjb3ZlcnkKIG5vdXZlYXUg
MDAwMDowMTowMC4wOiBmaWZvOiBlbmdpbmUgMDogc2NoZWR1bGVkIGZvciByZWNvdmVyeQogbm91
dmVhdSAwMDAwOjAxOjAwLjA6IGZpcmVmb3hbNDc2XTogY2hhbm5lbCA1IGtpbGxlZCEKIG5vdXZl
YXUgMDAwMDowMTowMC4wOiBmaXJlZm94WzQ3Nl06IGZhaWxlZCB0byBpZGxlIGNoYW5uZWwgNSBb
ZmlyZWZveFs0NzZdXQoKSXQgbG9ja3VwcyBzZXZlcmFsIHRpbWVzIGEgZGF5LiBUd2ljZSBpbiBq
dXN0IG9uZSBob3VyIHRvZGF5LgpDYW4gd2UgZml4IHRoaXM/CgoJLXNzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
