Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D6C8CFCB5
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04EC10E122;
	Mon, 27 May 2024 09:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="hTkj12tC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 886 seconds by postgrey-1.36 at gabe;
 Mon, 27 May 2024 09:22:43 UTC
Received: from mout.web.de (mout.web.de [217.72.192.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E3E10ED0A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1716801756; x=1717406556; i=markus.elfring@web.de;
 bh=Rb/B2ovHnZ6QCVFezt1gZmqIJ3Eo3AhrdizD4T2BxdQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=hTkj12tCBX3HI66imhYWRFCG4rSHyzcmExs38b+aGk/TttJG7wwTvamyTok0aLL1
 kbbYkfhrl+OvHU9NpXmt6g5n7AjApV94E6I/kfg7P1VcRKaRyMHxrq/Uame3tRq10
 TdgdwgRSoAxaYEMtFSbKn8USNelXdplk62x/00LrOh3+69MdE3BN+KHLjI2Q2V6l9
 QU9/wFhsT8t4vs+tmpe/DvRE78rpJGwXdul63tmfztUzxlGuMAqhgk2eEIEUbNaQ0
 Gbt+yJFBHHFI8kgfsu+328q4FNkMySomc9z4zERR8u3h4finQn4VzEw6xKWEBE2hV
 i6cp5kbRtGEWX8uG8Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3m5B-1sCLuR0mkV-000qYL; Mon, 27
 May 2024 11:22:36 +0200
Message-ID: <e6762978-d35f-4356-beac-bcb8b36d3ee2@web.de>
Date: Mon, 27 May 2024 11:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/loongson: Introduce component framework support
To: Sui Jingfeng <sui.jingfeng@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20240526195826.109008-1-sui.jingfeng@linux.dev>
 <20240526195826.109008-3-sui.jingfeng@linux.dev>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240526195826.109008-3-sui.jingfeng@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xat59LEQihQ6e/FrLPV3GI+wzB7H+wFr4geqZy205A9JyyREx0J
 cjeWo3zCyOMWbeJiSfuU3OLNPTAnTaC4MEkK6agdN/2aQbVPPmmD2/ActAPjc0pF9PKvuSl
 2UuAeM0yYBXQXWR32hpFx01ThUFbP9/tXtaVzRkttjgc/ufNoB+dpVszVpeNobklc9fVb3a
 Bqxkc5Ff836eLeysjExsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:A3PTnOl92B4=;nAi17OmfVJQD5ZwFF3RBuJzcxff
 T6p4Rls6Tp+X/czicoT0qucygzSBqbDHmhMrpd1XdpVpLgHsEe1EuK8lsEig2xSygyFg9qTxV
 U4Hnb7gntzPZ5SKF8F04ruBjvOgoEuSzcaDdia7WPh5zZt7C9ZivRrcgArBVa7untyLvUsS+L
 FXBEtr+zGGek9pnlxwNv87qKZW+bNpkoCHhhJ/3sdFhbQ9TOlCD29aw48JoNDZFPrJAhikLWk
 ahcaHiE0HeIXXmMoYOrSW0EEdBhUM36VM2pJzW0EPm1Ghehqqf1zj+u1/QjuapU5LV+uVoWSb
 TiQYvE6uTPtI4ALpeMw5paHjwTwIdBPcvQ+lgRrEKpVvjnpHK3k7pTK30e1Rh3tnnZ7HKiiTD
 Tlyg3WfFaQPJTtkQR0ZWdrU7psPSveQeH+M2EzHdCoQJ9m5P2uCWaJnfJ4O8e84eAWO6H1+G/
 1HHaFt3wRZI5YoEC7n2h8xJFqSIJXKnLtxUxVKIkP3guCRBPjTStdXDwanqixyL68yXc5n5L8
 UqK2rdsB4xiFlCVYVbeoDpXEp1a/UxUgFRD9YDiriX1/p8ViRrU1T4tjMCt1iVoYJ+pyd4iiL
 4VyvYwd23V1BXRrajdnGcV457xTrTUNsLXqNB8+szP2iXuKa7tIuDqemToVoQYYuny4wZrOkf
 cKgcEjUr7coCkEHtpA0oXuhfmDRdCgXfWmFPIKElx2E0pOWQ0xBbrz3zvBY+4mqu3z9fW/euM
 TwAWDpsWRbOUot4+WGTWkIE3T9Fd3LTOkYUAKb2x85Ks7KovJdjEOT3GQFN7u7LuPQ96TlFT8
 qMJs2PqxRAZVqKbibpS2hzmuS3TZIzsrd/McQV+YO+xAc=
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

=E2=80=A6
> However, the driver needs all of the subcompoments ready to use before

                                       subcomponents?


=E2=80=A6
> goes with the PCIe master, sinch they has no dependency on exterinal

                             since they have no dependencies on external?


> modules.
>
> While the outputs drivers, such as encoders and conectors, may has some

            output?                               connectors, might have?


=E2=80=A6
> if it need to do so, the master drvier won't bind until all submodules
=E2=80=A6


Please improve your change descriptions considerably.

Regards,
Markus
