Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646AB56432
	for <lists+dri-devel@lfdr.de>; Sun, 14 Sep 2025 03:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEAC10E218;
	Sun, 14 Sep 2025 01:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T67207YJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B667210E216;
 Sun, 14 Sep 2025 01:49:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4lizrG+CywqNbtk4jijafPVFTq50doNePDq65Gscb3IDsZLvfX6TwBcIWuSVWZ8p9EH1+oUQ9lrJeG3YXc/rTJk+XMcC1/TVWxl6HPhO11I1gkAcDIkpnK7UAZPU+KulNF/QyHSdsfAzsSJhBb6pzMLu/bjRPFFB8JB9nIylWGoExczZwxwjcbwbmA5/7W47xOhUPJAsf7n1ta0bmXDSqlycWVoXVxOt/h4juvH1Gzw29+22hW9HUfFn/sZt0nZ0pUlO7Eajb4OF3+ojV7Q96Bye0pwQepyIPZt+VSBPjEKoh69xTDvVevXLCsKgV7YvdNLLoUvNyB3KcmxwJTW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYR4BB+/3Tlm1ajElahxB2VbPZe/32IrMRlzXxXKk/0=;
 b=eQ77omBe8PZxe9rzwuwNN317ozZAmTV4SuqbvrKjw1y5KbEK366DLBDSDzVeI4pijy1I26SNyTrE8ZBESmcOgUdyPW3UJnNNMcNy+saq7qegZgfWKrowsojLtM2gGvT7OMCuBQ6T/Xkb8jAKjMYc7mjbGlYtJCTIFgXLmJztzlYZ4vABoKqWEDOwucmpqtobeaVsfN8fHvlOwV+MXAqp3kHxnxW8+BvUM+gSpw2htx56oFaa+p6bXUGzzuzb79go8dxOT8Gy5c4UTznqfJvL6ZRfXP+1Fw6Z9LwvRE6GbKOy9Nb9hZbyxro0TDa6q2SuR6vmoennusr69oUF42/3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYR4BB+/3Tlm1ajElahxB2VbPZe/32IrMRlzXxXKk/0=;
 b=T67207YJE5JBfVBntwFxeONZRp4AGl/uETrjbWjN9c5IQD8HDEwuOTcV0FMMKmpaEyQJK/aaoG4QDJC5D21Zwa0hBHXHdPhnzXH7rXZhK5yU1Sw/Wg0aDkhaYEYeRAzte7fbjUAZBnZRPG5jmw1f+oehurf+NBRfVQ7gHOxGtjOJ0KNkc+WcfI1/17FASbfqEuarhCId9tMtM2nFwDXp5+5AfwIfQpd7XzG4PRuAx/NOfrFI+ePVMcp1OrAGAceOJ+1ySwi2Y3wwdGMU/rUuRfvle62GtYDg5GzV0LgcS3+MGG6SeHsNvUIOIgw/G0Nm9I3rB21XXZdz8xT6wn9hqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sun, 14 Sep
 2025 01:49:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sun, 14 Sep 2025
 01:49:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 10:49:40 +0900
Message-Id: <DCS59IDCIKH1.2M3I6H0NVD0RG@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
 <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
 <b1aea815-68b4-4d6c-9e12-3a949ee290c6@nvidia.com>
 <20250913220625.GA1564550@joelbox2>
