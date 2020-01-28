Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E814B4B0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 14:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27E6EE2D;
	Tue, 28 Jan 2020 13:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BAA6EE2D;
 Tue, 28 Jan 2020 13:08:14 +0000 (UTC)
Received: from mail-qv1-f46.google.com ([209.85.219.46]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MAfpQ-1ipnoj0Day-00B36j; Tue, 28 Jan 2020 14:08:13 +0100
Received: by mail-qv1-f46.google.com with SMTP id db9so2588039qvb.3;
 Tue, 28 Jan 2020 05:08:12 -0800 (PST)
X-Gm-Message-State: APjAAAUKue6NGNBD6f8i0kRjGz7+tmfVPixGVDqzPR+XfL0KK70If1/F
 97DCYeL8SpxM7/pxlRNs1LdrlFFCmcKSLR93V2E=
X-Google-Smtp-Source: APXvYqwbF70fulmMWpYsvgtwTwVOULgFhaykqGynP3TsqaWJatV/77WMv6RcxE8VKIM0b3GG4JzZReLAuPl6Qcio2Zw=
X-Received: by 2002:a0c:d788:: with SMTP id z8mr20752657qvi.211.1580216887804; 
 Tue, 28 Jan 2020 05:08:07 -0800 (PST)
MIME-Version: 1.0
References: <20200121114553.2667556-1-arnd@arndb.de>
 <20200121125546.GA71415@bogon.m.sigxcpu.org>
 <1971902c68ff805ee0b4a66f558afe06e6edf0c5.camel@pengutronix.de>
 <CAK8P3a2E__zHPPEL37JwK=uHb_v-=C+-+zGaL3XoW5PZ+BUN5g@mail.gmail.com>
 <20200122103034.GA67385@bogon.m.sigxcpu.org>
 <20200122103553.GN25745@shell.armlinux.org.uk>
 <20200124085616.GA5680@bogon.m.sigxcpu.org>
In-Reply-To: <20200124085616.GA5680@bogon.m.sigxcpu.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jan 2020 14:07:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36b6OVW1izkmwML_iWof1BWcPSuh=zV5D=9Jx5Q+MRFg@mail.gmail.com>
Message-ID: <CAK8P3a36b6OVW1izkmwML_iWof1BWcPSuh=zV5D=9Jx5Q+MRFg@mail.gmail.com>
Subject: Re: [PATCH] drm/etnaviv: only reject timeouts with tv_nsec >= 2
 seconds
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Provags-ID: V03:K1:VhaebLygsFOvl2D2rX2OmMWORGmc/EGysrq4nAiq0f+TxAsvCYf
 okWoY3bRxi5M7+WkuD+0FdDbP9D3EAhnpW9Zy0rLTJSpyEARvS4TIX/0WWHfRBjLt469i4v
 7cn34npyltN8IWFfgfhEsl+0Szr9ASJ42YwbaYRsWohlG8MJqt/RMyKCJS3iGCvyAR4PLb/
 PlCGRVKa/qC07cWGVbnuw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JFO++/3IoKY=:BzHJXJhmk5VFDf1iL8HX8L
 PhlWm4mOGsf5taaUXH3zYtQcyk+36/xU6+kIEViQnzCcNunewt1UhgjBCAcYFySc2gIAstnVP
 Or6o2/54cz5h2cfWPqXvp7EHvx1giNSxJGcHLffZt4hrzLzOr7mK/n/5Vgqj+Cg/97L+D9aW6
 x5kEicTlDviDhR8K/y2eODvHP6cG7Rl6/0WGccVWHhreePrPjYPRUPh24ohSn3TUQaI5Cg76r
 s1siEMGfbvPkJw5Z0Gr6VxpeiX0vsr5nDhDqt6tLNYZee1InFyyld0abUgGEiHh86P0exQszd
 cdaiWcG/fDWb0steGVloOU7dKH+LVipNhelRcNwBzAMIdvloPc6F5M9r7CXFl/YC8xohC3ebM
 GH11qY+QeHpNIXXpgcRmhjxhcaEP+ON1twgmvp9NVZ5XHBnA77U1ZpK87+KYUj0OjbZ7VEqlj
 uKS/3wH2v6x4prZZlve+4XlkGVtpNBYW7pjWVsrJ2DfMbMdhLfEmkvazXQQyZ/PG1IzeHN2XF
 ZzWCwzGkfliuTzv4+JujMDfj6sNmxNAQScLchZU3x3ympoqgt9sErDLC1eApiccTnp9BO2mJ6
 00xpxUTAXo5zS8BYR1iTrrXmB9Sz6BieW6M8blx8RH43kCDL548Mwrd/ApYXd3qeocNHIbF1Y
 uftznPeCs/y/lnSKHb7M0mTORQ0lifK1cnu30iTpEjnataNcjbhiU/QZ0PbKbdiz/TyiIJjtP
 OnSZfZQOa7dySTMCdES2EkTWaqZCtb3zT+5xfjhgW2nHRxPDnQGcOwLUVaWOc4MENiwhdBUdn
 Jao+3fjfM/MBV+0NVcZfrSWrswQEGL8yps08aHtdDYpdhFLSdc=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMjQsIDIwMjAgYXQgOTo1NiBBTSBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hj
cHUub3JnPiB3cm90ZToKPiBPbiBXZWQsIEphbiAyMiwgMjAyMCBhdCAxMDozNTo1M0FNICswMDAw
LCBSdXNzZWxsIEtpbmcgLSBBUk0gTGludXggYWRtaW4gd3JvdGU6Cj4gPiBPbiBXZWQsIEphbiAy
MiwgMjAyMCBhdCAxMTozMDozNEFNICswMTAwLCBHdWlkbyBHw7xudGhlciB3cm90ZToKCj4gPiBJ
IHRoaW5rIGl0IHdvdWxkIHByb2JhYmx5IGJlIGJldHRlciBmb3IgdGhlIGtlcm5lbCB0byBwcmlu
dCBhCj4gPiB3YXJuaW5nIG9uY2Ugd2hlbiBub3RpY2luZyBvdmVyLWxhcmdlIG5zZWMgdmFsdWVz
LCBzdWdnZXN0aW5nIGEKPiA+IHVzZXJzcGFjZSB1cGdyYWRlIGlzIGluIG9yZGVyLCBidXQgY29u
dGludWUgdGhlIGV4aXN0aW5nIGJlaGF2aW91ci4KPgo+IFRoYXQgbWFrZXMgc2Vuc2UgdG8gbWUu
IFRoaXMgYWxzbyBtYWtlcyBzdXJlIHdlIGRvbid0IGJyZWFrIG90aGVyIChub24KPiBtZXNhIHVz
aW5nKSBzdHVmZiBhY2NpZGVudGFsbHkuIFdlIGhhdmUKPgo+ICAgaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL21lc2EvbWVzYS9jb21taXQvZDgxN2YyYzY5NjE1Y2YzN2I3OGY0ODRhMjVi
NzgzMWViZTlkYmU2Zgo+Cj4gYW5kCj4KPiAgIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9tZXNhL21lc2EvbWVyZ2VfcmVxdWVzdHMvMzUzNAo+Cj4gdG8gbm9ybWFsaXplIG5zZWMgdG8g
WzAuLjk5OTk5OTk5OV0gbm93Lgo+CgpJIGhhdmUgcmV2ZXJ0ZWQgbXkgcGF0Y2ggdGhhdCBhZGRz
IHRoZSByYW5nZSBjaGVjayBub3csIHNvIEkgY2FuIHNlbmQgdGhlIHJlc3QKb2YgdGhlIHNlcmll
cyBmb3IgaW5jbHVzaW9uLgoKSSd2ZSBwbGF5ZWQgYXJvdW5kIHdpdGggd2F5cyB0byBhZGQgYSBy
YXRlbGltaXRlZCB3YXJuaW5nIG1lc3NhZ2UgYW5kIHRvCm1ha2Ugc3VyZSB0aGF0IGEgbWFsaWNp
b3VzIGFwcGxpY2F0aW9uIGNhbm5vdCBjYXVzZSBhIGxvbmcgc3RhbGwsIGJ1dCBoYXZlbid0Cm1h
bmFnZWQgdG8gZ2V0IGEgdmVyc2lvbiBJJ20gYWN0dWFsbHkgaGFwcHkgd2l0aC4KCkknbGwgZm9s
bG93IHVwIG9uY2UgdGhlIHNlcmllcyBpcyBtZXJnZWQsIGFuZCB0aGVuIHdlIGNhbiBhZGQgYSBi
ZXR0ZXIKd29ya2Fyb3VuZApsYXRlciB0aHJvdWdoIHRoZSBkcm0gdHJlZS4KCiAgICAgIEFybmQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
