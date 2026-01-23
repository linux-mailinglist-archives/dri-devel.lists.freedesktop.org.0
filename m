Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAFLC0mZc2nNxQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:52:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8410777FD3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 16:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2710E1F7;
	Fri, 23 Jan 2026 15:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SaspuSHm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011002.outbound.protection.outlook.com [40.107.74.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC2210E1F7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 15:52:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN8jn04JDa5ueV9yBNatQwzl/t4tFpjI36ufnj6CJk7sQAH3I40d84BZInmJdMeaV5OCYXCVCGU31GUqBjnKN66aN78Gq15zl1X5E+8xnvVlZPythodHzr+N3p0Ai6uaizFyzXGOlfoOU9fUZ60D6VBrHvrpoDKlfHkW4zLfkSiFQ3mWuKoHxIQYSWC50setxCqXvsMLHoBGpgB768AzwaVcHiE5gAlhNpnuzXUgziS7AYo4KvXCE7utjR9RUu5TQN52LRcUhYNEnIR8eOetQtcEsBXjGV6e32PT4XTcx7PlV/iMcDFMGrSs3tLAZdIgdv0hvPGu/8jzuqpApVXvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j+dlYLuXWXDlNv05bhZ6rFOGADdm1NvVavKsjijwww=;
 b=vFJ1RzUoyKmx1K1yb0twdtgfcZZtpypkIFIyAliXShFnTzLBcX3YCNwvLG2rTZWxHNRvhFKUKl9Hp8mUNIBrIo7frH1F0uxOyU8ImQdGZRXrOPYv5lXd6aUOF6rpRI8R/wnLTLDEYgpcN0UXuK0HwH/GIelmmvJQIYFNBfMGt4i7wtMzwKttpAoEvCKZkdsMXMYOoLdg9GyEb1rsM82/izDVmoNTh5y8UD3L7wlBhD2i/Qs4qzmWnk1nIOiMQPH2r7DVkqdv3syu2pp4vAO4e3f7A9yOmkU/NFSizsv17BS2l5lJEegdUXeEhjeDUKanH/Cd92gGafmqouBRxFrl/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j+dlYLuXWXDlNv05bhZ6rFOGADdm1NvVavKsjijwww=;
 b=SaspuSHmDOCukHqdhFEgR4jzsDlfaQ2fZmNEzG8xiC6wcst1KaANHGLOHWMGpgFkKhmFnJcyT57QAACsIkGdNhkTjfgDH+nkN5z0YZdN4NGFwJWtpUtvhpdKfyxq8ypATXeb5p4Ce4X1/11bggS44fbphWizxyj78BHJevgJ5J0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8305.jpnprd01.prod.outlook.com (2603:1096:604:187::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:52:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 15:52:30 +0000
Date: Fri, 23 Jan 2026 16:52:08 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
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
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
Message-ID: <aXOZKK7alxiHJRUk@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdXU6traB73KaFj0kRtdo4NDT4ynUyfd-4L36=D6cUUd6A@mail.gmail.com>
 <aWSs75UPtTezytxQ@tom-desktop>
 <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV9G4an1nhPoHvXa5RtrAw+-tP=VrEz4YFNnE7-MD-Vrw@mail.gmail.com>
X-ClientProxiedBy: MR2P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::21) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: 808c8799-0660-4ea3-08d3-08de5a976a4f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzBuSk5xQ0xWMmNxdkJjQTEwMUpIbG4zZnZoekZicW80dnY2WHMxN2t4UCtN?=
 =?utf-8?B?eDBtOElPVWQxUURPeEhINzJEME54S0ljNGcxaEd0MEdSc3dyL1cwNFlXYTNv?=
 =?utf-8?B?NnFBeXVuMWZKMGZmaFhRa256NmZ6dFZpZ2c1TjBBc3BQZTN3NnkwZFEvV0RV?=
 =?utf-8?B?ZElVczJKNjRTOFdIbHQrUXhZNkQ0Qkk1bEQzcUhIVzNBcHI3T0x5SWNIeGZJ?=
 =?utf-8?B?T2ZpZXd6eDR5cy9sWGpMb1VrY25YelpnL2xRQ3dIMTFZUGZ2aldORDVyNFA3?=
 =?utf-8?B?QVBPZUFwOXF2MG9XNGp3RE0wMnBTMXAvTVlKZ0tocGJ4YlYwaCtqNjNTL1Ra?=
 =?utf-8?B?V2k0WC96OHpaUjNEemRXUVppL1BaZnVWbjBRc2NYUm5NdXA0VUJJL3dqVFBy?=
 =?utf-8?B?YlJKd1JVT09lWlhFbmdRWHBvWXRFUkFBSHhVQ1FUam1hVVU3MnZWWU9NY1RO?=
 =?utf-8?B?NFRGMCs3K1cxSVRFM3YxUUJlOC8ydndMQUswNElHUVhYN3YxcnlmTHhMZ3pr?=
 =?utf-8?B?ZGFuWGZySS8vVVpLVmprNDh0aURBdkVTU2VoRmxOK0EvaWE1WS9GNHZNR2pE?=
 =?utf-8?B?dGJaVUZWMXo3S2s3SGN3cExqcGRnb3ppZmk5ek1VWkNOMTdjTThTUnpvSFE3?=
 =?utf-8?B?UGdnYjN3YnNtWTIvemlEcnR5SjlCRVNhV3NmVWpHSE9kZGNhOW1CVmNUYjZC?=
 =?utf-8?B?V0h2VmFDTVpTVHFsVkFvYlExZWthZklJRkRKL28zM1E1M3REMHBGb3JMenlE?=
 =?utf-8?B?akhKeFFPZFJtNmRwSnRPVVJhdjlBSnk0UlNVbDZNYWJpNEhsUlh6cURvQzBr?=
 =?utf-8?B?SGozTm5PNzdaQlg1K3BHeno2bmRHSEQ4dkFYdmhna0RyTjFXaXVrWGoycFJn?=
 =?utf-8?B?VHpGN1hDN2hjOGtWTVBzeU54TDhMTkJNNEE1b3NCY21WeEI3L3p1YWZvUXdL?=
 =?utf-8?B?eWhuSnhhdG5CYmhXMVRMcTNrSjhRTkp5czJReXEwQW9pazNFK29Eb0xxMm8x?=
 =?utf-8?B?MTFDbkFzQ29Mb1BUY09zaXBXR2dCVllBQ1B1eC93TVVsemw2Qkw5d2NnSUJm?=
 =?utf-8?B?VXZVekJxVmM5Vk1JNTN2VkRpN1dGV0hSb0pIZHZraWEraURtT0h1c21CeVFU?=
 =?utf-8?B?YUJhNmE2dEs2M0Y4dFc4Rkk3R1lUbzl2WkdsbThxdks0aHZvdWphYkV3VkhV?=
 =?utf-8?B?Z29sVHQvMzdMeU02MGpKUFZyRk41SkVGdXJRdlNrVC92TlJZZ3ZzQ21CRU15?=
 =?utf-8?B?TWpyaW13ZEhZUkFFYUYrNWNNaGpSTDQ3S3luTGJpVFVTOVJDRjVHanlLa0Yw?=
 =?utf-8?B?bUdiaTZubzdxZ3RiTEdLQ3Bzd3gxSDVSZnBnWENUM2grZThFZUxQOWIwbUND?=
 =?utf-8?B?d05Ha0xVN0QyZ0FDa3UvTkV6SWtDOTZsOG9iWVdIUlpxdTN1R1FCbVUyVG1O?=
 =?utf-8?B?cmF4MS9wTnRnM2RjcS9jaDRubnlsTjlhamFYUjkwNTZrRlZoREd5YmZ5d2Jx?=
 =?utf-8?B?RjZ4dWFEYmNBOXZscVdrYzR3NStxWDk1YUJHb3Fwc09WWllrUzRMdUQ4eCtH?=
 =?utf-8?B?d0hldC9GMnVjZS8zS0loVEJVWEJESnJEM2h4ei9Oc0NqaFVSaVJ6UjFXR2Ra?=
 =?utf-8?B?TnpyOTNvRUJBdVFVbXk1a21lUVk4R2FSZjJOTEh5bnYxbnkvcFRYWWs1MXNQ?=
 =?utf-8?B?Y3BpUlg5WitXMXpQRGJ4SFd5YXZEbkV3ZUtTZ08rdUMxa3lYSXoyVVFaMnJO?=
 =?utf-8?B?bkVwd3A2OE5GQ3F5TkJzN2xhMGxRK2RONU1SRndFYnlLSWZzb01ydW8xWVIx?=
 =?utf-8?B?TlNXVWRSSXNGQmt3ODAvd1ZoMVRTQ2VjK3cvZVNTR0pNUTdzQlp4M0o2aDRS?=
 =?utf-8?B?Y25lUmhSbDhxa04yRTBuQzYvczJtYzFXc3NJQklUU2ZXWW9ab1Q2NVFDVW5V?=
 =?utf-8?B?SVFTRElZbmpkS3ZORkNpZDEzM1RnYUpjSnFXakpDWkZMRm9KcmRtVGpWUUlN?=
 =?utf-8?B?WUh4TFpTR3RwQ1pjQ0l6NWh1QmYxTHp6MDZMN1lpYUgvVE8rZUQvSE1nZVN3?=
 =?utf-8?B?c3ZCMVIwVloraXBlbmdlYmJXaDRvNnNrMUVIZmxIR2cvS2o1UTNhd1BMTDBl?=
 =?utf-8?B?cjA1ZmtpeHNrVU50QUg1REY0cHBvMmNuWG9td3h1cmhRRWp0VTRGT3ZvNkd2?=
 =?utf-8?Q?a4rzf4l1pLwXXRfOalJsdtg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG8rd1BUVjlSMzNIV1RVcVRBdTdDMVY3WWVaYW5jZWRadzBwdS9TWFJRWTdt?=
 =?utf-8?B?T3ZjcFpSKzdrYTFDanlnOUk0ZEJKK0R3YzdXcDk1VUo4S2huWGdYa3RRby9w?=
 =?utf-8?B?UUk2cDQrTHFtaElHSXQvMGJReVF6azRnd1hDVm5tTk9JbHE1bVdYK2d5M0h1?=
 =?utf-8?B?bmxnMWxNdWNKMXc0R3FIUTVFN1hjZWJHS3VpdERTNUpOcU1nTTk5MnpCaWoz?=
 =?utf-8?B?RGxydnQrM1pXcDE4YkFGMm5zVDBoSVNGWXlOZlplczloMDhEZzR0QmI1K1Rw?=
 =?utf-8?B?cGNGdjhjK3U3Nys4T09SNEU3YVI5dnFTb3kyOGVRaHhGZ095VnlKaEJjd3JV?=
 =?utf-8?B?WjFJcWlCRG9hN3N4b0lBMnhtNldvRkVEb1o4UEJQMkZhVFM0ZHhIT0RPVVdU?=
 =?utf-8?B?RkZ3QVdUU0Y0OXcrNjhjM3hGQTgzVzlVWmFvTGZKWTdaaUtJait5dWVOd3hE?=
 =?utf-8?B?b0c2YzJZamRTRjk2US85WWxwY3J1ZmZiZ0UzdTNjMTE1VW1CRDVsWmhGZmJp?=
 =?utf-8?B?Q0hjMXd6aEJqOVFvMVFnV0ltY0x0YTJnMkdIdHR2d1NKVXVRVXRyRHFlOHdV?=
 =?utf-8?B?MSsxMVI1d1VVUmxDWGF4Qzl0L1RFbjZ3UnE5THlET1B4bVhvVWducXNJZUtl?=
 =?utf-8?B?d1RNSURLb3l5YklNNFJCd1FxbHdMLzQrV2dDT0tULzl0blVOK1pSV294Q01i?=
 =?utf-8?B?UDlZWlZObjZrOGZDdmg3b0pTNytCbEZzTVQ4TWdzZ2VOY2FQVjlJbmJVQVJO?=
 =?utf-8?B?ZjUxZGJpdHlMdWttdVpCaHFmVHZ5QkVUVlJkVzlFcVpuU3p5TGcrTzRsUDN1?=
 =?utf-8?B?NEMzZVNvVkFkUlFBWEZRV3kzeXJBaWhac29vVGhtSnJmcExJN0tuODdvOTli?=
 =?utf-8?B?UTNRdXFHZlhjNm1xZkdjRU1sdW0yeHl4akYvSzZFQ0dCMHhHSzBFOVJxWnJn?=
 =?utf-8?B?bFFWaDdrQUNCbUJQOFdCYlE5SGxHck1jc2t6VVc2bERoc2RCTVlCb29sMWF1?=
 =?utf-8?B?NTEwaUdwZXpwWFBLcFdTUXh1N21wdU96Rnc2a2NVY1FjaitSc09XaHQyY0lo?=
 =?utf-8?B?eElubGt6bGxOVWNCRlM3Vlc5YmJ4ZW5YRmtqaHVvbG56M1JJWXp5NFg2VG1s?=
 =?utf-8?B?VDA3dmdqU3YvQ3oyd2tVSkZ4ZElycW0wWXltWG1aNThpSmEvQzczTXNiUTZ3?=
 =?utf-8?B?cWNMV3ZGajREZXNIMGFHUXd3ZEV0WVpwOHhYdmVXald4L2EzbGNCQ0Vlb25L?=
 =?utf-8?B?UzNzcS9Nb2hWWmV5M2Zkd0xZQlUwMGtVVzhrZnZsamxRbitPRnNpR2FPR3Nr?=
 =?utf-8?B?T09hd1VxWHJKQ2ZsY2hpUklFZGpiaC9RT1F2VndsYkZQbktONE1mRUVMU0FT?=
 =?utf-8?B?enJvOEZ5NVZUSS81bUgyNmJVYTdqNjJRcDNaWjNKemFGVjV3aEJjam9hcy9O?=
 =?utf-8?B?Y1g4SjJveUh4TTFKaUs2ZUFHbkFscTQyR3ZQNjdXQy9kVzFuYVpyelJ0TDls?=
 =?utf-8?B?eUZaMVAzQmZZWHRYSmRrVk10dm1xWjZMaUhOUHhkRGtoanlqVW9KTXluK3RV?=
 =?utf-8?B?MFVyY1d2OFAzT3NIWlkzb1MyYTdxZFZZdnZGcDNhRkl4Q1JkUHNDdHl2YTJ1?=
 =?utf-8?B?REJ0WFdzcWpCZThmdU5pMEc2L2M2SE8wakY2cSsxT1ZBMjl3SHpZNUN6dUwx?=
 =?utf-8?B?cW5EWUsyKytEUlRxOUZ4UFJhZVkvdm45QXBmWDZySmZZZmN1RE9VelNHY0pL?=
 =?utf-8?B?cUZjazRuSXl2RnZzNjE1NEg5MXo2ZHJZQ2xRQ3VBTUsvSTM3KzZSWlliT3lD?=
 =?utf-8?B?NmZyZFR1ZFdDb09XZWM2ekZQbjJSWUt6bzZMOGl6MmorR1MwVTBjUUhEdlJR?=
 =?utf-8?B?aDc1QThTdmdTaDVYcGFmcldFMVNwcWhTZkpNemZKV3VxUnlMcVRmZVVwZzZN?=
 =?utf-8?B?VE02TWNLMmhiY2RLTWZJT01vVnB0cXdrd2hwRWVBcGpCTXNmQmFLeFdFTTVG?=
 =?utf-8?B?MkNDUTM0K1BYWmkxSTV0SXE5TzR0N1dXZk9oaFlGNkJhemRUZ0k5WW1XeFJJ?=
 =?utf-8?B?ZkJIZys5S1JzM3JWcERuTWVjSHYvSmpCTCtEc0QwRXUzcmNZM2gwWU5RK3FH?=
 =?utf-8?B?MmhvMkZnQ2dTQnVBa0tKZXRoUkFrTmpQSE1wR296cTRTaFJLZW1pTWxDZkEz?=
 =?utf-8?B?Q0NIV2ZGdEo0ampzclNGRzFOWWh5aEwvSElraWxFVVF3RXFQWGdEQzRmV3Zx?=
 =?utf-8?B?Vnh0VDZQeStqNFlhYVM4ZnN1SjVVRXhEQXkyako3RWlOemRRSFh0SnBKTEZJ?=
 =?utf-8?B?bFR2WWNXZGE0REM1eVNramhtdm1UT0c2Y21HTnhqZ0Q3bXQrWVpxV3hSK0Yr?=
 =?utf-8?Q?gBdfdxd2BYp6WzWDh4rISy/BeiaihBVWjmWYg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 808c8799-0660-4ea3-08d3-08de5a976a4f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:52:30.5222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69JEpIjhu9PHXpuOzNh78+tordkGFKIcqaP2MrBBsUoOSAqST6VI1yvGrFEBcVdImcFfS+dnyBlUf5sLtiPyYetReypBiFXNeCJWQEfcHS011CrKtzK5BO/CKKBkpLLz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8305
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:Laurent.pinchart@ideasonboard.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.041];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,ffwll.ch,linux.intel.com,suse.de,baylibre.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8410777FD3
X-Rspamd-Action: no action

