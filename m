Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIWROMisd2kZkAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:04:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC908BE48
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDB10E0BF;
	Mon, 26 Jan 2026 18:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="PFn7k2dv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021110.outbound.protection.outlook.com [52.101.100.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4849210E0BF;
 Mon, 26 Jan 2026 18:04:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtUAHSkRKWtqYVrsN/KMz3Wrr2RgizX4rzyYn/AL97YNOdx1/5feBx/6li7am9gSbc3YbwT+a6bMJnuBeGd97/wWPIO2mDrtiBQ7qpc0hx+PcqfonD1baJktKjDoEpycrvc/cGWenILr5zkXDYhukjsDttush31/QSFsgFArjVf7CMIFkWr3SsHJj34b/NFVjB3IwfxZ8geeeSntK4j9fcZsVlAq7DZvTUCE6iVqbldrq6jJen7r0sDfU49cE3yJCpPJbn2s+1t0v5QEbLoqWa7zr7I18aIgAX9bz0f/wdRwWGHZ/DTf5lTzAIFWElLO3zS//WfwqbULqnDj3Q0//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1VVKOqvQBLHgR38vU6NIlhrcs1HZIdZuVl7xhdqK9U=;
 b=yQkvLMhcqInwVGQAk3Q8Y3FC8/CfJ0tvVLK2N5RIzf4AXevQlZge/POFE2LcDG/3RztWjrL8aOXLduPs3C9tfkmt/jXs7knmpMQm6/77y90adBQiIdU7Rc3PtVR+cUjsvmaC4UbFFuSTxK0pxbAgc2zqHnSkvNZonwHYMcg2Kj6GE2/cZk6jvErd/5rbMbXBt3kix0FQDFkjWz6P2AlnqbE2V6PYUmUgPYlJTVFSDRVaLkmo76Re6giGb27rE0yDwLAScZZTo67KJurdu2tZP8KEV7LXR6Gkf8LRRIlum08oBXfE+1mpOuFtLcIUCwhL0POmiNlYiaeohrUEOYAipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1VVKOqvQBLHgR38vU6NIlhrcs1HZIdZuVl7xhdqK9U=;
 b=PFn7k2dvnd5/ehvbppNNovBsfee4Y8PbEvgN1KL5SnYXTIBrr0dFGy5flc7MoHpCCCyZmbA3bQ4f7L8SzGKCRGeKOHB7QbBxRLZ25gW4668uGTSH/KyMqhSuy8+D6hDjO2Xue6osq1tysRZyjV6JAyj+8pKnFOUD3pibyjOPEJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LOYP265MB2093.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Mon, 26 Jan
 2026 18:04:48 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 18:04:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 18:04:47 +0000
