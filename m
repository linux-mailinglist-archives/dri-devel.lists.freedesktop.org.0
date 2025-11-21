Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ECEC7A5A7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4A810E8AB;
	Fri, 21 Nov 2025 15:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="loyieWT1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B996C10E8A5;
 Fri, 21 Nov 2025 15:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BXYchRipulNWFXNqiFCTqqC14mNziH8D3s2usrCVkEAJy+Afx3gqJjUdXk5ekVCNddfV2s84aUh3hXUG4Wi6ItG8FWAZUyocjxg7ZOPeBdpwOqKo4b3uxEA2yZl52YQebfSTZQVzcpzNbakdywwAyAyS5V2CpCNAiZ+TITz2YpUYQj+hgiQyFvMaiSkTx9XBIPPDi2Q2ZQqOtuYxXh1pXHVYvw2ywOg8hFrXJRHiErvo/YxiHHeVz/qZQAwHSNIKCQJ62K6XUjX0UroNpaIteX2j3qnLTXUbbrYuiTrPvSyKRlJ+2kty+V2bdOmMeY/PqJTN/aGfzW9Fcf7mWcb3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UBHwZusQLA8P8z2tfIJhYmJJ8Tt7CBAXTLrG9JtP/0=;
 b=ML/iPCur5ajiCC51/79ntoW8zYW9SWHphgy0Fphi9Zk/H3e6IMMa4VVYiKuRGcaB6Och979maAROrRPxVUy4CkrD5WHQXA0Q0/Obu7jVXd2EzdmhkzIzBpx6VRYJO1V1BNEZ4UYcnjvQnA7LzcS3wla+1as9BoLE9r/wQuYVuZg5gpUt60dona19xOZjBgqIMG0uMSQj7TqfQyjJqdjwpFqSazxf/ncc7yZeuLXWm0BvrYh479wg6qy9sxd11mMi4h9qu65ehRLKfoXXhRXug/24K6C4qveoX7feiMfhZ8qhDPZGUjP8ht14GesR7L+XG0VQZfUt1grnQLTGMl2JAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+UBHwZusQLA8P8z2tfIJhYmJJ8Tt7CBAXTLrG9JtP/0=;
 b=loyieWT1AkkgpNKPByHTwnux68xw7WWcgzg0oj+OI2O4Y42n/9yLYJ3rTHkaA5UxBjfynEQmV7cRR0iGLjSplcyY2P5CbFnvBYAj31OW6r3kims+tSo/C4cfybrkzSALI8ls4iaahKO3Of86TrhPmhCJI+tWO5JvJzZXJNbDGknirNXXL4UBVhUUEh9RtdTD6SRawR+T8NtT3YFCmK+Lm+2YSppxGLncDWdo9Cbjz4imzuYGI55MqXzw6bLQDO48LMovxQB+Mbg2DdFnm5jw0eta7nnY0YpMsxl2Dqd0lr9k8FnxwGEwwwvJu3hMKX69aEdM5Y8hvIFFVOdIiCjHPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 15:00:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 15:00:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 22 Nov 2025 00:00:12 +0900
