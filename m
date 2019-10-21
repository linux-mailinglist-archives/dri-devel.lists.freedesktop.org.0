Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E46DFE40
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 09:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033566E3FC;
	Tue, 22 Oct 2019 07:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCF089A32
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 23:25:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9B8D5B210;
 Mon, 21 Oct 2019 23:25:44 +0000 (UTC)
Date: Mon, 21 Oct 2019 16:24:23 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 11/11] x86/mm, pat: convert pat tree to generic interval
 tree
Message-ID: <20191021232423.s24x5go2ozjbvtvy@linux-p48b>
Mail-Followup-To: Ingo Molnar <mingo@kernel.org>, akpm@linux-foundation.org,
 walken@google.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Davidlohr Bueso <dbueso@suse.de>
References: <20191003201858.11666-1-dave@stgolabs.net>
 <20191003201858.11666-12-dave@stgolabs.net>
 <20191007153339.GA95072@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007153339.GA95072@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Tue, 22 Oct 2019 07:27:15 +0000
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
Cc: Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, akpm@linux-foundation.org, walken@google.com,
 Thomas Gleixner <tglx@linutronix.de>, linux-rdma@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwNyBPY3QgMjAxOSwgSW5nbyBNb2xuYXIgd3JvdGU6Cj5JIHN1cHBvc2UgdGhpcyB3
aWxsIGJlIGNhcnJpZWQgaW4gLW1tPwoKSSd2ZSBqdXN0IHNlbnQgb3V0IGEgbmV3IHBhdGNoc2V0
IGZvciAtdGlwIHRoYXQgb25seSBtb2RpZmllZCB0aGUgcGF0CnRyZWUuIEl0IHNlZW1zIHRoYXQg
dGhpcyBzZXJpZXMgd2lsbCBhdCBsZWFzdCB0YWtlIHNvbWUgbW9yZSB0aW1lIGR1ZSB0bwp0aGUg
bW11X25vdGlmaWVyIHJld29yayBiZWluZyBkb25lIC0gYW5kIHRoZXJlIHdhcyBzb21lIHdvcnJp
ZXMgYWJvdXQKdGhlIGNvcm5lciBjYXNlIGRldGFpbHMuIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2Ug
dG8ganVzdCBwb3J0IHRoZSBwYXQKdHJlZSB0byB0aGUgY3VycmVudCBpbnRlcnZhbCB0cmVlIG1h
Y2hpbmVhcnkgYW5kIGp1c3QgYmUgZG9uZSB3aXRoIGFsbCB0aGlzLgpBbnkgZnV0dXJlIHZlcnNp
b25zIG9mIHRoaXMgc2VyaWVzIHdvdWxkIHJlcXVpcmUgYSB0cml2aWFsIHR3byBsaW5lciBmb3Ig
cGF0LgoKVGhhbmtzLApEYXZpZGxvaHIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