Message-Id: <DFYPX3TNI3Y2.38MQUIWHHR9Z1@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/4] gpu: nova-core: gsp: clarify comments about
 invariants and pointer roles
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-2-e797ec1b714c@nvidia.com>
X-ClientProxiedBy: LO2P265CA0006.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::18) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LOYP265MB2093:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cee1817-446a-4562-4648-08de5d056492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elZNYU9vNDMwYVM2aGVsU0NYMXJXSVdvemdYdWJINHJaVHgxaE92eUZKbXB4?=
 =?utf-8?B?SGk1WnZYTldJWnlueGZuSTk2WVdvZmJYMjRIeTQ2ZTYwam1IOHE0dm53WGUr?=
 =?utf-8?B?aEtMQ2FrWGdNWFZsZFhqZ0owaTdsdkM1Rkh1eWRsVndVcitOTXgzTElUSFJh?=
 =?utf-8?B?ckI2L2ZCSUJQdTZva2Njb0EwVTRkQmVFRlB4ZVNZZXJmeHpYMk1pTzlEQXBK?=
 =?utf-8?B?WHV2b2VYTUZOMWNCYW45bzdjRlZtNW5uaFY5b1JrNCttYmRITHZ0eDRvWmNG?=
 =?utf-8?B?YUIrK0FhUFM3akhnNEFzMlJUZEI0TmNXN3EvVSs3UTg4TW5JWkVJdE40UzVn?=
 =?utf-8?B?Wks5bXU3Tkd4TTdDYUp1a3ZtSjN0VXZiT0tZYksvWjVsOWg2TjNPbmFzKzdB?=
 =?utf-8?B?Q3Blek1WT3VKb2hGclFZWjR4RkEzNEVsTDVHOFUzeGFGcGdNRUczd2I0a2dP?=
 =?utf-8?B?NUJlZEVmNVYzRHFIanQranRzd04ydzdMSUhOczliNXFOWDFmbE9yVElSMXVk?=
 =?utf-8?B?M3FCV3VCa2pqSkFkM0tieEhNVTJLdmJRY254bVl1bG9nS1JKTzBKS0pqREJz?=
 =?utf-8?B?MTNtYkY2dmNSQVpqY1E3RDRnOHhBcjBmWFhpMkZwNDBQdXBUeUExQ0trNzVF?=
 =?utf-8?B?VW94SHprNWttWENWS1VaVHpYeGN0L0x4bXN4U0UyRHE0bERnZGdoWk9wcmll?=
 =?utf-8?B?UUpXYVkwcnRXclhBd3ZnUGF4L1VRLzNsWjdxNEtaVWFFYkZ3N01vZGR3TGxU?=
 =?utf-8?B?YnJKaGxnUjFzeXM1bE41OFBleklPQUVNRFdkSnF6K0cxNFBDcStaQUhFR05K?=
 =?utf-8?B?bW82bDQrQXRDMjNkQXRqQ3VoUSt1bWRSVUVXdlYvdk5zTFU1WlY5TDA0WUx1?=
 =?utf-8?B?Kzh4NDNscmtXR1RuTWczeHZlVUJYczNwQlFaV25LYjVvZGE1L3hSNWduVjJa?=
 =?utf-8?B?T2VzeWNheklLZ0tZOFpWSzhaem1Sb1BNUFpvNDBWL2IrZHpjVWtSV1l3QUtp?=
 =?utf-8?B?RE9GRlZpTVhZU0Yxb1pkcUxPQjAzallmOUVqRnU1c3E1UkZZVnpZaExyWWpk?=
 =?utf-8?B?ZnpOZG9hSlFYTkdJZXg2cW1FSkEzejZXKyswWnVTSFNaUUM2a3MrVFI3MWF3?=
 =?utf-8?B?UndQa2FHYzVqd2Y4R3kwdURQcDA1L1hSRTRzMktGMzdTTWx4ZGo3cjMxVjlU?=
 =?utf-8?B?WS9zQ1hBNEFKNFQyaXJHdEwvaFRCMW5uaHBqcGc1bWJaR0lydnZwVW05azlI?=
 =?utf-8?B?d2lyWHNtUDFMNU15Q3pZWVNuM0RhOWg0ZEFFTjJjNGs4alhYOGI5dWtFSERy?=
 =?utf-8?B?Q0I2Qm9GNHRqYmZ2YmVzRVBETFd3TFhtYmMzalR0dlFSTmY3STJrOUVXU1FD?=
 =?utf-8?B?MnhzQVZuQ1pXU0J3Q3FhZTRUTVprSVZQaTVmNGRYeHp1dGxZNDJPQ2c0bkx3?=
 =?utf-8?B?NXFXOVEwOVpsWmhJU3dkVnk1QXRCNUFQaXhVdHYzQTFxQVdSUFExcGYwRkk4?=
 =?utf-8?B?cmt5TnZOUGV2cHlZRjF4a0ZTYTBwSkpTQUl1S2IxMzNCT1JTK1FKRy9hak0y?=
 =?utf-8?B?QnlXa0tWdkdUMy9kYWFsR1h5RnJhTXBDZHlRR21jQUp3WmFhTUVNZ3Q3QmRC?=
 =?utf-8?B?Y3p2a1VGdlFXc29hdkp6M2RtUHlsRkRobGNDcnpxNDlzajE2TGFBK1JJUHQ3?=
 =?utf-8?B?OFRNbE5JNlhSZmRCM2pWTlM0U2RhMEdMK3dqL1BQekxkdVVkT1o3dEozUkpy?=
 =?utf-8?B?d1VmcmhuQmthdE8yYm5Zc0pVOTc4V0xGNXRNSHZhUFduR2lzTDZYVVJHVFNu?=
 =?utf-8?B?MjBFcmVXTm44RTZxbURhaUo1MjRlYjFpSkRtbzl2cFZKRDhYVDFYZXpWWUhD?=
 =?utf-8?B?QXlVamNmVGxQaDZRUEEwenZsdXU2aFRGOXNwUGxqZm1tSTJrcmpEOVZmZGc5?=
 =?utf-8?B?cHdaY2JKU08rRTc4RVgxbm50YlFVVGwyMUhrU3RKSHdTRnloeU9VYVVVOFEv?=
 =?utf-8?B?WEo4TU1IWEY0MFFxZTFyU01qUkhnamdVcHpLMkxScWdBRnV0ZmhxS3BBbkIy?=
 =?utf-8?B?M04vTkg2aVJ4YThUODhHbDc0QWdqWVdBV1VSWk5IWGFqQUtUb3hJRWcxbFpy?=
 =?utf-8?Q?uVuk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkMwSTd5dHk0SGRLOTEyaXd2ZHhuL2dQNi96RlRER3JZWks0TU1TVGlSOGtk?=
 =?utf-8?B?M3hvYU9tVHhYQkNURUFrOXhwQnJQQlVHbytKcDBFcG9qSjhXbTFxM2d5Slc3?=
 =?utf-8?B?TW5NT3htUTUwaDVoNjNTbmJ0WUN1L2dodGJHTkRsSTVBUWtCNFc3T0R4c05n?=
 =?utf-8?B?NXNCbEVVTXE0UmJlMXR2eUU3VTJnUDdBSVM2WlR2cHdLZFZsSVJDRXhCSTg1?=
 =?utf-8?B?K0R0RnRvTndoMjhMZTk1VTlqUXkrUTFpY0IwMVlxaW1KRjNaRzJObmpGck5W?=
 =?utf-8?B?ZEZHWklkTlB2MjcrYmQrRkN4akdTclc0RDZzdEtPTmNJV0tUSjhqc3FRRU0y?=
 =?utf-8?B?d08vYzVabnEzdmRyYWlHT0R5ZlRtVVI5OUt0Y2VJdWtCVjlkdnh6ZEZQT3VF?=
 =?utf-8?B?UnlMZ1FHMFM1azVQL1c1WnJzSTVVUEtnYkhPWDFCWENzMzRCVTVmeTQ2SXR6?=
 =?utf-8?B?N1ZqcXBha0VxQTBpNlRlNFEzV2k0WjUvMVRUVll4d3VVR3VQeExyWThJSVVM?=
 =?utf-8?B?Q2ZiaDdaV1NCQjFTZCsyOHBYM2VLM2RPME12RmJBczVjWFB1cGRtdENFTmlv?=
 =?utf-8?B?YnNwY3dqMUZ2UTNDWUlQSFFaVlJDTmVQWVIrL3FxakFmTmIxaDArV2ZCNFp2?=
 =?utf-8?B?SUJOeVB3NENFUmpIN2NsbkM1NzhnTmtlK1Nvb2xwYnVuOVBLOXZyN21KelRq?=
 =?utf-8?B?TWJQcUk0emFGK3R3bDAxYXFiTDYxWVNVU2ZOdVI5YTdsNW8vZXdCNThxcWZr?=
 =?utf-8?B?aEpJdHAzNXJzTGhFKzdaNm54Wk9hRXZvb3luNE9lU3BlUTNHdXovZ0FjQTVJ?=
 =?utf-8?B?eVRwNDlBOUM0ZnZ0WnFReXgwSmIwTTF1OTRGVjlPVzg1ZVdBangvN3d2NFNB?=
 =?utf-8?B?UDA0dXRhU0xvT0VnR1BaUE5hWVhPc2g4RFdoRm5SL1p0R20yT2QrcVkrbWRB?=
 =?utf-8?B?RSt0WC8yZEE0Q2VKVitOTDdjWmlqY3l6cC9EeUNva2h0T0FPc0dYbVhtdlMw?=
 =?utf-8?B?cm5LejFqbnlEeFlkMjFoaW9oMHFyUUNSWkpJd2ZWMExQVWtzb21tNHQrM3FY?=
 =?utf-8?B?UzB4SjFUWFVuRHVLOU81aTlZYVRXVWZVaUM2OGZ0eTZPc0R3YkJOVXkzbTh0?=
 =?utf-8?B?cWk4WXBJTGhrbGtGbVAwa3piMkFJZUdNUGZTamFKbWNzOWV4MEY1UEdSMnVa?=
 =?utf-8?B?cUxHRkxUTVJTajNpa0VySThGNkpkdkxIejNnZDI0cFlZSmNZQ2R5YnZyeTcw?=
 =?utf-8?B?dklwOFRUZ2xNRjBXVGl3VFVDTHo2aDZtQkZWRUhhd1B3OFpreDVFaW1sMWoz?=
 =?utf-8?B?MmdjSXR5ZWlnRWlDYmR0Y3ZERXpNWHZyUFdaV29HWVFTRDRjZitweEthWStJ?=
 =?utf-8?B?T2Z3UnNpKytRS1hGdFFOY2w2enhOYTkzaTArYlV5S0Q1L09DOEo3anJBY0tH?=
 =?utf-8?B?V0FBd3E3dFBUVHZyV2xNK08wR2VGOS9VSmlxTUhhdFB2b1FjZjI1emIvZzNt?=
 =?utf-8?B?UkNobUU2bDBRVE5rUlUwMjUvazZ1QS9TL2ZBN2NXSFR0Z3diZ2RtRUR0TFpY?=
 =?utf-8?B?bGRzbFpzdUV1NEROdHFNZ1NyYUFscUpXL0JhUnVOTHFKdEYwK21VVUFuUXB5?=
 =?utf-8?B?TjZ2WFlMUWNCems0QnJ0ZGluUEI2bDFrQ2ljQ0Z2MS80V1dkcXZyK1J4WTJl?=
 =?utf-8?B?eFkwbldHN1VtMXdJOXVET3A0NUd1ZFpWUyswNGxiN0xDWDZURGV5ZlJuaUh4?=
 =?utf-8?B?VzdxZHh1dUhSQmg3eDBCUmZzKzNGT2pqbnZlNDUxc0gydXJja3JUbmRxaGtp?=
 =?utf-8?B?QnRJc2sxN1BoT2gzeGl4ekNQN1QrRi9MdXcxNVpNZmx1T29KTm5nM2t4endL?=
 =?utf-8?B?bFhPR0FJUzdkSzRuRTUvVmVRdWJFMHdyWmxMZ1VRcFlISnJJdHdwT1NNcU5V?=
 =?utf-8?B?NUkrd3dKNWRCOUFsNVdtZDk0RndETzdIU3g0ZVE4VDNSREE4bTI4R3Y4Vkw1?=
 =?utf-8?B?bzIzSWJvOEdybnNYbzN0Q3F5RjBmVzNFM3VzeTZuTEEzQThpQTl4T3lQUHFq?=
 =?utf-8?B?TERUWWFqRjMzS1htMmJkRXQ0TU9iak1DblZvY1pOQ0xIY2JtSFg2TEJKRGRz?=
 =?utf-8?B?SHRpOHdhYlhMSnFIMm9ZR0hocnJpWmdvK3k2NTJOdDlmUlpLTS9UbnRXUlRV?=
 =?utf-8?B?TkY3VFM4ZlU3Q0QralVWVlZ4em93dWdIZnJ4TWVVcU5WcENIMEk3UFdINVhN?=
 =?utf-8?B?ZDJnajNXeGNyZ1ExcGNVYnRHU1dwbGZVSlhCQzZ6SEU5dkVYeTBoeFpvQitO?=
 =?utf-8?B?Y2ZVM0hCbWNuOTNzSnZLNUQrV0pqemNTTktwTmtpQmlJTGVoV2pFZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cee1817-446a-4562-4648-08de5d056492
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:04:47.9373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0velT8b0CyjZf9QEWcI1WEPuPO8fQWOa3ktxfo27Md7fHlTH+Dmq7Xh3h9BDUyBx2ITedCbfpffPnR8FwuW3qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2093
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,garyguo.net:mid,garyguo.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[garyguo.net:+]
X-Rspamd-Queue-Id: 3FC908BE48
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 12:12 PM GMT, Eliot Courtney wrote:
> Disambiguate a few things in comments in cmdq.rs.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index f139aad7af3f..09c28eeb6f12 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -161,12 +161,14 @@ struct GspMem {
>      /// Self-mapping page table entries.
>      ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
>      /// CPU queue: the driver writes commands here, and the GSP reads th=
em. It also contains the
> -    /// write and read pointers that the CPU updates.
> +    /// write and read pointers that the CPU updates. This means that th=
e read pointer here is an
> +    /// index into the GSP queue.
>      ///
>      /// This member is read-only for the GSP.
>      cpuq: Msgq,
>      /// GSP queue: the GSP writes messages here, and the driver reads th=
em. It also contains the
> -    /// write and read pointers that the GSP updates.
> +    /// write and read pointers that the GSP updates. This means that th=
e read pointer here is an
> +    /// index into the CPU queue.
>      ///
>      /// This member is read-only for the driver.
>      gspq: Msgq,
> @@ -222,7 +224,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result=
<Self> {
>          // - We will only access the driver-owned part of the shared mem=
ory.
>          // - Per the safety statement of the function, no concurrent acc=
ess will be performed.
>          let gsp_mem =3D &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap=
()[0];
> -        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `<=3D MS=
GQ_NUM_PAGES`.
> +        // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_=
NUM_PAGES`.

Can this just be `tx < MSGQ_NUM_PAGES`?

>          let (before_tx, after_tx) =3D gsp_mem.cpuq.msgq.data.split_at_mu=
t(tx);
> =20
>          if rx <=3D tx {
> @@ -257,7 +259,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result=
<Self> {
>          // - We will only access the driver-owned part of the shared mem=
ory.
>          // - Per the safety statement of the function, no concurrent acc=
ess will be performed.
>          let gsp_mem =3D &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
> -        // PANIC: per the invariant of `cpu_read_ptr`, `xx` is `<=3D MSG=
Q_NUM_PAGES`.
> +        // PANIC: per the invariant of `cpu_read_ptr`, `rx` is `< MSGQ_N=
UM_PAGES`.
>          let (before_rx, after_rx) =3D gsp_mem.gspq.msgq.data.split_at(rx=
);
> =20
>          match tx.cmp(&rx) {
> @@ -315,7 +317,7 @@ fn allocate_command(&mut self, size: usize) -> Result=
<GspCommand<'_>> {
>      //
>      // # Invariants
>      //
> -    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
> +    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inc=
lusive.

I wonder if this can be `is within 0..MSGQ_NUM_PAGES`. What do others think=
?

Best,
Gary

>      fn gsp_write_ptr(&self) -> u32 {
>          let gsp_mem =3D self.0.start_ptr();
> =20
> @@ -329,7 +331,7 @@ fn gsp_write_ptr(&self) -> u32 {
>      //
>      // # Invariants
>      //
> -    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
> +    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inc=
lusive.
>      fn gsp_read_ptr(&self) -> u32 {
>          let gsp_mem =3D self.0.start_ptr();
> =20
> @@ -343,7 +345,7 @@ fn gsp_read_ptr(&self) -> u32 {
>      //
>      // # Invariants
>      //
> -    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
> +    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inc=
lusive.
>      fn cpu_read_ptr(&self) -> u32 {
>          let gsp_mem =3D self.0.start_ptr();
> =20
> @@ -372,7 +374,7 @@ fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
>      //
>      // # Invariants
>      //
> -    // - The returned value is between `0` and `MSGQ_NUM_PAGES`.
> +    // - The returned value is between `0` and `MSGQ_NUM_PAGES - 1`, inc=
lusive.
>      fn cpu_write_ptr(&self) -> u32 {
>          let gsp_mem =3D self.0.start_ptr();
> =20

