Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FBEC5F018
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:16:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBB210EAE7;
	Fri, 14 Nov 2025 19:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="gEG45SX+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8222310EAE7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 19:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1763147760; x=1763752560; i=deller@gmx.de;
 bh=x6J+cO3YK3t18lKs4XL9UGJ+4VSQ4KH/LCzfsOt3pjM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=gEG45SX+CQ2mWokQ45c62MQWNxqucf4F+2/jT4+q2BHYT7vJagbAq7+jhp8+jzPJ
 EWCQ7pX2QVIFm3C/bo3/j9a8cN0WyZTZAgetbnMnuS4676ITBoMjURQ1T/PPwSBO1
 fD3oavhzIfakmoQBhTJKJ3TggWY/eEleg+DVpjO+2jMgOyS9n39EjuRmBdpXmtIdQ
 PIxMDvfo0pH+bX4WuBLvNycFmStepzkmvcsam5bSMgfowA1/7k/ydXwvX3gmShPKB
 fWjpMLYufTGklvWuXprlFwX+dYCChnPoGGEjdehgtFvWSXpYRVqk/oP2GxquvS1BS
 fjs+y1ujSienrksFYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.51.147]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49lJ-1wJLBh2Mu9-018DrB; Fri, 14
 Nov 2025 20:16:00 +0100
Message-ID: <395da01a-a441-4ee5-a49c-e385f800c627@gmx.de>
Date: Fri, 14 Nov 2025 20:15:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev/riva: Add NULL checks for
 pci_get_domain_bus_and_slot()
To: Haotian Zhang <vulab@iscas.ac.cn>, Antonino Daplas <adaplas@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251114080634.2342-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20251114080634.2342-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7SxTmiDzRq1v9SIxqbqO7t5Kn9+uwEwoI+rqZGXapkp+l1hpcOr
 LGboe4bvtt8jTBIAACiUBnHlbXrKgTbXHgDvI8bvvYdMECiCkiR+l1tye25aerZIHe4kLSG
 r4Frqhbw0A51D1EBD19ruuQyi35oJZSXKn8F1qeGqGN4h97a4Av1/+WO+FTyGWWUhv1CmRY
 Hl9U0LubSrS3BKEO7GbXg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WSp7ofionq0=;ysK6G1q7dTnKurNPrxkm75McSpN
 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
 v3yo2/V8=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/14/25 09:06, Haotian Zhang wrote:
> The pci_get_domain_bus_and_slot() function can return NULL
> if the requested PCI device is not found. The
> nForceUpdateArbitrationSettings() and nv10GetConfig()
> do not check for this, which can lead to a NULL pointer dereference
> when the returned pointer is used in pci_read_config_dword().
>=20
> Add NULL checks immediately after the calls to
> pci_get_domain_bus_and_slot() in both functions.

You issue a warning if the device isn't found (which seems
unlikely btw.).
But you don't take care that the driver exits cleanly then.
Instead it will still try to configure and use rivafb which is wrong.

Helge
