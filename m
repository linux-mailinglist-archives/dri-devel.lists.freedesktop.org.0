Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C07C9F29E
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D44210E7E3;
	Wed,  3 Dec 2025 13:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="n+emns6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A48510E7E3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 13:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCJlE2oeNe4HwytQYU5aK8s5UWLER6W2x1/IUHSiylsHdBnqW5pJC5IB1z5jwvgQGz6vA1Pvs/katAcq0kbcjVEE3bkiTK2LHKlgABXGuvK51Xu3zWPhaPJ1hV6M+q+c5Rl17nUoS48b+SeZ+mm/DyK7wdB6LBo6cBrwtfD9PKr+skj9CjnZrjFpOHqPf41FWxF2Zo4dFgkE4J7/X3l1/iepeEJkJd2OQdIIRpN5qDIM5J9nTj/DCn9+++oJvPdHkD3+XXeZux8xIBrRGQM7ySTanYRb/D/cvXGOzkeIOcDyJ+5mG2njCh12nSrqK0kkm7GRIR7YMAxG48uNA0Nliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ui3lQKzuLlpHhfiAlL5ktc1NKeldRbgRiipbzercXA=;
 b=w8pLC7rDZg//mc6CpwAz3Fvnw6l5ngqEq0X83i7g1mNbzRGithN2kh4L3nxf3UgmD7AW/LVlwDlH2KTQpstleri619fvULpjw9v0R+jbdVGUP8xMGmp2xZDmI6STpdtD8wLqo8qvZgK/fYyhVJaaD5+SXrbLPemCTtH80zueKy0qgRMy5wLgHN1nLGrRaMmgnffT4UVrH/53nSRSnq0c+YWx3leV3cQ7Hm/9sTpHhmHMIaRCjeEqvcm8LXIvy9RCiQX2xR4QoPEtidjYEv604exdfVl/QxaT79J5WclDa/1UbPihZfo9RbG61hXxogT5dW1b+f7mkwMFyFooEU37cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ui3lQKzuLlpHhfiAlL5ktc1NKeldRbgRiipbzercXA=;
 b=n+emns6N3vleeUJNnPZVWQZVr8ghPLe09V6a4dLsyuwYuRnfTbnRB3+yZNdFK/B7uO8UrhpvJctTVfErov6T/o9p1jmRWNv1GV2K1OTEf3SnadCis9KIbx/2WkWLXvdVPbIKH5mQjPxjn62JRj0j6kY3mCMsCEUP3IgMufCl4aQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13905.jpnprd01.prod.outlook.com (2603:1096:405:1f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Wed, 3 Dec
 2025 13:42:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:42:11 +0000
Date: Wed, 3 Dec 2025 14:41:50 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <aTA-Hj6DvjN4zeK6@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <20251203-shrew-of-original-tempering-8a8cfc@quoll>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203-shrew-of-original-tempering-8a8cfc@quoll>
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13905:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f1e377-e70f-4a8c-cac3-08de3271c248
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y2SsKp3YEO9TdtkRl6BZ6lolEvgo3YMUndJ2+9x5fcjvTI11kI71ibkz6A9Q?=
 =?us-ascii?Q?2En/sDYgiD892rGrZF3v0QgX4xUhgxEoYMmf4Vz4woI/4P3BRlTWFDBejtv3?=
 =?us-ascii?Q?voSxzMvM/kZSNI1/46Shy4EfualDDlREUrBX7LrNpTY09rqmAGSRKdPxbeRH?=
 =?us-ascii?Q?Et4FXjQbvE0+iDHvjJUG9V6dGy7Gqwrw3+Ej5WCd+gFezsbBSZUz2qR/S+el?=
 =?us-ascii?Q?XoWdF3YiKe24AInX2VMqWAFxLFV7tGLDqiIfgsiE6nkdq0r44B0ASc7ZiB8B?=
 =?us-ascii?Q?NkUNshDvrzBaZiJEp8ddEb7Mk9yZW44gW+S8wAjLHpNUGdqSCobtfuWsDuBn?=
 =?us-ascii?Q?IZvSJLy+mV++Vn+fCezc2aTTrCPcq5Ed2ektDKYftC/x1ftKiJ/Gn8u3YFkp?=
 =?us-ascii?Q?DrgLNwN1kHmi3Af8hgzvR7K5RHuDcc8WrP9FTekvvIngGdjiJKd4XOJ2VcqG?=
 =?us-ascii?Q?MkclCKQIkuxB7vbR2MoA1S4xe7+9kCdQt5qh658nlRFZzv+jOgG7b+h0k3x5?=
 =?us-ascii?Q?MftTYnVNaorMAcTzswwY4y7bFa+BmyFTDu32h0KZRrKaycp/B/RKtGLV/nro?=
 =?us-ascii?Q?pCIOKq3Oqhw/JAUpvTJIokDmkMaCJD66GJc4OVBZDF8L16ZZld19Mae1DzRQ?=
 =?us-ascii?Q?MKaCN/QeUE7H55oplCPXulOK2ebCr/fkfIwIVUTxVhxTL79oa9etwZ9U8UfJ?=
 =?us-ascii?Q?otexrmzMo9mDfj67JzrzFySoLrgvrFtYNdErY2Hb8B+WSoNO0dbJTfAfGYI/?=
 =?us-ascii?Q?uiisynCXtb+27T8weTv8PkYKiLvyrKs3ir4Oc16re0wBOgXwyAwkqiJLoe2w?=
 =?us-ascii?Q?XTwRrwGjxVDIr1BtzqdPc+gRLgjONI1OnE6QDVgQqx7QR2gPcvvU59aEwXRT?=
 =?us-ascii?Q?pbDWv7c4pX2ZPmDIDgRafERpFr/ghCHc+utmzjH7EZr0QbjxaicYcGf8A1DJ?=
 =?us-ascii?Q?ANF9VcgeOMWkw/HIbteVJ8dL335qHBiA3vnXEN/1IRqO7Pcz7EC1wDehnpFR?=
 =?us-ascii?Q?LMtm9dFAYdl3maTmsI9JY3idl4VWoyzPAo19wA0zFmwd73j3APKJG3EOOobc?=
 =?us-ascii?Q?S+4hrFw3nnEgL8wggO1c93UOTRai40kAUtCMFp093ol0zFVsaQDoMQ3bEE1R?=
 =?us-ascii?Q?kN93APCxehmwg4onM5Lw3FL8ckPFdEeIy9svQmMIQKvewlIZOaSFWQXfglub?=
 =?us-ascii?Q?alzN/+94klu6yHYEJtdkf1SLUPp4iqMbqqAoa07Kg9Npr3w6/JLOF58hZfXy?=
 =?us-ascii?Q?aOhUkw84A6xxhllQkGWWbvZrWpNToRn7xECI9v9EIY12kOEem0bNEyybujmT?=
 =?us-ascii?Q?RQMawlDq1f/0flKlm2xzaKxViv/xKJ8pjKCUkurC+324sQSMHGC6Rz8GvTZt?=
 =?us-ascii?Q?9XQSQjGKCkuIJvrSY2vcbfbA4XOl97xjvZd5yg8ie3iJnd4BpkG/zme5OTOX?=
 =?us-ascii?Q?iSk8qZHPXosdh3HHG/UGPENP3xm8/YmrPpgQGDjIloIXKQrMx653KiX9GqkW?=
 =?us-ascii?Q?nJAQA6R2HgDyCuh6Jq+bRM0ol9lM6+TiInBw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mY1az3aPNNyg/1wC2Cs8FR1zsEzO3RP/OCf8yqjb6cV0dUNMMI9ofrE0oaPK?=
 =?us-ascii?Q?V11Llb6ROrWiDzUPk4j0eatcqcjZ2YJHPk9W3waWz0uvPcAG9oWWc2LcQHYv?=
 =?us-ascii?Q?C7ndvRHGlZtgo0MEYd97zUSvd8Z/u183Ens2O0DPGeprhULi/+riAZkfZDE6?=
 =?us-ascii?Q?JTa4ru6+GWQiIIx1EcOyZ5XxxBn4+zhDsmhEut96i/DqqhgLP4WRMkZ+HLF0?=
 =?us-ascii?Q?VCGmgUByvGrUjg64X64E3pqj4WJWZA4ioFIpzbWo6xw48+/M5HX/DQzf7+8M?=
 =?us-ascii?Q?244mLrhDIblGVru1hZ+oLWd4WLEoyJVDcaqsjumVwCdMBZd/qC4n33nVtIJv?=
 =?us-ascii?Q?TZnvaw3YUyF8l0sjVHYa6P3KEe/KlgdQN2cBCuX2eD4y8XRHdNbCyyC7prnX?=
 =?us-ascii?Q?eMSWmJ9C1bQcQm1XtqVJ91kJrwAYr69Nmkg8+rKj4oOqIDDJXjBjNpPUjanE?=
 =?us-ascii?Q?B74Ap9dwhgas7eKshDNyxEuCkdItEBQ/mdA8i0BWWZjPN/DmrfNpNtlh4CZf?=
 =?us-ascii?Q?0A8ippXEvaSw35OlVsM+pR9KFdzkk72BWm6bG+P+xDJhxwbqay0IXKdCPo27?=
 =?us-ascii?Q?rXNEcWpfANV0Ggij3Za1cWnWdK6LjfL6s/YP+YYQ25eaPxYG40+QwWz6Ejq/?=
 =?us-ascii?Q?tbXGmKoB8tyUe0l5DKzuHe4ml9baU77HJIJFa3dGfre4vVz2cMFpWRUjJx25?=
 =?us-ascii?Q?3UJ3ZCHTtnvbhQy4EcPDx1HMa0rTkJyiK/yo6XsPuxqe5Em/IHsimOo4XMlw?=
 =?us-ascii?Q?+JEvksv6C50LBXp6iyDPDPeXOnsReBwXD0lxCcLxNSahfkyiI7hjj8j4gECD?=
 =?us-ascii?Q?hYoMUvjUHByENVaZtl/yjjdoQxnaF68gp/UBtnPBLMYydCr6nNkucoX6KRDp?=
 =?us-ascii?Q?b7OU2PTITgeNJSLS0RtzLBsNkQr7U8evrFUYKbhLqrVof6SCdBJhX6SLvXNR?=
 =?us-ascii?Q?80zu5kvQpThlvCfCx0e4cG+EnqNZg5CY/a64n1KKXhM01LEZCl9Nf74gOOGn?=
 =?us-ascii?Q?+0tpVQ0hX/IxC3DHsUuSDF9lmi3hwYg2O9Lza72IVNxZSMj9cYQRYpV2y14E?=
 =?us-ascii?Q?YQq3AaM7M7iWd7BFjSg/dHDM4n5nAJW0AB8OjuBpElYmvozNfCg42a8Ll1b1?=
 =?us-ascii?Q?fYBNQ2CwnrogS9ceGMKlw1mXTak/DerF2zAnoNV10+F5ku65JCdm6h0+lla6?=
 =?us-ascii?Q?5AadozQBQg5rn7EMAq6E+qO3MLrXmuyHL/TECEUw9duF/1tLL0e1M+keE6zs?=
 =?us-ascii?Q?031w6Z5fUZseBZAbAwoxElI5W+nLf27QYaskZ8tPWhdTsvz5YsyPUkT4xjp0?=
 =?us-ascii?Q?sSMPr5TynIQv8CKymtI8bIRSlg1NjzaPYMuDM0qol/m7GXhnk83q3TPsAofO?=
 =?us-ascii?Q?AqVaKv0JLDiDFm7mxexIJizfkQZIcqYHz9hBakmSv3uglxYwK4WNjpx6u1tm?=
 =?us-ascii?Q?g0E61A9rwwMFjKdKE852fX+Nudt7BUI8h2aiGz3x0YwEGfVYV/49t1Cgdb7+?=
 =?us-ascii?Q?uzbphZ5+/+N7swFWUvawAd+eQG/Ii+UvezHLaIZz2Op4Tc8GujUH+/7YIpJI?=
 =?us-ascii?Q?dpS8TokmETi5iAeRnoYnKupjN5uvQWpqehzm0UZqAAhyVXnw5ETX12Ai8dvX?=
 =?us-ascii?Q?AqC+Zb1G0+bpBxHGF7Aca6M=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f1e377-e70f-4a8c-cac3-08de3271c248
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:42:10.9478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPKGGpaVlsymJ7PPIgUOET8secNxW5eT6Otgk9bhPN7NZZbLUWXYGTsQbLTjq6JB1HpaPtLKdJ7wz4/BbkUyWUrrMe9RC3jRTaX5iOal77D+lxS8SBwuyxVL4gzhToBk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13905
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

Hi Krzysztof,
Thanks for your review!

On Wed, Dec 03, 2025 at 09:23:53AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> > The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> > Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> > Processor (VSPD), and Display Unit (DU).
> > 
> >  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
> >  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> > 
> > Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> > and 'renesas,r9a09g047-du1'.
> 
> LCDC0/1 but compatibles du0/du1...
> 
> What are the differences between DU0 and DU1? Just different outputs? Is
> the programming model the same?

The hardware configurations are different: these are two distinct hardware blocks.

Based on the block diagrams shown in Figures 9.4-2 (LCDC1) and 9.4-1 (LCDC0),
the only difference concerns the output, but this variation is internal to the
hardware blocks themselves.
Therefore, LCDC0 and LCDC1 are not identical blocks, and their programming models
differ as a result.

In summary, although most of the internal functions are the same, the two blocks
have output signals connected to different components within the SoC.
This requires different hardware configurations and inevitably leads to different
programming models for LCDC0 and LCDC1.


Kind Regards,
Tommaso


> 
> Best regards,
> Krzysztof
> 


