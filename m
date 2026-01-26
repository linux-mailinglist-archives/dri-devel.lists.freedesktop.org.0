Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJZSA+Gxd2l2kQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:26:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 760948C117
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C884B10E45E;
	Mon, 26 Jan 2026 18:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="BUMAQk0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO3P265CU004.outbound.protection.outlook.com
 (mail-uksouthazon11020107.outbound.protection.outlook.com [52.101.196.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C9910E463;
 Mon, 26 Jan 2026 18:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVJJG4VBE6FfvEGI5+0GEybmLiimfVhxm44Cy9wkJ5LoFOXRECv5YKDN7Rgy+OyshwAppCVBmWPo5ykgqWC6JcJbTC8LBT8OOGbZM20UJIWyJaJsf5v1swfzAhL0otMvv1gguyC8HCsP2fXAya/YmBxKVmxCMF+ljUDrfWsNoLfhuLupxFZTuy/o5fPgf0w+eUqbg8wDz0FWYnmTW9dT4+ePoUy3Qe4ygmwpAxtL9OdaAIQRdnhfZGDavaxG9fcOWio1Mfxbk7ndlz8ok6YjNnTky4o/FZYMUJTJrSd399IubAGc0jGuIvbc9hEDyBQyC0YGb2IB0rTePSrUVEvpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+sP9wCqx1RU4ehZBnIoQ54nrEhK0Y4RjQOJ9mOCds8=;
 b=S/HuAYWfOsDIZds3wOR+qlzug8OPFuS4kaYcbYo/uJjXYpSWxhKl6bacs9wQbt4kjV/D709x5Am/YSUcP2Wk+z/J5PCrBZuTJc9Vw4CesXmXlJzfKQAiD5yJtBwDW72pKd5OiVTpOhxK4CqyyK6Yd1K33Y2dhHv4bXMe0oVhLudr0M+s8mKfqWtfJMihnU9Dxj80q6CZ/2GWY691ErF5zKWB1D2rHJdoHulW0ebRnizZzIJULUcOoFZsqXZsjSzW0R7HczaiiP7qj6RfURZUrKjLdpaey4Kiok8jyuJu37843YPOssk6sF36/OOU3la7rV4r3ZsZPKN0hne6ZE0yvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+sP9wCqx1RU4ehZBnIoQ54nrEhK0Y4RjQOJ9mOCds8=;
 b=BUMAQk0xbAxbKszSpIcyvMWooQqVl6hHdOz2UBwORIsREf4VYyqQIxsqQCIZ1bIQ928i7OusBj8mnENenhDRFjoJ2fvjF8wy846k3NQ4pCibZ7HTSfExy0BrsGTtcM4x6z0caAD9UV9LyuVLLz6hzshsM/rRga7CrPLPyk6gfU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO4P265MB6795.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 18:26:33 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 18:26:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 18:26:33 +0000
Message-Id: <DFYQDRTTNQ4J.7DS0PAZQZ7XV@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] gpu: nova-core: gsp: fix improper handling of
 empty slot in cmdq
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>
X-Mailer: aerc 0.21.0
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-3-e797ec1b714c@nvidia.com>
In-Reply-To: <20260123-nova-core-cmdq1-v2-3-e797ec1b714c@nvidia.com>
X-ClientProxiedBy: LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::17) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO4P265MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de4a390-1211-4c38-fa0f-08de5d086f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXVXdEZUZC94SFFhdThhV1djTjlxOXNid2FVbzhUOHZwbk9KSndSVnFvWk9X?=
 =?utf-8?B?WkMvSFlmbmdRVXNQRFFsWHNXaDZIYlFFbytFU3pUeXpkNVJrUGxtNXh1WFl2?=
 =?utf-8?B?NURmaXBRR3daYTkxSitVL3VtNjJtbGVldnpqNVlLTldjUkRQMWxUeDhPN2Fs?=
 =?utf-8?B?Ym90a1o0c0pLSXRjaFpsYWUzVmMwcWhKaWNGcFkxNnlZajJGWjhxSkZIaW1h?=
 =?utf-8?B?S0crb2taU1d1Z1YxYXkyNys0MnYvWDhFRjQ3WXlQK2ROR25mTUo1aENaMkZV?=
 =?utf-8?B?OHlTeTR3STUzdzNmeDVBUDUwMEJuVGI0Q2dNYW1zdUlEUnhEaTJhSXQ4MUlR?=
 =?utf-8?B?bFJFejFWdlVRem9HeWswUkZCaXdveS9uQXVXU2ViWmN6YlJ2RHhzdVZtUVpB?=
 =?utf-8?B?K3FwRjI5Vm1OekJGUGNUakR2R2xHT3Z1QzA0Ym9WVWd1dTY4bjJZaXNsSUFw?=
 =?utf-8?B?djMveUJOOW50d0JEU1RsN2QwY25WNGtqMkpuOXdYWkJtaG5tQzlEbTExSW45?=
 =?utf-8?B?RjBTcE5pbGcvcFVSVkZxdkxWclZqa3QzWE55cUhvVDNRZVdDcWdkdm5mNUx0?=
 =?utf-8?B?QWlCZTNWTkFqQTRPaGZha0tqOS9QMGFFY2J4OGE4cTN1WjJEc2RYSGFBbWxM?=
 =?utf-8?B?N2V1Z3NHT0lPYTUrT1crdW1PTGFzai9ac2ovN21zN0pNNWF1aVoyS0pIWTJ1?=
 =?utf-8?B?UkpQaW45NnBUSGpvSkRzaUt2WGV0d0ZWcytUZGNwS0JKdTZzeGI2Q1cwSURJ?=
 =?utf-8?B?S1hwRHhpdHRRdmNnTi8vSHBBQ0lXRUNxNCtxSGhxc29CRDRnTnVQTGxRdUg3?=
 =?utf-8?B?eG42WEhPVVFsb0RJK0s5SlRXQmI4bGhocS9CSExCWnh0NWtYRXlBUSswdEJ1?=
 =?utf-8?B?aTRGL2tWT1UwMTB6TzViMmRYT0pMZjVLVERDWDBmZnNkOUVrRy9WR2pSVStp?=
 =?utf-8?B?QkpoYkNJSzVlZ1ZUdkNjWis3ZFZsZTN3U2l3a3NzWUJHTUNXZ3ViK3g3U3RV?=
 =?utf-8?B?V0krdmVGQjRxMlVmOWtnSmduMnBpbGx0SUxYRGU4SEgzakxDMC9NK1RiSVVV?=
 =?utf-8?B?NSt1TVpYbWExb1pVUW1mSFp1TXcxRHRCRFBGRm9WM0dXU29jRFVmcXFVVG9H?=
 =?utf-8?B?bmVUUlRwS2tUZUhFVGwzTTFpemdYZTVSbmplVTBpWWhPUVphV2p1L2c2dVN6?=
 =?utf-8?B?UU41SU8rbVp5SThWSkZIeXFHeGVsMk1XdVZJZExheTk0MisrdWFnNk9Lb3Rx?=
 =?utf-8?B?YUtrZDcwaVhJZ1UvUGd2VmR0c3NaeWlTY2FVbXlvU0gwdTZlbHJPWTgwdDZi?=
 =?utf-8?B?V05zejhzaDNBL2FoVXBBK2pvcUtpaEJpMGNxajVZNkt4V3NMeFZHYnU0dTFt?=
 =?utf-8?B?YVdxVE01MWYrZkZHN25wMXp0OXFxTENDVXVDRmd6ZEY5OE1RenZ6b0g4QXUv?=
 =?utf-8?B?dngrc2cvREM5SWZDc0FvNVgrK2xqRnc4ODM3THlZcFg5K1dMOERsSElCVVdx?=
 =?utf-8?B?SWVzNXNJUEJiSFZKd05mVFBXRzZiUmZIUFhZaGo4SE9kMEd2Tk5OY0xOYWVY?=
 =?utf-8?B?bHIxRnNVdlg5VC9MRHBObmNzeWU1a0JpR1B5WHdPNmJoS2wrd2VzdmYyQ0RB?=
 =?utf-8?B?dHBWSml6Y0pUOC9DSGJyazZPUFY3Zis4TitEZ1Z3cmxtSzN0cFdqT1E3cmdR?=
 =?utf-8?B?QVFkRUtFenU2VTVEU3k3Z21WSDZFSlNKTWNpb3NJNkFTQVd6TGFZUHM2dTJD?=
 =?utf-8?B?Vi93OExtSkRhR2dVZ0xlL1ZmSUw2NFdNcDlnTm9hMEVxRVB1bDZnQ0RtREZC?=
 =?utf-8?B?OHNzZWtVVTNNN2YwUWpTcVU0dlg4VzlxaXBVUi9yWmgyRlhXSitYb3MvSFlO?=
 =?utf-8?B?T0w4dWZBT3NpNjdvRnNIRXAzNDJPZGgrU2tqSWJ2aXhRVW84dENHWlRlQjcr?=
 =?utf-8?B?d0tEUDZ2ekZ5YU5ZUnRZMmZJMk5VR0pYZ0Q0YzhDSFlocWp2eXl3MUxXYlVC?=
 =?utf-8?B?dXp4UEpRai9tWGxQamZrN3Q1NWNKYWFHSnkwN1RnNWpZRkV4S3BTN3hOdWZT?=
 =?utf-8?B?ZlNqYVdvZ1ZvLzFwYlFKbXhlNUd5QUFoc0pDVkFHb2RFa1N5RCtjSDd4VlNt?=
 =?utf-8?Q?Xm4U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU1uQTAyTFFmcnNmbTZYOTYwRkt6a0o4Y1ZWZWJLV3ZZY3B2VEFMVUhqTHdl?=
 =?utf-8?B?RVNNbzRxS2Z6R2l4c0QxVmhPZ1dPamdFaGF5SzJ5enFvbUcrWDh0dGIvai9M?=
 =?utf-8?B?NWVTTktKSkRSRkt6YVJUdWtteFBaK2VuTzA1TzdxRG5wM0ZDZEVObHJ1NTM5?=
 =?utf-8?B?MDhzemxmelErMHJuWmd0cGtMNThxRmZTMmNyZndIWmxmRmswWDFLeWVJamlF?=
 =?utf-8?B?dlNFR1ZMZFAwekxWZWF6eWdkbk9oZXRnL3pzaWhXYmQ5ZTVqOXRaZ085U0Zn?=
 =?utf-8?B?dnR6UEF3TzhiU0NxWjFZbDg0bGZSa09JU2xoNkRRSk1yeHFaM3FlVHdhWEVx?=
 =?utf-8?B?bDgweTF5ekFpU0dwQjNKRWtiVkVEcjYxVG5hTGJCOTBmNlNEemRteE1CbGRK?=
 =?utf-8?B?cmo0SWR2R0tCL0NLeXFISVgrZmwrYTl2TVJHWlZvenI0QlZ6TjhlNUp4bHZ0?=
 =?utf-8?B?bVpQcS9uSEYrMXV4bmNUWjlZTnhOU1pwWkZoV01JVE50cHFRNkhIZ1dVT3hY?=
 =?utf-8?B?ek9qK0RtN3VON2xNT1lndmJQV1U5emxSN0J1N3JTRFBGbFJjSGg3WWhESEFo?=
 =?utf-8?B?cU5xT1EwNzJUUm1wdkppLzQzZ2pGL1ZrNXNyTGlXbHl5THZ5VW5KNzFwYzFy?=
 =?utf-8?B?NnYvMloxN3pmc05Ndm9oSzdlNnFUZ0lnaFFXYVViRHlsQ3NFRU81TDFhU0ky?=
 =?utf-8?B?dXlKL2tTaTNIcDJMSW8vSExxWk0raEYvdExlYVhNQTBLZm5Rb0dFYmtUaWl2?=
 =?utf-8?B?ejdiZmdYcWRLMDRxUjFiT2hGeVlVZDFtbVN6RTFpMTd3SXhrSnQ4c1JtV245?=
 =?utf-8?B?VjdacVdwNmZ2aXJsNllGQ29kbUtmekd5c2tvYmNDamhqdmpLR1NTdFdXWnBX?=
 =?utf-8?B?a2h6VlYvY08rZy94ZDFhai85WnVla1E5cm5XdlA2UUtQSU1BYzR0dzBJam1Y?=
 =?utf-8?B?MFdTVmpFdVFBRTE0cE85TndZMkFXZ0xjZjlqU0ZUVC82b2VLeWZzMFNBWnI2?=
 =?utf-8?B?SjNuUEVVQ0pwNHpmeGd6VlhBN25OM1VDdWplNVMvelFRUkVtb0s4RjhVQTN5?=
 =?utf-8?B?TkJHVVI1R2pyTm8zQysyaGllWDRhajRNU0o4cjF6LzQ3Vk9wY21RMUJkalp3?=
 =?utf-8?B?WHdvd0VKa2dybGE3eWplcFJzam9vQ0ZXR3hYRlVnN1RpaWIyVjdvelB6Q2dw?=
 =?utf-8?B?TjlMSGJZUzZYcitqc09tWCtLbDV5c3F2TWJvb2pKbkM0dkltMnE2c0ZrYnls?=
 =?utf-8?B?MFZLRzR5R0VVaGZnalhRKzZENElGSEpmRVpZZDRRd0g3RFpiS0NOUUF1QVVm?=
 =?utf-8?B?bXJaUTVMR2FDNklJUWZSL21leEJteUhKQVl1a0JiRDVrSEg3M1JoYU9PMldz?=
 =?utf-8?B?Z0xCK2lkUzdCNW5VSkNRV212WG53L25aZGpFYnhCOWtSQjJUM0M0V0VIOEp1?=
 =?utf-8?B?anhsY0hJc3V5Yjd4ZWxFeGplTXBqSEdsUUZGTzFxbmFjTUNCOWFwN0dTUXBx?=
 =?utf-8?B?NjhtNTVoL2J2UWNqZ0Z1T2VrN1pYaTJLYks3bXlnUDlMekZ0TXNmS0JDSDZt?=
 =?utf-8?B?aUdZNS9NSUhHTGdOVkxuMnpMK1krQlRwQUR6cHFYQzhPMGFnL1FIY3Vtbkln?=
 =?utf-8?B?cjRmZ2ZtS1h3eXFHSUxtR0pMckloVDFWSnN2VlZVMmhzL1BSTjU0bHZ4MitB?=
 =?utf-8?B?UVU0ck51SmduZktLTnhPNlJqcmJXQnQ4ZFh3VTJLVVdRN3gyTFk0ZHgyUWFZ?=
 =?utf-8?B?R3h6V0RtamN3cFJ1NUU2OW9pTmdxODN2MUNvWGJKK2V1MHlNTThRNzNveFp0?=
 =?utf-8?B?RFFhTnZvNHVkVXZBcWJqcFovS0JIQlFNMGYxdmt2am9NV25hZmRqbWpacGZN?=
 =?utf-8?B?N2t5Q0Zxb0tRVU0zSW5MKzZIODRoN3JFTHFWc3VBZkJZdVBKdWpFVGZITUJD?=
 =?utf-8?B?UVRZRWV2eU9xYlN4a0w0d1VJaitYbGFCVE5wcWNwUHU2TU5LNWlyY0x0dzF0?=
 =?utf-8?B?TG1OYXR5SGR4ZURac0pKWEFRdVcwbEp5aUs5QyszYndiRHJyNy9GMkVmYTNV?=
 =?utf-8?B?V1RncTFWcUVuV2pLaElDaFpUd2prQ0N5YXM4WEhUdzBndU9pTVdXWmpQS2F5?=
 =?utf-8?B?UHdrRW9tOEZTUWgrM01pSkN5RlJ0Lzk5ajI2WTdxVGtGUDlBYWlTWmo2UXpo?=
 =?utf-8?B?RGVXK2RKOXk5L2M5NHVOOUxvdkZ0YnkybTB2aEZFUGhzeXZyVFFXQnV0ZnI3?=
 =?utf-8?B?WlZOVzExbEcwTmFjQVplSnRrSTZIMU9rdnJlUGluSTE1ajQ0V1FoeEVneWd2?=
 =?utf-8?B?OEJWZ1ZRalBIM3hVTnhhNmhCb2tGWisvbC9iYmNJY2JwMjZ1VW5RUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de4a390-1211-4c38-fa0f-08de5d086f07
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:26:33.7829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OLf4eFu9U/C3plUbVU8otUVFv+vAlIRPXgpUnePJ+sz61jf5Pg/xBEUHTTrqPJyLY1fFAiztLuuvqMxKVRJmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6795
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 760948C117
X-Rspamd-Action: no action