Subject: [PATCH 1/4] gpu: nova-core: bindings: Add missing explicit padding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-nova-fixes-v1-1-a91eafeed7b5@nvidia.com>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
In-Reply-To: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OS3P286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f4::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d2dead9-a631-4eec-228a-08de290eb29e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTk0cFBxVTdlcUMvb2Jody9FYU4rbGxJbnN5OVMzRnIwTDFQeXZVVEJ2cS9i?=
 =?utf-8?B?TzFXUmNNVEM2d3NEdFNIekNUZ0NndnpmeFVhcTVBYmlOZWFCbFdvbGlHaXN1?=
 =?utf-8?B?RU5mQlBRekMzVXVDMFZlMzhFV3RYOG1jZkxKSTJKSTJIYllqcjE5YUdzSU5N?=
 =?utf-8?B?NUtDT3JDdjd2WnZDZndWbjJyV0M4VnE5dFBKaGNWU0k1M2R3YitZa2hzSGw4?=
 =?utf-8?B?YVVEL0NCVlNLYVM0OUdWNVdtUmRmU3Bnc01raUxReDMwRVQ4N25UYnVrRUZE?=
 =?utf-8?B?R1I0cGo5U2ZUYWFxK1YwMWxjT3Avd2RkaGY5SS9mL1lXUFhmZTR1d3hON0d1?=
 =?utf-8?B?VW1KM2o5NE5OUTBEY3AraHJtZG4yZDdDbVlQMklCNkJSaWJjM3lCOFVaaHg4?=
 =?utf-8?B?enYyeml2Z1BOZHhUcUVhc2t4OURpR1FkR3NOdVhlbmhQNGRqaklnejVoN2JI?=
 =?utf-8?B?YlNGS3F5K0hpUnhNUGhydTZ5WlJ1Ym1NVi9rRWdZdXp4a3ZYRzJUTXBld1pS?=
 =?utf-8?B?U3AvWDNhTFZSNDNDZ2hYT0x6Mi94S1p5bjJEWE5TS3JEVEhWb1lrZ3ZTaGxx?=
 =?utf-8?B?aU5LWXVhWWZzV1llM3VEa3djQWQrK1hqVVVjZmFvcmZ6WEcwRlhqM0RRRm1n?=
 =?utf-8?B?ejJBSEdsUkpQWDhaaFBJQUpOQ21qQUtVWUhNK3ZlQ25GZ3hLR1hCdUF2RTFX?=
 =?utf-8?B?V2F5Q3FXN3ZlaEthYjdNdy9PN01zNjZ1WTFyeXpFNmhSOWtQRndwRVMxb0JD?=
 =?utf-8?B?SVlsVG5uWVI2VDNwbUxGNlJDWDAzZ2tPTFArRzEwbDZ5RzBRUE9ITUwzT0J2?=
 =?utf-8?B?SU1ZSm1KemIxdDhiQ2M4L3dWS05QNDA2ZitOa3pIRU1HdlQ3STE5N09GdDhF?=
 =?utf-8?B?K1dvNnBPU3htUTMxR2dTb0Jwa1l2QmlOQmMyN2JJV3J5TjdzakFmZTN5ay8y?=
 =?utf-8?B?WnVmWEJaZU9HVDlyNEFQcXE5M2k3Y3grWk1Ec0RyamRYZEVYaC82bVgvK2Vl?=
 =?utf-8?B?ZitZVmRNMGlRdlFud2JyUzFHSlArTzJhZmRoeEVuL1FmQnV5ZGloZ2VFcVBO?=
 =?utf-8?B?VlozU2duRHBtdW92eStOa2FqYU5SRkZHd1dTanBPMTNuZXJhTXgvUkN4WmQw?=
 =?utf-8?B?M0ZHRm9qV0FXakd2VnBSckZvd3BEM0I5YVNXNEpCNmF3SFBuNVo0OVdmZVpP?=
 =?utf-8?B?MU9oV0d0K1RVK25NM2hLdmh5RTRyZkNzbTZkd0tlMnU2SnZhUVZNbk52dzlw?=
 =?utf-8?B?blIyZy9rZkQyRUJ0SnM2eG83cm9tdnFQWCtvcjUzV0JOancvZm1kUDZMNFFz?=
 =?utf-8?B?djlialE5RFhnbDNmRFlOZTFXVXJJRERMU1R5SnY2RXNBUnhxR1Rod25ZTVRn?=
 =?utf-8?B?MnFGckdzaFFBUDN3Um9jdDgzQnVKaWlUT1F4WFovZmhFbGNxYjlZbndVZkpE?=
 =?utf-8?B?cWxCNUxIUzdEbDYxdHY3NFhFWXhhNjNkbmthNjR3S3pMcFRrUC9aRnF6TUZC?=
 =?utf-8?B?QW9mdUlBSVFTWFRockxMcXFIcmd0Ny9RWm4rQ2NCcUtqUTc2L0VCUWRjenJZ?=
 =?utf-8?B?MFlwajIvMVhVdkRnVUd1ak9MUVc4cGZMRThUaXNaTENxUGVSQVl6dzFkREdO?=
 =?utf-8?B?V0pwSm4weGZKNysrbzVBeExFa1dOTFFBalQ4a21PczZQaTQvMG5ORUhpN0dU?=
 =?utf-8?B?Ry9lYlBPcHBYMC8rajZQYjFlMkpGd05LYTdtSU1FSXB0enorQ3ZPY1dsRDRr?=
 =?utf-8?B?VDNLb3VRSmVMVUgwMnFPWEVNYXZTK2FzUkpoM0VHWFF3UjdTR0oyUzVrRG5i?=
 =?utf-8?B?N0VFcEN3UUNHVTRyR1haaTdmeXpsaUN1Yk9DWGtqMUxhdllyY3kzZlc0TDRK?=
 =?utf-8?B?QjZsWFptbUVncDByRmJhNGlManI1elBYQ2N3U053bDVuQ3d1Y0ZwUm9QU0ZQ?=
 =?utf-8?B?VThzTnF4NEI0T2FwL0lWWm5HaUJGVTdXTW43WHVwaWYwNlRoRHI5bmFCTWFh?=
 =?utf-8?B?U205Tm03TFVybU81eStESlkxZ2xWNzBMZmJLMnR2MStEVm8yL0R1Sy94Wktz?=
 =?utf-8?Q?spHdKZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0FEU2tIaThRQi9kTmo0cFQrNFF0WFZTMUFFS3BNaDZvL1p4cXMzbXpES0hG?=
 =?utf-8?B?cFdoQTJjb1FLbEJqUFpXK1BxTEtLdnE4NGZ0TjB6RitBUFlMSnNRd2hjUFVX?=
 =?utf-8?B?Zlo1Q1d2VyttWmxVdkpKYm52WHNLQlZualpLTjcwNi9leVYrWHRUdEVMdktV?=
 =?utf-8?B?Ynl2T0dhMzNMYUYrQk9WNTc4eEVFcnhIZFZZUzg3SC9PbDNOZGJ6dXdJRlR5?=
 =?utf-8?B?VExEOGhXTUh3b0NQcEIzd2d3MmlIbUtMaTVwN1dFRVBqSlFCd1lhZWxtNnZY?=
 =?utf-8?B?R1VyQksra2lxekFVejdkcUhnMkxjSFh2d3pDQTltSW1hZk01b0paeXJCREl6?=
 =?utf-8?B?eHcrVDdXNHJ1WERHWDBXUHM5b3p5eUhHOHJpdEQva0tiZjB5ZHVvdCtGVDlp?=
 =?utf-8?B?WDNzWUgycVBaMzlnUU1vdmZGK0NTeE9uTUk0QmdzZnF2SGlyK0ttcENVWFVX?=
 =?utf-8?B?dzZ2QmduOE1vdHF6aWpzV3dQMGdLVTgxZGEvV0JyRHkvOXk3Vnp5d2tCY0Rq?=
 =?utf-8?B?b2NYdEN1d0RlZWtHUS81Q2tibFp2T0VWYWJUcUF2Z01ZZ2hKNzdMV0VMby83?=
 =?utf-8?B?a1Azem41eUFIRkNCczl1djlvTWxxL2tNbVNPQWdhbkxtVEZKRnU1d2lxN2NS?=
 =?utf-8?B?Z25keVpodG5nbWlQRGxla3JCTGVuYzNnaDdEbkZDcjZUSnhjQ2VwT21VcGJ3?=
 =?utf-8?B?MmZhekl4bG1qNnBOZGhML0lwRmlLUmFqblB1UDZqanh6cGtnNWpZbWJESllG?=
 =?utf-8?B?bFNTQnp1Q0NySzIwTE8vL1FCajBFNnR0RjZmYThYRW55bzdIVFZsbVFxNHJM?=
 =?utf-8?B?Q2J3dmphOHhoaUNVTi8wV1ZVaWRWQ0MyK1IrcUlXT2ZxQkx5NUtlNm1zSXo0?=
 =?utf-8?B?SW5VRi83VW5UclUxNzN0OXJpMHVkeXJPVG9LMVpaY2JGT1U4LzJYeW01bFc2?=
 =?utf-8?B?S1k4Nm1xUDAyZlNiWk5Gd2dNellGdWEycEVVenFYcHRIYStlMnl1Wk40aFRS?=
 =?utf-8?B?TUVVTExBUnNJTlVHSnk5MlZaUm9TY3ZiVjVwRHpOWFQ3MmhTaXdkV2p0UzFL?=
 =?utf-8?B?SXJGYmZUWkpsMzBMWHJHOXY5cmI1VDVNWnZPanFPVytva3FYS0xIMVc2ZlFH?=
 =?utf-8?B?ZDhkWlJuNjFPV3pLZjExbW41WnpZNGQzTWhRWTdSYzJqUmZuOEVzZElHWWpX?=
 =?utf-8?B?VUxPTXg5QXlLV1dTREY3VnNxT29pdGVXTUxrV1B3Uzh4VXY5WjBSZktWQ1hK?=
 =?utf-8?B?WWJTTnZxc05lazdWRyt6bzU1ZlczSGtITkcwOVRXTnFCRWdGbG8xQUxySWty?=
 =?utf-8?B?dFRORCtIRnEyanU0dDF6cnNNbDlHR0psQmhxenVLc3pmYlNnZWhrb3VBNWpu?=
 =?utf-8?B?N0ozc3I1QnBlVnVsa2hXVGtvSU1RRHIxNDFpb2dqVFE2NTJGaG9mYjNqbXd2?=
 =?utf-8?B?MHJxU1lTT0l6R2QzNTlYTDJlak5wQ0EvVWMvUkdvbXhhb0Q5cUlZZHZaK0hP?=
 =?utf-8?B?ZFhTSkJHeXFJMXBuR0RwT0pxb1hmRWtuekNscWhzeFZXWU9ZU2s0UVhDazBX?=
 =?utf-8?B?enA2Vi9ONCtJTjZOV0tRTWwwNXMwT1NMS2RRWHordm8xYzd0aHVhbjQzZ1F1?=
 =?utf-8?B?d2ZHcEtXZHFxVmlVSk9HMVQwV2NpQ240eGFScnY3SlM3MkdZZUkvMnRDaWYw?=
 =?utf-8?B?dlFnQWtIaEQzeXBUeUVGaVRKc0Q4aHNjSFFtR3d6WGVvekNtVmRWUVovcU5o?=
 =?utf-8?B?RkVRMStlWGs4bk9lWGFGYXV1c2Y5c0YwMkNyeHJ6RXZia0hRYmNuc3FuNkMv?=
 =?utf-8?B?WEhSSFRxRkd5YndoTkdiak5RVVVqSTVoaXZJQjh1VWpFajY2amdDQzNDb0tZ?=
 =?utf-8?B?V0U3Y2FDMmV4eWRPMEJaVW4vKy8rZ0Q3ZElEUmE2QmkvaEVHcGdLK0NUSHNG?=
 =?utf-8?B?YU1WUGZHVCs3QXFmTWo4OUNnZzhPa2g5cDcyU2syN3R0N3NKc1p3NXFHRWJK?=
 =?utf-8?B?MGN6MFkrQzc2U0VINGFKdUNyLzZTUnd3d0hYanRkRmk0ZTBXeGM4N2dsb3Bi?=
 =?utf-8?B?ZVplYk1rZjZIanVBeVk1RXFVd0dLOGtRckRtV29seFB6U25ZK0RBeTZyR3hI?=
 =?utf-8?B?K29TelYxUzY5dGw5d0t1QWNtUFRxMHA4QjVvcjJWOGgrU1VVeXdqYmwyc3Ev?=
 =?utf-8?Q?5bXN4vuTijFrAY4Qp9W2Eksyh3aPHsOgmshI26Cx2Q9Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d2dead9-a631-4eec-228a-08de290eb29e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:00:23.9051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWNOpQET/1iq1pNTTDc7neuOS4hKZ/y+7ut/1Ofl4841JYQc3yEn9ekyQ0SlYrX9jvro4VjDy54ugJAO5xempw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
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

