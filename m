Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46494C9CDD5
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 21:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1522E10E6C3;
	Tue,  2 Dec 2025 20:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="F9yJEsJL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEBB10E6B8
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 20:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1764705923; x=1765310723; i=deller@gmx.de;
 bh=MqZWMprknGQ3O2VxWn8vrbKqqU1+UgtYJwZHHshOJ58=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=F9yJEsJLh8ngDNMhnH+9zZGZU+xnvFBIBpQ3o8m2oCvMszotxoK+Ns9QSIgZxQSV
 NALUaGXM8+GfWrj6tREyVQ8jz5JptEeZPPAuO8wnDgLPjFb2OV1a0Hco8h1CDcMeF
 XcvQEgkopNqBrNs7ukRc+SA/EA+z+57Rd4g356UxRKaOUt2jx8loQ+6/mO6uPsVzD
 U+icqlgKuLEFdxTJR00eraLxPlgrsTBMx1L8cOTMh0bbi8JX6dZeSXqH6nB/o8kGi
 VgdNIPdkCgGkTKshr7SJlhbvj/cbwGQBuuN3oqP+7AJxrbtv4jqUIE93L7BEir5tf
 MsYmHF0u373onh4vOw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.50.47]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPokD-1vle9A2aqx-00YkHC; Tue, 02
 Dec 2025 21:05:23 +0100
Message-ID: <aef7d5fd-2926-4c58-b720-4af58aa380d3@gmx.de>
Date: Tue, 2 Dec 2025 21:05:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable] fbdev: Fix out-of-bounds issue in sys_fillrect()
To: Gu Bowen <gubowen5@huawei.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lu Jialin <lujialin4@huawei.com>
References: <20251112073207.1731125-1-gubowen5@huawei.com>
 <148a116a-b893-4e91-8573-1eebc2bb5c0e@gmx.de>
 <224e4e5b-14ae-411c-ad6c-f73c3b946ff8@huawei.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <224e4e5b-14ae-411c-ad6c-f73c3b946ff8@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pDvC6n9aXIpRNjxJEcTvKRutKuhWfKAcIBEB5+LROPXsyW9kP1g
 4/+oNRsi79BiinVszohBxTrK0SBojRgYecVvqjFgqBNE1Mm0WLW0MMIMrnAedFdYsnOSKQP
 ygTZzbddzXg5WX+u0stThDDTq5B7SKijL/DwHH2FYLn17p33YgBwLwk4cZjfirmoPwVktOQ
 ZJh1iJlvvbbsTf6fz/GpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1lff+p54N50=;4EezkbTUm3Dcdtj3AcXilY62hyz
 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
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

On 12/1/25 10:25, Gu Bowen wrote:
> Hi,
>=20
> On 11/15/2025 3:21 AM, Helge Deller wrote:
>>=20
>> That patch does not apply to git head. Can you try to reproduce
>> with git head?
>>=20
>=20
> fbdev has already been refactored by commit eabb03293087 ("fbdev:
> Refactoring the fbcon packed pixel drawing routines") on v6.15-rc1,
> so this issue no longer exists in the mainline version. Similar
> question has occurred in the past:
>=20
> https://syzkaller.appspot.com/bug?extid=3D66bde8e1e4161d4b2cca
>=20
> After the refactoring patch was merged, this issue did not reappear,
> but it still exists in the stable version.
Backporting commit eabb03293087 to 6.6 seems unrealistic.
So, maybe adding your patch to stable might make sense.

+	if (dst_offset < 0 || dst_offset >=3D p->fix.smem_len) {
+		pr_err("dst offset out of bound: dst_offset(%ld)", dst_offset);
+		return;

I don't like the pr_err() in here. I do understand that you want to print
that something wrong happened, but we are inside the console printing code=
.
I think we should just return in this case.

With that change we might ask Greg if he accepts this small patch for stab=
le-6.6...

Helge
