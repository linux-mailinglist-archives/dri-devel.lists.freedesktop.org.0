Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B643DF78B6
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 17:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDF26E948;
	Mon, 11 Nov 2019 16:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175FD6E948
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 16:25:58 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MORR2-1iGX0h2h7G-00PwVX; Mon, 11 Nov 2019 17:25:53 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/2] drm/etnaviv: reject timeouts with tv_nsec >= NSEC_PER_SEC
Date: Mon, 11 Nov 2019 17:25:31 +0100
Message-Id: <20191111162547.2221524-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y9yDrcxX3JXaAKVSf2Wk0UqIhlycN6gZyle2jPk/xT9EE6YMi9D
 7ymITaQ7apv6xrtn0JzSfzsgJB9I6691k3NAhZROfyW9sb573cpSp1BArGRozUJ7yf1BahM
 n/iqnEfl6KDsP8LVgANAzfDxR4X/WyOKAK5s0v5Ld/9s1SATJqUXjo4weaeUxCyiqTwRkbu
 GAzwQeVhb9Mm+uAWzRSiQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nZsPNPkFQvQ=:Ucf0PZ6GcWhH6i5ePGy4rK
 8g6OuBjV2jgWkBM7tp1FTviB697Tz1JahKavUoJ1LkN7LeLCVIliSERKLYYSPTKAKImQEOHdV
 f/nUOReIF66bT/01JiNoct1Vgoo9wpMGPa7w3rY/XWrZMWNHnC3ogWso4VjoWd+wiwbBEj+uG
 L2LpC6MAjqWBLjIC6oVSHeneOV3hV4AsKXIvgaEEqxJgH1hUN67mhEA1CuXbj4mue/hN2Yk3Z
 f4ISXe/g+lkzvLNMLZ2Fr7vneEV7iFUbAs5cHnOaETE/91j8DSovRJiJNq3y4+phBlhD2zsB9
 qpt827ytyRhQdXvVRUvqJu2oVbsxGrGf3HrAkwatzS2GL2vA6waSgY4ZIAlarzHZXTlJaT+WL
 v6UgYgYvpZzRwn9POXsQu/ShPUYR7pVILKJOP/ah+T6Pm8NW4U2baQ0iw4Ih5bRZvVPprVdWa
 JyI6Z+9FAEm0qFPVJw2KkmAnqNFpQGrzuNFYfumQ94RtIgaAFBjSqeX3x+3Y9ErWQOznrAW1Q
 tM1qzWWXa/kF+jiFIyNNLn4sJIkKVY9pkq3wGTxNm6j/FVHtjZahv2vKHp6w+mTELXMKMoKoE
 HWDF3iPGT3Rcz0RSSaOH3gojpNGyEjKO8c1MWqD1Oct4Ijc+tvi8b6mUIkQ3Hlf17srkmJy3l
 fL3N/RoAyeTJt3b8wUsINPyFKTsc2thXdCu0B8f6EFtPqIg+VBuBzO5grhkE0AzVDLl05HQoM
 qc5AVkSQWenBH8ADII9vIySDu4WSLDPgS3A6yn+Rs4HObFPfe1q7UTTczol84GDWAgqbqlO6r
 hQfG1l3QcpoGzgnGskRgT5OdGVT4HLfgtB1T99Vni+iw8sVmXOkHYd9jcpK+OWWnU71i8abqe
 i5KubW7ExhZfj9AUaAWQ==
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
Cc: Arnd Bergmann <arnd@arndb.de>, y2038@lists.linaro.org,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TW9zdCBrZXJuZWwgaW50ZXJmYWNlcyB0aGF0IHRha2UgYSB0aW1lc3BlYyByZXF1aXJlIG5vcm1h
bGl6ZWQKcmVwcmVzZW50YXRpb24gd2l0aCB0dl9uc2VjIGJldHdlZW4gMCBhbmQgTlNFQ19QRVJf
U0VDLgoKUGFzc2luZyB2YWx1ZXMgbGFyZ2VyIHRoYW4gMHgxMDAwMDAwMDB1bGwgZnVydGhlciBi
ZWhhdmVzIGRpZmZlcmVudGx5Cm9uIDMyLWJpdCBhbmQgNjQtYml0IGtlcm5lbHMsIGFuZCBjYW4g
Y2F1c2UgdGhlIGxhdHRlciB0byBzcGVuZCBhIGxvbmcKdGltZSBjb3VudGluZyBzZWNvbmRzIGlu
IHRpbWVzcGVjNjRfc3ViKCkvc2V0X25vcm1hbGl6ZWRfdGltZXNwZWM2NCgpLgoKUmVqZWN0IHRo
b3NlIGxhcmdlIHZhbHVlcyBhdCB0aGUgdXNlciBpbnRlcmZhY2UgdG8gZW5mb3JjZSBzYW5lIGFu
ZApwb3J0YWJsZSBiZWhhdmlvci4KClNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRA
YXJuZGIuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyB8IDkg
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9l
dG5hdml2L2V0bmF2aXZfZHJ2LmMKaW5kZXggMWY5YzAxYmU0MGQ3Li45NWQ3MmRjMDAyODAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYwpAQCAtMjk3LDYgKzI5Nyw5IEBAIHN0
YXRpYyBpbnQgZXRuYXZpdl9pb2N0bF9nZW1fY3B1X3ByZXAoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgdm9pZCAqZGF0YSwKIAlpZiAoYXJncy0+b3AgJiB+KEVUTkFfUFJFUF9SRUFEIHwgRVROQV9Q
UkVQX1dSSVRFIHwgRVROQV9QUkVQX05PU1lOQykpCiAJCXJldHVybiAtRUlOVkFMOwogCisJaWYg
KGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykKKwkJcmV0dXJuIC1FSU5WQUw7
CisKIAlvYmogPSBkcm1fZ2VtX29iamVjdF9sb29rdXAoZmlsZSwgYXJncy0+aGFuZGxlKTsKIAlp
ZiAoIW9iaikKIAkJcmV0dXJuIC1FTk9FTlQ7CkBAIC0zNjAsNiArMzYzLDkgQEAgc3RhdGljIGlu
dCBldG5hdml2X2lvY3RsX3dhaXRfZmVuY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwKIAlpZiAoYXJncy0+ZmxhZ3MgJiB+KEVUTkFfV0FJVF9OT05CTE9DSykpCiAJCXJldHVy
biAtRUlOVkFMOwogCisJaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykK
KwkJcmV0dXJuIC1FSU5WQUw7CisKIAlpZiAoYXJncy0+cGlwZSA+PSBFVE5BX01BWF9QSVBFUykK
IAkJcmV0dXJuIC1FSU5WQUw7CiAKQEAgLTQxMSw2ICs0MTcsOSBAQCBzdGF0aWMgaW50IGV0bmF2
aXZfaW9jdGxfZ2VtX3dhaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlp
ZiAoYXJncy0+ZmxhZ3MgJiB+KEVUTkFfV0FJVF9OT05CTE9DSykpCiAJCXJldHVybiAtRUlOVkFM
OwogCisJaWYgKGFyZ3MtPnRpbWVvdXQudHZfbnNlYyA+IE5TRUNfUEVSX1NFQykKKwkJcmV0dXJu
IC1FSU5WQUw7CisKIAlpZiAoYXJncy0+cGlwZSA+PSBFVE5BX01BWF9QSVBFUykKIAkJcmV0dXJu
IC1FSU5WQUw7CiAKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