In-Reply-To: <20250913220625.GA1564550@joelbox2>
X-ClientProxiedBy: TYCP286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: c2853f18-1be5-4f65-0723-08ddf330fa21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1BXY3BjNXdiUGMrWHhmUW1ER1ltY1VlMjNWODl5THhNczRobkwxaXZudmly?=
 =?utf-8?B?RXlLbHdqMlVDdXM2Ri9TTHJaeXEzbFluQ2Zra3VtUmwzY0F4SlE3UTQ3RUhX?=
 =?utf-8?B?aTJvNWFFQkpINHFiYmVlclJIazEzQ2JIbytVSDVUdllqcmpqZ1d0UVlPWS9k?=
 =?utf-8?B?aVFKWWp3d0RDcnNzTGNFNVo0UDJ2TjliR2JmeUlIUjhPa2VNc2w2T3ZqMTJq?=
 =?utf-8?B?M3ZteFJ0dUNrTHFCNUlZaWpnQmMrNktZVk1HNU81K3Q2MG81bUpIZCtSRnlv?=
 =?utf-8?B?M1o2aDNCc09xb0ZucFRaUlVNUDhKZGdteWt1Z2ZLNEEzVVUyVnlOTXVQRGFs?=
 =?utf-8?B?cGlJZmdQbG95T3EvbXBwQittZnBlZkE2TFZjZVpJMmNYeGpDSlZQdlBxSW1S?=
 =?utf-8?B?bHlaL01SYkFFenhhMzZPakFSdnRvVUUybkQ4R09wd3dFdk5oSisxTGtOY2Ux?=
 =?utf-8?B?VzJTeUM1VDBGZkIxY3BmVnNmbm5abmVZall0ejlvWjJDN0xTRGNpQTI1UDdZ?=
 =?utf-8?B?eVBudEF3SFdKeFF2bnd3SnJLaWE2N3lqSWIwSkZIQThmTmR4VWhjR1MwQVZn?=
 =?utf-8?B?NE83SzB3b0FhS3VMMmhuQ2swS0JpM25nSWhVWDZWd2lkd0hZbkk4QUgxYmpO?=
 =?utf-8?B?N2tSRFB1cWdRck5JdFBHTDlLUlRsSEYyZHZ0OXFpWlNCNTZtdXQ0NWJSL1Fq?=
 =?utf-8?B?Zm5ibUJ3OVdsZUcxV05Rd1EwWGxGbGlpTlRQTWJyTUNyeTlnOVNjSEJVTlFu?=
 =?utf-8?B?bTFyMHZneWZ1YVcwNXU5ZU95aXRpRlFkWUdTUlduMWgydXRLRks3cUs5dHpn?=
 =?utf-8?B?VTFWNkNOMEdIczZzRkE1M3ZaOUdzM1hsdjR3YVM4MitFYjFUb3VQUmN6R1Br?=
 =?utf-8?B?cTh5Qi9HLzVGUHNoWFF6Y0FDY2xyVVc3d0hLOW9mMFp6NXVMQ0orNnk5bmpm?=
 =?utf-8?B?UTVuOXRYVnA5WVJOMHR2OWtIVUN2eTdhNUN3MFcwODBwcHExenNiVmRHaGhr?=
 =?utf-8?B?SUk5NkwvY2dJZGZVMDRpNm9KVmxNN245TDgyMnJyOW1xVmR0b0U5djRJZ1R3?=
 =?utf-8?B?UWd1SmxtS0svRnRuVytkRzR1dU8yUFNrWWhseTA3ZVRjT3kzREVEYklMWWNl?=
 =?utf-8?B?ZXF5QUo4YWRLakcxV2F5c1VIM0NQWG9tTmtVLzBhZ21UTnVOWVlSVXprRGwz?=
 =?utf-8?B?QzB3S3lveklvNjdTSkUreFpwTWF4aFNvSkpNUFExZzVlQjJPUFVYd3hYSXlE?=
 =?utf-8?B?bExwbTVnV09MakdwQS82QTZMZjZNaGJ2ekNsRW5pZXluekJVUlh1b1RleExr?=
 =?utf-8?B?WE1LdnNJR3lQQWdxanUyRUZCRGNQTHFRamFpVlpzWjUvMWhGbkNqTVVkMXhE?=
 =?utf-8?B?bFgvcTc3ZnQxWEFTa1BTcDUvbVRKZVZ6cEw0Z2RSc3FTZE1SelZqVXNtZDlJ?=
 =?utf-8?B?UHE3SjJrU0ZLS2VMUEZBZVQ3a1ZmZnI5UU04eDlaMW1iZUpxRTRCQ0ZFMmQv?=
 =?utf-8?B?cUEvcUtyUHZqQ09wZkR0MWNjbC90U1VhQ1d1cExUdmtVaFFST043VnpNOFox?=
 =?utf-8?B?UG9QLzZWOGdNVmJGREIyVWRTNDlBaVJ5cFFjMXlBcHFlclNXNUUwVkl1eGN6?=
 =?utf-8?B?U2tTeWpzK1d4dGFuRWtzMGlQbnY3Snl5ZVh5MkhhcTVXTGxyZjdUMWxVem1W?=
 =?utf-8?B?cHQwdTFuVnBxMUhMNUJXYjU2eWg1SzhiV2pyTzhUZ3VxWVVsdXBxVWZsVTRs?=
 =?utf-8?B?STJtbHNJdjNGNHYrZExFUGRKaUN6UVVWcjVvVXVwRHkwTHcxWnBFMEYyeDdm?=
 =?utf-8?B?d3pjRTVQV1EyZXJoYWtVZ0ZBci9EK1B0UU1FNkMzM0ZkVzcvQXFleUtRcEdt?=
 =?utf-8?B?QWhTN3dnT0dtaU12bWF0WGpGbFpBZVNCQnN5SmZoNUxFM0hPYWYrNitsdEw5?=
 =?utf-8?Q?B/9L2sIaTvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2hGdTRlR1dOd01lblVuZllBYVdPZkJwNVFmcmd0dGxZeVRFMGhnQmFXOGZx?=
 =?utf-8?B?cEdrZ2dLNmViMFloSzFGK0RycUVJZ1NZQU5jclowSlQwWDhZRnViSkNoV3A2?=
 =?utf-8?B?alFaYVZwS210akVkQmsxVDhwaHNYUE1WNWpXVSsrNFFrN1dvNzlBcUM4YURB?=
 =?utf-8?B?Q2MwV1dSKzMyTm91TmNYdWRjL3BRM01qZ3M5WGYzNFdLQUVZKzNNcG0rWE10?=
 =?utf-8?B?a3JTMkZ3bUZHQytWbzBzd0tZYW1GU2VrbEZrMkorNDB2OXlBRmd2SHVXL011?=
 =?utf-8?B?d0JKYnlMWUIzSGN1a0IvUExIWmF6UWVZbHFkQklhcGx0Ym5UeElnbCtRT2V4?=
 =?utf-8?B?aFptTEY5SmYzM0hDbnhiK21iNVJ1ZnpyUndCcGVqV055UElESzNrbzhYbUs5?=
 =?utf-8?B?WTg5eE4wY0hZVmlIMml3OVR0MXh2UEQvL1dEMW80c3AwK09VejY0eEpJV1dm?=
 =?utf-8?B?dlB2VHBBZkZyVjNWSFR5cUZYczZCb3huVHN1NDBwOEUvY0c1THFMYjN2ZzVk?=
 =?utf-8?B?YzNhajlXdXVpNEZndFkvWXRMWVdsbVFsQWFmWU9SUUJZL2RQb2xUS0JnaGgy?=
 =?utf-8?B?ZFJrcVVta3hIRHVZM2pVZjdXdGt1SUJPeVgvWFlqb3F0UEMrQ3JENklyanRl?=
 =?utf-8?B?bmp2czRva0ZJQ2lCYmZ2RTgvYW5QWCtiWmVJLzVKaVYvTElLS1c4UnlKSTVK?=
 =?utf-8?B?ZFBjSEJuQlVvVjQ4UGY1TmZuVSt1cmJsTXcrSFJkbGIveU5kVHNJQzEvbTg1?=
 =?utf-8?B?WFl4Q0luTVZIeXEzeDVyVndMdXByN1Z0T2M4KzdxQUR3UTZtRE9WNkMvSFFC?=
 =?utf-8?B?RDhpRFhZTkJhZFVTcHJBcEJTeVJoTEtmZUxkNzAxKzRJV2Z1ZGFCSktTRmo3?=
 =?utf-8?B?V0lvNDF0d1N1TGVkL3owMmhndTd3ZThCYUZtcFI2eVBCRXNhKzZ1NEVCRWlj?=
 =?utf-8?B?MkZScXFwSnY3SHdDNGdRS01HV2VVUUMyRnBLTC9HNUc4RHV4S2R3a2JBRjR5?=
 =?utf-8?B?Q3lBb1hFd0hMT1dWTllGK3g3RHcwUEhtS1Z1ZUMvdEkrOW9DclE2aXFJVmZn?=
 =?utf-8?B?cU9kT2FYNy9wT3g2WWFEM211dGhjTGJ6N29OcnN6RW5DbXUvQzZJWFMwY2dJ?=
 =?utf-8?B?TGRsSkgrUFRzVXZaV0R5MXl2Yzl5L1pjbTFyU054MENIQytqbUJ4amUyT3lM?=
 =?utf-8?B?OHNFcDFnT3N1ci9tNjJnSHhmUXJBOXl5bDJhZVJxcDRjUHVqQXNKcnpRRXZl?=
 =?utf-8?B?aVk3YTJqOGRCejhFTlY0TzBsYlhLcVpybG82a2dZVFZYamxBVXZ1UUlsUzdL?=
 =?utf-8?B?Y2FCOTZvRWNhblhnMXp6YXNTelMzcm5zb0llbGtBb2ZTRUlVbXZhenlSbWtF?=
 =?utf-8?B?MFZpOG5XWTlpb1R0SmRQZnR4cEZsVG9pazczVVpMY3VtcUlPbDI5dVJoa3dK?=
 =?utf-8?B?S0h6Mi9XRkNSOUJhM1U3clY3ZjYySmVab2p1OE9hMjMvdFZQakVKKzY2RERS?=
 =?utf-8?B?TjNnVERwL0g5OGdrTDZnWldTVDV0SWhKMWYzZXVTKzNLY0NJNWhzbldIUk8w?=
 =?utf-8?B?VE1BVUI1dEc2OFNTRmROcFR1VmM3ZTVBd1RiUTdtVlNIZWIxSkc2RHpaWFNs?=
 =?utf-8?B?RHJ3cURTaTlLYmt5ZGlhQkpXQklJSWs3NytYNUhCRXp2SWNhRW1vMGFRWDRX?=
 =?utf-8?B?NjdVUDVZaFBZMTM5bjUzL21ya3FDYm96T205aElQbmZseE4zZVlCc0xRWXVT?=
 =?utf-8?B?dndGbXZ4U1h3cnhXMVFtajhGb0NMc0ZOb1lVRWIxNzI0R3JMRFViRHNZandh?=
 =?utf-8?B?R2w3NGhKclExeWxpNWpjMDRUM0dZMks2eUE5ejRWVzd4TWN1UWo2TWpta2c5?=
 =?utf-8?B?TmVkVGplK2F2enI3eTdUaFZad3NqZFZ5c1ZmcnMzRWo1TUxERFBjb2Nqdkdq?=
 =?utf-8?B?blNzQjlHWmthK0JqZ0hTYTB0RkpjRkx5M2dNWTYxSDVyZ0wzRW5oS1krUHlF?=
 =?utf-8?B?R1ZnZEpUZzc3cVFSUTd3T1M5aTdUVTMxdnJHZnI0Nk8rUC8vQVdnY3FGeFo0?=
 =?utf-8?B?OHZ5R0RkS0NLaUR0Rkt5QmlLK0FYTStES0ZSSjgwSGxGZzAwS3daNHgyeDJJ?=
 =?utf-8?B?QUtQWC83M3ZVeFl3Q01EOEtqNVNLRkI1U2ZuOGJSaHRnVSsxUXA5RERNR0hC?=
 =?utf-8?Q?IljUxs/CJxroT8s04R0kUminYM2IuCSTTtWPbFOv1MRE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2853f18-1be5-4f65-0723-08ddf330fa21
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 01:49:44.3873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH72ay84yq4EvX8va4+moDnK3VVKZsVQK8ZchbQN9ciF4xRMd0Kj8+m2YGeHdgu5IoDQ9S/HaqzxNblkIYiZIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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