On Fri Jan 23, 2026 at 12:12 PM GMT, Eliot Courtney wrote:
> The current code hands out buffers that go all the way up to and
> including `rx - 1`, but we need to maintain an empty slot to prevent the
> ring buffer from wrapping around into having 'tx =3D=3D rx', which means
> empty.
>
> Also add more rigorous no-panic proofs.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 33 +++++++++++++++++++--------------
>  1 file changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 09c28eeb6f12..aa8758fc7723 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -227,21 +227,26 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>          // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ_=
NUM_PAGES`.
>          let (before_tx, after_tx) =3D gsp_mem.cpuq.msgq.data.split_at_mu=
t(tx);
> =20
> -        if rx <=3D tx {
> -            // The area from `tx` up to the end of the ring, and from th=
e beginning of the ring up
> -            // to `rx`, minus one unit, belongs to the driver.
> -            if rx =3D=3D 0 {
> -                let last =3D after_tx.len() - 1;
> -                (&mut after_tx[..last], &mut before_tx[0..0])
> -            } else {
> -                (after_tx, &mut before_tx[..rx])
> -            }
> +        // The area starting at `tx` and ending at `rx - 2` modulo MSGQ_=
NUM_PAGES, inclusive,
> +        // belongs to the driver for writing.
> +        if rx =3D=3D 0 {
> +            // Since `rx` is zero, leave an empty slot at end of the buf=
fer.
> +            let last =3D after_tx.len() - 1;
> +            (&mut after_tx[..last], &mut before_tx[0..0])

Does the address actually matter? Otherwise I would find `&mut []` easier t=
o
understand than an empty indexing.

> +        } else if rx > tx {
> +            // The area is contiguous and we leave an empty slot before =
`rx`.
> +            // PANIC:
> +            // - The index `rx - tx - 1` is non-negative because `rx > t=
x` in this branch.
> +            // - The index does not exceed `after_tx.len()` (which is `M=
SGQ_NUM_PAGES - tx`)
> +            //   because `rx < MSGQ_NUM_PAGES` by the `gsp_read_ptr` inv=
ariant.
> +            (&mut after_tx[..(rx - tx - 1)], &mut before_tx[0..0])
>          } else {
> -            // The area from `tx` to `rx`, minus one unit, belongs to th=
e driver.
> -            //
> -            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_rea=
d_ptr`, `rx` and `tx` are
> -            // `<=3D MSGQ_NUM_PAGES`, and the test above ensured that `r=
x > tx`.
> -            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
> +            // The area is discontiguous and we leave an empty slot befo=
re `rx`.
> +            // PANIC:
> +            // - The index `rx - 1` is non-negative because `rx !=3D 0` =
in this branch.
> +            // - The index does not exceed `before_tx.len()` (which equa=
ls `tx`) because
> +            //   `rx <=3D tx` in this branch.
> +            (after_tx, &mut before_tx[..(rx - 1)])

If this is written with get_disjoint_mut, the indices would be so much easi=
er to
understand... To bad that that API is only available from 1.86 onwards.

Best,
Gary

>          }
>      }
> =20