Explicit padding is needed in order to avoid uninitialized bytes and
safely implement `AsBytes`. The `--explicit-padding` of bindgen was
omitted by mistake when these bindings were generated.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 5bcfbcd1ad22..5f0569dcc4a0 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -325,6 +325,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub totalVFs: u32_,
     pub firstVfOffset: u32_,
     pub vfFeatureMask: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
     pub FirstVFBar0Address: u64_,
     pub FirstVFBar1Address: u64_,
     pub FirstVFBar2Address: u64_,
@@ -340,6 +341,7 @@ pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
     pub bClientRmAllocatedCtxBuffer: u8_,
     pub bNonPowerOf2ChannelCountSupported: u8_,
     pub bVfResizableBAR1Supported: u8_,
+    pub __bindgen_padding_1: [u8; 7usize],
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
@@ -347,11 +349,13 @@ pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
     pub BoardID: u32_,
     pub chipSKU: [ffi::c_char; 9usize],
     pub chipSKUMod: [ffi::c_char; 5usize],
+    pub __bindgen_padding_0: [u8; 2usize],
     pub skuConfigVersion: u32_,
     pub project: [ffi::c_char; 5usize],
     pub projectSKU: [ffi::c_char; 5usize],
     pub CDP: [ffi::c_char; 6usize],
     pub projectSKUMod: [ffi::c_char; 2usize],
