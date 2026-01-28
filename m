Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMc1I3Ajemmv2wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:55:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4201A353E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C54610E0CC;
	Wed, 28 Jan 2026 14:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cxLrK5/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012007.outbound.protection.outlook.com [40.107.209.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7B410E0CC
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 14:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EozaMKqOFlPa655VTYyVuEyQa3+eATG969HOKvdyFpi/10D3TOIu8VkcxW+CbHg0D/jAob2Pi0WXAS7BPqTQy+FK+1I5bgGwu52gmzSSFMua9SD0FoVCvJdUzQpIgrmKOEj0lpA8GDxBnxUCVDONXFeqZMzK+HTUBJPOLgA6dY2EVnlVoqXfq/2ErgLQxZJbBNa57r/fDE5vZRqdf8HJ0+iMDklUbTMyFIFGAgJCMWc/jZPV1nVjaT4yob+1NlTkOIFbo6QajgD0P9g7EYPia2uz9n3ks5dIihhcMIjFtkj4k0XQ4K718WDP6PXb5l6unjdzMMzHyX6ge4yh5y3YVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9i6KiyrJmFNa+NhyVH4DymkZamZdU1+jPhXy5n69R0=;
 b=Pv6kI5VDF+3P9rFqKSXpf6mQGpyv8fSfrnkGKvkGFFjxed6NpSPSE0E/EP+wnlk2aw8b+wO8r4VMNUTvrM2nWkbYcOYw1+HT226+iadyDt7VGvEmC8NHN6h+tFzd1r+C/TT1+xwF83+jIzwt7phynZ2+FFuX2K0o2g2XtjAEScjwouuuGaenOMbWZkjd9cVX/f3wgBXHko50qiyTKMzWOLES+q8/7cm1eP3uiN3f6SJKrod1a0bOeYjHhZBWbtERrPJnzMVNhDqX+9gI32+wSqxISM4/keXFj3s4mFMRbX1cxXlOm6gM+98sVCHnvrd658qED8TXWA/xnbXL5rUYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9i6KiyrJmFNa+NhyVH4DymkZamZdU1+jPhXy5n69R0=;
 b=cxLrK5/u2WXfHU3AnvJ6vewhqUi3VKGWdQ8usPvHoZDLNCN2RjcHu1MHbQ+JXyVBmEQ8WTw3URGK411s625P/kGzhlZ2Gjz5dl38ilVP3/eSqssbUaCLrL3gNqubLBCBaVmsrEBLfrJ39xiWtTwZA6X8Mz7rQe8cj0eEwqFhH89cSyWnTk2QX6WUf/dPpZ74JdlDqynRrPF1t/nxaNCevrDpWoPUoDPyA+HK7wp8k9tKO0iq2IL52aNGG9TmxbMgyov5xJKqgPtw96SjRpYenal03OMmgGfjS9M9bMblgOkQ1gRT0+D9qnrNZ+HtIy+K6u9HEWwYF/BgD4TQR73Q/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5789.namprd12.prod.outlook.com (2603:10b6:8:74::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 14:55:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 14:55:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 23:55:26 +0900
Message-Id: <DG0B57YUZ10G.3KRQYI3MGPXRJ@nvidia.com>
To: "pengfuyuan" <pengfuyuan@kylinos.cn>
Cc: "Thomas Zimmermann" <tzimmermann@suse.de>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Helge Deller" <deller@gmx.de>, "Hans de Goede" <hansg@kernel.org>, "Lee
 Jones" <lee@kernel.org>, "Sam Ravnborg" <sam@ravnborg.org>, "Zsolt Kajtar"
 <soci@c64.rulez.org>, =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?=
 <ville.syrjala@linux.intel.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v1 v1 0/4] [RUST] Framebuffer driver support
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260126081744.781392-1-pengfuyuan@kylinos.cn>
 <ed48e82a-cb94-477f-83c4-b2d87ae3cde6@suse.de>
 <DFYG7MT5JINY.1T8ZZ4ASIWXU@nvidia.com> <20260127080419.GA965382@peng>
In-Reply-To: <20260127080419.GA965382@peng>
X-ClientProxiedBy: OS0P286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 917cc656-162b-4e6f-09e0-08de5e7d47da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDdUQUZ2a2w5TXdaSU5jQ0xic1hpTjB0V1RtRlpZbVlCVzRhejJ2aWROUEo4?=
 =?utf-8?B?MGU0clFNOXVCMUM0RndKYzlUa1U3eVNaTGg4bTVkczBXUTFJbTdtcWJXRWFN?=
 =?utf-8?B?OGY2RktlMW9DRjlDUGpjL3hIT2ZNcHR0UUM2V2JJdDB6bW9MSlZIbHZDOTlR?=
 =?utf-8?B?eWtndGdxbFRTNWxMMDVYMGJvRnF5T2w4M3J0dzlNQjdDTE52dHpmZUJUN2xP?=
 =?utf-8?B?Sit0OGFvMWJ5dUEvRW8xT2tqMUd4b00zMkozMThkenNNYjRQUGxTVmwzWHZH?=
 =?utf-8?B?eXgwY2RTUVVEL1hubHpGbXpYQzZxTDZzMWl5ZHk2TWNKQkJ1NUlTSjlZQm9F?=
 =?utf-8?B?LzJaL3lSU0d1Tm9xWlhyQm43eTNMNy9jR0Eycnp6cDRkTnk3QzhZbUFwU255?=
 =?utf-8?B?Qy9TbXdxUWM4Wk9WcWtnV01ZNHZ1S2hWNTNia2g3bHhqbU5pWVJ3YVJSbE03?=
 =?utf-8?B?bEUrNnZVMjhPVG9wcmQxVlE1bFF1c1NyNUhzRUZjcTllQjliZnRUcVpIVHFq?=
 =?utf-8?B?MUUvU2hBR2gwbHAyT1FmQnM3eXZmSUljb3FESEx6Y3BFVDJsVURSSXZCQlJE?=
 =?utf-8?B?TGY1bi95OW9PWXFRd2RvOXEvbFRTeG95UG00V1hFeGRqNmV3NjMySC9iY1kv?=
 =?utf-8?B?T2JZdFdxU211cUxzMHpNSTUwNE1HSjhZM1FFYmZhRU9QdC9Wa2Jjc1huNzJz?=
 =?utf-8?B?QmdubjZXbDlRSk51eGRZTXhjWnZFRThuckZJTHlrTndWNDZPclB4aDZhaWhP?=
 =?utf-8?B?RHJuUjliTXpOVjFMcmdmdG9FcjZEVlJUdG93R0liME9DR01Cc21GcFlNZ2hN?=
 =?utf-8?B?Ri9JNHBSa1F6MVhrVlc4emk4THB5QzB1ZmZ1bitEY0MzR1djRVo3MnJsM2dZ?=
 =?utf-8?B?YVljVnNnUGNQT3BJbWpack9UK1JPcStIV2Ird3BJZ2tPelNHZTBUZUYrUGNy?=
 =?utf-8?B?YW9GbUs4SXpKZ21GTHljZHR6Y3lNNjFwWGQ3QWFDRFptNnUvYjlHbHdlMTlY?=
 =?utf-8?B?ek04elRqTXM4ckM1R2tXdXN1eW9Uc1p0RmhTQkJNVEFrWDhFV0tPcVdQZWhB?=
 =?utf-8?B?TENFV3FZRm5Qc241NlM1cG9BaitkNGl2MjlCcktiOXJJQnlkQ21TRHRoNjBP?=
 =?utf-8?B?ZDJlL2gxWWt1NG9HYVBma0NpcEVhWHlmZlIyRUtuOGRxSWkzT1djQlhFVUNq?=
 =?utf-8?B?alZzNitNVW9vQVdVZXhaTDd1S0xPK29GWWZOSWthdlNOWVZvWndxakFjSnR3?=
 =?utf-8?B?K21JYUNhQVRxdm05L3dZQk9jUGRKL0JnVy9EdUtqejdFeitxUFV6UWxCT3J5?=
 =?utf-8?B?QmxadVBQT2lPVkdxd1o5UlVpT1IveHlBR05YbUtteS8wakN1OWJYd1N4S04r?=
 =?utf-8?B?cUZ4Syt3dGhKbVpWbEQ3elhSNDhOMzIxbGU5d2VibUtvQzBFVFBzRnVVN3BV?=
 =?utf-8?B?WDQzVWpQZFV3d0pLYjA3c01sSkZYQ1U2TGNLQWp5NDFDb3FML2E1NkpXMllG?=
 =?utf-8?B?Uy9BTGZlbmNsSWlLZnlQQ2dIYUFROXh1ZWpMdVNlMDl6SmhkejlpUGlid0th?=
 =?utf-8?B?VHoreVd0dHkyaXQ1dDNlMjlnSDJIcmFpb1hUK3QrRTFtREh2Wm5zaFNSd3RR?=
 =?utf-8?B?RkloTlFVeUMxNHBVbHBSU2F6QnFhTlQvTWx0Nzc3OHlKQ1Y4d281TjFlSndM?=
 =?utf-8?B?TUM1SXNxMjhJenVOdnE3aVJUTDI1VWVraFdaZE1ITjhpY0dML2hqY2N5M0s0?=
 =?utf-8?B?YituWVM4Z3haaUxTVGp1ek9KbndvZFlwdU1TUVZ2VS9ITXhLNUg3UjdRb0Vh?=
 =?utf-8?B?N1JpeFpVQTljSjNEVkVEVmpkS0RWT1pqTXVYUGt3MHpXNHJjZjJRTW1VSE5y?=
 =?utf-8?B?SVpHQVIzcEE5VU95Ky9tNC9YQUhwaUFvNWFTOXdPYW4yRDJxRGFlRndzb3hj?=
 =?utf-8?B?WmtYWlhqQ1JjMldpd3ZkQ3M5Z1RibVFzVXRaRW5HeUZWbzhzcHNTV2E5RThm?=
 =?utf-8?B?OEpYQ0NJZWJzaEtRclNITWE5K1BkUjc1MldONXFuV0ZXeUdNNGRPbndWeDRT?=
 =?utf-8?B?OEZ2Rm01OXUyUjZza3VWY1pKSklrb3RNQUoxbWhSaTUrT2p3NURQRHB5dVB0?=
 =?utf-8?Q?/tLw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3VoRXBucVFhTGhOOGJFQSs1YVdOR1o2S1JXYlVsd2orbUF5aHEwSnVQYWZS?=
 =?utf-8?B?QnNIblZZOStJRFhXb1B1d0k3RWs2L092UURQQlZteCs0eC9jWjNVK0wvcnJu?=
 =?utf-8?B?aFp3WnZPQ2p6UlF5REhrOUZtZWUrWEova1JNQk9jeUwyVzV3OGJKT3VJb0Fj?=
 =?utf-8?B?L0tsbGNaVm0xLzJLOXlyTTBnd3QrVUdocmRtUjVJYUZSRUQ2U2xLNE9Yc05q?=
 =?utf-8?B?bjJvc2tOcUVSSUhKNnQrSk5oZExlS29rTjRYS2dnK1R5bURLQjA0WXE4MVMz?=
 =?utf-8?B?TlpkaWRWNzIyZ3ZxeEt0dGlxMjNCUmFwbDJINnUwMkNja3FwTk5Kc2QxcXgw?=
 =?utf-8?B?NmNBbUlxQXZkWUhHcTR0YkJrT0c4UFlKR2VsT3BkZlI2UFBsdW1HTG1vYTVR?=
 =?utf-8?B?SGtEMEI2QkhXeDMzZUZJK2hNQi9KTjZXZ3pFaDhjYXFjVHZ2Y3V2eFVObFhM?=
 =?utf-8?B?ZWYzakJicm1teGNuQi9RMTJUUTU0bVhJb2VqVG5xNmN5MWFKVWZrR0lwZ2JM?=
 =?utf-8?B?b0JZaVc0bk5hcW5hbEoxUzRRS29JclNSSWVmVkVEMkZmOVU4dWNkMjBKNW54?=
 =?utf-8?B?VWxzbmVvU3ZFbDRxVU1ITHhCQmh1ZGx5TTE4V2hjNVV2WmNiNUw2VzRkZ0pM?=
 =?utf-8?B?Rlp0ZXRLRkxTUWxEcDR3ckFFUVR0RFoxMnVPVWxNZlNUOVZ0bTdJaUpPUFRX?=
 =?utf-8?B?bldoN1pYWVVQb0h0V2dQaWt3ZDA2b25JUGw2NmJ0YTQ0T1orTlVRSE9kV2FX?=
 =?utf-8?B?NENtc0RwYXZxRTByTWphNWQ2L2R0M01ENGVnd0hmeTh1dXlaeU9wMGJBZ0Fo?=
 =?utf-8?B?RGtta2Q5L2xzdUdDZ0lFOE5FVVhVYlZEUys5WGdLY2lPd1BqRTRpRUV2N1FZ?=
 =?utf-8?B?S2ZkZ1ZUY3JEVnZJc3JGN1lmWEE0SUVQUlRvbWxrQUs2Y2JTWnY0NUJaaGFx?=
 =?utf-8?B?NEFRQW1BUUoycERaZERiU1IyOHdZOUwrUWpXV1dla3JmZjJnRmhTTndORHB3?=
 =?utf-8?B?VGFuMlVLTnVzZFNLU0ZEb3NadHduRm1vcjdBWENlK3lIWFZYSzBlTVZ3TGlm?=
 =?utf-8?B?blNVMVorekVhR1hoRTd3aXp0VnJqVTFuQThsZlR2SmF1ZE1WaVJVdWdCeGpZ?=
 =?utf-8?B?SXF6TXNoRm5kNTFkOXFnSnhzeXlsa2lPQzRlZ25VVjBUZVZwWEdCL2w2OXkz?=
 =?utf-8?B?Z1VJaHI0QXRtMmtmZXV3ZHpvb1ZPYjliM0F1cmlLMGFDQzVPNWx2Y2t2YVRQ?=
 =?utf-8?B?ajlyU3lqL1N2RDVNNkR5eTlYNHNUcnR3MmhVa1lJQkxiaGt0SW1FTTl2NEtq?=
 =?utf-8?B?dXJGZzcrdStPbGEzTnNIKzh1WWEwMmpyLzArYWpGZklOdVB4SUZHQ0pnQWNC?=
 =?utf-8?B?UDI2SXp0VWVGOElQdklqcW9udU1nVHdGWFRManhwdDVORGRLek0vSE9zZmRj?=
 =?utf-8?B?anNCd2M1UG9jTWg4YnNwQ1ZNbEltZFZRTXZ1VkVYN01MZjZSZml5QUlZMVM5?=
 =?utf-8?B?UWk4WTkvZjdYcGJ5K3cyODdET1R3Rk5FTXdqMlFRRk9uU1lCbFNLdUo4UllG?=
 =?utf-8?B?MCtMeDA2cXloaUJwOFFMNXJTeW96SU9WUHNjMVNKUFZQcXdaVG9rRWRYSXlE?=
 =?utf-8?B?UCtzbk9razcySVV4ejRseE51YXhvemlyYlU0VDgwcXpUUnlBRndEeFFNRUZD?=
 =?utf-8?B?OGNzclFPaXkwZnZCb3A5OFEzQWJjakNrbEFpUWhXUEpHWUdWWjcxTVFyUzhB?=
 =?utf-8?B?V2hkRWZYM3p3LzlDbDhTcUFIM3ZwdmJkQmR0SDVpRmU2QjBHcjZXMldGRVl5?=
 =?utf-8?B?eFdzWjhESVlpSElJSDNGK2l3UlFhVTFoSjU2Tmt0bndqRm9iZjFadUQrdnFx?=
 =?utf-8?B?UjRHUEZZZHdBSEM3c2NzU2lGVFFKWXV6Ym92NW9xdFF2UWRiNkt2UkgrM0dz?=
 =?utf-8?B?azNWb2VOd0hXelJ4dEhtNFh3MkFERlAwYjNuY3RBWVlTYXJjMEFLTG1DZ1Vs?=
 =?utf-8?B?NCtrdVpocmYzZnNqTXE5RUppVWVlY0F1cmZOUDd6MkRzYWJTMzN5UEM1YW9S?=
 =?utf-8?B?UVN4WE44Z0tKNWtsYURKa2ZtUlEzNkxDTy85QktjOTRQVGNkSk1ZWTgxNGc0?=
 =?utf-8?B?N3RiWTBFdlVrUkdpcmFRa21pTGFCOWkwbTEwT1BrVFRSd3duOWlXZERMT1N1?=
 =?utf-8?B?TlhaTkVaejNpTmlTdE40ckVmMGRvY29EVUNWU2t2K0JHWjZqUTEvNEphL0Jv?=
 =?utf-8?B?aTBxWkxYRmR5UjcwbUlUUnp6dk1NdEtMcXJaWG9RdmRiQjVjTlJ6YWNsL2xP?=
 =?utf-8?B?eTQzQ0xNL0FDVThFQXAreXQvMndaN1h1OFlXaHJNNFBiSkFzU3dudE9iNVpu?=
 =?utf-8?Q?eCRWhgpXgG3sJcL8Ew0lrLo5GSo4ynh3n/oSnhbvd6qG4?=
X-MS-Exchange-AntiSpam-MessageData-1: licrNvTJpVAVmQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917cc656-162b-4e6f-09e0-08de5e7d47da
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:55:30.4429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4baOsnomTGJnUscOu46omdHdoGJR+F8VXYDOyE6waJ8MyJGCNhQH2RSGU9fZGDNnQ/m2h34IsRxQ5JOA/p9IgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5789
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:pengfuyuan@kylinos.cn,m:tzimmermann@suse.de,m:dakr@kernel.org,m:aliceryhl@google.com,m:daniel.almeida@collabora.com,m:ojeda@kernel.org,m:boqun.feng@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:deller@gmx.de,m:hansg@kernel.org,m:lee@kernel.org,m:sam@ravnborg.org,m:soci@c64.rulez.org,m:ville.syrjala@linux.intel.com,m:rust-for-linux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,google.com,collabora.com,gmail.com,garyguo.net,protonmail.com,umich.edu,linuxfoundation.org,ffwll.ch,gmx.de,ravnborg.org,c64.rulez.org,linux.intel.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: D4201A353E
X-Rspamd-Action: no action

On Tue Jan 27, 2026 at 5:04 PM JST, pengfuyuan wrote:
> On Mon, Jan 26, 2026 at 07:28:21PM +0900, Alexandre Courbot wrote:
>> On Mon Jan 26, 2026 at 7:01 PM JST, Thomas Zimmermann wrote:
>> > Hi
>> >
>> > Am 26.01.26 um 09:17 schrieb pengfuyuan:
>> >> This patch series adds Rust bindings and safe abstractions for the Li=
nux
>> >> framebuffer subsystem, enabling framebuffer drivers to be implemented=
 in Rust.
>> >
>> > The framebuffer subsystem is obsolete and has been deprecated for a=20
>> > decade. No new drivers accepted. Anything that really wants fbdev=20
>> > already has a driver. Can we please let it die?
>>=20
>> This, and the patchset is also obviously AI-generated.
>
> Hi,
> Thank you for the feedback.
> I=E2=80=99d like to be clear about how I used AI in this work:
>
> 1.Cover letter =E2=80=93 Yes, I used AI to help summarize and phrase the =
cover letter.
> 2.Comments in the code =E2=80=93 Some comments were written or refined wi=
th AI assistance.
> 3.Learning the codebase =E2=80=93 When reading and understanding existing=
 Rust-for-Linux code (including DRM and other abstractions), I used AI as a=
 helper to analyze and explain structure and patterns.
> 4.Writing the code =E2=80=93 The implementation was not fully generated b=
y AI.  I wrote the code myself and used AI mainly to look up existing abstr=
actions, traits, and APIs (e.g. =E2=80=9Chow does X work? =E2=80=9D, =E2=80=
=9Cwhat=E2=80=99s the right trait for Y?=E2=80=9D)  while I was coding.
>
> So: AI was used for summaries, comments, learning, and looking things up;=
  the logic and structure of the code are mine, and I take responsibility f=
or them.
> If you have concerns about specific parts (e.g. wording, style, or design=
), I=E2=80=99m happy to rework those patches or to adjust how I describe to=
ol use in future submissions.

Appreciate the clarification. One piece of feedback if I may.

The cover letter is the first thing reviewers see of your patchset. If
it reads like impersonal, mechanically exhaustive generic AI slop full
of bullet points that doesn't follow kernel conventions, reviewers will
assume the rest of the patchset is of the same caliber and discard it as
something entirely generated by a bot.

A patch is not only the code. Comments and commit logs are as important
and should be given the same care. This patchset is a great illustration
of how AI completely misses the point: it will write 5 dreadful
paragraphs explaining *what* it did, but what reviewers want is one
sentence that explains *why*.

If your use of AI for the commit logs and comments is motivated by a
lack of confidence in your English, how about this: write them in your
native language and ask AI to translate it for you. That's something
LLMs actually shine at (that, and using them to learn about a codebase),
and the translated result will still carry the flow you intended, as
well as your own touch.

In other words, make sure that the AI assists you, as opposed to you
assisting the AI.

Hope this helps. Looking forward to your future submissions.
