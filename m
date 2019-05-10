Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A151A90A
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 20:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4921894A7;
	Sat, 11 May 2019 18:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E5689A91;
 Fri, 10 May 2019 09:51:46 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id n8so2591708plp.10;
 Fri, 10 May 2019 02:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WijcaE3HINJiVGwwC+CuKRETdmWZ9/FSRZJjUi9mXvc=;
 b=Xsma67FsGxV57GHrF4HYZK70DUEdYJ3f7KsXV5npzS+OCXoBMuGnLo+BtiUP644zMy
 f4sqBuuqjXbKn9ResP0Q1mLyUESCo6pVeHhx/EGyqVftF0HUsrxF9KR5ppPCwSSsr9gL
 GVWFQ9Liq/kXzQYPq0iykudjN7VrtT5tEjRiwVRU7lM83Zk52bFkezjA1oQvqgOoUucd
 Yl2naoG+ZQdx+/rYpg2jkl+Tynz1poriNYGRJH6vN8YZuCDdsjwW3PlV9VOoZwRK34pb
 5bEUXdN0hC2qIcr7vjH2pNt+HrR3XeryJpNsCbqK0sjANB1mlgyrr6DyUe81LxGCuKo7
 gUKQ==
X-Gm-Message-State: APjAAAUZ1ptIgorES2FE38d3oej1uUDwwcpEvM3eFybKTruXA4DC+EmP
 bD9y6R/UQXH0Ved9tM2VAQipTj/X
X-Google-Smtp-Source: APXvYqwVWxL8kHDRGOAqch3VmtI11JCYWCJUvbPGv/TKxmR4JMfuugbUzDmjDo0v0wtIrw042BKPog==
X-Received: by 2002:a17:902:2cc1:: with SMTP id
 n59mr12098147plb.22.1557481905657; 
 Fri, 10 May 2019 02:51:45 -0700 (PDT)
Received: from localhost ([39.7.15.25])
 by smtp.gmail.com with ESMTPSA id s6sm6368853pfb.128.2019.05.10.02.51.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 02:51:44 -0700 (PDT)
Date: Fri, 10 May 2019 18:51:41 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] RFC: console: hack up console_lock more v3
Message-ID: <20190510095141.GA32171@jagdpanzerIV>
References: <20190509120903.28939-1-daniel.vetter@ffwll.ch>
 <20190509145620.2pjqko7copbxuzth@pathway.suse.cz>
 <CAKMK7uFTsr1F8nFExTvC7nWFQMcZ7ejh+k_X6E8EcMUaP3e29A@mail.gmail.com>
 <20190510091537.44e3aeb7gcrcob76@pathway.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510091537.44e3aeb7gcrcob76@pathway.suse.cz>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Sat, 11 May 2019 18:22:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WijcaE3HINJiVGwwC+CuKRETdmWZ9/FSRZJjUi9mXvc=;
 b=RbrZi8/drM2Z3J/7bvD3it5wOe9OYIlwzWVRzah1vdnnjxnw1pWiT/EL8ywiDx3/3T
 hD1SX5GOJw5pmnlOEg4AsFB1RD6woBtAxX3cum9CFIgoVoKKP5prptRtsK9i/JMy8usn
 fK60N3wYQVvUGMog9NsnQCcdq4IpAix4ac+Ub0p0aKJk+llvHfg1JRivPbfsbFP3mHc6
 2oNzJaNR8blxqsAmqjodFCeUw/lyYhYidkRDek7P7OO1vjxp/OHIsHDz5zYhJCZMCARl
 QY/29FW2x9TeGDjMsokEi7yX7N6TbnrD5isB1wqHa30PlHXxddA10WZFfcb2M72MPpKv
 W6sA==
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
Cc: John Ogness <john.ogness@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Will Deacon <will.deacon@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gKDA1LzEwLzE5IDExOjE1KSwgUGV0ciBNbGFkZWsgd3JvdGU6ClsuLl0KPiAgYXJjaC94ODYv
a2VybmVsL3NtcC5jIHwgICAgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9zbXAuYwo+ICsrKyBi
L2FyY2gveDg2L2tlcm5lbC9zbXAuYwo+IEBAIC0xMjQsNyArMTI0LDggQEAgc3RhdGljIGJvb2wg
c21wX25vX25taV9pcGkgPSBmYWxzZTsKPiAgICovCj4gIHN0YXRpYyB2b2lkIG5hdGl2ZV9zbXBf
c2VuZF9yZXNjaGVkdWxlKGludCBjcHUpCj4gIHsKPiAtCWlmICh1bmxpa2VseShjcHVfaXNfb2Zm
bGluZShjcHUpKSkgewo+ICsJaWYgKHVubGlrZWx5KGNwdV9pc19vZmZsaW5lKGNwdSkgJiYKPiAr
CQkgICAgIGF0b21pY19yZWFkKCZzdG9wcGluZ19jcHUpIDwgMCkpIHsKPiAgCQlXQVJOKDEsICJz
Y2hlZDogVW5leHBlY3RlZCByZXNjaGVkdWxlIG9mIG9mZmxpbmUgQ1BVIyVkIVxuIiwgY3B1KTsK
PiAgCQlyZXR1cm47Cj4gIAl9CgpJIHRoaW5rIHdlIG5lZWQgdG8gcmVtb3ZlIENQVSB3aGljaCB3
ZSBJUElfU1RPUCBmcm9tCmlkbGVfY3B1c19tYXNrLiBTbyB0aGVuIHNjaGVkdWxlciB3b24ndCBw
aWNrIHVwIHN0b3BwZWQKQ1BVcyAoY3B1bWFza19maXJzdChub2h6LmlkbGVfY3B1c19tYXNrKSkg
YW5kIGF0dGVtcHQKcmVzY2hlZHVsaW5nIHRvIHRoZW0uIEl0IHNlZW1zIHRoYXQgY3VycmVudGx5
Cm5hdGl2ZV9zdG9wX290aGVyX2NwdXMoKSBkb2Vzbid0IGRvIHRoYXQuCgoJLXNzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