+    pub __bindgen_padding_1: [u8; 2usize],
     pub businessCycle: u32_,
 }
 pub type NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG = [u8_; 17usize];
@@ -371,6 +375,7 @@ pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
 #[derive(Debug, Default, Copy, Clone)]
 pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
     pub numFBRegions: u32_,
+    pub __bindgen_padding_0: [u8; 4usize],
     pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
 }
 #[repr(C)]
@@ -495,13 +500,16 @@ pub struct FW_WPR_LAYOUT_OFFSET {
 #[derive(Debug, Copy, Clone)]
 pub struct GspStaticConfigInfo_t {
     pub grCapsBits: [u8_; 23usize],
+    pub __bindgen_padding_0: u8,
     pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
     pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
+    pub __bindgen_padding_1: [u8; 4usize],
     pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
     pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
     pub sriovMaxGfid: u32_,
     pub engineCaps: [u32_; 3usize],
     pub poisonFuseEnabled: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
     pub fb_length: u64_,
     pub fbio_mask: u64_,
     pub fb_bus_width: u32_,
@@ -527,16 +535,20 @@ pub struct GspStaticConfigInfo_t {
     pub bIsMigSupported: u8_,
     pub RTD3GC6TotalBoardPower: u16_,
     pub RTD3GC6PerstDelay: u16_,
+    pub __bindgen_padding_3: [u8; 2usize],
     pub bar1PdeBase: u64_,
     pub bar2PdeBase: u64_,
     pub bVbiosValid: u8_,
+    pub __bindgen_padding_4: [u8; 3usize],
     pub vbiosSubVendor: u32_,
     pub vbiosSubDevice: u32_,
     pub bPageRetirementSupported: u8_,
     pub bSplitVasBetweenServerClientRm: u8_,
     pub bClRootportNeedsNosnoopWAR: u8_,
+    pub __bindgen_padding_5: u8,
     pub displaylessMaxHeads: VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS,
     pub displaylessMaxResolution: VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS,
+    pub __bindgen_padding_6: [u8; 4usize],
     pub displaylessMaxPixels: u64_,
     pub hInternalClient: u32_,
     pub hInternalDevice: u32_,

-- 
2.51.2