Hi Geert,
Thanks for your comment.

On Wed, Jan 14, 2026 at 02:07:49PM +0100, Geert Uytterhoeven wrote:
> Hi Tommaso,
> 
> On Mon, 12 Jan 2026 at 09:13, Tommaso Merciai
> <tommaso.merciai.xr@bp.renesas.com> wrote:
> > On Fri, Jan 09, 2026 at 07:27:04PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
> > > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > > > sources.
> > > >
> > > > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > > > them in the clock driver.
> > > >
> > > > Extend the determine_rate callback to calculate and propagate PLL
> > > > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > > > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> > > >
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > >
> > > [...]
> > >
> > > >  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
> > > >  {
> > > >         struct pll_clk *pll_clk = to_pll(hw);
> > > > @@ -1085,6 +1213,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
> > > >         case CLK_TYPE_PLLDSI_DIV:
> > > >                 clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
> > > >                 break;
> > > > +       case CLK_TYPE_PLLDSI_SMUX:
> > > > +               clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
> > > > +               break;
> > > >         default:
> > > >                 goto fail;
> > > >         }
> > > > diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> > > > index dc957bdaf5e9..5f6e775612e7 100644
> > > > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > > > @@ -203,6 +203,7 @@ enum clk_types {
> > > >         CLK_TYPE_SMUX,          /* Static Mux */
> > > >         CLK_TYPE_PLLDSI,        /* PLLDSI */
> > > >         CLK_TYPE_PLLDSI_DIV,    /* PLLDSI divider */
> > > > +       CLK_TYPE_PLLDSI_SMUX,   /* PLLDSI Static Mux */
> > > >  };
> > > >
> > > >  #define DEF_TYPE(_name, _id, _type...) \
> > > > @@ -241,6 +242,13 @@ enum clk_types {
> > > >                  .dtable = _dtable, \
> > > >                  .parent = _parent, \
> > > >                  .flag = CLK_SET_RATE_PARENT)
> > > > +#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
> > > > +       DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
> > > > +                .cfg.smux = _smux_packed, \
> > > > +                .parent_names = _parent_names, \
> > > > +                .num_parents = ARRAY_SIZE(_parent_names), \
> > > > +                .flag = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT, \
> > > > +                .mux_flags = CLK_MUX_HIWORD_MASK)
> > > >
> > > >  /**
> > > >   * struct rzv2h_mod_clk - Module Clocks definitions
> > >
> > > Why do you need a completely new clock type, and can't you just use
> > > the existing CLK_TYPE_SMUX?
> >
> > From reference manual (Table 4.4-10 Specifications of the CPG_SSELm
> > Registers)
> >
> > We have the following:
> >
> >  - SMUX2_DSI0_CLK*2
> >         0b: CDIV7_DSI0_CLK (default)
> >         1b: CSDIV_2to16_PLLDSI0
> >
> >  - SMUX2_DSI1_CLK*2
> >         0b: CDIV7_DSI1_CLK (default)
> >         1b: CSDIV_2to16_PLLDSI1
> >
> > Note 2.If LVDS0 / LVDS1 is used, be sure to set 0b.
> >
> > For this reason these clocks needs an ad hoc determine_rate function:
> >         - rzv2h_cpg_plldsi_smux_determine_rate()
> >
> > For that CLK_TYPE_PLLDSI_SMUX has been introduced.
> > What do you think?
> 
> OK, your solution sounds good to me.  Still, as this is used from the
> DRM driver, I would like to get some feedback from the DRM people, too.
> 
> BTW, I just noticed in the RZ/G3E clock system diagram that
> CDIV7_DSI0_CLK has a duty cycle "DUTY H/L=4/3", while all other clocks
> use the symmetrical 50%.  Perhaps the DRM driver can request a duty
> cycle of 4/7 when using LVDS? Currently the DRM driver communicates
> its requirements by explicitly setting the parent.

Based on your idea we can add at cpg lvl:

	.get_duty_cycle = rzv2h_cpg_plldsi_smux_get_duty_cycle,
	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,

That select parent based on requested duty cycle:

  - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
  - Otherwise, select DSI/RGB path (parent 1)

Then at DRM lvl we can go for:

	if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
	    struct clk *clk_parent;

	    clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);

	    /*
	     * Request appropriate duty cycle to let clock driver select
	     * the correct parent:
	     * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
	     * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
	     */
	    if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
    		rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
	      clk_set_duty_cycle(clk_parent, 4, 7);
	    else
	      clk_set_duty_cycle(clk_parent, 1, 2);
	  }

What do you think? Please correct me if I'm wrong.
Glad to hear from Laurent's input too.

Thank you both in advance.

Kind Regards,
Tommaso


> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