On Sun Sep 14, 2025 at 7:06 AM JST, Joel Fernandes wrote:
> On Sat, Sep 13, 2025 at 02:29:54PM -0700, John Hubbard wrote:
> [..]
>
>> >=20
>> > I would suggest taking a look at our website and the links there (like
>> > issue #2) -- what we are doing upstream Rust is documented.
>>=20
>> ...and my question was asked before reading through issue #2. So your
>> and Danilo's responses seem to be saying that there is already some
>> understanding that this is an area that could be improved.
>>=20
>> Good!
>>=20
>> I believe "issue #2" refers to this, right?
>>=20
>>    https://github.com/Rust-for-Linux/linux/issues/2
>>=20
>> That's going to take some time to figure out if it interects
>> what I was requesting, but I'll have a go at it.
>
> Indeed, kudos to rust-for-linux community for working on missing Rust
> features and on pinning itself.
>
>> >=20
>> > (Danilo gave you a direct link, but I mention it this way because
>> > there are a lot of things going on, and it is worth a look and perhaps
>> > you may find something interesting you could help with).
>> >=20
>> > > except to satisfy paranoia
>> >=20
>> > Using unsafe code everywhere (or introducing unsoundness or UB for
>> > convenience) would defeat much of the Rust for Linux exercise.
>> >=20
>>=20
>> Yes. It's only "paranoia" if the code is bug-free. So Rust itself
>> naturally will look "a little" paranoid, that's core to its mission. :)
>
> This seems to be taken out-of-context, I said "paranoia" mainly because I=
 am
> not sure if excessive use of pinning may tend to cause other problems. Th=
e
> "paranoia" is about over-usage of pinning. Personally, I don't prefer to =
pin
> stuff in my code until I absolutely need to, or when I start having needs=
 for
> pinning, like using spinlocks. Maybe I am wrong, but the way I learnt Rus=
t,
> data movement is baked into it. I am not yet confident pinning will not
> constraint Rust code gen -- but that could just be a part of my learning
> journey that I have to convince myself it is Ok to do so in advance of
> actually requiring it even if you simply hypothetically anticipate needin=
g it
> (as Danilo pointed out that in practice this is not an issue and I do ten=
d to
> agree with Miguel and Danilo because they are usually right :-D). I am
> researching counter examples :-)

You can look at the definition for `Pin` in [1], but it is so short we
can paste it here:

    #[repr(transparent)]
    #[derive(Copy, Clone)]
    pub struct Pin<Ptr> {
        pointer: Ptr,
    }

There isn't much getting in the way of optimized code generation - its
purpose is simply to constraint the acquisition of mutable references to
prevent moving the pointee out.

I started this patchset a little bit skeptical about the need to pin so
many things, but after seeing the recent additions to `pin_init` and
rewriting the code as Danilo suggested, it starteds to click. The
supposed restrictions are in practice avoided by embracing the concept
fully, and in the end I got that feeling (familiar when writing Rust) of
being guided towards the right design - a bit like playing bowling with
gutter guards.

Yes, that means redesigning and rebasing our code, but that's also the
cost of learning a new language.

And yes, things can still be a little bit rough around the edges, but
there is awareness and action taken to address these issues, at the
compiler level when relevant. This makes me confident for the future.

[1] https://doc.rust-lang.org/src/core/pin.rs.html#1094
