Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA220EE996
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 21:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C31D6E85F;
	Mon,  4 Nov 2019 20:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FC66E85F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 20:33:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 29so900077pgm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 12:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=DnK/FIUjtfMpvgjhYJHwDVVqbAfzXMvLjaoAfA8yVt8=;
 b=m0XXVGZHhGLzbxNODo17MtBoQq9+jxZvN+9L/oU7F5Ky8B3Zupdt4kXhc1uS7zbe9V
 xv8MKFtLy+O+ptcpSfFIzy+sJq936MuYBLdbIb41TT3X74AwUlooR9AMFQGSXJfyu3De
 pBMnU/TatTHmm6XpNmhtAZ/DM/ejb6m5Qxn2zEbyEADaq58bOCF8CzEgZqRf/aqZ3Wzc
 4okkHq+nQZ+xfRssCk8hvats+hPPa0b7ulMofofdT3xxBeHvYInExPI4h0aEEkeSVLYG
 2sH329WAYZ6HykIuBz40jgmhpeJDhSVWFDgvkCdzEQuMaytBlP67F7Je83+cFpQOJP3v
 D+lw==
X-Gm-Message-State: APjAAAU4quXWt8qmkLoOvqeD9NYgjT6GMdNIyw9baDqvNAtGzgjqiudo
 PmMmxW1FyWV/o+Q6VYmZx8PZZA==
X-Google-Smtp-Source: APXvYqyhviRnVEE8HSNsRv5kFXmlmiRaKK/VWcjGWZKAhJfF3CiA7Y5Kptgh8pnqs8cZ8TjFJYIjHQ==
X-Received: by 2002:a17:90a:9406:: with SMTP id r6mr1471858pjo.0.1572899590774; 
 Mon, 04 Nov 2019 12:33:10 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id e17sm18228455pfh.121.2019.11.04.12.33.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 12:33:10 -0800 (PST)
Date: Mon, 4 Nov 2019 12:33:09 -0800 (PST)
From: David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
In-Reply-To: <20191103211813.213227-6-jhubbard@nvidia.com>
Message-ID: <alpine.DEB.2.21.1911041231520.74801@chino.kir.corp.google.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=DnK/FIUjtfMpvgjhYJHwDVVqbAfzXMvLjaoAfA8yVt8=;
 b=OY0XB+pnC7EUpHSQ8yqmSdGzuM19l1QV2njz4lt2384NL+vVsTzKuslwpXHwsk0N+I
 dZMVtGQNTBtLEVBnR8gAD9XNgACmQrzJC68sh448rTQlDayrJqeB0M445s6/jf3cT6Pb
 NZZ+pL+6f4BBHH/B3nMcaAYKUkl2AQQnq6f98/RCiuh6DgUl+/f96fWCFaFlkmskNChx
 MZ/7akyfS7PP1xF/9bTh/55R2+Y5DT5rWJm7Cv0RUqBYhuwjKxViCvgW0uYk/xg33Sc/
 xfRMVnNsQczWqMvmGtgK05lodct1STvVjmeasrhxMRgmb3Ko1i8IBBDPrpRAfsUyE3+k
 eHpg==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?Q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiBTdW4sIDMgTm92IDIwMTksIEpvaG4gSHViYmFyZCB3cm90ZToKCj4gSW50cm9kdWNlIHBp
bl91c2VyX3BhZ2VzKigpIHZhcmlhdGlvbnMgb2YgZ2V0X3VzZXJfcGFnZXMqKCkgY2FsbHMsCj4g
YW5kIGFsc28gcGluX2xvbmd0ZXJtX3BhZ2VzKigpIHZhcmlhdGlvbnMuCj4gCj4gVGhlc2UgdmFy
aWFudHMgYWxsIHNldCBGT0xMX1BJTiwgd2hpY2ggaXMgYWxzbyBpbnRyb2R1Y2VkLCBhbmQKPiB0
aG9yb3VnaGx5IGRvY3VtZW50ZWQuCj4gCj4gVGhlIHBpbl9sb25ndGVybSooKSB2YXJpYW50cyBh
bHNvIHNldCBGT0xMX0xPTkdURVJNLCBpbiBhZGRpdGlvbgo+IHRvIEZPTExfUElOOgo+IAo+ICAg
ICBwaW5fdXNlcl9wYWdlcygpCj4gICAgIHBpbl91c2VyX3BhZ2VzX3JlbW90ZSgpCj4gICAgIHBp
bl91c2VyX3BhZ2VzX2Zhc3QoKQo+IAo+ICAgICBwaW5fbG9uZ3Rlcm1fcGFnZXMoKQo+ICAgICBw
aW5fbG9uZ3Rlcm1fcGFnZXNfcmVtb3RlKCkKPiAgICAgcGluX2xvbmd0ZXJtX3BhZ2VzX2Zhc3Qo
KQo+IAo+IEFsbCBwYWdlcyB0aGF0IGFyZSBwaW5uZWQgdmlhIHRoZSBhYm92ZSBjYWxscywgbXVz
dCBiZSB1bnBpbm5lZCB2aWEKPiBwdXRfdXNlcl9wYWdlKCkuCj4gCgpIaSBKb2huLAoKSSdtIGN1
cmlvdXMgd2hhdCBjb25zaWRlcmF0aW9uIGlzIGdpdmVuIHRvIHdoYXQgcGFnZWJsb2NrIG1pZ3Jh
dGUgdHlwZXMgCnRoYXQgRk9MTF9QSU4gYW5kIEZPTExfTE9OR1RFUk0gcGFnZXMgb3JpZ2luYXRl
IGZyb20sIGFzc3VtaW5nIHRoYXQgCmxvbmd0ZXJtIHdvdWxkIHdhbnQgdG8gb3JpZ2luYXRlIGZy
b20gTUlHUkFURV9VTk1PVkFCTEUgcGFnZWJsb2NrcyBmb3IgdGhlIApwdXJwb3NlcyBvZiBhbnRp
LWZyYWdtZW50YXRpb24/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
